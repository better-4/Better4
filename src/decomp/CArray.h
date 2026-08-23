#ifndef _CARRAY_H_
#define _CARRAY_H_

#include <stdint.h>

// Forward declarations
struct CStruct;

typedef struct CArray {
    uint8_t unk[0x4];
    uint32_t type;
    uint32_t size;
} CArray;

CArray *CArray_New();
void CArray_Free(CArray *this);
void CArray_SetStructure(CArray *this, uint32_t index, struct CStruct *value);
void CArray_SetSizeAndType(CArray *this, uint32_t size, uint32_t type);

#endif
