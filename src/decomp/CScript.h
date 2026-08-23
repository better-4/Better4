#ifndef _CSCRIPT_H_
#define _CSCRIPT_H_

// Forward declarations
struct CStruct;

typedef struct CScript {
    // TODO (ellie): figure out what these fields are, will likely need to expand struct
    // if we ever allocate a CScript ourselves but idk how big it is
    char unk[0x14];
    struct CStruct *params; // 0x14
} CScript;

// CScript
struct CStruct *CScript_GetParams(CScript *this);

#endif
