#include "decomp/common.h"
#include "decomp/GameNet_Manager.h"

GameNet_Manager *GameNet_Manager_Instance() {
    return *(GameNet_Manager **)0x00ab5394;
}

Prefs_Preferences *GameNet_Manager_GetNetworkPreferences(GameNet_Manager *this) {
    static int (__fastcall* _GetNetworkPreferences)(GameNet_Manager *) = (void *)0x0048a7d0;
    return _GetNetworkPreferences(this);
}

GameNet_PlayerInfo *GameNet_Manager_GetLocalPlayer(GameNet_Manager *this) {
    static GameNet_PlayerInfo *(__fastcall* _GetLocalPlayer)(GameNet_Manager *) = (void *)0x00489ac0;
    return _GetLocalPlayer(this);
}

GameNet_PlayerInfo *GameNet_Manager_FirstPlayerInfo(GameNet_Manager *this, Lst_Search *search_ctx, uint8_t flag) {
    static GameNet_PlayerInfo *(__fastcall* _FirstPlayerInfo)(GameNet_Manager *, unused_t, void *, uint8_t) = (void *)0x00489730;
    return _FirstPlayerInfo(this, UNUSED, search_ctx, flag);
}

GameNet_PlayerInfo *GameNet_Manager_NextPlayerInfo(GameNet_Manager *this, Lst_Search *search_ctx, uint8_t flag) {
    static GameNet_PlayerInfo *(__fastcall* _NextPlayerInfo)(GameNet_Manager *, unused_t, void *, uint8_t) = (void *)0x00489820;
    return _NextPlayerInfo(this, UNUSED, search_ctx, flag);
}

char *GameNet_Manager_GetGameModeName(GameNet_Manager *this) {
    static char *(__fastcall* _GetGameModeName)(GameNet_Manager *) = (void *)0x00486770;
    return _GetGameModeName(this);
}

char *GameNet_Manager_GetLevelName(GameNet_Manager *this, char unk) {
    static char *(__fastcall* _GetLevelName)(GameNet_Manager *, unused_t, char) = (void *)0x004866c0;
    return _GetLevelName(this, UNUSED, unk);
}

int GameNet_Manager_GetNumObservers(GameNet_Manager *this) {
    static int (__fastcall* _GetNumObservers)(GameNet_Manager *) = (void *)0x004862e0;
    return _GetNumObservers(this);
}

int GameNet_Manager_GetMaxObservers(GameNet_Manager *this) {
    static int (__fastcall* _GetMaxObservers)(GameNet_Manager *) = (void *)0x004878b0;
    return _GetMaxObservers(this);
}

int GameNet_Manager_GetNumPlayers(GameNet_Manager *this) {
    static int (__fastcall* _GetNumPlayers)(GameNet_Manager *) = (void *)0x00487710;
    return _GetNumPlayers(this);
}

int GameNet_Manager_GetMaxPlayers(GameNet_Manager *this) {
    static int (__fastcall* _GetMaxPlayers)(GameNet_Manager *) = (void *)0x00485cd0;
    return _GetMaxPlayers(this);
}

int GameNet_Manager_GetNumTeams(GameNet_Manager *this) {
    static int (__fastcall* _GetNumTeams)(GameNet_Manager *) = (void *)0x00486030;
    return _GetNumTeams(this);
}

char *GameNet_Manager_GetPassword(GameNet_Manager *this) {
    static int (__fastcall* _GetPassword)(GameNet_Manager *) = (void *)0x00486680;
    return _GetPassword(this);
}

void GameNet_Manager_JoinServer(GameNet_Manager *this, uint8_t join_mode, uint32_t ip, uint16_t port, uint32_t unk) {
    static void (__fastcall* _JoinServer)(GameNet_Manager *, unused_t, uint8_t, uint32_t, uint16_t, uint32_t) = (void *)0x00486d80;
    _JoinServer(this, UNUSED, join_mode, ip, port, unk);
}

Net_App *GameNet_Manager_SpawnClient(GameNet_Manager *this, uint8_t unk, uint8_t unk2, uint8_t unk3, int index) {
    static Net_App *(__fastcall* _SpawnClient)(GameNet_Manager *, unused_t, uint8_t, uint8_t, uint8_t, int) = (void *)0x00486c90;
    return _SpawnClient(this, UNUSED, unk, unk2, unk3, index);
}
