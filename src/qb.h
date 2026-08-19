#ifndef _QB_H_
#define _QB_H_

#include <stdint.h>

// Component types
#define TYPE_NONE 0x0
#define TYPE_INTEGER 0x1
#define TYPE_FLOAT 0x2
#define TYPE_STRING 0x3
#define TYPE_LOCALSTRING 0x4
#define TYPE_PAIR 0x5
#define TYPE_VECTOR 0x6
#define TYPE_QSCRIPT 0x7
#define TYPE_CFUNCTION 0x8
#define TYPE_MEMBERFUNCTION 0x9
#define TYPE_STRUCTURE 0xA
#define TYPE_STRUCTUREPOINTER 0xB
#define TYPE_ARRAY 0xC
#define TYPE_NAME 0xD
#define TYPE_INT8 0xE
#define TYPE_INT16 0xF
#define TYPE_UINT8 0x11
#define TYPE_UINT16 0x12
#define TYPE_ZEROFLOAT 0x13

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


typedef struct {
    // TODO (ellie): figure out what these fields are
    void *data1;
    void *data2;
} CStruct;

typedef struct {
    uint32_t *data;
    uint32_t type;
    uint32_t size;
} CArray;

typedef struct {
    // TODO (ellie): figure out what these fields are, will likely need to expand struct
    // if we ever allocate a CScript ourselves but idk how big it is
    void *data1; // 0x0
    void *data2; // 0x4
    void *data3; // 0x8
    void *data4; // 0xC
    void *data5; // 0x10
    CStruct *params; // 0x14
} CScript;

// CStruct
CStruct *CStruct_New();
void CStruct_Free(CStruct *this);
void CStruct_AddArray(CStruct *this, uint32_t checksum, CArray *value);
void CStruct_AddChecksum(CStruct *this, uint32_t checksum, uint32_t value);
void CStruct_AddFloat(CStruct *this, uint32_t checksum, float value);
void CStruct_AddInteger(CStruct *this, uint32_t checksum, int value);
void CStruct_AddString(CStruct *this, uint32_t checksum, char *value);
int CStruct_GetChecksum(CStruct *this, uint32_t checksum, uint32_t *ret, int assert);
int CStruct_GetFloat(CStruct *this, uint32_t checksum, float *ret, int assert);
int CStruct_GetInteger(CStruct *this, uint32_t checksum, int *ret, int assert);
int CStruct_GetString(CStruct *this, uint32_t checksum, const char **ret, int assert);
void CStruct_RemoveComponent(CStruct *this, uint32_t checksum);

// CArray
CArray *CArray_New();
void CArray_Free(CArray *this);
void CArray_SetStructure(CArray *this, uint32_t index, CStruct *value);
void CArray_SetSizeAndType(CArray *this, uint32_t size, uint32_t type);

// CScript
CStruct *CScript_GetParams(CScript *this);

#endif
