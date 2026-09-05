#ifndef _DECOMP_MTH_MATRIX_H_
#define _DECOMP_MTH_MATRIX_H_

#include "decomp/Mth_Vector.h"

typedef struct Mth_Matrix {
    Mth_Vector x;
    Mth_Vector y;
    Mth_Vector z;
    Mth_Vector w;
} Mth_Matrix;

void Mth_Matrix_Assign(Mth_Matrix *this, Mth_Matrix *src);

#endif
