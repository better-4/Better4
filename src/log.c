#include "log.h"

#include <stdarg.h>
#include <stdio.h>
#include <time.h>
#include <windows.h>
#pragma comment(lib, "dbghelp.lib")
#include <dbghelp.h>

static FILE* fp_log = NULL;
static int log_level = LOG_LEVEL_INFO;
static int allocated_console = 0;

static volatile LONG g_in_handler;

static int is_fatal(DWORD c) {
    return c == EXCEPTION_ACCESS_VIOLATION || c == EXCEPTION_IN_PAGE_ERROR ||
           c == EXCEPTION_ILLEGAL_INSTRUCTION || c == EXCEPTION_PRIV_INSTRUCTION ||
           c == EXCEPTION_INT_DIVIDE_BY_ZERO || c == EXCEPTION_ARRAY_BOUNDS_EXCEEDED ||
           c == EXCEPTION_STACK_OVERFLOW;
}

static void print_addr(DWORD64 a) {
    HMODULE hm = NULL;
    char path[MAX_PATH] = "?";
    if (GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
                           GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, (LPCSTR)(size_t)a, &hm))
        GetModuleFileNameA(hm, path, MAX_PATH);
    const char *name = strrchr(path, '\\');
    logError("  %08llx  %s+0x%llx", a, name ? name + 1 : path,
            (unsigned long long)(a - (DWORD64)(size_t)hm));
}

static LONG WINAPI crash_handler(EXCEPTION_POINTERS *ep) {
    if (!is_fatal(ep->ExceptionRecord->ExceptionCode)) return EXCEPTION_CONTINUE_SEARCH;
    if (InterlockedExchange(&g_in_handler, 1)) return EXCEPTION_CONTINUE_SEARCH;

    EXCEPTION_RECORD *er = ep->ExceptionRecord;
    logError( "=== EXCEPTION %08lx at %p", er->ExceptionCode, er->ExceptionAddress);
    if (er->ExceptionCode == EXCEPTION_ACCESS_VIOLATION && er->NumberParameters >= 2)
        logError( " (%s %p)", er->ExceptionInformation[0] ? "write" : "read",
                (void *)er->ExceptionInformation[1]);

    CONTEXT *c = ep->ContextRecord;
    logError("EAX=%08lx EBX=%08lx ECX=%08lx EDX=%08lx ESI=%08lx EDI=%08lx EBP=%08lx ESP=%08lx EIP=%08lx",
            c->Eax, c->Ebx, c->Ecx, c->Edx, c->Esi, c->Edi, c->Ebp, c->Esp, c->Eip);

    STACKFRAME64 sf = {0};
    sf.AddrPC.Offset = c->Eip;
	sf.AddrPC.Mode = AddrModeFlat;
    sf.AddrFrame.Offset = c->Ebp;
	sf.AddrFrame.Mode = AddrModeFlat;
    sf.AddrStack.Offset = c->Esp;
	sf.AddrStack.Mode = AddrModeFlat;
    CONTEXT copy = *c;
    HANDLE proc = GetCurrentProcess(), thr = GetCurrentThread();
    logError("Stack:");
    for (int i = 0; i < 64 && StackWalk64(IMAGE_FILE_MACHINE_I386, proc, thr, &sf, &copy, NULL,
                                          SymFunctionTableAccess64, SymGetModuleBase64, NULL); i++) {
        if (!sf.AddrPC.Offset) break;
        print_addr(sf.AddrPC.Offset);
    }

    logError("Raw stack scan:");
    DWORD *sp = (DWORD *)c->Esp;
    __try {
        for (int i = 0, n = 0; i < 1024 && n < 48; i++) {
            MEMORY_BASIC_INFORMATION mbi;
            if (VirtualQuery((void *)sp[i], &mbi, sizeof mbi) && mbi.State == MEM_COMMIT &&
                (mbi.Protect & (PAGE_EXECUTE | PAGE_EXECUTE_READ | PAGE_EXECUTE_READWRITE | PAGE_EXECUTE_WRITECOPY))) {
                print_addr(sp[i]); n++;
            }
        }
    } __except (EXCEPTION_EXECUTE_HANDLER) {}

    return EXCEPTION_CONTINUE_SEARCH;
}

void initializeLogging(int console, int level) {
	log_level = level;

	if (console) {
		AllocConsole();
		SetConsoleTitle("Better4 Debug Console");

		FILE *f_dummy;
		freopen_s(&f_dummy, "CONIN$", "r", stdin);
		freopen_s(&f_dummy, "CONOUT$", "w", stderr);
		freopen_s(&f_dummy, "CONOUT$", "w", stdout);

		allocated_console = 1;
	}

    fopen_s(&fp_log, "better4.log", "w");
	AddVectoredExceptionHandler(1, crash_handler);
}

int vprintLog(const char* fmt, va_list args, char level, int newline) {
	clock_t milliseconds = clock();

	char message[256];
    vsnprintf(message, 256, fmt, args);

	char full_log[300];
	int ret;
	if (newline) {
		ret = sprintf_s(full_log, 300, "%05ld %c %s\n", milliseconds, level, message);
	} else {
		ret = sprintf_s(full_log, 300, "%05ld %c %s", milliseconds, level, message);
	}

	if (allocated_console) {
		fputs(full_log, stdout);
	}

    if (fp_log) {
        fputs(full_log, fp_log);
        fflush(fp_log);
    }

    return ret;
}

int logError(const char* fmt, ...) {
	if (log_level >= LOG_LEVEL_ERROR) {
		va_list args;
		va_start(args, fmt);
		int ret = vprintLog(fmt, args, 'E', 1);
		va_end(args);
		return ret;
	} else {
		return 0;
	}
}

int logWarning(const char* fmt, ...) {
	if (log_level >= LOG_LEVEL_WARNING) {
		va_list args;
		va_start(args, fmt);
		int ret = vprintLog(fmt, args, 'W', 1);
		va_end(args);
		return ret;
	} else {
		return 0;
	}
}

int logInfo(const char* fmt, ...) {
	if (log_level >= LOG_LEVEL_INFO) {
		va_list args;
		va_start(args, fmt);
		int ret = vprintLog(fmt, args, 'I', 1);
		va_end(args);
		return ret;
	} else {
		return 0;
	}
}

int logDebug(const char* fmt, ...) {
	if (log_level >= LOG_LEVEL_DEBUG) {
		va_list args;
		va_start(args, fmt);
		int ret = vprintLog(fmt, args, 'D', 1);
		va_end(args);
		return ret;
	} else {
		return 0;
	}
}

int patchedPrintf(const char* fmt, ...) {
	if (log_level >= LOG_LEVEL_INFO) {
		va_list args;
		va_start(args, fmt);
		// Print info log, but don't print a newline (printf includes it)
		int ret = vprintLog(fmt, args, 'I', 0);
		va_end(args);
		return ret;
	} else {
		return 0;
	}
}

void patchScriptPrintf() {
	// Patching Printf (0x00535ef0 or 0x00405b60) gives partial success but crashes the
	// game when entering the main menu. Instead, patch individual call sites in CFuncs.

	// CFuncs::ScriptPrintf (0x0050a1e0)
	patchCall(0x0050a3cb, patchedPrintf);
	patchCall(0x0050a3e5, patchedPrintf);
	patchCall(0x0050a4b5, patchedPrintf);
	patchCall(0x0050a4fb, patchedPrintf);

	// CFuncs::ScriptPrintStruct (0x0041a4c0)
	patchCall(0x0041a4ce, printf);
	patchCall(0x0041a4e2, printf);
	patchCall(0x0041a4f2, printf);
	patchCall(0x0041a522, printf);
	patchCall(0x0041a540, printf);
	patchCall(0x0041a56c, printf);
	patchCall(0x0041a595, printf);
	patchCall(0x0041a5ab, printf);
	patchCall(0x0041a5cf, printf);
	patchCall(0x0041a5fa, printf);
	patchCall(0x0041a60c, printf);
	patchCall(0x0041a62f, printf);
	patchCall(0x0041a667, printf);
	patchCall(0x0041a685, printf);
	patchCall(0x0041a69e, printf);
	patchCall(0x0041a6ad, printf);
	patchCall(0x0041a6d1, printf);
	patchCall(0x0041a6fb, printf);
	patchCall(0x0041a70b, printf);
}

typedef int(__cdecl* LogCallback)(const char *fmt, ...);

int __cdecl _CFunc_LogLevel(CStruct* params, CScript *script, int level, LogCallback callback) {
    static uint32_t(__cdecl* _sFormatText)(CStruct *, CStruct *) = (void *)0x00509e40;

	if (log_level >= level) {
		char *text = "";
		if (CStruct_GetString(params, 0, &text, 0)) {
			CStruct *format_params = CStruct_New();
			
			CStruct_AddChecksum(format_params, 0xff0db407/*TextName*/, 0xbc4ac08b/*PrintfText*/);
			CStruct_AppendStructure(format_params, params);

			if (_sFormatText(format_params, format_params)) {
				CStruct_GetString(format_params, 0xbc4ac08b/*PrintfText*/, &text, 0);
			} else {
				// TODO (ellie): add GetScriptInfo here? but probably not helpful until we get checksum resolving
				text = "Error formatting text for log";
			}

			callback(text);

			CStruct_Free(format_params);
			return 1;
		}
	}

	return 0;
}

int __cdecl CFunc_LogError(CStruct* params, CScript *script) {
	return _CFunc_LogLevel(params, script, LOG_LEVEL_ERROR, logError);
}

int __cdecl CFunc_LogWarning(CStruct* params, CScript *script) {
	return _CFunc_LogLevel(params, script, LOG_LEVEL_WARNING, logWarning);
}

int __cdecl CFunc_LogInfo(CStruct* params, CScript *script) {
	return _CFunc_LogLevel(params, script, LOG_LEVEL_INFO, logInfo);
}

int __cdecl CFunc_LogDebug(CStruct* params, CScript *script) {
	return _CFunc_LogLevel(params, script, LOG_LEVEL_DEBUG, logDebug);
}
