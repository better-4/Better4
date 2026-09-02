#ifndef _ONLINE_H_
#define _ONLINE_H_

#include "decomp/CScript.h"
#include "decomp/CStruct.h"
#include "decomp/GameNet_PlayerInfo.h"

int __cdecl CFunc_GetLocalSkaterIndex(CStruct* params, CScript* script);
int __cdecl CFunc_ObserveSelf(CStruct* params);
int __cdecl CFunc_QueueObserveSelf(CStruct* params);
int __cdecl CFunc_IsBetterObserving(CStruct* params);
int __cdecl CFunc_IsVoluntaryObserving(CStruct* params);
int __cdecl CFunc_BetterObserve(CStruct* params);
int __cdecl CFunc_ObserveAfter0(CStruct* params);
int __cdecl CFunc_ObserveNext(CStruct* params);
int __cdecl CFunc_ObservePrev(CStruct* params);
int __cdecl CFunc_GetObsPlayerName(CStruct *params, CScript *script);
int __cdecl CFunc_SnapObsCameraBack(CStruct* params);
GameNet_PlayerInfo* GetLocalPlayerFast ();
#endif
