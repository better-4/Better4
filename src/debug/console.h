#ifndef _DEBUG_CONSOLE_H_
#define _DEBUG_CONSOLE_H_

#include "decomp/CScript.h"
#include "decomp/CStruct.h"

#define CONSOLE_MAX_LINE 256
#define CONSOLE_SCROLLBACK 256
#define CONSOLE_WRAP_COLS 80

void initDebugConsole();

// Installs the overlay console's input hooks.
void patchDebugConsole();

// Writes a line to the in-game console pane.
void better4DebugPrint(const char *fmt, ...);

void better4ConsoleClear(void);

// Tokenizes and runs a single console command line.
int better4DebugExec(const char *line);

int __cdecl CFunc_Better4DebugPrint(CStruct *params, CScript *script);
int __cdecl CFunc_Better4DebugConsoleAlive(CStruct *params, CScript *script);

#endif
