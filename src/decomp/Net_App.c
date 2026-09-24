#include "decomp/Net_App.h"

#include "decomp/common.h"

struct Net_Dispatcher *Net_App_GetDispatcher(Net_App *this) {
    return (struct Net_Dispatcher *)((char *)this + 0xc);
}

void Net_App_EnqueueMessage(
    Net_App *this,
    void *handle,
    uint8_t msg_id,
    uint32_t unk,
    uint32_t *unk2,
    int unk3,
    int unk4,
    uint8_t unk5,
    uint8_t unk6,
    int unk7
) {
    static void(__fastcall* _EnqueueMessage)(Net_App *, unused_t, void *, uint8_t, uint32_t, uint32_t *, int, int, uint8_t, uint8_t, int) = (void *)0x0042f340;
    _EnqueueMessage(this, UNUSED, handle, msg_id, unk, unk2, unk3, unk4, unk5, unk6, unk7);
}

void Net_App_EnqueueMessageToServer(
    Net_App *this,
    uint8_t msg_id,
    uint32_t unk,
    uint32_t *unk2,
    int unk3,
    int unk4,
    uint8_t unk5,
    uint8_t unk6,
    int unk7
) {
    static void(__fastcall* _EnqueueMessageToServer)(Net_App *, unused_t, uint8_t, uint32_t, uint32_t *, int, int, uint8_t, uint8_t, int) = (void *)0x004301f0;
    _EnqueueMessageToServer(this, UNUSED, msg_id, unk, unk2, unk3, unk4, unk5, unk6, unk7);
}
