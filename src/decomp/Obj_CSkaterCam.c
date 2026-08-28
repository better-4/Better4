#include "decomp/Obj_CSkaterCam.h"
#include "decomp/common.h"

void Obj_CSkaterCam_SetMode(Obj_CSkaterCam *this, uint32_t mode, float unk) {
    static void (__fastcall* _SetMode)(Obj_CSkaterCam *, unused_t, uint32_t, float) = (void *)0x004d9bf0;
    _SetMode(this, UNUSED, mode, unk);
}

void Obj_CSkaterCam_SetSkater(Obj_CSkaterCam *this, struct Obj_CSkater *skater) {
    static void(__fastcall* _SetSkater)(Obj_CSkaterCam *, unused_t, struct Obj_CSkater *) = (void *)0x004dc310;
    _SetSkater(this, UNUSED, skater);
}

struct Obj_CSkater *Obj_CSkaterCam_GetSkater(Obj_CSkaterCam *this) {
    static struct Obj_CSkater *(__fastcall* _GetSkater)(Obj_CSkaterCam *) = (void *)0x004dc320;
    return _GetSkater(this);
}

void Obj_CSkaterCam_EnableInputHandler(Obj_CSkaterCam *this, uint8_t unk) {
    static void(__fastcall* _EnableInputHandler)(Obj_CSkaterCam *, unused_t, uint8_t unk) = (void *)0x004d9b80;
    _EnableInputHandler(this, UNUSED, unk);
}
