#include "freecam.h"

#include "decomp/Mth_Matrix.h"
#include "decomp/Mth_Vector.h"

void print_vector(Mth_Vector vec) {
    logDebug("(%f, %f, %f, %f)", vec.x, vec.y, vec.z, vec.w);
}

void print_matrix(Mth_Matrix mat) {
    logDebug("[ %f %f %f %f  ", mat.x.x, mat.x.y, mat.x.z, mat.x.w);
    logDebug("  %f %f %f %f  ", mat.y.x, mat.y.y, mat.y.z, mat.y.w);
    logDebug("  %f %f %f %f  ", mat.z.x, mat.z.y, mat.z.z, mat.z.w);
    logDebug("  %f %f %f %f ]", mat.w.x, mat.w.y, mat.w.z, mat.w.w);
}

void translate_local(Gfx_Camera *camera, Mth_Vector *trans) {
    Mth_Matrix *mat = Gfx_Camera_GetMatrix(camera);
    Mth_Vector *pos = Gfx_Camera_GetPos(camera);

    Mth_Matrix_MultVec(trans, mat, trans); // trans *= mat
    Mth_Vector_Add(trans, trans, pos); // trans += pos
    Gfx_Camera_SetPos(camera, trans);
}

void rotate_local(Gfx_Camera *camera, Mth_Vector *rot) {
    Mth_Matrix *mat = Gfx_Camera_GetMatrix(camera);
    Mth_Vector *pos = Gfx_Camera_GetPos(camera);

    Mth_Matrix_RotateLocal(mat, mat, rot);
    Gfx_Camera_SetMatrix(camera, mat);
}

void do_freecam_logic(Obj_CSkater *this) {
    int elapsed_time = Tmr_ElapsedTime(last_time);
    last_time += elapsed_time;

    if (this->pad.r1.pressed && !this->pad.r2.pressed) {
        Mth_Vector trans;
        trans.y = 1.0;
        translate_local((Gfx_Camera *)this->camera, &trans);
    } else if (this->pad.r2.pressed && !this->pad.r1.pressed) {
        Mth_Vector trans;
        trans.y = -1.0;
        translate_local((Gfx_Camera *)this->camera, &trans);
    }

    if (this->pad.l1.pressed && !this->pad.l2.pressed) {
        Mth_Vector rot;
        rot.z = -1.0;
        rotate_local((Gfx_Camera *)this->camera, &rot);
    } else if (this->pad.l2.pressed && !this->pad.l1.pressed) {
        Mth_Vector rot;
        rot.y = 1.0;
        rotate_local((Gfx_Camera *)this->camera, &rot);
    }
}

void __fastcall Obj_CSkater_DoGameLogic(Obj_CSkater *this) {
    static void (__fastcall *_DoGameLogic)(Obj_CSkater *) = (void *)0x004c8ed0;

	if (this->view_mode > 0) {
        do_freecam_logic(this);
	} else {
		_DoGameLogic(this);
	}
}

void patchFreecam() {
	patchCall(0x004b3ee1, (void *)Obj_CSkater_DoGameLogic);
}
