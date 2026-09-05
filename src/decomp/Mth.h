#ifndef _DECOMP_MTH_H_
#define _DECOMP_MTH_H_

#include "decomp/Mth_Vector.h"

float Mth_DegToRad(float deg);
float Mth_RadToDeg(float rad);

float Mth_DotProduct(Mth_Vector *a, Mth_Vector *b);
void Mth_CrossProduct(Mth_Vector *out, Mth_Vector *a, Mth_Vector *b);

#endif
