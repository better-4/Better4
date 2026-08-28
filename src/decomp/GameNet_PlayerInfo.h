#ifndef _NET_PLAYERINFO_H_
#define _NET_PLAYERINFO_H_

#include "decomp/Obj_CSkater.h"

#include <stdint.h>

typedef struct GameNet_PlayerInfo {
    uint8_t unk[0x14];
    Obj_CSkater *skater; // 0x14
    uint8_t unk2[0x10];
    char name[16]; // 0x28 // XXX (ellie): Max 15 chars + null terminator
} GameNet_PlayerInfo;

uint32_t GameNet_PlayerInfo_IsObserving(GameNet_PlayerInfo *this);
uint32_t GameNet_PlayerInfo_IsLocalPlayer(GameNet_PlayerInfo *this);

#endif
