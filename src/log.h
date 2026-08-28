#ifndef _LOG_H_
#define _LOG_H_

#include <stdarg.h>

void initializeLogging();
int vprintLog(const char* fmt, va_list args);
int printLog(const char* fmt, ...);

void patchScriptPrintf();

#endif
