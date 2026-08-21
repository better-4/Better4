#include "online/client.h"

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

static unsigned char GS_FIELDS[] = {HOSTNAME_KEY, HOSTPORT_KEY, GAMEVER_KEY, MAPNAME_KEY, GAMETYPE_KEY, NUMPLAYERS_KEY, NUMTEAMS_KEY, MAXPLAYERS_KEY, GAMEMODE_KEY, PLAYER__KEY, PASSWORD_KEY, NUMOBSERVERS_KEY, MAXOBSERVERS_KEY};
static unsigned int NUM_GS_FIELDS = 13;

static gsi_bool gs_refresh_complete = gsi_false;
static ServerBrowser gs_server_browser = 0;

static uint32_t num_servers = 0;
// XXX (ellie): surely we won't get more than 64 servers... maybe change to a linked list?
static ServerInfo servers[64];

static int start_server_list();
static int refresh_server_list();
static int stop_server_list();
static void update_server_menu();
static void add_server_to_menu(ServerInfo *server);
static int describe_server(ServerInfo *server);
static int choose_server(ServerInfo *server);

static void gs_listing_games_callback(PEER peer, PEERBool success, char *name, SBServer server, PEERBool staging, int msg, int progress, void *param) {
	if (!success) {
		printLog("gs_listing_games_callback: unsuccessful\n");
		return;
	}

	switch (msg) {
	case PEER_REMOVE:
		printLog("gs_listing_games_callback: PEER_REMOVE\n");
		// TODO (ellie): implement?
		break;
	case PEER_CLEAR:
		printLog("gs_listing_games_callback: PEER_CLEAR\n");
		if (num_servers > 0) {
			Script_RunScript(0x152aad5d/*destroy_server_menu_children*/, 0, 0, 0, 0);
			num_servers = 0;
		}
		break;
	case PEER_ADD:
		printLog("gs_listing_games_callback: PEER_ADD\n");
		uint32_t server_index = num_servers++;
		ServerInfo *server_info = &servers[server_index];
		server_info->gs_server = server;

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

		update_server_menu();
		break;
	case PEER_UPDATE:
		printLog("gs_listing_games_callback: PEER_UPDATE\n");
		for (int server_index = 0; server_index < num_servers; server_index++) {
			ServerInfo *server_info = &servers[server_index];
			if (server_info->gs_server == server) {
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

				update_server_menu();
				break;
			}
		}
		break;
	}
}

static void gs_natneg_progress_callback(NegotiateState state, void *param) {
	switch (state) {
	case ns_initack:
		printLog("gs_natneg_progress_callback: ns_initack\n");
		break;
	case ns_connectping:
		printLog("gs_natneg_progress_callback: ns_connectping\n");
		break;
	default:
		break;
	}
}

static void gs_natneg_complete_callback(NegotiateResult result, SOCKET gamesocket, SOCKADDR_IN *remoteaddr, void *param) {
	switch (result) {
	case nr_success:
		printLog("gs_natneg_complete_callback: nr_success\n");

		GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
		uint8_t join_mode = (uint8_t)gamenet_manager->join_mode;
		uint32_t ip = remoteaddr->sin_addr.s_addr;
		uint16_t port = ntohs(remoteaddr->sin_port);
		printLog("gs_natneg_complete_callback: joining server %s:%d, join mode %d\n", inet_ntoa(remoteaddr->sin_addr), port, join_mode);

		GameNet_Manager_JoinServer(gamenet_manager, join_mode, ip, port, 0);

		break;
	case nr_deadbeatpartner:
		printLog("gs_natneg_complete_callback: nr_deadbeatpartner\n");
		break;
	case nr_inittimeout:
		printLog("gs_natneg_complete_callback: nr_inittimeout\n");
		break;
	case nr_pingtimeout:
		printLog("gs_natneg_complete_callback: nr_pingtimeout\n");
		break;
	default:
		break;
	}

	gs_nat_negotiating = 0;

	if (result != nr_success) {
		Script_RunScript(0x3a9fb574/*show_nat_timeout*/, 0, 0, 0, 0);
	}
}

static void gs_server_list_init() {
	printLog("gs_server_list_init\n");
	if (!gs_peer) {
		gs_peer_initialize();
		peerStartListingGames(gs_peer, GS_FIELDS, NUM_GS_FIELDS, "", gs_listing_games_callback, 0);
	}
}

static void gs_server_list_shutdown() {
	printLog("gs_server_list_shutdown\n");
	if (gs_peer) {
		peerStopListingGames(gs_peer);
		gs_peer_shutdown(gs_peer);
	}
}

static int start_server_list() {
	gs_server_list_init();
	return 1;
}

static int refresh_server_list() {
	if (gs_peer) {
		peerStopListingGames(gs_peer);
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

static int start_nat_negotiation(char *ip, uint16_t port, int cookie) {
	printLog("start_nat_negotiation: %s:%d with cookie 0x%08x\n", ip, port, cookie);

	gs_peer_initialize();
	peerSendNatNegotiateCookie(gs_peer, inet_addr(ip), port, cookie);

	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	Net_App *client = GameNet_Manager_SpawnClient(gamenet_manager, 0, 0, 1, 0);
	client->foreign_packet_handler = foreign_packet_handler;
	NegotiateError error = NNBeginNegotiationWithSocket(client->socket, cookie, /*client_index*/1, gs_natneg_progress_callback, gs_natneg_complete_callback, cookie);

	switch (error) {
	case ne_noerror:
		gs_nat_negotiating = 1;
		break;
	case ne_allocerror:
		printLog("start_nat_negotiation: memory allocation failed\n");
		return 0;
	case ne_dnserror:
		printLog("start_nat_negotiation: DNS lookup failed\n");
		return 0;
	case ne_socketerror:
		printLog("start_nat_negotiation: socket failed to be created\n");
		return 0;
	}

	return 1;
}

static int cancel_nat_negotiation() {
	printLog("cancel_nat_negotiation\n");

	gs_peer_shutdown();
	gs_nat_negotiating = 0;
	NNFreeNegotiateList();

	return 1;
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

int __cdecl CFunc_StartNatNegotiation(CStruct *params) {
	char *ip = "";
	if (!CStruct_GetString(params, 0, &ip, 0)) {
		printLog("StartNatNegotiation missing param \"ip\" (unnamed)\n");
		return 0;
	}

	int port = 0;
	if (!CStruct_GetInteger(params, 0, &port, 0)) {
		printLog("StartNatNegotiation missing param \"port\" (unnamed)\n");
		return 0;
	}

	int cookie = 0;
	if (!CStruct_GetInteger(params, 0x751f4599/*cookie*/, &cookie, 0)) {
		printLog("StartNatNegotiation missing param \"cookie\" (0x751f4599)\n");
		return 0;
	}

	return start_nat_negotiation(ip, (uint16_t)port, cookie);
}

int __cdecl CFunc_CancelNatNegotiation(CStruct *params) {
	return cancel_nat_negotiation();
}

uint8_t __fastcall Net_App_validate_and_copy_stream(struct sockaddr_in *sender, unused_t _, char *in, Net_Conn *conn, int len) {
	// XXX (ellie): Original signature is `__thiscall (Net_App *app, char *in, char *out, int len)`, but
	// we need the sender's sockaddr to pass to the foreign packet handler. We can get `out` and `app`
	// from the connection, so replace `out` with `conn` and `app` with `sender`.
    static uint8_t (__fastcall* _validate_and_copy_stream)(Net_App *, unused_t, char *, char *, int) = (void *)0x0042dbe0;

	Net_App *app = conn->app;
	char *out = conn->read_buffer;

	uint8_t ret = _validate_and_copy_stream(app, UNUSED, in, out, len);

	if (app->foreign_packet_handler) {
		printLog("Calling client's foreign packet handler\n");
		app->foreign_packet_handler(in, len, sender);
	}

	return ret;
}

void patchClientForeignPacketHandler() {
	// XXX (ellie): Couldn't figure out a clean way to call the foreign packet handler client side,
	// so here's some fucky asm to rearrange argument order to Net::App::validate_and_copy_stream
	// to do it there.
	patchCall((void*)0x00431466, (void*)Net_App_validate_and_copy_stream);

	// 8d 4c 24 18 - move &sockaddr into ecx (first arg)
	patchByte(0x0043145b, 0x8d);
	patchByte(0x0043145b + 1, 0x4c);
	patchByte(0x0043145b + 2, 0x24);
	patchByte(0x0043145b + 3, 0x18);

	patchByte(0x0043145f, 0x55); // push ebp (len, fourth arg)
	patchByte(0x00431460, 0x50); // push eax (conn, )
	patchByte(0x00431461, 0x53); // push ebx
	
	patchByte(0x00431462, 0x90); // nop
}
