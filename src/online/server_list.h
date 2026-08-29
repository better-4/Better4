#ifndef _ONLINE_SERVER_LIST_H_
#define _ONLINE_SERVER_LIST_H_

#include "decomp/CStruct.h"
#include "decomp/CScript.h"
#include "online/common.h"

#include <UniSpySDK/serverbrowsing/sb_serverbrowsing.h>

#include <stdint.h>

#define SERVER_INFO_STRLEN 32

typedef struct PlayerInfo {
    char name[PLAYER_NAME_STRLEN];
} PlayerInfo;

typedef struct ServerInfo {
    char ip[16];
    uint16_t port;
    int num_players;
    int num_teams;
    int max_players;
    int num_observers;
    int max_observers;
    int password;
    char hostname[SERVER_INFO_STRLEN];
    char gamever[SERVER_INFO_STRLEN];
    char mapname[SERVER_INFO_STRLEN];
    char gametype[SERVER_INFO_STRLEN];
    char gamemode[SERVER_INFO_STRLEN];
    SBServer gs_server;
    PlayerInfo players[8];
} ServerInfo;

int __cdecl CFunc_StartBetterServerList(CStruct *params);
int __cdecl CFunc_RefreshBetterServerList(CStruct *params);
int __cdecl CFunc_UpdateBetterServerList(CStruct *params);
int __cdecl CFunc_StopBetterServerList(CStruct *params);

int __cdecl CFunc_NumBetterServers(CStruct *params, CScript *script);
int __cdecl CFunc_FoundBetterServers(CStruct *params);
int __cdecl CFunc_ChooseBetterServer(CStruct *params);
int __cdecl CFunc_DescribeBetterServer(CStruct *params);
int __cdecl CFunc_StopDescribingBetterServer(CStruct *params);

#endif
