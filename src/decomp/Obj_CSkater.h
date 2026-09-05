#ifndef _OBJ_CSKATER_H_
#define _OBJ_CSKATER_H_

#include "decomp/CFeeler.h"
#include "decomp/Mth_Matrix.h"
#include "decomp/Mth_Vector.h"
#include "decomp/Obj_CCompositeObject.h"

#include <stdint.h>

// Forward declarations
struct Obj_CSkaterCam;

typedef struct Obj_CSkater {
    uint8_t unk[0x634];
    Obj_CCompositeObject *object; // 0x634
    uint8_t unk3[0x342];
    uint8_t input_disabled; // 0x97a
    uint8_t unk4[0x2be5];
    // XXX (ellie): i don't actually know how big CFeeler is; if it increases in size this will break
    CFeeler feeler; // 0x3560, size 0x9c
    uint8_t unk5[0x184];
    Mth_Vector current_normal; // 0x3780, size 0x10
    uint8_t unk6[0x34];
    uint32_t camera_control_flag; // 0x37c4
    uint8_t unk7[0xc];
    struct Obj_CSkaterCam *camera; // 0x37d4
} Obj_CSkater;

#endif
