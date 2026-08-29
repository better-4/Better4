#include "online/server_list.h"

#include "decomp/common.h"
#include "decomp/CScript.h"
#include "decomp/GameNet_Manager.h"
#include "decomp/Net_Conn.h"
#include "online/common.h"
#include "online/peer.h"
#include "log.h"

#include <UniSpySDK/natneg/natneg.h>

#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_NUM_SERVERS 64

static unsigned char GS_FIELDS[] = {HOSTNAME_KEY, HOSTPORT_KEY, GAMEVER_KEY, MAPNAME_KEY, GAMETYPE_KEY, NUMPLAYERS_KEY, NUMTEAMS_KEY, MAXPLAYERS_KEY, GAMEMODE_KEY, PLAYER__KEY, PASSWORD_KEY, NUMOBSERVERS_KEY, MAXOBSERVERS_KEY};
static unsigned int NUM_GS_FIELDS = 13;

static gsi_bool gs_refresh_complete = gsi_false;
static ServerBrowser gs_server_browser = 0;

static uint32_t num_servers = 0;
// XXX (ellie): surely we won't get more than 64 servers... maybe change to a linked list?
static ServerInfo servers[MAX_NUM_SERVERS];

static ServerInfo *currently_described_server = 0;

static int start_server_list();
static int refresh_server_list();
static int stop_server_list();
static void update_server_menu();
static void add_server_to_menu(ServerInfo *server);
static int describe_server(ServerInfo *server);
static int choose_server(ServerInfo *server);

static void update_server_info(ServerInfo *server_info, SBServer server) {
	strcpy_s(server_info->ip, 16, SBServerGetPublicAddress(server));
	server_info->port = SBServerGetPublicQueryPort(server);
	server_info->password = SBServerGetIntValue(server, "password", -1);
	server_info->num_players = SBServerGetIntValue(server, "numplayers", -1);
	server_info->max_players = SBServerGetIntValue(server, "maxplayers", -1);
	server_info->num_teams = SBServerGetIntValue(server, "numteams", -1);
	server_info->num_observers = SBServerGetIntValue(server, "numobservers", -1);
	server_info->max_observers = SBServerGetIntValue(server, "maxobservers", -1);
	strcpy_s(server_info->hostname, SERVER_INFO_STRLEN, SBServerGetStringValue(server, "hostname", ""));
	strcpy_s(server_info->gamever, SERVER_INFO_STRLEN, SBServerGetStringValue(server, "gamever", ""));
	strcpy_s(server_info->mapname, SERVER_INFO_STRLEN, SBServerGetStringValue(server, "mapname", ""));
	strcpy_s(server_info->gametype, SERVER_INFO_STRLEN, SBServerGetStringValue(server, "gametype", ""));
	strcpy_s(server_info->gamemode, SERVER_INFO_STRLEN, SBServerGetStringValue(server, "gamemode", ""));

	printLog("gs_listing_games_callback: server added (%s:%d)\n", server_info->ip, server_info->port);
	printLog("  hostname: %s\n", server_info->hostname);
	printLog("  gamever: %s\n", server_info->gamever);
	printLog("  mapname: %s\n", server_info->mapname);
	printLog("  gametype: %s\n", server_info->gametype);
	printLog("  password: %d\n", server_info->password);
	printLog("  gamemode: %s\n", server_info->gamemode);
	printLog("  num_players/max_players: %d/%d\n", server_info->num_players, server_info->max_players);
	printLog("  num_observers/max_observers: %d/%d\n", server_info->num_observers, server_info->max_observers);
	printLog("  num_teams: %d\n", server_info->num_teams);

    for (int i = 0; i < server_info->num_players; i++) {
        PlayerInfo *player_info = &server_info->players[i];
        strcpy_s(player_info->name, 16, SBServerGetPlayerStringValue(server, i, "player", "..."));
        printLog("  player %d: %s\n", i, player_info->name);
    }
}

static void update_server_name(ServerInfo *server_info) {
	CStruct *params = CStruct_New();
	CStruct_AddChecksum(params, 0x40c698af/*id*/, server_info);
	CStruct_AddString(params, 0xc4745838/*text*/, server_info->hostname);
	Script_RunScript(0xf896b766/*better_server_list_menu_update_item*/, params, 0, 0, 0);
	CStruct_Free(params);
}

static void focus_server(ServerInfo *server_info) {
	CStruct *params = CStruct_New();
	CStruct_AddChecksum(params, 0x40c698af/*id*/, server_info);
	Script_RunScript(0xb885a5dc/*better_server_list_menu_focus_item*/, params, 0, 0, 0);
	CStruct_Free(params);
}

static void gs_listing_games_callback(PEER peer, PEERBool success, char *name, SBServer server, PEERBool staging, int msg, int progress, void *param) {
	printLog("gs_listing_games_callback: name=%s, msg=%d, progress=%d, staging=%d\n", name, msg, progress, staging);

	if (!success) {
		printLog("gs_listing_games_callback: unsuccessful\n");
		return;
	}

	switch (msg) {
	case PEER_CLEAR:
		printLog("gs_listing_games_callback: PEER_CLEAR\n");
		Script_RunScript(0x152aad5d/*destroy_server_menu_children*/, 0, 0, 0, 0);
		num_servers = 0;
		break;

	case PEER_ADD:
		printLog("gs_listing_games_callback: PEER_ADD\n");

		if (num_servers >= MAX_NUM_SERVERS) {
			printLog("gs_listing_games_callback: hit limit of %d servers, can't add more\n", MAX_NUM_SERVERS);
			break;
		}

		ServerInfo *server_info = &servers[num_servers++];
		server_info->gs_server = server;
		update_server_info(server_info, server);
		update_server_menu();

		peerUpdateGame(gs_peer, server, gsi_true);
		break;

	case PEER_UPDATE:
		printLog("gs_listing_games_callback: PEER_UPDATE\n");
		ServerInfo *target_server_info = 0;
		for (int i = 0; i < num_servers; i++) {
			ServerInfo *server_info = &servers[i];
			if (server_info->gs_server == server) {
				target_server_info = server_info;
				break;
			}
		}

		if (target_server_info) {
			int name_changed = strcmp(target_server_info->hostname, name);
			update_server_info(target_server_info, server);

			if (name_changed) {
				update_server_name(target_server_info);
			}

			if (currently_described_server == target_server_info) {
				// Update server description in real-time if it's currently focused
				describe_server(target_server_info);
			}
		}
		break;

	case PEER_REMOVE:
		printLog("gs_listing_games_callback: PEER_REMOVE\n");

		uint8_t needs_refocus = 0;

		// Find server to remove
		int target_server_index = -1;
		for (int i = 0; i < num_servers; i++) {
			ServerInfo *server_info = &servers[i];
			if (server_info->gs_server == server) {
				target_server_index = i;
				// Check if we need to refocus which server we are describing
				if (currently_described_server && currently_described_server == server_info) {
					needs_refocus = 1;
				}
				break;
			}
		}

		// Check if we even have that server listed
		if (target_server_index >= 0) {
			num_servers--;

			// Shift all servers down one slot
			for (int i = target_server_index; i < num_servers; i++) {
				servers[i] = servers[i + 1];
				// Check if we need to refocus which server we are describing
				if (currently_described_server && currently_described_server == &servers[i + 1]) {
					needs_refocus = 1;
				}
			}

			if (needs_refocus) {
				int new_focus_index = target_server_index < num_servers ? target_server_index : num_servers - 1;
				currently_described_server = &servers[new_focus_index];
				printLog("refocusing to name=%s, new_focus_index=%d\n", currently_described_server->hostname, new_focus_index);
			}

			update_server_menu();
		}

		break;

	case PEER_COMPLETE:
		printLog("gs_listing_games_callback: PEER_COMPLETE\n");
		break;
	}
}

static void gs_server_list_init() {
	printLog("gs_server_list_init\n");
	if (!gs_peer) {
		num_servers = 0;
		currently_described_server = 0;
		gs_peer_initialize();
		peerStartListingGames(gs_peer, GS_FIELDS, NUM_GS_FIELDS, "", gs_listing_games_callback, 0);
	}
}

static void gs_server_list_shutdown() {
	printLog("gs_server_list_shutdown\n");
	if (gs_peer) {
		peerStopListingGames(gs_peer);
		gs_peer_shutdown();
		num_servers = 0;
		currently_described_server = 0;
	}
}

static int start_server_list() {
	gs_server_list_init();
	return 1;
}

static int refresh_server_list() {
	if (gs_peer) {
		peerStopListingGames(gs_peer);
		num_servers = 0;
		currently_described_server = 0;
		update_server_menu();
		peerStartListingGames(gs_peer, GS_FIELDS, NUM_GS_FIELDS, "", gs_listing_games_callback, 0);
	}
	return 1;
}

static int stop_server_list() {
	gs_server_list_shutdown();
	return 1;
}

static void update_server_menu() {
	Script_RunScript(0xbcdfbd0b/*server_list_menu_unlock*/, 0, 0, 0, 0);
	Script_RunScript(0x152aad5d/*destroy_server_menu_children*/, 0, 0, 0, 0);

	for (int server_index = 0; server_index < num_servers; server_index++) {
		ServerInfo *server_info = &servers[server_index];
		add_server_to_menu(server_info);
	}

	Script_RunScript(0xf4e379e1/*server_list_menu_lock*/, 0, 0, 0, 0);
	Script_RunScript(0xf8823b0a/*update_better_server_count*/, 0, 0, 0, 0);

	if (currently_described_server) {
		focus_server(currently_described_server);
	}
}

static void add_server_to_menu(ServerInfo *server) {
	CStruct *params = CStruct_New();
	CStruct_AddString(params, 0xc4745838/*text*/, server->hostname);
	// id = address of `server`, add as checksum since it's u32
	CStruct_AddChecksum(params, 0x40c698af/*id*/, server);
	CStruct_AddChecksum(params, 0xc2719fb0/*parent*/, 0x052140a3/*server_list_menu*/);
	// CStruct_AddChecksum(params, 0x2b0cfca1/*pad_choose_script*/, 0xe9451a84/*choose_better_server*/);
	CStruct_AddChecksum(params, 0x2b0cfca1/*pad_choose_script*/, 0x822e996a/*choose_selected_server*/);
	// CStruct_AddChecksum(params, 0x5a8c82db/*focus_script*/, 0xc681461c/*describe_better_server*/);
	// CStruct_AddChecksum(params, 0x5a8c82db/*focus_script*/, 0x596bab63/*describe_selected_server*/);

	CStruct *action_params = CStruct_New();
	CStruct_AddChecksum(action_params, 0x40c698af/*id*/, (uint32_t)server);
	CStruct_AddInteger(action_params, 0xbc2d746a/*better4*/, 1);

	CStruct_AddStructure(params, 0xc9c30b12/*focus_params*/, action_params);
	CStruct_AddStructure(params, 0xb8437568/*pad_choose_params*/, action_params);

	Script_RunScript(0x85c53d0f/*better_server_list_menu_add_item*/, params, 0, 0, 0);
	// CFunc_PrintStruct(params, 0);

	CStruct_Free(action_params);
	CStruct_Free(params);
}

static void add_desc_line(char *key, char *value) {
	char text[256];
	sprintf_s(text, sizeof(text), "\\c1%s: \\c6%s", key, value);
	
	CStruct *params = CStruct_New();

	CStruct_AddString(params, 0xc4745838/*text*/, text);
	CStruct_AddChecksum(params, 0x416062ab/*parent_menu_id*/, 0xf785c5d7/*server_desc_menu*/);
	CStruct_AddChecksum(params, 0xea6d2566/*font_face*/, 0xba9e279d/*dialog*/);

	Script_RunScript(0xbeed50b6/*make_text_sub_menu_item*/, params, 0, 0, 0);

	CStruct_Free(params);
}

static int describe_server(ServerInfo *server) {
	printLog("describing server=%p, hostname=%s\n", server, server->hostname);
	currently_described_server = server;

	Script_RunScript(0xdd6ddfd6/*destroy_server_desc_children*/, 0, 0, 0, 0);

	// if in progress? need to look into server info
	// char *text = Script_GetLocalString("netoptions_str_game_in_progress");

	add_desc_line(Script_GetLocalString("sort_title_name"), server->hostname);
	add_desc_line(Script_GetLocalString("sort_title_mode"), server->gametype);
	// add_desc_line(Script_GetLocalString("skill_level_info"), server->);
	add_desc_line(Script_GetLocalString("sort_title_level"), server->mapname);

	char players_text[23];
	sprintf_s(players_text, sizeof(players_text), "%d/%d", server->num_players, server->max_players);
	add_desc_line(Script_GetLocalString("sort_title_players"), players_text);

	char observers_text[23];
	sprintf_s(observers_text, sizeof(observers_text), "%d/%d", server->num_observers, server->max_observers);
	add_desc_line(Script_GetLocalString("sort_title_observers"), observers_text);

	add_desc_line("Password", server->password ? "yes" : "no");
	add_desc_line("Version", server->gamever);

	char player_text[11];
    for (int i = 0; i < server->num_players; i++) {
        PlayerInfo *player = &server->players[i];
        sprintf_s(player_text, sizeof(player_text), "%d", i);
        add_desc_line(player_text, player->name);
    }

	return 1;
}

static int choose_server(ServerInfo *server) {
	printLog("choosing server=%p, hostname=%s\n", server, server->hostname);

	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	uint32_t error_reason = 0;

	// Verify there's space to join
	switch (gamenet_manager->join_mode) {
	case JOIN_MODE_PLAY:
		if (server->num_players >= server->max_players) {
			error_reason = 0x7782b5b7/*net_reason_full*/;
		}
		break;
	case JOIN_MODE_OBSERVE:
		if (server->num_observers >= server->max_observers) {
			error_reason = 0xdde5676f/*net_reason_full_observers*/;
		}
		break;
	}

	CStruct *params = CStruct_New();
	int ret;

	if (error_reason) {
		ret = 0;
		CStruct_AddChecksum(params, 0xc44777f3/*reason*/, error_reason);
		CStruct_AddChecksum(params, 0xf6694e96/*just_dialog*/, 0);
		Script_RunScript(0x92528e98/*CreateJoinRefusedDialog*/, params, 0, 0, 0);
	} else {
		ret = 1;
		srand(time(0));
		CStruct_AddString(params, 0/*ip*/, server->ip);
		CStruct_AddInteger(params, 0/*port*/, (int)server->port);
		CStruct_AddInteger(params, 0x751f4599/*cookie*/, rand() % 0x7fffffff);
		Script_RunScript(0xbff7c13b/*net_chosen_join_server*/, params, 0, 0, 0);
	}

	CStruct_Free(params);
	return ret;
}

int __cdecl CFunc_StartBetterServerList(CStruct *params) {
    return start_server_list();
}

int __cdecl CFunc_RefreshBetterServerList(CStruct *params) {
    return refresh_server_list();
}

int __cdecl CFunc_StopBetterServerList(CStruct *params) {
    return stop_server_list();
}

int __cdecl CFunc_NumBetterServers(CStruct *params, CScript *script) {
	CStruct *out = CScript_GetParams(script);
	CStruct_AddInteger(out, 0x757610e1/*num_servers*/, num_servers);
	return 1;
}

int __cdecl CFunc_FoundBetterServers(CStruct *params) {
	return num_servers > 0;
}

int __cdecl CFunc_ChooseBetterServer(CStruct *params) {
	uint32_t server_ptr = 0;
	if (!CStruct_GetChecksum(params, 0x40c698af/*id*/, &server_ptr, 0)) {
		printLog("ChooseBetterServer missing param \"id\" (0x40c698af)\n");
		return 0;
	}
	return choose_server((ServerInfo *)server_ptr);
}

int __cdecl CFunc_DescribeBetterServer(CStruct *params) {
	uint32_t server_ptr = 0;
	if (!CStruct_GetChecksum(params, 0x40c698af/*id*/, &server_ptr, 0)) {
		printLog("DescribeBetterServer missing param \"id\" (0x40c698af)\n");
		return 0;
	}
	return describe_server((ServerInfo *)server_ptr);
}

int __cdecl CFunc_StopDescribingBetterServer(CStruct *params) {
	currently_described_server = 0;
	return 1;
}
