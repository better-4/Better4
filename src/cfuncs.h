#ifndef _CFUNCS_H_
#define _CFUNCS_H_

#include "decomp/CStruct.h"
#include "decomp/CScript.h"

// A CFunc is a function that can be called from q scripts.
// All CFuncs are __cdecl, take two parameters: `CStruct *params, CScript *script`,
// and return 0 on failure or 1 on success, unlike common C convention.
//
// For example, in the following q script,
// ```qscript
// if GetIniInteger <...>
//   <callback>
// endif
// ```
// The <callback> would only be called if `GetIniInteger` returned 1.

typedef struct {
    char* name;
    void* func;
} CFunc;

void patchCFuncs();

int __cdecl CFunc_GetIniBool(CStruct *params);
int __cdecl CFunc_GetIniInteger(CStruct *params, CScript *script);
int __cdecl CFunc_SetIniBool(CStruct *params, CScript *script);
int __cdecl CFunc_SetIniInteger(CStruct *params, CScript *script);
int __cdecl CFunc_ChangeGlobal(CStruct *params, CScript *script);
int __cdecl CFunc_AutoAspectRatio(CStruct* params) ;
int __cdecl CFunc_GetStartTime(CStruct* params, CScript *script);
int __cdecl CFunc_GetElapsedTime(CStruct* params, CScript *script);

#endif
