#include "debug.h"

#include "log.h"

#include "config.h"
#include "partymod-thps4/src/input.h"
#include "partymod-thps4/src/patch.h"

#include <SDL2/SDL.h>

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>

#define CONSOLE_MAX_LINE 256
#define CONSOLE_MAX_ARGS 16
#define CONSOLE_SCROLLBACK 256
#define CONSOLE_INPUT_MAX 128
#define CONSOLE_HISTORY 32
#define CONSOLE_VISIBLE_ROWS 14

#define CONSOLE_WRAP_COLS 80

extern char configFile[1024];

// Set by the game when its own on-screen keyboard is up.
static uint8_t *keyboard_on_screen = (uint8_t *)0x00ab5bae;

// Where partymod installs processController; re-pointed at our wrapper so the
// skater can be frozen while the overlay has the keyboard.
#define THPS4_PROCESS_CONTROLLER 0x005409b0

typedef int(__cdecl* CFunc_Change_t)(CStruct *);
static CFunc_Change_t CFunc_Change = (CFunc_Change_t)0x0050f630;

static int console_alive;

static int debug_enabled = 0;

// Toggles the overlay. Override with `[Miscellaneous] ConsoleKey` in the ini.
static SDL_Scancode console_toggle_key = SDL_SCANCODE_GRAVE;

// Overlay state.
static char scrollback[CONSOLE_SCROLLBACK][CONSOLE_MAX_LINE];
static int scrollback_total;  // lines ever written.
static int scrollback_floor;  // `clear` moves this up.
static int scroll_offset;     // lines scrolled back from the newest; 0 == pinned

static char input_line[CONSOLE_INPUT_MAX];
static int input_len;

static char history[CONSOLE_HISTORY][CONSOLE_INPUT_MAX];
static int history_total;
static int history_browse = -1; // -1 while editing a fresh line

static int console_open;
static int rows_rendered;    // row elements currently in the VMenu
static int rendered_total;   // value of scrollback_total already rendered
static int needs_rebuild;
static int input_dirty;

static volatile int want_toggle;
static volatile int want_submit;
static volatile int want_close;

static void console_run(uint32_t script) {
    Script_RunScript(script, 0, 0, 0, 0);
}

static void console_run_text(uint32_t script, const char *text) {
    CStruct *params = CStruct_New();
    CStruct_AddString(params, 0xc4745838/*text*/, (char *)text);
    Script_RunScript(script, params, 0, 0, 0);
    CStruct_Free(params);
}

// Appends one physical row to the buffer.
static void scrollback_push(const char *text) {
    char *slot = scrollback[scrollback_total % CONSOLE_SCROLLBACK];
    strncpy_s(slot, CONSOLE_MAX_LINE, text, _TRUNCATE);
    scrollback_total++;
}

// Byte offset at which `cols` *visible* characters have been consumed.
static size_t offset_for_columns(const char *p, size_t cols) {
    size_t i = 0;
    size_t visible = 0;

    while (p[i] && visible < cols) {
        if (p[i] == '\\' && p[i + 1] == 'c' && p[i + 2]) {
            i += 3;
            continue;
        }
        i++;
        visible++;
    }

    return i;
}

static void scrollback_add(const char *text) {
    char rest[CONSOLE_MAX_LINE];
    strncpy_s(rest, sizeof(rest), text, _TRUNCATE);

    char *p = rest;
    while (1) {
        size_t cut = offset_for_columns(p, CONSOLE_WRAP_COLS);
        if (!p[cut]) {
            scrollback_push(p);
            return;
        }

        size_t split = cut;
        while (split > cut / 2 && p[split] != ' ') {
            split--;
        }
        if (p[split] != ' ') {
            split = cut;
        }

        char saved = p[split];
        p[split] = '\0';
        scrollback_push(p);
        p[split] = saved;

        p += split;
        while (*p == ' ') {
            p++;
        }
    }
}

static int scrollback_first() {
    int first = scrollback_total - CONSOLE_SCROLLBACK;
    if (first < scrollback_floor) {
        first = scrollback_floor;
    }
    return first < 0 ? 0 : first;
}

static const char *scrollback_at(int index) {
    return scrollback[index % CONSOLE_SCROLLBACK];
}

static void console_clamp_scroll() {
    int scrollable = scrollback_total - scrollback_first() - CONSOLE_VISIBLE_ROWS;
    if (scrollable < 0) {
        scrollable = 0;
    }
    if (scroll_offset > scrollable) {
        scroll_offset = scrollable;
    }
    if (scroll_offset < 0) {
        scroll_offset = 0;
    }
}

// Rebuilds the visible window from scratch. Used on open and after paging.
static void console_rebuild_rows() {
    console_run(0xbe02426d/*better4_console_clear_rows*/);
    rows_rendered = 0;

    console_clamp_scroll();

    int end = scrollback_total - scroll_offset;
    int start = end - CONSOLE_VISIBLE_ROWS;
    if (start < scrollback_first()) {
        start = scrollback_first();
    }

    for (int i = start; i < end; i++) {
        logDebug("console: add row %d of %d", i - start + 1, end - start);
        console_run_text(0xc69187f9/*better4_console_add_row*/, scrollback_at(i));
        rows_rendered++;
    }

    rendered_total = scrollback_total;
    needs_rebuild = 0;
}

static void console_sync_rows() {
    if (needs_rebuild || scroll_offset > 0) {
        if (needs_rebuild) {
            console_rebuild_rows();
        }
        return;
    }

    int first = scrollback_first();
    if (rendered_total < first) {
        rendered_total = first;
    }

    for (int i = rendered_total; i < scrollback_total; i++) {
        console_run_text(0xc69187f9/*better4_console_add_row*/, scrollback_at(i));
        rows_rendered++;

        while (rows_rendered > CONSOLE_VISIBLE_ROWS) {
            console_run(0xe2212b9a/*better4_console_trim_rows*/);
            rows_rendered--;
        }
    }

    rendered_total = scrollback_total;
}

// Check if console is open.
static int console_elements_exist() {
    console_alive = 0;
    console_run(0xdd0eea91/*better4_console_ping*/);
    return console_alive;
}

static void console_sync_input() {
    char text[CONSOLE_INPUT_MAX + 48];

    if (scroll_offset > 0 && input_len == 0) {
        sprintf_s(text, sizeof(text), "\\c3-- scrolled back %d line(s), pgdn to return --", scroll_offset);
    } else {
        sprintf_s(text, sizeof(text), ">%s_", input_line);
    }

    console_run_text(0x300393a4/*better4_console_set_input*/, text);
    input_dirty = 0;
}

uint32_t better4Checksum(const char *name) {
    uint32_t crc = 0xffffffff;

    for (const char *p = name; *p; p++) {
        uint8_t c = (uint8_t)*p;
        if (c >= 'A' && c <= 'Z') {
            c += 'a' - 'A';
        }

        crc ^= c;
        for (int i = 0; i < 8; i++) {
            crc = (crc & 1) ? ((crc >> 1) ^ 0xedb88320) : (crc >> 1);
        }
    }

    return crc;
}

void better4DebugPrint(const char *fmt, ...) {
    static char text[CONSOLE_MAX_LINE];

    va_list args;
    va_start(args, fmt);
    vsnprintf(text, sizeof(text), fmt, args);
    va_end(args);

    if (console_open) {
        scrollback_add(text);
    } else {
        console_run_text(0xccb19938/*create_console_message*/, text);
    }

    logDebug("console: %s", text);
}

// Splits `line` into tokens in place.
static int tokenize(char *line, char **argv, int *quoted, int max) {
    int argc = 0;
    char *p = line;

    while (*p && argc < max) {
        while (*p == ' ' || *p == '\t') {
            p++;
        }
        if (!*p) {
            break;
        }

        if (*p == '"' || *p == '\'') {
            char quote = *p;
            argv[argc] = ++p;
            quoted[argc] = 1;
            while (*p && *p != quote) {
                p++;
            }
        } else {
            argv[argc] = p;
            quoted[argc] = 0;
            while (*p && *p != ' ' && *p != '\t') {
                p++;
            }
        }

        if (*p) {
            *p++ = '\0';
        }
        argc++;
    }

    return argc;
}

// Pushes `value` onto `params` under `name`, picking the q script type the way
// the script language itself would: `12` is an int, `1.5` a float, a quoted
// token a string, and anything else a checksum (`Change Airtricks = Airtricks3`).
static void add_value(CStruct *params, uint32_t name, const char *value, int quoted) {
    if (quoted) {
        CStruct_AddString(params, name, (char *)value);
        return;
    }

    char *end = 0;

    long as_int = strtol(value, &end, 10);
    if (*value && !*end) {
        CStruct_AddInteger(params, name, (int)as_int);
        return;
    }

    float as_float = (float)strtod(value, &end);
    if (*value && !*end) {
        CStruct_AddFloat(params, name, as_float);
        return;
    }

    CStruct_AddChecksum(params, name, better4Checksum(value));
}

typedef struct {
    const char *name;
    int min_args; // not counting the command itself
    int max_args; // -1 for unlimited
    int (*handler)(int argc, char **argv, int *quoted);
    const char *usage;
    const char *help;
} ConsoleCommand;

static const ConsoleCommand *get_command(int index);
static int num_commands(void);

static int cmd_help(int argc, char **argv, int *quoted) {
    if (argc > 1) {
        for (int i = 0; i < num_commands(); i++) {
            const ConsoleCommand *command = get_command(i);
            if (!_stricmp(command->name, argv[1])) {
                better4DebugPrint("\\c1%s\\c0 - %s", command->usage, command->help);
                return 1;
            }
        }

        better4DebugPrint("\\c2no such command '%s'", argv[1]);
        return 1;
    }

    char line[CONSOLE_MAX_LINE] = "\\c1commands:\\c0";
    for (int i = 0; i < num_commands(); i++) {
        strcat_s(line, sizeof(line), " ");
        strcat_s(line, sizeof(line), get_command(i)->name);
    }

    better4DebugPrint("%s", line);
    better4DebugPrint("\\c3help <command> for details");
    return 1;
}

static int cmd_echo(int argc, char **argv, int *quoted) {
    char line[CONSOLE_MAX_LINE] = "";

    for (int i = 1; i < argc; i++) {
        if (i > 1) {
            strcat_s(line, sizeof(line), " ");
        }
        strcat_s(line, sizeof(line), argv[i]);
    }

    better4DebugPrint("%s", line);
    return 1;
}

static int cmd_clear(int argc, char **argv, int *quoted) {
    if (console_open) {
        scrollback_floor = scrollback_total;
        scroll_offset = 0;
        needs_rebuild = 1;
    } else {
        Script_RunScript(0x05f35bcb/*console_clear*/, 0, 0, 0, 0);
    }
    return 1;
}

static int cmd_checksum(int argc, char **argv, int *quoted) {
    better4DebugPrint("\\c1%s\\c0 = \\c6%#010x", argv[1], better4Checksum(argv[1]));
    return 1;
}

static int cmd_set(int argc, char **argv, int *quoted) {
    CStruct *params = CStruct_New();
    add_value(params, better4Checksum(argv[1]), argv[2], quoted[2]);
    CFunc_Change(params);
    CStruct_Free(params);

    better4DebugPrint("\\c1%s\\c0 = \\c6%s", argv[1], argv[2]);
    return 1;
}

static int cmd_get(int argc, char **argv, int *quoted) {
    float value = Script_GetFloat(better4Checksum(argv[1]));
    better4DebugPrint("\\c1%s\\c0 = \\c6%g", argv[1], value);
    return 1;
}

// The skater's anims, scanned from the installed assets rather than listed
// here.
#define ANIM_MAX 2048
#define ANIM_NAME_MAX 64

#define ANIM_HUMAN_BONES 50
#define ANIM_BONE_COUNT_OFFSET 12

typedef struct {
    char name[ANIM_NAME_MAX];
    const char *category; // folder it came from, e.g. "skater_grind"
} AnimEntry;

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

static void anim_scan() {
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

// Case-insensitive substring match, for filtering listings.
static int contains_nocase(const char *haystack, const char *needle) {
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

// Summarizes anims by folder.
static int cmd_anim_list(int argc, char **argv, int *quoted) {
    anim_scan();

    if (anim_count == 0) {
        better4DebugPrint("\\c2no anims found under data\\\\anims");
        return 1;
    }

    if (argc < 2) {
        for (int c = 0; c < anim_category_count; c++) {
            const char *category = anim_categories[c];
            int n = 0;
            for (int i = 0; i < anim_count; i++) {
                if (anims[i].category == category) {
                    n++;
                }
            }
            if (n) {
                better4DebugPrint("\\c1%-22s\\c0 %d", category, n);
            }
        }
        better4DebugPrint("\\c1%d anims\\c0 - anim_list <filter> to search, anim_play <name>",
                          anim_count);
        return 1;
    }

    const char *filter = argv[1];

    // Pack several names per row so a search fits on screen instead of pushing
    // itself out of the scrollback.
    char line[CONSOLE_MAX_LINE] = "";
    int shown = 0;
    int truncated = 0;

    for (int i = 0; i < anim_count; i++) {
        const char *name = anims[i].name;
        if (!contains_nocase(name, filter) && !contains_nocase(anims[i].category, filter)) {
            continue;
        }

        shown++;
        if (shown > CONSOLE_SCROLLBACK / 2) {
            truncated++;
            continue;
        }

        if (strlen(line) + strlen(name) + 2 > CONSOLE_WRAP_COLS) {
            better4DebugPrint("%s", line);
            line[0] = '\0';
        }
        if (*line) {
            strcat_s(line, sizeof(line), "  ");
        }
        strcat_s(line, sizeof(line), name);
    }

    if (*line) {
        better4DebugPrint("%s", line);
    }

    if (truncated) {
        better4DebugPrint("\\c1%d of %d matching \\c6%s\\c0 (%d not shown, narrow the filter)",
                          shown - truncated, anim_count, filter, truncated);
    } else {
        better4DebugPrint("\\c1%d of %d anims matching \\c6%s", shown, anim_count, filter);
    }
    return 1;
}

// Builds `k=v` and bare-flag arguments into a param struct.
static void add_script_params(CStruct *params, int argc, char **argv, int *quoted, int first) {
    for (int i = first; i < argc; i++) {
        char *equals = quoted[i] ? 0 : strchr(argv[i], '=');
        if (equals) {
            *equals = '\0';
            add_value(params, better4Checksum(argv[i]), equals + 1, 0);
        } else {
            CStruct_AddInteger(params, better4Checksum(argv[i]), 1);
        }
    }
}

// Levels, filled in by better4_debug_map_scan calling CFunc_Better4DebugAddLevel.
#define LEVEL_MAX 64

typedef struct {
    char name[48];     // display name, e.g. "Rio"
    uint32_t load;     // its load script, e.g. Load_Rio
} LevelEntry;

static LevelEntry levels[LEVEL_MAX];
static int level_count;
static int levels_scanned;

static void level_scan() {
    if (levels_scanned) {
        return;
    }
    levels_scanned = 1;

    level_count = 0;
    Script_RunScript(0xe88d234f/*better4_debug_map_scan*/, 0, 0, 0, 0);
    logInfo("map scan: %d levels", level_count);
}

static int cmd_map(int argc, char **argv, int *quoted) {
    level_scan();

    if (level_count == 0) {
        better4DebugPrint("\\c2no levels found");
        return 1;
    }

    if (argc < 2) {
        char line[CONSOLE_MAX_LINE] = "";
        for (int i = 0; i < level_count; i++) {
            if (strlen(line) + strlen(levels[i].name) + 3 > CONSOLE_WRAP_COLS) {
                better4DebugPrint("%s", line);
                line[0] = '\0';
            }
            if (*line) {
                strcat_s(line, sizeof(line), " / ");
            }
            strcat_s(line, sizeof(line), levels[i].name);
        }
        if (*line) {
            better4DebugPrint("%s", line);
        }
        better4DebugPrint("\\c1%d levels\\c0 - map <name>", level_count);
        return 1;
    }

    // Exact match first, so "rio" cannot be beaten to it by a longer name that
    // merely contains it.
    const LevelEntry *match = 0;
    for (int i = 0; i < level_count; i++) {
        if (!_stricmp(levels[i].name, argv[1])) {
            match = &levels[i];
            break;
        }
    }
    if (!match) {
        int matches = 0;
        for (int i = 0; i < level_count; i++) {
            if (contains_nocase(levels[i].name, argv[1])) {
                match = &levels[i];
                matches++;
            }
        }
        if (matches > 1) {
            better4DebugPrint("\\c2%s is ambiguous - be more specific", argv[1]);
            return 1;
        }
    }
    if (!match) {
        better4DebugPrint("\\c2no level matching \\c0%s\\c2 - try just 'map'", argv[1]);
        return 1;
    }

    better4DebugPrint("\\c1loading \\c6%s", match->name);

    CStruct *params = CStruct_New();
    CStruct_AddChecksum(params, 0x651533ec/*level*/, match->load);
    Script_RunScript(0x65cc4837/*better4_debug_map_go*/, params, 0, 0, 0);
    CStruct_Free(params);
    return 1;
}

static int cmd_skater(int argc, char **argv, int *quoted) {
    CStruct *params = CStruct_New();
    CStruct_AddChecksum(params, 0xdd13b858/*membername*/, better4Checksum(argv[1]));
    add_script_params(params, argc, argv, quoted, 2);

    Script_RunScript(0x71e1e6fd/*better4_debug_skater_run*/, params, 0, 0, 0);
    CStruct_Free(params);

    better4DebugPrint("\\c1%s\\c0 on the skater", argv[1]);
    return 1;
}


// `quit` and `exit` are the same command.
static int cmd_quit(int argc, char **argv, int *quoted) {
    logInfo("console: quitting");
    console_run(0x7b42337a/*better4_debug_quit*/);
    return 1;
}

static int game_paused;

static int cmd_pause(int argc, char **argv, int *quoted) {
    if (argc > 1) {
        if (!_stricmp(argv[1], "off") || !strcmp(argv[1], "0")) {
            game_paused = 0;
        } else if (!_stricmp(argv[1], "on") || !strcmp(argv[1], "1")) {
            game_paused = 1;
        } else {
            better4DebugPrint("\\c2usage: \\c0pause (on/off)");
            return 1;
        }
    } else {
        game_paused = !game_paused;
    }

    CStruct *params = CStruct_New();
    CStruct_AddInteger(params, 0xb94eb164/*paused*/, game_paused);
    Script_RunScript(0xc6be2214/*better4_debug_set_pause*/, params, 0, 0, 0);
    CStruct_Free(params);

    if (game_paused) {
        better4DebugPrint("\\c1paused\\c0 - anims will not advance until you unpause");
    } else {
        better4DebugPrint("\\c1running");
    }
    return 1;
}

static float anim_speed = 1.0f;
static int cmd_anim_speed(int argc, char **argv, int *quoted) {
    if (argc > 1) {
        char *end = 0;
        float value = (float)strtod(argv[1], &end);
        if (!*argv[1] || *end || value <= 0.0f || value > 10.0f) {
            better4DebugPrint("\\c2anim_speed wants a multiplier between 0 and 10");
            return 1;
        }
        anim_speed = value;
    }

    better4DebugPrint("\\c1anim_speed \\c6%g\\c0 - applies to the next anim_play", anim_speed);
    return 1;
}

static int cmd_anim_play(int argc, char **argv, int *quoted) {
    anim_scan();

    // Only a subset of the installed anims is loaded at any time, so look the
    // name up and hand the script its file path.
    const AnimEntry *entry = 0;
    for (int i = 0; i < anim_count; i++) {
        if (!_stricmp(anims[i].name, argv[1])) {
            entry = &anims[i];
            break;
        }
    }

    CStruct *params = CStruct_New();
    CStruct_AddChecksum(params, 0x6c2bfb7f/*animname*/, better4Checksum(argv[1]));
    CStruct_AddFloat(params, 0xf4cfd066/*animspeed*/, anim_speed);

    char file[MAX_PATH];
    if (entry) {
        sprintf_s(file, sizeof(file), "anims\\%s\\%s.ska", entry->category, entry->name);
        CStruct_AddString(params, 0xbe97b369/*animfile*/, file);
    }

    Script_RunScript(0x826f3351/*better4_debug_anim_play*/, params, 0, 0, 0);
    CStruct_Free(params);

    if (entry) {
        better4DebugPrint("\\c1playing \\c6%s\\c0 from \\c6%s\\c0 at \\c6%gx",
                          entry->name, entry->category, anim_speed);
    } else {
        better4DebugPrint("\\c1playing \\c6%s\\c0 at \\c6%gx \\c3(not found on disk)",
                          argv[1], anim_speed);
    }
    return 1;
}

static int cmd_script(int argc, char **argv, int *quoted) {
    CStruct *params = CStruct_New();
    CStruct_AddChecksum(params, 0xeca9617c/*scriptname*/, better4Checksum(argv[1]));
    add_script_params(params, argc, argv, quoted, 2);

    Script_RunScript(0xa48a0213/*better4_debug_run_script*/, params, 0, 0, 0);
    CStruct_Free(params);
    return 1;
}

static const ConsoleCommand commands[] = {
    { "help",     0,  1, cmd_help,     "help (command)",           "list commands, or describe one" },
    { "echo",     1, -1, cmd_echo,     "echo <text>",              "print text back to the console" },
    { "clear",    0,  0, cmd_clear,    "clear",                    "clear the console" },
    { "checksum", 1,  1, cmd_checksum, "checksum <name>",          "print the q script checksum of a name" },
    { "set",      2,  2, cmd_set,      "set <global> <value>",     "set a q script global, e.g. set hidehud 1" },
    { "get",      1,  1, cmd_get,      "get <global>",             "print a numeric q script global" },
    { "script",   1, -1, cmd_script,   "script <name> (k=v/flag)", "run a script or CFunc, e.g. script console_hide" },
    { "skater",   1, -1, cmd_skater,   "skater <name> (k=v/flag)", "run a skater member function, e.g. skater SetRollingFriction 100" },
    { "map",      0,  1, cmd_map,      "map (name)",               "list levels, or switch to one, e.g. map rio" },
    { "anim_list", 0, 1, cmd_anim_list, "anim_list (filter)",      "list anims that fit the skater rig" },
    { "anim_play", 1, 1, cmd_anim_play, "anim_play <name>",        "play an anim on the skater, e.g. anim_play Spacewalk" },
    { "anim_speed",0, 1, cmd_anim_speed,"anim_speed (multiplier)", "playback speed for anim_play, e.g. anim_speed 0.25" },
    { "pause",     0, 1, cmd_pause,     "pause (on/off)",          "freeze the game, anims do not advance while paused" },
    { "quit",      0, 0, cmd_quit,      "quit",                    "close the game immediately, without saving" },
    { "exit",      0, 0, cmd_quit,      "exit",                    "same as quit" },
};

static const ConsoleCommand *get_command(int index) {
    return &commands[index];
}

static int num_commands(void) {
    return sizeof(commands) / sizeof(commands[0]);
}

int better4DebugExec(const char *line_in) {
    if (!line_in) {
        return 0;
    }

    char line[CONSOLE_MAX_LINE];
    strncpy_s(line, sizeof(line), line_in, _TRUNCATE);

    char *start = line;
    while (*start == ' ' || *start == '\t') {
        start++;
    }
    // Tolerate a leading slash, out of habit from other consoles.
    if (*start == '/' || *start == '\\') {
        start++;
    }

    char *argv[CONSOLE_MAX_ARGS];
    int quoted[CONSOLE_MAX_ARGS];
    int argc = tokenize(start, argv, quoted, CONSOLE_MAX_ARGS);
    if (argc == 0) {
        return 0;
    }

    for (int i = 0; i < num_commands(); i++) {
        const ConsoleCommand *command = get_command(i);
        if (_stricmp(command->name, argv[0])) {
            continue;
        }

        int args = argc - 1;
        if (args < command->min_args || (command->max_args >= 0 && args > command->max_args)) {
            better4DebugPrint("\\c2usage: \\c0%s", command->usage);
            return 1;
        }

        logInfo("console: running '%s'", line_in);
        return command->handler(argc, argv, quoted);
    }

    return 0;
}

static void console_history_push(const char *line) {
    if (!*line) {
        return;
    }
    // Skip an immediate repeat, the way a shell would.
    if (history_total > 0
        && !strcmp(history[(history_total - 1) % CONSOLE_HISTORY], line)) {
        return;
    }

    strncpy_s(history[history_total % CONSOLE_HISTORY], CONSOLE_INPUT_MAX, line, _TRUNCATE);
    history_total++;
}

static void console_history_step(int direction) {
    int oldest = history_total - CONSOLE_HISTORY;
    if (oldest < 0) {
        oldest = 0;
    }
    if (history_total == 0) {
        return;
    }

    if (history_browse < 0) {
        // Entering history from a fresh line; start at the newest entry.
        if (direction < 0) {
            return;
        }
        history_browse = history_total - 1;
    } else {
        history_browse -= direction;
    }

    if (history_browse >= history_total) {
        // Walked back past the newest entry: return to an empty fresh line.
        history_browse = -1;
        input_line[0] = '\0';
        input_len = 0;
        input_dirty = 1;
        return;
    }
    if (history_browse < oldest) {
        history_browse = oldest;
    }

    strncpy_s(input_line, sizeof(input_line), history[history_browse % CONSOLE_HISTORY], _TRUNCATE);
    input_len = (int)strlen(input_line);
    input_dirty = 1;
}

// Tab completion over the command table. A unique prefix is completed outright;
// an ambiguous one lists the candidates.
static void console_complete() {
    if (input_len == 0) {
        return;
    }
    // Only the command word completes; arguments are command-specific.
    if (strchr(input_line, ' ')) {
        return;
    }

    const ConsoleCommand *match = 0;
    int matches = 0;
    for (int i = 0; i < num_commands(); i++) {
        const ConsoleCommand *command = get_command(i);
        if (!_strnicmp(command->name, input_line, input_len)) {
            match = command;
            matches++;
        }
    }

    if (matches == 1) {
        strncpy_s(input_line, sizeof(input_line), match->name, _TRUNCATE);
        input_len = (int)strlen(input_line);
        input_dirty = 1;
        return;
    }

    if (matches > 1) {
        char line[CONSOLE_MAX_LINE] = "\\c3";
        for (int i = 0; i < num_commands(); i++) {
            const ConsoleCommand *command = get_command(i);
            if (!_strnicmp(command->name, input_line, input_len)) {
                strcat_s(line, sizeof(line), command->name);
                strcat_s(line, sizeof(line), " ");
            }
        }
        better4DebugPrint("%s", line);
    }
}

static void console_open_overlay() {
    if (console_open) {
        return;
    }

    console_open = 1;
    input_line[0] = '\0';
    input_len = 0;
    history_browse = -1;
    scroll_offset = 0;
    rows_rendered = 0;
    needs_rebuild = 1;
    input_dirty = 1;

    logInfo("console: creating overlay elements");
    console_run(0x0a415251/*better4_console_open_now*/);
    logInfo("console: overlay elements created");

    if (scrollback_total == 0) {
        scrollback_add("\\c1Better4 developer console\\c0 - type help, tab completes, pgup scrolls");
    }
}

static void console_close_overlay() {
    if (!console_open) {
        return;
    }

    console_open = 0;
    rows_rendered = 0;
    console_run(0x1dbe3551/*better4_console_destroy*/);
}

static void console_submit() {
    char line[CONSOLE_INPUT_MAX];
    strncpy_s(line, sizeof(line), input_line, _TRUNCATE);

    input_line[0] = '\0';
    input_len = 0;
    history_browse = -1;
    scroll_offset = 0;
    input_dirty = 1;

    const char *trimmed = line;
    while (*trimmed == ' ') {
        trimmed++;
    }
    if (!*trimmed) {
        return;
    }

    console_history_push(trimmed);

    // Echo first, so output reads in order under the command that caused it.
    better4DebugPrint("\\c6>%s", trimmed);

    if (!better4DebugExec(trimmed)) {
        better4DebugPrint("\\c2unknown command: \\c0%s", trimmed);
    }
}

// Input capturing.
static SDL_EventFilter previous_filter;
static void *previous_filter_userdata;

static int SDLCALL consoleEventFilter(void *userdata, SDL_Event *event) {
    int consumed = 0;

    switch (event->type) {
    case SDL_KEYDOWN:
        if (event->key.keysym.scancode == console_toggle_key) {
            want_toggle = 1;
            consumed = 1;
            break;
        }

        if (!console_open) {
            break;
        }

        consumed = 1;
        switch (event->key.keysym.scancode) {
        case SDL_SCANCODE_RETURN:
        case SDL_SCANCODE_KP_ENTER:
            want_submit = 1;
            break;
        case SDL_SCANCODE_ESCAPE:
            want_close = 1;
            break;
        case SDL_SCANCODE_BACKSPACE:
            if (input_len > 0) {
                input_line[--input_len] = '\0';
                input_dirty = 1;
            }
            break;
        case SDL_SCANCODE_UP:
            console_history_step(1);
            break;
        case SDL_SCANCODE_DOWN:
            console_history_step(-1);
            break;
        case SDL_SCANCODE_PAGEUP:
            scroll_offset += CONSOLE_VISIBLE_ROWS / 2;
            needs_rebuild = 1;
            input_dirty = 1;
            break;
        case SDL_SCANCODE_PAGEDOWN:
            scroll_offset -= CONSOLE_VISIBLE_ROWS / 2;
            if (scroll_offset < 0) {
                scroll_offset = 0;
            }
            needs_rebuild = 1;
            input_dirty = 1;
            break;
        case SDL_SCANCODE_TAB:
            console_complete();
            break;
        default:
            // Everything else is swallowed so it cannot drive the skater, but
            // needs no handling of its own.
            break;
        }
        break;

    case SDL_KEYUP:
        consumed = console_open || event->key.keysym.scancode == console_toggle_key;
        break;

    case SDL_TEXTINPUT:
        if (!console_open) {
            break;
        }
        consumed = 1;
        for (const char *c = event->text.text; *c; c++) {
            // The toggle key would otherwise type itself on the way in.
            if (*c == '`' || *c < ' ') {
                continue;
            }
            if (input_len + 1 >= CONSOLE_INPUT_MAX) {
                break;
            }

            // The small font has no glyph for `"`, so typing one would show a
            // missing-glyph box. Substitute `'`, which the tokenizer accepts as
            // an equivalent delimiter.
            char typed = (*c == '"') ? '\'' : *c;

            input_line[input_len++] = typed;
            input_line[input_len] = '\0';
            input_dirty = 1;
        }
        break;

    default:
        break;
    }

    if (consumed) {
        return 0;
    }

    if (previous_filter) {
        return previous_filter(previous_filter_userdata, event);
    }
    return 1;
}

// Presents an untouched pad while the console has the keyboard.
static void neutralize_pad(device *dev) {
    dev->controlData[2] = 0xff;
    dev->controlData[3] = 0xff;

    // Analog pressure values; these are not inverted, 0 is released.
    for (int i = 8; i <= 20; i++) {
        dev->controlData[i] = 0;
    }

    // Sticks centered.
    dev->controlData[4] = 127;
    dev->controlData[5] = 127;
    dev->controlData[6] = 127;
    dev->controlData[7] = 127;

    // Both are derived from the bitmap above, so they have to agree with it.
    dev->pressed = 0;
    dev->start_or_a_pressed = 0;
}

void __cdecl better4ProcessController(device *dev) {
    processController(dev);

    if (!debug_enabled) {
        return;
    }

    // Called once per pad, so every pad gets frozen, but the console itself is
    // driven only from the first.
    if (dev->port != 0) {
        if (console_open) {
            neutralize_pad(dev);
        }
        return;
    }

    if (want_toggle) {
        want_toggle = 0;
        // Leave the game's own keyboard alone if it is already up.
        if (console_open) {
            console_close_overlay();
        } else if (!*keyboard_on_screen) {
            console_open_overlay();
        }
    }

    if (want_close) {
        want_close = 0;
        console_close_overlay();
    }

    if (!console_open) {
        return;
    }

    if (!console_elements_exist()) {
        logInfo("console: overlay was destroyed externally, closing");
        console_open = 0;
        rows_rendered = 0;
        return;
    }

    if (want_submit) {
        want_submit = 0;
        console_submit();
    }

    console_sync_rows();
    if (input_dirty) {
        console_sync_input();
    }

    neutralize_pad(dev);
}

// Resolves `[Miscellaneous] ConsoleKey` to a scancode.
static int read_ini_string(const char *key, char *out, size_t out_size) {
    char value[128] = "";
    GetPrivateProfileStringA("Miscellaneous", key, "", value, sizeof(value), configFile);

    char *comment = strchr(value, ';');
    if (comment) {
        *comment = '\0';
    }
    char *start = value;
    while (*start == ' ' || *start == '\t') {
        start++;
    }
    for (char *end = start + strlen(start); end > start; end--) {
        if (end[-1] != ' ' && end[-1] != '\t') {
            *end = '\0';
            break;
        }
    }

    if (!*start) {
        return 0;
    }

    strncpy_s(out, out_size, start, _TRUNCATE);
    return 1;
}

static void read_toggle_key() {
    char start[64];
    if (!read_ini_string("ConsoleKey", start, sizeof(start))) {
        return;
    }

    SDL_Scancode scancode = SDL_GetScancodeFromName(start);
    if (scancode == SDL_SCANCODE_UNKNOWN) {
        logWarning("ConsoleKey \"%s\" is not an SDL key name; keeping %s",
                   start, SDL_GetScancodeName(console_toggle_key));
        return;
    }

    console_toggle_key = scancode;
}

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

    level_scan();

    for (int i = 0; i < level_count; i++) {
        if (!_stricmp(levels[i].name, startup_level)) {
            return levels[i].load;
        }
    }
    for (int i = 0; i < level_count; i++) {
        if (contains_nocase(levels[i].name, startup_level)) {
            return levels[i].load;
        }
    }

    logWarning("StartupLevel \"%s\" is not a known level name, using it as a "
               "load script", startup_level);
    return better4Checksum(startup_level);
}

void initDebugConsole() {
    read_ini_string("StartupLevel", startup_level, sizeof(startup_level));
    if (*startup_level) {
        logInfo("StartupLevel is \"%s\"", startup_level);
    }

    debug_enabled = getIniBool("Miscellaneous", "Debug", 0, configFile);
    logInfo("Debug console %s", debug_enabled ? "enabled" : "disabled");

    if (debug_enabled) {
        read_toggle_key();
    }
}

void patchDebugConsole() {
    if (!debug_enabled) {
        return;
    }

    SDL_EventFilter existing = 0;
    void *existing_userdata = 0;
    if (SDL_GetEventFilter(&existing, &existing_userdata) && existing != consoleEventFilter) {
        previous_filter = existing;
        previous_filter_userdata = existing_userdata;
    }
    SDL_SetEventFilter(consoleEventFilter, 0);

    patchThisToCdecl((void *)THPS4_PROCESS_CONTROLLER, (void *)better4ProcessController);

    logInfo("Debug console overlay installed (toggle: ` )");
}

// Called once per level by better4_debug_map_scan, so the level tables stay in
// script and C just keeps what it is handed.
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

int __cdecl CFunc_Better4DebugConsoleAlive(CStruct *params, CScript *script) {
    console_alive = 1;
    return 1;
}

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

int __cdecl CFunc_Better4DebugPrint(CStruct *params, CScript *script) {
    const char *text = 0;
    if (!CStruct_GetString(params, 0xc4745838/*text*/, &text, 0)
        && !CStruct_GetString(params, 0, &text, 0)) {
        return 0;
    }

    better4DebugPrint("%s", text);
    return 1;
}
