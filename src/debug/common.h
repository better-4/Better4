#ifndef _DEBUG_COMMON_H_
#define _DEBUG_COMMON_H_

#include <stdint.h>
#include <stddef.h>

// This is what lets the console resolve a name typed at runtime, which in turn
// is what makes `set`, `get` and `script` possible.
uint32_t better4Checksum(const char *name);

int read_ini_string(const char *key, char *out, size_t out_size);

#endif
