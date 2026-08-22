#ifndef _MDL_SKATE_H_
#define _MDL_SKATE_H_

#include "decomp/Obj_CSkaterCam.h"
#include "decomp/Obj_CSkater.h"

#include <stdint.h>

typedef void Mdl_Skate;

Mdl_Skate *Mdl_Skate_Instance();
struct Obj_CSkater *Mdl_Skate_GetSkater(Mdl_Skate *this, uint32_t index);

#endif
