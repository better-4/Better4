/*
GS natneg client 0.2
by Luigi Auriemma
e-mail: aluigi@autistici.org
web:    aluigi.org


INTRODUCTION
============
Gamespy natneg is a way used by Gamespy to allow the people behind router
and NAT (so those who can't receive direct connections from Internet) to
create public servers and at the same time allows clients to query and join
these servers.

The function in this code is very easy to use and can be implemented in a
trasparent way in any program for adding the client-side support to the
Gamespy natneg.

Note that the code looks very chaotic because I have thought to various
ways to implement it and so I have opted for a temporary solution that
can be improved in future if I need other features.


HOW TO USE
==========
Exists only one function to use and it's gsnatneg() which returns the
socket descriptor (> 0) in case of success or a negative value in case of
errors.
The negative number is the line of gsnatneg.c where happened the error in
negative notation, so -100 means the problem was located at line 100 of
this source code.

The following are the arguments of the function:
  sd        the UDP socket you have created in your client, this
            parameter is required since the master server will create
            a direct UDP connection between the port used by that
            socket and the server
            if s <= 0 the function will create a new socket
  gamename  the Gamespy name of the game, it's needed since the
            Gamespy master server needs to locate the IP of the
            server you want to contact in its big database, the full
            list of Gamespy gamenames is available here:
            http://aluigi.org/papers/gslist.cfg
            if it's NULL or has not string in it then the function
            will ask to insert the gamename at runtime (in console)
            update: you can use also some others gamenames other than
            the correct one probably because most of them run on the
            same master server, anyway it's better to use the correct
            gamename
  gamekey   needed only in server mode, set it to NULL
  host      the hostname or the IP address in text format of the
            server to contact (like "1.2.3.4" or "host.example.com")
            if unused set it to NULL
  ip        as above but it's directly the IP in the inet_addr format.
            if unused set it to INADDR_NONE for client or INADDR_ANY
            for server
  port      the port of the server to contact
            set to 0 if unused
  *peer     a sockaddr_in structure which will be filled with the
            correct port of the server, because due to the NAT
            negotiation the port with which will be made the
            communication may differ than the one displayed in the
            server list. if this parameter is NULL it will not be
            used.
            from version 0.1.3 you can pass the original peer
            structure you use in your program avoiding to specify
            host/ip and port separately
  callback  int myrecv(int sd, struct sockaddr_in *peer, uint8_t *buff, int len);
            set it to NULL

so for taking the server's IP the library will first check "host", then
"ip" and finally "peer" as last choice.


EXAMPLES
========
    int sd;
    sd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    if(gsnatneg(sd, "halor", NULL, "1.2.3.4", INADDR_NONE, 2302, &peer, NULL) < 0) exit(1);
    // or
    if(gsnatneg(sd, "halor", NULL, NULL, inet_addr("1.2.3.4"), 2302, &peer, NULL) < 0) exit(1);
    // or
    if(gsnatneg(sd, "halor", NULL, NULL, INADDR_NONE, 0, &peer, NULL) < 0) exit(1);

    // if you want you can also terminate and free the gsnatneg resources using:
    gsnatneg(-1, NULL, NULL, NULL 0, 0, NULL, NULL);


LICENSE
=======
    Copyright 2008-2012 Luigi Auriemma

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA

    http://www.gnu.org/licenses/gpl.txt
*/

#ifndef GSNATNEG_H
#define GSNATNEG_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <ctype.h>
#include <time.h>
#include "gsmsalg.h"

#ifdef WIN32
    #include <winsock.h>

    #ifndef close
        #define close   closesocket
    #endif
    #ifndef in_addr_t
        #define in_addr_t   uint32_t
    #endif
#else
    #include <unistd.h>
    #include <sys/socket.h>
    #include <sys/types.h>
    #include <arpa/inet.h>
    #include <netinet/in.h>
    #include <netdb.h>

    #ifndef stricmp
        #define stricmp strcasecmp
    #endif
#endif



#define GSNATNEG_BUFFSZ     0xffff
#define GSNATNEG_GOTOQUITX  { ret_err = -__LINE__; goto quit; }
#define GSNATNEG_CLOSESD(X) if(X > 0) { close(X);  X = -1; }
#define GSNATNEG_FREE(X)    if(X)     { free(X);   X = NULL; }
//#define GSNATNEG_THREAD_SAFE  // uhmmm



static int gsnatneg_verbose = 0;



static int gsnatneg_timeout(int sock, int secs) {
    struct  timeval tout;
    fd_set  fd_read;

    tout.tv_sec  = secs;
    tout.tv_usec = 0;
    FD_ZERO(&fd_read);
    FD_SET(sock, &fd_read);
    if(select(sock + 1, &fd_read, NULL, NULL, &tout)
      <= 0) return(-1);
    return(0);
}



static in_addr_t gsnatneg_resolv(uint8_t *host) {
    struct      hostent *hp;
    in_addr_t   host_ip;

    host_ip = inet_addr(host);
    if(host_ip == INADDR_NONE) {
        hp = gethostbyname(host);
        if(!hp) return(INADDR_NONE);
        host_ip = *(in_addr_t *)hp->h_addr;
    }
    return(host_ip);
}



static int gsnatneg_make_tcp(void) {
    static struct linger    ling = {1,1};
    int     sd;

    sd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if(sd < 0) return(-1);
    setsockopt(sd, SOL_SOCKET, SO_LINGER, (char *)&ling, sizeof(ling));
    return(sd);
}



static int gsnatneg_make_udp(void) {
    static struct linger    ling = {1,1};
    static int  on = 1;
    int     sd;

    sd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    if(sd < 0) return(-1);
    setsockopt(sd, SOL_SOCKET, SO_LINGER, (char *)&ling, sizeof(ling));
    setsockopt(sd, SOL_SOCKET, SO_BROADCAST, (char *)&on, sizeof(on));
    setsockopt(sd, SOL_SOCKET, SO_REUSEADDR, (char *)&on, sizeof(on));
    return(sd);
}



static in_addr_t gsnatneg_get_sock_ip_port(int sd, uint16_t *port, struct sockaddr_in *ret_peer, int remote) {
    struct sockaddr_in  peer;
    int     psz,
            ret;

    if(port) *port = 0;
    if(ret_peer) memset(ret_peer, 0, sizeof(struct sockaddr_in));
    psz = sizeof(struct sockaddr_in);
    if(remote) {
        ret = getpeername(sd, (struct sockaddr *)&peer, &psz);
    } else {
        ret = getsockname(sd, (struct sockaddr *)&peer, &psz);
    }
    if(ret < 0) return(INADDR_NONE);
    if(port) *port = ntohs(peer.sin_port);
    if(ret_peer) memcpy(ret_peer, &peer, sizeof(struct sockaddr_in));
    return(peer.sin_addr.s_addr);
}



static int gsnatneg_putrr(uint8_t *data, int len) {
    uint32_t     seed;
    int     i;

    seed = time(NULL);
    for(i = 0; i < len; i++) {
        seed = (seed * 0x343FD) + 0x269EC3;
        data[i] = (((seed >> 16) & 0x7fff) % 93) + 33;
    }
    data[i++] = 0;  // len must have +1 considered
    return(i);
}



static int gsnatneg_putxx(uint8_t *data, uint32_t num, int bits) {
    int     i,
            bytes;

    if(bits <= 4) bytes = bits;
    else          bytes = bits >> 3;
    for(i = 0; i < bytes; i++) {
        data[i] = num >> (i << 3);
    }
    return(bytes);
}



static int gsnatneg_getxx(uint8_t *data, uint32_t *ret, int bits) {
    uint32_t     num;
    int     i,
            bytes;

    if(bits <= 4) bytes = bits;
    else          bytes = bits >> 3;
    for(num = i = 0; i < bytes; i++) {
        num |= (data[i] << (i << 3));
    }
    if(ret) *ret = num;
    return(bytes);
}



static int gsnatneg_putss(uint8_t *buff, uint8_t *data) {
    int     len;

    len = strlen(data) + 1;
    memcpy(buff, data, len);
    return(len);
}



/*
static int gsnatneg_putmm(uint8_t *buff, uint8_t *data, int len) {
    if(len < 0) len = strlen(data) + 1;
    memcpy(buff, data, len);
    return(len);
}
*/



static int gsnatneg_putcc(uint8_t *buff, int chr, int len) {
    memset(buff, chr, len);
    return(len);
}



static int gsnatneg_putpv(uint8_t *buff, uint8_t *par, uint8_t *val) {
    uint8_t      *p;

    p = buff;
    p += gsnatneg_putss(p, par);
    p += gsnatneg_putss(p, val);
    return(p - buff);
}



static int gsnatneg_send(int sd, in_addr_t ip, uint16_t port, uint8_t *buff, int len) {
    struct  sockaddr_in peer;
    uint8_t      tmp[2];

    if(!buff) {
        peer.sin_addr.s_addr = ip;
        peer.sin_port        = htons(port);
        peer.sin_family      = AF_INET;

        if(gsnatneg_verbose) fprintf(stderr, "* TCP connection to %s:%u\n", inet_ntoa(peer.sin_addr), ntohs(peer.sin_port));
        if(connect(sd, (struct sockaddr *)&peer, sizeof(struct sockaddr_in))
          < 0) return(-1);
        return(0);
    }
    if(gsnatneg_verbose) {
        peer.sin_addr.s_addr = gsnatneg_get_sock_ip_port(sd, &peer.sin_port, NULL, 1);
        fprintf(stderr, "* TCP send %d bytes to %s:%u\n", len, inet_ntoa(peer.sin_addr), peer.sin_port);
    }
    gsnatneg_putxx(tmp, htons(2 + len), 16);
    if(send(sd, tmp,  2,   0) != 2)   return(-1);
    if(send(sd, buff, len, 0) != len) return(-1);
    return(0);
}



static int gsnatneg_sendto(int sd, in_addr_t ip, uint16_t port, uint8_t *buff, int len, struct sockaddr_in *use_peer) {
    static struct {
        int         sd;
        in_addr_t   ip;
        uint16_t         port;
        uint8_t          *buff;
        int         len;
        struct sockaddr_in *use_peer;
    } resend = {0, 0, 0, NULL, 0, NULL};

    struct  sockaddr_in tmp_peer,
                        *peer;
    int     resent;

    if((sd <= 0) && !buff && (len <= 0)) {
#ifdef GSNATNEG_THREAD_SAFE
        return(-1); // resend can't be used in a thread-safe environment
#endif
        sd       = resend.sd;
        ip       = resend.ip;
        port     = resend.port;
        buff     = resend.buff;
        len      = resend.len;
        use_peer = resend.use_peer;
        memset(&resend, 0, sizeof(resend));
        resent = 1;
    } else {
        resent = 0;
    }

    if(sd <= 0) return(-1);
    if(ip == INADDR_NONE) return(0);    // or -1?
    if(use_peer) {
        peer = use_peer;
    } else {
        peer = &tmp_peer;
        peer->sin_addr.s_addr = ip;
        peer->sin_port        = htons(port);
        peer->sin_family      = AF_INET;
    }
    if(peer->sin_addr.s_addr == INADDR_NONE) return(-1);
    if(!buff) {
        connect(sd, (struct sockaddr *)peer, sizeof(struct sockaddr_in));
        return(0);
    }
    if(gsnatneg_verbose) fprintf(stderr, "* UDP %ssend %d bytes to %s:%u\n", resent ? "re" : "", len, inet_ntoa(peer->sin_addr), ntohs(peer->sin_port));
    if(sendto(sd, buff, len, 0, (struct sockaddr *)peer, sizeof(struct sockaddr_in))
      != len) return(-1);

#ifndef GSNATNEG_THREAD_SAFE
    if(!resent) {
        resend.sd       = sd;
        resend.ip       = ip;
        resend.port     = port;
        resend.buff     = buff;
        resend.len      = len;
        resend.use_peer = use_peer;
    }
#endif
    return(0);
}



static int gsnatneg_tcprecv(int sd, uint8_t *buff, int buffsz) {
    int     t,
            len;

    len = buffsz;
    while(len) {
        if(gsnatneg_timeout(sd, 3) < 0) return(-1);
        t = recv(sd, buff, len, 0);
        if(t <= 0) return(-1);
        buff += t;
        len  -= t;
    }
    return(buffsz);
}



/*
static int gsnatneg_recv(int sd, uint8_t *buff, int buffsz) {
    struct sockaddr_in  peer;
    int     len;
    uint8_t      tmp[2];

    if(gsnatneg_tcprecv(sd, tmp, 2) < 0) return(-1);
    len = (tmp[0] << 8) | tmp[1];
    len -= 2;
    if(len < 0) return(-1);
    if(len > buffsz) return(-1);
    if(gsnatneg_tcprecv(sd, buff, len) < 0) return(-1);
    if(gsnatneg_verbose) {
        peer.sin_addr.s_addr = gsnatneg_get_sock_ip_port(sd, &peer.sin_port, NULL, 1);
        fprintf(stderr, "* TCP recv %d bytes from %s:%u\n", len, inet_ntoa(peer.sin_addr), ntohs(peer.sin_port));
    }
    return(len);
}
*/



static int gsnatneg_recvfrom(int sd, struct sockaddr_in *peer, uint8_t *buff, int size) {
    int     len,
            psz;

    //if(gsnatneg_timeout(sd, 2) < 0) return(-1);
    if(peer) {
        psz = sizeof(struct sockaddr_in);
        len = recvfrom(sd, buff, size, 0, (struct sockaddr *)peer, &psz);
    } else {
        len = recvfrom(sd, buff, size, 0, NULL, NULL);
    }
    if(len < 0) return(-1);
    if(gsnatneg_verbose) fprintf(stderr, "* UDP recv %d bytes from %s:%u\n", len, peer ? inet_ntoa(peer->sin_addr) : "unknown", peer ? ntohs(peer->sin_port) : 0);
    return(len);
}



static in_addr_t gsnatneg_gsresolv(uint8_t *gamename, int num) {
    in_addr_t   ip;
    uint32_t     i,
            c,
            server_num;
    int     len;
    uint8_t      tmp[256];

    server_num = 0;
    if(gamename && !gamename[0]) gamename = NULL;
    if(gamename) {
        for(i = 0; gamename[i]; i++) {
            c = tolower(gamename[i]);
            server_num = c - (server_num * 0x63306ce7);
        }
        server_num %= 20;
    }

    if(num > 0) {   // natneg
        if(gamename) len = snprintf(tmp, sizeof(tmp), "%s.natneg%d.gamespy.com", gamename, num);
        else         len = snprintf(tmp, sizeof(tmp), "natneg%d.gamespy.com", num);
    } else if(num < 0) {
        if(gamename) len = snprintf(tmp, sizeof(tmp), "%s.master.gamespy.com", gamename);
        else         len = snprintf(tmp, sizeof(tmp), "master.gamespy.com");
    } else {    // ms?
        if(gamename) len = snprintf(tmp, sizeof(tmp), "%s.ms%d.gamespy.com", gamename, server_num);
        else         len = snprintf(tmp, sizeof(tmp), "master.gamespy.com");
    }
    if((len < 0) || (len >= (int)sizeof(tmp))) return(INADDR_NONE);
    if(gsnatneg_verbose) fprintf(stderr, "* resolv %s", tmp);
    ip = gsnatneg_resolv(tmp);
    if(gsnatneg_verbose) fprintf(stderr, " --> %s\n", inet_ntoa(*(struct in_addr *)&ip));
    return(ip);
}



int gsnatneg(int sd, uint8_t *gamename, uint8_t *gamekey, uint8_t *host, in_addr_t ip, uint16_t port, struct sockaddr_in *ret_peer, int (*mycallback)()) {

#define GSNATNEG_MYCALLBACK \
            if(mycallback) { \
                if(mycallback(sd, &peer, buff, len) < 0) { \
                    mycallback = NULL; \
                    GSNATNEG_GOTOQUITX \
                } \
            }

#ifndef GSNATNEG_THREAD_SAFE
    static
#endif
    in_addr_t
            gsmsx       = INADDR_NONE,  // master
            gsmsh       = INADDR_NONE,  // hearbeat, almost the same of gsmsx
            gsnatneg1   = INADDR_NONE,  // natneg1
            gsnatneg2   = INADDR_NONE,  // natneg2
            myip        = INADDR_NONE;

#ifndef GSNATNEG_THREAD_SAFE
    static
#endif
    in_addr_t xip       = INADDR_NONE;

#ifndef GSNATNEG_THREAD_SAFE
    static
#endif
    uint32_t     seed        = 0,
            send_natneg = 0,
            max_timeout = 0;

#ifndef GSNATNEG_THREAD_SAFE
    static
#endif
    int     st          = -1,
            need_natneg = 0;

#ifndef GSNATNEG_THREAD_SAFE
    static
#endif
    uint16_t     myport      = 0,
            xport       = 0;

#ifndef GSNATNEG_THREAD_SAFE
    static
#endif
    uint8_t      gamenamex[128]  = "",
            gamekeyx[32]    = "",
            *buff_alloc     = NULL;

    struct sockaddr_in  peer;
    uint32_t     t;
    int     i,
            ok,
            len,
            ret_err     = -1,
            client      = -1,
            done        = 0,
            new_sock    = 0;
    uint8_t      tmp[64],
            pck[2],
            *buff       = NULL, // idea for implementing the own recvfrom
            type,
            *p;

    // free resources
    if(!gamename && !gamekey && !host && !ip && !port && !ret_peer) {
        GSNATNEG_FREE(buff_alloc)
        GSNATNEG_CLOSESD(sd)
        xip         = INADDR_NONE;
        myport      = 0;
        xport       = 0;
        send_natneg = 0;
        st          = -1;
        need_natneg = 0;
        new_sock    = 0;
        GSNATNEG_GOTOQUITX
    }

    if(sd <= 0) {
        sd = gsnatneg_make_udp();
        if(sd < 0) GSNATNEG_GOTOQUITX
        new_sock = sd;
    }
    if(host) {
        ip = gsnatneg_resolv(host);
    }
    if(ip == INADDR_NONE) {
        if(!ret_peer) GSNATNEG_GOTOQUITX
        ip = ret_peer->sin_addr.s_addr;
    }
    if(ip == INADDR_ANY) {
        client = 0;
    } else {
        client = 1;
    }
    if(!port) {
        if(!ret_peer) {
            if(client) GSNATNEG_GOTOQUITX
            gsnatneg_get_sock_ip_port(sd, &port, NULL, 0);
        } else {
            port = ntohs(ret_peer->sin_port);
        }
    }
    if(!client && (new_sock > 0)) {
        peer.sin_addr.s_addr = INADDR_ANY;
        peer.sin_port        = htons(port);
        peer.sin_family      = AF_INET;
        if(bind(sd, (struct sockaddr *)&peer, sizeof(struct sockaddr_in))
          < 0) GSNATNEG_GOTOQUITX
    }

    if(gsnatneg_verbose) {
        if(client) {
            fprintf(stderr, "* NAT negotiation client to %s:%u\n", inet_ntoa(*(struct in_addr *)&ip), port);
        } else {
            gsnatneg_get_sock_ip_port(sd, &port, NULL, 0);
            fprintf(stderr, "* NAT negotiation server on port %u\n", port);
        }
    }

    /*
    if(!gamename) {
        gamename             = "wiinat";
        if(!gamekey) gamekey = "4Fuy9m";
    }
    */
    if(client) {
        if(!gamename || !gamename[0]) {
            if(gamenamex[0]) {
                gamename = gamenamex;   // backup
            } else {
                printf(
                    "* Gamespy NAT negotiation *\n"
                    "* insert the Gamespy gamename of the game in use on the remote server:\n"
                    "  if you don't know it take a look here http://aluigi.org/papers/gslist.cfg\n"
                    "> ");
                fgets(tmp, sizeof(tmp), stdin);
                for(p = tmp; *p && (*p != '\r') && (*p != '\n'); p++);
                *p = 0;
                gamename = tmp;
            }
            if(!gamename[0]) GSNATNEG_GOTOQUITX
        }
    } else {
        if(!gamename || !gamename[0]) {
            if(gamenamex[0]) gamename = gamenamex;  // backup
            else GSNATNEG_GOTOQUITX            
        }
        if(!gamekey || !gamekey[0]) {
            if(!gamekeyx[0]) gamekey = gamekeyx;    // backup
            else GSNATNEG_GOTOQUITX            
        }
    }

    if(
        (!gamename || !gamename[0]) ||
        (gamename && (!gamenamex[0] || stricmp(gamename, gamenamex)))
    ) {
        gsmsx     = gsnatneg_gsresolv(gamename, 0);     // gamename.ms?.gamespy.com
        if(gsmsx     == INADDR_NONE) GSNATNEG_GOTOQUITX
        gsmsh     = gsnatneg_gsresolv(gamename, -1);    // gamename.master.gamespy.com
        if(gsmsh     == INADDR_NONE) GSNATNEG_GOTOQUITX
        gsnatneg1 = gsnatneg_gsresolv(gamename, 1);     // gamename.natneg1.gamespy.com
        if(gsnatneg1 == INADDR_NONE) GSNATNEG_GOTOQUITX
        gsnatneg2 = gsnatneg_gsresolv(gamename, 2);     // gamename.natneg2.gamespy.com
        if(gsnatneg2 == INADDR_NONE) GSNATNEG_GOTOQUITX
        if(gamename) strncpy(gamenamex, gamename, sizeof(gamenamex));
        else         gamenamex[0] = 0;
        gamenamex[sizeof(gamenamex) - 1] = 0;
    }

    if(!buff_alloc) {
        buff_alloc = malloc(GSNATNEG_BUFFSZ + 1);
        if(!buff_alloc) GSNATNEG_GOTOQUITX
    }
    buff = buff_alloc;

    if(need_natneg < 0) need_natneg = 0;
    /*if(!seed) must be different for each NAT request! */ seed = time(NULL);  // needed

redo:
    max_timeout = time(NULL) + 3;
    for(;;) {
        if((uint32_t)time(NULL) >= (uint32_t)send_natneg) {
            if(client) {
                st = gsnatneg_make_tcp();   // connect to gamename.ms?.gamespy.com
                if(st < 0) GSNATNEG_GOTOQUITX
                if(gsnatneg_send(st, gsmsx, 28910, NULL, 0) < 0) GSNATNEG_GOTOQUITX

                p = buff;
                p += gsnatneg_putxx(p, 0,           8);
                p += gsnatneg_putxx(p, 1,           8);
                p += gsnatneg_putxx(p, 3,           8);
                p += gsnatneg_putxx(p, 0,           32);
                p += gsnatneg_putss(p, gamename);
                p += gsnatneg_putss(p, gamename);
                p += gsnatneg_putrr(p, 8);
                p += gsnatneg_putss(p, ""); // parameters filter
                *p++ = 0;
                *p++ = 0;
                *p++ = 0;
                *p++ = 2;
                if(gsnatneg_send(st, 0, 0, buff, p - buff) < 0) GSNATNEG_GOTOQUITX
                // the reply of the server isn't really necessary
                if(!gsnatneg_timeout(st, 5)) {
                    len = gsnatneg_tcprecv(st, buff, 11);
                    if(len < 0) GSNATNEG_GOTOQUITX
                    if(!memcmp(buff, "Query Error", len)) {
                        while(len < GSNATNEG_BUFFSZ) {
                            if(recv(st, buff + len, 1, 0) <= 0) break; //GSNATNEG_GOTOQUITX
                            if(!buff[len]) break;
                            len++;
                        }
                        fprintf(stderr, "* %.*s\n", len, buff);
                        GSNATNEG_GOTOQUITX
                    }
                }
                p = buff;
                p += gsnatneg_putxx(p, 2,           8);
                p += gsnatneg_putxx(p, ip,          32);
                p += gsnatneg_putxx(p, htons(port), 16);
                p += gsnatneg_putxx(p, 0xfd,        8);
                p += gsnatneg_putxx(p, 0xfc,        8);
                p += gsnatneg_putxx(p, 0xb26a661e,  32);
                p += gsnatneg_putxx(p, seed,        32);
                if(gsnatneg_send(st, 0, 0, buff, p - buff) < 0) GSNATNEG_GOTOQUITX
                myip = gsnatneg_get_sock_ip_port(st, NULL, NULL, 0);    // sd will give error
                send_natneg = -1;   // never
                t = seed;
                goto contact_natneg;
            } else {
                p = buff;
                p += gsnatneg_putxx(p, 3,       8);
                p += gsnatneg_putxx(p, seed,    32);
                //p += gsnatneg_putpv(p, "localip0",  "127.0.0.1");
                //p += gsnatneg_putpv(p, "publicip0", "127.0.0.1");
                //sprintf(tmp, "%u", port);
                //p += gsnatneg_putpv(p, "localport", tmp);
                //p += gsnatneg_putpv(p, "publicport",tmp);
                p += gsnatneg_putpv(p, "natneg",    (!need_natneg) ? "0" : "1");
                p += gsnatneg_putpv(p, "gamename",  gamename);
                p += gsnatneg_putpv(p, "",          "");
                p += gsnatneg_putpv(p, "",          "");
                if(gsnatneg_sendto(sd, gsmsh, 27900, buff, p - buff, NULL) < 0) GSNATNEG_GOTOQUITX
                send_natneg = time(NULL) + 60;
            }
        }

        if(client && !mycallback) {
            if((uint32_t)time(NULL) >= (uint32_t)max_timeout) {
                if(gsnatneg_sendto(0, 0, 0, NULL, 0, NULL) < 0) {
                    if(done) break;
                    GSNATNEG_GOTOQUITX
                } else {
                    max_timeout = time(NULL) + 2;
                }
            }
        }
        if(gsnatneg_timeout(sd, 1) < 0) continue;
        len = gsnatneg_recvfrom(sd, &peer, buff, GSNATNEG_BUFFSZ);
        if(len < 0) GSNATNEG_GOTOQUITX
        if(client && !mycallback) {
            max_timeout = time(NULL) + 2;
        }
        if(len < 3) continue;

        p = buff;
        pck[0] = *p++;
        pck[1] = *p++;
        if((pck[0] == 0xfe) && (pck[1] == 0xfd)) {
            type = *p++;

            if(type == 0x01) {
                if(((p + 4) - buff) > len) continue;
                p += gsnatneg_getxx(p, &t, 32);
                if(t != seed) continue;
                len -= (p - buff);  // len = strlen(p);
                if(len < 0) continue;
                len = ((len * 4) / 3) + 3;
                if(len > (int)sizeof(tmp)) continue;
                p[len] = 0;
                if(!gamekey) GSNATNEG_GOTOQUITX
                gsseckey(tmp, p, gamekey, 0);

                p = buff;
                p += gsnatneg_putxx(p, 1,       8);
                p += gsnatneg_putxx(p, seed,    32);
                p += gsnatneg_putss(p, tmp);
                if(gsnatneg_sendto(sd, 0, 0, buff, p - buff, &peer) < 0) GSNATNEG_GOTOQUITX

            } else if(type == 0x02) {
                p = buff;   // "GameSpy Firewall Probe Packet"
                for(i = 2; i < len; i++) {
                    *p++ = buff[i];
                }
                if(gsnatneg_sendto(sd, 0, 0, buff, p - buff, &peer) < 0) GSNATNEG_GOTOQUITX

            } else if(type == 0x04) {
                need_natneg++;  // GameSpy tells us that it received no reply so we are behing NAT
                if(need_natneg > 1) GSNATNEG_GOTOQUITX
                send_natneg = time(NULL);

            } else if(type == 0x0a) {
                if(((p + 4) - buff) > len) continue;
                gsnatneg_getxx(p, &t,    32);

                p = buff;
                p += gsnatneg_putxx(p, 8,    8);
                p += gsnatneg_putxx(p, t,    32);
                if(gsnatneg_sendto(sd, 0, 0, buff, p - buff, &peer) < 0) GSNATNEG_GOTOQUITX

            } else if(type == 0x06) {
                if((17 + 4) > len) continue;
                gsnatneg_getxx(buff + 17, &t, 32);

                p = buff;   // "GameSpy Firewall Probe Packet"
                for(i = 0; i < 9; i++) {
                    *p++ = buff[2 + i];
                }
                buff[0] = 0x07;
                if(gsnatneg_sendto(sd, 0, 0, buff, p - buff, &peer) < 0) GSNATNEG_GOTOQUITX

                contact_natneg:

                // probably not needed but it's for compatibility with the protocol
                if(myip == INADDR_NONE) {
                    myip = gsnatneg_get_sock_ip_port(sd, NULL, NULL, 0);
                    //if((myip == INADDR_NONE) || (myip == INADDR_ANY)) myip = inet_addr("127.0.0.1");
                }

                p = buff;
                p += gsnatneg_putxx(p, 0xfd,            8);
                p += gsnatneg_putxx(p, 0xfc,            8);
                p += gsnatneg_putxx(p, 0xb26a661e,      32);
                p += gsnatneg_putxx(p, 2,               8);     // natneg version
                p += gsnatneg_putxx(p, 0,               8);     // step, buff[12]
                p += gsnatneg_putxx(p, t,               32);    // id for tracking the reply
                p += gsnatneg_putxx(p, 0,               8);     // natneg number, buff[12]
                p += gsnatneg_putxx(p, client ? 0 : 1,  8);     // ???
                p += gsnatneg_putxx(p, 1,               8);     // ???
                p += gsnatneg_putxx(p, myip,            32);    // client's IP
                p += gsnatneg_putxx(p, 0,               16);    // client's port, buff + 19
                p += gsnatneg_putss(p, gamename);

                buff[12] = 0;
                if(gsnatneg_sendto(sd, gsnatneg1, 27901, buff, p - buff, NULL) < 0) GSNATNEG_GOTOQUITX

                buff[12] = 1;
                if(gsnatneg_sendto(sd, gsnatneg1, 27901, buff, p - buff, NULL) < 0) GSNATNEG_GOTOQUITX

                buff[12] = 2;
                gsnatneg_get_sock_ip_port(sd, &myport, NULL, 0);
                gsnatneg_putxx(buff + 19, htons(myport), 16);
                if(gsnatneg_sendto(sd, gsnatneg2, 27901, buff, p - buff, NULL) < 0) GSNATNEG_GOTOQUITX

            } else {
                if(gsnatneg_verbose) fprintf(stderr, "* fefd unknown type %02x\n", type);
                GSNATNEG_MYCALLBACK
            }

        } else if((pck[0] == 0xfd) && (pck[1] == 0xfc)) {
            if(((p + 4 + 1 + 1) - buff) > len) continue;
            p += gsnatneg_getxx(p, &t,   32);    // 0xb26a661e
            p++;
            type = *p++; 
            if(type == 0x01) {
                // ignore

            } else if((type == 0x05) || (type == 0x07)) {
                if(len < 18) continue;
                ok = 0;
                if(type == 0x05) {
                    if(len < 18) continue;
                    gsnatneg_getxx(buff + 12, &t, 32);
                    xip   = t;
                    gsnatneg_getxx(buff + 16, &t, 16);
                    xport = ntohs(t);
                    if(gsnatneg_verbose) fprintf(stderr, "* %s:%u\n", inet_ntoa(*(struct in_addr *)&xip), xport);
                    if(!client) {
                        ip   = xip;
                        port = xport;
                    }

                    buff[7] = 0x06;
                    p = buff;
                    p += 12;
                    // data built by recvfrom?
                    p += gsnatneg_putcc(p, 0, 9);
                    buff[13] = client ? 0 : 1;
                    if(gsnatneg_sendto(sd, 0, 0, buff, p - buff, &peer) < 0) GSNATNEG_GOTOQUITX

                    ok = 1;
                    t = 0;
                    peer.sin_addr.s_addr = ip;
                    peer.sin_port        = htons(port);

                } else {
                    if((peer.sin_addr.s_addr == ip)  && (peer.sin_port == htons(port))) {
                        ok = 1;
                    } else if((peer.sin_addr.s_addr == xip) && (peer.sin_port == htons(xport))) {
                        // NAT
                        ok = 2;
                    } else {
                        // for hosts behind our same NAT
                        ok = 3;
                    }
                    if(ok) {
                        if(client) {
                            if(buff[19]) break;
                        }
                        t = buff[18];
                        if(client) t++;
                    }
                }
                if(ok) {
                    if((peer.sin_addr.s_addr == ip)  && (peer.sin_port == htons(port))) done = 1;

                    p = buff;
                    p += gsnatneg_putxx(p, 0xfd,        8);
                    p += gsnatneg_putxx(p, 0xfc,        8);
                    p += gsnatneg_putxx(p, 0xb26a661e,  32);
                    p += gsnatneg_putxx(p, 2,           8); // client ? 2 : 3
                    p += gsnatneg_putxx(p, 7,           8);
                    p += gsnatneg_putxx(p, seed,        32);
                    p += gsnatneg_putxx(p, peer.sin_addr.s_addr, 32);
                    p += gsnatneg_putxx(p, peer.sin_port, 16);
                    p += gsnatneg_putxx(p, t,           8);
                    if(client) {
                        t = 0;
                    } else {
                        if(t && (peer.sin_addr.s_addr == ip)  && (peer.sin_port == htons(port))) t = 1;
                        else t = 0;
                    }
                    p += gsnatneg_putxx(p, t, 8);
                    if(gsnatneg_sendto(sd, 0, 0, buff, p - buff, &peer) < 0) GSNATNEG_GOTOQUITX
                    if(buff[19]) break;
                }

            } else {
                if(gsnatneg_verbose) fprintf(stderr, "* fdfc unknown type %02x\n", type);
                GSNATNEG_MYCALLBACK
            }
        } else {
            GSNATNEG_MYCALLBACK
        }
    }

    ret_err = sd;
quit:
    if(mycallback) goto redo;
    GSNATNEG_CLOSESD(st)
#ifdef GSNATNEG_THREAD_SAFE
    GSNATNEG_FREE(buff_alloc)
#endif
    send_natneg = 0;
    return(ret_err);
}

#endif
