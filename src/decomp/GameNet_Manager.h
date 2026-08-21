#ifndef _GAMENET_MANAGER_H_
#define _GAMENET_MANAGER_H_

#include "decomp/GameNet_PlayerInfo.h"
#include "decomp/Lst_Search.h"
#include "decomp/Mdl_Skate.h"
#include "decomp/Net_App.h"
#include "decomp/Prefs_Preferences.h"

#include <stdint.h>

#define JOIN_MODE_PLAY 0
#define JOIN_MODE_OBSERVE 1

typedef struct GameNet_Manager {
    uint8_t unk[0xc];
    Net_App *server; // 0xc
    uint8_t unk2[0x18];
    uint32_t join_mode; // 0x28 (0=play, 1=obs)
    uint8_t unk3[0x78];
} GameNet_Manager;

GameNet_Manager *GameNet_Manager_Instance();

Prefs_Preferences *GameNet_Manager_GetNetworkPreferences(GameNet_Manager *this);

GameNet_PlayerInfo *GameNet_Manager_GetLocalPlayer(GameNet_Manager *this);
GameNet_PlayerInfo *GameNet_Manager_FirstPlayerInfo(GameNet_Manager *this, Lst_Search *search_ctx, uint8_t flag);
GameNet_PlayerInfo *GameNet_Manager_NextPlayerInfo(GameNet_Manager *this, Lst_Search *search_ctx, uint8_t flag);

char *GameNet_Manager_GetGameModeName(GameNet_Manager *this);
char *GameNet_Manager_GetLevelName(GameNet_Manager *this, char unk);
int GameNet_Manager_GetMaxObservers(GameNet_Manager *this);
int GameNet_Manager_GetNumObservers(GameNet_Manager *this);
int GameNet_Manager_GetMaxPlayers(GameNet_Manager *this);
int GameNet_Manager_GetNumPlayers(GameNet_Manager *this);
int GameNet_Manager_GetNumTeams(GameNet_Manager *this);
char *GameNet_Manager_GetPassword(GameNet_Manager *this);

void GameNet_Manager_JoinServer(GameNet_Manager *this, uint8_t join_mode, uint32_t ip, uint16_t port, uint32_t unk);
Net_App *GameNet_Manager_SpawnClient(GameNet_Manager *this, uint8_t unk, uint8_t unk2, uint8_t unk3, int index);

#endif
