#include "debug/startup_level.h"

#include "debug/common.h"
#include "debug/discovery.h"

#include "log.h"

#include "decomp/CScript.h"

#include <string.h>

// `[Miscellaneous] StartupLevel` -- boot straight into a level instead of the
// skateshop.
static char startup_level[64];

// Resolves the configured name to a level load script, matching `map` so that
// either the display name or the load script works:
//
//   StartupLevel=Rio
//   StartupLevel=Load_Rio
//
// Returns 0 if nothing is configured.
static uint32_t resolve_startup_level() {
    if (!*startup_level) {
        return 0;
    }

    better4LevelScan();

    int level_count = 0;
    const LevelEntry *levels = better4LevelList(&level_count);

    for (int i = 0; i < level_count; i++) {
        if (!_stricmp(levels[i].name, startup_level)) {
            return levels[i].load;
        }
    }
    for (int i = 0; i < level_count; i++) {
        if (better4NameContains(levels[i].name, startup_level)) {
            return levels[i].load;
        }
    }

    logWarning("StartupLevel \"%s\" is not a known level name, using it as a "
               "load script", startup_level);
    return better4Checksum(startup_level);
}

void initStartupLevel() {
    read_ini_string("StartupLevel", startup_level, sizeof(startup_level));
    if (*startup_level) {
        logInfo("StartupLevel is \"%s\"", startup_level);
    }
}

int __cdecl CFunc_Better4GetStartupLevel(CStruct *params, CScript *script) {
    static int consumed;
    if (consumed) {
        return 0;
    }

    uint32_t load = resolve_startup_level();
    if (!load) {
        return 0;
    }

    consumed = 1;

    CStruct *out = CScript_GetParams(script);
    CStruct_AddChecksum(out, 0x651533ec/*level*/, load);

    logInfo("StartupLevel resolved to %#010x", load);
    return 1;
}
