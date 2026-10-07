#ifndef _DECOMP_MTH_MATRIX_H_
#define _DECOMP_MTH_MATRIX_H_

#include "decomp/Mth_Vector.h"

typedef struct Mth_Matrix {
    Mth_Vector x;
    Mth_Vector y;
    Mth_Vector z;
    Mth_Vector w;
} Mth_Matrix;

void Mth_Matrix_Assign(Mth_Matrix *out, Mth_Matrix *this);
void Mth_Matrix_Mult(Mth_Matrix *out, Mth_Matrix *this, Mth_Matrix *other);
void Mth_Matrix_MultVec(Mth_Vector *out, Mth_Matrix *this, Mth_Vector *other);

void Mth_CreateRotateXMatrix(Mth_Matrix *out, float angle);
void Mth_CreateRotateYMatrix(Mth_Matrix *out, float angle);
void Mth_CreateRotateZMatrix(Mth_Matrix *out, float angle);

void Mth_Matrix_RotateX(Mth_Matrix *out, Mth_Matrix *this, float angle);
void Mth_Matrix_RotateY(Mth_Matrix *out, Mth_Matrix *this, float angle);
void Mth_Matrix_RotateZ(Mth_Matrix *out, Mth_Matrix *this, float angle);
void Mth_Matrix_RotateLocal(Mth_Matrix *out, Mth_Matrix *this, Mth_Vector *rot);

#endif
