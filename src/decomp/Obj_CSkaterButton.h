#ifndef _OBJ_CSKATERBUTTON_H_
#define _OBJ_CSKATERBUTTON_H_

#include <stdint.h>

typedef struct Obj_CSkaterButton {
    uint32_t pressed; // 0x0
    uint32_t pressed_time; // 0x4
    uint32_t released_time; // 0x8
    uint32_t pressure; // 0xc
    uint32_t triggered; // 0x10
    uint32_t released; // 0x14
    uint32_t checksum; // 0x18
    float debounce; // 0x1c
    uint32_t unk; // 0x20
    // sizeof: 0x24
} Obj_CSkaterButton;

#endif
