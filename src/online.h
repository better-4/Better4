#ifndef _ONLINE_H_
#define _ONLINE_H_

#include "decomp/CStruct.h"
#include "decomp/CScript.h"

int __cdecl CFunc_GetLocalSkaterIndex(CStruct* params, CScript* script);
int __cdecl CFunc_ObserveSelf(CStruct* params);
int __cdecl CFunc_QueueObserveSelf(CStruct* params);
int __cdecl CFunc_IsBetterObserving(CStruct* params);
int __cdecl CFunc_IsVoluntaryObserving(CStruct* params);
int __cdecl CFunc_BetterObserve(CStruct* params);
int __cdecl CFunc_ObserveAfter0(CStruct* params);
int __cdecl CFunc_DisableLocalPlayerInput(CStruct* params);
int __cdecl CFunc_EnableLocalPlayerInput(CStruct* params);
int __cdecl CFunc_GetServerList(CStruct *params, CScript *script);

#endif
