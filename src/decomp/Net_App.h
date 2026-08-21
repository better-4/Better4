#ifndef _NET_APP_H_
#define _NET_APP_H_

#include <stdint.h>
#include <winsock2.h>

typedef void(*ForeignPacketHandler)(char *packet, int len, struct sockaddr* sender);

typedef struct Net_App {
    uint8_t unk[0x1428];
    SOCKET socket; // 0x1428
    uint8_t unk2[0xb2c];
    ForeignPacketHandler foreign_packet_handler; // 0x1f58
} Net_App;

#endif
