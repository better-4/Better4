#include "input.h"

#include "config.h"
#include "global.h"
#include "patch.h"
#include "script.h"

#include <SDL2/SDL.h>

#include <stdio.h>
#include <stdint.h>
#include <windows.h>

#define OP_SINGLE 0
#define OP_AND 1
#define OP_OR 2

#define check_button_asm(SUCCESS, FAIL, OFFSET) __asm { \
	__asm push eax \
	__asm push ebx \
	__asm mov eax, comp \
	__asm mov ebx, OFFSET \
	__asm mov bl, byte ptr [eax + ebx] \
	__asm test bl, bl \
	__asm jnz success \
	__asm pop ebx \
	__asm pop eax \
	__asm mov esp, ebp \
	__asm pop ebp \
	__asm push FAIL \
	__asm ret 0x08 \
	\
__asm success: \
	__asm pop ebx \
	__asm pop eax \
	__asm mov esp, ebp\
	__asm pop ebp \
	__asm push SUCCESS \
	__asm ret 0x08 \
}

#define check_buttons_or_asm(SUCCESS, FAIL, OFFSET1, OFFSET2) __asm { \
	__asm push eax \
	__asm push ebx \
	__asm push ecx \
	__asm mov eax, comp \
	__asm mov ebx, OFFSET1 \
	__asm mov ecx, OFFSET2 \
	__asm mov bl, byte ptr [eax + ebx] \
	__asm or bl, byte ptr [eax + ecx] \
	__asm test bl, bl \
	__asm jnz or_success \
	__asm pop ecx \
	__asm pop ebx \
	__asm pop eax \
	__asm mov esp, ebp \
	__asm pop ebp \
	__asm push FAIL \
	__asm ret 0x08 \
	\
__asm or_success: \
	__asm pop ecx \
	__asm pop ebx \
	__asm pop eax \
	__asm mov esp, ebp\
	__asm pop ebp \
	__asm push SUCCESS \
	__asm ret 0x08 \
}

#define check_buttons_and_asm(SUCCESS, FAIL, OFFSET1, OFFSET2) __asm { \
	__asm push eax \
	__asm push ebx \
	__asm push ecx \
	__asm mov eax, comp \
	__asm mov ebx, OFFSET1 \
	__asm mov ecx, OFFSET2 \
	__asm mov bl, byte ptr [eax + ebx] \
	__asm and bl, byte ptr [eax + ecx] \
	__asm test bl, bl \
	__asm jnz and_success \
	__asm pop ecx \
	__asm pop ebx \
	__asm pop eax \
	__asm mov esp, ebp \
	__asm pop ebp \
	__asm push FAIL \
	__asm ret 0x08 \
	\
__asm and_success: \
	__asm pop ecx \
	__asm pop ebx \
	__asm pop eax \
	__asm mov esp, ebp\
	__asm pop ebp \
	__asm push SUCCESS \
	__asm ret 0x08 \
}


int spine_transfer_control_index = 0;
uint32_t offset_spine_1 = OFFSET_R2_HELD;
uint32_t offset_spine_2 = OFFSET_L2_HELD;
int spine_transfer_op = 0;

int __cdecl CFunc_SetSpineTransferControl(void *params) {
	float index;
	if (!CStruct_GetFloat(params, 0x7f8c98fe, &index, 0)) {
		printLog("SetSpineTransferControl missing param \"index\" (0x7f8c98fe)\n");
		return 0;
	}

	spine_transfer_control_index = (int)index;
	printLog("Set spine_transfer_control_index=%d\n", spine_transfer_control_index);

	switch (spine_transfer_control_index) {
	case 1:
		offset_spine_1 = OFFSET_R2_HELD;
		spine_transfer_op = OP_SINGLE;
		break;
	case 2:
		offset_spine_1 = OFFSET_L2_HELD;
		spine_transfer_op = OP_SINGLE;
		break;
	case 3:
		offset_spine_1 = OFFSET_R2_HELD;
		offset_spine_2 = OFFSET_L2_HELD;
		spine_transfer_op = OP_AND;
		break;
	case 4:
		offset_spine_1 = OFFSET_L1_HELD;
		offset_spine_2 = OFFSET_R1_HELD;
		spine_transfer_op = OP_OR;
		break;
	case 5:
		offset_spine_1 = OFFSET_R1_HELD;
		spine_transfer_op = OP_SINGLE;
		break;
	case 6:
		offset_spine_1 = OFFSET_L1_HELD;
		spine_transfer_op = OP_SINGLE;
		break;
	case 7:
		offset_spine_1 = OFFSET_R1_HELD;
		offset_spine_2 = OFFSET_L1_HELD;
		spine_transfer_op = OP_AND;
		break;
	case 0:
	default:
		offset_spine_1 = OFFSET_R2_HELD;
		offset_spine_2 = OFFSET_L2_HELD;
		spine_transfer_op = OP_OR;
		break;
	}

	return 1;
}

#define check_spine_buttons(SUCCESS, FAIL) \
	switch (spine_transfer_op) { \
	case OP_SINGLE: \
		check_button_asm(SUCCESS, FAIL, offset_spine_1); \
		break; \
	case OP_AND: \
		check_buttons_and_asm(SUCCESS, FAIL, offset_spine_1, offset_spine_2); \
		break; \
	case OP_OR: \
		check_buttons_or_asm(SUCCESS, FAIL, offset_spine_1, offset_spine_2); \
		break; \
	}

void __stdcall ground_gone(void *comp) {
	check_spine_buttons(0x004bc011, 0x004bc00a);
}

void __stdcall maybe_break_vert_1(void *comp) {
	check_spine_buttons(0x004b9428, 0x004ba399);
}

void __stdcall maybe_break_vert_2(void *comp) {
	check_spine_buttons(0x004b9440, 0x004ba1d7);
}

void __stdcall in_air_physics_recovery(void *comp) {
	check_spine_buttons(0x004c0c66, 0x004c0c6d);
}

void __stdcall in_air_physics_2(void *comp) {
	check_spine_buttons(0x004c127b, 0x004c12a8);
}

void __stdcall lip_side_hop(void *comp) {
	check_spine_buttons(0x004d1283, 0x004d12e8);
}

void patchSpineTransfers() {
	// ps2 controls - fix spine buttons
	patchByte((void *)(0x004bbff6), 0x56);	// PUSH ESI
	patchCall((void *)(0x004bbff6 + 1), ground_gone);
	
	patchByte((void *)(0x004b9410), 0x56);	// PUSH ESI
	patchCall((void *)(0x004b9410 + 1), maybe_break_vert_1);

	patchByte((void *)(0x004b9428), 0x56);	// PUSH ESI
	patchCall((void *)(0x004b9428 + 1), maybe_break_vert_2);
	
	patchByte((void *)(0x004c0c52), 0x56);	// PUSH ESI
	patchCall((void *)(0x004c0c52 + 1), in_air_physics_recovery);
	
	patchByte((void *)(0x004c1267), 0x56);	// PUSH ESI
	patchCall((void *)(0x004c1267 + 1), in_air_physics_2);

	patchByte((void *)(0x004d126f), 0x56);	// PUSH ESI
	patchCall((void *)(0x004d126f + 1), lip_side_hop);
}

int spin_keys_control_index = 0;
uint32_t offset_leftspin_held = OFFSET_L1_HELD;
uint32_t offset_leftspin_trigger = OFFSET_L1_TRIGGER;
uint32_t offset_rightspin_held = OFFSET_R1_HELD;
uint32_t offset_rightspin_trigger = OFFSET_R1_TRIGGER;

int __cdecl CFunc_SetSpinKeysControl(void *params) {
	float index;
	if (!CStruct_GetFloat(params, 0x7f8c98fe, &index, 0)) {
		printLog("SetSpinKeysControl missing param \"index\" (0x7f8c98fe)\n");
		return 0;
	}
	
	spin_keys_control_index = (int)index;
	printLog("Set spin_keys_control_index=%d\n", spin_keys_control_index);

	switch (spin_keys_control_index) {
	case 1:
		offset_leftspin_held = OFFSET_L2_HELD;
		offset_leftspin_trigger = OFFSET_L2_TRIGGER;
		offset_rightspin_held = OFFSET_R2_HELD;
		offset_rightspin_trigger = OFFSET_R2_TRIGGER;
		break;
	case 2:
		offset_leftspin_held = OFFSET_R1_HELD;
		offset_leftspin_trigger = OFFSET_R1_TRIGGER;
		offset_rightspin_held = OFFSET_R2_HELD;
		offset_rightspin_trigger = OFFSET_R2_TRIGGER;
		break;
	case 3:
		offset_leftspin_held = OFFSET_L1_HELD;
		offset_leftspin_trigger = OFFSET_L1_TRIGGER;
		offset_rightspin_held = OFFSET_L2_HELD;
		offset_rightspin_trigger = OFFSET_L2_TRIGGER;
		break;
	case 0:
	default:
		offset_leftspin_held = OFFSET_L1_HELD;
		offset_leftspin_trigger = OFFSET_L1_TRIGGER;
		offset_rightspin_held = OFFSET_R1_HELD;
		offset_rightspin_trigger = OFFSET_R1_TRIGGER;
		break;
	}
	printLog("Set offset_leftspin_held=0x%x\n", offset_leftspin_held);
	printLog("Set offset_leftspin_trigger=0x%x\n", offset_leftspin_trigger);
	printLog("Set offset_rightspin_held=0x%x\n", offset_rightspin_held);
	printLog("Set offset_rightspin_trigger=0x%x\n", offset_rightspin_trigger);

	return 1;
}

void __stdcall leftspin_held_check1(void* comp) {
	check_button_asm(0x004b816a, 0x004b816a, offset_leftspin_held);
}

void __stdcall leftspin_held_check2(void* comp) {
	check_button_asm(0x004b8261, 0x004b830b, offset_leftspin_held);
}

void __stdcall leftspin_held_check3(void* comp) {
	check_button_asm(0x004b83c9, 0x004b8327, offset_leftspin_held);
}

void __stdcall leftspin_held_check4(void* comp) {
	check_button_asm(0x004c0c5c, 0x004c0c6d, offset_leftspin_held);
}

void __stdcall leftspin_trigger_check1(void* comp) {
	check_button_asm(0x004b8138, 0x004b815a, offset_leftspin_trigger);
}

void __stdcall leftspin_trigger_check2(void* comp) {
	check_button_asm(0x004b815a, 0x004b8148, offset_leftspin_trigger);
}

void __stdcall leftspin_trigger_check3(void* comp) {
	check_button_asm(0x004c01d9, 0x004c025b, offset_leftspin_trigger);
}

void __stdcall rightspin_held_check1(void* comp) {
	check_button_asm(0x004b813e, 0x004b813e, offset_rightspin_held);
}

void __stdcall rightspin_held_check2(void* comp) {
	check_button_asm(0x004b8319, 0x004b826f, offset_rightspin_held);
}

void __stdcall rightspin_held_check3(void* comp) {
	check_button_asm(0x004b8319, 0x004b83c9, offset_rightspin_held);
}

void __stdcall rightspin_held_check4(void* comp) {
	check_button_asm(0x004bf80c, 0x004bf582, offset_rightspin_trigger);
}

void __stdcall rightspin_trigger_check1(void* comp) {
	check_button_asm(0x004b8164, 0x004b8187, offset_rightspin_trigger);
}

void __stdcall rightspin_trigger_check2(void* comp) {
	check_button_asm(0x004b8187, 0x004b8175, offset_rightspin_trigger);
}

void __stdcall rightspin_trigger_check3(void* comp) {
	check_button_asm(0x004c0269, 0x004c02ea, offset_rightspin_trigger);
}

void patchSpinKeys() {
	patchByte((void*)(0x004b8164), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b8164 + 1), leftspin_held_check1);

	patchByte((void*)(0x004b8253), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b8253 + 1), leftspin_held_check2);

	patchByte((void*)(0x004b8319), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b8319 + 1), leftspin_held_check3);

	patchByte((void*)(0x004c0c52), 0x56);	// PUSH ESI
	patchCall((void*)(0x004c0c52 + 1), leftspin_held_check4);

	patchByte((void*)(0x004b812e), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b812e + 1), leftspin_trigger_check1);

	patchByte((void*)(0x004b813e), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b813e + 1), leftspin_trigger_check2);

	patchByte((void*)(0x004c01cb), 0x56);	// PUSH ESI
	patchCall((void*)(0x004c01cb + 1), leftspin_trigger_check3);


	patchByte((void*)(0x004b8138), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b8138 + 1), rightspin_held_check1);

	patchByte((void*)(0x004b8261), 0x56); // PUSH ESI
	//
	patchCall((void*)(0x004b8261 + 1), rightspin_held_check2);

	patchByte((void*)(0x004b830b), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b830b + 1), rightspin_held_check3);

	patchByte((void*)(0x004bf574), 0x56);	// PUSH ESI
	patchCall((void*)(0x004bf574 + 1), rightspin_held_check4);

	patchByte((void*)(0x004b815a), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b815a + 1), rightspin_trigger_check1);

	patchByte((void*)(0x004b816a), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b816a + 1), rightspin_trigger_check2);

	patchByte((void*)(0x004c025b), 0x56);	// PUSH ESI
	patchCall((void*)(0x004c025b + 1), rightspin_trigger_check3);
}

int pause_on_unfocus = 0;

int __cdecl CFunc_SetPauseOnUnfocus(void *params) {
	float index;
	if (!CStruct_GetFloat(params, 0x7f8c98fe, &index, 0)) {
		printLog("SetPauseOnUnfocus missing param \"index\" (0x7f8c98fe)\n");
		return 0;
	}
	
	pause_on_unfocus = (int)index;
	printLog("Set pause_on_unfocus=%d\n", pause_on_unfocus);

	return 1;
}
