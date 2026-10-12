#include "decomp/Obj.h"

int Obj_GetRestartNode(uint32_t type, int index, int first) {
    static int (__cdecl *_GetRestartNode)(uint32_t, int, int) = (void *)0x004b3410;
    return _GetRestartNode(type, index, first);
}
