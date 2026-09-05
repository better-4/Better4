#ifndef _DECOMP_CFEELER_H_
#define _DECOMP_CFEELER_H_

#include "decomp/Mth_Vector.h"

#include <stdint.h>

typedef struct CFeeler {
    uint8_t unk[0x8c];
    Mth_Vector normal; // 0x8c
} CFeeler;

#endif
