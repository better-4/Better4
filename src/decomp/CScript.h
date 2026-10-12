#ifndef _CSCRIPT_H_
#define _CSCRIPT_H_

#include <stdint.h>

// Forward declarations
struct CStruct;
struct CArray;

typedef struct CScript {
    uint8_t unk[0x14];
    struct CStruct *params; // 0x14
} CScript;

// CScript
struct CStruct *CScript_GetParams(CScript *this);

// TODO (ellie): maybe move these to separate `Script_` header?
void Script_RunScript(uint32_t checksum, struct CStruct *params, void *unk, uint8_t unk2, char *unk3);
struct CArray *Script_GetArray(uint32_t checksum, int assert);
float Script_GetFloat(uint32_t checksum);
char *Script_GetLocalString(char *name);

#endif
