#include "decomp/common.h"
#include "decomp/Mth_Vector.h"

#include <math.h>

// TODO (ellie): should these take in an `*out` param instead of returning a new vec?
Mth_Vector Mth_Vector_Mult(Mth_Vector *this, float scale) {
    Mth_Vector out;
    out.x = scale * this->x;
    out.y = scale * this->y;
    out.z = scale * this->z;
    out.w = scale * this->w;
    return out;
}

Mth_Vector Mth_Vector_Sub(Mth_Vector *this, Mth_Vector *other) {
    Mth_Vector out;
    out.x = this->x - other->x;
    out.y = this->y - other->y;
    out.z = this->z - other->z;
    out.w = this->w - other->w;
    return out;
}

void Mth_Vector_Assign(Mth_Vector *this, Mth_Vector *src) {
    this->x = src->x;
    this->y = src->y;
    this->z = src->z;
    this->w = src->w;
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
