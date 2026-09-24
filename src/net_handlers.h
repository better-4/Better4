#ifndef _NET_HANDLERS_H_
#define _NET_HANDLERS_H_

#include "decomp/CStruct.h"

void patchNetHandlers();

int __cdecl CFunc_B4PingClient(CStruct* params);
int __cdecl CFunc_B4PingServer(CStruct* params);

#endif
