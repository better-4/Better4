#ifndef _ONLINE_CLIENT_H_
#define _ONLINE_CLIENT_H_

#include "decomp/CStruct.h"

int __cdecl CFunc_StartNatNegotiation(CStruct *params);
int __cdecl CFunc_CancelNatNegotiation(CStruct *params);

void patchClientForeignPacketHandler();

#endif
