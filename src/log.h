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
int vprintLog(const char* fmt, va_list args);
int printLog(const char* fmt, ...);

void patchScriptPrintf();

#endif
