#ifndef _INPUT_H_
#define _INPUT_H_

#include <qb.h>

int __cdecl CFunc_SetSpinKeysControl(CStruct *params);
int __cdecl CFunc_SetSpineTransferControl(CStruct *params);
int __cdecl CFunc_SetPauseOnUnfocus(CStruct *params);

void patchSpinKeys();
void patchSpineTransfers();

#endif
