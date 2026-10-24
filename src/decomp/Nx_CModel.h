#ifndef _DECOMP_NX_CMODEL_H_
#define _DECOMP_NX_CMODEL_H_

#include "decomp/CArray.h"
#include "decomp/Nx_CXboxGeom.h"

#include <stdint.h>

#define MAX_GEOMS 18

// Really this is subclasseed by Nx::CXboxModel but will leave it as just CModel until
// platform-specific behavior is needed
typedef struct Nx_CModel {
    // 0x14 Nx_CGeom *geoms[MAX_GEOMS];
    // 0xb4: uint32_t geom_names[MAX_GEOMS]
    // 0x108: uint32_t num_geoms
    uint8_t unk[0x14];
    Nx_CXboxGeom *geoms[MAX_GEOMS]; // 0x14, size 0x48
    uint8_t unk2[0x58];
    uint32_t geom_names[MAX_GEOMS]; // 0xb4, size 0x48
    uint8_t unk3[0xc];
    uint16_t num_geoms; // 0x108
} Nx_CModel;

uint8_t Nx_CModel_ClearColor(Nx_CModel *this, uint32_t part);
// uint32_t Nx_CModel_ModulateColor(Nx_CModel *this, uint32_t part, float h, float s, float v);
uint32_t Nx_CModel_SetSecondaryColor(Nx_CModel *this, uint32_t part, float h, float s, float v);

#endif
