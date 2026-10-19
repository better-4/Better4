#include "decomp/Nx_CModel.h"

#include "decomp/common.h"
#include "decomp/CStruct.h"
#include "decomp/Gfx.h"
#include "decomp/Image_RGBA.h"

uint8_t Nx_CModel_ClearColor(Nx_CModel *this, uint32_t part) {
    static uint8_t (__fastcall *_ClearColor)(Nx_CModel *, unused_t, uint32_t) = (void *)0x00468ff0;
    return _ClearColor(this, UNUSED, part);
}

// uint32_t Nx_CModel_ModulateColor(Nx_CModel *this, uint32_t part, float h, float s, float v) {
//     int success = 0;
//     int all = part == 0xc4e78e22/*all*/;
//
//     float r = 0;
//     float g = 0;
//     float b = 0;
//     Gfx_HSVtoRGB(&r, &g, &b, h, s, v);
//
//     Image_RGBA rgba;
//     rgba.r = (uint8_t)(r * 255.0 + 0.5);
//     rgba.g = (uint8_t)(g * 255.0 + 0.5);
//     rgba.b = (uint8_t)(b * 255.0 + 0.5);
//     rgba.a = 255;
//
//     for (int i = 0; i < this->num_geoms; i++) {
//         uint32_t geom_name = this->geom_names[i];
//         if (geom_name == part || all) {
//             Nx_CXboxGeom *geom = this->geoms[i];
//             Nx_CXboxGeom_plat_set_color(geom, rgba);
//         }
//     }
//
//     return success;
// }

uint32_t Nx_CModel_SetSecondaryColor(Nx_CModel *this, uint32_t part, float h, float s, float v) {
    int success = 0;
    int all = part == 0xc4e78e22/*all*/;

    uint32_t mat_checksum = 0;
    int mat_pass = 0;

    float r = 0;
    float g = 0;
    float b = 0;
    Gfx_HSVtoRGB(&r, &g, &b, h, s, v);

    Image_RGBA rgba;
    rgba.r = (uint8_t)(r * 255.0 + 0.5);
    rgba.g = (uint8_t)(g * 255.0 + 0.5);
    rgba.b = (uint8_t)(b * 255.0 + 0.5);
    rgba.a = 255;

    for (int i = 0; i < this->num_geoms; i++) {
        uint32_t geom_name = this->geom_names[i];
        if (geom_name == part || all) {
            Nx_CXboxGeom *geom = this->geoms[i];
            Nx_CXboxGeom_plat_set_secondary_color(geom, rgba);
        }
    }

    return success;
}
