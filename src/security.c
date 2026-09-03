#include "security.h"

#include "log.h"

#include <partymod-thps4/src/patch.h>

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

void patchStrcpy() {
    patchReadGapDescriptorStrcpy();
}
