#include "decomp/Mth.h"

float Mth_DegToRad(float deg) {
    return deg * 0.0174532925f;
}

float Mth_RadToDeg(float rad) {
    return rad * 57.29577958f;
}

float Mth_DotProduct(Mth_Vector *a, Mth_Vector *b) {
    return (a->x * b->x + a->y * b->y + a->z * b->z + a->w * b->w);
}

void Mth_CrossProduct(Mth_Vector *out, Mth_Vector *a, Mth_Vector *b) {
    static void(__cdecl* _CrossProduct)(Mth_Vector *, Mth_Vector *, Mth_Vector *) = (void *)0x004039b0;
    _CrossProduct(out, a, b);
}
