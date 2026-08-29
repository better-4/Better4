#include "online/peer.h"

#include "decomp/common.h"
#include "decomp/CStruct.h"
#include "decomp/GameNet_Manager.h"
#include "decomp/Net_App.h"
#include "decomp/Prefs_Preferences.h"
#include "log.h"
#include "version.h"

#include <UniSpySDK/natneg/natneg.h>
#include <UniSpySDK/common/gsAvailable.h>

#include <stdint.h>

static void gs_debug_callback(GSIDebugCategory cat, GSIDebugType type, GSIDebugLevel level, const char * fmt, va_list args) {
    printLog("[%s][%s] ", gGSIDebugCatStrings[cat], gGSIDebugTypeStrings[type]);
    vprintLog(fmt, args);
}

static int gs_count_callback(PEER peer, qr2_key_type type, void *param) {
	printLog("gs_count_callback: %d\n", type);
	switch (type) {
	case key_server:
		return 11;
	case key_player:
		GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
		return GameNet_Manager_GetNumPlayers(gamenet_manager);
	default:
		return 0;
	}
}

static void gs_key_list_callback(PEER peer, qr2_key_type type, qr2_keybuffer_t keybuffer, void *param) {
	printLog("gs_key_list_callback: %d\n", type);
	switch (type) {
	case key_server:
        qr2_keybuffer_add(keybuffer, HOSTNAME_KEY);
        qr2_keybuffer_add(keybuffer, HOSTPORT_KEY);
        qr2_keybuffer_add(keybuffer, GAMEVER_KEY);
		qr2_keybuffer_add(keybuffer, MAPNAME_KEY);
		qr2_keybuffer_add(keybuffer, GAMETYPE_KEY);
        qr2_keybuffer_add(keybuffer, NUMPLAYERS_KEY);
		qr2_keybuffer_add(keybuffer, NUMTEAMS_KEY);
		qr2_keybuffer_add(keybuffer, MAXPLAYERS_KEY);
        qr2_keybuffer_add(keybuffer, GAMEMODE_KEY);
        qr2_keybuffer_add(keybuffer, PASSWORD_KEY);
		qr2_keybuffer_add(keybuffer, NUMOBSERVERS_KEY);
		qr2_keybuffer_add(keybuffer, MAXOBSERVERS_KEY);
		break;
	case key_player:
        qr2_keybuffer_add(keybuffer, PLAYER__KEY);
		break;
	case key_team:
		break;
	}
}

static void gs_server_key_callback(PEER peer, int key, qr2_buffer_t buffer, void *param) {
	printLog("gs_server_key_callback: %d\n", key);
	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	
	switch (key) {
	case HOSTNAME_KEY:
		Prefs_Preferences *net_preferences = GameNet_Manager_GetNetworkPreferences(gamenet_manager);
		CStruct *server_name = Prefs_Preferences_GetPreference(net_preferences, 0x2a5cf019/*server_name*/);
		char *ui_string = "";
		if (!CStruct_GetString(server_name, 0x96875c0f/*ui_string*/, &ui_string, 0)) {
			printLog("gs_server_key_callback: could not get server_name's ui_string\n");
		}
		qr2_buffer_add(buffer, ui_string);
		break;
	case HOSTPORT_KEY:
		qr2_buffer_add_int(buffer, HOST_PORT);
		break;
	case GAMEVER_KEY:
		qr2_buffer_add(buffer, BETTER4_VERSION);
		break;
	case MAPNAME_KEY:
		char *level_name = GameNet_Manager_GetLevelName(gamenet_manager, '\1');
		if (level_name) {
			qr2_buffer_add(buffer, level_name);
		} else {
			GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
			Prefs_Preferences *net_preferences = GameNet_Manager_GetNetworkPreferences(gamenet_manager);
			CStruct *level = Prefs_Preferences_GetPreference(net_preferences, 0x651533ec/*level*/);

			char *ui_string = "";
			if (!CStruct_GetString(level, 0x96875c0f/*ui_string*/, &ui_string, 0)) {
				printLog("GSInitGameSpy: could not get level's ui_string\n");
			}

			qr2_buffer_add(buffer, ui_string);
		}
		break;
	case GAMETYPE_KEY:
		char *gamemode_name = GameNet_Manager_GetGameModeName(gamenet_manager);
		qr2_buffer_add(buffer, gamemode_name);
		break;
	case NUMPLAYERS_KEY:
		int num_players = GameNet_Manager_GetNumPlayers(gamenet_manager);
		qr2_buffer_add_int(buffer, num_players);
		break;
	case NUMTEAMS_KEY:
		int num_teams = GameNet_Manager_GetNumTeams(gamenet_manager);
		qr2_buffer_add_int(buffer, num_teams);
		break;
	case MAXPLAYERS_KEY:
		int max_players = GameNet_Manager_GetMaxPlayers(gamenet_manager);
		qr2_buffer_add_int(buffer, max_players);
		break;
	case GAMEMODE_KEY:
		char *game_mode;
		if (gs_game_playing) {
			game_mode = "open playing";
		} else if (gs_server_ready) {
			game_mode = "open waiting";
		} else {
			game_mode = "not ready";
		}
		qr2_buffer_add(buffer, game_mode);
		break;
	case PASSWORD_KEY:
		char *password_str = GameNet_Manager_GetPassword(gamenet_manager);
		int password = strlen(password_str) > 0 ? 1 : 0;
		qr2_buffer_add_int(buffer, password);
		break;
	case NUMOBSERVERS_KEY:
		int num_observers = GameNet_Manager_GetNumObservers(gamenet_manager);
		qr2_buffer_add_int(buffer, num_observers);
		break;
	case MAXOBSERVERS_KEY:
		int max_observers = GameNet_Manager_GetMaxObservers(gamenet_manager);
		qr2_buffer_add_int(buffer, max_observers);
		break;
	default:
		qr2_buffer_add(buffer, "");
		break;
	}
}

static void gs_player_key_callback(PEER peer, int key, int index, qr2_buffer_t buffer, void *param) {
	printLog("gs_player_key_callback: %d, index %d\n", key, index);
	// TODO (ellie): ping reporting?
	switch (key) {
	case PLAYER__KEY:
		// return the name for the player with matching index
		GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
		Lst_Search search = Lst_Search_PlayerInfo();
		GameNet_PlayerInfo *current_player = GameNet_Manager_FirstPlayerInfo(gamenet_manager, &search, 1);
		GameNet_PlayerInfo *target_player = 0;

		int i = 0;
		while (current_player != 0) {
			if (index == i && !GameNet_PlayerInfo_IsObserving(current_player)) {
				target_player = current_player;
				break;
			}
			current_player = GameNet_Manager_NextPlayerInfo(gamenet_manager, &search, 1);
			i++;
		}

		if (target_player) {
			printLog("gs_player_key_callback: target_player=0x%p, name=%s\n", target_player, target_player->name);
			qr2_buffer_add(buffer, target_player->name);
		} else {
			printLog("gs_player_key_callback: target_player is null\n");
			qr2_buffer_add(buffer, "");
		}
		break;
	default:
		qr2_buffer_add(buffer, "");
		break;
	}
}

static void gs_public_address_callback(PEER peer, unsigned int ip, unsigned short port, void *param) {
	struct in_addr addr;
	addr.s_addr = ip;
    printLog("Received public address: %s:%d\n", inet_ntoa(addr), port);
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
	gs_nat_negotiating = 0;

	switch (result) {
	case nr_success:
		printLog("gs_natneg_complete_callback: nr_success\n");
		printLog("gs_natneg_complete_callback: being joined by client %s:%d\n", inet_ntoa(remoteaddr->sin_addr), ntohs(remoteaddr->sin_port));
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
}

static void gs_nat_negotiate_callback(PEER peer, int cookie, void *param) {
	printLog("gs_nat_negotiate_callback: received Nat Negotiate Cookie: 0x%08X\n", cookie);

	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	Net_App *server = gamenet_manager->server;
	NegotiateError error = NNBeginNegotiationWithSocket(server->socket, cookie, /*client_index*/0, gs_natneg_progress_callback, gs_natneg_complete_callback, cookie);

	switch (error) {
	case ne_noerror:
		gs_nat_negotiating = 1;
		break;
	case ne_allocerror:
		printLog("gs_nat_negotiate_callback: memory allocation failed\n");
	case ne_dnserror:
		printLog("gs_nat_negotiate_callback: DNS lookup failed\n");
	case ne_socketerror:
		printLog("gs_nat_negotiate_callback: socket failed to be created\n");
	}
}

static void gs_add_error_callback(PEER peer, qr2_error_t error, gsi_char *errorString, void *param) {
    printLog("OpenSpy reporting error: %d (%s)\n", error, errorString);
}

void foreign_packet_handler(uint8_t *packet, int len, struct sockaddr *sender) {
	if (len < 6) {
		printLog("foreign_packet_handler: packet not long enough (len=%d)\n", len);
		return;
	}

	if (packet[0] == QR_MAGIC_1 && packet[1] == QR_MAGIC_2) {
		if (gs_peer) {
			printLog("foreign_packet_handler: handling QR request\n");
			peerParseQuery(gs_peer, packet, len, sender);
		}
	} else if (
		packet[0] == NN_MAGIC_0
		&& packet[1] == NN_MAGIC_1
		&& packet[2] == NN_MAGIC_2
		&& packet[3] == NN_MAGIC_3
		&& packet[4] == NN_MAGIC_4
		&& packet[5] == NN_MAGIC_5
	) {
		printLog("foreign_packet_handler: processing natneg data\n");
		NNProcessData(packet, len, sender);
	}
}

void gs_peer_initialize() {
	if (!gs_peer) {
		// TODO (ellie): maybe tune these down if logs get too large?
		gsSetDebugCallback(gs_debug_callback);
		gsSetDebugLevel(GSIDebugCat_All, GSIDebugType_All, GSIDebugLevel_Debug);

		printLog("gs_peer_initialize: starting available check\n");
		GSIStartAvailableCheck(GAME_NAME);
		GSIACResult result;
		while ((result = GSIAvailableCheckThink()) == GSIACWaiting) {
			msleep(5);
		}

		PEERCallbacks callbacks;
		memset(&callbacks, 0, sizeof(PEERCallbacks));

		// TODO (ellie): handle server disconnect ("lost connection to openspy")
		// callbacks.disconnected = ...;

		// TODO (ellie): handle peerchat / lobby list
		// callbacks.roomMessage = ...;
		// callbacks.playerMessage = ...;
		// callbacks.playerJoined = ...;
		// callbacks.playerLeft = ...;
		// callbacks.playerInfo = ...;
		// callbacks.newPlayerList = ...;
		// callbacks.roomKeyChanged = ...;

		callbacks.qrKeyList = gs_key_list_callback;
		callbacks.qrServerKey = gs_server_key_callback;
		callbacks.qrPlayerKey = gs_player_key_callback;
		callbacks.qrCount = gs_count_callback;

		callbacks.qrPublicAddressCallback = gs_public_address_callback;
		callbacks.qrNatNegotiateCallback = gs_nat_negotiate_callback;

		callbacks.qrAddError = gs_add_error_callback;

		printLog("gs_peer_initialize: peerInitialize\n");
		gs_peer = peerInitialize(&callbacks);

		printLog("gs_peer_initialize: peerSetTitle\n");
		PEERBool ping_rooms[3] = {0, 1, 0};
		PEERBool x_ping_rooms[3] = {0, 0, 0};
		peerSetTitle(gs_peer, GAME_NAME, GAME_KEY, GAME_NAME, GAME_KEY, 4, 15, 1, ping_rooms, x_ping_rooms);

		qr2_register_key(NUMOBSERVERS_KEY, "numobservers");
		qr2_register_key(MAXOBSERVERS_KEY, "maxobservers");
	}
}

void gs_peer_shutdown() {
	if (gs_peer) {
		printLog("gs_peer_shutdown: peerStopGame\n");
		peerStopGame(gs_peer);
		piStopReporting(gs_peer);
		printLog("gs_peer_shutdown: peerClearTitle\n");
		peerClearTitle(gs_peer);
		printLog("gs_peer_shutdown: peerShutdown\n");
		peerShutdown(gs_peer);
		gs_peer = 0;
	}
}


// Called in the main loop
void __stdcall GSDoWork() {
	if (gs_peer) {
		peerThink(gs_peer);
	}
	if (gs_nat_negotiating) {
		NNThink();
	}
}
