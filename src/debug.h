#ifndef _DEBUG_H_
#define _DEBUG_H_

#include "decomp/CScript.h"
#include "decomp/CStruct.h"

#include <stdint.h>

// This is what lets the console resolve a name typed at runtime, which in turn
// is what makes `set`, `get` and `script` possible.
uint32_t better4Checksum(const char *name);

// Writes a line to the in-game console pane.
void better4DebugPrint(const char *fmt, ...);

// Tokenizes and runs a single console command line.
int better4DebugExec(const char *line);

void initDebugConsole();

// Installs the overlay console's input hooks.
void patchDebugConsole();

int __cdecl CFunc_Better4DebugPrint(CStruct *params, CScript *script);
int __cdecl CFunc_Better4DebugAddLevel(CStruct *params, CScript *script);
int __cdecl CFunc_Better4DebugConsoleAlive(CStruct *params, CScript *script);

#endif
