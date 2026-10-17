#include "decomp/Gfx_CModelBuilder.h"

#include "decomp/common.h"

uint32_t Gfx_CModelBuilder_geom_modulate_color(Gfx_CModelBuilder *this, uint32_t part) {
    static uint32_t (__fastcall *_geom_modulate_color)(Gfx_CModelBuilder *, unused_t, uint32_t) = (void *)0x00461010;
    return _geom_modulate_color(this, UNUSED, part);
}
