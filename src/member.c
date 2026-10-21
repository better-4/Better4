#include "member.h"

#include "decomp/common.h"
#include "decomp/Obj_CSkater.h"
#include "decomp/Gfx_Camera.h"

#include "partymod-thps4/src/patch.h"

#include <stdint.h>

#define THPS4_MEMBERFUNC_LIST_START 0x005ad670
#define THPS4_NUM_MEMBERFUNCS 0x1b2
#define BETTER4_NUM_MEMBERFUNCS 2
#define NUM_MEMBERFUNCS (THPS4_NUM_MEMBERFUNCS + BETTER4_NUM_MEMBERFUNCS)

char *member_funcs[NUM_MEMBERFUNCS];

void initMemberFuncs() {
	// Copy all member functions from the THPS4 list to our `member_funcs`
    memcpy(&member_funcs, THPS4_MEMBERFUNC_LIST_START, sizeof(char *) * THPS4_NUM_MEMBERFUNCS);
}

int member_func_index = THPS4_NUM_MEMBERFUNCS;
void addMemberFunc(const char *name) {
    member_funcs[member_func_index++] = name;
}

void addMemberFuncs() {
    addMemberFunc("DoingBalanceTrick");
    addMemberFunc("PlaceBeforeCamera");
}

void printMemberFuncs() {
    // sanity check: verify we registered exactly the # of member funcs we reserved
    if (member_func_index != NUM_MEMBERFUNCS) {
        logWarning("WARNING: registered %d member functions, expected %d", member_func_index, NUM_MEMBERFUNCS);
    }

    // logDebug("Printing member functions we own");
    // for (int i = 0; i < NUM_MEMBERFUNCS; i++) {
    //     logDebug("%d: %s", i, member_funcs[i]);
    // }
}

uint32_t PlaceBeforeCamera(Obj_CSkater *this) {
    Gfx_Camera *cam = (Gfx_Camera *)this->camera;
    Mth_Vector *cam_pos = Gfx_Camera_GetPos(cam);
    Mth_Matrix *cam_mat = Gfx_Camera_GetMatrix(cam);

    Mth_Vector scaled_cam_mat_z = { 0 };
    Mth_Vector_Assign(&this->object->pos, cam_pos); // pos = cam_pos
    Mth_Vector_Mult(&scaled_cam_mat_z, &cam_mat->z, 144); // scaled_cam_mat_z = cam_mat.z * feet(12)
    Mth_Vector_Sub(&this->object->pos, &this->object->pos, &scaled_cam_mat_z); // pos -= scaled_cam_mat_z
    Mth_Vector_Assign(&this->object->old_pos, &this->object->pos); // old_pos = pos

    Mth_Matrix_Assign(&this->object->matrix, cam_mat); // matrix = cam_mat
    Mth_Vector_Mult(&this->object->matrix.z, &this->object->matrix.z, -1.0); // matrix.z = -matrix.z
    Mth_Vector_Mult(&this->object->matrix.x, &this->object->matrix.x, -1.0); // matrix.x = -matrix.x

    Mth_Matrix_Assign(&this->object->lerping_matrix, &this->object->matrix);  // ResetLerpingMatrix

    Mth_Vector new_velocity = { 0 };
    Mth_Vector_Mult(&new_velocity, &cam_mat->z, -1.0); // new_velocity = -cam_mat.z
    new_velocity.y = 0.0; // new_velocity.y = 0
    Mth_Vector_Assign(&this->object->velocity, &new_velocity); // vel = new_velocity
    Mth_Vector_NormalizeLength(&this->object->velocity, 10); // vel.Normalize(10)

    Obj_CSkater_UpdateCamera(this, 1);

    return 1;
}

uint32_t __fastcall Obj_CSkater_CallMemberFunction(Obj_CSkater *this, unused_t _, uint32_t checksum, void *unk, uint32_t *unk2) {
    static uint32_t(__fastcall* _CallMemberFunction)(Obj_CSkater *, unused_t, uint32_t, void *, uint32_t *) = (void *)0x004d08e0;

    switch (checksum) {
        case 0x6df82e70/*DoingBalanceTrick*/:
            logDebug("Obj::CSkater::CallMemberFunction: DoingBalanceTrick=%d", this->doing_balance_trick);
            return 1;
            // return this->doing_balance_trick;
        case 0xd38e8b6c/*PlaceBeforeCamera*/:
            logDebug("Obj::CSkater::CallMemberFunction: PlaceBeforeCamera");
            PlaceBeforeCamera(this);
            return 1;
    }

    return _CallMemberFunction(this, UNUSED, checksum, unk, unk2);
}

void patchMemberFunctions() {
	initMemberFuncs();
	addMemberFuncs();
	printMemberFuncs();
    // Script::GetNumMemberFunctions (0x00511f50)
    patchDWord(0x00511f50 + 1, NUM_MEMBERFUNCS);
    // SkateScript::Init (0x00512170)
    patchDWord(0x00512190 + 1, &member_funcs);

    patchCall(0x004d07c3, (void *)Obj_CSkater_CallMemberFunction);
}
