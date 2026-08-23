#include "decomp/Lst_Search.h"

Lst_Search Lst_Search_PlayerInfo() {
    Lst_Search search = { (void *)0x0058aa94, (void *)0 };
    return search;
}

void *Lst_Search_NextItem(Lst_Search *this) {
    static void *(__fastcall* _NextItem)(Lst_Search *) = (void *)0x00432b10;
    return _NextItem(this);
}
