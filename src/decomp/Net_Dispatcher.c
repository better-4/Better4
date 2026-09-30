#include "decomp/Net_Dispatcher.h"

#include "decomp/common.h"
#include "log.h"

void *Net_Dispatcher_AddHandler(Net_Dispatcher *this, uint8_t msg_id, Handler *handler, int flags, void *data, int priority) {
    static void *(__fastcall* _AddHandler)(Net_Dispatcher *, unused_t, uint8_t, Handler *, int, void *, int) = (void *)0x00431620;
    return _AddHandler(this, UNUSED, msg_id, handler, flags, data, priority);
}
