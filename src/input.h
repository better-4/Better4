#ifndef _INPUT_H_
#define _INPUT_H_

#include <qb.h>

int CFunc_SetSpinKeysControl(CStruct *params);
int CFunc_SetSpineTransferControl(CStruct *params);
int CFunc_SetPauseOnUnfocus(CStruct *params);

void patchSpinKeys();
void patchSpineTransfers();

#endif
