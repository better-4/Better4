#ifndef _LOG_H_
#define _LOG_H_

#include <stdarg.h>

enum {
	LOG_LEVEL_ERROR,
	LOG_LEVEL_WARNING,
	LOG_LEVEL_INFO,
	LOG_LEVEL_DEBUG,
};

void initializeLogging();

int logError(const char *fmt, ...);
int logWarning(const char *fmt, ...);
int logInfo(const char *fmt, ...);
int logDebug(const char *fmt, ...);

void patchScriptPrintf();

int __cdecl CFunc_LogError(CStruct* params, CScript *script);
int __cdecl CFunc_LogWarning(CStruct* params, CScript *script);
int __cdecl CFunc_LogInfo(CStruct* params, CScript *script);
int __cdecl CFunc_LogDebug(CStruct* params, CScript *script);

#endif
