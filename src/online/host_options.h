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
    MODIFIER_PERFECT_SKITCH,
    MODIFIER_DISABLE_TRICKBOOST,

    NUM_MODIFIERS,
};

enum {
    LVLOBJ_PROSET_1,
    LVLOBJ_PROSET_2,
    LVLOBJ_PROSET_3,
    LVLOBJ_PROSET_4,
    LVLOBJ_PROSET_5,
    LVLOBJ_PROSET_6,
    LVLOBJ_PROSET_7,
    LVLOBJ_COMP_GEO,

    NUM_LVLOBJS,
};

typedef uint32_t GameModifiers;
typedef uint32_t LevelObjects;

void host_options_add_handlers(Net_Dispatcher *dispatcher);
void patchHostOptions();

int __cdecl CFunc_ChangeGameModifier(CStruct *params);
int __cdecl CFunc_ChangeLevelObject(CStruct *params);
int __cdecl CFunc_ResetLevelObjects(CStruct *params);

#endif
