#ifndef _CFUNCS_H_
#define _CFUNCS_H_

#include <qb.h>

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

#endif
