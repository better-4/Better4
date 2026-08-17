#include <windows.h>

#include <stdio.h>
#include <stdint.h>

#include <SDL2/SDL.h>

#include <config.h>
#include <global.h>
#include <patch.h>
#include <script.h>
#include <input.h>

int spine_transfer_control_index = 0;
int spin_keys_control_index = 0;
int pause_on_unfocus = 0;

int __cdecl CFunc_SetSpineTransferControl(void *params) {
	float index;
	if (!CStruct_GetFloat(params, 0x7f8c98fe, &index, 0)) {
		printLog("SetSpineTransferControl missing param \"index\" (0x7f8c98fe)\n");
		return 0;
	}

	spine_transfer_control_index = (int)index;
	printLog("Set spine_transfer_control_index=%d\n", spine_transfer_control_index);
}

int __cdecl CFunc_SetSpinKeysControl(void *params) {
	float index;
	if (!CStruct_GetFloat(params, 0x7f8c98fe, &index, 0)) {
		printLog("SetSpinKeysControl missing param \"index\" (0x7f8c98fe)\n");
		return 0;
	}
	
	spin_keys_control_index = (int)index;
	printLog("Set spin_keys_control_index=%d\n", spin_keys_control_index);
}

int __cdecl CFunc_SetPauseOnUnfocus(void *params) {
	float index;
	if (!CStruct_GetFloat(params, 0x7f8c98fe, &index, 0)) {
		printLog("SetPauseOnUnfocus missing param \"index\" (0x7f8c98fe)\n");
		return 0;
	}
	
	pause_on_unfocus = (int)index;
	printLog("Set pause_on_unfocus=%d\n", pause_on_unfocus);
}

uint8_t __cdecl checkSpineTransferButtons(void *comp) {
	uint8_t r2 = *(uint8_t *)((uint8_t *)comp + 0x87c);
	uint8_t l2 = *(uint8_t *)((uint8_t *)comp + 0x834);
	uint8_t l1_held = *(uint8_t*)((uint8_t*)comp + 0x810);
	uint8_t r1_held = *(uint8_t*)((uint8_t*)comp + 0x858);

	switch (spine_transfer_control_index)
	{
		case 1:
			return r2 != 0;
		case 2:
			return l2 != 0;
		case 3:
			return (r2 != 0) && (l2 != 0);
		case 4:
			return (l1_held != 0) || (r1_held != 0);
		case 5:
			return r1_held != 0;
		case 6:
			return l1_held != 0;
		case 7:
			return (l1_held != 0) && (r1_held != 0);
		case 0:
		default:
			return (r2 != 0) || (l2 != 0);
	}
}

#define spine_buttons_asm(SUCCESS, FAIL) __asm {	\
	__asm push eax	\
	__asm push ebx	\
	__asm push comp	\
	__asm call checkSpineTransferButtons	\
	__asm add esp, 4	\
	__asm test al, al	\
	__asm jne success	\
	\
__asm failure:	\
	__asm pop ebx	\
	__asm pop eax	\
	__asm mov esp, ebp	\
	__asm pop ebp	\
	__asm push FAIL	\
	__asm ret 0x08	\
	\
__asm success:	\
	__asm pop ebx	\
	__asm pop eax	\
	__asm mov esp, ebp	\
	__asm pop ebp	\
	__asm push SUCCESS	\
	__asm ret 0x08	\
}

#define not_spine_buttons_asm(SUCCESS, FAIL) spine_buttons_asm(FAIL, SUCCESS)

void __stdcall ground_gone(void *comp) {
	not_spine_buttons_asm(0x004bc00a, 0x004bc011);
}

void __stdcall maybe_break_vert_1(void *comp) {
	not_spine_buttons_asm(0x004ba399, 0x004b9428);
}

void __stdcall maybe_break_vert_2(void *comp) {
	not_spine_buttons_asm(0x004ba1d7, 0x004b9440);
}

void __stdcall in_air_physics_recovery(void *comp) {
	spine_buttons_asm(0x004c0c66, 0x004c0c6d);
}

void __stdcall in_air_physics_2(void *comp) {
	spine_buttons_asm(0x004c127b, 0x004c12a8);
}

void __stdcall lip_side_hop(void *comp) {
	spine_buttons_asm(0x004d1283, 0x004d12e8);
}

// 0x810 = L1 held
// 0x820 = L1 triggered
// 0x858 = R1 held
// 0x868 = R1 triggered
// 0x87C = R2
// 0x834 = L2

uint8_t __cdecl checkSpinKeysL1Held(void* comp)
{
	uint8_t r2 = *(uint8_t*)((uint8_t*)comp + 0x87c);
	uint8_t l2 = *(uint8_t*)((uint8_t*)comp + 0x834);
	uint8_t l1_held = *(uint8_t*)((uint8_t*)comp + 0x810);
	uint8_t r1_held = *(uint8_t*)((uint8_t*)comp + 0x858);

	switch (spin_keys_control_index)
	{
	case 1:
		return l2 != 0;
	case 2:
		return r1_held != 0;
	case 3:
		return l1_held != 0;
	case 0:
	default:
		return l1_held != 0;
	}
}

uint8_t __cdecl checkSpinKeysL1Trigger(void* comp) {
	uint8_t r2 = *(uint8_t*)((uint8_t*)comp + 0x87c);
	uint8_t l2 = *(uint8_t*)((uint8_t*)comp + 0x834);
	uint8_t l1_trigger = *(uint8_t*)((uint8_t*)comp + 0x820);
	uint8_t r1_trigger = *(uint8_t*)((uint8_t*)comp + 0x868);

	switch (spin_keys_control_index)
	{
	case 1:
		return l2 != 0;
	case 2:
		return r1_trigger != 0;
	case 3:
		return l1_trigger != 0;
	case 0:
	default:
		return l1_trigger != 0;
	}
}

uint8_t __cdecl checkSpinKeysR1Held(void* comp) {
	uint8_t r2 = *(uint8_t*)((uint8_t*)comp + 0x87c);
	uint8_t l2 = *(uint8_t*)((uint8_t*)comp + 0x834);
	uint8_t l1_held = *(uint8_t*)((uint8_t*)comp + 0x810);
	uint8_t r1_held = *(uint8_t*)((uint8_t*)comp + 0x858);

	switch (spin_keys_control_index)
	{
	case 1:
		return r2 != 0;
	case 2:
		return r2 != 0;
	case 3:
		return l2 != 0;
	case 0:
	default:
		return r1_held != 0;
	}

}

uint8_t __cdecl checkSpinKeysR1Trigger(void* comp) {
	uint8_t r2 = *(uint8_t*)((uint8_t*)comp + 0x87c);
	uint8_t l2 = *(uint8_t*)((uint8_t*)comp + 0x834);
	uint8_t l1_trigger = *(uint8_t*)((uint8_t*)comp + 0x820);
	uint8_t r1_trigger = *(uint8_t*)((uint8_t*)comp + 0x868);

	switch (spin_keys_control_index)
	{
	case 1:
		return r2 != 0;
	case 2:
		return r2 != 0;
	case 3:
		return l2 != 0;
	case 0:
	default:
		return r1_trigger != 0;
	}
}

#define spin_keys_l1_held_asm(SUCCESS, FAIL) __asm {	\
	__asm push eax	\
	__asm push ebx	\
	__asm push comp	\
	__asm call checkSpinKeysL1Held	\
	__asm add esp, 4	\
	__asm test al, al	\
	__asm jne success	\
	\
__asm failure:	\
	__asm pop ebx	\
	__asm pop eax	\
	__asm mov esp, ebp	\
	__asm pop ebp	\
	__asm push FAIL	\
	__asm ret 0x08	\
	\
__asm success:	\
	__asm pop ebx	\
	__asm pop eax	\
	__asm mov esp, ebp	\
	__asm pop ebp	\
	__asm push SUCCESS	\
	__asm ret 0x08	\
}

#define spin_keys_l1_trigger_asm(SUCCESS, FAIL) __asm {	\
	__asm push eax	\
	__asm push ebx	\
	__asm push comp	\
	__asm call checkSpinKeysL1Trigger	\
	__asm add esp, 4	\
	__asm test al, al	\
	__asm jne success	\
	\
__asm failure:	\
	__asm pop ebx	\
	__asm pop eax	\
	__asm mov esp, ebp	\
	__asm pop ebp	\
	__asm push FAIL	\
	__asm ret 0x08	\
	\
__asm success:	\
	__asm pop ebx	\
	__asm pop eax	\
	__asm mov esp, ebp	\
	__asm pop ebp	\
	__asm push SUCCESS	\
	__asm ret 0x08	\
}
#define spin_keys_r1_held_asm(SUCCESS, FAIL) __asm {	\
	__asm push eax	\
	__asm push ebx	\
	__asm push comp	\
	__asm call checkSpinKeysR1Held	\
	__asm add esp, 4	\
	__asm test al, al	\
	__asm jne success	\
	\
__asm failure:	\
	__asm pop ebx	\
	__asm pop eax	\
	__asm mov esp, ebp	\
	__asm pop ebp	\
	__asm push FAIL	\
	__asm ret 0x08	\
	\
__asm success:	\
	__asm pop ebx	\
	__asm pop eax	\
	__asm mov esp, ebp	\
	__asm pop ebp	\
	__asm push SUCCESS	\
	__asm ret 0x08	\
}

#define spin_keys_r1_trigger_asm(SUCCESS, FAIL) __asm {	\
	__asm push eax	\
	__asm push ebx	\
	__asm push comp	\
	__asm call checkSpinKeysR1Trigger	\
	__asm add esp, 4	\
	__asm test al, al	\
	__asm jne success	\
	\
__asm failure:	\
	__asm pop ebx	\
	__asm pop eax	\
	__asm mov esp, ebp	\
	__asm pop ebp	\
	__asm push FAIL	\
	__asm ret 0x08	\
	\
__asm success:	\
	__asm pop ebx	\
	__asm pop eax	\
	__asm mov esp, ebp	\
	__asm pop ebp	\
	__asm push SUCCESS	\
	__asm ret 0x08	\
}



void __stdcall l1_held_check1(void* comp) {
	spin_keys_l1_held_asm(0x004b816a, 0x004b816a);
}
void __stdcall l1_held_check2(void* comp) {
	spin_keys_l1_held_asm(0x004b8261, 0x004b830b);
}
void __stdcall l1_held_check3(void* comp) {
	spin_keys_l1_held_asm(0x004b83c9, 0x004b8327);
}
void __stdcall l1_held_check4(void* comp) {
	spin_keys_l1_held_asm(0x004c0c5c, 0x004c0c6d);
}
void __stdcall l1_trigger_check1(void* comp) {
	spin_keys_l1_trigger_asm(0x004b8138, 0x004b815a);
}
void __stdcall l1_trigger_check2(void* comp) {
	spin_keys_l1_trigger_asm(0x004b815a, 0x004b8148);
}
void __stdcall l1_trigger_check3(void* comp) {
	spin_keys_l1_trigger_asm(0x004c01d9, 0x004c025b);
}

void __stdcall r1_held_check1(void* comp) {
	spin_keys_r1_held_asm(0x004b813e, 0x004b813e);
}
void __stdcall r1_held_check2(void* comp) {
	spin_keys_r1_held_asm(0x004b8319, 0x004b826f);
}
void __stdcall r1_held_check3(void* comp) {
	spin_keys_r1_held_asm(0x004b8319, 0x004b83c9);
}
void __stdcall r1_held_check4(void* comp) {
	spin_keys_r1_held_asm(0x004bf80c, 0x004bf582);
}
void __stdcall r1_trigger_check1(void* comp) {
	spin_keys_r1_trigger_asm(0x004b8164, 0x004b8187);
}
void __stdcall r1_trigger_check2(void* comp) {
	spin_keys_r1_trigger_asm(0x004b8187, 0x004b8175);
}
void __stdcall r1_trigger_check3(void* comp) {
	spin_keys_r1_trigger_asm(0x004c0269, 0x004c02ea);
}

void patchSpinKeys() {
	patchByte((void*)(0x004b8164), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b8164 + 1), l1_held_check1);

	patchByte((void*)(0x004b8253), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b8253 + 1), l1_held_check2);

	patchByte((void*)(0x004b8319), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b8319 + 1), l1_held_check3);

	patchByte((void*)(0x004c0c52), 0x56);	// PUSH ESI
	patchCall((void*)(0x004c0c52 + 1), l1_held_check4);

	patchByte((void*)(0x004b812e), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b812e + 1), l1_trigger_check1);

	patchByte((void*)(0x004b813e), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b813e + 1), l1_trigger_check2);

	patchByte((void*)(0x004c01cb), 0x56);	// PUSH ESI
	patchCall((void*)(0x004c01cb + 1), l1_trigger_check3);


	patchByte((void*)(0x004b8138), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b8138 + 1), r1_held_check1);

	patchByte((void*)(0x004b8261), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b8261 + 1), r1_held_check2);

	patchByte((void*)(0x004b830b), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b830b + 1), r1_held_check3);

	patchByte((void*)(0x004bf574), 0x56);	// PUSH ESI
	patchCall((void*)(0x004bf574 + 1), r1_held_check4);

	patchByte((void*)(0x004b815a), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b815a + 1), r1_trigger_check1);

	patchByte((void*)(0x004b816a), 0x56);	// PUSH ESI
	patchCall((void*)(0x004b816a + 1), r1_trigger_check2);

	patchByte((void*)(0x004c025b), 0x56);	// PUSH ESI
	patchCall((void*)(0x004c025b + 1), r1_trigger_check3);
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
