#ifndef _OBJ_CCOMPOSITEOBJECT_H_
#define _OBJ_CCOMPOSITEOBJECT_H_

#include "decomp/Mth_Matrix.h"
#include "decomp/Mth_Vector.h"

#include <stdint.h>

typedef struct Obj_CCompositeObject {
    Mth_Vector pos; // 0x0, size 0x10
    Mth_Vector old_pos; // 0x10, size 0x10
    uint8_t unk2[0x10];
    Mth_Vector velocity; // 0x30, size 0x10
    Mth_Matrix matrix; // 0x40, size 0x40
    Mth_Matrix lerping_matrix; // 0x80, size 0x40
} Obj_CCompositeObject;

#endif
