#include "decomp/Nx_CXboxGeom.h"

#include "decomp/common.h"
#include "log.h"

void set_mesh_color(NxXbox_sMesh *mesh, Image_RGBA color) {
    mesh->flags |= 0x4; // material color override flag
    mesh->material_color_override_0 = (float)color.r / 255.0;
    mesh->material_color_override_1 = (float)color.g / 255.0;
    mesh->material_color_override_2 = (float)color.b / 255.0;
}

void set_secondary_mesh_color(NxXbox_sMesh *mesh, Image_RGBA color) {
    NxXbox_sMaterial *mat = mesh->material;

    int is_secondary = 0;
    for (int i = 0; i < mat->num_passes; i++) {
        if (mat->flags[i] & MATFLAGS_B4_SECONDARY) {
            is_secondary = 1;
            break;
        }
    }

    if (is_secondary) {
        set_mesh_color(mesh, color);
    }
}

// void Nx_CXboxGeom_plat_set_color(Nx_CXboxGeom *this, Image_RGBA color) {
//     NxXbox_CInstance *instance = this->instance;
//
//     if (instance) {
//         NxXbox_sScene *scene = instance->scene;
//
//         for (int i = 0; i < scene->num_meshes; i++) {
//             set_mesh_color(scene->meshes[i], color);
//         }
//
//         for (int i = 0; i < scene->num_more_meshes; i++) {
//             set_mesh_color(scene->more_meshes[i], color);
//         }
//     } else if (this->meshes) {
//         for (int i = 0; i < this->num_meshes; i++) {
//             set_mesh_color(this->meshes[i], color);
//         }
//     }
// }

void Nx_CXboxGeom_plat_set_secondary_color(Nx_CXboxGeom *this, Image_RGBA color) {
    NxXbox_CInstance *instance = this->instance;

    if (instance) {
        NxXbox_sScene *scene = instance->scene;

        // TODO: iterate through more_meshes if needed?
        for (int i = 0; i < scene->num_meshes; i++) {
            set_secondary_mesh_color(scene->meshes[i], color);
        }

        for (int i = 0; i < scene->num_more_meshes; i++) {
            set_secondary_mesh_color(scene->more_meshes[i], color);
        }
    } else {
        for (int i = 0; i < this->num_meshes; i++) {
            set_secondary_mesh_color(this->meshes[i], color);
        }
    }
}
