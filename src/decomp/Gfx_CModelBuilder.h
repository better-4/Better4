#ifndef _DECOMP_GFX_CMODELBUILDER_H_
#define _DECOMP_GFX_CMODELBUILDER_H_

#include <stdint.h>

#include "decomp/CArray.h"
#include "decomp/CStruct.h"

typedef void Gfx_CModelBuilder;

void __stdcall Gfx_CModelBuilder_GeomModulateColor(Gfx_CModelBuilder *builder, CStruct *struc);
// uint32_t Gfx_CModelBuilder_geom_modulate_color(Gfx_CModelBuilder *this, uint32_t part);
uint32_t Gfx_CModelBuilder_geom_set_secondary_color(Gfx_CModelBuilder *this, uint32_t part, CArray *parent);

#endif
