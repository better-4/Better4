#ifndef _DECOMP_MTH_VECTOR_H_
#define _DECOMP_MTH_VECTOR_H_

typedef struct Mth_Vector {
    float x;
    float y;
    float z;
    float w;
} Mth_Vector;

Mth_Vector Mth_Vector_Mult(Mth_Vector *this, float scale);
Mth_Vector Mth_Vector_Sub(Mth_Vector *this, Mth_Vector *other);

void Mth_Vector_Assign(Mth_Vector *this, Mth_Vector *src);
float Mth_Vector_Length(Mth_Vector *this);

void Mth_Vector_RotateToPlane(Mth_Vector *this, Mth_Vector *normal);
void Mth_Vector_Normalize(Mth_Vector *this);

#endif
