#include "decomp/common.h"
#include "decomp/Mth_Vector.h"

#include <math.h>

void Mth_Vector_Add(Mth_Vector *out, Mth_Vector *this, Mth_Vector *other) {
    out->x = this->x + other->x;
    out->y = this->y + other->y;
    out->z = this->z + other->z;
    out->w = this->w + other->w;
}

void Mth_Vector_Sub(Mth_Vector *out, Mth_Vector *this, Mth_Vector *other) {
    out->x = this->x - other->x;
    out->y = this->y - other->y;
    out->z = this->z - other->z;
    out->w = this->w - other->w;
}

void Mth_Vector_Mult(Mth_Vector *out, Mth_Vector *this, float scale) {
    out->x = this->x * scale;
    out->y = this->y * scale;
    out->z = this->z * scale;
    out->w = this->w * scale;
}

void Mth_Vector_Assign(Mth_Vector *out, Mth_Vector *this) {
    out->x = this->x;
    out->y = this->y;
    out->z = this->z;
    out->w = this->w;
}

float Mth_Vector_Length(Mth_Vector *this) {
    return sqrtf(this->x * this->x + this->y * this->y + this->z * this->z);
}

void Mth_Vector_RotateToPlane(Mth_Vector *this, Mth_Vector *normal) {
    static void(__fastcall* _RotateToPlane)(Mth_Vector *, unused_t, Mth_Vector *) = (void *)0x004050d0;
    _RotateToPlane(this, UNUSED, normal);
}

void Mth_Vector_Normalize(Mth_Vector *this) {
    static void(__fastcall* _Normalize)(Mth_Vector *) = (void *)0x00403960;
    _Normalize(this);
}
