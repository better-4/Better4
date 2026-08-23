#include "decomp/Net_PlayerInfo.h"


uint32_t Net_PlayerInfo_IsObserving(Net_PlayerInfo *this) {
    static uint32_t (__fastcall* _IsObserving)(Net_PlayerInfo *) = (void*)0x00491560;
    return _IsObserving(this);
}

uint32_t Net_PlayerInfo_IsLocalPlayer(Net_PlayerInfo *this) {
    static uint32_t (__fastcall* _IsLocalPlayer)(Net_PlayerInfo *) = (void*)0x00491540;
    return _IsLocalPlayer(this);
}
