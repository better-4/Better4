#ifndef _ZBIAS_H_
#define _ZBIAS_H_

#include "decomp/CScript.h"
#include "decomp/CStruct.h"

// Per-material z-bias, which THPS4 itself does not have. Values come from
// data/levels/<Lvl>/<lvl>.zb, loaded per level by `LoadZBias`.
void patchZBias();

// Loads ZBias file with `level` param.
int __cdecl CFunc_LoadZBias(CStruct *params, CScript *script);

#endif
