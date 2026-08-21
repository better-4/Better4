#include "decomp/CArray.h"
#include "decomp/common.h"

CArray *CArray_New() {
    static void(__fastcall* _New)(CArray *) = (void *)0x004085d0;

	CArray *this = (CArray *)malloc(sizeof(CArray));
    _New(this);
    return this;
}

void CArray_Free(CArray *this) {
    static void(__cdecl* _CleanUpArray)(CArray *this) = (void *)0x00414d50;
    // NOTE (ellie): Not sure whether Script::CArray::Clear or Script::CleanUpArray is more apt here
    _CleanUpArray(this);
    free(this);
}

void CArray_SetStructure(CArray *this, uint32_t index, struct CStruct *value) {
    static void(__fastcall* _SetStructure)(CArray *, unused_t, uint32_t, struct CStruct *) = (void *)0x00408770;
    _SetStructure(this, UNUSED, index, value);
}

void CArray_SetSizeAndType(CArray *this, uint32_t size, uint32_t type) {
    static void(__fastcall* _SetSizeAndType)(CArray *, unused_t, uint32_t, uint32_t) = (void *)0x00408660;
    _SetSizeAndType(this, UNUSED, size, type);
}
