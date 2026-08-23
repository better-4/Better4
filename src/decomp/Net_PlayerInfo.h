#ifndef _NET_PLAYERINFO_H_
#define _NET_PLAYERINFO_H_

#include "decomp/Obj_CSkater.h"

#include <stdint.h>

typedef struct Net_PlayerInfo {
    uint8_t unk[0x14];
    Obj_CSkater *skater;
} Net_PlayerInfo;

uint32_t PlayerInfo_IsObserving(Net_PlayerInfo *this);
uint32_t PlayerInfo_IsLocalPlayer(Net_PlayerInfo *this);

#endif
