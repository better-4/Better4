#include "decomp/NxXbox.h"

#include "decomp/common.h"

typedef uint32_t(__stdcall *SetRenderStateFn)(void *device, uint32_t state, uint32_t value);

void *NxXbox_GetDevice() {
    return *(void **)0x00aab478;
}

void NxXbox_SetDeviceRenderState(uint32_t state, uint32_t value) {
    void *device = NxXbox_GetDevice();
    void **vtable;

    if (!device) {
        return;
    }

    vtable = *(void ***)device;
    ((SetRenderStateFn)vtable[50])(device, state, value);
}

void NxXbox_sMaterial_Submit(void *material) {
    static void(__fastcall * _Submit)(void *, unused_t) = (void *)0x0043bbd0;
    _Submit(material, UNUSED);
}
