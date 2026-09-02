#include "online/lobby_list.h"

#include "decomp/CStruct.h"
#include "decomp/GameNet_Manager.h"
#include "decomp/Prefs_Preferences.h"
#include "online/common.h"
#include "online/peer.h"

#define MAX_NUM_PLAYERS 128

static uint32_t num_players = 0;
static LobbyPlayerInfo players[MAX_NUM_PLAYERS];
static LobbyPlayerInfo *currently_focused_player = 0;

static RoomType gs_room_type = TitleRoom;

static char new_nick[PLAYER_NAME_STRLEN];
static char nick_suffix = '0';

void gs_nick_error_callback(PEER peer, int type, char* nick, int num_suggestions, char **suggestions, void *param) {
	printLog("gs_nick_error_callback: type=%d, nick=%s\n", type, nick);

	strcpy_s(new_nick, PLAYER_NAME_STRLEN, nick);
	int nick_len = strlen(new_nick);

	// Does it already have a suffix? Just change the number
	if (nick[nick_len - 2] == '_') {
		new_nick[nick_len - 1] = nick_suffix;
	// Len of 16 = 15 with null terminator, need two more chars for suffix
	} else if (nick_len < PLAYER_NAME_STRLEN - 2) {
		new_nick[nick_len] = '_';
		new_nick[nick_len + 1] = nick_suffix;
		new_nick[nick_len + 2] = '\0';
	} else {
		// Anything 14 chars or more, replace 14 and 15 (index 13 and 14)
		new_nick[PLAYER_NAME_STRLEN - 3] = '_';
		new_nick[PLAYER_NAME_STRLEN - 2] = nick_suffix;
	}

	// XXX (ellie): technically this will only work up to 10 times... but if you log in 10 times you probably deserve to crash
	nick_suffix = nick_suffix + 1;

	if (gs_peer) {
		peerRetryWithNick(gs_peer, new_nick);
	}
}

void add_player_to_menu(LobbyPlayerInfo *player) {
	printLog("add_player_to_menu: name=%s\n", player->name);
	CStruct *params = CStruct_New();
	CStruct_AddChecksum(params, 0x40c698af/*id*/, player);
	CStruct_AddString(params, 0xc4745838/*text*/, player->name);
	CStruct_AddChecksum(params, 0xc2719fb0/*parent*/, 0xeca96faf/*lobby_player_list_menu*/);
	Script_RunScript(0x459148c5/*player_list_add_item*/, params, 0, 0, 0);
	CStruct_Free(params);
}

void update_player_menu() {
	printLog("update_player_menu\n");
	Script_RunScript(0x283426d8/*player_list_menu_unlock*/, 0, 0, 0, 0);
	Script_RunScript(0x67e4c742/*destroy_player_list_menu_children*/, 0, 0, 0, 0);

	for (int i = 0; i < num_players; i++) {
		LobbyPlayerInfo *player_info = &players[i];
		add_player_to_menu(player_info);
	}

	Script_RunScript(0x312a0f3d/*player_list_menu_lock*/, 0, 0, 0, 0);
	Script_RunScript(0x7764794a/*update_better_player_list_count*/, 0, 0, 0, 0);

	// if (currently_focused_player) {
	// 	focus_player(currently_focused_player);
	// }
}

void lobby_add_player(char *name) {
	printLog("lobby_add_player: name=%s\n", name);
	LobbyPlayerInfo *player_info = &players[num_players++];
	strcpy_s(player_info->name, PLAYER_NAME_STRLEN, name);
	update_player_menu();
}

void lobby_remove_player(char *name) {
	printLog("lobby_remove_player: name=%s\n", name);

	int target_player_index = -1;
	for (int i = 0; i < num_players; i++) {
		LobbyPlayerInfo *player = &players[i];
		if (!strcmp(player->name, name)) {
			target_player_index = i;
			break;
		}
	}

	if (target_player_index >= 0) {
		num_players--;
		for (int i = target_player_index; i < num_players; i++) {
			players[i] = players[i + 1];
		}
	}

	update_player_menu();
}

void gs_enum_players_callback(PEER peer, PEERBool success, RoomType room_type, int index, char *nick, int flags, void *param) {
	printLog("gs_enum_players_callback: success=%d, room_type=%d, index=%d, nick=%s, flags=%d\n", success, room_type, index, nick, flags);

	if (success && nick) {
		lobby_add_player(nick);
	}
}

void gs_join_room_callback(PEER peer, PEERBool success, PEERJoinResult result, RoomType room_type, void *param) {
	printLog("gs_join_room_callback: success=%d, result=%d, room_type=%d\n", success, result, room_type);
	gs_room_type = room_type;
	peerEnumPlayers(peer, room_type, gs_enum_players_callback, param);
}

void gs_connect_callback(PEER peer, PEERBool success, int failure_reason, void *param) {
	printLog("gs_connect_callback: success=%d, failure_reason=%s\n", success, failure_reason);
	if (success) {
		peerJoinTitleRoom(gs_peer, 0, gs_join_room_callback, 0, gsi_false);
		nick_suffix = '0';
	}
}

void lobby_list_initialize() {
	printLog("lobby_list_initialize\n");
	if (!gs_peer) {
		gs_peer_initialize();
		num_players = 0;
		currently_focused_player = 0;
	}

	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
    Prefs_Preferences *net_preferences = GameNet_Manager_GetNetworkPreferences(gamenet_manager);
    CStruct *network_id = Prefs_Preferences_GetPreference(net_preferences, 0xcbed746e/*network_id*/);
    char *ui_string = "";
    if (!CStruct_GetString(network_id, 0x96875c0f/*ui_string*/, &ui_string, 0)) {
        printLog("StartBetterPlayerList: could not get network_id's ui_string\n");
    }

    peerConnect(gs_peer, ui_string, 0, gs_nick_error_callback, gs_connect_callback, 0, gsi_false);
}

void lobby_list_disconnect() {
	printLog("lobby_list_disconnect\n");
	if (gs_peer) {
		peerDisconnect(gs_peer);
		gs_peer_shutdown();
	}
	num_players = 0;
	currently_focused_player = 0;
}

int __cdecl CFunc_StartBetterPlayerList(CStruct *params) {
	lobby_list_initialize();
	return 1;
}

int __cdecl CFunc_StopBetterPlayerList(CStruct *params) {
	lobby_list_disconnect();
	return 1;
}

int __cdecl CFunc_NumBetterPlayersInLobby(CStruct *params, CScript *script) {
	CStruct *out = CScript_GetParams(script);
	CStruct_AddInteger(out, 0x1cb2a6b0/*num_players*/, num_players);
	return 1;
}

int __cdecl CFunc_SendBetterMessage(CStruct *params) {
	char *message = "";
	if (!CStruct_GetString(params, 0xc4745838/*text*/, &message, 0)) {
		printLog("SendBetterMessage: could not get param \"text\" (0xc4745838)\n");
	}
	peerMessageRoom(gs_peer, gs_room_type, message, NormalMessage);
}
