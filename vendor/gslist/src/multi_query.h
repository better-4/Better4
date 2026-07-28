/*
    Copyright 2005-2011 Luigi Auriemma

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

#define QUAKE3_QUERY    "\xff\xff\xff\xff" "getstatus xxx\n"
#define QUAKE3_QUERY2   "\xff\xff\xff\xff" "getinfo xxx\n"
#define MOH_QUERY       "\xff\xff\xff\xff" "\x02" "getstatus xxx\n"
#define QUAKE2_QUERY    "\xff\xff\xff\xff" "status"
#define HALFLIFE_QUERY  "\xff\xff\xff\xff" "infostring\n\0"
#define DPLAY8_QUERY    "\x00\x02"          /* info/join */     \
                        "\xff\xff"          /* ID tracker */    \
                        "\x02"              /* 01 = need GUID, 02 = no GUID */
#define DOOM3_QUERY     "\xff\xff" "getInfo\0" "\0\0\0\0"
#define ASE_QUERY       "s"
#define GS1_QUERY       "\\status\\"
#define GS1_QUERY2      "\\info\\"
#define GS2_QUERY       "\xfe\xfd\x00" "\x00\x00\x00\x00"                    "\xff\x00\x00" "\x00"  // 1 for split?
#define GS3_QUERY       "\xfe\xfd\x09" "\x00\x00\x00\x00"
#define GS3_QUERYX      "\xfe\xfd\x00" "\x00\x00\x00\x00" "\x00\x00\x00\x00" "\xff\x00\x00" "\x00"  // 1 for split?
#define GS3_QUERYX_PL   "\xfe\xfd\x00" "\x00\x00\x00\x00" "\x00\x00\x00\x00" "\x00\xff\xff" "\x00"  // 1 for split?
#define SOURCE_QUERY    "\xff\xff\xff\xff" "T" "Source Engine Query\0"
#define TRIBES2_QUERY   "\x12\x02\x01\x02\x03\x04"

#define GSLIST_QUERY_T(X)       int (X)(u8 *data, int len, generic_query_data_t *gqd)
#define GSLIST_QUERY_PAR_T(X)   int (X)(u8 *data, int skip)
#define GSLIST_QUERY_VAL_T(X)   int (X)(u8 *data, int ipbit, ipdata_t *ipdata)



/*
stdout for any information
fdout only for the megaquery scanning
*/



void init_geoip(void) {
    struct  stat    xstat;
    u8      *geoip_dat;

    if(!geoipx) {
        geoip_dat = gslfopen(GEOIPDAT, NULL);
        if((stat(gslfopen(GEOIPDAT, NULL), &xstat) < 0) || ((time(NULL) - xstat.st_mtime) > GEOIPUPDTIME)) {
            cool_download(GEOIPDAT,           GEOIPHOST,  80,    GEOIPURI);
            printf("\n---\n");
        }
        geoipx = GeoIP_open(geoip_dat, GEOIP_MEMORY_CACHE);
        FREEX(geoip_dat);
    }
}



void show_unicode(u8 *data, u32 size) {
    u8      *limit = data + size;

    while(*data && (data < limit)) {
        fputc(*data, stdout);
        data += 2;
    }
    fputc('\n', stdout);
}



GSLIST_QUERY_PAR_T(handle_query_par) {
    u8      *p;

    p = strchr(data, '_');
    if(p) data = p + 1;     /* "sv_" and "si_" */

#define K(x)  !stricmp(data, x)
    if(!(skip & 2) && (
        K("hostname")   || K("name"))) {
        return(1);

    } else if(!(skip & 4) && (
        K("mapname")    || K("map"))) {
        return(2);

    } else if(!(skip & 8) && (
        K("gametype")   || K("gametypeLocal"))) {
        return(3);

    } else if(!(skip & 16) && (
        K("numplayers") || K("clients")  || K("privateClients"))) {
        return(4);

    } else if(!(skip & 32) && (
        K("maxplayers") || K("maxclients"))) {
        return(5);

    } else if(!(skip & 64) && (
        K("gamever")    || K("version")  || K("protocol"))) {
        return(6);

    } else if(!(skip & 128) && (
        K("password")   || K("needpass") || K("usepass")  || K("passworden") || K("pwd") || K("pswrd")  || K("pw"))) {
        return(7);

    } else if(!(skip & 256) && (
        K("dedicated")  || K("type")     || K("ded")      || K("dedic")      || K("serverDedicated"))) {
        return(8);

    } else if(!(skip & 512) && (
        K("hostport"))) {
        return(9);

    } else if(!(skip & 1024) && (
        K("game")       || K("gamedir")  || K("modname")  || K("mods")       || K("mod"))) {
        return(10);

    } else if(!(skip & 2048) && (
        K("pb")         || K("punkbuster"))) {
        return(11);

    } else if(!(skip & 4096) && (
        K("gamemode"))) {
        return(12);

    } else if(!(skip & 8192) && (
        K("ranked")     || K("rated"))) {
        return(13);
    }

#undef K
    return(0);
}



GSLIST_QUERY_VAL_T(handle_query_val) {
    int     ret = 0;

    if(!*data) return(-1);
    switch(ipbit) {
        case  1:             ipdata->name    = mychrdup(data);      break;
        case  2:             ipdata->map     = mychrdup(data);      break;
        case  3:             ipdata->type    = mychrdup(data);      break;
        case  4: if(data[0]) ipdata->players = atoi(data);          break;
        case  5: if(data[0]) ipdata->max     = atoi(data);          break;
        case  6:             ipdata->ver     = mychrdup(data);      break;
        case  7: if(data[0]) ipdata->pwd     = *data;               break;
        case  8: if(data[0]) ipdata->ded     = *data;               break;
        case  9: if(data[0]) ipdata->port    = htons(atoi(data));   break;
        case 10:             ipdata->mod     = mychrdup(data);      break;
        case 11: if(data[0]) ipdata->pb      = *data;               break;
        case 12:             ipdata->mode    = mychrdup(data);      break;
        case 13: if(data[0]) ipdata->rank    = *data;               break;
        default: ret = -1; break;
    }
    return(ret);
}



GSLIST_QUERY_PAR_T(print_query_par) {
    printf("%28s ", data);
    return(0);
}



GSLIST_QUERY_VAL_T(print_query_val) {
    printf("%s\n", data);
    return(0);
}



GSLIST_QUERY_T(generic_query) {
    GSLIST_QUERY_PAR_T(*par);   /* the usage of function pointers */
    GSLIST_QUERY_VAL_T(*val);   /* avoids to use many if() */
    static const u8     empty_par[] = "";
    ipdata_t    *ipdata;
    u32     chall;
    int     ipbit   = 0,
            skip    = 0,
            nt,
            datalen = 0,
            first   = 0,
            pars    = 0,
            parn;
    u8      minime[32],
            *next,
            *tmp,
            *extra_data,
            *limit,
            *next_backup,
            *parz[8];

    if((gqd->type == 11) && (len < 20)) {   // Gamespy 3
        chall = atoi(data + 5);
        memcpy(minime, GS3_QUERYX, sizeof(GS3_QUERYX) - 1);
        minime[7]  = chall >> 24;
        minime[8]  = chall >> 16;
        minime[9]  = chall >>  8;
        minime[10] = chall;
        sendto(gqd->sock, minime, sizeof(GS3_QUERYX) - 1, 0, (struct sockaddr *)gqd->peer, sizeof(struct sockaddr_in));
        return(-1);
    }
    if((gqd->type == 14) && (len < 20)) {   // Gamespy 3 players
        chall = atoi(data + 5);
        memcpy(minime, GS3_QUERYX_PL, sizeof(GS3_QUERYX_PL) - 1);
        minime[7]  = chall >> 24;
        minime[8]  = chall >> 16;
        minime[9]  = chall >>  8;
        minime[10] = chall;
        sendto(gqd->sock, minime, sizeof(GS3_QUERYX_PL) - 1, 0, (struct sockaddr *)gqd->peer, sizeof(struct sockaddr_in));
        return(-1);
    }

    limit  = data + len - gqd->rear;
    *limit = 0;
    data   += gqd->front;
    nt     = gqd->nt;

    if(gqd->ipdata) {
        ipdata = &gqd->ipdata[gqd->pos];
        par    = handle_query_par;
        val    = handle_query_val;
    } else {
        ipdata = NULL;
        par    = print_query_par;
        val    = print_query_val;
    }

    if(gqd->scantype == QUERY_SCANTYPE_SINGLE) {    // \par\value\par\value\...
        datalen = strlen(gqd->data);
        first   = 1;        // lame compatibility fix
    }

    if(gqd->type == 14) {
        for(next = data; (data < limit) && next; data = next + 1) {
            next = strchr(data, gqd->chr);
            if(next) *next = 0;
            if(!data[0]) break;
            if(pars < 8) parz[pars] = data;
            pars++;
        }
    }

    parn = 0;
    extra_data = NULL;
    for(next = data; (data < limit) && next; data = next + 1, nt++) {
        next_backup = next;
        next = strchr(data, gqd->chr);
        if(next) *next = 0;

        if(pars > 0) {
            if(!(nt & 1)) {
                if(parn >= pars) {
                    parn = 0;
                    if(gqd->scantype != QUERY_SCANTYPE_SINGLE) printf("\n"); //printf("%28s\n", ".");
                }
                // gqd->data is allocated with par&val, so we can't use it
                data = empty_par;
                if(gqd->scantype != QUERY_SCANTYPE_SINGLE) {
                    if(parn < 8) data = parz[parn];
                }
                next = next_backup;
                parn++;
            }
        }

                /* work-around for Quake games with players at end, only for -Q */
        if(gqd->ipdata) {
            if(nt & 1) {
                if(skip && (gqd->chr != '\n')) {
                    for(tmp = data; *tmp; tmp++) {
                        if(*tmp != '\n') continue;
                        *tmp = 0;
                        next = limit;
                        break;
                    }
                }
            } else {
                skip |= (1 << ipbit);
            }
        }

        if(gqd->scantype == QUERY_SCANTYPE_SINGLE) {
            if(first) {
                first = 0;
                if(strchr(data, '\n') || !*data) continue;
            }
            if(nt & 1) {
                if(!extra_data) {
                    extra_data = strchr(data, '\n');
                    if(extra_data) {
                        *extra_data++ = 0;
                        if(!*extra_data) extra_data = NULL;
                    }
                } else {
                    tmp = strchr(data, '\n');
                    if(tmp) *tmp = 0;   // don't handle other '\n'
                }
            } else {
                if((!*data && (data != empty_par)) || !strcmp(data, "queryid") || !strcmp(data, "final")) break;
            }
            enctypex_data_cleaner(data, data, -1); // format
            datalen += sprintf(gqd->data + datalen, "\\%s", data);
            if(extra_data) {
                data = extra_data;
                for(tmp = data; *tmp; tmp++) {
                    if(*tmp == '/') *tmp = '|';     // avoids the / delimiter used here to delimit players
                    if(*tmp == '\n') *tmp = '/';
                }
                enctypex_data_cleaner(data, data, -1); // format
                datalen += sprintf(gqd->data + datalen, "\\extra_data\\%s", data);
                // leave extra_data declared to avoid overflows caused by multiple '\n'
            }
            continue;
        }

        if(nt & 1) {
            val(data, ipbit, ipdata);
            ipbit = 0;
        } else {
            if((!*data && (data != empty_par)) || !strcmp(data, "queryid") || !strcmp(data, "final")) break;
            ipbit = par(data, skip);
            skip |= (1 << ipbit);
        }
    }

    if(gqd->ipdata) {
        init_geoip();
        if(geoipx) {
            ipdata->country = (void *)GeoIP_country_code_by_addr(geoipx, myinetntoa(ipdata->ip));
        }
    }

    return(0);
}



GSLIST_QUERY_T(source_query) {
    ipdata_t   *ipdata;

    data += 5;
    if(gqd->ipdata) {
        ipdata = &gqd->ipdata[gqd->pos];

        data += strlen(data) + 1;
        ipdata->name    = mychrdup(data);               data += strlen(data) + 1;
        ipdata->map     = mychrdup(data);               data += strlen(data) + 1;
        ipdata->mod     = mychrdup(data);               data += strlen(data) + 1;
        ipdata->type    = mychrdup(data);               data += strlen(data) + 1;
        ipdata->players = *data++;
        ipdata->max     = *data++;
        ipdata->ver     = malloc(6);
        sprintf(ipdata->ver, "%hu", *data++);
        ipdata->ded     = (*data++ == 'd') ? '1' : '0';
        data++;
        ipdata->pwd     = *data;

    } else {
        printf("%28s %s\n",        "Address",          data);   data += strlen(data) + 1;
        printf("%28s %s\n",        "Hostname",         data);   data += strlen(data) + 1;
        printf("%28s %s\n",        "Map",              data);   data += strlen(data) + 1;
        printf("%28s %s\n",        "Mod",              data);   data += strlen(data) + 1;
        printf("%28s %s\n",        "Description",      data);   data += strlen(data) + 1;
        printf("%28s %u/%u\n",     "Players",          data[0], data[1]);  data += 2;
        printf("%28s %u\n",        "Version",          *data++);
        printf("%28s %c\n",        "Server type",      *data++);
        printf("%28s %c\n",        "Server OS",        *data++);
        printf("%28s %u\n",        "Password",         *data++);
        printf("%28s %u\n",        "Secure server",    *data);
    }
    return(0);
}



GSLIST_QUERY_T(tribes2_query) {
    ipdata_t    *ipdata;
    int     sz,
            tmp;

#define TRIBES2STR(x)   sz = *data++;   \
                        tmp = data[sz]; \
                        data[sz] = 0;   \
                        x;              \
                        data += sz;     \
                        *data = tmp;

    data += 6;
    if(gqd->ipdata) {
        ipdata = &gqd->ipdata[gqd->pos];

        TRIBES2STR((ipdata->mod  = mychrdup(data)));
        TRIBES2STR((ipdata->type = mychrdup(data)));
        TRIBES2STR((ipdata->map  = mychrdup(data)));
        data++;
        ipdata->players = *data++;
        ipdata->max     = *data++;

    } else {
        TRIBES2STR(printf("%28s %s\n", "Mod",       data));
        TRIBES2STR(printf("%28s %s\n", "Game type", data));
        TRIBES2STR(printf("%28s %s\n", "Map",       data));
        data++;
        printf("%28s %u/%u\n",     "Players", data[0], data[1]);   data += 2;
        printf("%28s %u\n",        "Bots",    *data);              data++;
        printf("%28s %hu\n",       "CPU",     *(int16_t *)data);     data += 2;
        TRIBES2STR(printf("%28s %s\n", "Info",      data));
    }
#undef TRIBES2STR
    return(0);
}



GSLIST_QUERY_T(dplay8info) {
    struct myguid {
        u32     g1;
        u16     g2;
        u16     g3;
        u8      g4;
        u8      g5;
        u8      g6;
        u8      g7;
        u8      g8;
        u8      g9;
        u8      g10;
        u8      g11;
    };
    struct dplay8_t {
        u32     pcklen;
        u32     reservedlen;
        u32     flags;
        u32     session;
        u32     max_players;
        u32     players;
        u32     fulldatalen;
        u32     desclen;
        u32     dunno1;
        u32     dunno2;
        u32     dunno3;
        u32     dunno4;
        u32     datalen;
        u32     appreservedlen;
        struct  myguid  instance_guid;
        struct  myguid  application_guid;
    } *dplay8;

    if(len < (sizeof(struct dplay8_t) + 4)) {
        printf("\nError: the packet received seems invalid\n");
        return(0);
    }

    dplay8 = (struct dplay8_t *)(data + 4);

    if(dplay8->session) {
        fputs("\nSession options:     ", stdout);
        if(dplay8->session & 1)   fputs("client-server ", stdout);
        if(dplay8->session & 4)   fputs("migrate_host ", stdout);
        if(dplay8->session & 64)  fputs("no_DPN_server ", stdout);
        if(dplay8->session & 128) fputs("password ", stdout);
    }

    printf("\n"
        "Max players          %u\n"
        "Current players      %u\n",
        dplay8->max_players,
        dplay8->players);

    printf("\n"
        "Instance GUID        %08x-%04hx-%04hx-%02x%02x-%02x%02x%02x%02x%02x%02x",
        dplay8->instance_guid.g1,
        dplay8->instance_guid.g2,
        dplay8->instance_guid.g3,
        dplay8->instance_guid.g4,
        dplay8->instance_guid.g5,
        dplay8->instance_guid.g6,
        dplay8->instance_guid.g7,
        dplay8->instance_guid.g8,
        dplay8->instance_guid.g9,
        dplay8->instance_guid.g10,
        dplay8->instance_guid.g11);

    printf("\n"
        "Application GUID     %08x-%04hx-%04hx-%02x%02x-%02x%02x%02x%02x%02x%02x\n",
        dplay8->application_guid.g1,
        dplay8->application_guid.g2,
        dplay8->application_guid.g3,
        dplay8->application_guid.g4,
        dplay8->application_guid.g5,
        dplay8->application_guid.g6,
        dplay8->application_guid.g7,
        dplay8->application_guid.g8,
        dplay8->application_guid.g9,
        dplay8->application_guid.g10,
        dplay8->application_guid.g11);

        // removed any security check here

    fputs("\nGame description/Session name:\n\n  ", stdout);
    show_unicode(
        data + 4 + dplay8->fulldatalen,
        len - dplay8->fulldatalen);

    if(dplay8->appreservedlen) {
        printf("\nHexdump of the APPLICATION RESERVED data (%u) sent by the server:\n\n",
            dplay8->appreservedlen);
        show_dump(
            data + 4 + dplay8->datalen,
            dplay8->appreservedlen,
            stdout);
    }

    if(dplay8->reservedlen) {
        printf("\nHexdump of the RESERVED data (%u) sent by the server:\n\n",
            dplay8->reservedlen);
        show_dump(
            data + 4 + dplay8->fulldatalen + dplay8->desclen,
            dplay8->reservedlen,
            stdout);
    }

    return(0);
}



GSLIST_QUERY_T(ase_query) {
    int     num = 0;
    u8      *limit;

    if(memcmp(data, "EYE1", 4)) {
        fwrite(data + 1, len - 1, 1, stdout);
        fputc('\n', stdout);
        return(0);
    }
    limit = data + len;
    data += 4;

    while((data < limit) && (*data > 1)) {
        switch(num) {
            case 0: printf("\n%28s ", "Running game"); break;
            case 1: printf("\n%28s ", "Game port");    break;
            case 2: printf("\n%28s ", "Server name");  break;
            case 3: printf("\n%28s ", "Battle mode");  break;
            case 4: printf("\n%28s ", "Map name");     break;
            case 5: printf("\n%28s ", "Version");      break;
            case 6: printf("\n%28s ", "Password");     break;
            case 7: printf("\n%28s ", "Players");      break;
            case 8: printf("\n%28s ", "Max players");  break;
            default: {
                if(num & 1) fputc('\n', stdout);
                } break;
        }
        fwrite(data + 1, *data - 1, 1, stdout);
        data += *data;
        num++;
    }

    fputc('\n', stdout);
    num = limit - data;
    if(num > 1) {
        fputs("\nHex dump of the rest of the packet:\n", stdout);
        show_dump(data, num, stdout);
    }
    return(0);
}



u8 *switch_type_query(int type, int *querylen, generic_query_data_t *gqd, GSLIST_QUERY_T(**func), int info) {
    u8      *query,
            *msg;

    if(gqd) memset(gqd, 0, sizeof(generic_query_data_t));

#define ASSIGN(t,x,y,n,c,f,r,z) {                           \
            msg   = x;                                      \
            query = y;                                      \
            if(querylen) *querylen  = sizeof(y) - 1;        \
            if(gqd) {                                       \
                memset(gqd, 0, sizeof(generic_query_data_t)); \
                gqd->type  = t;                             \
                gqd->nt    = n;                             \
                gqd->chr   = c;                             \
                gqd->front = f;                             \
                gqd->rear  = r;                             \
            }                                               \
            if(func) *func = z;                             \
        }

    switch(type) {
        case  0: ASSIGN(type, "Gamespy \\status\\", GS1_QUERY,      1, '\\',  0, 0, generic_query)  break;
        case  1: ASSIGN(type, "Quake 3 engine",     QUAKE3_QUERY,   1, '\\',  4, 0, generic_query)  break;
        case  2: ASSIGN(type, "Medal of Honor",     MOH_QUERY,      1, '\\',  5, 0, generic_query)  break;
        case  3: ASSIGN(type, "Quake 2 engine",     QUAKE2_QUERY,   1, '\\',  4, 0, generic_query)  break;
        case  4: ASSIGN(type, "Half-Life",          HALFLIFE_QUERY, 1, '\\', 23, 0, generic_query)  break;
        case  5: ASSIGN(type, "DirectPlay 8",       DPLAY8_QUERY,   0, '\0',  0, 0, dplay8info)     break;
        case  6: ASSIGN(type, "Doom 3 engine",      DOOM3_QUERY,    0, '\0', 23, 8, generic_query)  break;
        case  7: ASSIGN(type, "All-seeing-eye",     ASE_QUERY,      0, '\0',  0, 0, ase_query)      break;
        case  8: ASSIGN(type, "Gamespy 2",          GS2_QUERY,      0, '\0',  5, 0, generic_query)  break;
        case  9: ASSIGN(type, "Source",             SOURCE_QUERY,   0, '\0',  0, 0, source_query)   break;
        case 10: ASSIGN(type, "Tribes 2",           TRIBES2_QUERY,  0, '\0',  0, 0, tribes2_query)  break;
        case 11: ASSIGN(type, "Gamespy 3",          GS3_QUERY,      0, '\0',  5, 0, generic_query)  break;
        case 12: ASSIGN(type, "Gamespy \\info\\",   GS1_QUERY2,     1, '\\',  0, 0, generic_query)  break;
        case 13: ASSIGN(type, "Quake 3 getinfo",    QUAKE3_QUERY2,  1, '\\',  4, 0, generic_query)  break;
        case 14: ASSIGN(type, "Gamespy 3 players",  GS3_QUERY,      0, '\0',  7, 3, generic_query)  break;
        case -1:    // -1 or -2 in case I change the value of the custom query
        case -2: {
                 ASSIGN(0,  "custom binary",  "",             1, '\\',  0, 0, generic_query)
            query = multi_query_custom_binary;
            if(querylen) *querylen = multi_query_custom_binary_size;
            break;
        }
        default: return(NULL);  break;
    }
#undef ASSIGN

    switch(info) {
        case 1: fprintf(stderr, "- query type: %s\n", msg); break;  /* details */
        case 2: printf(" %2d %-22s", type, msg);            break;  /* list */
        case 3: return(msg);                                break;  /* type */
    }
    return(query);
}



    /* this is the code called when you use the -i, -I or -d option */
void multi_query(u8 *gamestr, int type, in_addr_t ip, u16 port) {
    GSLIST_QUERY_T(*func);
    generic_query_data_t  gqd;
    struct  sockaddr_in peer;
    int     sd,
            len,
            ret,
            querylen;
    u8      buff[QUERYSZ],
            *query;

    query = switch_type_query(type, &querylen, &gqd, (void *)&func, 1);
    if(!query) return;

    peer.sin_addr.s_addr = ip;
    peer.sin_port        = htons(port);
    peer.sin_family      = AF_INET;

    fprintf(stderr, "- target   %s : %hu\n",
        inet_ntoa(peer.sin_addr), ntohs(peer.sin_port));

    sd = udpsocket();

    gqd.sock     = sd;
    gqd.func     = (void *)func;
    gqd.peer     = &peer;

    if(force_natneg) {
        if(!gamestr) {
            fputs("\n"
                "Error: you must specify a gamename when you force the Gamespy NAT negotiation\n"
                "\n", stderr);
            exit(1);
        }
        printf("- activate Gamespy nat negotiation using gamename %s\n", gamestr);
        if(gsnatneg(sd, gamestr, NULL, NULL, INADDR_NONE, 0, &peer, NULL) < 0) {
            fputs("\n"
                "Error: the game is not using the Gamespy NAT negotiation\n"
                "\n", stderr);
            exit(1);
        }
    }
    sendto(sd, query, querylen, 0, (struct sockaddr *)&peer, sizeof(struct sockaddr_in));
    if(timeout(sd, TIMEOUT) < 0) {
        fputs("\n"
            "Error: Socket timeout, no reply received\n"
            "\n", stderr);
        exit(1);
    }

    do {
        ret = -1;
        len = recvfrom(sd, buff, sizeof(buff) - 1, 0, NULL, NULL);
        if(len > 0) {
            gqd.scantype = QUERY_SCANTYPE_GSWEB;
            gqd.data     = malloc(len + 1);
            gqd.data[0]  = 0;
            gqd.ipdata   = NULL;
            ret = (*func)(buff, len, &gqd);
            FREEX(gqd.data);
        }
        if((ret >= 0) && no_reping) break;
    } while(!timeout(sd, TIMEOUT));
    close(sd);
    if(force_natneg) gsnatneg(-1, NULL, NULL, NULL, 0, 0, NULL, NULL);
}



    /* receives all the replies from the servers */
quick_thread(multi_scan_reply, generic_query_data_t *gqd) {
    struct  sockaddr_in peer;
#ifdef WIN32
#else
    struct  timeb   timex;
#endif
    int     sd,
            i,
            len,
            psz;
    u16     ping;
    u8      buff[QUERYSZ],
            *ipaddr,
            *tmp;

    sd     = gqd->sock;
    psz    = sizeof(struct sockaddr_in);
    ipaddr = NULL;

    while(!timeout(sd, gqd->maxping)) {
        len = recvfrom(sd, buff, sizeof(buff) - 1, 0, (struct sockaddr *)&peer, &psz);
        if(len < 0) continue;

        ping = -1;
        if(gqd->scantype == QUERY_SCANTYPE_SINGLE) {
                // country\IT\ping\65535
            gqd->data = malloc(25 + len + 1 + 100);     // 15 IP + 1 + 5 port + 1 + len + added_data
            ipaddr = inet_ntoa(peer.sin_addr);
            sprintf(gqd->data, "%s:%hu ", ipaddr, ntohs(peer.sin_port));
            gqd->pos = 0;

            for(i = 0; i < gqd->iplen; i++) {
                if((gqd->ipport[i].ip == peer.sin_addr.s_addr) && (gqd->ipport[i].port == peer.sin_port)) {
                    break;
                }
            }
            if(i >= gqd->iplen) continue;
            TEMPOZ1;
            ping = TEMPOZ2 - gqd->ping[i];
            gqd->done[i] = 1;

        } else {
            for(i = 0; gqd->ipdata[i].ip; i++) {
                if((gqd->ipdata[i].ip == peer.sin_addr.s_addr) && (gqd->ipdata[i].port == peer.sin_port)) {
                    break;
                }
            }
            if(!gqd->ipdata[i].ip) continue;

            if(gqd->ipdata[i].sort == IPDATA_SORT_CLEAR) {
                TEMPOZ1;
                ping = TEMPOZ2;
                gqd->ipdata[i].ping = TEMPOZ2 - gqd->ipdata[i].ping;
                gqd->ipdata[i].sort = IPDATA_SORT_REPLY;
                ping                = gqd->ipdata[i].ping;
            }

            gqd->pos  = i;
        }

        gqd->sock = sd;
        gqd->peer = &peer;
        if((*gqd->func)(buff, len, gqd) < 0) continue;

        if(gqd->scantype == QUERY_SCANTYPE_SINGLE) {
            init_geoip();

            if(geoipx) {
                tmp = gqd->data + strlen(gqd->data);
                sprintf(
                    tmp,
                    "%scountry\\%s",
                    (tmp[-1] == '\\') ? "" : "\\",
                    GeoIP_country_code_by_addr(geoipx, ipaddr));
            }
            tmp = gqd->data + strlen(gqd->data);
            sprintf(
                tmp,
                "%sping\\%u",
                (tmp[-1] == '\\') ? "" : "\\",
                ping);

            if(sql) {
#ifdef SQL
                gssql(gqd->data);
#endif
            } else {
                fprintf(fdout, "%s\n", gqd->data);
            }
            FREEX(gqd->data);
        }
    }

    if(gqd->scantype == QUERY_SCANTYPE_SINGLE) {
    } else {
        for(i = 0; gqd->ipdata[i].ip; i++) {
            if(gqd->ipdata[i].sort != IPDATA_SORT_REPLY) gqd->ipdata[i].ping = -1;
        }
    }

    return(0);
}



    /* this function is used by gsweb consider it legacy! */
int multi_scan(u8 *gamestr, int type, void *ipbuff, int iplen, ipdata_t *gip, u32 ping) {
    GSLIST_QUERY_T(*func);
    thread_id   tid;
    ipport_t    *ipport;
    generic_query_data_t  gqd;
    struct  sockaddr_in peer;
    int     sd,
            servers,
            querylen;
    u8      *query;

#ifdef WIN32
#else
    struct  timeb   timex;
#endif

    ipport = (ipport_t *)ipbuff;
    if(!ping) goto no_ping;

    memset(&gqd, 0, sizeof(generic_query_data_t));
    query = switch_type_query(type, &querylen, &gqd, (void *)&func, 0);

    sd = udpsocket();

    gqd.sock     = sd;
    gqd.maxping  = ping;
    gqd.ipdata   = gip;
    gqd.func     = (void *)func;
    gqd.scantype = QUERY_SCANTYPE_GSWEB;
    gqd.peer     = &peer;
    gqd.iplen    = iplen;
    peer.sin_family = AF_INET;

    tid = 0;
    for(servers = 0; servers < iplen; servers++) {
        peer.sin_addr.s_addr = gip[servers].ip   = ipport[servers].ip;
        peer.sin_port        = gip[servers].port = gip[servers].qport = ipport[servers].port;

        TEMPOZ1;
        gip[servers].ping = TEMPOZ2;
        gip[servers].sort = IPDATA_SORT_CLEAR;

        if(!tid) tid = quick_threadx(multi_scan_reply, &gqd);
        sendto(sd, query, querylen, 0, (struct sockaddr *)&peer, sizeof(struct sockaddr_in));
        usleep(scandelay);
    }
    if(tid) quick_threadz(tid);

    tid = 0;
    for(servers = 0; servers < iplen; servers++) {    // REPING without gsnatneg
        if(gip[servers].sort != IPDATA_SORT_CLEAR) continue;
        peer.sin_addr.s_addr = gip[servers].ip   = ipport[servers].ip;
        peer.sin_port        = gip[servers].port = gip[servers].qport = ipport[servers].port;

        TEMPOZ1;
        gip[servers].ping = TEMPOZ2;

        if(!tid) tid = quick_threadx(multi_scan_reply, &gqd);
        sendto(sd, query, querylen, 0, (struct sockaddr *)&peer, sizeof(struct sockaddr_in));
        usleep(scandelay);
    }
    if(tid) quick_threadz(tid);

    if(force_natneg && ((type == 0) || (type == 8) || (type == 11))) {
        tid = 0;
        for(servers = 0; servers < iplen; servers++) {    // REPING with gsnatneg
            if(gip[servers].sort != IPDATA_SORT_CLEAR) continue;
            peer.sin_addr.s_addr = gip[servers].ip   = ipport[servers].ip;
            peer.sin_port        = gip[servers].port = gip[servers].qport = ipport[servers].port;

            TEMPOZ1;
            gip[servers].ping = TEMPOZ2;
            if(gsnatneg(sd, gamestr, NULL, NULL, INADDR_NONE, 0, &peer, NULL) < 0) continue;

            if(!tid) tid = quick_threadx(multi_scan_reply, &gqd);
            sendto(sd, query, querylen, 0, (struct sockaddr *)&peer, sizeof(struct sockaddr_in));
            usleep(scandelay);
        }
        if(tid) quick_threadz(tid);
    }

    close(sd);
    return(servers);

no_ping:
    for(servers = 0; servers < iplen; servers++) {
        gip[servers].ip   = ipport[servers].ip;
        gip[servers].port = gip[servers].qport = ipport[servers].port;
        gip[servers].sort = IPDATA_SORT_REPLY;
    }
    return(servers);
}



    /* sends query packets to all the hosts we have received (ipbuff) */
int mega_query_scan(u8 *gamestr, int type, void *ipbuff, int iplen, u32 ping) {
    GSLIST_QUERY_T(*func);
    thread_id   tid;
    ipport_t    *ipport;
    generic_query_data_t  gqd;
    struct  sockaddr_in peer;
    int     sd,
            servers,
            querylen;
    u8      *query;

#ifdef WIN32
#else
    struct  timeb   timex;
#endif

    if(!iplen) return(0);
    ipport = (ipport_t *)ipbuff;

    memset(&gqd, 0, sizeof(generic_query_data_t));
    query = switch_type_query(type, &querylen, &gqd, (void *)&func, 0);

    sd = udpsocket();

    gqd.sock     = sd;
    gqd.maxping  = ping;
    gqd.func     = (void *)func;
    gqd.scantype = QUERY_SCANTYPE_SINGLE;
    gqd.peer     = &peer;
    gqd.ipport   = ipport;
    gqd.iplen    = iplen;
    gqd.ping     = malloc(iplen * 4);
    gqd.done     = malloc(iplen);
    peer.sin_family = AF_INET;

    tid = 0;
    for(servers = 0; servers < iplen; servers++) { // FIRST PING
        peer.sin_addr.s_addr = ipport[servers].ip;
        peer.sin_port        = ipport[servers].port;

        TEMPOZ1;
        gqd.ping[servers]    = TEMPOZ2;
        gqd.done[servers]    = 0;

        if(!tid) tid = quick_threadx(multi_scan_reply, &gqd);
        sendto(sd, query, querylen, 0, (struct sockaddr *)&peer, sizeof(struct sockaddr_in));
        usleep(scandelay);
    }
    if(tid) quick_threadz(tid);

    tid = 0;
    for(servers = 0; servers < iplen; servers++) { // REPING without natneg
        if(gqd.done[servers]) continue;
        peer.sin_addr.s_addr = ipport[servers].ip;
        peer.sin_port        = ipport[servers].port;

        TEMPOZ1;
        gqd.ping[servers]    = TEMPOZ2;

        if(!tid) tid = quick_threadx(multi_scan_reply, &gqd);
        sendto(sd, query, querylen, 0, (struct sockaddr *)&peer, sizeof(struct sockaddr_in));
        usleep(scandelay);
    }
    if(tid) quick_threadz(tid);

    if(force_natneg && ((type == 0) || (type == 8) || (type == 11))) {
        tid = 0;
        for(servers = 0; servers < iplen; servers++) { // REPING with natneg
            if(gqd.done[servers]) continue;
            peer.sin_addr.s_addr = ipport[servers].ip;
            peer.sin_port        = ipport[servers].port;

            TEMPOZ1;
            gqd.ping[servers]    = TEMPOZ2;

            if(gsnatneg(sd, gamestr, NULL, NULL, INADDR_NONE, 0, &peer, NULL) < 0) continue;

            if(!tid) tid = quick_threadx(multi_scan_reply, &gqd);
            sendto(sd, query, querylen, 0, (struct sockaddr *)&peer, sizeof(struct sockaddr_in));
            usleep(scandelay);
        }
        if(tid) quick_threadz(tid);
    }

    close(sd);
    FREEX(gqd.ping);
    FREEX(gqd.done);
    if(force_natneg) gsnatneg(-1, NULL, NULL, NULL, 0, 0, NULL, NULL);
    return(servers);
}


