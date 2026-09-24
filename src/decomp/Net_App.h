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
    uint8_t msg_id,
    uint32_t len,
    void *data,
    int priority,
    int queue_type, // ?
    uint8_t group_id, // ?
    uint8_t singular, // ?
    int delay // ?
);

void Net_App_EnqueueMessageToServer(
    Net_App *this,
    uint8_t msg_id,
    uint32_t len,
    void *data,
    int priority,
    int queue_type, // ?
    uint8_t group_id, // ?
    uint8_t singular, // ?
    int delay // ?
);

#endif
