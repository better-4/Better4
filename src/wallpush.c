#include "wallpush.h"

#include "decomp/common.h"
#include "decomp/CScript.h"
#include "decomp/CStruct.h"
#include "decomp/Mth.h"
#include "decomp/Mth_Matrix.h"
#include "decomp/Mth_Vector.h"
#include "decomp/Obj_CMovingObject.h"
#include "decomp/Obj_CSkater.h"
#include "decomp/Tmr.h"
#include "input.h"
#include "log.h"

#include "partymod-thps4/src/patch.h"

#include <math.h>
#include <stdint.h>
#include <stdlib.h>

static int wallpush_enabled = 0;
static uint8_t flag_cancel_wallpush = 0;
static int last_wallpush_time = 0;

uint8_t check_wallpush(Obj_CSkater *this) {
    if (!this->pad.triangle.pressed) {
        return 0;
    }

    float wallpush_cooldown = Script_GetFloat(0x0017d543/*Physics_Disallow_Rewallpush_Duration*/);
    if (Tmr_ElapsedTime(last_wallpush_time) < wallpush_cooldown) {
        logDebug("check_wallpush: on cooldown");
        return 0;
    }

    float wallbounce_angle = Script_GetFloat(0x1483fd01/*Wall_Bounce_Dont_Slow_Angle*/);
    float wallbounce_angle_rad = Mth_DegToRad(wallbounce_angle - 1.0f);

    if (Mth_DotProduct(&this->object->matrix.z, &this->feeler.normal) >= -sinf(wallbounce_angle_rad)) {
        return 0;
    }

    Obj_CMovingObject_FlagException((Obj_CMovingObject *)this, "Wallpush", 0);
    Obj_CMovingObject_ProcessExceptions((Obj_CMovingObject *)this);

    if (flag_cancel_wallpush) {
        logDebug("check_wallpush: got flag_cancel_wallpush");
        flag_cancel_wallpush = 0;
        return 0;
    }

    Mth_Vector new_velocity = { 0 };
    Mth_Vector_Mult(&new_velocity, &this->feeler.normal, 2.0f * Mth_DotProduct(&this->object->velocity, &this->feeler.normal)); // new_velocity = normal * dot
    Mth_Vector_Sub(&new_velocity, &this->object->velocity, &new_velocity); // new_velocity = object.velocity - new_velocity

    float speed = Mth_Vector_Length(&new_velocity);
	if (speed > 0.001f) {
        float min_exit_speed = Script_GetFloat(0xb78542c2/*Physics_Wallpush_Min_Exit_Speed*/);
        float speed_loss = Script_GetFloat(0x1112fb1c/*Physics_Wallpush_Speed_Loss*/);
        float mult = fmax(min_exit_speed, speed - speed_loss) / speed;
        Mth_Vector_Mult(&new_velocity, &new_velocity, mult); // new_velocity *= mult
    } else {
        float min_exit_speed = Script_GetFloat(0xb78542c2/*Physics_Wallpush_Min_Exit_Speed*/);
        Mth_Vector_Mult(&new_velocity, &this->object->matrix.z, min_exit_speed); // new_velocity = mat.z * min_exit_speed
    }

    Mth_Vector_RotateToPlane(&new_velocity, &this->current_normal);

    Mth_Vector_Assign(&this->object->velocity, &new_velocity);

    Mth_Vector_Assign(&this->object->matrix.z, &new_velocity);
    Mth_Vector_Normalize(&this->object->matrix.z);
    Mth_Vector_Assign(&this->object->matrix.y, &this->current_normal);
    Mth_CrossProduct(&this->object->matrix.x, &this->object->matrix.y, &this->object->matrix.z);
    Mth_Matrix_Assign(&this->object->lerping_matrix, &this->object->matrix);

    last_wallpush_time = Tmr_GetTime();

    return 1;
}

void __fastcall Obj_CSkater_BounceOffWall(Obj_CSkater *this, unused_t _, Mth_Vector normal, uint8_t unk) {
    static void (__fastcall* _BounceOffWall)(Obj_CSkater *, unused_t, Mth_Vector, uint8_t) = (void *)0x004bd370;

    if (wallpush_enabled && check_wallpush(this)) {
        return;
    }

    _BounceOffWall(this, UNUSED, normal, unk);
}

int __cdecl CFunc_CancelWallpush(CStruct *params) {
    logDebug("CFunc_CancelWallpush: setting flag_cancel_wallpush=1");
    flag_cancel_wallpush = 1;
    return 1;
}

int __cdecl CFunc_SetWallpushEnabled(CStruct *params) {
	float enabled;
	if (!CStruct_GetFloat(params, 0xaf06447b/*enabled*/, &enabled, 0)) {
		logWarning("SetWallpushEnabled missing param \"enabled\" (0xaf06447b)");
		return 0;
	}
    wallpush_enabled = (int)enabled;
    logInfo("Set wallpush_enabled=%d", wallpush_enabled);
    return 1;
}

void patchWallpush() {
    patchCall(0x004bdde3, (void *)Obj_CSkater_BounceOffWall);
}
