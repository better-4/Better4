#ifndef _DECOMP_NX_CXBOXGEOM_H_
#define _DECOMP_NX_CXBOXGEOM_H_

#include "decomp/Image_RGBA.h"

#define MAX_PASSES 4
#define MATFLAGS_B4_SECONDARY (1 << 30)

typedef struct NxXbox_sMaterial {
    uint32_t checksum; // 0x0
    uint32_t num_passes; // 0x4
    uint8_t unk[0x2];
    uint8_t uv_wibble; // 0xa
    uint8_t unk2[0xd];
    uint32_t flags[MAX_PASSES]; // 0x18
    // 0x28: NxXbox_sTexture *textures[MAX_PASSES]
    uint8_t unk3[0x1c];
    float colors[MAX_PASSES][4];
    // 0x38: float colors[MAX_PASSES][4]
    // 0xd0: uint32_t num_wibble_vc_anims
} NxXbox_sMaterial;

typedef struct NxXbox_sMesh {
    // 0x18: uint32_t flags
    // 0x28: (macos): NxXbox_sMaterial *material
    // 0x78: float material_color_override_0
    // 0x7c: float material_color_override_1
    // 0x80: float material_color_override_2
    uint8_t unk[0x18];
    uint32_t flags; // 0x18
    uint8_t unk2[0xc];
    NxXbox_sMaterial *material; // 0x28
    uint8_t unk3[0x4c];
    float material_color_override_0; // 0x78
    float material_color_override_1; // 0x7c
    float material_color_override_2; // 0x80
} NxXbox_sMesh;

typedef struct NxXbox_sScene {
    // 0x18: HashTable<Material> materials?
    // 0x1c: NxXbox_sMesh **meshes
    // 0x20: uint32_t num_mesh_entries
    // 0x28: NxXbox_sMesh **more_meshes?
    // 0x2c: uint32_t num_more_meshes?
    uint8_t unk[0x1c];
    NxXbox_sMesh **meshes; // 0x1c
    uint32_t num_meshes; // 0x20
    uint8_t unk2[0x4];
    NxXbox_sMesh **more_meshes; // 0x28, not sure what difference is
    uint32_t num_more_meshes; // 0x2c, not sure what difference is
} NxXbox_sScene;

typedef struct NxXbox_CInstance {
    // 0x54: NxXbox_sScene *scene
    uint8_t unk[0x54];
    NxXbox_sScene *scene; // 0x54
} NxXbox_CInstance;

typedef struct Nx_CXboxGeom {
    // 0x34: NxXbox_sMesh **mesh_array
    // 0x38: int num_mesh
    // 0x44: NxXbox_CInstance *instance
    uint8_t unk[0x34];
    NxXbox_sMesh **meshes; // 0x34
    int num_meshes; // 0x38
    uint8_t unk2[0x8];
    NxXbox_CInstance *instance; // 0x44
} Nx_CXboxGeom;

// void Nx_CXboxGeom_plat_set_color(Nx_CXboxGeom *this, Image_RGBA color);
void Nx_CXboxGeom_plat_set_secondary_color(Nx_CXboxGeom *this, Image_RGBA color);

#endif
