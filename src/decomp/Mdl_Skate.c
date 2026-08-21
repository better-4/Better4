#include "decomp/Mdl_Skate.h"
#include "decomp/common.h"

Mdl_Skate *Mdl_Skate_Instance() {
    return *(Mdl_Skate **)0x00ab5b48;
}

struct Obj_CSkater *Mdl_Skate_GetSkater(Mdl_Skate *this, uint32_t index) {
    static struct Obj_CSkater *(__fastcall* _GetSkater)(Mdl_Skate *, unused_t, uint32_t) = (void *)0x004fa2b0;
    return _GetSkater(this, UNUSED, index);
}
