#ifndef _OBJ_CSKATERPAD_H_
#define _OBJ_CSKATERPAD_H_

#include "decomp/Obj_CSkaterButton.h"

// offsets relative to CSkater:
// 0x780 up
// 0x7a4 down
// 0x7c8 left
// 0x7ec right
// 0x810 l1
// 0x834 l2
// 0x858 r1
// 0x87c r2
// 0x8a0 circle
// 0x8c4 square
// 0x8e8 triangle
// 0x90c x
// 0x930 start?
// 0x954 select?

typedef struct Obj_CSkaterPad {
    // ref: CSkaterPad::GetButton (0x004b76e0)
    Obj_CSkaterButton up; // 0x0
    Obj_CSkaterButton down; // 0x24
    Obj_CSkaterButton left; // 0x48
    Obj_CSkaterButton right; // 0x6c
    Obj_CSkaterButton l1; // 0x90
    Obj_CSkaterButton l2; // 0xb4
    Obj_CSkaterButton r1; // 0xd8
    Obj_CSkaterButton r2; // 0xfc
    Obj_CSkaterButton circle; // 0x120
    Obj_CSkaterButton square; // 0x144
    Obj_CSkaterButton triangle; // 0x168
    Obj_CSkaterButton x; // 0x18c
    Obj_CSkaterButton start; // 0x1b0, unsure if start?
    Obj_CSkaterButton select; // 0x1d4, unsure if select?
} Obj_CSkaterPad;

#endif
