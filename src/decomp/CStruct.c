#include "decomp/CStruct.h"
#include "decomp/common.h"

CStruct *CStruct_New() {
    static void(__fastcall* _New)(CStruct *) = (void *)0x00415710;

	CStruct *this = (CStruct *)malloc(sizeof(CStruct));
    _New(this);
    return this;
}

void CStruct_Free(CStruct *this) {
    static void(__fastcall* _Clear)(CStruct *) = (void *)0x004159e0;
    _Clear(this);
    free(this);
}

void CStruct_AddArray(CStruct *this, uint32_t checksum, struct CArray *value) {
    static void(__fastcall* _AddArray)(CStruct *, unused_t, uint32_t, struct CArray *) = (void *)0x004171e0;
    _AddArray(this, UNUSED, checksum, value);
}

void CStruct_AddChecksum(CStruct *this, uint32_t checksum, uint32_t value) {
    static void(__fastcall* _AddChecksum)(CStruct *, unused_t, uint32_t, uint32_t) = (void *)0x00416a00;
    _AddChecksum(this, UNUSED, checksum, value);
}

void CStruct_AddFloat(CStruct *this, uint32_t checksum, float value) {
    static void(__fastcall* _AddFloat)(CStruct *, unused_t, uint32_t, float) = (void *)0x00416830;
    _AddFloat(this, UNUSED, checksum, value);
}

void CStruct_AddInteger(CStruct *this, uint32_t checksum, int value) {
    static void(__fastcall* _AddInteger)(CStruct *, unused_t, uint32_t, int) = (void *)0x00416660;
    _AddInteger(this, UNUSED, checksum, value);
}

void CStruct_AddString(CStruct *this, uint32_t checksum, char *value) {
    static void(__fastcall* _AddString)(CStruct *, unused_t, uint32_t, char *) = (void *)0x004162f0;
    _AddString(this, UNUSED, checksum, value);
}

void CStruct_AddStructure(CStruct *this, uint32_t checksum, CStruct *value) {
    static void(__fastcall* _AddStructure)(CStruct *, unused_t, uint32_t, CStruct *) = (void *)0x004176d0;
    _AddStructure(this, UNUSED, checksum, value);
}

int CStruct_GetChecksum(CStruct *this, uint32_t checksum, uint32_t *ret, int assert) {
    static int(__fastcall* _GetChecksum)(CStruct *, unused_t, uint32_t, uint32_t *, int) = (void *)0x004184b0;
    return _GetChecksum(this, UNUSED, checksum, ret, assert);
}

int CStruct_GetFloat(CStruct *this, uint32_t checksum, float *ret, int assert) {
    static int(__fastcall* _GetFloat)(CStruct *, unused_t, uint32_t, float *, int) = (void *)0x00418100;
    return _GetFloat(this, UNUSED, checksum, ret, assert);
}

int CStruct_GetInteger(CStruct *this, uint32_t checksum, int *ret, int assert) {
    static int(__fastcall* _GetInteger)(CStruct *, unused_t, uint32_t, int *, int) = (void *)0x00418060;
    return _GetInteger(this, UNUSED, checksum, ret, assert);
}

int CStruct_GetString(CStruct *this, uint32_t checksum, const char **ret, int assert) {
    static int(__fastcall* _GetString)(CStruct *, unused_t, uint32_t, const char **, int) = (void *)0x00417ff0;
    return _GetString(this, UNUSED, checksum, ret, assert);
}

void CStruct_RemoveComponent(CStruct *this, uint32_t checksum) {
    static void(__fastcall* _RemoveComponent)(CStruct *, unused_t, uint32_t) = (void *)0x00415b20;
    _RemoveComponent(this, UNUSED, checksum);
}
