#include "online.h"

#include <windows.h>
#include <d3d9.h>

#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <stdbool.h>
#include <SDL2/SDL.h>

#include "decomp/CArray.h"
#include "decomp/common.h"
#include "decomp/Mdl_Skate.h"
#include "decomp/Net_Manager.h"
#include "decomp/Net_PlayerInfo.h"
#include "decomp/Obj_CSkater.h"
#include "decomp/Obj_CSkaterCam.h"
#include <config.h>
#include <gfx.h>
#include <global.h>
#include <input.h>
#include <log.h>
#include <patch.h>
#include <script.h>
#include <gslist/gslist.h>
#include <winsock.h>


static Net_PlayerInfo* local_observe_target = 0;
uint8_t local_observing = 0;
uint8_t voluntary_observing = 0;

int __cdecl CFunc_GetLocalSkaterIndex(CStruct* params, CScript* script) {
	printLog("CFunc_GetLocalSkaterIndex\n");

	Net_Manager *net_manager = Net_Manager_Instance();
	if (!net_manager) { printLog("CFunc_GetLocalSkaterIndex: net_manager is null\n"); return 0; }

	Mdl_Skate *skate = Mdl_Skate_Instance();
	if (!skate) { printLog("CFunc_GetLocalSkaterIndex: skate is null\n"); return 0; }

	Net_PlayerInfo *local_player = Net_Manager_GetLocalPlayer(net_manager);
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
	Net_Manager *net_manager = Net_Manager_Instance();
	if (!net_manager) { printLog("CFunc_ObserveSelf: net_manager is null\n"); return 0; }

	Net_PlayerInfo *local_player = Net_Manager_GetLocalPlayer(net_manager);
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
static uint8_t camera_snapped = 0;
void SnapObsCameraBack(void) {
	if (!local_observing || !local_observe_target) {
		camera_snapped = 0;
		return;
	}

	Net_Manager *net_manager = Net_Manager_Instance();
	if (!net_manager) { printLog("SnapObsCameraBack: net_manager is null\n"); return 0; }

	Net_PlayerInfo *local_player = Net_Manager_GetLocalPlayer(net_manager);
	if (!local_player) { printLog("SnapObsCameraBack: local_player is null\n"); return 0; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("SnapObsCameraBack: local_skater is null\n"); return 0; }

	Obj_CSkaterCam *local_camera = local_skater->camera;
	if (!local_camera) { printLog("SnapObsCameraBack: local_camera is null\n"); return 0; }

	Obj_CSkater *target_skater = local_observe_target->skater;
	Obj_CSkater *current_skater = Obj_CSkaterCam_GetSkater(local_camera);

	if (current_skater == local_skater && current_skater != target_skater)
	{
		if (camera_snapped)
		{
			printLog("SnapObsCameraBack: camera was reset to self, reapplying target=%p\n", local_observe_target);
		}

		Obj_CSkaterCam_SetMode(local_camera, 2, 0.0f);
		Obj_CSkaterCam_SetSkater(local_camera, target_skater);
		camera_snapped = 0;
	}
	else
	{
		camera_snapped = !(current_skater == local_skater);
	}
}

int __cdecl CFunc_BetterObserve(CStruct* params) {
	Net_Manager *net_manager = Net_Manager_Instance();
	if (!net_manager) { printLog("CFunc_BetterObserve: net_manager is null\n"); return 0; }

	Net_PlayerInfo *local_player = Net_Manager_GetLocalPlayer(net_manager);
	if (!local_player) { printLog("CFunc_BetterObserve: local_player is null\n"); return 0; }

	Lst_Search search = Lst_Search_PlayerInfo();
	Net_PlayerInfo *current_player = Net_Manager_FirstPlayerInfo(net_manager, &search, 1);
	Net_PlayerInfo *target_player = 0;

	while (current_player != 0)
	{
		uint32_t is_local_player = Net_PlayerInfo_IsLocalPlayer(current_player);
		uint32_t is_observing = Net_PlayerInfo_IsObserving(current_player);
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
	Net_Manager *net_manager = Net_Manager_Instance();
	if (!net_manager) { printLog("CFunc_ObserveAfter0: net_manager is null\n"); return 0; }

	Net_PlayerInfo *local_player = Net_Manager_GetLocalPlayer(net_manager);
	if (!local_player) { printLog("CFunc_ObserveAfter0: local_player is null\n"); return 0; }

	Lst_Search search = Lst_Search_PlayerInfo();
	Net_PlayerInfo *current_player = Net_Manager_FirstPlayerInfo(net_manager, &search, 1);
	Net_PlayerInfo *target_player = 0;

	while (current_player != 0)
	{
		uint32_t is_local_player = Net_PlayerInfo_IsLocalPlayer(current_player);
		uint32_t is_observing = Net_PlayerInfo_IsObserving(current_player);
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
	voluntary_observing = 1;

	return 1;
}


int ObserveCamCycle(int direction) {
	Net_Manager *net_manager = Net_Manager_Instance();
	if (!net_manager) { printLog("SnapObsCameraBack: net_manager is null\n"); return 0; }

	Net_PlayerInfo *local_player = Net_Manager_GetLocalPlayer(net_manager);
	if (!local_player) { printLog("SnapObsCameraBack: local_player is null\n"); return 0; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("SnapObsCameraBack: local_skater is null\n"); return 0; }

	Obj_CSkaterCam *local_camera = local_skater->camera;
	if (!local_camera) { printLog("SnapObsCameraBack: local_camera is null\n"); return 0; }

	Net_PlayerInfo *players[8];
	uint32_t num_players = 0;
	players[num_players++] = local_player;

	Lst_Search search = Lst_Search_PlayerInfo();
	Net_PlayerInfo *current_player = Net_Manager_FirstPlayerInfo(net_manager, &search, 1);

	while (current_player != 0 && num_players < 8)
	{
		uint32_t is_local_player = Net_PlayerInfo_IsLocalPlayer(current_player);
		uint32_t is_observing = Net_PlayerInfo_IsObserving(current_player);

		if (current_player != local_player && !is_local_player && !is_observing) {
			players[num_players++] = current_player;
		}

		current_player = Lst_Search_NextItem(&search);
	}
	if (num_players <= 1) { printLog("ObserveCamCycle: no other active players to cycle to\n"); return 0; }

	int current_index = 0;
	if (local_observe_target)
	{
		for (int player_index = 0; player_index < num_players; player_index++)
		{
			if (players[player_index] == local_observe_target) {
				current_index = player_index;
				break;
			}
		}
	}

	int target_index = ((current_index + direction) % num_players + num_players) % num_players;
	Net_PlayerInfo *target_player = players[target_index];

	Obj_CSkater *target_skater = target_player->skater;
	if (!target_skater) { printLog("ObserveCamCycle: target_skater is null\n"); return 0; }

	Obj_CSkaterCam_SetMode(local_camera, 2, 0.0f);
	Obj_CSkaterCam_SetSkater(local_camera, target_skater);

	local_observe_target = target_player;

	return 1;
}

int __cdecl CFunc_DisableLocalPlayerInput(CStruct* params) {
	Net_Manager *net_manager = Net_Manager_Instance();
	if (!net_manager) { printLog("CFunc_DisableLocalPlayerInput: net_manager is null\n"); return 0; }

	Net_PlayerInfo *local_player = Net_Manager_GetLocalPlayer(net_manager);
	if (!local_player) { printLog("CFunc_DisableLocalPlayerInput: local_player is null\n"); return 0; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("CFunc_DisableLocalPlayerInput: local_skater is null\n"); return 0; }
 
	local_skater->input_disabled = 1;

	return 1;
}
 
int __cdecl CFunc_EnableLocalPlayerInput(CStruct* params) {
	Net_Manager *net_manager = Net_Manager_Instance();
	if (!net_manager) { printLog("CFunc_EnableLocalPlayerInput: net_manager is null\n"); return 0; }

	Net_PlayerInfo *local_player = Net_Manager_GetLocalPlayer(net_manager);
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

	Net_Manager *net_manager = Net_Manager_Instance();
	if (!net_manager) { printLog("ObsInputDisabled: net_manager is null\n"); return 0; }

	Net_PlayerInfo *local_player = Net_Manager_GetLocalPlayer(net_manager);
	if (!local_player) { printLog("ObsInputDisabled: local_player is null\n"); return 0; }

	Obj_CSkater *local_skater = local_player->skater;
	if (!local_skater) { printLog("ObsInputDisabled: local_skater is null\n"); return 0; }

	local_skater->input_disabled = 1;
}

int __cdecl CFunc_GetServerList(CStruct *params, CScript *script) {
	// XXX (ellie): Max 256 servers, 256 bytes each, potential for buffer overflow but surely we'll be fine... right?
	char servers[256][256] = {{0}};
	uint32_t num_servers = 0;

	gslist("thps4pc", "\\hostname\\gamever\\gametype\\gamemode\\mapname\\numplayers", servers, &num_servers);

	CArray *array = CArray_New();
	CArray_SetSizeAndType(array, num_servers, TYPE_STRUCTURE);

	for (int i = 0; i < num_servers; i++) {
		char ip[16] = "",
		     hostname[64] = "",
			 gamever[64] = "",
		     gametype[64] = "",
		     gamemode[64] = "",
			 mapname[64] = "",
		     numplayers[64] = "";
		uint32_t port = 0;

		char *server = servers[i];
		// TODO: use sscanf_s
		sscanf(server, "%[^:]:%d \\hostname\\%[^\\]\\gamever\\%[^\\]\\gametype\\%[^\\]\\gamemode\\%[^\\]\\mapname\\%[^\\]\\numplayers\\%[^\\]", ip, &port, hostname, gamever, gametype, gamemode, mapname, numplayers);

		printLog("Server %d (%d chars): %s\n", i, strlen(server), server);
		printLog("Server %d: %s:%d hostname=%s gamever=%s gametype=%s gamemode=%s mapname=%s numplayers=%s\n", i, ip, port, hostname, gamever, gametype, gamemode, mapname, numplayers);

		CStruct *struc = CStruct_New();
		CStruct_AddInteger(struc, 0x7f8c98fe/*index*/, i);
		CStruct_AddString(struc, 0x5a1c4cd2/*ip*/, ip);
		CStruct_AddInteger(struc, 0xbc6ea233/*port*/, port);
		CStruct_AddString(struc, 0x1aae3fee/*hostname*/, hostname);
		CStruct_AddString(struc, 0x748da1c8/*gamever*/, gamever);
		CStruct_AddString(struc, 0x2510a2e9/*gametype*/, gametype);
		CStruct_AddString(struc, 0x3e04b26b/*gamemode*/, gamemode);
		CStruct_AddString(struc, 0xcdef908e/*mapname*/, mapname);
		CStruct_AddString(struc, 0x99a30c62/*numplayers*/, numplayers);
		CArray_SetStructure(array, i, struc);
		// CStruct_Free(struc); // XXX (ellie): Does this actually get cleaned up by CArray_Free?
	}

	CStruct *out = CScript_GetParams(script);
	CStruct_AddArray(out, 0x30b77607/*server_list*/, array);
	CArray_Free(array);

	return 1;
}
