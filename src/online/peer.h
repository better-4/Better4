#ifndef _ONLINE_PEER_H_
#define _ONLINE_PEER_H_

#include "decomp/CStruct.h"
#include "online/common.h"

#include <UniSpySDK/Peer/peer.h>

#include <stdint.h>

PEER gs_peer;
uint8_t gs_nat_negotiating;
uint8_t gs_server_ready;
uint8_t gs_game_playing;

void foreign_packet_handler(uint8_t *packet, int len, struct sockaddr *sender);
void gs_peer_initialize();
void gs_peer_shutdown();

void __stdcall GSDoWork();

#endif
