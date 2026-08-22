#ifndef _CSTRUCT_H_
#define _CSTRUCT_H_

#include <stdint.h>

// Forward declarations
struct CArray;

// A CStruct in THPS4 is a linked list of components, which are akin to key-value pairs.
// Components are identified by checksum, representing the CRC32 of the component's name.
// They also contain a type (int, str, CStruct, etc.) and associated value.

// All `Add*` functions push a new component to the end of the list.
// All `Get*` functions find the first component in the list with the desired type and return 1,
// or return 0 if no such component is found.
// Therefore, when changing component values, remove the component before adding it.

// In the THPS4 binary, All add/get functions have two variants: 
//
//  * One which takes `uint32_t checksum` as the first argument
//  * One which takes `const char *name` as the first argument, computes its CRC32,
//    then calls the previous function.
//
// Here, we only point to the functions which take checksum for performance.

typedef struct CStruct {
    // TODO (ellie): figure out what these fields are
    uint8_t unk[0x8];
} CStruct;

CStruct *CStruct_New();
void CStruct_Free(CStruct *this);
void CStruct_AddArray(CStruct *this, uint32_t checksum, struct CArray *value);
void CStruct_AddChecksum(CStruct *this, uint32_t checksum, uint32_t value);
void CStruct_AddFloat(CStruct *this, uint32_t checksum, float value);
void CStruct_AddInteger(CStruct *this, uint32_t checksum, int value);
void CStruct_AddString(CStruct *this, uint32_t checksum, char *value);
int CStruct_GetChecksum(CStruct *this, uint32_t checksum, uint32_t *ret, int assert);
int CStruct_GetFloat(CStruct *this, uint32_t checksum, float *ret, int assert);
int CStruct_GetInteger(CStruct *this, uint32_t checksum, int *ret, int assert);
int CStruct_GetString(CStruct *this, uint32_t checksum, const char **ret, int assert);
void CStruct_RemoveComponent(CStruct *this, uint32_t checksum);

#endif
