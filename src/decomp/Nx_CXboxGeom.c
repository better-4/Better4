#include "decomp/Nx_CXboxGeom.h"

#include "decomp/common.h"
#include "log.h"

// void Nx_CXboxGeom_plat_set_color(Nx_CXboxGeom *this, Image_RGBA color) {
//     static void (__fastcall *_plat_set_color)(Nx_CXboxGeom *, unused_t, Image_RGBA) = (void *)0x00448f20;
//     _plat_set_color(this, UNUSED, color);
// }

void set_mesh_color(NxXbox_sMesh *mesh, Image_RGBA color) {
    NxXbox_sMaterial *mat = mesh->material;
    mesh->flags |= 0x4; // material color override flag
    mesh->material_color_override_0 = (float)color.r / 255.0;
    mesh->material_color_override_1 = (float)color.g / 255.0;
    mesh->material_color_override_2 = (float)color.b / 255.0;
    logDebug("set_mesh_color: mat=%p checksum=%#08x num_passes=%d uv_wibble=%d", mat, mat->checksum, mat->num_passes, mat->uv_wibble);

    // for (int i = 0; i < mat->num_passes; i++) {
    //     logDebug("set_mesh_color: pass=%d flags=%x colors=(%f, %f, %f, %f)", i, mat->flags[i], mat->colors[i][0], mat->colors[i][1], mat->colors[i][2], mat->colors[i][3]);
    // }

    // if (mat->checksum == 0x1f408fd9) {
    //     mesh->flags |= 0x4; // material color override flag
    //     mesh->material_color_override_0 = (float)color.b / 255.0;
    //     mesh->material_color_override_1 = (float)color.g / 255.0;
    //     mesh->material_color_override_2 = (float)color.r / 255.0;
    //     return;
    // }
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

void Nx_CXboxGeom_plat_set_material_color(Nx_CXboxGeom *this, uint32_t mat_checksum, int pass, Image_RGBA color) {
    int success = 0;
    NxXbox_CInstance *instance = this->instance;

    if (instance) {
        NxXbox_sScene *scene = instance->scene;

        // TODO: iterate through more_meshes if needed?
        for (int i = 0; i < scene->num_meshes; i++) {
            NxXbox_sMesh *mesh = scene->meshes[i];
            NxXbox_sMaterial *material = mesh->material;
            logDebug("looking for %x, got %x", mat_checksum, material->checksum);
            if (mat_checksum == material->checksum) {
                logDebug("found material with checksum %x", mat_checksum);
                set_mesh_color(mesh, color);
                success = 1;
            }
        }

        for (int i = 0; i < scene->num_more_meshes; i++) {
            NxXbox_sMesh *mesh = scene->more_meshes[i];
            NxXbox_sMaterial *material = mesh->material;
            logDebug("looking for %x, got %x", mat_checksum, material->checksum);
            if (mat_checksum == material->checksum) {
                logDebug("found material with checksum %x", mat_checksum);
                set_mesh_color(mesh, color);
                success = 1;
            }
        }
    } else {
        for (int i = 0; i < this->num_meshes; i++) {
            NxXbox_sMesh *mesh = this->meshes[i];
            NxXbox_sMaterial *material = mesh->material;
            logDebug("looking for %x, got %x", mat_checksum, material->checksum);
            if (mat_checksum == material->checksum) {
                logDebug("found material with checksum %x", mat_checksum);
                set_mesh_color(mesh, color);
                success = 1;
            }
        }
    }

    if (!success) {
        logDebug("could not find material with checksum %x", mat_checksum);
    }
}
