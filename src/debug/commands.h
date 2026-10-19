#ifndef _DEBUG_COMMANDS_H_
#define _DEBUG_COMMANDS_H_

typedef struct {
    const char *name;
    int min_args; // not counting the command itself
    int max_args; // -1 for unlimited
    int (*handler)(int argc, char **argv, int *quoted);
    const char *usage;
    const char *help;
} ConsoleCommand;

const ConsoleCommand *consoleCommandAt(int index);
int consoleCommandCount(void);

#endif
