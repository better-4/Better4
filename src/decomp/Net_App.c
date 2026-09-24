#include "decomp/Net_App.h"

#include "decomp/common.h"

struct Net_Dispatcher *Net_App_GetDispatcher(Net_App *this) {
    return (struct Net_Dispatcher *)((char *)this + 0xc);
}

void Net_App_EnqueueMessage(
    Net_App *this,
    void *handle,
    uint8_t msg_id,
    uint32_t len,
    void *data,
    int priority,
    int queue_type,
    uint8_t group_id,
    uint8_t singular,
    int delay
) {
    static void(__fastcall* _EnqueueMessage)(Net_App *, unused_t, void *, uint8_t, uint32_t, void *, int, int, uint8_t, uint8_t, int) = (void *)0x0042f340;
    _EnqueueMessage(this, UNUSED, handle, msg_id, len, data, priority, queue_type, group_id, singular, delay);
}

void Net_App_EnqueueMessageToServer(
    Net_App *this,
    uint8_t msg_id,
    uint32_t len,
    void *data,
    int priority,
    int queue_type,
    uint8_t group_id,
    uint8_t singular,
    int delay
) {
    static void(__fastcall* _EnqueueMessageToServer)(Net_App *, unused_t, uint8_t, uint32_t, void *, int, int, uint8_t, uint8_t, int) = (void *)0x004301f0;
    _EnqueueMessageToServer(this, UNUSED, msg_id, len, data, priority, queue_type, group_id, singular, delay);
}
