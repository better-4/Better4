#include "autorepeat.h"

#include "decomp/Tmr.h"
#include "decomp/Inp_Manager.h"
#include "log.h"

// Defaults from THPS4
#define AUTOREPEAT_DELAY_MS 300
#define AUTOREPEAT_INTERVAL_MS 50

int key_repeat_times[MAX_DIGITAL_EVENTS] = { -1 };

uint32_t Autorepeat_ButtonPressed(Inp_Data *inp_data, uint32_t index) {
    int now = Tmr_GetTime();
    uint32_t flag = 1 << index;
    int *key_repeat_time = &key_repeat_times[index];

    // logDebug("Autorepeat_ButtonPressed: index=%d flag=%x now=%d key_repeat_time=%d", index, flag, now, *key_repeat_time);

    if (Inp_Data_ButtonJustPressed(inp_data, flag)) {
        *key_repeat_time = now + AUTOREPEAT_DELAY_MS;
        logDebug("Button %d was just pressed, repeating after %d", index, *key_repeat_time);
        return 1;
    } else if (Inp_Data_ButtonJustReleased(inp_data, flag)) {
        logDebug("Button %d was just released", index);
        *key_repeat_time = -1;
        return 0;
    } else if (*key_repeat_time > 0 && Inp_Data_ButtonPressed(inp_data, flag)) {
        if (now > *key_repeat_time) {
            *key_repeat_time = now + AUTOREPEAT_INTERVAL_MS;
            logDebug("Button %d is held and triggered, repeating after %d", index, *key_repeat_time);
            return 1;
        } else {
            logDebug("Button %d is held and not triggered, repeating after %d", index);
            return 0;
        }
    } else {
        return 0;
    }
}
