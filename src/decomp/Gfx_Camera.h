#ifndef _GFX_CAMERA_H_
#define _GFX_CAMERA_H_

#include "decomp/Mth_Matrix.h"
#include "decomp/Mth_Vector.h"

typedef void Gfx_Camera;

Mth_Vector *Gfx_Camera_GetPos(Gfx_Camera *this);
void Gfx_Camera_SetPos(Gfx_Camera *this, Mth_Vector *pos);

Mth_Matrix *Gfx_Camera_GetMatrix(Gfx_Camera *this);
void Gfx_Camera_SetMatrix(Gfx_Camera *this, Mth_Matrix *mat);

#endif
