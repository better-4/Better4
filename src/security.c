#include "security.h"

#include "decomp/CStruct.h"
#include "decomp/common.h"
#include "decomp/Net_Dispatcher.h"
#include "log.h"

#include "partymod-thps4/src/patch.h"

#include <stdint.h>
#include <string.h>

void __stdcall read_gap_descriptor_strcpy(uint32_t edx, uint32_t eax) {
    char *dst = (char *)(eax + edx);
    char *src = (char *)eax;
    strcpy_s(dst, 32 * sizeof(uint8_t), src);
}

void patchReadGapDescriptorStrcpy() {
    patchByte(0x00525f2e, 0x50); // PUSH EAX
    patchByte(0x00525f2f, 0x52); // PUSH EDX
    patchCall(0x00525f30, read_gap_descriptor_strcpy); // CALL
    patchByte(0x00525f35, 0x90); // NOP
    patchByte(0x00525f36, 0x90); // NOP
    patchByte(0x00525f37, 0x90); // NOP
}

uint32_t GameNet_Manager_s_handle_chat(Net_MsgHandlerContext *ctx) {
    uint8_t ctx_player_index = *(uint8_t *)ctx;
    char *ctx_name = (char *)((int)ctx + 1);
    char *ctx_message = (char *)((int)ctx + 0x11);

    char name[16];
    char message[96];
    char text[260];

    if (snprintf(name, 16, "%s", ctx_name) >= 16) {
        name[15] = '\0';
        logInfo("GameNet_Manager_s_handle_chat: truncated player name %s", name);
    }

    if (snprintf(message, 96, "%s", ctx_message) >= 96) {
        message[95] = '\0';
        logInfo("GameNet_Manager_s_handle_chat: truncated message %s", message);
    }

    if (snprintf(text, 260, "\\c%i%s\\c0 : %s", ctx_player_index + 2, name, message) >= 260) {
        text[259] = '\0';
        logInfo("GameNet_Manager_s_handle_chat: truncated text %s", text);
    }

    CStruct *params = CStruct_New();
    CStruct_AddString(params, 0xc4745838/*text*/, text);
    Script_RunScript(0xccb19938/*create_console_message*/, params, 0, 0, 0);
    CStruct_Free(params);

    return 1;
}

void patchHandleChat() {
    patchDWord(0x00487117 + 1, (void *)GameNet_Manager_s_handle_chat); // GameNet::Manager::JoinServer (0x0009ad0c)
}

// Nx::plat_texture_splat (0x0044c060) allocates a 0x2000-byte buffer for storing subdivided
// triangles and reuses a 0x4000-byte Nx::sTriSubdivideStack to store intermediary results.
// When writing to the 0x2000-byte buffer, no bounds checks are performed, which can result in
// an overflow and subsequent corrupted pointer crashes.

#define SUBDIVIDE_BUF_SIZE 0x2000
#define SUBDIVIDE_TRI_SIZE 0x48 // 3 vertices * 0x18 bytes each

static uint8_t *subdivide_buffer = 0;

void *__fastcall Mem_CPoolable_operator_new(void *allocator, unused_t _, int size, int a, int b) {
    static void *(__fastcall *_new)(void *, unused_t, int, int, int) = (void *)0x00533b80;
    subdivide_buffer = _new(allocator, UNUSED, size, a, b);
    return subdivide_buffer;
}

uint32_t __cdecl Nx_subdivide_tri_stack(uint8_t **cursor, void *mesh) {
    static void (__fastcall *_Nx_sTriSubdivideStack_Reset)(void *) = (void *)0x00465190; // Nx::sTriSubdivideStack::Reset
    static uint32_t (__cdecl *_Nx_subdivide_tri_stack)(uint8_t **, void *) = (void *)0x0044b780; // Nx::subdivide_tri_stack

    // If writing another triangle to the buffer would cause an overflow, reset the stack and return
    // to truncate any further subdivision.
    if (subdivide_buffer && *cursor + SUBDIVIDE_TRI_SIZE > subdivide_buffer + SUBDIVIDE_BUF_SIZE) {
        logInfo("Nx::subdivide_tri_stack: buffer full, truncating texture splat");

        void *tri_subdivide_stack = (void *)0x00aaccb0;
        _Nx_sTriSubdivideStack_Reset(tri_subdivide_stack);

        return 0;
    }

    return _Nx_subdivide_tri_stack(cursor, mesh);
}

void patchTextureSplat() {
    // Nx::plat_texture_splat (0x0044c060)
    patchCall(0x0044cc68, (void *)Mem_CPoolable_operator_new);
    patchCall(0x0044cd01, (void *)Nx_subdivide_tri_stack);
}

void patchSecurity() {
    patchReadGapDescriptorStrcpy();
    patchHandleChat();
    patchTextureSplat();
}
