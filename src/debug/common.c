#include "debug/common.h"

#include <string.h>
#include <windows.h>

extern char configFile[1024];

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

int read_ini_string(const char *key, char *out, size_t out_size) {
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
