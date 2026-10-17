#ifndef _DECOMP_GFX_CMODELAPPEARANCE_H_
#define _DECOMP_GFX_CMODELAPPEARANCE_H_

#include "decomp/CStruct.h"

#include <stdint.h>

typedef void Gfx_CModelAppearance;

CStruct *Gfx_CModelAppearance_GetVirtualDescStructure(Gfx_CModelAppearance *this, uint32_t part);

#endif
