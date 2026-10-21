#include "decomp/Obj_CSkater.h"

#include "decomp/common.h"

void Obj_CSkater_UpdateCamera(Obj_CSkater *this, uint8_t unk) {
    static void (__fastcall *_UpdateCamera)(Obj_CSkater *, unused_t, uint8_t) = (void *)0x004c86c0;
    _UpdateCamera(this, UNUSED, unk);
}
