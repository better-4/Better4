#ifndef _ONLINE_CLIENT_H_
#define _ONLINE_CLIENT_H_

#include "decomp/CStruct.h"
#include "decomp/CScript.h"

#include <UniSpySDK/serverbrowsing/sb_serverbrowsing.h>

#include <stdint.h>

#define SERVER_INFO_STRLEN 32

typedef struct PlayerInfo {
    char name[SERVER_INFO_STRLEN];
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
    PlayerInfo players[8];
    SBServer gs_server;
} ServerInfo;

int __cdecl CFunc_StartBetterServerList(CStruct *params);
int __cdecl CFunc_RefreshBetterServerList(CStruct *params);
int __cdecl CFunc_StopBetterServerList(CStruct *params);

int __cdecl CFunc_NumBetterServers(CStruct *params, CScript *script);
int __cdecl CFunc_FoundBetterServers(CStruct *params);
int __cdecl CFunc_ChooseBetterServer(CStruct *params);
int __cdecl CFunc_DescribeBetterServer(CStruct *params);
int __cdecl CFunc_StartNatNegotiation(CStruct *params);
int __cdecl CFunc_CancelNatNegotiation(CStruct *params);

void patchClientForeignPacketHandler();

#endif
