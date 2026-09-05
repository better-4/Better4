#include "decomp/CScript.h"

struct CStruct *CScript_GetParams(CScript *this) {
    // inlined during compilation; access member directly
    return this->params;
    // return *(CStruct **)(((char *)this) + 0x14);
}

// TODO (ellie): move these to a separate script namespace?
void Script_RunScript(uint32_t checksum, struct CStruct *params, void *unk, uint8_t unk2, char *unk3) {
    static void(__cdecl* _RunScript)(uint32_t, struct CStruct *, void *, uint8_t, char *) = (void *)0x00413090;
    _RunScript(checksum, params, unk, unk2, unk3);
}

char *Script_GetLocalString(char *name) {
    static char *(__cdecl* _GetLocalString)(char *name) = (void *)0x00419ba0;
    return _GetLocalString(name);
}

float Script_GetFloat(uint32_t checksum) {
    static float (__cdecl* _GetFloat)(uint32_t checksum) = (void *)0x00419610;
    return _GetFloat(checksum);
}
