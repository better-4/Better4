#include "cfuncs.h"
#include "freecam.h"
#include "input.h"
#include "log.h"
#include "online.h"
#include "online/host_options.h"
#include "online/net_handlers.h"
#include "security.h"
#include "updater.h"
#include "wallpush.h"

#include "decomp/common.h"
#include "decomp/CArray.h"
#include "decomp/CStruct.h"
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
	// Increase the size of the general-purpose arena allocated on startup.
	// Mem::Manager::Manager (0x00533990)
	patchDWord(0x005339dd + 1, 0x10000000); // Arena malloc: 0x4800000 (72 MB) -> 0x10000000 (256 MB)
	patchDWord(0x005339f8 + 1, 0x10000000);  // Arena end address: 0x4800000 (72 MB) -> 0x10000000 (256 MB)

	// Increase the size of specific heap contexts.
	// Each subsystem (`Script`, `skater_geom`, etc.) has its own heap context.
    // Mem::Manager::InitOtherHeaps (0x00534220)
	patchDWord(0x00534380 + 1, 0xf4c040); // Script size: 0x3d3010 (3.8 MB) -> 0xf4c040 (15.3 MB)
	patchDWord(0x00534557 + 1, 0x1b7740); // skater_geom size: 0x6ddd0 (439 KB) -> 0x1b7740 (1.7 MB)

	// Increase the size of the pools in the `Script` heap.
	// Each type of object (e.g. `CComponent`) may only have N (e.g. 70,000) instances allocated at once.
	// Script::AllocatePools (0x0040b780)
	patchDWord(0x0040b7cd + 1, 0x445c0); // CComponent: 70,000 -> 280,000
	patchDWord(0x0040b7e3 + 1, 0x4e20); // Reserve CComponent: 5,000 -> 20,000
	patchDWord(0x0040b7fe + 1, 0xcb20); // CStruct: 13,000 -> 52,000
	patchDWord(0x0040b819 + 1, 0x1130); // Reserve CStruct: 1,100 -> 4,400
	patchDWord(0x0040b835 + 1, 0x7d00); // CVector: 8,000 -> 32,000
	patchDWord(0x0040b84a + 1, 0xfa0); // CPair: 1,000 -> 4,000
	patchDWord(0x0040b859 + 1, 0x4e20); // CArray: 5,000 -> 20,000
	patchDWord(0x0040b868 + 1, 0x5dc0); // CSymbolTableEntry: 6,000 -> 24,000
	patchDWord(0x0040b87f + 1, 0x348); // CScript: 210 -> 840
	patchByte(0x0040b88e + 1, 0x7f); // CStoredRandom: 100 -> 127 (max signed u8; don't increase)
	patchDWord(0x0040b895 + 1, 0x55f0); // AllocatePermanentStringHeap max_strings: 5500 -> 22000
	patchDWord(0x0040b89a + 1, 0x6b6c0); // AllocatePermanentStringHeap max_size: 0x1adb0 (107.4 KB) -> 0x6b6c0 (429.7 KB)
}

int __fastcall Obj_CSkaterProfile_GetNumSpecialTrickSlots(void *this) {
	static int (__fastcall *_GetNumSpecialTrickSlots)(void *) = (void *)0x004dee80;
	int slots = _GetNumSpecialTrickSlots(this);
	logDebug("Obj::CSkaterProfile::GetNumSpecialTrickSlots: this=%p slots=%d", this, slots);
	return slots;
}

void __fastcall Obj_CSkaterProfile_GetSpecialTrickInfo(void *this, unused_t _, void *profile, uint32_t index) {
	static void (__fastcall *_GetSpecialTrickInfo)(void *, unused_t, void *, uint32_t) = (void *)0x004deea0;
	logDebug("Obj::CSkaterProfile::GetSpecialTrickInfo: this=%p index=%d", this, index);
	_GetSpecialTrickInfo(this, UNUSED, profile, index);
}

uint8_t __fastcall Game_CGoal_AddTempSpecialTrick(void *this) {
	static uint8_t (__fastcall *_GetSpecialTrickInfo)(void *) = (void *)0x004e86d0;
	logDebug("Game::CGoal::AddTempSpecialTrick: this=%p", this);
	return _GetSpecialTrickInfo(this);
}

void resize_specials(CArray *specials) {
	if (specials->size < 13) {
		logInfo("resizing specials from 12 to 13");
		CStruct *tmp_specials[12];

		for (int i = 0; i < specials->size; i++) {
			tmp_specials[i] = CArray_Get(specials, i);
			logDebug("tmp_specials[%d]=%p", i, tmp_specials[i]);
		}
		logDebug("setting specials array size to 13");
		CArray_SetSizeAndType(specials, 13, specials->type);

		for (int i = 0; i < 12; i++) {
			if (tmp_specials[i]) {
				logDebug("setting specials[%d]=%p", i, tmp_specials[i]);
				CArray_SetStructure(specials, i, tmp_specials[i]);
			}
		}

		CStruct *unassigned_slot = CStruct_New();
		CStruct_AddChecksum(unassigned_slot, 0x5b077ce1/*trickname*/, 0xf60c9090/*unassigned*/);
		CStruct_AddChecksum(unassigned_slot, 0xa92a2280/*trickslot*/, 0xf60c9090/*unassigned*/);

		CArray_SetStructure(specials, 12, unassigned_slot);
	}
}

void __fastcall Obj_CPlayerProfileManager_LoadCASProfileInfo(void *this, unused_t _, CStruct *struc) {
	static void (__fastcall *_LoadCASProfileInfo)(void *, unused_t, CStruct *) = (void *)0x004af010;
	logDebug("Obj::CPlayerProfileManager::LoadCASProfileInfo: this=%p", this);
	CStruct *custom;
	if (CStruct_GetStructure(struc, 0xa7be964/*custom*/, &custom, 0)) {
		CStruct *info;
		if (CStruct_GetStructure(custom, 0x3476cea8/*info*/, &info, 0)) {
			logDebug("got info");
			CStruct *specials_struc;
			if (CStruct_GetStructure(info, 0xddbee809/*specials*/, &specials_struc, 0)) {
				CFunc_PrintStruct(specials_struc, 0);
				CArray *specials;
				if (CStruct_GetArray(specials_struc, 0, &specials, 0)) {
					resize_specials(specials);
				}
			}
		}
	}

	_LoadCASProfileInfo(this, UNUSED, struc);
}

void patchTwelveSpecials() {
	patchCall(0x004e8e8e, (void *)Obj_CSkaterProfile_GetSpecialTrickInfo);
	patchCall(0x004e8e77, (void *)Obj_CSkaterProfile_GetNumSpecialTrickSlots);
	patchJmp(0x004f173f, (void *)Game_CGoal_AddTempSpecialTrick);
	patchJmp(0x004f174b, (void *)Game_CGoal_AddTempSpecialTrick);
	patchCall(0x00514ea8, (void *)Obj_CPlayerProfileManager_LoadCASProfileInfo);
	patchCall(0x00514ea8, (void *)Obj_CPlayerProfileManager_LoadCASProfileInfo);

	// Obj::CSkater::UpdateTrickMappings (0x004cda50)
	patchByte(0x004cdc11 + 2, 13);

	// Game::CGoal::RemoveTempSpecialTrick (0x004e8a30)
	patchByte(0x004e8a9e + 2, 13);
}

void patchBetter4() {
	logInfo("Initializing Better4 patches, using config=%s", configFile);

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
	patchNetHandlers();
	patchHostOptions();
	patchObserve();
	patchMemberFunctions();
	patchFreecam();
	patchTwelveSpecials();
}

void better4Main() {
	initConfigFile();

	int is_debug = getIniBool("Miscellaneous", "Debug", 0, configFile);
	int log_level = GetPrivateProfileInt("Miscellaneous", "LogLevel", 2, configFile);
	initializeLogging(is_debug, log_level);

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
