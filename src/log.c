#include "log.h"

#include <stdarg.h>
#include <stdio.h>
#include <windows.h>

FILE* fp_log = NULL;


void initializeLogging() {
    AllocConsole();
    SetConsoleTitle("Better4 Debug Console");

    fopen_s(&fp_log, "better4.log", "w");

    FILE *f_dummy;
    freopen_s(&f_dummy, "CONIN$", "r", stdin);
    freopen_s(&f_dummy, "CONOUT$", "w", stderr);
    freopen_s(&f_dummy, "CONOUT$", "w", stdout);
}

int printLog(const char* fmt, ...) {
	va_list va;
	va_start(va, fmt);
	char rendered[1024];
    int ret = vsnprintf(rendered, 1024, fmt, va);
	va_end(va);

    printf(rendered);

    if (fp_log) {
        fputs(rendered, fp_log);
        fflush(fp_log);
    }

    return ret;
}

void patchScriptPrintf() {
	// Patching Printf (0x00535ef0 or 0x00405b60) gives partial success but crashes the
	// game when entering the main menu. Instead, patch individual call sites in CFuncs.

	// CFuncs::ScriptPrintf (0x0050a1e0)
	patchCall(0x0050a3cb, printLog);
	patchCall(0x0050a3e5, printLog);
	patchCall(0x0050a4b5, printLog);
	patchCall(0x0050a4fb, printLog);

	// CFuncs::ScriptPrintStruct (0041a4c0)
	patchCall(0x0041a4ce, printLog);
	patchCall(0x0041a4e2, printLog);
	patchCall(0x0041a4f2, printLog);
	patchCall(0x0041a522, printLog);
	patchCall(0x0041a540, printLog);
	patchCall(0x0041a56c, printLog);
	patchCall(0x0041a595, printLog);
	patchCall(0x0041a5ab, printLog);
	patchCall(0x0041a5cf, printLog);
	patchCall(0x0041a5fa, printLog);
	patchCall(0x0041a60c, printLog);
	patchCall(0x0041a62f, printLog);
	patchCall(0x0041a667, printLog);
	patchCall(0x0041a685, printLog);
	patchCall(0x0041a69e, printLog);
	patchCall(0x0041a6ad, printLog);
	patchCall(0x0041a6d1, printLog);
	patchCall(0x0041a6fb, printLog);
	patchCall(0x0041a70b, printLog);
}
