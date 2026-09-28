#include "cfuncs.h"
#include "log.h"
#include "input.h"
#include "online/host_options.h"
#include "online/net_handlers.h"
#include "security.h"
#include "updater.h"
#include "wallpush.h"

#include "decomp/Obj_CSkaterCareer.h"

#include "partymod-thps4/src/main.h"
#include "partymod-thps4/src/patch.h"

#include <windows.h>

#define CONFIG_FILE_NAME "better4.ini"

char executableDirectory[1024];
char configFile[1024];

// TODO (ellie): find somewhere else to put this
typedef int(__cdecl* CFunc_PrintStruct_t)(CStruct *, int);
static CFunc_PrintStruct_t CFunc_PrintStruct = (CFunc_PrintStruct_t)0x0041a4c0;

void initConfigFile() {
	GetModuleFileName(NULL, &executableDirectory, 1024);

	// find last slash
	char *exe = strrchr(executableDirectory, '\\');
	if (exe) {
		*(exe + 1) = '\0';
	}

	sprintf(configFile, "%s%s", executableDirectory, CONFIG_FILE_NAME);
}

void patchButtonsFont() {
	// Font name is always set to `ButtonsXbox` if the `buttons_font` flag is passed to `LoadFont`.
	// Patch JZ SHORT to JMP SHORT to skip this condition and always load `buttons_font` by name.
	patchByte(0x0046369f, 0xEB);
}

void patchQdirTxt() {
	// patch refs to vanilla `scripts\\qdir.txt` in LoadAllStartupQBFiles
	static char *better4_qdir_txt = "scripts\\better4\\qdir.txt";
	patchDWord(0x00511f74, better4_qdir_txt);
	patchDWord(0x00511f7e, better4_qdir_txt);
	patchDWord(0x005120a8, better4_qdir_txt);
}

void patchIykyk() {
	patchJmp((void*)0x0048224e, (void*)0x00482394);
	patchNop((void*)(0x0048224e + 5), 1);
}

void patchLevelLimit() {
	static uint8_t s_is_competition[NUM_LEVELS] = { 0 };

	// Mdl::Skate::Skate (0x004f9630)
	patchDWord(0x004f9870 + 1, sizeof(Obj_CSkaterCareer));
	// patchByte(0x004f99df + 1, NUM_LEVELS); // XXX (ellie): CGameRecords constructor; not needed? causes failure to save career

	// Obj::CSkaterCareer::ReadFromStructure (0x004dd6a0)
	patchDWord(0x004dd6f7 + 2, offsetof(Obj_CSkaterCareer, level_flags));
	patchDWord(0x004dd6ff + 2, offsetof(Obj_CSkaterCareer, goal_flags) - offsetof(Obj_CSkaterCareer, level_flags));
	patchDWord(0x004dd766 + 2, offsetof(Obj_CSkaterCareer, global_flags));
	patchDWord(0x004dd7b0 + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dd7b6 + 3, offsetof(Obj_CSkaterCareer, gap_checklist));
	patchDWord(0x004dd8e7 + 3, offsetof(Obj_CSkaterCareer, level_visited));

	// Obj::CSkaterCareer::WriteIntoStructure (0x004dcbc0)
	patchDWord(0x004dce11 + 2, offsetof(Obj_CSkaterCareer, level_flags));
	patchDWord(0x004dcf41 + 2, offsetof(Obj_CSkaterCareer, global_flags));
	patchDWord(0x004dd039 + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dd043 + 3, offsetof(Obj_CSkaterCareer, gap_checklist));
	patchDWord(0x004dd5ae + 3, offsetof(Obj_CSkaterCareer, level_visited));

	// Obj::CSkaterCareer::GetGapChecklist (0x004dc690)
	patchDWord(0x004dc699 + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dc69f + 3, offsetof(Obj_CSkaterCareer, gap_checklist));

	// Obj::CSkaterCareer::JustGotFlag (0x004dcb80)
	patchDWord(0x004dcb89 + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dcb96 + 3, offsetof(Obj_CSkaterCareer, start_level_flags));
	patchDWord(0x004dcba0 + 3, offsetof(Obj_CSkaterCareer, level_flags));

	// Obj::CSkaterCareer::GetFlag (0x004dcb40)
	patchDWord(0x004dcb4b + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dcb68 + 3, offsetof(Obj_CSkaterCareer, level_flags));

	// Obj::CSkaterCareer::UnSetFlag (0x004dcaf0)
	patchDWord(0x004dcafd + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dcb12 + 3, offsetof(Obj_CSkaterCareer, level_flags));
	patchDWord(0x004dcb28 + 3, offsetof(Obj_CSkaterCareer, start_level_flags));
	patchDWord(0x004dcb32 + 3, offsetof(Obj_CSkaterCareer, start_level_flags));

	// Obj::CSkaterCareer::SetFlag (0x004dcab0)
	patchDWord(0x004dcabb + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dcad2 + 3, offsetof(Obj_CSkaterCareer, level_flags));

	// Obj::CSkaterCareer::GetGlobalFlag (0x004dca80)
	patchDWord(0x004dca96 + 3, offsetof(Obj_CSkaterCareer, global_flags));

	// Obj::CSkaterCareer::UnSetGlobalFlag (0x004dca50)
	patchDWord(0x004dca5e + 3, offsetof(Obj_CSkaterCareer, global_flags));

	// Obj::CSkaterCareer::SetGlobalFlag (0x004dca20)
	patchDWord(0x004dca2e + 3, offsetof(Obj_CSkaterCareer, global_flags));

	// Obj::CSkaterCareer::CountMedals (0x004dc9a0)
	patchDWord(0x004dc9ab + 2, &s_is_competition);
	patchDWord(0x004dc9bc + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchByte(0x004dca05 + 2, NUM_LEVELS);

	// Obj::CSkaterCareer::CountTotalGoalsCompleted (0x004dc930)
	patchDWord(0x004dc93b + 2, &s_is_competition);
	patchDWord(0x004dc94c + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchByte(0x004dc98e + 2, NUM_LEVELS);

	// Obj::CSkaterCareer::CountGoalsCompleted (0x004dc8e9)
	patchDWord(0x004dc8e9 + 2, offsetof(Obj_CSkaterCareer, current_level));

	// Obj::CSkaterCareer::JustGotGoal (0x004dc8a0)
	patchDWord(0x004dc8a9 + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dc8b6 + 3, offsetof(Obj_CSkaterCareer, start_goal_flags));

	// Obj::CSkaterCareer::GetGoal (0x004dc860)
	patchDWord(0x004dc86b + 2, offsetof(Obj_CSkaterCareer, current_level));

	// Obj::CSkaterCareer::UnSetGoal (0x004dc810)
	patchDWord(0x004dc81d + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dc845 + 3, offsetof(Obj_CSkaterCareer, start_goal_flags));
	patchDWord(0x004dc84f + 3, offsetof(Obj_CSkaterCareer, start_goal_flags));

	// Obj::CSkaterCareer::SetGoal (0x004dc7d0)
	patchDWord(0x004dc7db + 2, offsetof(Obj_CSkaterCareer, current_level));

	// Obj::CSkaterCareer::HasVisitedLevel (inlined, only called by GotAllGaps)
	// Obj::CSkaterCareer::MarkLevelVisited (inlined, only called by StartLevel)

	// Obj::CSkaterCareer::GetLevel (0x004dc7c0)
	patchDWord(0x004dc7c0 + 2, offsetof(Obj_CSkaterCareer, current_level));

	// Obj::CSkaterCareer::StartLevel (0x004dc760)
	patchDWord(0x004dc769 + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dc771 + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dc777 + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dc782 + 3, offsetof(Obj_CSkaterCareer, level_visited));
	patchDWord(0x004dc78d + 2, offsetof(Obj_CSkaterCareer, start_goal_flags));
	patchDWord(0x004dc796 + 2, offsetof(Obj_CSkaterCareer, start_goal_flags) + 4);
	patchDWord(0x004dc79c + 2, offsetof(Obj_CSkaterCareer, level_flags));
	patchDWord(0x004dc7a2 + 2, offsetof(Obj_CSkaterCareer, start_level_flags));
	patchDWord(0x004dc7a8 + 2, offsetof(Obj_CSkaterCareer, level_flags) + 4);
	patchDWord(0x004dc7ae + 2, offsetof(Obj_CSkaterCareer, start_level_flags) + 4);

	// Obj::CSkaterCareer::GotAllGaps (0x004dc6b0)
	patchDWord(0x004dc6b6 + 3, offsetof(Obj_CSkaterCareer, level_visited));
	patchDWord(0x004dc6cc + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dc6d2 + 3, offsetof(Obj_CSkaterCareer, gap_checklist));

	// Obj::CSkaterCareer::GetGapChecklist (0x004dc690)
	patchDWord(0x004dc699 + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dc69f + 3, offsetof(Obj_CSkaterCareer, gap_checklist));

	// Obj::CSkaterCareer::Init (0x004dc600)
	patchDWord(0x004dc608 + 2, offsetof(Obj_CSkaterCareer, level_flags));
	patchDWord(0x004dc60e + 2, offsetof(Obj_CSkaterCareer, goal_flags) - offsetof(Obj_CSkaterCareer, level_flags));
	patchDWord(0x004dc616 + 2, offsetof(Obj_CSkaterCareer, goal_flags) - offsetof(Obj_CSkaterCareer, level_flags) + 4);
	patchDWord(0x004dc61f + 2, &s_is_competition);
	patchByte(0x004dc629 + 2, NUM_LEVELS);
	patchDWord(0x004dc62e + 2, offsetof(Obj_CSkaterCareer, start_goal_flags));
	patchDWord(0x004dc634 + 2, offsetof(Obj_CSkaterCareer, start_level_flags));
	patchDWord(0x004dc63a + 2, offsetof(Obj_CSkaterCareer, start_goal_flags) + 4);
	patchDWord(0x004dc640 + 2, offsetof(Obj_CSkaterCareer, start_level_flags) + 4);
	patchDWord(0x004dc646 + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dc655 + 2, offsetof(Obj_CSkaterCareer, current_level));
	patchDWord(0x004dc65b + 3, offsetof(Obj_CSkaterCareer, gap_checklist));
	patchByte(0x004dc668 + 2, NUM_LEVELS);

	// Obj::CSkaterCareer::~CSkaterCareer (0x004dc510)
	patchDWord(0x004dc516 + 1, NUM_LEVELS);
	patchDWord(0x004dc522 + 2, offsetof(Obj_CSkaterCareer, gap_checklist));

	// Obj::CSkaterCareer::CSkaterCareer (0x004dc450)
	patchDWord(0x004dc477 + 2, offsetof(Obj_CSkaterCareer, gap_checklist));
	patchDWord(0x004dc4d4 + 3, offsetof(Obj_CSkaterCareer, level_visited));
	patchByte(0x004dc4df + 2, NUM_LEVELS);
}

void patchPoolSizes() {
	// Mem::Manager::Manager (0x00533990)
	patchDWord(0x005339dd + 1, 0x10000000); // Arena malloc: 0x4800000 -> 0x9000000
	patchDWord(0x005339f8 + 1, 0x10000000);  // Arena end address: 0x4800000 -> 0x9000000

	// Mem::Manager::InitOtherHeaps (0x00534220)
	patchDWord(0x00534380 + 1, 0xf4c040); // Script size: 0x3d3010 -> 0xf4c040
	patchDWord(0x00534557 + 1, 0x1b7740); // skater_geom size: 0x6ddd0 -> 0x1b7740

	// Script::AllocatePools (0x0040b780)
	patchDWord(0x0040b819 + 1, 0x1130); // Reserve CStruct: 0x44c -> 0x1130
	patchDWord(0x0040b84a + 1, 0x1f40); // CPair: 0x3e8 -> 0x1f40
	patchDWord(0x0040b7e3 + 1, 0x4e20); // Reserve CComponent: 0x1388 -> 0x4e20
}

void patchBetter4() {
	printLog("Initializing Better4 patches, using config=%s\n", configFile);

	patchScriptPrintf();
	patchButtonsFont();
	patchQdirTxt();
	patchCFuncs();
	patchSpinKeys();
	patchSpineTransfers();
	patchIykyk();
	patchGamespyCalls();
	patchStrcpy();
	patchWallpush();
	patchLoad();
	patchLevelLimit();
	patchPoolSizes();
	// patchNetHandlers();
	// patchHostOptions();
}

void better4Main() {
	initConfigFile();

	int isDebug = getIniBool("Miscellaneous", "Debug", 0, configFile);
	initializeLogging(isDebug);

	checkForUpdate();

	patchBetter4();
	partyMain(configFile);
}

__declspec(dllexport) BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpReserved) {
	// Perform actions based on the reason for calling.
	switch (fdwReason) {
	case DLL_PROCESS_ATTACH:
		// Initialize once for each new process.
		// Return FALSE to fail DLL load.
		better4Main();
		break;

	case DLL_THREAD_ATTACH:
		// Do thread-specific initialization.
		break;

	case DLL_THREAD_DETACH:
		// Do thread-specific cleanup.
		break;
	case DLL_PROCESS_DETACH:
		// Perform any necessary cleanup.
		break;
	}
	return TRUE;
}
