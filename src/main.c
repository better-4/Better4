#include <windows.h>

#include "partymod-thps4/src/main.h"

#include <cfuncs.h>
#include <log.h>

void patchIykyk() {
	patchJmp((void*)0x0048224e, (void*)0x00482394);
	patchNop((void*)(0x0048224e + 5), 1);
}

void patchButtonsFont() {
	// Font name is always set to `ButtonsXbox` if the `buttons_font` flag is passed to `LoadFont`.
	// Patch JZ SHORT to JMP SHORT to skip this condition and always load `buttons_font` by name.
	patchByte(0x0046369f, 0xEB);
}

void patchBetter4() {
	patchIykyk();
	patchScriptPrintf();
	patchButtonsFont();
	patchCFuncs();
}

__declspec(dllexport) BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpReserved) {
	// Perform actions based on the reason for calling.
	switch(fdwReason) {
		case DLL_PROCESS_ATTACH:
			// Initialize once for each new process.
			// Return FALSE to fail DLL load.
			initializeLogging();
			patchBetter4();
            partyMain();
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
