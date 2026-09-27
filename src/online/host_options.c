#include "online/host_options.h"

#include "decomp/common.h"
#include "decomp/CStruct.h"
#include "decomp/GameNet_Manager.h"
#include "decomp/Lst_Search.h"
#include "decomp/Net_App.h"
#include "decomp/Net_Dispatcher.h"

static GameModifiers game_modifiers = 0;

int __cdecl handle_change_game_modifiers(Net_MsgHandlerContext *ctx) {
    game_modifiers = ctx->msg;

    for (int flag = 0; flag < NUM_MODIFIERS; flag++) {
        int value = (game_modifiers & (1 << flag)) >> flag;
        CStruct *params = CStruct_New();
        CStruct_AddInteger(params, 0x2e0b1465/*flag*/, flag);
        CStruct_AddInteger(params, 0xe288a7cb/*value*/, value);
        Script_RunScript(0xe07fbf4b/*better4_modifier_set*/, params, 0, 0, 0);
        CStruct_Free(params);
    }
}

void host_options_add_handlers(Net_Dispatcher *dispatcher) {
    Net_Dispatcher_AddHandler(dispatcher, MSG_ID_GAME_MODIFIERS, handle_change_game_modifiers, 0, 0, 0x80);
}

void notify_game_modifiers() {
    GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
    Net_App *server = gamenet_manager->server;

	Lst_Search search = Lst_Search_PlayerInfo();
	GameNet_PlayerInfo *current_player = GameNet_Manager_FirstPlayerInfo(gamenet_manager, &search, 1);

	while (current_player != 0) {
        if (!GameNet_PlayerInfo_IsLocalPlayer(current_player)) {
            printLog("notify_game_modifiers: notifying %s\n", current_player->name);
            void *handle = GameNet_PlayerInfo_GetConnHandle(current_player);
            Net_App_EnqueueMessage(server, handle, MSG_ID_GAME_MODIFIERS, sizeof(GameModifiers), &game_modifiers, 0x80, 0, 0, 0, 0);
        }
        current_player = GameNet_Manager_NextPlayerInfo(gamenet_manager, &search, 1);
	}
}

void __cdecl GameNet_Manager_s_handle_ready_response(int *unk1) {
    static void (__cdecl* _s_handle_ready_response)(int *) = (void *)0x0047cbc0;
    printLog("GameNet::Manager::s_handle_ready_response: called\n");
    _s_handle_ready_response(unk1);
    notify_game_modifiers();
}

void patchHostOptions() {
    patchDWord(0x00486abd + 1, (void *)GameNet_Manager_s_handle_ready_response);
}

int __cdecl CFunc_ChangeGameModifier(CStruct *params) {
	float f_flag = 0;
	if (!CStruct_GetFloat(params, 0x2e0b1465/*flag*/, &f_flag, 0)) {
		printLog("ChangeGameModifier missing param \"flag\" (0x2e0b1465)\n");
		return 0;
	}
    int flag = (int)f_flag;

    if (flag < 0 || flag > 31) {
        printLog("ChangeGameModifier received out-of-range flag %d, expected in [0-31]", flag);
        return 0;
    }

	float f_value = 0;
	if (!CStruct_GetFloat(params, 0xe288a7cb/*value*/, &f_value, 0)) {
		printLog("ChangeGameModifier missing param \"value\" (0xe288a7cb)\n");
		return 0;
	}
    int value = (int)f_value;

    GameModifiers old_mods = game_modifiers;
    if (value == 0) {
        game_modifiers = game_modifiers & ~(1 << flag);
    } else {
        game_modifiers = game_modifiers | (1 << flag);
    }
    printLog("ChangeGameModifier: mods changed from %#08x to %#08x\n", old_mods, game_modifiers);
    notify_game_modifiers();

    return 1;
}
