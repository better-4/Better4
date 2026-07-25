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

void handoff2gamekey(u8 *out, u8 *in) {
    out[0] = in[2];
    out[1] = in[4];
    out[2] = in[6];
    out[3] = in[8];
    out[4] = in[10];
    out[5] = in[12];
}



    /* scans full.cfg to know if game already exists */
int check_updates(u8 *game, FILE *fdfull) {
    int     type;
    u8      buff[FULLSZ + 1],
            *par,
            *val;

    rewind(fdfull);
    while((type = myreadini(fdfull, buff, sizeof(buff), &par, &val)) >= 0) {
        if(type) continue;
        if(!strcmp(game, par)) return(0);
    }
    return(1);
}



void verify_gamespy(void) {
    FILE    *fdsvc,
            *fdfull;
    int     i,
            part,
            firstlen;
    u8      getfile[GETSZ + 1],
            tot[KNOWNSZ + 1],
            *s,
            *p;

    //fprintf(stderr, "- open %s\n", KNOWNCFG);
    fdsvc = gslfopen(KNOWNCFG, "rb");
    if(!fdsvc) std_err();

    //fprintf(stderr, "- update %s\n", FULLCFG);
    fdfull = gslfopen(FULLCFG, "r+b");
    if(!fdfull) {
        //fprintf(stderr, "- create %s\n", FULLCFG);
        fdfull = gslfopen(FULLCFG, "wb");
        if(!fdfull) std_err();
    }

    firstlen = mystrcpy(getfile, "software/services/index.aspx?mode=full&services=", sizeof(getfile));
    part = 0;
    while(!feof(fdsvc)) {
        p = getfile + firstlen;
        i = 0;

        while(fgets(tot, sizeof(tot), fdsvc)) {
            if(tot[0] == '-') continue;

            s = strchr(tot, ' ');
            if(!s) continue;
            *s = 0;

            if(!check_updates(tot, fdfull)) continue;

            p += mystrcpy(p, tot, sizeof(getfile) - (p - getfile));
            if(++i == MAXNAMESREQ) break;
            *p++ = '\\';
        }

        if(!i) break;
        if(*(p - 1) == '\\') p--;
        *p = 0;

        fseek(fdfull, 0, SEEK_END); // append
//        if(http2file(HOST, 28900, getfile, fdfull, 0) <= 0) {
        fprintf(stderr, "- download part: %d\n", ++part);
        if(mydown_http2file(
            NULL,           // int *sock
            0,              // int timeout
            HOST,           // u8 *host
            28900,          // u16 port
            NULL,           // u8 *user
            NULL,           // u8 *pass
            NULL,           // u8 *referer
            GSUSERAGENT,    // u8 *useragent
            NULL,           // u8 *cookie
            NULL,           // u8 *more_http
            0,              // int verbose
            getfile,        // u8 *getstr
            fdfull,         // FILE *fd
            NULL,           // u8 *filename
            0,              // int showhead
            0,              // int onlyifdiff
            0,              // int resume
            0,              // u32 from
            0,              // u32 tot
            NULL,           // u32 *filesize
            NULL,           // u8 *filedata
            NULL,           // int *ret_code
            0,              // int onflyunzip
            NULL,           // u8 *content
            0,              // int contentsize
            NULL,           // u8 *get
            NULL,
            0,
            NULL
        ) <= 0) {
            fprintf(stderr, "- update interrupted for errors on the server, retry later or tomorrow\n\n");
            break;
        }
        fprintf(stderr, "\n");
        fflush(fdfull);             // flush
    }

    fclose(fdsvc);
    fclose(fdfull);
}



int strlen_spaces(u8 *str, int limit) {
    u8      *p;

    if(limit < 0) limit = strlen(str);
    for(p = str + limit - 1; p >= str; p--) {
        if(*p > ' ') return((p + 1) - str);
    }
    return(0);
}



int gslistcfgsort(void) {
    FILE    *fd;
    int     i,
            j,
            res,
            tot,
            sort_list;
    u8      **buff,
            *p,
            tmp[GSLISTSZ + 1 + 32]; // 32 is not needed

    //fprintf(stderr, "- open %s\n", GSLISTTMP);
    fd = gslfopen(GSLISTTMP, "rb");
    if(!fd) std_err();

    for(tot = 0; fgets(tmp, sizeof(tmp), fd); tot++);   // count the lines
    rewind(fd);

    buff = calloc(tot, sizeof(u8 *));  // allocate space for pointers
    if(!buff) std_err();

    for(i = 0; i < tot; i++) {
        fgets(tmp, sizeof(tmp), fd);
        for(p = tmp; *p && (*p != '\r') && (*p != '\n'); p++);
        *p = 0;
        buff[i] = strdup(tmp);
        if(!buff[i]) std_err();
    }
    fclose(fd);

    fprintf(stderr, "- build, clean & sort %s\n", GSLISTCFG);
    fd = gslfopen(GSLISTCFG, "wb");
    if(!fd) std_err();

    // sort_list:
    // 0 = removes the same gamenames, removes those that don't have a gamekey, sort by gamename
    // 1 = sort by game description

    for(sort_list = 0; sort_list < 2; sort_list++) {
        for(i = 0; i < (tot - 1); i++) {
            if(!buff[i] || !buff[i][0]) continue;
            for(j = i + 1; j < tot; j++) {
                if(!buff[j] || !buff[j][0]) continue;

                if(!sort_list) {
                    res = strnicmp(buff[j] + CNAMEOFF, buff[i] + CNAMEOFF, CKEYOFF - CNAMEOFF); // gamename only
                    //res = stricmp(buff[j] + CNAMEOFF, buff[i] + CNAMEOFF);  // check both gamename and gamekey
                } else if(sort_list == 1) {
                    res = stricmp(buff[j], buff[i]);
                }
                if(!res) {              // removes duplicates
                    if(!sort_list) {
                        if((strlen(buff[i] + CNAMEOFF) <= (CKEYOFF - CNAMEOFF)) || (buff[i][CKEYOFF] <= ' ')) {
                            buff[i][0] = 0; // the current game doesn't have a gamekey
                        } else if((strlen(buff[j] + CNAMEOFF) <= (CKEYOFF - CNAMEOFF)) || (buff[j][CKEYOFF] <= ' ')) {
                            buff[j][0] = 0; // the compared game doesn't have a gamekey
                        } else if(stricmp(buff[j] + CKEYOFF, buff[i] + CKEYOFF)) {
                            continue;       // different gamekey
                        } else if(strlen_spaces(buff[j], CNAMEOFF) <= strlen_spaces(buff[i], CNAMEOFF)) {
                            buff[j][0] = 0; // the current description is longer (longer is better?)
                        } else {
                            buff[i][0] = 0; // the compared one is better so delete the current one
                        }
                    } else if(sort_list == 1) {
                        buff[i][0] = 0;
                    }
                } else if(res < 0) {    // sort
                    p       = buff[j];
                    buff[j] = buff[i];
                    buff[i] = p;
                }
            }
        }
    }

    for(i = 0; i < tot; i++) {
        if(!buff[i]) continue;
        if(buff[i][0]) fprintf(fd, "%s\n", buff[i]);    // \n for Unix notation (the one I have ever used)
        FREEX(buff[i]);
    }
    FREEX(buff);

    fprintf(fd, "%s%s\n", GSLISTVER, VER);
    fclose(fd);
    return(tot);
}



void build_cfg(void) {
    FILE    *fd,
            *fdcfg,
            *fdtmp;
    int     type;
    u8      buff[FULLSZ + 1],
            tot[GSLISTSZ + 1],
            *p,
            *gamename = NULL,
            *gamekey  = NULL,
            *par,
            *val;

    //fprintf(stderr, "- open %s\n", FULLCFG);
    fd = gslfopen(FULLCFG, "rb");
    if(!fd) std_err();

    //fprintf(stderr, "- build %s\n", GSLISTTMP);
    fdtmp = gslfopen(GSLISTTMP, "wb");
    if(!fdtmp) std_err();

    //fprintf(stderr, "- copy old database from %s\n", GSLISTCFG);
    fdcfg = gslfopen(GSLISTCFG, "rb");
    if(fdcfg) {
        while(fgets(tot, sizeof(tot), fdcfg)) {
            if(!strncmp(tot, GSLISTVER, sizeof(GSLISTVER) - 1)) continue;
            fputs(tot, fdtmp);
        }
        fclose(fdcfg);
    }

#define GSLISTCFGRESET  memset(tot, ' ', GSLISTSZ - 1); \
                        tot[GSLISTSZ - 1] = '\n'; \
                        tot[GSLISTSZ]     = 0;
#define GSLISTCFGPUT    if(tot[0] > ' ') {      \
                            fputs(tot, fdtmp);  \
                            GSLISTCFGRESET;     \
                        }

    GSLISTCFGRESET

    while((type = myreadini(fd, buff, sizeof(buff), &par, &val)) >= 0) {
        if(!type) {
            GSLISTCFGPUT
            memcpy(tot + CNAMEOFF, par, strlen(par));
            memcpy(tot + CFNAMEOFF, par, strlen(par));  // safe
            tot[0] = toupper(tot[0]);

        } else if(!stricmp(par, "fullname")) {
            if(strlen(val) > CFNAMELEN) val[CFNAMELEN] = 0;
            memcpy(tot + CFNAMEOFF, val, strlen(val));

        } else if(!stricmp(par, "querygame")) { // some games like "Leadfoot Demo" have [leadfootd] and "querygame=leadfoot"
            if(strlen(val) > CNAMELEN) val[CNAMELEN] = 0;
            memset(tot + CNAMEOFF, ' ', CNAMELEN);
            memcpy(tot + CNAMEOFF, val, strlen(val));

        } else if(!stricmp(par, "handoff")) {
            handoff2gamekey(tot + CKEYOFF, val);
        }
    }
    GSLISTCFGPUT    // remaining, this is the only compatible way

    fclose(fd);

    //fprintf(stderr, "- copy database from %s\n", GSHKEYSCFG);
    fd = gslfopen(GSHKEYSCFG, "rb");
    if(!fd) std_err();

    while(fgets(buff, sizeof(buff), fd)) {  // autoconfig
        if(strncmp(buff, "Description", 11)) continue;
        gamename = strstr(buff, "gamename");
        if(!gamename) continue;
        gamekey  = strstr(buff, "gamekey");
        if(!gamekey) continue;
        break;
    }

    while(fgets(buff, sizeof(buff), fd)) {
        if(*buff == '=') continue;
        if(*buff <= ' ') break;

        p = delimit(buff);
        if((p - buff) > GSLISTSZ) continue;
        GSLISTCFGRESET

        memcpy(tot + CFNAMEOFF, buff, gamename - buff);
        if(p >= (gamekey + 6)) {
            memcpy(tot + CNAMEOFF,  gamename, gamekey - gamename);
            memcpy(tot + CKEYOFF,   gamekey,  6);
        } else {
            memcpy(tot + CNAMEOFF, gamename, strlen(gamename));
        }

        fputs(tot, fdtmp);
    }

    fclose(fd);
    fclose(fdtmp);

    fprintf(stderr, "- the database contains %d total entries\n", gslistcfgsort());

#undef GSLISTCFGRESET
#undef GSLISTCFGPUT
}



int make_gslistcfg(int clean) {
    FILE    *fd;
    int     size1,
            size2;
    struct  stat    xstat;

    fprintf(stderr, "- start data files downloading:\n");

    if(clean) {     // unlink all the existent files!
        fd = gslfopen(KNOWNCFG,  "wb");
        if(!fd) std_err();
        fclose(fd);

        fd = gslfopen(FULLCFG,   "wb");
        if(!fd) std_err();
        fclose(fd);

        fd = gslfopen(GSLISTCFG, "wb");
        if(!fd) std_err();
        fclose(fd);
    }

    size1 = cool_download(GSHKEYSCFG, ALUIGIHOST, 80,    "papers/" GSHKEYSCFG);
    fprintf(stderr, "---\n");

    size2 = cool_download(KNOWNCFG,   HOST,       28900, "software/services/index.aspx");
    fprintf(stderr, "---\n");

    fd = gslfopen(GSLISTCFG, "rb");
    if(fd) fclose(fd);

    if(!fd || (size1 > 0) || (size2 > 0)) {
        verify_gamespy();
        build_cfg();
    } else {
        fprintf(stderr, "- no updates available\n");
    }

    cool_download(DETECTCFG,          HOST,       28900, "software/services/index.aspx?mode=detect");
    fprintf(stderr, "---\n");

        // check it each 15 days
    if((stat(gslfopen(GEOIPDAT, NULL), &xstat) < 0) || ((time(NULL) - xstat.st_mtime) > GEOIPUPDTIME)) {
        cool_download(GEOIPDAT,       GEOIPHOST,  80,    GEOIPURI);
        fprintf(stderr, "---\n");
    }

    return(0);
}


