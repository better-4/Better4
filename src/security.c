#include "security.h"

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

// Replacement for Front::CTextBlockElement::parse_next_word (0x0047be90).
// Bounds words ahead of read_in_text_line's 96-byte line check.
static int __stdcall text_block_get_word(char *dst, const char **text) {
    // CTextBlockElement uses 96-byte word and line buffers, including the NUL.
    char *const end = dst + 95;
    const char *src = *text;
    int result = 0; // 0: continue, 1: newline, 2: end of text

    // Each continuing iteration advances dst; a full buffer accepts newlines.
    for (;;) {
        char c = *src;
        if (!c) {
            result = 2;
            break;
        }
        if (c == '\\' && src[1] == 'n') {
            src += 2;
            result = 1;
            break;
        }
        if (c == '\\' && !src[1]) {
            src += 1;
            result = 2;
            break;
        }
        if (c == '\\' && src[1] == '_' && dst == end) {
            break;
        }
        if (c == '\\' && src[1] == '_') {
            *dst++ = ' ';
            src += 2;
            continue;
        }

        // Keep QueryString's font escapes and their one-byte argument intact.
        size_t length = 1;
        if (c == '\\') {
            length = strchr("bBcCdDmMsS", src[1]) ? 3 : 2;
        }
        if (length == 3 && !src[2]) {
            src += 2;
            result = 2;
            break;
        }
        if (length > (size_t)(end - dst)) {
            break;
        }
        memcpy(dst, src, length);
        dst += length;
        src += length;
        if (c == ' ') {
            break;
        }
    }
    *dst = '\0';
    *text = src;
    return result;
}

void patchStrcpy() {
    patchReadGapDescriptorStrcpy();
    patchCall(0x0047bf57, text_block_get_word); // Front::CTextBlockElement::read_in_text_line (0x0047bf20)
}
