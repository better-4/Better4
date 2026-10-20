#include "decomp/Gfx_CModelBuilder.h"

#include "decomp/CArray.h"
#include "decomp/common.h"
#include "decomp/Gfx_CModelAppearance.h"
#include "decomp/Nx_CModel.h"
#include "log.h"

Gfx_CModelAppearance **addr_Gfx_CModelBuilder_mp_appearance = 0x00aac55c;
Nx_CModel **addr_Gfx_CModelBuilder_mp_model = 0x00aac558;

// Originally a member function in Gfx::CModelBuilder::CallMemberFunction (0x004606d0)
void __stdcall Gfx_CModelBuilder_GeomModulateColor(Gfx_CModelBuilder *this, CStruct *struc) {
	uint32_t part = 0;
	CStruct_GetChecksum(struc, 0xb6f08f39/*part*/, &part, 0);

    CArray *parent = 0;
    if (CStruct_GetArray(struc, 0xc2719fb0/*parent*/, &parent, 0)) {
        Gfx_CModelBuilder_geom_set_secondary_color(this, part, parent);
    } else {
        static uint32_t (__fastcall *_geom_modulate_color)(Gfx_CModelBuilder *, unused_t, uint32_t) = (void *)0x00461010;
        _geom_modulate_color(this, UNUSED, part);
    }
}

// uint32_t Gfx_CModelBuilder_geom_modulate_color(Gfx_CModelBuilder *this, uint32_t part) {
//     Gfx_CModelAppearance *mp_appearance = *addr_Gfx_CModelBuilder_mp_appearance;
//     Nx_CModel *mp_model = *addr_Gfx_CModelBuilder_mp_model;
//
//     CStruct *appearance = Gfx_CModelAppearance_GetVirtualDescStructure(mp_appearance, part);
//     if (!appearance) {
//         return 0;
//     }
//
//     // if default hsv override not specified, no color modulation needed
//     if (!CStruct_ContainsComponentNamed(appearance, 0x97dbdde6/*use_default_hsv*/)) {
//         return 0;
//     }
//
//     int use_default_hsv = -1;
//     if (!CStruct_GetInteger(appearance, 0x97dbdde6/*use_default_hsv*/, &use_default_hsv, 0)) {
//         logWarning("Gfx::CModelBuilder::geom_modulate_color: could not get use_default_hsv from part", part);
//         return 0;
//     }
//
//     if (use_default_hsv) {
//         Nx_CModel_ClearColor(mp_model, part);
//         return 0;
//     }
//
//     int h = 0;
//     if (CStruct_GetInteger(appearance, 0x6e94f918/*h*/, &h, 0)) {
//         int s = 0;
//         if (CStruct_GetInteger(appearance, 0xe4f130f4/*s*/, &s, 0)) {
//             int v = 0;
//             if (CStruct_GetInteger(appearance, 0x949bc47b/*v*/, &v, 0)) {
//                 Nx_CModel_ModulateColor(mp_model, part, (float)h, (float)s * 0.01, (float)v * 0.01);
//             }
//         }
//     }
//
//     return 1;
// }

uint32_t Gfx_CModelBuilder_geom_set_secondary_color(Gfx_CModelBuilder *this, uint32_t part, CArray *parent) {
    Gfx_CModelAppearance *mp_appearance = *addr_Gfx_CModelBuilder_mp_appearance;
    Nx_CModel *mp_model = *addr_Gfx_CModelBuilder_mp_model;

    CStruct *appearance = Gfx_CModelAppearance_GetVirtualDescStructure(mp_appearance, part);
    if (!appearance) {
        return 0;
    }

    // if default hsv override not specified, no color modulation needed
    if (!CStruct_ContainsComponentNamed(appearance, 0x97dbdde6/*use_default_hsv*/)) {
        return 0;
    }

    int use_default_hsv = -1;
    if (!CStruct_GetInteger(appearance, 0x97dbdde6/*use_default_hsv*/, &use_default_hsv, 0)) {
        logWarning("Gfx::CModelBuilder::geom_set_material_color: could not get use_default_hsv from part", part);
        return 0;
    }

    if (use_default_hsv) {
        Nx_CModel_ClearColor(mp_model, part);
        return 0;
    }

    int h = 0;
    if (CStruct_GetInteger(appearance, 0x6e94f918/*h*/, &h, 0)) {
        int s = 0;
        if (CStruct_GetInteger(appearance, 0xe4f130f4/*s*/, &s, 0)) {
            int v = 0;
            if (CStruct_GetInteger(appearance, 0x949bc47b/*v*/, &v, 0)) {
                for (int i = 0; i < parent->size; i++) {
                    uint32_t parent_part = CArray_Get(parent, i);
                    logDebug("Setting color for part=%x parent=%x", part, parent_part);
                    Nx_CModel_SetSecondaryColor(mp_model, parent_part, (float)h, (float)s * 0.01, (float)v * 0.01);
                }
            }
        }
    }

    return 1;
}
