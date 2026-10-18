#ifndef _DIRECTORY_LIST_H_
#define _DIRECTORY_LIST_H_

#include "cfuncs.h"
#include <stdbool.h>
#include <stdio.h>
#include <windows.h>
#include <log.h>

#define SKA_SIZE 2048
#define NAME_SIZE 16 // 15 + null

int __cdecl CFunc_GetMostRecentCAS(CStruct *params, CScript *script);

#endif