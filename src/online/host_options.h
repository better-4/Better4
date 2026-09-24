#ifndef _HOST_OPTIONS_H_
#define _HOST_OPTIONS_H_

#include "decomp/CStruct.h"
#include "decomp/Net_Dispatcher.h"

#include <stdint.h>

enum {
    MSG_ID_GAME_MODIFIERS = 0x7c,
    MSG_ID_LEVEL_OBJECTS = 0x7d,
};

enum {
    MODIFIER_DISABLE_REVERTS,
    MODIFIER_DISABLE_MANUALS,
    MODIFIER_DISABLE_BOOSTPLANTS,
    MODIFIER_DISABLE_WALLPUSH,
    MODIFIER_DISABLE_SPACEWALK,
    MODIFIER_ALWAYS_SPECIAL,
    MODIFIER_PERFECT_RAIL,
    MODIFIER_PERFECT_MANUAL,

    NUM_MODIFIERS,
};

typedef uint32_t GameModifiers;

void host_options_add_handlers(Net_Dispatcher *dispatcher);
void patchHostOptions();
int __cdecl CFunc_ChangeGameModifier(CStruct *params);

#endif
