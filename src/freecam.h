#ifndef _FREECAM_H_
#define _FREECAM_H_

#include "decomp/CStruct.h"

void patchFreecam();

int __cdecl CFunc_SetFreecamControls(CStruct *params);
int __cdecl CFunc_SetFreecamMoveSpeed(CStruct *params);
int __cdecl CFunc_SetFreecamLookSpeed(CStruct *params);

#endif
