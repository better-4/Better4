#include "decomp/Gfx_Camera.h"

#include "decomp/common.h"

Mth_Vector *Gfx_Camera_GetPos(Gfx_Camera *this) {
    static Mth_Vector *(__fastcall *_GetPos)(Gfx_Camera *) = (void *)0x0045df70;
    return _GetPos(this);
}

void Gfx_Camera_SetPos(Gfx_Camera *this, Mth_Vector *pos) {
    static void (__fastcall *_SetPos)(Gfx_Camera *, unused_t, Mth_Vector *) = (void *)0x0045df50;
    _SetPos(this, UNUSED, pos);
}
