#include "online/net_handlers.h"

#include "decomp/common.h"
#include "decomp/GameNet_Manager.h"
#include "decomp/Net_App.h"
#include "decomp/Net_Dispatcher.h"
#include "online/host_options.h"

// #define MSG_ID_PING 0x7C

void *__fastcall Net_Dispatcher_AddHandler_Wrapper(Net_Dispatcher *this, unused_t _, uint8_t opcode, Handler *handler, int flags, void *data, int priority) {
    printLog("Net::Dispatcher::AddHandler: this=%p opcode=%x flags=%x priority=%x\n", this, opcode, flags, priority);
	return Net_Dispatcher_AddHandler(this, opcode, handler, flags, data, priority);
}

int __cdecl server_handle_ping(Net_MsgHandlerContext *ctx) {
    printLog("RECEIVED PING FROM CLIENT\n");
}

int __cdecl client_handle_ping(Net_MsgHandlerContext *ctx) {
    printLog("RECEIVED PING FROM SERVER\n");
}

// Client-side
void __fastcall Mdl_Skate_AddNetworkMsgHandlers(void *this, unused_t _, Net_App *client, int unk2) {
    static void (__fastcall* _AddNetworkMsgHandlers)(void *, unused_t, Net_App *, int) = (void *)0x00500cd0;
    _AddNetworkMsgHandlers(this, UNUSED, client, unk2);

    Net_App *client2 = GameNet_Manager_Instance()->client;
    Net_Dispatcher *dispatcher = Net_App_GetDispatcher(client);
    // printLog("Mdl::Skate::AddNetworkMsgHandlers: this=%p dispatcher=%p client=%x client2=%x unk2=%x\n", this, dispatcher, client, client2, unk2);

    host_options_add_handlers(dispatcher);

    // Net_Dispatcher_AddHandler(dispatcher, MSG_ID_PING, client_handle_ping, 0, this, 0x80);
}

// Server-side
void __fastcall Mdl_Skate_StartServer(void *this) {
    static void (__fastcall* _StartServer)(void *) = (void *)0x005009f0;
    _StartServer(this);

    Net_App *server = GameNet_Manager_Instance()->server;
    Net_Dispatcher *dispatcher = Net_App_GetDispatcher(server);
    printLog("Mdl::Skate::StartServer: this=%p dispatcher=%p\n", this, dispatcher);
    // Net_Dispatcher_AddHandler(dispatcher, MSG_ID_PING, server_handle_ping, 0, this, 0x80);
}

void patchNetHandlers() {
	// Mdl::Skate::AddNetworkMessageHandlers (called by ScriptJoinServer)
	patchCall(0x00500cee, (void *)Net_Dispatcher_AddHandler_Wrapper);
	// StartServer
	patchCall(0x00500aa1, (void *)Net_Dispatcher_AddHandler_Wrapper);

    // ScriptJoinServer
    patchCall(0x00483db7, (void *)Mdl_Skate_AddNetworkMsgHandlers);
    // GameNet::Manager::s_join_state_code
    patchCall(0x0050d7c1, (void *)Mdl_Skate_AddNetworkMsgHandlers);
    // ScriptStartServer
    patchCall(0x0050d6b3, (void *)Mdl_Skate_StartServer);
}
