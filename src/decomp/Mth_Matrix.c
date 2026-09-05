#include "decomp/common.h"
#include "decomp/Mth_Matrix.h"
#include "decomp/Mth_Vector.h"

#include <math.h>

void Mth_Matrix_Assign(Mth_Matrix *this, Mth_Matrix *src) {
    Mth_Vector_Assign(&this->x, &src->x);
    Mth_Vector_Assign(&this->y, &src->y);
    Mth_Vector_Assign(&this->z, &src->z);
    Mth_Vector_Assign(&this->w, &src->w);
}
