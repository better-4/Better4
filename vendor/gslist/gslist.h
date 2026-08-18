/*

======
Gslist
======

INTRODUCTION
------------
Gslist is a game servers browser and heartbeats sender, it supports an
incredible amount of games and moreover a lot of options making it
simple and complete at the same time.
Then it is opensource and can be compiled on any system with small
changes (if needed).

All this software is based on the FREE and OFFICIAL PUBLIC data
available online just by the same Gamespy on their PUBLIC servers.


CONTRIBUTORS
------------
- Steve Hartland:  filters (cool) and FREEBSD compatibility
- Cimuca Cristian: bug reports and ideas
- Ludwig Nussel:   gslist user's directory (very useful in Unix), quiet
                   option and other tips
- Ben "LordNikon": web interface optimizations
- Kris Sum:        suggestions for the web interface
- KaZaMa:          many suggestions for the web interface
- ouioui:          many feedback about errors in the experimental SQL implementation
- CHC:             peerchat rooms and other suggestions
- all the others that I don't remember due to my limited memory 8-)


LICENSE
-------
    Copyright 2004-2014 Luigi Auriemma

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

    http://www.gnu.org/licenses/gpl-2.0.txt

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <time.h>
#include <errno.h>
#include <stdarg.h>
#include <stdint.h>
#include <ctype.h>
// #include <GeoIP.h>

#ifdef WIN32
    #include <winsock.h>
    #include <windows.h>
    #include <direct.h>
    #include <io.h>
    #include "winerr.h"

    #define close       closesocket
    #define stristr     strstr
    #define sleep       Sleep
    #define usleep      sleep
    #define ftruncate   chsize
    #define in_addr_t   u32
    #define ONESEC      1000
    #define TEMPOZ1
    #define TEMPOZ2     GetTickCount()
    #define APPDATA     "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders"
    #define PATH_SLASH  '\\'
#else
    #include <unistd.h>
    #include <sys/socket.h>
    #include <sys/types.h>
    #include <sys/param.h>
    #include <arpa/inet.h>
    #include <netinet/in.h>
    #include <netdb.h>
    #include <sys/times.h>
    #include <sys/timeb.h>
    #include <pthread.h>

    #define ONESEC      1
    #define stristr     strcasestr
    #define stricmp     strcasecmp
    #define strnicmp    strncasecmp
    #define TEMPOZ1     ftime(&timex)
    #define TEMPOZ2     ((timex.time * 1000) + timex.millitm)
    #define PATH_SLASH  '/'
#endif

typedef int8_t      i8;
typedef uint8_t     u8;
typedef uint16_t    u16;
typedef uint32_t    u32;



#define VER             "0.8.11a"
static const u8         MS[]            = "master.openspy.net";
static const u8         MSGAMENAME[]    = "gamespy2\\gamever\\20603020";
static const u8         MSGAMEKEY[]     = "d4kZca";
static const u8         MSGAMENAMEX[]   = "gslive";
static const u8         MSGAMEKEYX[]    = "Xn221z";
#define MSXPORT         28910
#define MSPORT          28900
#define HBPORT          27900
#define GSWPORT         28903
#define BUFFSZ          8192
#define QUERYSZ         BUFFSZ
#define SECURESZ        66
#define VALIDATESZ      ((SECURESZ / 6) * 8)
#define GSHB1           "\\heartbeat\\%hu" \
                        "\\gamename\\%s"
#define GSHB2a          "\\validate\\%s" \
                        "\\final\\"
#define GSHB2b          "\\gamename\\%s" \
                        "\\final\\"
#define PCK             "\\gamename\\%s" \
                        "\\enctype\\%d" \
                        "\\validate\\%s" \
                        "\\final\\" \
                        "\\list\\cmp" \
                        "\\gamename\\%s" \
                        "%s%s"
#define HOST            "motd.openspy.com"
#define ALUIGIHOST      "aluigi.org"
#define GETSZ           2048
#define GSUSERAGENT     "OpenSpyHTTP/1.0"
#define TIMEOUT         3
#define HBMINUTES       300  // 300 seconds = 5 minutes
#define FILEOUT         "gslist-out.gsl"
#define GSLISTCFG       "gslist.cfg"
#define GSLISTTMP       "gslist.tmp"
#define FULLCFG         "full.cfg"
#define KNOWNCFG        "knownsvc.cfg"
#define GSHKEYSCFG      "gshkeys.txt"
#define DETECTCFG       "detection.cfg"
#define OLDGSINFO       "\\status\\"
#define ENCTYPEX_QUERY_GSLIST   "\\hostname\\mapname\\gametype\\gamemode\\numplayers\\maxplayers\\gamever\\password\\sv_punkbuster\\pb\\punkbuster\\hostport\\ranked\\dedicated\\timelimit\\fraglimit\\gamevariant"
#define MAXNAMESREQ     60
#define GSLISTSZ        80
#define FULLSZ          2048
#define DETECTSZ        300
#define KNOWNSZ         64
#define CFNAMEOFF       0
#define CNAMEOFF        54
#define CKEYOFF         73
#define CFNAMELEN       ((CNAMEOFF - CFNAMEOFF) - 1)
#define CNAMELEN        ((CKEYOFF - CNAMEOFF) - 1)
#define CFNAMEEND       (CFNAMEOFF + CFNAMELEN)
#define CNAMEEND        (CNAMEOFF + CNAMELEN)
#define GSTITLE         "\n" \
                        "Gslist "VER"\n" \
                        "by Luigi Auriemma\n" \
                        "e-mail: aluigi@autistici.org\n" \
                        "web:    aluigi.org\n" \
                        "\n"
#define GSLISTVER       "GSLISTVER: "
#define GSLISTHOME      "http://aluigi.org/papers.htm#gslist"
#define GSMAXPATH       1024    //256, not too big (for the stack) or too small

#define GSW_SORT_PING       0
#define GSW_SORT_NAME       1
#define GSW_SORT_MAP        2
#define GSW_SORT_TYPE       3
#define GSW_SORT_PLAYER     4
#define GSW_SORT_VER        5
#define GSW_SORT_MOD        6
#define GSW_SORT_DED        7
#define GSW_SORT_PWD        8
#define GSW_SORT_PB         9
#define GSW_SORT_RANK       10
#define GSW_SORT_MODE       11
#define GSW_SORT_COUNTRY    12

#define ARGHELP         !argv[i] || !strcmp(argv[i], "?") || !stricmp(argv[i], "help")
#define ARGHELP1        !argv[i] || !argv[i + 1] || !strcmp(argv[i + 1], "?") || !stricmp(argv[i + 1], "help")
#define CHECKARG        if(!argv[i]) { \
                            fprintf(stderr, "\n" \
                                "Error: you missed to pass the parameter to the option\n" \
                                "\n"); \
                            exit(1); \
                        }
#define set_custom_multi_query(X) \
                if((argv[i][0] >= '0') && (argv[i][0] <= '9')) { \
                    X = atoi(argv[i]); \
                } else { \
                    X = -2; /* for differing it than megaquery */ \
                    multi_query_custom_binary = argv[i]; \
                    multi_query_custom_binary_size = cstring(multi_query_custom_binary, multi_query_custom_binary, -1, NULL); \
                    fprintf(stderr, "- hex dump of the packet to sent:\n\n"); \
                    fprintf(stderr, "\n"); \
                }

#ifdef WIN32
    #define quick_thread(NAME, ARG) DWORD WINAPI NAME(ARG)
    #define thread_id   HANDLE
#else
    #define quick_thread(NAME, ARG) void *NAME(ARG)
    #define thread_id   pthread_t
#endif

thread_id quick_threadx(void *func, void *data) {
    thread_id   tid;
#ifdef WIN32
    DWORD   tmp;

    tid = CreateThread(NULL, 0, func, data, 0, &tmp);
    if(!tid) return(0);
#else
    if(pthread_create(&tid, NULL, func, data)) return(0);
#endif
    return(tid);
}

void quick_threadz(thread_id tid) {
#ifdef WIN32
    DWORD   ret;

    for(;;) {
        GetExitCodeThread(tid, &ret);
        if(!ret) break;
        sleep(100);
    }
#else
    pthread_join(tid, NULL);
#endif
}



void lame_room_visualization(u8 *buff);
void prepare_query(u8 *gamestr, int query, u8 *ip, u8 *port);
u8 *gslist_input_list(u8 *fdlist, int *len, u8 *buff, int *dynsz);



#pragma pack(1)             // save tons of memory

typedef struct {
    in_addr_t   ip;
    u16     port;
} ipport_t;

typedef struct {
    in_addr_t   ip;     // 0.0.0.0
    u16     port;
    u16     qport;
    u8      *name;      // string
    u8      *map;       // string
    u8      *type;      // string
    u8      players;    // 0-255
    u8      max;        // 0-255
    u8      *ver;       // string
    u8      *mod;       // string
    u8      *mode;      // string
    u8      ded;        // 0-255
    u8      pwd;        // 0-255
    u8      pb;         // 0-255
    u8      rank;       // 0-255
    u8      *country;
    u8      sort;       // 0 = clear, 1 = reply, 2 = sorted
    #define IPDATA_SORT_CLEAR   0
    #define IPDATA_SORT_REPLY   1
    #define IPDATA_SORT_SORTED  2
    u32     ping;
} ipdata_t;

typedef struct {
    u8      nt;         // 0 or 1
    u8      chr;        // the delimiter
    u8      front;      // where the data begins?
    u8      rear;       // where the data ends?
    u16     maxping;
    int     sock;       // scan only
    int     pos;        // scan only
    int     (*func)(u8 *, int, void *gqd);  // GSLIST_QUERY_T(*func);      // scan only
    u8      scantype;   // scan only, 1 for gsweb and single queries
    #define QUERY_SCANTYPE_SINGLE   0
    #define QUERY_SCANTYPE_GSWEB    1
    u8      *data;      // scan only, if 0
    ipdata_t    *ipdata;    // scan only, if 1
    u8      type;       // query number
    struct sockaddr_in  *peer;
    ipport_t    *ipport;    // work-around for ping
    int     iplen;      // work-around for ping
    u32     *ping;
    u8      *done;
} generic_query_data_t;

typedef struct {
    u8      *game;      /* gamename */
    u8      *key;       /* gamekey */
    u8      *full;      /* full game description */
    u8      *path;      /* executable path */
    u8      *filter;    /* filter */
    u8      query;      /* type of query */
} gsw_data_t;

typedef struct {
    u8      *game;      /* gamename */
    u8      *pass;
    in_addr_t   ip;
    u16     port;
} gsw_fav_data_t;

typedef struct {
    u8      *full;
    u8      *game;
    u8      *exe;
} gsw_scan_data_t;

struct {
    u8      *game;
    u8      *buff;
    int     len;
} gsw_refresh;

#pragma pack()



// GeoIP   *geoipx         = NULL;
FILE    *fdout          = NULL;             // for the -o option
in_addr_t msip          = INADDR_NONE;
int     megaquery       = -1,
        scandelay       = 5,
        no_reping       = 0,
        ignore_errors   = 0,
        sql             = 0,
        quiet           = 1,
        myenctype       = -1,   // 0, 1 and 2 or -1 for the X type
        force_natneg    = 0,
        enctypex_type   = 1,
        multi_query_custom_binary_size = 0;
u16     msport          = MSPORT;           // do N OT touch
u8      *mshost         = (u8 *)MS,         // do N OT touch
        *msgamename     = (u8 *)MSGAMENAME, // do N OT touch
        *msgamekey      = (u8 *)MSGAMEKEY,  // do N OT touch
        *mymshost       = NULL,
        gslist_path[GSMAXPATH + 1] = "",
        *sql_host       = NULL,
        *sql_database   = NULL,
        *sql_username   = NULL,
        *sql_password   = NULL,
        *sql_query      = NULL,
        *sql_queryb     = NULL,
        *sql_queryl     = NULL,
        *enctypex_query = NULL,
        *multi_query_custom_binary = NULL;



#include "gsnatneg.h"
// #include "gsmsalg.h"            // the old magician
// extern u8 *enctype1_decoder(u8 *, u8 *, int *); // for enctype1 decoding
// extern u8 *enctype2_decoder(u8 *, u8 *, int *); // for enctype2 decoding

#include "countries.h"          // list of countries
#include "enctypex_decoder.h"   // the magic enctypeX
#include "gsmyfunc.h"           // mystrcpy, mywebcpy and so on
#include "gslegacy.h"           // mostly gsweb related
#include "gsshow.h"             // help, output, format and so on
#include "multi_query.h"        // scanning and queries

int gslist(char *gamestr, char *query, char servers[128][1024], uint32_t *num_servers) {
    enctypex_query = query;
    enctypex_data_t enctypex_data;
    struct  sockaddr_in peer;
    ipport_t    *ipport,
                *ipbuffer;
    int     sd,
            len,
            i,
            execlen          = 0,
            hbmethod         = 0,
            dynsz,
            itsok            = 0,
            iwannaloop       = 0,
            mini_query_type  = 0;
    u16     heartbeat_port   = 0;
    u8      *buff            = NULL,
            validate[VALIDATESZ + 1],
            secure[SECURESZ + 1],
            outtype          = 0,
            *tmpexec         = NULL,
            *execstring      = NULL,
            *execstring_ip   = NULL,
            *execstring_port = NULL,
            *filter          = "",
            *execptr         = NULL,
            *multigamename   = NULL,
            *multigamenamep  = NULL,
            *ipc             = NULL,
            *fname           = NULL,
            *fdlist          = NULL,
            *mini_query_host = NULL,
            *mini_query_port = NULL,
            enctypex_info[QUERYSZ];

#ifdef WIN32
    WSADATA wsadata;
    WSAStartup(MAKEWORD(1,0), &wsadata);
#endif

    setbuf(stdin,  NULL);
    setbuf(stdout, NULL);
    setbuf(stderr, NULL);

    if(!quiet) fprintf(stderr, GSTITLE);

    fdout = stdout;
    *gslist_path = 0;

#ifndef WIN32
    scandelay *= 1000;
#endif

    if(mini_query_host) {
        prepare_query(gamestr, mini_query_type, mini_query_host, mini_query_port);
        return(0);
    }

    dnsdb(NULL);    // initialize the dns cache database

    if(!enctypex_query[0] || !strcmp(enctypex_query, "\\") || !strcmp(enctypex_query, "\\\\")) {
        enctypex_query = ENCTYPEX_QUERY_GSLIST;
    }

    if(!gamestr) {
        fprintf(stderr, "\n"
            "Error: The game is not available or has not been specified.\n"
            "       Use -n to specify a gamename\n"
            "\n");
        exit(1);
    }

    gslist_step_1(gamestr, filter);

    peer.sin_addr.s_addr = msip;
    peer.sin_port        = htons(msport);
    peer.sin_family      = AF_INET;

    buff = malloc(BUFFSZ + 1);
    if(!buff) std_err();
    dynsz = BUFFSZ;

    if(hbmethod) {
        gslist_heartbeat(buff, gamestr, validate, hbmethod, heartbeat_port, &peer);
        return(0);
    }

    multigamename = gamestr;

get_list:
    if(fdlist) {
        buff = gslist_input_list(fdlist, &len, buff, &dynsz);
        ipport = (ipport_t *)buff;
        ipbuffer = ipport;
        goto handle_servers;
    }

    multigamenamep = strchr(gamestr, ',');
    if(multigamenamep) *multigamenamep = 0;
    if(!quiet) fprintf(stderr, "Gamename:    %s\n", gamestr);

    sd = gslist_step_2(&peer, buff, secure, gamestr, validate, filter, &enctypex_data);
    if(sd < 0) std_err();

    switch(outtype) {
        case 0: break;
        case 1:
        case 3: spr(&fname, "%s.gsl", gamestr); break;
        case 2:
        case 4: spr(&fname, "%s",     FILEOUT); break;
        case 5:
        case 6: fdout = stdout;                 break;
        default: break;
    }

    if(fname) {
        if(!quiet) fprintf(stderr, "- output file: %s\n", fname);
        fdout = fopen(fname, "wb");
        if(!fdout) std_err();
        FREEX(fname);
    }

    ipport = gslist_step_3(sd, validate, &enctypex_data, &len, &buff, &dynsz);

    if(outtype == 6) {
        fprintf(stderr, "\n\n");
        fputc('\n', stderr);
        //goto gslist_exit;
        outtype = 0;
    }

    itsok = gslist_step_4(secure, buff, &enctypex_data, &ipport, &len);
    ipbuffer = ipport;

handle_servers:
    *num_servers = 0;
    while(len >= 6) {
        ipc = myinetntoa(ipport->ip);

        if(!enctypex_query[0]) {    // avoids double displaying when -X is in use
            switch(outtype) {
                case 0: fprintf(fdout, "%15s   %hu\n", ipc, ntohs(ipport->port));   break;
                case 5:
                case 1:
                case 2: fprintf(fdout, "%s:%hu\n", ipc, ntohs(ipport->port));   break;
                case 3:
                case 4: fwrite((u8 *)ipport, 6, 1, fdout);  break;
                default: break;
            }
        }

        if(execstring) {
            execptr = tmpexec + execlen;
            if(execstring_ip && !execstring_port) {
                execptr += sprintf(execptr, "%s", ipc);
                strcpy(execptr, execstring_ip + 3);

            } else if(execstring_port && !execstring_ip) {
                execptr += sprintf(execptr, "%hu", ntohs(ipport->port));
                strcpy(execptr, execstring_port + 5);

            } else if(execstring_ip < execstring_port) {
                execptr += sprintf(execptr, "%s", ipc);
                execptr += sprintf(execptr, "%s", execstring_ip + 3);
                execptr += sprintf(execptr, "%hu", ntohs(ipport->port));
                strcpy(execptr, execstring_port + 5);

            } else if(execstring_port < execstring_ip) {
                execptr += sprintf(execptr, "%hu", ntohs(ipport->port));
                execptr += sprintf(execptr, "%s", execstring_port + 5);
                execptr += sprintf(execptr, "%s", ipc);
                strcpy(execptr, execstring_ip + 3);
            }

            fprintf(stderr, "   Execute: \"%s\"\n", tmpexec);
            system(tmpexec);
        }

        *num_servers = *num_servers + 1;
        ipport++;
        len -= 6;
    }

    if(!quiet && itsok) fprintf(stderr, "\n%u servers found\n\n", *num_servers);
    // fprintf(stderr, "\n%u servers found\n\n", *num_servers);

    if((myenctype < 0) && ipport && enctypex_query[0]) {
        *num_servers = 0;
        for(len = 0;;) {
            len = enctypex_decoder_convert_to_ipport(buff + enctypex_data.start, enctypex_data.offset - enctypex_data.start, NULL, enctypex_info, sizeof(enctypex_info), len);
            if(len <= 0) break;
            if(enctypex_type == 0x20) {
                lame_room_visualization(enctypex_info);
                continue;
            }
            char *server = servers[*num_servers];
            sprintf(server, "%s", enctypex_info);
            *num_servers = *num_servers + 1;
        }
    }

    if((megaquery >= 0) || ((megaquery == -2) && multi_query_custom_binary)) {
        fprintf(stderr, "- querying servers:\n");
        mega_query_scan(gamestr, megaquery, ipbuffer, *num_servers, 2);   // 3 is the default timeout
    }

    fflush(fdout);
    if(outtype) fclose(fdout);
        // -o filename will be closed when the program is terminated

    if(multigamenamep) {
        *multigamenamep = ',';
        gamestr = multigamenamep + 1;
        if(myenctype < 0) {   // needed here because each game uses a different hostname (from gslist_step_1)
            mshost = enctypex_msname(gamestr, NULL);
            msport = MSXPORT;
            if(!quiet) fprintf(stderr, "- resolve additional master server %s\n", mshost);
            msip = dnsdb(mshost);
            peer.sin_addr.s_addr = msip;
            peer.sin_port        = htons(msport);
        }
        goto get_list;
    } else {
        gamestr = multigamename;
    }

    if(iwannaloop) {
        for(i = 0; i < iwannaloop; i++) {
            sleep(ONESEC);
        }
        goto get_list;
    }

//gslist_exit:
    FREEX(tmpexec);
    FREEX(buff);
    return(0);
}


void lame_room_visualization(u8 *buff) {
    int     n1,
            n2,
            n3,
            n4;
    u8      *p,
            *r;

    p = strchr(buff, ' ');
    if(!p) return;
    sscanf(buff, "%d.%d.%d.%d", &n1, &n2, &n3, &n4);
    r = strstr(p, "\\hostname\\");
    if(r) {
        r += 10;
    } else {
        r = p;
    }
    fprintf(fdout, "#GPG!%-5d %s\n", (n1 << 24) | (n2 << 16) | (n3 << 8) | n4, r);
}



void prepare_query(u8 *gamestr, int query, u8 *ip, u8 *port) {
    u8      *p = NULL;

    if(!ip || (!(p = strchr(ip, ':')) && !port)) {
        fprintf(stderr, "\n"
            "Error: you must insert an host and a query port\n"
            "\n");
        exit(1);
    }
    if(p) {
        *p++ = 0;
    } else {
        p = port;
    }
    multi_query(gamestr, query, resolv(ip), atoi(p));
    fputc('\n', stderr);
}


u8 *gslist_input_list(u8 *fdlist, int *len, u8 *buff, int *dynsz) {
    ipport_t    *ipport;
    FILE    *fd;
    int     i;
    u8      tmp[QUERYSZ],
            *ip,
            *p;

    fprintf(stderr, "- open file %s\n", fdlist);
    fd = fopen(fdlist, "rb");
    if(!fd) std_err();

    for(i = 0; fgets(tmp, sizeof(tmp), fd); i++);   // pre-alloc
    *len = i * 6;
    if(*len > *dynsz) {
        *dynsz = *len;
        buff = realloc(buff, *dynsz);
        if(!buff) std_err();
    }
    ipport = (ipport_t *)buff;

    rewind(fd);
    for(i = 0; fgets(tmp, sizeof(tmp), fd);) {
        for(p = tmp; *p && ((*p == ' ') || (*p == '\t') || (*p == ':')); p++);
        ip = p;
        for(; *p && ((*p != ' ') && (*p != '\t') && (*p != ':')); p++);
        *p++ = 0;
        if(ip[0] <= ' ') continue;  // includes also !ip[0]
        ipport[i].ip = resolv(ip);
        for(; *p && ((*p == ' ') || (*p == '\t') || (*p == ':')); p++);
        ipport[i].port = htons(atoi(p));
        i++;
    }
    *len = i * 6;   // no need realloc since it's smaller than dynsz

    fclose(fd);
    return(buff);
}


