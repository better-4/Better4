#include "online.h"

#include "decomp/CArray.h"
#include "decomp/common.h"
#include "decomp/Mdl_Skate.h"
#include "decomp/GameNet_Manager.h"
#include "decomp/GameNet_PlayerInfo.h"
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

int __cdecl CFunc_GetLocalSkaterIndex(CStruct* params, CScript* script) {
	printLog("CFunc_GetLocalSkaterIndex\n");

	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	if (!gamenet_manager) { printLog("CFunc_GetLocalSkaterIndex: gamenet_manager is null\n"); return 0; }

	Mdl_Skate *skate = Mdl_Skate_Instance();
	if (!skate) { printLog("CFunc_GetLocalSkaterIndex: skate is null\n"); return 0; }

	GameNet_PlayerInfo *local_player = GameNet_Manager_GetLocalPlayer(gamenet_manager);
	if (!local_player) { printLog("CFunc_GetLocalSkaterIndex: local_player is null\n"); return 0; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("CFunc_GetLocalSkaterIndex: local_skater is null\n"); return 0; }

    for (int skater_index = 0; skater_index < 8; skater_index++)
    {
		Obj_CSkater *skater = Mdl_Skate_GetSkater(skate, skater_index);
        if (skater == local_skater)
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
	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	if (!gamenet_manager) { printLog("CFunc_ObserveSelf: gamenet_manager is null\n"); return 0; }

	GameNet_PlayerInfo *local_player = GameNet_Manager_GetLocalPlayer(gamenet_manager);
	if (!local_player) { printLog("CFunc_ObserveSelf: local_player is null\n"); return 0; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("CFunc_ObserveSelf: local_skater is null\n"); return 0; }

	Obj_CSkaterCam *local_camera = local_skater->camera;
	if (!local_camera) { printLog("CFunc_ObserveSelf: local_camera is null\n"); return 0; }

	Obj_CSkaterCam_SetMode(local_camera, 2, 0.0f);
	Obj_CSkaterCam_SetSkater(local_camera, local_skater);

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

// Happens on game starts and ends, which desyncs tracking
// Function runs every frame to check who you're observing vs tracked target, snaps back to target if mismatch
void SnapObsCameraBack(void) {
	if (!local_observing || !local_observe_target) {
		return;
	}

	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	if (!gamenet_manager) { printLog("SnapObsCameraBack: gamenet_manager is null\n"); return; }

	GameNet_PlayerInfo *local_player = GameNet_Manager_GetLocalPlayer(gamenet_manager);
	if (!local_player) { printLog("SnapObsCameraBack: local_player is null\n"); return; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("SnapObsCameraBack: local_skater is null\n"); return; }

	Obj_CSkaterCam *local_camera = local_skater->camera;
	if (!local_camera) { printLog("SnapObsCameraBack: local_camera is null\n"); return; }

	Obj_CSkater *target_skater = local_observe_target->skater;
	Obj_CSkater *current_skater = Obj_CSkaterCam_GetSkater(local_camera);

	if (current_skater != target_skater)
	{
		printLog("SnapObsCameraBack: snapping to target_skater=%p\n", target_skater);
		Obj_CSkaterCam_SetMode(local_camera, 2, 0.0f);
		Obj_CSkaterCam_SetSkater(local_camera, target_skater);
	}
}

int __cdecl CFunc_BetterObserve(CStruct* params) {
	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	if (!gamenet_manager) { printLog("CFunc_BetterObserve: gamenet_manager is null\n"); return 0; }

	GameNet_PlayerInfo *local_player = GameNet_Manager_GetLocalPlayer(gamenet_manager);
	if (!local_player) { printLog("CFunc_BetterObserve: local_player is null\n"); return 0; }

	Lst_Search search = Lst_Search_PlayerInfo();
	GameNet_PlayerInfo *current_player = GameNet_Manager_FirstPlayerInfo(gamenet_manager, &search, 1);
	GameNet_PlayerInfo *target_player = 0;

	while (current_player != 0)
	{
		uint32_t is_local_player = GameNet_PlayerInfo_IsLocalPlayer(current_player);
		uint32_t is_observing = GameNet_PlayerInfo_IsObserving(current_player);
		if (current_player != local_player && !is_local_player && !is_observing) {
			target_player = current_player;
			break;
		}
		current_player = Lst_Search_NextItem(&search);
	}
	if (!target_player) { printLog("CFunc_BetterObserve: target_player is null\n"); return 0; }

	Obj_CSkater *target_skater = target_player->skater;
	if (!target_skater) { printLog("CFunc_BetterObserve: target_skater is null\n"); return 0; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("CFunc_BetterObserve: local_skater is null\n"); return 0; }

	Obj_CSkaterCam *local_camera = local_skater->camera;
	if (!local_camera) { printLog("CFunc_BetterObserve: local_camera is null\n"); return 0; }

	Obj_CSkaterCam_SetMode(local_camera, 2, 0.0f);
	Obj_CSkaterCam_SetSkater(local_camera, target_skater);

	local_observing = 1;
	local_observe_target = target_player;
	voluntary_observing = 1;

	return 1;
}

// Same as CFunc_BetterObserve, but unsets voluntary flag to indicate that we need to leave obs on game end
int __cdecl CFunc_ObserveAfter0(CStruct* params) {
	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	if (!gamenet_manager) { printLog("CFunc_ObserveAfter0: gamenet_manager is null\n"); return 0; }

	GameNet_PlayerInfo *local_player = GameNet_Manager_GetLocalPlayer(gamenet_manager);
	if (!local_player) { printLog("CFunc_ObserveAfter0: local_player is null\n"); return 0; }

	Lst_Search search = Lst_Search_PlayerInfo();
	GameNet_PlayerInfo *current_player = GameNet_Manager_FirstPlayerInfo(gamenet_manager, &search, 1);
	GameNet_PlayerInfo *target_player = 0;

	while (current_player != 0)
	{
		uint32_t is_local_player = GameNet_PlayerInfo_IsLocalPlayer(current_player);
		uint32_t is_observing = GameNet_PlayerInfo_IsObserving(current_player);
		if (current_player != local_player && !is_local_player && !is_observing) {
			target_player = current_player;
			break;
		}
		current_player = Lst_Search_NextItem(&search);
	}
	if (!target_player) { printLog("CFunc_ObserveAfter0: target_player is null\n"); return 0; }

	Obj_CSkater *target_skater = target_player->skater;
	if (!target_skater) { printLog("CFunc_ObserveAfter0: target_skater is null\n"); return 0; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("CFunc_ObserveAfter0: local_skater is null\n"); return 0; }

	Obj_CSkaterCam *local_camera = local_skater->camera;
	if (!local_camera) { printLog("CFunc_ObserveAfter0: local_camera is null\n"); return 0; }

	Obj_CSkaterCam_SetMode(local_camera, 2, 0.0f);
	Obj_CSkaterCam_SetSkater(local_camera, target_skater);

	local_observing = 1;
	local_observe_target = target_player;
	voluntary_observing = 0;

	return 1;
}


int ObserveCamCycle(int direction) {
	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	if (!gamenet_manager) { printLog("SnapObsCameraBack: gamenet_manager is null\n"); return 0; }

	GameNet_PlayerInfo *local_player = GameNet_Manager_GetLocalPlayer(gamenet_manager);
	if (!local_player) { printLog("SnapObsCameraBack: local_player is null\n"); return 0; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("SnapObsCameraBack: local_skater is null\n"); return 0; }

	Obj_CSkaterCam *local_camera = local_skater->camera;
	if (!local_camera) { printLog("SnapObsCameraBack: local_camera is null\n"); return 0; }

	GameNet_PlayerInfo *players[8];
	uint32_t num_players = 0;
	players[num_players++] = local_player;

	Lst_Search search = Lst_Search_PlayerInfo();
	GameNet_PlayerInfo *current_player = GameNet_Manager_FirstPlayerInfo(gamenet_manager, &search, 1);

	while (current_player != 0 && num_players < 8)
	{
		uint32_t is_local_player = GameNet_PlayerInfo_IsLocalPlayer(current_player);
		uint32_t is_observing = GameNet_PlayerInfo_IsObserving(current_player);

		if (current_player != local_player && !is_local_player && !is_observing) {
			players[num_players++] = current_player;
		}

		current_player = Lst_Search_NextItem(&search);
	}
	if (num_players <= 1) { printLog("ObserveCamCycle: no other active players to cycle to\n"); return 0; }

	uint32_t current_index = 0;
	if (local_observe_target)
	{
		for (uint32_t player_index = 0; player_index < num_players; player_index++)
		{
			if (players[player_index] == local_observe_target) {
				current_index = player_index;
				break;
			}
		}
	}

	uint32_t target_index = ((current_index + direction) % num_players + num_players) % num_players;
	GameNet_PlayerInfo *target_player = players[target_index];

	Obj_CSkater *target_skater = target_player->skater;
	if (!target_skater) { printLog("ObserveCamCycle: target_skater is null\n"); return 0; }

	Obj_CSkaterCam_SetMode(local_camera, 2, 0.0f);
	Obj_CSkaterCam_SetSkater(local_camera, target_skater);

	local_observe_target = target_player;

	return 1;
}

int __cdecl CFunc_DisableLocalPlayerInput(CStruct* params) {
	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	if (!gamenet_manager) { printLog("CFunc_DisableLocalPlayerInput: gamenet_manager is null\n"); return 0; }

	GameNet_PlayerInfo *local_player = GameNet_Manager_GetLocalPlayer(gamenet_manager);
	if (!local_player) { printLog("CFunc_DisableLocalPlayerInput: local_player is null\n"); return 0; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("CFunc_DisableLocalPlayerInput: local_skater is null\n"); return 0; }
 
	local_skater->input_disabled = 1;

	return 1;
}
 
int __cdecl CFunc_EnableLocalPlayerInput(CStruct* params) {
	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	if (!gamenet_manager) { printLog("CFunc_EnableLocalPlayerInput: gamenet_manager is null\n"); return 0; }

	GameNet_PlayerInfo *local_player = GameNet_Manager_GetLocalPlayer(gamenet_manager);
	if (!local_player) { printLog("CFunc_EnableLocalPlayerInput: local_player is null\n"); return 0; }
 
	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("CFunc_EnableLocalPlayerInput: local_skater is null\n"); return 0; }
 
	local_skater->input_disabled = 0;

	if (local_skater->camera_control_flag == 0) {
		Obj_CSkaterCam *local_camera = local_skater->camera;
		if (!local_camera) { printLog("CFunc_EnableLocalPlayerInput: local_camera is null\n"); return 0; }

		Obj_CSkaterCam_EnableInputHandler(local_camera, 1);
	}
 
	return 1;
}

void ObsInputDisabled(void) {
	if (!local_observing) return;

	GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();
	if (!gamenet_manager) { printLog("ObsInputDisabled: gamenet_manager is null\n"); return; }

	GameNet_PlayerInfo *local_player = GameNet_Manager_GetLocalPlayer(gamenet_manager);
	if (!local_player) { printLog("ObsInputDisabled: local_player is null\n"); return; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("ObsInputDisabled: local_skater is null\n"); return; }

	local_skater->input_disabled = 1;
}
