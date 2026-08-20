#include <windows.h>
#include <d3d9.h>

#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <stdbool.h>
#include <SDL2/SDL.h>

#include <config.h>
#include <gfx.h>
#include <global.h>
#include <input.h>
#include <log.h>
#include <patch.h>
#include <script.h>
#include <qb.h>
#include <gslist/gslist.h>
#include <winsock.h>

#define PARTY_ADDR_GAMENET_MANAGER 0x00ab5394

extern char configFile[1024];
static void* local_observe_target = 0;
uint8_t local_observing = 0;
uint8_t voluntary_observing = 0;

static void* (__fastcall* GetLocalPlayer)(void*) = (void*)0x00489ac0;
static uint32_t(__fastcall* IsObserving_)(void*) = (void*)0x00491560;

typedef void* (__fastcall* FirstPlayerInfo_t)(void* gameNetManager, int unused, void* searchCtx, char flag);
typedef void* (__fastcall* NextPlayerInfo_t)(void* searchCtx);
static FirstPlayerInfo_t FirstPlayerInfo = (FirstPlayerInfo_t)0x00489730;
static NextPlayerInfo_t  NextPlayerInfo = (NextPlayerInfo_t)0x00432b10;

typedef uint32_t(__fastcall* IsLocalPlayer_t)(void*);
static IsLocalPlayer_t IsLocalPlayer_ = (IsLocalPlayer_t)0x00491540;

typedef void(__fastcall* SetCamMode_t)(void* cameraComponent, int unused, int mode, float param);
static SetCamMode_t SetCamMode = (SetCamMode_t)0x004d9bf0;

typedef void(__fastcall* SetCamSkater_t)(void* cameraComponent, int unused, void* skater);
static SetCamSkater_t SetCamSkater = (SetCamSkater_t)0x004dc310;

typedef void* (__fastcall* GetCamSkater_t)(void* cameraComponent);
static GetCamSkater_t GetCamSkater = (GetCamSkater_t)0x004dc320;


static void* GetCameraComponent(void* self, void** outSkater) {
	void* skater = *(void**)((uint8_t*)self + 0x14);
	if (outSkater) *outSkater = skater;
	return skater ? *(void**)((uint8_t*)skater + 0x37d4) : 0;
}

int __cdecl CFunc_ObserveSelf(CStruct* params) {
    void* gamenetManager = *(void**)PARTY_ADDR_GAMENET_MANAGER;
    void* self = gamenetManager ? GetLocalPlayer(gamenetManager) : 0;
    if (!self) { printLog("CFunc_ObserveSelf: no local player\n"); return 1; }

    void* mySkater = 0;
    void* cam = GetCameraComponent(self, &mySkater);
    if (!cam || !mySkater) { printLog("CFunc_ObserveSelf: missing cam or skater\n"); return 1; }

    SetCamMode(cam, 0, 2, 0.0f);
    SetCamSkater(cam, 0, mySkater);
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
	if (!local_observing || !local_observe_target) { camera_snapped = 0; return; }

	void* gamenetManager = *(void**)PARTY_ADDR_GAMENET_MANAGER;
	void* self = gamenetManager ? GetLocalPlayer(gamenetManager) : 0;
	if (!self) return;

	void* mySkater = 0;
	void* cam = GetCameraComponent(self, &mySkater);
	if (!cam || !mySkater) return;

	void* targetSkater = *(void**)((uint8_t*)local_observe_target + 0x14);
	if (!targetSkater) return;

	void* current = GetCamSkater(cam);
	if (current == mySkater && current != targetSkater) 
	{
		if (camera_snapped) 
		{
			printLog("SnapObsCameraBack: camera was reset to self, reapplying target=%p\n", local_observe_target);
		}
		SetCamMode(cam, 0, 2, 0.0f);
		SetCamSkater(cam, 0, targetSkater);
		camera_snapped = 0;
	}
	else
	{
		camera_snapped = !(current == mySkater);
	}
}

int __cdecl CFunc_BetterObserve(CStruct* params) {
	void* gamenetManager = *(void**)PARTY_ADDR_GAMENET_MANAGER;
	void* self = gamenetManager ? GetLocalPlayer(gamenetManager) : 0;
	if (!self) { printLog("CFunc_BetterObserve: no local player\n"); return 1; }

	void* target = 0;
	struct { void* vtable; void* dummy; } searchCtx = { (void*)0x0058aa94, 0 };
	void* p = FirstPlayerInfo(gamenetManager, 0, &searchCtx, '\x01');
	while (p != 0)
	{
		if (p != self && !IsLocalPlayer_(p) && !IsObserving_(p)) { target = p; break; }
		p = NextPlayerInfo(&searchCtx);
	}
	if (!target) { printLog("CFunc_BetterObserve: no other active player found\n"); return 1; }

	void* targetSkater = *(void**)((uint8_t*)target + 0x14);
	if (!targetSkater) { printLog("CFunc_BetterObserve: target has no skater\n"); return 1; }

	void* mySkater = 0;
	void* cam = GetCameraComponent(self, &mySkater);
	if (!cam || !mySkater) { printLog("CFunc_BetterObserve: missing cam or own skater\n"); return 1; }

	SetCamMode(cam, 0, 2, 0.0f);
	SetCamSkater(cam, 0, targetSkater);
	local_observing = 1;
	local_observe_target = target;
	voluntary_observing = 1;
	return 1;
}

// Same as CFunc_BetterObserve, but unsets voluntary flag to indicate that we need to leave obs on game end
int __cdecl CFunc_ObserveAfter0(CStruct* params) {
	void* gamenetManager = *(void**)PARTY_ADDR_GAMENET_MANAGER;
	void* self = gamenetManager ? GetLocalPlayer(gamenetManager) : 0;
	if (!self) { printLog("CFunc_BetterObserve: no local player\n"); return 1; }

	void* target = 0;
	struct { void* vtable; void* dummy; } searchCtx = { (void*)0x0058aa94, 0 };
	void* p = FirstPlayerInfo(gamenetManager, 0, &searchCtx, '\x01');
	while (p != 0)
	{
		if (p != self && !IsLocalPlayer_(p) && !IsObserving_(p)) { target = p; break; }
		p = NextPlayerInfo(&searchCtx);
	}
	if (!target) { printLog("CFunc_BetterObserve: no other active player found\n"); return 1; }

	void* targetSkater = *(void**)((uint8_t*)target + 0x14);
	if (!targetSkater) { printLog("CFunc_BetterObserve: target has no skater\n"); return 1; }

	void* mySkater = 0;
	void* cam = GetCameraComponent(self, &mySkater);
	if (!cam || !mySkater) { printLog("CFunc_BetterObserve: missing cam or own skater\n"); return 1; }

	SetCamMode(cam, 0, 2, 0.0f);
	SetCamSkater(cam, 0, targetSkater);
	local_observing = 1;
	local_observe_target = target;
	voluntary_observing = 0;

	return 1;
}


int ObserveCamCycle(int direction) {
	void* gamenetManager = *(void**)PARTY_ADDR_GAMENET_MANAGER;
	void* self = gamenetManager ? GetLocalPlayer(gamenetManager) : 0;
	if (!self) { printLog("ObserveCamCycle: no local player\n"); return 1; }

	void* mySkater = 0;
	void* cam = GetCameraComponent(self, &mySkater);
	if (!cam || !mySkater) { printLog("ObserveCamCycle: missing cam or own skater\n"); return 1; }

	void* players[8];
	int count = 0;
	players[count++] = self;

	struct { void* vtable; void* dummy; } searchCtx = { (void*)0x0058aa94, 0 };
	void* p = FirstPlayerInfo(gamenetManager, 0, &searchCtx, '\x01');
	while (p != 0 && count < 8) 
	{
		if (p != self && !IsLocalPlayer_(p) && !IsObserving_(p)) {players[count++] = p;}
		p = NextPlayerInfo(&searchCtx);
	}

	if (count <= 1) { printLog("ObserveCamCycle: no other active players to cycle to\n"); return 1; }

	int current = 0;
	if (local_observe_target) 
	{
		for (int i = 0; i < count; i++) 
		{
			if (players[i] == local_observe_target) { current = i; break; }
		}
	}
	int newIndex = ((current + direction) % count + count) % count;
	void* target = players[newIndex];
	bool willBeSelf = (newIndex == 0);

	void* targetSkater = willBeSelf ? mySkater : *(void**)((uint8_t*)target + 0x14);
	if (!targetSkater) { printLog("ObserveCamCycle: target has no skater\n"); return 1; }

	SetCamMode(cam, 0, 2, 0.0f);
	SetCamSkater(cam, 0, targetSkater);
	local_observe_target = willBeSelf ? 0 : target;

	return 1;
}

typedef void(__fastcall* WriteCamFlagByte_t)(void* cameraComponent, int unused, uint8_t param);
static WriteCamFlagByte_t WriteCamFlagByte = (WriteCamFlagByte_t)0x004d9b80;
 
int __cdecl CFunc_DisableLocalPlayerInput(CStruct* params) {
	void* gamenetManager = *(void**)PARTY_ADDR_GAMENET_MANAGER;
	void* self = gamenetManager ? GetLocalPlayer(gamenetManager) : 0;
	if (!self) { printLog("CFunc_DisableLocalPlayerInput: no local player\n"); return 1; }
 
	void* mySkater = *(void**)((uint8_t*)self + 0x14);
	if (!mySkater) { printLog("CFunc_DisableLocalPlayerInput: no skater\n"); return 1; }
 
	*(uint8_t*)((uint8_t*)mySkater + 0x97a) = 1;
	return 1;
}
 
int __cdecl CFunc_EnableLocalPlayerInput(CStruct* params) {
	void* gamenetManager = *(void**)PARTY_ADDR_GAMENET_MANAGER;
	void* self = gamenetManager ? GetLocalPlayer(gamenetManager) : 0;
	if (!self) { printLog("CFunc_EnableLocalPlayerInput: no local player\n"); return 1; }
 
	void* mySkater = *(void**)((uint8_t*)self + 0x14);
	if (!mySkater) { printLog("CFunc_EnableLocalPlayerInput: no skater\n"); return 1; }
 
	*(uint8_t*)((uint8_t*)mySkater + 0x97a) = 0;
 
	if (*(void**)((uint8_t*)mySkater + 0x37c4) == 0) {
		void* cam = *(void**)((uint8_t*)mySkater + 0x37d4);
		if (cam) WriteCamFlagByte(cam, 0, 1);
	}
	return 1;
}

void ObsInputDisabled(void) {
	if (!local_observing) return;

	void* gamenetManager = *(void**)PARTY_ADDR_GAMENET_MANAGER;
	void* self = gamenetManager ? GetLocalPlayer(gamenetManager) : 0;
	if (!self) return;

	void* mySkater = *(void**)((uint8_t*)self + 0x14);
	if (!mySkater) return;

	*(uint8_t*)((uint8_t*)mySkater + 0x97a) = 1;
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
