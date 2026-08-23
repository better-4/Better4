#ifndef _GAMENET_MANAGER_H_
#define _GAMENET_MANAGER_H_

#include "decomp/Lst_Search.h"
#include "decomp/Mdl_Skate.h"
#include "decomp/Net_PlayerInfo.h"

typedef void Net_Manager;

Net_Manager *Net_Manager_Instance();
Net_PlayerInfo *Net_Manager_GetLocalPlayer(Net_Manager *this);
Net_PlayerInfo *Net_Manager_FirstPlayerInfo(Net_Manager *this, Lst_Search *search_ctx, uint8_t flag);

#endif
