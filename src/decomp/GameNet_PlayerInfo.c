#include "decomp/GameNet_PlayerInfo.h"

uint32_t GameNet_PlayerInfo_IsObserving(GameNet_PlayerInfo *this) {
    static uint32_t (__fastcall* _IsObserving)(GameNet_PlayerInfo *) = (void*)0x00491560;
    return _IsObserving(this);
}

uint32_t GameNet_PlayerInfo_IsLocalPlayer(GameNet_PlayerInfo *this) {
    static uint32_t (__fastcall* _IsLocalPlayer)(GameNet_PlayerInfo *) = (void*)0x00491540;
    return _IsLocalPlayer(this);
}

void *GameNet_PlayerInfo_GetConnHandle(GameNet_PlayerInfo *this) {
    static uint32_t (__fastcall* _GetConnHandle)(GameNet_PlayerInfo *) = (void*)0x00492bd0;
    return _GetConnHandle(this);
}
