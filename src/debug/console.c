#include "debug/console.h"

#include "debug/commands.h"
#include "debug/common.h"

#include "log.h"

#include "config.h"
#include "partymod-thps4/src/input.h"
#include "partymod-thps4/src/patch.h"

#include <SDL2/SDL.h>

#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define CONSOLE_INPUT_MAX 128
#define CONSOLE_HISTORY 32
#define CONSOLE_VISIBLE_ROWS 14

extern char configFile[1024];

// Set by the game when its own on-screen keyboard is up.
static uint8_t *keyboard_on_screen = (uint8_t *)0x00ab5bae;

// Where partymod installs processController; re-pointed at our wrapper so the
// skater can be frozen while the overlay has the keyboard.
#define THPS4_PROCESS_CONTROLLER 0x005409b0

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

void better4ConsoleClear(void) {
    if (console_open) {
        scrollback_floor = scrollback_total;
        scroll_offset = 0;
        needs_rebuild = 1;
    } else {
        console_run(0x05f35bcb/*console_clear*/);
    }
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
    for (int i = 0; i < consoleCommandCount(); i++) {
        const ConsoleCommand *command = consoleCommandAt(i);
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
        for (int i = 0; i < consoleCommandCount(); i++) {
            const ConsoleCommand *command = consoleCommandAt(i);
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

int __cdecl CFunc_Better4DebugConsoleAlive(CStruct *params, CScript *script) {
    console_alive = 1;
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
