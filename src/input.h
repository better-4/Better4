#ifndef _INPUT_H_
#define _INPUT_H_

#define OFFSET_L1_HELD 0x810
#define OFFSET_L1_TRIGGER 0x820
#define OFFSET_R1_HELD 0x858
#define OFFSET_R1_TRIGGER 0x868
#define OFFSET_L2_HELD 0x834
#define OFFSET_L2_TRIGGER 0x844
#define OFFSET_R2_HELD 0x87c
#define OFFSET_R2_TRIGGER 0x88c

#define OFFSET_TRIANGLE_TRIGGER 0x8e8

#include "decomp/CStruct.h"

int __cdecl CFunc_SetSpinKeysControl(CStruct *params);
int __cdecl CFunc_SetSpineTransferControl(CStruct *params);
int __cdecl CFunc_SetPauseOnUnfocus(CStruct *params);

void patchSpinKeys();
void patchSpineTransfers();

#endif
