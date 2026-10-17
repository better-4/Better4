#include "decomp/Gfx_CModelAppearance.h"

#include "decomp/common.h"

CStruct *Gfx_CModelAppearance_GetVirtualDescStructure(Gfx_CModelAppearance *this, uint32_t part) {
    static CStruct *(__fastcall *_GetVirtualDescStructure)(Gfx_CModelAppearance *, unused_t, uint32_t) = (void *)0x00460380;
    return _GetVirtualDescStructure(this, UNUSED, part);
}
