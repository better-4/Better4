#include "online/client.h"

#include "decomp/common.h"
#include "decomp/CScript.h"
#include "decomp/GameNet_Manager.h"
#include "decomp/Net_App.h"
#include "decomp/Net_Conn.h"
#include "online/common.h"
#include "online/peer.h"
#include "log.h"

#include <UniSpySDK/natneg/natneg.h>

#include <stdlib.h>
#include <string.h>
#include <time.h>

static void gs_natneg_progress_callback(NegotiateState state, void *param) {
	switch (state) {
	case ns_initack:
		logDebug("gs_natneg_progress_callback: ns_initack");
		break;
	case ns_connectping:
		logDebug("gs_natneg_progress_callback: ns_connectping");
		break;
	default:
		break;
	}
}

static void gs_natneg_complete_callback(NegotiateResult result, SOCKET gamesocket, SOCKADDR_IN *remoteaddr, void *param) {
	switch (result) {
	case nr_success:
		logDebug("gs_natneg_complete_callback: nr_success");

		GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
		uint8_t join_mode = (uint8_t)gamenet_manager->join_mode;
		uint32_t ip = remoteaddr->sin_addr.s_addr;
		uint16_t port = ntohs(remoteaddr->sin_port);
		logInfo("gs_natneg_complete_callback: joining server %s:%d, join mode %d", inet_ntoa(remoteaddr->sin_addr), port, join_mode);

		GameNet_Manager_JoinServer(gamenet_manager, join_mode, ip, port, 0);
		gs_peer_shutdown();

		break;
	case nr_deadbeatpartner:
		logWarning("gs_natneg_complete_callback: nr_deadbeatpartner");
		break;
	case nr_inittimeout:
		logWarning("gs_natneg_complete_callback: nr_inittimeout");
		break;
	case nr_pingtimeout:
		logWarning("gs_natneg_complete_callback: nr_pingtimeout");
		break;
	default:
		break;
	}

	gs_nat_negotiating = 0;
	NNFreeNegotiateList();

	if (result != nr_success) {
		Script_RunScript(0x3a9fb574/*show_nat_timeout*/, 0, 0, 0, 0);
	}
}

static int start_nat_negotiation(char *ip, uint16_t port, int cookie) {
	logDebug("start_nat_negotiation: %s:%d with cookie 0x%08x", ip, port, cookie);

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
		logWarning("start_nat_negotiation: memory allocation failed");
		return 0;
	case ne_dnserror:
		logWarning("start_nat_negotiation: DNS lookup failed");
		return 0;
	case ne_socketerror:
		logWarning("start_nat_negotiation: socket failed to be created");
		return 0;
	}

	return 1;
}

static int cancel_nat_negotiation() {
	logDebug("cancel_nat_negotiation");

	gs_peer_shutdown();
	gs_nat_negotiating = 0;
	NNFreeNegotiateList();

	return 1;
}

int __cdecl CFunc_StartNatNegotiation(CStruct *params) {
	char *ip = "";
	if (!CStruct_GetString(params, 0, &ip, 0)) {
		logWarning("StartNatNegotiation missing param \"ip\" (unnamed)");
		return 0;
	}

	int port = 0;
	if (!CStruct_GetInteger(params, 0, &port, 0)) {
		logWarning("StartNatNegotiation missing param \"port\" (unnamed)");
		return 0;
	}

	int cookie = 0;
	if (!CStruct_GetInteger(params, 0x751f4599/*cookie*/, &cookie, 0)) {
		logWarning("StartNatNegotiation missing param \"cookie\" (0x751f4599)");
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
		logDebug("Calling client's foreign packet handler");
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
