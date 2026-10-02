#include "member.h"

#include "decomp/common.h"

#include <partymod-thps4/src/patch.h>

#include <stdint.h>

uint32_t __fastcall CallMemberFunctions(void *this, unused_t _, uint32_t checksum, void *unk, char *unk2) {
    static uint32_t(__fastcall* _CallMemberFunctions)(void *, unused_t, uint32_t, void *, char *) = (void *)0x004cf1e0;
    // logDebug("CallMemberFunctions: called with checksum %08x", checksum);
    return _CallMemberFunctions(this, UNUSED, checksum, unk, unk2);
}

uint32_t __fastcall Obj_CSkater_CallMemberFunction(void *this, unused_t _, uint32_t checksum, void *unk, uint32_t *unk2) {
    static uint32_t(__fastcall* _CallMemberFunction)(void *, unused_t, uint32_t, void *, uint32_t *) = (void *)0x004d08e0;
    // logDebug("Obj::CSkater::CallMemberFunctions: called with checksum %08x", checksum);
    return _CallMemberFunction(this, UNUSED, checksum, unk, unk2);
}

void patchMemberFunctions() {
    // patchJmp(0x004cf1d1, (void *)CallMemberFunctions);
    // patchCall(0x004d07c3, (void *)Obj_CSkater_CallMemberFunction);
}
