#ifndef _DECOMP_NX_CXBOXGEOM_
#define _DECOMP_NX_CXBOXGEOM_

typedef struct NxXbox_sMaterial {
    uint8_t wip;
} NxXbox_sMaterial;

typedef struct NxXbox_sMesh {
    uint8_t wip;
    // 0x18: uint32_t flags
    // 0x28: (macos): NxXbox_sMaterial *material
    // 0x78: float material_color_override_0
    // 0x7c: float material_color_override_1
    // 0x80: float material_color_override_2
} NxXbox_sMesh;

typedef struct NxXbox_sScene {
    uint8_t wip;
    // 0x18: HashTable<Material> materials?
    // 0x1c: NxXbox_sMesh **meshes
    // 0x20: uint32_t num_mesh_entries
    // 0x28: NxXbox_sMesh **more_meshes?
    // 0x2c: uint32_t num_more_meshes?
} NxXbox_sScene;

typedef struct NxXbox_CInstance {
    uint8_t wip;
    // 0x54: NxXbox_sScene *scene
} NxXbox_CInstance;

typedef struct Nx_CXboxGeom {
    uint8_t wip;
    // 0x34: NxXbox_sMesh **mesh_array
    // 0x38: int num_mesh
    // 0x44: NxXbox_CInstance *instance
} Nx_CXboxGeom;

#endif
