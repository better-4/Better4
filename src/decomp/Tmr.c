#include "decomp/Tmr.h"

int Tmr_GetTime() {
    static int (__fastcall* _GetTime)() = (void *)0x00543e40;
    return _GetTime();
}

int Tmr_ElapsedTime(int start_time) {
    return Tmr_GetTime() - start_time;
}
