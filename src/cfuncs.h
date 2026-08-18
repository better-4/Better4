#ifndef _CFUNCS_H_
#define _CFUNCS_H_

#include <qb.h>

typedef struct {
    char* name;
    void* func;
} CFunc;

void patchCFuncs();

int CFunc_GetIniBool(CStruct *params);
int CFunc_GetIniInteger(CStruct *params, CScript *script);
int CFunc_SetIniBool(CStruct *params, CScript *script);
int CFunc_SetIniInteger(CStruct *params, CScript *script);
int CFunc_ChangeGlobal(CStruct *params, CScript *script);

#endif
