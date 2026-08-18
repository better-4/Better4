#include "qb.h"

#include <string.h>

// We mock __thiscall calling convention by using __fastcall and a dummy second parameter.
// `this` loaded into `ecx`, `_` loaded into `edx` and safely ignored, rest pushed onto stack.
#define UNUSED 0
typedef uint32_t unused_t;

// class CStruct

typedef void(__fastcall* _CStruct_New_t)(CStruct *this);
_CStruct_New_t _CStruct_New = (_CStruct_New_t)0x00415710;

CStruct *CStruct_New() {
	CStruct *this = (CStruct *)malloc(sizeof(CStruct));
    _CStruct_New(this);
    return this;
}

typedef void(__fastcall* _CStruct_Clear_t)(CStruct *this);
_CStruct_Clear_t _CStruct_Clear = (_CStruct_Clear_t)0x004159e0;

void CStruct_Free(CStruct *this) {
    _CStruct_Clear(this);
    free(this);
}

typedef void(__fastcall* _CStruct_AddArray_t)(CStruct *this, unused_t, uint32_t checksum, CArray *value);
_CStruct_AddArray_t _CStruct_AddArray = (_CStruct_AddArray_t)0x004171e0;

void CStruct_AddArray(CStruct *this, uint32_t checksum, CArray *value) {
    _CStruct_AddArray(this, UNUSED, checksum, value);
}

typedef void(__fastcall* _CStruct_AddChecksum_t)(CStruct *this, unused_t, uint32_t checksum, uint32_t value);
_CStruct_AddChecksum_t _CStruct_AddChecksum = (_CStruct_AddChecksum_t)0x00416a00;

void CStruct_AddChecksum(CStruct *this, uint32_t checksum, uint32_t value) {
    _CStruct_AddChecksum(this, UNUSED, checksum, value);
}

typedef void(__fastcall* _CStruct_AddFloat_t)(CStruct *this, unused_t, uint32_t checksum, float value);
_CStruct_AddFloat_t _CStruct_AddFloat = (_CStruct_AddFloat_t)0x00416830;

void CStruct_AddFloat(CStruct *this, uint32_t checksum, float value) {
    _CStruct_AddFloat(this, UNUSED, checksum, value);
}

typedef void(__fastcall* _CStruct_AddInteger_t)(CStruct *this, unused_t, uint32_t checksum, int value);
_CStruct_AddInteger_t _CStruct_AddInteger = (_CStruct_AddInteger_t)0x00416660;

void CStruct_AddInteger(CStruct *this, uint32_t checksum, int value) {
    _CStruct_AddInteger(this, UNUSED, checksum, value);
}

typedef void(__fastcall* _CStruct_AddString_t)(CStruct *this, unused_t, uint32_t checksum, char *value);
_CStruct_AddString_t _CStruct_AddString = (_CStruct_AddString_t)0x004162f0;

void CStruct_AddString(CStruct *this, uint32_t checksum, char *value) {
    _CStruct_AddString(this, UNUSED, checksum, value);
}

typedef int(__fastcall* _CStruct_GetChecksum_t)(CStruct *this, unused_t, uint32_t checksum, uint32_t *ret, int assert);
_CStruct_GetChecksum_t _CStruct_GetChecksum = (_CStruct_GetChecksum_t)0x004184b0;

int CStruct_GetChecksum(CStruct *this, uint32_t checksum, uint32_t *ret, int assert) {
    return _CStruct_GetChecksum(this, UNUSED, checksum, ret, assert);
}

typedef int(__fastcall* _CStruct_GetFloat_t)(CStruct *this, unused_t, uint32_t checksum, float *ret, int assert);
_CStruct_GetFloat_t _CStruct_GetFloat = (_CStruct_GetFloat_t)0x00418100;

int CStruct_GetFloat(CStruct *this, uint32_t checksum, float *ret, int assert) {
    return _CStruct_GetFloat(this, UNUSED, checksum, ret, assert);
}

typedef int(__fastcall* _CStruct_GetInteger_t)(CStruct *this, unused_t, uint32_t checksum, int *ret, int assert);
_CStruct_GetInteger_t _CStruct_GetInteger = (_CStruct_GetInteger_t)0x00417ea0;

int CStruct_GetInteger(CStruct *this, uint32_t checksum, int *ret, int assert) {
    return _CStruct_GetInteger(this, UNUSED, checksum, ret, assert);
}

typedef int(__fastcall* _CStruct_GetString_t)(CStruct *this, unused_t, uint32_t checksum, const char **ret, int assert);
_CStruct_GetString_t _CStruct_GetString = (_CStruct_GetString_t)0x00417ff0;

int CStruct_GetString(CStruct *this, uint32_t checksum, const char **ret, int assert) {
    return _CStruct_GetString(this, UNUSED, checksum, ret, assert);
}

typedef void(__fastcall* _CStruct_RemoveComponent_t)(CStruct *this, unused_t, uint32_t checksum);
_CStruct_RemoveComponent_t _CStruct_RemoveComponent = (_CStruct_RemoveComponent_t)0x00415b20;

void CStruct_RemoveComponent(CStruct *this, uint32_t checksum) {
    _CStruct_RemoveComponent(this, UNUSED, checksum);
}

// class CArray

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

typedef void(__fastcall* _CArray_SetStructure_t)(CStruct *this, unused_t, uint32_t index, CArray *value);
_CArray_SetStructure_t _CArray_SetStructure = (_CArray_SetStructure_t)0x00408770;

void CArray_SetStructure(CArray *this, uint32_t index, CStruct *value) {
    _CArray_SetStructure(this, UNUSED, index, value);
}

typedef void(__fastcall* _CArray_SetSizeAndType_t)(CStruct *this, unused_t, uint32_t size, uint32_t type);
_CArray_SetSizeAndType_t _CArray_SetSizeAndType = (_CArray_SetSizeAndType_t)0x00408660;

void CArray_SetSizeAndType(CArray *this, uint32_t size, uint32_t type) {
    _CArray_SetSizeAndType(this, UNUSED, size, type);
}

// class CScript

CStruct *CScript_GetParams(CScript *this) {
    // inlined during compilation; access member directly
    return this->params;
    // return *(CStruct **)(((char *)this) + 0x14);
}

