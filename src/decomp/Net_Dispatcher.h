#ifndef _NET_DISPATCHER_H_
#define _NET_DISPATCHER_H_

#include <stdint.h>

// Forward declarations
struct Net_App;
struct Net_Conn;

typedef void Net_Dispatcher;

typedef struct Net_MsgHandlerContext {
    char *msg;
    uint8_t msg_id;
    unsigned long msg_len;
    struct Net_App* app;
    struct Net_Conn* conn;
    int flags;
    void* data;
} Net_MsgHandlerContext;

typedef int (__cdecl *Handler)(Net_MsgHandlerContext *);

void *Net_Dispatcher_AddHandler(Net_Dispatcher *this, uint8_t msg_id, Handler *handler, int flags, void *data, int priority);

#endif
