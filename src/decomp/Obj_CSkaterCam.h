#ifndef _OBJ_CSKATERCAM_H_
#define _OBJ_CSKATERCAM_H_

#include <stdint.h>

// Forward declarations
struct Obj_CSkater;

typedef struct Obj_CSkaterCam {
    uint8_t unk[0xc4];
    struct Obj_CSkater *skater; // 0xc4
} Obj_CSkaterCam;

void Obj_CSkaterCam_SetMode(Obj_CSkaterCam *this, uint32_t mode, float unk);
void Obj_CSkaterCam_SetSkater(Obj_CSkaterCam *this, struct Obj_CSkater *skater);
struct Obj_CSkater *Obj_CSkaterCam_GetSkater(Obj_CSkaterCam *this);
void Obj_CSkaterCam_EnableInputHandler(Obj_CSkaterCam *this, uint8_t unk);

#endif
