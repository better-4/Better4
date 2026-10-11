#ifndef _OBJ_CSKATER_H_
#define _OBJ_CSKATER_H_

#include "decomp/CFeeler.h"
#include "decomp/Mth_Matrix.h"
#include "decomp/Mth_Vector.h"
#include "decomp/Obj_CCompositeObject.h"
#include "decomp/Obj_CSkaterPad.h"

#include <stdint.h>

// Forward declarations
struct Obj_CSkaterCam;

typedef struct Obj_CSkater {
    uint8_t unk[0x634];
    Obj_CCompositeObject *object; // 0x634
    uint8_t unk2[0x148];
    Obj_CSkaterPad pad; // 0x780, size 0x1f8
    uint8_t unk3[2];
    uint8_t input_disabled; // 0x97a
    uint8_t unk4[0x1db9];
    uint8_t doing_balance_trick; // 0x2734
    uint8_t unk5[0xe2b];
    // XXX (ellie): i don't actually know how big CFeeler is; if it increases in size this will break
    CFeeler feeler; // 0x3560, size 0x9c
    uint8_t unk6[0x184];
    Mth_Vector current_normal; // 0x3780, size 0x10
    uint8_t unk7[0x34];
    uint32_t view_mode; // 0x37c4
    uint8_t unk8[0xc];
    struct Obj_CSkaterCam *camera; // 0x37d4
} Obj_CSkater;

#endif
