#include "member.h"

#include "decomp/common.h"
#include "decomp/Obj_CSkater.h"

#include "partymod-thps4/src/patch.h"

#include <stdint.h>

#define THPS4_MEMBERFUNC_LIST_START 0x005ad670
#define THPS4_NUM_MEMBERFUNCS 0x1b2
#define BETTER4_NUM_MEMBERFUNCS 1
#define NUM_MEMBERFUNCS (THPS4_NUM_MEMBERFUNCS + BETTER4_NUM_MEMBERFUNCS)

char *member_funcs[NUM_MEMBERFUNCS];

void initMemberFuncs() {
	// Copy all member functions from the THPS4 list to our `member_funcs`
    memcpy(&member_funcs, THPS4_MEMBERFUNC_LIST_START, sizeof(char *) * THPS4_NUM_MEMBERFUNCS);
}

int member_func_index = THPS4_NUM_MEMBERFUNCS;
void addMemberFunc(const char *name) {
    member_funcs[member_func_index++] = name;
}

void addMemberFuncs() {
    addMemberFunc("DoingBalanceTrick");
}

void printMemberFuncs() {
    // sanity check: verify we registered exactly the # of member funcs we reserved
    if (member_func_index != NUM_MEMBERFUNCS) {
        logWarning("WARNING: registered %d member functions, expected %d", member_func_index, NUM_MEMBERFUNCS);
    }

    // logDebug("Printing member functions we own");
    // for (int i = 0; i < NUM_MEMBERFUNCS; i++) {
    //     logDebug("%d: %s", i, member_funcs[i]);
    // }
}


uint32_t __fastcall Obj_CSkater_CallMemberFunction(Obj_CSkater *this, unused_t _, uint32_t checksum, void *unk, uint32_t *unk2) {
    static uint32_t(__fastcall* _CallMemberFunction)(Obj_CSkater *, unused_t, uint32_t, void *, uint32_t *) = (void *)0x004d08e0;
    if (checksum == 0x6df82e70/*DoingBalanceTrick*/) {
        logDebug("Obj::CSkater::CallMemberFunction: DoingBalanceTrick=%d", this->doing_balance_trick);
        return 1;
        // return this->doing_balance_trick;
    }
    // logDebug("Obj::CSkater::CallMemberFunction: called with checksum %08x", checksum);
    return _CallMemberFunction(this, UNUSED, checksum, unk, unk2);
}

void patchMemberFunctions() {
	initMemberFuncs();
	addMemberFuncs();
	printMemberFuncs();
    // Script::GetNumMemberFunctions (0x00511f50)
    patchDWord(0x00511f50 + 1, NUM_MEMBERFUNCS);
    // SkateScript::Init (0x00512170)
    patchDWord(0x00512190 + 1, &member_funcs);

    patchCall(0x004d07c3, (void *)Obj_CSkater_CallMemberFunction);
}
