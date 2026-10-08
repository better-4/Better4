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

Mth_Matrix *Gfx_Camera_GetMatrix(Gfx_Camera *this) {
    static Mth_Matrix *(__fastcall *_GetMatrix)(Gfx_Camera *) = (void *)0x0045e000;
    return _GetMatrix(this);
}

void Gfx_Camera_SetMatrix(Gfx_Camera *this, Mth_Matrix *mat) {
    static void (__fastcall *_SetMatrix)(Gfx_Camera *, unused_t, Mth_Matrix *) = (void *)0x0045df80;
    _SetMatrix(this, UNUSED, mat);
}
