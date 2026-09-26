#include "online/host_options.h"

typedef enum HostOptionKind {
    NO_REVERTS = 0x1,
    NO_MANUALS = 0x2,
    DISABLE_BOOSTPLANT = 0x4,
    DISABLE_WALLPUSH = 0x8,
    DISABLE_SPACEWALK = 0x10,
    ALWAYS_SPECIAL = 0x20,
    PERFECT_RAIL = 0x40,
    PERFECT_MANUAL = 0x80,
} HostOptionKind;
