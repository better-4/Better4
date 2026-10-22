#include "online/host_options.h"

#include "decomp/common.h"
#include "decomp/CStruct.h"
#include "decomp/GameNet_Manager.h"
#include "decomp/Lst_Search.h"
#include "decomp/Net_App.h"
#include "decomp/Net_Dispatcher.h"

static GameModifiers game_modifiers = 0;
static GameModifiers level_objects = 0;

void notify_game_modifiers() {
    GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
    Net_App *server = gamenet_manager->server;

	Lst_Search search = Lst_Search_PlayerInfo();
	GameNet_PlayerInfo *current_player = GameNet_Manager_FirstPlayerInfo(gamenet_manager, &search, 1);

	while (current_player != 0) {
        if (!GameNet_PlayerInfo_IsLocalPlayer(current_player)) {
            logDebug("notify_game_modifiers: notifying %s", current_player->name);
            void *handle = GameNet_PlayerInfo_GetConnHandle(current_player);
            Net_App_EnqueueMessage(server, handle, MSG_ID_GAME_MODIFIERS, sizeof(GameModifiers), &game_modifiers, 0x80, 0, 0, 0, 0);
        }
        current_player = GameNet_Manager_NextPlayerInfo(gamenet_manager, &search, 1);
	}
}

int __cdecl handle_change_game_modifiers(Net_MsgHandlerContext *ctx) {
    GameModifiers old_mods = game_modifiers;
    game_modifiers = ctx->msg;

    logDebug("handle_change_game_modifiers: received new mods from server: old=%#08x, new=%#08x", old_mods, game_modifiers);

    for (int flag = 0; flag < NUM_MODIFIERS; flag++) {
        int value = (game_modifiers & (1 << flag)) >> flag;
        CStruct *params = CStruct_New();
        CStruct_AddInteger(params, 0x2e0b1465/*flag*/, flag);
        CStruct_AddInteger(params, 0xe288a7cb/*value*/, value);
        Script_RunScript(0xe07fbf4b/*better4_modifier_set*/, params, 0, 0, 0);
        CStruct_Free(params);
    }
}

void notify_level_objects() {
    GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
    Net_App *server = gamenet_manager->server;

	Lst_Search search = Lst_Search_PlayerInfo();
	GameNet_PlayerInfo *current_player = GameNet_Manager_FirstPlayerInfo(gamenet_manager, &search, 1);

	while (current_player != 0) {
        if (!GameNet_PlayerInfo_IsLocalPlayer(current_player)) {
            logDebug("notify_level_objects: notifying %s", current_player->name);
            void *handle = GameNet_PlayerInfo_GetConnHandle(current_player);
            Net_App_EnqueueMessage(server, handle, MSG_ID_LEVEL_OBJECTS, sizeof(LevelObjects), &level_objects, 0x80, 0, 0, 0, 0);
        }
        current_player = GameNet_Manager_NextPlayerInfo(gamenet_manager, &search, 1);
	}
}

int __cdecl handle_change_level_objects(Net_MsgHandlerContext *ctx) {
    LevelObjects old_level_objects = game_modifiers;
    level_objects = ctx->msg;

    logDebug("handle_change_level_objects: received new lvlobjs from server: old=%#08x, new=%#08x", old_level_objects, level_objects);

    for (int flag = 0; flag < NUM_LVLOBJS; flag++) {
        int value = (level_objects & (1 << flag)) >> flag;
        CStruct *params = CStruct_New();
        CStruct_AddInteger(params, 0xa8ba5c68/*bit*/, flag);
        CStruct_AddInteger(params, 0xe288a7cb/*value*/, value);
        Script_RunScript(0xfa25917e/*better4_lvlobj_set*/, params, 0, 0, 0);
        CStruct_Free(params);
    }
}

uint32_t __cdecl GameNet_Manager_s_handle_ready_response(int *unk1) {
    static uint32_t (__cdecl* _s_handle_ready_response)(int *) = (void *)0x0047cbc0;
    int ret = _s_handle_ready_response(unk1);
    notify_game_modifiers();
    notify_level_objects();
    return ret;
}

void host_options_add_handlers(Net_Dispatcher *dispatcher) {
    Net_Dispatcher_AddHandler(dispatcher, MSG_ID_GAME_MODIFIERS, handle_change_game_modifiers, 0, 0, 0x80);
    Net_Dispatcher_AddHandler(dispatcher, MSG_ID_LEVEL_OBJECTS, handle_change_level_objects, 0, 0, 0x80);
}

void patchHostOptions() {
    // GameNet::Manager::SpawnServer (0x004869a0)
    patchDWord(0x00486abd + 1, (void *)GameNet_Manager_s_handle_ready_response);

    // XXX (ellie): Technically this allows people to cheat in online lobbies - would be
    // more proper to instead check if the modifier is enabled when in net game.

    // Obj::CSkater::DoGameLogic (0x004c8ed0)
    patchNop(0x004c91dd, 2); // Don't disallow CHEAT_ALWAYS_SPECIAL in net games

    // Obj::CSkater::DoRailPhysics (0x004c4030)
    patchNop(0x004c48ee, 2); // Don't disallow CHEAT_PERFECT_RAIL in net games

    // Obj::CSkater::DoOnGroundPhysics (0x004bfe30)
    patchNop(0x004c006e, 6); // Don't disallow CHEAT_PERFECT_SKITCH in net games
    patchNop(0x004c00df, 2); // Don't disallow CHEAT_PERFECT_MANUAL in net games
}

int __cdecl CFunc_ChangeGameModifier(CStruct *params) {
	float f_flag = 0;
	if (!CStruct_GetFloat(params, 0x2e0b1465/*flag*/, &f_flag, 0)) {
		logWarning("ChangeGameModifier missing param \"flag\" (0x2e0b1465)");
		return 0;
	}
    int flag = (int)f_flag;

    if (flag < 0 || flag > 31) {
        logWarning("ChangeGameModifier received out-of-range flag %d, expected in [0-31]", flag);
        return 0;
    }

	float f_value = 0;
	if (!CStruct_GetFloat(params, 0xe288a7cb/*value*/, &f_value, 0)) {
		logWarning("ChangeGameModifier missing param \"value\" (0xe288a7cb)");
		return 0;
	}
    int value = (int)f_value;

    GameModifiers old_mods = game_modifiers;
    if (value == 0) {
        game_modifiers &= ~(1 << flag);
    } else {
        game_modifiers |= (1 << flag);
    }

    if (game_modifiers != old_mods) {
        logDebug("ChangeGameModifier: mods changed from %#08x to %#08x", old_mods, game_modifiers);
        notify_game_modifiers();
    }

    return 1;
}

int __cdecl CFunc_ChangeLevelObject(CStruct *params) {
	float f_bit = 0;
	if (!CStruct_GetFloat(params, 0xa8ba5c68/*bit*/, &f_bit, 0)) {
		logWarning("ChangeLevelObject missing param \"bit\" (0xa8ba5c68)");
		return 0;
	}
    int bit = (int)f_bit;

    if (bit < 0 || bit > 31) {
        logWarning("ChangeLevelObject received out-of-range bit %d, expected in [0-31]", bit);
        return 0;
    }

	float f_value = 0;
	if (!CStruct_GetFloat(params, 0xe288a7cb/*value*/, &f_value, 0)) {
		logWarning("ChangeLevelObject missing param \"value\" (0xe288a7cb)");
		return 0;
	}
    int value = (int)f_value;

    GameModifiers old_level_objects = level_objects;
    if (value == 0) {
        level_objects &= ~(1 << bit);
    } else {
        level_objects |= (1 << bit);
    }

    if (level_objects != old_level_objects) {
        logDebug("ChangeLevelObject: lvlobjs changed from %#08x to %#08x", old_level_objects, level_objects);
        notify_level_objects();
    }

    return 1;
}

int __cdecl CFunc_ResetLevelObjects(CStruct *params) {
    level_objects = 0;
    return 1;
}
