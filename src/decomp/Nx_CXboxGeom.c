#include "decomp/Nx_CXboxGeom.h"

#include "decomp/common.h"

// void Nx_CXboxGeom_plat_set_color(Nx_CXboxGeom *this, Image_RGBA color) {
//     static void (__fastcall *_plat_set_color)(Nx_CXboxGeom *, unused_t, Image_RGBA) = (void *)0x00448f20;
//     _plat_set_color(this, UNUSED, color);
// }

void Nx_CXboxGeom_plat_set_color(Nx_CXboxGeom *this, Image_RGBA color) {
    NxXbox_CInstance *instance = this->instance;

    if (instance) {
        NxXbox_sScene *scene = instance->scene;

        for (int i = 0; i < scene->num_meshes; i++) {
            NxXbox_sMesh *mesh = scene->meshes[i];
            mesh->flags |= 0x4; // material color override flag
            mesh->material_color_override_0 = (float)color.r / 255.0;
            mesh->material_color_override_1 = (float)color.g / 255.0;
            mesh->material_color_override_2 = (float)color.b / 255.0;
        }

        for (int i = 0; i < scene->num_more_meshes; i++) {
            NxXbox_sMesh *mesh = scene->more_meshes[i];
            mesh->flags |= 0x4; // material color override flag
            mesh->material_color_override_0 = (float)color.r / 255.0;
            mesh->material_color_override_1 = (float)color.g / 255.0;
            mesh->material_color_override_2 = (float)color.b / 255.0;
        }
    } else if (this->meshes) {
        for (int i = 0; i < this->num_meshes; i++) {
            NxXbox_sMesh *mesh = this->meshes[i];
            mesh->flags |= 0x4; // material color override flag
            mesh->material_color_override_0 = (float)color.r / 255.0;
            mesh->material_color_override_1 = (float)color.g / 255.0;
            mesh->material_color_override_2 = (float)color.b / 255.0;
        }
    }
}
