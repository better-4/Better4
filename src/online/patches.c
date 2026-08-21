#include "online/patches.h"

#include "online/client.h"
#include "online/peer.h"
#include "online/server.h"

#include <partymod-thps4/src/patch.h>

void patchGamespyCalls() {
	patchJmp((void*)0x00490610, (void*)GSDoWork);
	patchClientForeignPacketHandler();
    patchGamespyServerCalls();
}
