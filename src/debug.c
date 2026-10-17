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

// Rows are plain TextElements, so they do not wrap.
#define CONSOLE_WRAP_COLS 100

extern char configFile[1024];

// Set by the game when its own on-screen keyboard is up (partymod reads the
// same byte). The overlay stays out of the way while that is showing.
static uint8_t *keyboard_on_screen = (uint8_t *)0x00ab5bae;

// Where partymod installs processController; re-pointed at our wrapper so the
// skater can be frozen while the overlay has the keyboard.
#define THPS4_PROCESS_CONTROLLER 0x005409b0

typedef int(__cdecl* CFunc_Change_t)(CStruct *);
static CFunc_Change_t CFunc_Change = (CFunc_Change_t)0x0050f630;

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

static void scrollback_add(const char *text) {
    char rest[CONSOLE_MAX_LINE];
    strncpy_s(rest, sizeof(rest), text, _TRUNCATE);

    char *p = rest;
    while (1) {
        size_t len = strlen(p);
        if (len <= CONSOLE_WRAP_COLS) {
            scrollback_push(p);
            return;
        }

        int split = CONSOLE_WRAP_COLS;
        for (int i = CONSOLE_WRAP_COLS; i > CONSOLE_WRAP_COLS / 2; i--) {
            if (p[i] == ' ') {
                split = i;
                break;
            }
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

        if (*p == '"') {
            argv[argc] = ++p;
            quoted[argc] = 1;
            while (*p && *p != '"') {
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

// The anims Better4 itself loads, from the LoadAnim calls in better4_anims.q.
static const char *better4_anim_names[] = {
    "ACAir_Idle", "ACAir_Init", "ACAir_Out", "BS180PressureFlip", "BS360PressureFlip",
    "BSToeFlip", "Berzerker", "ClawDrag_Idle", "ClawDrag_Init", "ClawPunch",
    "CrouchToPressure", "DrunkGrind_Idle", "DrunkGrind_Init", "DuckDive_Idle",
    "DuckDive_Init", "DuckDive_Out", "Eyeball_Idle", "Eyeball_Init", "FS360PressureFlip",
    "FSDarkSlide_Init", "FSDarkSlide_Out", "FSDarkSlide_Range", "HTeethSweeper_Init",
    "HTeethSweeper_Out", "HTeethSweeper_Range", "Maul", "MaulForceGrab_Idle",
    "MaulForceGrab_Init", "MaulForceGrab_Out", "MaulNinjaManual_Idle",
    "MaulNinjaManual_Init", "MaulRollGrind_Idle", "MaulRollGrind_Init",
    "PaddleGrind_Idle", "PaddleGrind_Init", "PaddleGrind_Out", "PizzaGuy_Idle",
    "PizzaGuy_Init", "PizzaGuy_Out", "PreviewDeck", "RoastBeef", "RoastBeef_Idle",
    "RodeoClown_Idle", "RodeoClown_Init", "RodeoClown_Out", "SkateToPressure",
    "Sobriety_Init", "Sobriety_Range", "Spacewalk", "SpacewalkFromManual",
    "SpacewalkToManual", "Summoner_Idle", "Summoner_Init", "Summoner_Out",
    "VisitingHome_Idle", "VisitingHome_Init", "VisitingHome_Out", "Wallpush_Crouched",
    "Wallpush_Manual", "Wallpush_NoseManual", "Wallpush_Standing", "WorkForFood_Idle",
    "WorkForFood_Init", "XArm_Init", "XArm_Out", "XArm_Range", "XBonePile_Idle",
    "XBonePile_Init", "XBonePile_Out", "XHeart_Idle", "XHeart_Init", "XHeart_Out",
    "XJuggle_Idle", "XJuggle_Init", "XJuggle_Out", "XSpin_Idle", "XSpin_Init",
    "XSpin_Out", "ZZZZManual_idle", "ZZZZManual_init",
};

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

static int cmd_anim_list(int argc, char **argv, int *quoted) {
    const char *filter = argc > 1 ? argv[1] : 0;
    int total = sizeof(better4_anim_names) / sizeof(better4_anim_names[0]);

    // Pack several names per row rather than one each, so a filtered search
    // fits on screen instead of pushing itself out of the scrollback.
    char line[CONSOLE_MAX_LINE] = "";
    int shown = 0;

    for (int i = 0; i < total; i++) {
        const char *name = better4_anim_names[i];
        if (filter && !contains_nocase(name, filter)) {
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
        shown++;
    }

    if (*line) {
        better4DebugPrint("%s", line);
    }

    if (filter) {
        better4DebugPrint("\\c1%d of %d anims matching \\c6%s", shown, total, filter);
    } else {
        better4DebugPrint("\\c1%d anims\\c0 - anim_play <name>, anim_list <filter>", shown);
    }
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
            better4DebugPrint("\\c2usage: \\c0pause [on|off]");
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
    CStruct *params = CStruct_New();
    CStruct_AddChecksum(params, 0x6c2bfb7f/*animname*/, better4Checksum(argv[1]));
    CStruct_AddFloat(params, 0xf4cfd066/*animspeed*/, anim_speed);
    Script_RunScript(0x826f3351/*better4_debug_anim_play*/, params, 0, 0, 0);
    CStruct_Free(params);

    better4DebugPrint("\\c1playing \\c6%s\\c0 at \\c6%gx", argv[1], anim_speed);
    return 1;
}

static int cmd_script(int argc, char **argv, int *quoted) {
    CStruct *params = CStruct_New();
    CStruct_AddChecksum(params, 0xeca9617c/*scriptname*/, better4Checksum(argv[1]));

    for (int i = 2; i < argc; i++) {
        char *equals = quoted[i] ? 0 : strchr(argv[i], '=');
        if (equals) {
            *equals = '\0';
            add_value(params, better4Checksum(argv[i]), equals + 1, 0);
        } else {
            CStruct_AddInteger(params, better4Checksum(argv[i]), 1);
        }
    }

    Script_RunScript(0xa48a0213/*better4_debug_run_script*/, params, 0, 0, 0);
    CStruct_Free(params);
    return 1;
}

static const ConsoleCommand commands[] = {
    { "help",     0,  1, cmd_help,     "help [command]",           "list commands, or describe one" },
    { "echo",     1, -1, cmd_echo,     "echo <text>",              "print text back to the console" },
    { "clear",    0,  0, cmd_clear,    "clear",                    "clear the console" },
    { "checksum", 1,  1, cmd_checksum, "checksum <name>",          "print the q script checksum of a name" },
    { "set",      2,  2, cmd_set,      "set <global> <value>",     "set a q script global, e.g. set hidehud 1" },
    { "get",      1,  1, cmd_get,      "get <global>",             "print a numeric q script global" },
    { "script",   1, -1, cmd_script,   "script <name> [k=v|flag]", "run a q script, e.g. script console_hide" },
    { "anim_list", 0, 1, cmd_anim_list, "anim_list [filter]",      "list the anims Better4 loads" },
    { "anim_play", 1, 1, cmd_anim_play, "anim_play <name>",        "play an anim on the skater, e.g. anim_play Spacewalk" },
    { "anim_speed",0, 1, cmd_anim_speed,"anim_speed [multiplier]", "playback speed for anim_play, e.g. anim_speed 0.25" },
    { "pause",     0, 1, cmd_pause,     "pause [on|off]",          "freeze the game; anims do not advance while paused" },
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
            input_line[input_len++] = *c;
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
static void read_toggle_key() {
    char value[64] = "";
    GetPrivateProfileStringA("Miscellaneous", "ConsoleKey", "", value, sizeof(value), configFile);

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

void initDebugConsole() {
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

int __cdecl CFunc_Better4DebugPrint(CStruct *params, CScript *script) {
    const char *text = 0;
    if (!CStruct_GetString(params, 0xc4745838/*text*/, &text, 0)
        && !CStruct_GetString(params, 0, &text, 0)) {
        return 0;
    }

    better4DebugPrint("%s", text);
    return 1;
}
