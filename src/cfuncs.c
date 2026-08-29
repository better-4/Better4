#include "cfuncs.h"

#include "input.h"
#include "online.h"
#include "online/client.h"
#include "online/server.h"
#include "online/server_list.h"
#include "version.h"

#include <log.h>
#include <patch.h>
#include <string.h>
#include <windows.h>

// #define THPS4_CFUNC_LUT_STOP 0x005ad670
// #define THPS4_CFUNC_LUT_SIZE 0x22f8

#define THPS4_CFUNC_LUT_START 0x005aba40
#define THPS4_NUM_CFUNCS 0x386
#define BETTER4_NUM_CFUNCS 33
#define NUM_CFUNCS (THPS4_NUM_CFUNCS + BETTER4_NUM_CFUNCS)

extern char configFile[1024];

CFunc cfuncs[NUM_CFUNCS];

void initCFuncs() {
	// Copy all CFuncs from the THPS4 LUT to our `cfuncs`
    memcpy(&cfuncs, THPS4_CFUNC_LUT_START, sizeof(CFunc) * THPS4_NUM_CFUNCS);
}

int cfunc_index = THPS4_NUM_CFUNCS;
void addCFunc(const char *name, void *func) {
    CFunc *cfunc = &cfuncs[cfunc_index++];
    cfunc->name = name;
    cfunc->func = func;
}

float *screenAspectRatio_b4 = 0x00ab4b38;
int __cdecl CFunc_AutoAspectRatio(CStruct* params) 
{
    setAspectRatio (screenAspectRatio_b4);
    return 1;
}

void addCFuncs() {
    addCFunc("Better4Version", (void *)CFunc_Better4Version);
    addCFunc("GetLocalSkaterIndex", (void *)CFunc_GetLocalSkaterIndex);
	addCFunc("ObserveSelf", (void *)CFunc_ObserveSelf);
	addCFunc("QueueObserveSelf", (void*)CFunc_QueueObserveSelf);
	addCFunc("IsBetterObserving", (void *)CFunc_IsBetterObserving);
	addCFunc("ObserveAfter0", (void*)CFunc_ObserveAfter0);
	addCFunc("BetterObserve", (void *)CFunc_BetterObserve);
	addCFunc("IsVoluntaryObserving", (void*)CFunc_IsVoluntaryObserving);
	addCFunc("DisableLocalPlayerInput", (void *)CFunc_DisableLocalPlayerInput);
	addCFunc("EnableLocalPlayerInput", (void *)CFunc_EnableLocalPlayerInput);
	addCFunc("GetIniBool", (void *)CFunc_GetIniBool);
	addCFunc("GetIniInteger", (void *)CFunc_GetIniInteger);
	addCFunc("SetIniBool", (void *)CFunc_SetIniBool);
	addCFunc("SetIniInteger", (void *)CFunc_SetIniInteger);
	addCFunc("ChangeGlobal", (void *)CFunc_ChangeGlobal);
	addCFunc("SetSpinKeysControl", (void *)CFunc_SetSpinKeysControl);
	addCFunc("SetSpineTransferControl", (void *)CFunc_SetSpineTransferControl);
	addCFunc("SetPauseOnUnfocus", (void *)CFunc_SetPauseOnUnfocus);
    addCFunc("AutoAspectRatio", (void *)CFunc_AutoAspectRatio);
	addCFunc("StartBetterServerList", (void *)CFunc_StartBetterServerList);
	addCFunc("RefreshBetterServerList", (void *)CFunc_RefreshBetterServerList);
	addCFunc("StopBetterServerList", (void *)CFunc_StopBetterServerList);
	addCFunc("NumBetterServers", (void *)CFunc_NumBetterServers);
	addCFunc("FoundBetterServers", (void *)CFunc_FoundBetterServers);
	addCFunc("ChooseBetterServer", (void *)CFunc_ChooseBetterServer);
	addCFunc("DescribeBetterServer", (void *)CFunc_DescribeBetterServer);
	addCFunc("StopDescribingBetterServer", (void *)CFunc_StopDescribingBetterServer);
	addCFunc("StartNatNegotiation", (void *)CFunc_StartNatNegotiation);
	addCFunc("CancelNatNegotiation", (void *)CFunc_CancelNatNegotiation);
	addCFunc("SetHosting", (void *)CFunc_SetHosting);
	addCFunc("IsHosting", (void *)CFunc_IsHosting);
	addCFunc("NotifyStateChanged", (void *)CFunc_NotifyStateChanged);
	addCFunc("StopReporting", (void *)CFunc_StopReporting);
}

void printCFuncs() {
    // sanity check: verify we registered exactly the # of cfuncs we reserved
    if (cfunc_index != NUM_CFUNCS) {
        printLog("WARNING: registered %d cfuncs, expected %d\n", cfunc_index, NUM_CFUNCS);
    }

    // printLog("printing cfuncs we own\n");
    // for (int i = 0; i < NUM_CFUNCS; i++) {
    //     CFunc cfunc = cfuncs[i];
    //     printLog("%s: 0x%p\n", cfunc.name, cfunc.func);
    // }
}

void patchCFuncs() {
	initCFuncs();
	addCFuncs();
	printCFuncs();
    patchWord(0x00511f40 + 1, NUM_CFUNCS); // Script::GetCFunctionLookupTableSize
    patchDWord(0x00512180 + 1, &cfuncs);  // Script::CFunctionLookupTable
}

int __cdecl CFunc_GetIniBool(CStruct *params) {
	char *section = "";
	if (!CStruct_GetString(params, 0xd28c8510, &section, 0)) {
		printLog("GetIniBool missing param \"section\" (0xd28c8510)\n");
		return 0;
	}

	char *key = "";
	if (!CStruct_GetString(params, 0x756f5456, &key, 0)) {
		printLog("GetIniBool missing param \"key\" (0x756f5456)\n");
		return 0;
	}

	return getIniBool(section, key, 0, configFile);
}

int __cdecl CFunc_GetIniInteger(CStruct *params, CScript *script) {
	char *section = "";
	if (!CStruct_GetString(params, 0xd28c8510, &section, 0)) {
		printLog("GetIniInteger missing param \"section\" (0xd28c8510)\n");
		return 0;
	}

	char *key = "";
	if (!CStruct_GetString(params, 0x756f5456, &key, 0)) {
		printLog("GetIniInteger missing param \"key\" (0x756f5456)\n");
		return 0;
	}

	uint32_t value_name_checksum = 0;
	if (!CStruct_GetChecksum(params, 0xbf4212ef, &value_name_checksum, 0)) {
		// NOTE: checksum is for lowercase "valuename"; seemingly case insensitive
		printLog("GetIniInteger missing param \"ValueName\" (0xbf4212ef)\n");
		return 0;
	}

	float def_f = 0;
	CStruct_GetFloat(params, 0xcee685bd, &def_f, 0); // "fallback" (0xcee685bd)
	int def = (int)def_f;
	int ini_value = GetPrivateProfileInt(section, key, def, configFile);

	CStruct *out = CScript_GetParams(script);
	CStruct_AddInteger(out, value_name_checksum, ini_value);

	return 1;
}

int __cdecl CFunc_SetIniBool(CStruct *params, CScript *script) {
	char *section = "";
	if (!CStruct_GetString(params, 0xd28c8510, &section, 0)) {
		printLog("SetIniBool missing param \"section\" (0xd28c8510)\n");
		return 0;
	}

	char *key = "";
	if (!CStruct_GetString(params, 0x756f5456, &key, 0)) {
		printLog("SetIniBool missing param \"key\" (0x756f5456)\n");
		return 0;
	}

	float value = 0;
	if (!CStruct_GetFloat(params, 0xe288a7cb, &value, 0)) {
		printLog("SetIniBool missing param \"value\" (0xe288a7cb)\n");
		return 0;
	}

	char *value_str;
	if ((int)value) {
		value_str = "1";
	} else {
		value_str = "0";
	}

	WritePrivateProfileStringA(section, key, value_str, configFile);

	return 1;
}

int __cdecl CFunc_SetIniInteger(CStruct *params, CScript *script) {
	char *section = "";
	if (!CStruct_GetString(params, 0xd28c8510, &section, 0)) {
		printLog("SetIniInteger missing param \"section\" (0xd28c8510)\n");
		return 0;
	}

	char *key = "";
	if (!CStruct_GetString(params, 0x756f5456, &key, 0)) {
		printLog("SetIniInteger missing param \"key\" (0x756f5456)\n");
		return 0;
	}

	float value = 0;
	if (!CStruct_GetFloat(params, 0xe288a7cb, &value, 0)) {
		printLog("SetIniInteger missing param \"value\" (0xe288a7cb)\n");
		return 0;
	}

	char value_str[1024];
	sprintf(value_str, "%d", (int)value);
	WritePrivateProfileStringA(section, key, &value_str, configFile);

	return 1;
}

typedef int(__cdecl* CFunc_Change_t)(CStruct *);
static CFunc_Change_t CFunc_Change = (CFunc_Change_t)0x0050f630;

// allows you to
// ```cscript
// ChangeGlobal name = <name> value = <value>
// ```
// since you can't
// ```cscript
// Change <name> = <value>
// ```
int __cdecl CFunc_ChangeGlobal(CStruct *params, CScript *script) {
	uint32_t name = 0;
	if (!CStruct_GetChecksum(params, 0xa1dc81f9, &name, 0)) {
		printLog("ChangeGlobal missing param \"name\" (0xa1dc81f9)\n");
		return 0;
	}
	CStruct_RemoveComponent(params, 0xa1dc81f9);

	float float_value = 0;
	uint32_t checksum_value = 0;
	if (CStruct_GetFloat(params, 0xe288a7cb, &float_value, 0)) {
		CStruct_RemoveComponent(params, 0xe288a7cb);
		CStruct_AddFloat(params, name, float_value);
	} else if (CStruct_GetChecksum(params, 0xe288a7cb, &checksum_value, 0)) {
		CStruct_RemoveComponent(params, 0xe288a7cb);
		CStruct_AddChecksum(params, name, checksum_value);
	} else {
		printLog("ChangeGlobal missing param \"value\" (0xe288a7cb)\n");
		return 0;
	}

	CFunc_Change(params);

	return 1;
}
