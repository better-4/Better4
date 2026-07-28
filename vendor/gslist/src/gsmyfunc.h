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

#ifndef WIN32
    void std_err(void) {
        perror("\nError");
        exit(1);
    }
#endif



#define FREEX(X)    freex((void *)&X)
void freex(void **buff) {
    if(!buff || !*buff) return;
    free(*buff);
    *buff = NULL;
}



u8 *myinetntoa(in_addr_t ip) { // avoids warnings and blablabla
    struct in_addr  ipaddr;
    ipaddr.s_addr = ip;
    return(inet_ntoa(ipaddr));
}



int udpsocket(void) {
    static const struct linger  ling = {1,1};
    int     sd;

    sd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    if(sd < 0) std_err();
    setsockopt(sd, SOL_SOCKET, SO_LINGER, (char *)&ling, sizeof(ling));
    return(sd);
}



int tcpsocket(void) {
    static const struct linger  ling = {1,1};
    int     sd;

    sd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if(sd < 0) std_err();
    setsockopt(sd, SOL_SOCKET, SO_LINGER, (char *)&ling, sizeof(ling));
    return(sd);
}



/*
finds the value of key in the data buffer and return a new
string containing the value or NULL if nothing has been found
no modifications are made on the input data
*/
u8 *keyval(u8 *data, u8 *key) {
    int     len,
            nt   = 0,
            skip = 1;
    u8      *p,
            *val;

    for(;;) {
        p = strchr(data, '\\');

        if(nt & 1) {
            // key
            if(p && !strnicmp(data, key, p - data)) {
                skip = 0;
            }
        } else {
            // value
            if(!skip) {
                if(!p) p = data + strlen(data);
                len = p - data;
                val = malloc(len + 1);
                if(!val) std_err();
                memcpy(val, data, len);
                val[len] = 0;
                return(val);
            }
        }

        if(!p) break;
        nt++;
        data = p + 1;
    }
    return(NULL);
}



u8 *recv_basic_secure(int sd, u8 *data, int max) {
    int     t,
            len = 0;
    u8      *sec = NULL;

    while(len < max) {
        t = recv(sd, data + len, max - len, 0);
        if(t < 0) std_err();
        if(!t) break;
        len += t;
        data[len] = 0;
        sec = keyval(data, "secure");
        if(sec) break;
        if(!data[len - 1]) break;
    }

    return(sec);
}



int timeout(int sock, int sec) {
    struct  timeval tout;
    fd_set  fd_read;
    int     err;

    tout.tv_sec  = sec;
    tout.tv_usec = 0;
    FD_ZERO(&fd_read);
    FD_SET(sock, &fd_read);
    err = select(sock + 1, &fd_read, NULL, NULL, &tout);
    if(err < 0) std_err();
    if(!err) return(-1);
    return(0);
}



in_addr_t resolv(char *host) {
    struct      hostent *hp;
    in_addr_t   host_ip;

    host_ip = inet_addr(host);
    if(host_ip == htonl(INADDR_NONE)) {
        hp = gethostbyname(host);
        if(!hp) {   // I prefer to exit instead of returning INADDR_NONE
            fprintf(stderr, "\nError: Unable to resolv hostname (%s)\n\n", host);
            exit(1);
        } else host_ip = *(in_addr_t *)(hp->h_addr);
    }
    return(host_ip);
}



u8 *delimit(u8 *data) {
    while(*data && (*data != '\n') && (*data != '\r')) data++;
    *data = 0;
    return(data);
}



int mystrcpy(u8 *dst, u8 *src, int max) {
    u8      *p;

    for(p = dst; *src && --max; p++, src++) *p = *src;
    *p = 0;
    return(p - dst);
}



    /* returns a new clean string */
u8 *mychrdup(u8 *src) {
    int     len,
            max;
    u8      *dst;

    len = max = strlen(src);
    dst = malloc(max + 1);
    if(!dst) std_err();

    max = enctypex_data_cleaner(dst, src, max);

        // probably useless free memory
    if(max < len) {
        dst = realloc(dst, max + 1);
        if(!dst) std_err();
    }

    return(dst);
}



int mysnprintf(u8 *buff, int len, u8 *fmt, ...) {
    va_list ap;
    int     ret;

    va_start(ap, fmt);
    ret = vsnprintf(buff, len, fmt, ap);
    va_end(ap);

    if((ret < 0) || (ret >= len)) {
        ret = len;
        buff[len] = 0;
    }
    return(ret);
}



    /*
    the core of the local config files
    it works just like the normal fopen()
    if you use a NULL mode will be returned the (allocated)
    full path of the file
    */
void *gslfopen(const char *path, const char *mode) {
#ifdef WIN32
    HKEY        key;
    char        home[GSMAXPATH + 1];
    DWORD       len;
#else
    const char  *home;
#endif
    char        retpath[GSMAXPATH + 64 + 1],
                *cmd;

    if(!*gslist_path) {
#ifdef WIN32
        len = GSMAXPATH;
        if(!RegOpenKeyEx(HKEY_CURRENT_USER, APPDATA, 0, KEY_READ, &key)) {
            if(!RegQueryValueEx(key, "AppData", NULL, NULL, home, &len)) {
                mysnprintf(gslist_path, sizeof(gslist_path), "%s\\gslist\\", home);
                mkdir(gslist_path);
            }
            RegCloseKey(key);
        }
        if(!*gslist_path) strcpy(gslist_path, ".\\");
#else
        home = getenv("HOME");
        if(!home) {
            fputs("\n"
                "Error: impossible to know your $HOME or Application Data directory where\n"
                "       reading/writing the Gslist configuration files.\n"
                "       Modify the source code of the program or report the problem to me.\n"
                "\n", stderr);
            exit(1);
        }
        mysnprintf(gslist_path, sizeof(gslist_path), "%s/.gslist/", home);
        mkdir(gslist_path, 0755);
#endif
    }

//    mysnprintf(retpath, sizeof(retpath), "%s%s", gslist_path, path);
    sprintf(retpath, "%s%s", gslist_path, path);

    if(!mode) return(strdup(retpath));

    if(!quiet) {
        if(stristr(mode, "r+")) cmd = "update";
        else if(stristr(mode, "a")) cmd = "append";
        else if(stristr(mode, "w")) cmd = "create";
        else cmd = "open";
        fprintf(stderr, "- %s file %s\n", cmd, retpath);
    }

    return(fopen(retpath, mode));
}



u8 *replace(u8 *buff, u8 *from, u8 *to) {
    int     fromlen,
            tolen;
    u8      *p;

    fromlen = strlen(from);
    tolen   = strlen(to);

    while((p = (u8 *)stristr(buff, from))) {
        memmove(p + tolen, p + fromlen, strlen(p) + 1);
        memcpy(p, to, tolen);
    }
    return(buff);
}


int vspr(u8 **buff, u8 *fmt, va_list ap) {
    int     len,
            mlen;
    u8      *ret;

    mlen = strlen(fmt) + 128;

    for(;;) {
        ret = malloc(mlen);
        if(!ret) return(0);     // return(-1);
        len = vsnprintf(ret, mlen, fmt, ap);
        if((len >= 0) && (len < mlen)) break;
        if(len < 0) {           // Windows style
            mlen += 128;
        } else {                // POSIX style
            mlen = len + 1;
        }
        FREEX(ret);
    }

    *buff = ret;
    return(len);
}



int spr(u8 **buff, u8 *fmt, ...) {
    va_list ap;
    int     len;

    va_start(ap, fmt);
    len = vspr(buff, fmt, ap);
    va_end(ap);

    return(len);
}



int udpspr(int sd, struct sockaddr_in *peer, u8 *fmt, ...) {
    va_list ap;
    int     len,
            new = 0;
    u8      *buff;

    va_start(ap, fmt);
    len = vspr(&buff, fmt, ap);
    va_end(ap);

    if(!sd) {
        new = 1;
        sd = udpsocket();
    }

    len = sendto(sd, buff, len, 0, (struct sockaddr *)peer, sizeof(struct sockaddr_in));
    if(new) close(sd);
    FREEX(buff);
    return(len);
}



int tcpspr(int sd, u8 *fmt, ...) {
    va_list ap;
    int     len;
    u8      *buff;

    va_start(ap, fmt);
    len = vspr(&buff, fmt, ap);
    va_end(ap);

    len = send(sd, buff, len, 0);
    FREEX(buff);
    return(len);
}



int tcpxspr(int sd, u8 *gamestr, u8 *msgamestr, u8 *validate, u8 *filter, u8 *info, int type) {  // enctypex
    int     len;
    u8      *buff,
            *p;

    len = 2 + 7 + strlen(gamestr) + 1 + strlen(msgamestr) + 1 + strlen(validate) + strlen(filter) + 1 + strlen(info) + 1 + 4;
    buff = malloc(len);

    p = buff;
    p += 2;
    *p++ = 0;
    *p++ = 1;
    *p++ = 3;
    *p++ = 0;   // 32 bit
    *p++ = 0;
    *p++ = 0;
    *p++ = 0;
    p += sprintf(p, "%s", gamestr) + 1;     // the one you are requesting
    p += sprintf(p, "%s", msgamestr) + 1;   // used for the decryption algorithm
    p += sprintf(p, "%s%s", validate, filter) + 1;
    p += sprintf(p, "%s", info) + 1;
    *p++ = 0;
    *p++ = 0;
    *p++ = 0;
    *p++ = type;
        // bits which compose the "type" byte:
        // 00: plain server list, sometimes the master server returns also the informations if requested
        // 01: requested informations of the server, like \hostname\numplayers and so on
        // 02: nothing???
        // 04: available informations on the master server??? hostname, mapname, gametype, numplayers, maxplayers, country, gamemode, password, gamever
        // 08: nothing???
        // 10: ???
        // 20: peerchat IRC rooms
        // 40: ???
        // 80: nothing???

    len = p - buff;
    buff[0] = len >> 8;
    buff[1] = len;

    len = send(sd, buff, len, 0);
    FREEX(buff);
    return(len);
}



    /* returns -1 if error, 1 if only par, 2 if par and val, 0 if [] */
int myreadini(FILE *fd, u8 *line, int linesz, u8 **par, u8 **val) {
    u8      *p,
            *l;

    *par = NULL;
    *val = NULL;

    if(!fgets(line, linesz, fd)) return(-1);

    delimit(line);

    while(*line && (*line <= ' ') && (*line != '=')) line++;    // first spaces
    *par = line;

    while(*line && (*line >  ' ') && (*line != '=')) line++;    // delimit par
    *line++ = 0;

    while(*line && (*line <= ' ') && (*line != '=')) line++;    // remove spaces after par
    *val = line;

    for(p = line + strlen(line) - 1; p >= line; p--) {          // remove last spaces
        if(*p > ' ') {
            *(p + 1) = 0;
            break;
        }
    }

    p = *par;
    if(*p == '[') {
        p++;
        l = strchr(p, ']');
        if(l) *l = 0;
        if(strlen(p) > CNAMELEN) p[CNAMELEN] = 0;
        *par = p;
        return(0);
    }
    if(!(*val)[0]) return(1);
    return(2);
}



u8 *strduplow(u8 *str) {
    u8     *p;

    str = strdup(str);
    for(p = str; *p; p++) {
        *p = tolower(*p);
    }
    return(str);
}



#define MAXDNS  64

    /* the following function caches the IP addresses    */
    /* actually the instructions which replace the older */
    /* entries are not the best in the world... but work */

in_addr_t dnsdb(char *host) {
    typedef struct {
        in_addr_t   ip;
        u8          *host;
        time_t      time;
    } db_t;

    static db_t *db;
    static int  older;
    in_addr_t   fastip;
    int         i;

    if(!host) {
        db = malloc(sizeof(db_t) * MAXDNS);         // allocate
        if(!db) std_err();

        for(i = 0; i < MAXDNS; i++) {
            db[i].ip   = INADDR_NONE;
            db[i].host = NULL;
            db[i].time = time(NULL);
        }

        older = 0;
        return(0);
    }

    if(!host[0]) return(INADDR_NONE);

    fastip = inet_addr(host);
    if(fastip != INADDR_NONE) return(fastip);

    for(i = 0; i < MAXDNS; i++) {
        if(!db[i].host) break;                      // new host to add

        if(!strcmp(db[i].host, host)) {             // host in cache
            db[i].time = time(NULL);                // update time
            return(db[i].ip);
        }

        if(db[i].time < db[older].time) {           // what's the older entry?
            older = i;
        }
    }

    if(i == MAXDNS) i = older;                      // take the older one

    if(db[i].host) free(db[i].host);

    db[i].ip   = resolv(host);
    if(db[i].ip == INADDR_NONE) {
        db[i].host = NULL;
        return(INADDR_NONE);
    }

    db[i].host = strduplow(host);                   // low case!

    db[i].time = time(NULL);

    return(db[i].ip);
}



void gslist_step_1(u8 *gamestr, u8 *filter) {
    //if(enctypex_query[0] && (myenctype >= 0)) myenctype = -1;
    if(myenctype < 0) {
        if((u8 *)msgamename == (u8 *)MSGAMENAME) {  // change if default
            msgamename = (u8 *)MSGAMENAMEX;
            msgamekey  = (u8 *)MSGAMEKEYX;
        }
        if(!mymshost) {   // lame work-around in case we use -x IP
            mshost = enctypex_msname(gamestr, NULL);
            msport = MSXPORT;
        }
    }
    if((enctypex_type == 0x20) && !enctypex_query[0]) {
        enctypex_query = "\\hostname";
    }

    if(!quiet) {
        fprintf(stderr,
            "Gamename:    %s\n"
            "Enctype:     %d\n"
            "Filter:      %s\n"
            "Resolving    %s ... ",
            gamestr,
            myenctype,
            filter,
            mshost);
    }

    msip = dnsdb(mshost);

    if(!quiet) fprintf(stderr, "%s:%hu\n", myinetntoa(msip), msport);
}



int gslist_step_2(struct sockaddr_in *peer, u8 *buff, u8 *secure, u8 *gamestr, u8 *validate, u8 *filter, enctypex_data_t *enctypex_data) {
    int     sd;
    u8      *sec    = NULL;

    sd = tcpsocket();
    if(connect(sd, (struct sockaddr *)peer, sizeof(struct sockaddr_in))
      < 0) goto quit;

    if(myenctype < 0) {
        memset(enctypex_data, 0, sizeof(enctypex_data_t));    // needed
        enctypex_decoder_rand_validate(validate);

        if(!quiet) {
            fprintf(stderr,
                "MSgamename:  %s\n"
                "MSgamekey:   %s\n"
                "Random id:   %s\n"
                "Info query:  %s\n",
                msgamename,
                msgamekey,
                validate,
                enctypex_query);
        }

        if(tcpxspr(sd,
            gamestr,
            msgamename,
            validate,
            filter,
            enctypex_query,  // \\hostname\\gamever\\numplayers\\maxplayers\\mapname\\gametype
            enctypex_type) < 0) goto quit;
    } else {
        sec = recv_basic_secure(sd, buff, BUFFSZ);
        if(sec) {
            mystrcpy(secure, sec, SECURESZ);
            gsseckey(validate, sec, msgamekey, myenctype);
            if(!quiet) fprintf(stderr, "Validate:    %s -> %s\n", secure, validate);
            FREEX(sec);
        } else {
            if(!quiet) {
                fprintf(stderr,
                    "Alert: This master server doesn't seem to support the \"secure\" Gamespy protocol\n"
                    "       This is the received reply: %s\n"
                    "       I try to send the query with an empty \"validate\" field\n"
                    "\n", buff);
            }
            *validate = 0;
            *secure   = 0;
        }

        if(tcpspr(sd,
            PCK,
            msgamename,
            myenctype,
            validate,
            gamestr,
            *filter ? "\\where\\" : "",
            filter) < 0) goto quit;
    }
    return(sd);
quit:
    close(sd);
    return(-1);
}



ipport_t *gslist_step_3(int sd, u8 *validate, enctypex_data_t *enctypex_data, int *ret_len, u8 **ret_buff, int *ret_dynsz) {
    ipport_t    *ipport;
    int     err,
            len,
            dynsz;
    u8      *buff;

    buff   = *ret_buff;
    dynsz  = *ret_dynsz;

    ipport = NULL;
    len    = 0; // *ret_len not needed
    if(!quiet) fprintf(stderr, "Receiving:   ");

    while(!timeout(sd, 10)) {
        err = recv(sd, buff + len, dynsz - len, 0);
        if(err <= 0) break;
        if(!quiet) fputc('.', stderr);
        len += err;
        if(len >= dynsz) {
            dynsz += BUFFSZ;
            buff = realloc(buff, dynsz);
            if(!buff) std_err();
        }
        if(myenctype < 0) {   // required because it's a streamed list and the socket is not closed by the server
            ipport = (ipport_t *)enctypex_decoder(msgamekey, validate, buff, &len, enctypex_data);
            if(ipport && enctypex_decoder_convert_to_ipport((u8 *)ipport, len - ((u8 *)ipport - buff), NULL, NULL, 0, 0)) break;  // end of the stream
        }
    }
    close(sd);
    if(!quiet) fprintf(stderr, " %u bytes\n", len);

    *ret_len   = len;
    *ret_buff  = buff;
    *ret_dynsz = dynsz;
    return(ipport);
}



int gslist_step_4(u8 *secure, u8 *buff, enctypex_data_t *enctypex_data, ipport_t **ret_ipport, int *ret_len) {
    static u8   *enctypextmp    = NULL;
    ipport_t    *ipport;
    int     len,
            itsok;

    ipport = *ret_ipport;
    len    = *ret_len;
    itsok  = 1;
    if(!myenctype && !strncmp(buff + len - 7, "\\final\\", 7)) {
        ipport = (ipport_t *)buff;
        len -= 7;
    } else if((myenctype == 1) && len) {
        ipport = (ipport_t *)enctype1_decoder(
            secure,
            buff,
            &len);
    } else if((myenctype == 2) && len) {
        ipport = (ipport_t *)enctype2_decoder(
            msgamekey,
            buff,
            &len);
    } else if((myenctype < 0) && len && ipport) {
            // because for some games like AA the server sends 5 bytes for each IP
            // so if I use the same untouched buffer as input and output I overwrite its fields
            // the amount of allocated bytes wasted by this operation is enough small (for example 200k on 1megabyte of received data)
        enctypextmp = realloc(enctypextmp, (len / 5) * 6);
        if(!enctypextmp) std_err();
        len = enctypex_decoder_convert_to_ipport(buff + enctypex_data->start, len - enctypex_data->start, enctypextmp, NULL, 0, 0);
        if(len < 0) {   // yeah, the handling of the master server's error doesn't look so good although all perfect, but it's a rare event and I wanted to handle it
            if(enctypex_data->offset > enctypex_data->start) {
                len = enctypex_data->offset - enctypex_data->start;
                memmove(buff, buff + enctypex_data->start + ((len > 6) ? 6 : 0), len - ((len > 6) ? 6 : 0));
            } else {
                len = 0;
            }
            ipport = NULL;
            itsok  = 0;
        } else {
            ipport = (ipport_t *)enctypextmp;
        }
    } else {
        ipport = NULL;
        itsok  = 0;
    }
    if(!ipport) itsok = 0;
    if(len < 0) {
        itsok = 0;
        len = 0;
    }

    if(!quiet) fprintf(stderr, "-----------------------\n");

    if(!itsok && !quiet) {
        if(!len) {
            fprintf(stderr, "\n"
                "Error: the gamename doesn't exist in the master server\n"
                "\n");
        } else {
            fprintf(stderr, "\n"
                "Alert: the master server has not accepted your query for the following error:\n"
                "       %.*s\n"
                "\n", len, buff);
        }
        len = 0;
    }

    *ret_ipport = ipport;
    *ret_len    = len;
    return(itsok);
}



void get_key(u8 *gamestr, u8 *gamekey, u8 *gamefull);
void gslist_heartbeat(u8 *buff, u8 *gamestr, u8 *validate, int hbmethod, u16 heartbeat_port, struct sockaddr_in *peer) {
    struct sockaddr_in  peerl;
    int     sd,
            i,
            err,
            psz,
            on      = 1;
    u8      gamekey[32],
            *sec    = NULL;

    if(hbmethod == 2) {
        fprintf(stderr, "- the heartbeat for port %hu will be sent each %d minutes\n",
            HBMINUTES / 60,
            heartbeat_port);

        for(;;) {
            udpspr(0, peer, GSHB1, heartbeat_port, gamestr);

            for(i = HBMINUTES; i; i--) {
                fprintf(stderr, " %3d\r", i);
                sleep(ONESEC);
            }
        }
    } else if(hbmethod == 1) {
        fprintf(stderr, "- the game port %hu will be temporary bound each %d minutes, watch the details:\n",
            heartbeat_port,
            HBMINUTES / 60);

        peerl.sin_addr.s_addr = htonl(INADDR_ANY);
        peerl.sin_port        = htons(heartbeat_port);
        peerl.sin_family      = AF_INET;

        for(;;) {
            sd = udpsocket();

            fprintf(stderr, "- binding: ");
            if(setsockopt(sd, SOL_SOCKET, SO_REUSEADDR, (char *)&on, sizeof(on))
              < 0) std_err();
            if(bind(sd, (struct sockaddr *)&peerl, sizeof(struct sockaddr_in))
              < 0) std_err();

            udpspr(sd, peer, GSHB1, heartbeat_port, gamestr);
            if(!quiet) fputc('.', stderr);

            for(;;) {
                if(timeout(sd, TIMEOUT) < 0) {
                    get_key(gamestr, gamekey, NULL);
                    printf("\n- activate gsnatneg(%s, %s):\n", gamestr, gamekey);
                    gsnatneg_verbose = 1;
                    for(;;) {
                        if(gsnatneg(sd, gamestr, gamekey, NULL, INADDR_ANY, 0, &peerl, NULL) < 0) {
                            fprintf(stderr, "\n"
                                "Error: socket timeout, probably your firewall blocks the UDP packets to or from the master server\n"
                                "\n");
                            exit(1);
                        }
                    }
                }

                psz = sizeof(struct sockaddr_in);
                err = recvfrom(sd, buff, BUFFSZ, 0, (struct sockaddr *)peer, &psz);
                if(err <= 0) continue;

                    // here we check if the source IP is the same or is in the same B
                    // subnet of the master server, this is needed
                if((peer->sin_addr.s_addr & 0xffff) == (msip & 0xffff)) break;
                if(!quiet) fputc('x', stderr);
            }
            if(!quiet) fputc('.', stderr);
            buff[err] = 0;

            sec = keyval(buff, "secure");
            if(sec) {   // old, no longer used by the master server
                gsseckey(validate, sec, msgamekey, 0);
                fprintf(stderr, "- Validate: %s -> %s\n", sec, validate);
                FREEX(sec);
                udpspr(sd, peer, GSHB2a, validate);
            } else {
                udpspr(sd, peer, GSHB2b, gamestr);
            }
            if(!quiet) fputc('.', stderr);

            close(sd);
            fprintf(stderr, " free\n");

            for(i = HBMINUTES; i; i--) {
                fprintf(stderr, " %3d\r", i);
                sleep(ONESEC);
            }

                // needed to avoid that the sockaddr_in structure
                // is overwritten with a different host and port
            peer->sin_addr.s_addr = msip;
            peer->sin_port        = htons(msport);
            peer->sin_family      = AF_INET;
        }
    }
}



int cstring(u8 *input, u8 *output, int maxchars, int *inlen) {
    int     n,
            len;
    u8      *p,
            *o;

    if(!input || !output) {
        if(inlen) *inlen = 0;
        return(0);
    }

    p = input;
    o = output;
    while(*p) {
        if(maxchars >= 0) {
            if((o - output) >= maxchars) break;
        }
        if(*p == '\\') {
            p++;
            switch(*p) {
                case 0:  return(-1); break;
                //case '0':  n = '\0'; break;
                case 'a':  n = '\a'; break;
                case 'b':  n = '\b'; break;
                case 'e':  n = '\e'; break;
                case 'f':  n = '\f'; break;
                case 'n':  n = '\n'; break;
                case 'r':  n = '\r'; break;
                case 't':  n = '\t'; break;
                case 'v':  n = '\v'; break;
                case '\"': n = '\"'; break;
                case '\'': n = '\''; break;
                case '\\': n = '\\'; break;
                case '?':  n = '\?'; break;
                case '.':  n = '.';  break;
                case ' ':  n = ' ';  break;
                case 'x': {
                    //n = readbase(p + 1, 16, &len);
                    //if(len <= 0) return(-1);
                    if(sscanf(p + 1, "%02x%n", &n, &len) != 1) return(-1);
                    if(len > 2) len = 2;
                    p += len;
                    } break;
                default: {
                    //n = readbase(p, 8, &len);
                    //if(len <= 0) return(-1);
                    if(sscanf(p, "%3o%n", &n, &len) != 1) return(-1);
                    if(len > 3) len = 3;
                    p += (len - 1); // work-around for the subsequent p++;
                    } break;
            }
            *o++ = n;
        } else {
            *o++ = *p;
        }
        p++;
    }
    *o = 0;
    len = o - output;
    if(inlen) *inlen = p - input;
    return(len);
}


