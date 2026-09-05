#include "decomp/Obj_CMovingObject.h"

#include "decomp/common.h"

uint32_t Obj_CMovingObject_FlagException(Obj_CMovingObject *this, char *name, uint8_t unk) {
    static uint32_t (__fastcall* _FlagException)(Obj_CMovingObject *, unused_t, char *, uint8_t) = (void *)0x004a9de0;
    return _FlagException(this, UNUSED, name, unk);
}

void Obj_CMovingObject_ProcessExceptions(Obj_CMovingObject *this) {
    static uint32_t (__fastcall* _ProcessExceptions)(Obj_CMovingObject *) = (void *)0x004a9b90;
    return _ProcessExceptions(this);
}
