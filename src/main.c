#include "cfuncs.h"
#include "log.h"
#include "input.h"
#include "security.h"
#include "updater.h"
#include "wallpush.h"

#include "partymod-thps4/src/main.h"

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
