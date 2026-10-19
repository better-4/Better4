#ifndef _DEBUG_DISCOVERY_H_
#define _DEBUG_DISCOVERY_H_

#include "decomp/CScript.h"
#include "decomp/CStruct.h"

#include <stdint.h>

#define ANIM_NAME_MAX 64

typedef struct {
    char name[ANIM_NAME_MAX];
    const char *category; // folder it came from, e.g. "skater_grind"
} AnimEntry;

typedef struct {
    char name[48];     // display name, e.g. "Rio"
    uint32_t load;     // its load script, e.g. Load_Rio
} LevelEntry;

// Case-insensitive substring match, for filtering listings.
int better4NameContains(const char *haystack, const char *needle);

void better4AnimScan(void);
const AnimEntry *better4AnimList(int *count);
int better4AnimCategoryCount(void);
const char *better4AnimCategory(int index);

void better4LevelScan(void);
const LevelEntry *better4LevelList(int *count);

int __cdecl CFunc_Better4DebugAddLevel(CStruct *params, CScript *script);

#endif
