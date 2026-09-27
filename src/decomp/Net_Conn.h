#ifndef _NET_CONN_H_
#define _NET_CONN_H_

#include <stdint.h>

struct Net_App;

typedef struct Net_Conn {
    uint8_t unk[0x54];
    uint8_t *read_buffer; // 0x54
    uint8_t unk2[0xc];
    struct Net_App *app; // 0x64
} Net_Conn;

#endif
