#include "decomp/common.h"
#include "decomp/Net_Manager.h"


Net_Manager *Net_Manager_Instance() {
    return *(Net_Manager **)0x00ab5394;
}

Net_PlayerInfo *Net_Manager_GetLocalPlayer(Net_Manager *this) {
    static Net_PlayerInfo *(__fastcall* _GetLocalPlayer)(Net_Manager *) = (void *)0x00489ac0;
    return _GetLocalPlayer(this);
}

Net_PlayerInfo *Net_Manager_FirstPlayerInfo(Net_Manager *this, void *search_ctx, uint8_t flag) {
    static Net_PlayerInfo *(__fastcall* _FirstPlayerInfo)(Net_Manager *, unused_t, void *, uint8_t) = (void *)0x00489730;
    return _FirstPlayerInfo(this, UNUSED, search_ctx, flag);
}
