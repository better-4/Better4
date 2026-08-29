#include "online/server.h"

#include "decomp/GameNet_Manager.h"
#include "decomp/Net_App.h"
#include "decomp/Prefs_Preferences.h"
#include "online/peer.h"

static uint8_t gs_is_hosting = 0;

// THPS4 functions patched to use peer SDK instead of basic qr2 lib

// Called on EnteredNetworkGame when hosting
void __cdecl GSInitGameSpy(char *unk) {
	printLog("GSInitGameSpy\n");

	if (gs_is_hosting) {
		if (!gs_peer) {
			printLog("GSInitGameSpy: gs_peer_initialize\n");
			gs_peer_initialize();
		}

		GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
		Net_App *server = gamenet_manager->server;
		server->foreign_packet_handler = foreign_packet_handler;

		printLog("GSInitGameSpy: peerStartReporting\n");
		int result = peerStartReportingWithSocket(gs_peer, server->socket, HOST_PORT);

		if (result) {
			printLog("GSInitGameSpy: peerStateChanged\n");
			peerStateChanged(gs_peer);
		}
	}
}

// Called when setting level to skateshop or freeing GameNet::Manager
void __stdcall GSCloseGameSpy() {
	if (gs_is_hosting && gs_peer) {
		printLog("GSCloseGameSpy: stopping game\n");
		peerStopGame(gs_peer);
		printLog("GSCloseGameSpy: freeing natneg/peer\n");
		NNFreeNegotiateList();
		gs_peer_shutdown();
		gs_server_ready = 0;
		gs_game_playing = 0;
	}
}

// Called with ready=1 or ready=0 when setting level, notify state change
void __cdecl GSServerReady(uint8_t ready) {
	if (gs_is_hosting && gs_peer && gs_server_ready != ready) {
		printLog("GSServerReady: sending ready=%d\n", ready);
		gs_server_ready = ready;
		peerStateChanged(gs_peer);
	}

}

// Called when state changes
void __stdcall GSStateChanged() {
	if (gs_is_hosting && gs_peer) {
		printLog("GSStateChanged: sending state changed\n");
		peerStateChanged(gs_peer);
	}
}

// Called when ending or starting a network game
void __cdecl GSGamePlaying(uint8_t playing) {
	if (gs_is_hosting && gs_peer && gs_game_playing != playing) {
		printLog("GSGamePlaying: sending playing=%d\n", playing);
		gs_game_playing = playing;
		peerStateChanged(gs_peer);
	}
}

int __cdecl CFunc_SetHosting(CStruct *params) {
	float is_hosting;
	if (!CStruct_GetFloat(params, 0, &is_hosting, 0)) {
		printLog("SetHosting missing param \"is_hosting\" (unnamed)\n");
		return 0;
	}

	gs_is_hosting = (uint8_t)is_hosting;

	return 1;
}

int __cdecl CFunc_IsHosting(CStruct *params) {
	return gs_is_hosting;
}

int __cdecl CFunc_StopReporting(CStruct *params) {
	gs_peer_shutdown();
	return 1;
}

int __cdecl CFunc_NotifyStateChanged(CStruct *params) {
	if (gs_peer) {
		printLog("NotifyStateChanged: sending state changed\n");
		peerStateChanged(gs_peer);
		return 1;
	} else {
		return 0;
	}
}

void patchGamespyServerCalls() {
	patchJmp((void*)0x004904b0, (void*)GSInitGameSpy);
	patchJmp((void*)0x00490640, (void*)GSCloseGameSpy);
	patchJmp((void*)0x00490590, (void*)GSServerReady);
	patchJmp((void*)0x004905c0, (void*)GSStateChanged);
	patchJmp((void*)0x004905e0, (void*)GSGamePlaying);
}
