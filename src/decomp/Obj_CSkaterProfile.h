#ifndef _OBJ_CSKATERPROFILE_H_
#define _OBJ_CSKATERPROFILE_H_

#include "decomp/CStruct.h"

#include <stdint.h>

typedef struct Obj_CSkaterProfile {
    uint8_t unk[0x48]; // appearance somewhere in here
    CStruct info; // 0x48, custom.info struct in cas
} Obj_CSkaterProfile;

#endif
