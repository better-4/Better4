#include "security.h"

#include "decomp/CStruct.h"
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

void patchSecurity() {
    patchReadGapDescriptorStrcpy();
    patchHandleChat();
}
