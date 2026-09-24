#ifndef _NET_APP_H_
#define _NET_APP_H_

#include <stdint.h>
#include <winsock2.h>

// Forward declarations
struct Net_Dispatcher;

typedef void(*ForeignPacketHandler)(char *packet, int len, struct sockaddr* sender);

typedef struct Net_App {
    uint8_t unk[0x1428];
    SOCKET socket; // 0x1428
    uint8_t unk2[0xb2c];
    ForeignPacketHandler foreign_packet_handler; // 0x1f58
} Net_App;

struct Net_Dispatcher *Net_App_GetDispatcher(Net_App *this);

void Net_App_EnqueueMessage(
    Net_App *this,
    void *handle,
    uint8_t unk1,
    uint32_t unk2,
    uint32_t *unk3,
    int unk4,
    int unk5,
    uint8_t unk6,
    uint8_t unk7,
    int unk8
);
void Net_App_EnqueueMessageToServer(
    Net_App *this,
    uint8_t unk1,
    uint32_t unk2,
    uint32_t *unk3,
    int unk4,
    int unk5,
    uint8_t unk6,
    uint8_t unk7,
    int unk8
);

#endif
