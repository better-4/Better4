#ifndef _ONLINE_LOBBY_LIST_H_
#define _ONLINE_LOBBY_LIST_H_

#include "decomp/CScript.h"
#include "decomp/CStruct.h"
#include "online/common.h"

typedef struct LobbyPlayerInfo {
    char name[PLAYER_NAME_STRLEN];
} LobbyPlayerInfo;

void lobby_add_player(char *name);
void lobby_remove_player(char *name);

int __cdecl CFunc_StartBetterPlayerList(CStruct *params);
int __cdecl CFunc_StopBetterPlayerList(CStruct *params);
int __cdecl CFunc_UpdateBetterPlayerList(CStruct *params);
int __cdecl CFunc_NumBetterPlayersInLobby(CStruct *params, CScript *out);
int __cdecl CFunc_SendBetterMessage(CStruct *params);

#endif
