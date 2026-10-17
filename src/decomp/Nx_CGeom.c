#include "decomp/Nx_CGeom.h"

#include "decomp/common.h"

void Nx_CGeom_SetColor(Nx_CGeom *this, Image_RGBA color) {
    static void (__fastcall *_SetColor)(Nx_CGeom *, unused_t, Image_RGBA) = (void *)0x00448f20;
    _SetColor(this, UNUSED, color);
}
