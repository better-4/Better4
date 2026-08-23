#ifndef _OBJ_CSKATER_H_
#define _OBJ_CSKATER_H_

#include <stdint.h>

// Forward declarations
struct Obj_CSkaterCam;

typedef struct Obj_CSkater {
    uint8_t unk[0x97a];
    uint8_t input_disabled; // 0x97a
    uint8_t unk2[0x2e49];
    uint32_t camera_control_flag; // 0x37c4
    uint8_t unk3[0xc];
    struct Obj_CSkaterCam *camera; // 0x37d4
} Obj_CSkater;

#endif
