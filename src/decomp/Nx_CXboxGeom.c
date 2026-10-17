#include "decomp/Nx_CXboxGeom.h"

#include "decomp/common.h"
#include "log.h"

// void Nx_CXboxGeom_plat_set_color(Nx_CXboxGeom *this, Image_RGBA color) {
//     static void (__fastcall *_plat_set_color)(Nx_CXboxGeom *, unused_t, Image_RGBA) = (void *)0x00448f20;
//     _plat_set_color(this, UNUSED, color);
// }

void set_mesh_color(NxXbox_sMesh *mesh, Image_RGBA color) {
    NxXbox_sMaterial *mat = mesh->material;
    logDebug("set_mesh_color: mat=%p checksum=%#08x name_checksum=%#08x passes=%d", mat, mat->checksum, mat->name_checksum, mat->passes);
    mesh->flags |= 0x4; // material color override flag
    mesh->material_color_override_0 = (float)color.r / 255.0;
    mesh->material_color_override_1 = (float)color.g / 255.0;
    mesh->material_color_override_2 = (float)color.b / 255.0;
}

void Nx_CXboxGeom_plat_set_color(Nx_CXboxGeom *this, Image_RGBA color) {
    NxXbox_CInstance *instance = this->instance;

    if (instance) {
        NxXbox_sScene *scene = instance->scene;

        for (int i = 0; i < scene->num_meshes; i++) {
            set_mesh_color(scene->meshes[i], color);
        }

        for (int i = 0; i < scene->num_more_meshes; i++) {
            set_mesh_color(scene->more_meshes[i], color);
        }
    } else if (this->meshes) {
        for (int i = 0; i < this->num_meshes; i++) {
            set_mesh_color(this->meshes[i], color);
        }
    }
}
