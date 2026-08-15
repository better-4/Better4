#ifndef _LOG_H_
#define _LOG_H_

void initializeLogging();
int printLog(const char* fmt, ...);

void patchScriptPrintf();

#endif
