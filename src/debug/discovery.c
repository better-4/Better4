#include "debug/discovery.h"

#include "log.h"

#include <stdio.h>
#include <string.h>
#include <windows.h>

extern char configFile[1024];

// Case-insensitive substring match, for filtering listings.
int better4NameContains(const char *haystack, const char *needle) {
    size_t len = strlen(needle);
    if (len == 0) {
        return 1;
    }
    for (const char *p = haystack; *p; p++) {
        if (!_strnicmp(p, needle, len)) {
            return 1;
        }
    }
    return 0;
}

// The skater's anims, scanned from the installed assets rather than listed
// here.
#define ANIM_MAX 2048

#define ANIM_HUMAN_BONES 50
#define ANIM_BONE_COUNT_OFFSET 12

static AnimEntry anims[ANIM_MAX];
static int anim_count;
static int anims_scanned;

static char anim_categories[64][64];
static int anim_category_count;

static int anim_name_from_file(const char *file, char *out, size_t out_size) {
    size_t len = strlen(file);

    if (len > 4 && !_strnicmp(file + len - 4, ".dat", 4)) {
        len -= 4;
    } else if (len > 3 && !_strnicmp(file + len - 3, ".da", 3)) {
        len -= 3;
    } else if (len > 2 && !_strnicmp(file + len - 2, ".d", 2)) {
        len -= 2;
    }

    if (len > 4 && !_strnicmp(file + len - 4, ".ska", 4)) {
        len -= 4;
    } else if (len > 3 && !_strnicmp(file + len - 3, "ska", 3)) {
        len -= 3;
    } else {
        return 0; // not an anim file
    }

    if (len == 0 || len >= out_size) {
        return 0;
    }

    memcpy(out, file, len);
    out[len] = '\0';
    return 1;
}

// Reads the bone count from a .ska header, or 0 if it cannot be read.
static uint32_t anim_bone_count(const char *path) {
    uint8_t header[16];

    FILE *file = 0;
    if (fopen_s(&file, path, "rb") || !file) {
        return 0;
    }

    size_t read = fread(header, 1, sizeof(header), file);
    fclose(file);

    if (read < sizeof(header)) {
        return 0;
    }
    return *(uint32_t *)(header + ANIM_BONE_COUNT_OFFSET);
}

static void anim_scan_folder(const char *anims_dir, const char *folder) {
    if (anim_category_count >= (int)(sizeof(anim_categories) / sizeof(anim_categories[0]))) {
        return;
    }

    const char *category = anim_categories[anim_category_count];
    strncpy_s(anim_categories[anim_category_count], sizeof(anim_categories[0]), folder, _TRUNCATE);

    char pattern[MAX_PATH];
    sprintf_s(pattern, sizeof(pattern), "%s\\%s\\*", anims_dir, folder);

    WIN32_FIND_DATAA find;
    HANDLE handle = FindFirstFileA(pattern, &find);
    if (handle == INVALID_HANDLE_VALUE) {
        return;
    }

    int kept = 0;

    do {
        if (find.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
            continue;
        }
        if (anim_count >= ANIM_MAX) {
            break;
        }

        char name[ANIM_NAME_MAX];
        if (!anim_name_from_file(find.cFileName, name, sizeof(name))) {
            continue;
        }

        char path[MAX_PATH];
        sprintf_s(path, sizeof(path), "%s\\%s\\%s", anims_dir, folder, find.cFileName);
        if (anim_bone_count(path) != ANIM_HUMAN_BONES) {
            continue;
        }

        int duplicate = 0;
        for (int i = 0; i < anim_count; i++) {
            if (!_stricmp(anims[i].name, name)) {
                duplicate = 1;
                break;
            }
        }
        if (duplicate) {
            continue;
        }

        strncpy_s(anims[anim_count].name, ANIM_NAME_MAX, name, _TRUNCATE);
        anims[anim_count].category = category;
        anim_count++;
        kept++;
    } while (FindNextFileA(handle, &find));

    FindClose(handle);

    // Only claim the category slot if something in it was actually usable.
    if (kept) {
        anim_category_count++;
    }
}

void better4AnimScan() {
    if (anims_scanned) {
        return;
    }
    anims_scanned = 1;

    char anims_dir[MAX_PATH];
    strncpy_s(anims_dir, sizeof(anims_dir), configFile, _TRUNCATE);
    char *slash = strrchr(anims_dir, '\\');
    if (!slash) {
        logWarning("anim scan: cannot find the game directory from %s", configFile);
        return;
    }
    strncpy_s(slash + 1, sizeof(anims_dir) - (slash + 1 - anims_dir), "data\\anims", _TRUNCATE);

    char pattern[MAX_PATH];
    sprintf_s(pattern, sizeof(pattern), "%s\\*", anims_dir);

    WIN32_FIND_DATAA find;
    HANDLE handle = FindFirstFileA(pattern, &find);
    if (handle == INVALID_HANDLE_VALUE) {
        logWarning("anim scan: nothing under %s", anims_dir);
        return;
    }

    do {
        if (!(find.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)) {
            continue;
        }
        if (!strcmp(find.cFileName, ".") || !strcmp(find.cFileName, "..")) {
            continue;
        }
        anim_scan_folder(anims_dir, find.cFileName);
    } while (FindNextFileA(handle, &find));

    FindClose(handle);
    logInfo("anim scan: %d anims across %d folders", anim_count, anim_category_count);
}

const AnimEntry *better4AnimList(int *count) {
    *count = anim_count;
    return anims;
}

int better4AnimCategoryCount(void) {
    return anim_category_count;
}

const char *better4AnimCategory(int index) {
    return anim_categories[index];
}

// Levels, filled in by better4_debug_map_scan calling CFunc_Better4DebugAddLevel.
#define LEVEL_MAX 64

static LevelEntry levels[LEVEL_MAX];
static int level_count;
static int levels_scanned;

void better4LevelScan() {
    if (levels_scanned) {
        return;
    }
    levels_scanned = 1;

    level_count = 0;
    Script_RunScript(0xe88d234f/*better4_debug_map_scan*/, 0, 0, 0, 0);
    logInfo("map scan: %d levels", level_count);
}

const LevelEntry *better4LevelList(int *count) {
    *count = level_count;
    return levels;
}

// Called once per level by better4_debug_map_scan, so the level tables stay in
// script and C just keeps what it is handed.
int __cdecl CFunc_Better4DebugAddLevel(CStruct *params, CScript *script) {
    const char *text = 0;
    uint32_t load = 0;

    if (!CStruct_GetString(params, 0xc4745838/*text*/, &text, 0)
        || !CStruct_GetChecksum(params, 0x651533ec/*level*/, &load, 0)) {
        return 0;
    }

    if (level_count >= LEVEL_MAX) {
        return 0;
    }

    // Better4 relists some vanilla levels; keep the first.
    for (int i = 0; i < level_count; i++) {
        if (levels[i].load == load) {
            return 1;
        }
    }

    strncpy_s(levels[level_count].name, sizeof(levels[0].name), text, _TRUNCATE);
    levels[level_count].load = load;
    level_count++;
    return 1;
}
