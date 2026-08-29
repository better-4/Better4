#ifndef _ONLINE_SERVER_H_
#define _ONLINE_SERVER_H_

#include "decomp/CStruct.h"

int __cdecl CFunc_SetHosting(CStruct *params);
int __cdecl CFunc_IsHosting(CStruct *params);
int __cdecl CFunc_NotifyStateChanged(CStruct *params);
int __cdecl CFunc_StopReporting(CStruct *params);

void patchGamespyServerCalls();

#endif
