#include "decomp/CArray.h"
#include "decomp/common.h"


typedef void(__fastcall* _CArray_New_t)(CArray *this);
_CArray_New_t _CArray_New = (_CArray_New_t)0x004085d0;

CArray *CArray_New() {
	CArray *this = (CArray *)malloc(sizeof(CArray));
    _CArray_New(this);
    return this;
}

typedef void(__cdecl* _CleanUpArray_t)(CArray *this);
_CleanUpArray_t _CleanUpArray = (_CleanUpArray_t)0x00414d50;

void CArray_Free(CArray *this) {
    // NOTE (ellie): Not sure whether Script::CArray::Clear or Script::CleanUpArray is more apt here
    _CleanUpArray(this);
    free(this);
}

typedef void(__fastcall* _CArray_SetStructure_t)(CArray *this, unused_t, uint32_t index, struct CStruct *value);
_CArray_SetStructure_t _CArray_SetStructure = (_CArray_SetStructure_t)0x00408770;

void CArray_SetStructure(CArray *this, uint32_t index, struct CStruct *value) {
    _CArray_SetStructure(this, UNUSED, index, value);
}

typedef void(__fastcall* _CArray_SetSizeAndType_t)(CArray *this, unused_t, uint32_t size, uint32_t type);
_CArray_SetSizeAndType_t _CArray_SetSizeAndType = (_CArray_SetSizeAndType_t)0x00408660;

void CArray_SetSizeAndType(CArray *this, uint32_t size, uint32_t type) {
    _CArray_SetSizeAndType(this, UNUSED, size, type);
}
