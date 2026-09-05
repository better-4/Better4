#ifndef _WALLPUSH_H_
#define _WALLPUSH_H_

#include "decomp/CStruct.h"

int __cdecl CFunc_SetWallpushEnabled(CStruct *params);
int __cdecl CFunc_CancelWallpush(CStruct *params);

void patchWallpush();

#endif
