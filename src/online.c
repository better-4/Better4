#include "online.h"

#include "decomp/CArray.h"
#include "decomp/common.h"
#include "decomp/Mdl_Skate.h"
#include "decomp/GameNet_Manager.h"
#include "decomp/Obj_CSkater.h"
#include "decomp/Obj_CSkaterCam.h"
#include "input.h"
#include "log.h"

#include <SDL2/SDL.h>

#include <d3d9.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <time.h>
#include <windows.h>
#include <winsock2.h>

static GameNet_PlayerInfo* local_observe_target = 0;
uint8_t local_observing = 0;
uint8_t voluntary_observing = 0;

GameNet_PlayerInfo* GetLocalPlayerFast () {
    GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
    if (!gamenet_manager) {printLog("GetLocalPlayerFast: gamenet_manager is NULL\n"); return 0;}
    
    GameNet_PlayerInfo *local_player = GameNet_Manager_GetLocalPlayer(gamenet_manager);
    if (!local_player) {printLog("GetLocalPlayerFast: local_player is NULL\n"); return 0;}
    return local_player;
}

int __cdecl CFunc_GetLocalSkaterIndex(CStruct* params, CScript* script) {
    GameNet_PlayerInfo *local_player = GetLocalPlayerFast();
    if (!local_player) { printLog("CFunc_GetLocalSkaterIndex: local_player is NULL\n"); return 0; }
	Mdl_Skate *skate = Mdl_Skate_Instance();
	if (!skate) { printLog("CFunc_GetLocalSkaterIndex: skate is NULL\n"); return 0; }

    for (uint8_t skater_index = 0; skater_index < 16; skater_index++)
    {
		Obj_CSkater *skater = Mdl_Skate_GetSkater(skate, skater_index);
        if (skater == local_player->skater)
        {
            CStruct* out = CScript_GetParams(script);
            CStruct_AddInteger(out, 0x7F8C98FE/*index*/, (int)skater_index);
            return 1;
        }
    }

    printLog("CFunc_GetLocalSkaterIndex: couldn't find own skater in skater list\n");
    return 0;
}

int __cdecl CFunc_ObserveSelf(CStruct* params) {
    GameNet_PlayerInfo *local_player = GetLocalPlayerFast();
    if (!local_player) { printLog("CFunc_ObserveSelf: local_player is NULL\n"); return 0; }
    Obj_CSkaterCam *local_camera = local_player->skater->camera;

	Obj_CSkaterCam_SetMode(local_camera, 2, 0.0f);
	Obj_CSkaterCam_SetSkater(local_camera, local_player->skater);
    
	local_observe_target = 0;
	local_observing = 0;
	voluntary_observing = 0;
	return 1;
}

int __cdecl CFunc_QueueObserveSelf(CStruct* params) {
	voluntary_observing = 0;
	return 1;
}

int __cdecl CFunc_IsBetterObserving(CStruct* params) {
    return local_observing;
}

int __cdecl CFunc_IsVoluntaryObserving(CStruct* params) {
	return voluntary_observing;
}

// Camera snaps back to local skater when game starts or ends. Function snaps camera back to target if desynced
int __cdecl CFunc_SnapObsCameraBack(CStruct* params) {
    GameNet_PlayerInfo *local_player = GetLocalPlayerFast();
    if (!local_player) { printLog("CFunc_SnapObsCameraBack: local_player is NULL\n"); return 0; }
    
    Obj_CSkaterCam *local_camera = local_player->skater->camera;
	Obj_CSkater *current_skater = Obj_CSkaterCam_GetSkater(local_camera);

	if (current_skater != local_observe_target->skater)
	{
		printLog("SnapObsCameraBack: snapping to target_skater\n");
		Obj_CSkaterCam_SetMode(local_camera, 2, 0.0f);
		Obj_CSkaterCam_SetSkater(local_camera, local_observe_target->skater);
	}
}

int __cdecl CFunc_BetterObserve(CStruct* params) {
    GameNet_PlayerInfo *local_player = GetLocalPlayerFast();
    if (!local_player) { printLog("CFunc_BetterObserve: local_player is NULL\n"); return 0; }
    Obj_CSkaterCam *local_camera = local_player->skater->camera;

	local_observing = 1;
	local_observe_target = local_player;
	voluntary_observing = 1;
	return 1;
}

// Same as CFunc_BetterObserve, but unsets voluntary flag to indicate that we need to leave obs on game end
int __cdecl CFunc_ObserveAfter0(CStruct* params) {
    GameNet_PlayerInfo *local_player = GetLocalPlayerFast();
    if (!local_player) { printLog("CFunc_ObserveAfter0: local_player is NULL\n"); return 0; }
    Obj_CSkaterCam *local_camera = local_player->skater->camera;

	local_observing = 1;
	local_observe_target = local_player;
	voluntary_observing = 0;
	return 1;
}

GameNet_PlayerInfo** GetCurrentPlayerList () {
    GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	if (!gamenet_manager) { printLog("GetCurrentPlayerList: gamenet_manager is NULL\n"); return 0; }
    
    GameNet_PlayerInfo *local_player = GameNet_Manager_GetLocalPlayer(gamenet_manager);
    if (!local_player) {printLog("GetCurrentPlayerList: local_player is NULL\n"); return 0;}
    Obj_CSkaterCam *local_camera = local_player->skater->camera;
    
	static GameNet_PlayerInfo *player_list[8] = {0};
	uint8_t num_players = 0;
	player_list[num_players++] = local_player;

	Lst_Search search = Lst_Search_PlayerInfo();
	GameNet_PlayerInfo *current_player = GameNet_Manager_FirstPlayerInfo(gamenet_manager, &search, 1);

	while (current_player != 0 && num_players < 8)
	{
		uint8_t is_local_player = GameNet_PlayerInfo_IsLocalPlayer(current_player);
		uint8_t is_observing = GameNet_PlayerInfo_IsObserving(current_player);
		if (current_player != local_player && !is_local_player && !is_observing) player_list[num_players++] = current_player;
		current_player = Lst_Search_NextItem(&search);
	}
    return player_list;
}

int __cdecl CFunc_ObserveNext(CStruct* params) {
    GameNet_PlayerInfo* local_player = GetLocalPlayerFast();
    if (!local_player) {printLog("CFunc_ObserveNext: local_player is NULL\n"); return 0;}
    Obj_CSkaterCam *local_camera = local_player->skater->camera;
    
	GameNet_PlayerInfo **player_list= GetCurrentPlayerList();
    if (!player_list) {printLog("CFunc_ObserveNext: player_list is NULL\n"); return 0;}
    GameNet_PlayerInfo *target_player = 0;

    uint8_t target_index = 0;
    uint8_t num_players = 0;
    while (player_list[++num_players]);
    while (local_observe_target != player_list[target_index++]); //Target is on next player at end of while
    
    if (target_index == num_players) target_player = local_player;
    else target_player = player_list[target_index];

    Obj_CSkaterCam_SetMode(local_camera, 2, 0.0f);
    Obj_CSkaterCam_SetSkater(local_camera, target_player->skater);
    local_observe_target = target_player;
    return 1;
}

int __cdecl CFunc_ObservePrev(CStruct* params) {
	GameNet_PlayerInfo* local_player = GetLocalPlayerFast();
    if (!local_player) {printLog("CFunc_ObserveNext: local_player is NULL\n"); return 0;}
    Obj_CSkaterCam *local_camera = local_player->skater->camera;
    
	GameNet_PlayerInfo **player_list= GetCurrentPlayerList();
    if (!player_list) {printLog("CFunc_ObserveNext: player_list is NULL\n"); return 0;}
    GameNet_PlayerInfo *target_player = 0;

    uint8_t num_players = 0;
    while (player_list[++num_players]);
    uint8_t target_index = num_players;
    while (local_observe_target != player_list[target_index--]);  //Target is on prev. player at end of while
    
    if (target_index == 255 /*underflowed back to 255*/) target_player = player_list[num_players - 1];
    else target_player = player_list[target_index];

    Obj_CSkaterCam_SetMode(local_camera, 2, 0.0f);
    Obj_CSkaterCam_SetSkater(local_camera, target_player->skater);
    local_observe_target = target_player;
    return 1;
}

int __cdecl CFunc_GetObsPlayerName(CStruct *params, CScript *script) {
    CStruct *out = CScript_GetParams(script);
    CStruct_AddString(out,0x03C6D1CA/*player_name*/, local_observe_target->name); 
    
    return 1;
}


