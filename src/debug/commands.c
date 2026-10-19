#include "debug/commands.h"

#include "debug/common.h"
#include "debug/console.h"
#include "debug/discovery.h"

#include "log.h"

#include "decomp/CScript.h"
#include "decomp/CStruct.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>

#define CONSOLE_MAX_ARGS 16

typedef int(__cdecl* CFunc_Change_t)(CStruct *);
static CFunc_Change_t CFunc_Change = (CFunc_Change_t)0x0050f630;

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

static int cmd_help(int argc, char **argv, int *quoted) {
    if (argc > 1) {
        for (int i = 0; i < consoleCommandCount(); i++) {
            const ConsoleCommand *command = consoleCommandAt(i);
            if (!_stricmp(command->name, argv[1])) {
                better4DebugPrint("\\c1%s\\c0 - %s", command->usage, command->help);
                return 1;
            }
        }

        better4DebugPrint("\\c2no such command '%s'", argv[1]);
        return 1;
    }

    char line[CONSOLE_MAX_LINE] = "\\c1commands:\\c0";
    for (int i = 0; i < consoleCommandCount(); i++) {
        strcat_s(line, sizeof(line), " ");
        strcat_s(line, sizeof(line), consoleCommandAt(i)->name);
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
    better4ConsoleClear();
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

// Summarizes anims by folder.
static int cmd_anim_list(int argc, char **argv, int *quoted) {
    better4AnimScan();

    int anim_count = 0;
    const AnimEntry *anims = better4AnimList(&anim_count);

    if (anim_count == 0) {
        better4DebugPrint("\\c2no anims found under data\\\\anims");
        return 1;
    }

    if (argc < 2) {
        for (int c = 0; c < better4AnimCategoryCount(); c++) {
            const char *category = better4AnimCategory(c);
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
        if (!better4NameContains(name, filter) && !better4NameContains(anims[i].category, filter)) {
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

static int cmd_map(int argc, char **argv, int *quoted) {
    better4LevelScan();

    int level_count = 0;
    const LevelEntry *levels = better4LevelList(&level_count);

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
            if (better4NameContains(levels[i].name, argv[1])) {
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
    Script_RunScript(0x7b42337a/*better4_debug_quit*/, 0, 0, 0, 0);
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
    better4AnimScan();

    int anim_count = 0;
    const AnimEntry *anims = better4AnimList(&anim_count);

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

const ConsoleCommand *consoleCommandAt(int index) {
    return &commands[index];
}

int consoleCommandCount(void) {
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

    for (int i = 0; i < consoleCommandCount(); i++) {
        const ConsoleCommand *command = consoleCommandAt(i);
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
