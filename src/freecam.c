#include "freecam.h"

#include "decomp/CScript.h"
#include "decomp/Gfx_Camera.h"
#include "decomp/Inp_Manager.h"
#include "decomp/Mth_Matrix.h"
#include "decomp/Mth_Vector.h"
#include "decomp/Obj_CSkater.h"
#include "decomp/Net_Dispatcher.h"
#include "log.h"

static int freecam_controls_index = 0;

static float freecam_move_speed = 5.0;
static float freecam_look_speed = 0.03;

void print_vector(Mth_Vector *vec) {
    logDebug("(%f, %f, %f, %f)", vec->x, vec->y, vec->z, vec->w);
}

void print_matrix(Mth_Matrix *mat) {
    logDebug("[ %f %f %f %f  ", mat->x.x, mat->x.y, mat->x.z, mat->x.w);
    logDebug("  %f %f %f %f  ", mat->y.x, mat->y.y, mat->y.z, mat->y.w);
    logDebug("  %f %f %f %f  ", mat->z.x, mat->z.y, mat->z.z, mat->z.w);
    logDebug("  %f %f %f %f ]", mat->w.x, mat->w.y, mat->w.z, mat->w.w);
}

void translate_local(Gfx_Camera *camera, float x, float y, float z) {
    Mth_Matrix *mat = Gfx_Camera_GetMatrix(camera);
    Mth_Vector *pos = Gfx_Camera_GetPos(camera);

    Mth_Vector trans = { 0 };
    trans.x = x;
    trans.y = y;
    trans.z = z;

    Mth_Vector out = { 0 };
    Mth_Matrix_MultVec(&out, mat, &trans); // out = trans * mat
    Mth_Vector_Add(&out, &out, pos); // out += pos

    Gfx_Camera_SetPos(camera, &out);
}

void rotate_local(Gfx_Camera *camera, Mth_Vector *axis, float angle) {
    Mth_Matrix *mat = Gfx_Camera_GetMatrix(camera);
    Mth_Vector *pos = Gfx_Camera_GetPos(camera);

    Mth_Matrix rot = { 0 };
    Mth_Matrix_CreateRotateMatrix(&rot, axis, angle);

    Mth_Matrix out = { 0 };
    Mth_Matrix_Mult(&out, &rot, mat);

    Gfx_Camera_SetMatrix(camera, &out);
}

void rotate_global(Gfx_Camera *camera, Mth_Vector *rot) {
    Mth_Matrix *mat = Gfx_Camera_GetMatrix(camera);
    Mth_Vector *pos = Gfx_Camera_GetPos(camera);

    Mth_Matrix out = { 0 };
    Mth_Matrix_Assign(&out, mat);

    if (rot->x) {
        Mth_Matrix_RotateX(&out, &out, rot->x);
    }
    if (rot->y) {
        Mth_Matrix_RotateY(&out, &out, rot->y);
    }
    if (rot->z) {
        Mth_Matrix_RotateZ(&out, &out, rot->z);
    }

    Gfx_Camera_SetMatrix(camera, &out);
}

void move_xy(Gfx_Camera *camera, float dx, float dy) {
    translate_local(camera, dx * freecam_move_speed, 0.0, dy * freecam_move_speed);
}

void move_z(Gfx_Camera *camera, float dz) {
    translate_local(camera, 0.0, dz * freecam_move_speed, 0.0);
}

void rotate_x(Gfx_Camera *camera, float dx) {
    Mth_Vector rot = { 0 };
    rot.y = dx * -freecam_look_speed;
    rotate_global(camera, &rot);
}

void rotate_y(Gfx_Camera *camera, float dy) {
    Mth_Vector axis = { 0 };
    // y-axis stick movement rotates around the x axis
    axis.x = 1;
    rotate_local(camera, &axis, dy * -freecam_look_speed);
}

void rotate_z(Gfx_Camera *camera, float dz) {
    Mth_Vector axis = { 0 };
    axis.z = 1;
    rotate_local(camera, &axis, dz * -freecam_look_speed);
}

void toggle_hide_hud() {
    Script_RunScript(0xeb998eb2/*better4_freecam_toggle_hidehud*/, 0, 0, 0, 0);
}

void toggle_hide_names() {
    Script_RunScript(0x529f3807/*better4_freecam_toggle_hidenames*/, 0, 0, 0, 0);
}

void increase_move_speed() {
    logDebug("increase_move_speed:");
    Script_RunScript(0xd483e07a/*better4_freecam_increase_move_speed*/, 0, 0, 0, 0);
}

void decrease_move_speed() {
    Script_RunScript(0x1e7f032b/*better4_freecam_decrease_move_speed*/, 0, 0, 0, 0);
}

void increase_look_speed() {
    Script_RunScript(0x88ada19/*better4_freecam_increase_look_speed*/, 0, 0, 0, 0);
}

void decrease_look_speed() {
    Script_RunScript(0xc2763948/*better4_freecam_decrease_look_speed*/, 0, 0, 0, 0);
}

void increase_fov() {
    Script_RunScript(0x630b25d6/*better4_freecam_increase_fov*/, 0, 0, 0, 0);
}

void decrease_fov() {
    Script_RunScript(0xde85a37c/*better4_freecam_decrease_fov*/, 0, 0, 0, 0);
}

void do_better_freecam_logic(Gfx_Camera *camera) {
    Inp_Manager *inp_manager = Inp_Manager_Instance();
    Inp_Data *inp_data = &inp_manager->servers[0].data;

    int left_dx = inp_data->analog.left_x - 0x80;
    int left_dy = inp_data->analog.left_y - 0x80;
    int right_dx = inp_data->analog.right_x - 0x80;
    int right_dy = inp_data->analog.right_y - 0x80;

    if (left_dx || left_dy) {
        move_xy(camera, (float)left_dx / 0x80, (float)left_dy / 0x80);
    }

    if (right_dx) {
        rotate_x(camera, (float)right_dx / 0x80);
    }

    if (right_dy) {
        rotate_y(camera, (float)right_dy / 0x80);
    }

    uint32_t r2_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_R2);
    uint32_t l2_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_L2);

    if (r2_pressed && !l2_pressed) {
        move_z(camera, 1.0);
    } else if (l2_pressed && !r2_pressed) {
        move_z(camera, -1.0);
    }

    uint32_t r1_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_R1);
    uint32_t l1_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_L1);

    if (r1_pressed && !l1_pressed) {
        rotate_z(camera, 1.0);
    } else if (l1_pressed && !r1_pressed) {
        rotate_z(camera, -1.0);
    }

    uint32_t up_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_UP);
    if (up_pressed) {
        increase_move_speed();
    }

    uint32_t down_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_DOWN);
    if (down_pressed) {
        decrease_move_speed();
    }

    uint32_t right_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_RIGHT);
    if (right_pressed) {
        increase_look_speed();
    }

    uint32_t left_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_LEFT);
    if (left_pressed) {
        decrease_look_speed();
    }

    uint32_t x_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_X);
    if (x_pressed) {
        increase_fov();
    }

    uint32_t circle_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_CIRCLE);
    if (circle_pressed) {
        decrease_fov();
    }

    uint32_t square_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_SQUARE);
    if (square_pressed) {
        toggle_hide_hud();
    }

    uint32_t triangle_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_TRIANGLE);
    if (triangle_pressed) {
        toggle_hide_names();
    }
}

void do_vanilla_freecam_logic(Gfx_Camera *camera) {
    Inp_Manager *inp_manager = Inp_Manager_Instance();
    Inp_Data *inp_data = &inp_manager->servers[0].data;

    int right_dx = inp_data->analog.right_x - 0x80;
    int right_dy = inp_data->analog.right_y - 0x80;

    if (right_dx || right_dy) {
        move_xy(camera, (float)right_dx / 0x80, (float)right_dy / 0x80);
    }

    uint32_t r1_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_R1);
    uint32_t r2_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_R2);

    if (r1_pressed && !r2_pressed) {
        move_z(camera, 1.0);
    } else if (r2_pressed && !r1_pressed) {
        move_z(camera, -1.0);
    }

    uint32_t l1_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_L1);
    uint32_t l2_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_L2);

    if (l1_pressed && !l2_pressed) {
        rotate_z(camera, 1.0);
    } else if (l2_pressed && !l1_pressed) {
        rotate_z(camera, -1.0);
    }

    uint32_t up_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_UP);
    uint32_t down_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_DOWN);

    if (up_pressed && !down_pressed) {
        rotate_y(camera, 1.0);
    } else if (down_pressed && !up_pressed) {
        rotate_y(camera, -1.0);
    }

    uint32_t left_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_LEFT);
    uint32_t right_pressed = Inp_Data_ButtonPressed(inp_data, FLAG_D_RIGHT);

    if (left_pressed && !right_pressed) {
        rotate_x(camera, -1.0);
    } else if (right_pressed && !left_pressed) {
        rotate_x(camera, 1.0);
    }

    uint32_t square_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_SQUARE);
    if (square_pressed) {
        toggle_hide_hud();
    }

    uint32_t triangle_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_TRIANGLE);
    if (triangle_pressed) {
        toggle_hide_names();
    }

    uint32_t x_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_X);
    if (x_pressed) {
        decrease_move_speed();
        decrease_look_speed();
    }

    uint32_t circle_pressed = Inp_Data_ButtonJustPressed(inp_data, FLAG_D_CIRCLE);
    if (circle_pressed) {
        increase_move_speed();
        increase_look_speed();
    }
}

void do_freecam_logic(Obj_CSkater *this) {
    switch (freecam_controls_index) {
    case 0:
        do_better_freecam_logic((Gfx_Camera *)this->camera);
        break;
    case 1:
        do_vanilla_freecam_logic((Gfx_Camera *)this->camera);
        break;
    }

    Script_RunScript(0x622f4d7e/*better4_freecam_check_end_run*/, 0, 0, 0, 0);
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

int __cdecl CFunc_SetFreecamControls(CStruct *params) {
	float index;
	if (!CStruct_GetFloat(params, 0x7f8c98fe/*index*/, &index, 0)) {
		logWarning("SetFreecamControls missing param \"index\" (0x7f8c98fe)");
		return 0;
	}

	freecam_controls_index = (int)index;
	logDebug("Set freecam_controls_index=%d", freecam_controls_index);

    return 1;
}

int __cdecl CFunc_SetFreecamMoveSpeed(CStruct *params) {
	float value;
	if (!CStruct_GetFloat(params, 0xe288a7cb/*value*/, &value, 0)) {
		logWarning("SetFreecamMoveSpeed missing param \"value\" (0xe288a7cb)");
		return 0;
	}

    freecam_move_speed = value * 5;
	logDebug("Set freecam_move_speed=%f", freecam_move_speed);

    return 1;
}

int __cdecl CFunc_SetFreecamLookSpeed(CStruct *params) {
	float value;
	if (!CStruct_GetFloat(params, 0xe288a7cb/*value*/, &value, 0)) {
		logWarning("SetFreecamLookSpeed missing param \"value\" (0xe288a7cb)");
		return 0;
	}

    freecam_look_speed = value * 0.03;
	logDebug("Set freecam_look_speed=%f", freecam_look_speed);

    return 1;
}
