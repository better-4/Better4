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



    /***************************************************************\
    |* this file contains the old functions mainly used by gsweb.h *|
    |* it's almost no longer supported                             *|
    \***************************************************************/



u8 *read_config_entry(FILE *fd, u32 startoff, u8 *key, u8 **out) {
    u32     endoff = startoff;
    int     type;
    u8      buff[DETECTSZ + 1],
            *par,
            *val;

    *out = NULL;
    fseek(fd, startoff, SEEK_SET);

    while((type = myreadini(fd, buff, sizeof(buff), &par, &val)) >= 0) {
        if(!type) break;
        if(!strcmp(par, key)) {
            *out = strdup(val);
        }
        endoff = ftell(fd);
    }

    if(!feof(fd)) fseek(fd, endoff, SEEK_SET);
    return(*out);
}



u8 *myitoa(int num) {
    static  u8  mini[12];

    sprintf(mini, "%d", num);
    return(mini);
}



void zero_equal(u8 *end) {
    while(*end <= ' ') end--;
    *(end + 1) = 0;
}



void get_key(u8 *gamestr, u8 *gamekey, u8 *gamefull) {
    FILE    *fd;
    u8      buff[GSLISTSZ + 1],
            *p;

    fd = gslfopen(GSLISTCFG, "rb");
    if(!fd) {
        fputs("- you must use the -u or -U option the first time!", stderr);
        std_err();
    }

    *gamekey = 0;

    while(fgets(buff, sizeof(buff), fd)) {
        p = strchr(buff + CNAMEOFF, ' ');
        if(p) *p = 0;
        if(!strcmp(gamestr, buff + CNAMEOFF)) {
            memcpy(gamekey, buff + CKEYOFF, 6);
            gamekey[6] = 0;
            if(gamefull) {
                zero_equal(buff + CFNAMEEND);
                strcpy(gamefull, buff + CFNAMEOFF);
            }
            if(*gamekey <= ' ') *gamekey = 0;
            break;
        }
    }
    fclose(fd);
}



u32 find_config_entry(FILE *fd, u8 **out) {
    u32     startoff = 0;
    int     type;
    u8      buff[DETECTSZ + 1],
            *par,
            *val;

    *out = NULL;

    while((type = myreadini(fd, buff, sizeof(buff), &par, &val)) >= 0) {
        if(type) continue;
        *out = strdup(par);
        startoff = ftell(fd);
        break;
    }

    return(startoff);
}



#define FREEGSWEB(A)    if(A) {         \
                            FREEX(A);   \
                            A = NULL;   \
                        }

void free_ipdata(ipdata_t *d, int elements) {
    int     i;

    for(i = 0; i < elements; i++) {
        FREEGSWEB(d[i].name);
        FREEGSWEB(d[i].map);
        FREEGSWEB(d[i].type);
        FREEGSWEB(d[i].ver);
        FREEGSWEB(d[i].mod);
        FREEGSWEB(d[i].mode);
    }
    FREEGSWEB(d);
}



void free_gsw_scan_data(gsw_scan_data_t *d, int elements) {
    int     i;

    for(i = 0; i < elements; i++) {
        FREEGSWEB(d[i].full);
        FREEGSWEB(d[i].game);
        FREEGSWEB(d[i].exe);
    }
    FREEGSWEB(d);
}



void free_gsw_fav_data(gsw_fav_data_t *d, int elements) {
    int     i;

    for(i = 0; i < elements; i++) {
        FREEGSWEB(d[i].game);
        FREEGSWEB(d[i].pass);
    }
    FREEGSWEB(d);
}



void free_gsw_data(gsw_data_t *d, int elements) {
    int     i;

    for(i = 0; i < elements; i++) {
        FREEGSWEB(d[i].game);
        FREEGSWEB(d[i].key);
        FREEGSWEB(d[i].full);
        FREEGSWEB(d[i].path);
        FREEGSWEB(d[i].filter);
    }
    FREEGSWEB(d);
}



#define MYDUP(A,B)  A = mydup(A, B);
u8 *mydup(u8 *key, u8 *val) {
    FREEX(key);
    return(strdup(val));
}



int gsw_stricmp(const char *s1, const char *s2) {
    u8      a,
            b;

    if(!s1 && !s2) return(0);
    if(!s1) return(-1);
    if(!s2) return(1);

    while(*s1 && (*s1 <= ' ')) s1++;    // I don't want to sort the spaces
    while(*s2 && (*s2 <= ' ')) s2++;

    for(;;) {
        a = tolower(*s1);
        b = tolower(*s2);
        if(!a && !b) break;
        if(!a) return(-1);
        if(!b) return(1);
        if(a < b) return(-1);
        if(a > b) return(1);
        s1++;
        s2++;
    }
    return(0);
}



void gsw_sort_IP(ipdata_t *gip, int servers, int sort_type) {
    ipdata_t    xchg;
    int     i,
            j;

#define GSW_SORT_FUNCTION(COMPARE)                              \
    for(i = 0; i < (servers - 1); i++) {                        \
        if(gip[i].sort == IPDATA_SORT_CLEAR) gip[i].ping = -1;  \
        for(j = i + 1; j < servers; j++) {                      \
            if(COMPARE) {                                       \
                xchg   = gip[j];                                \
                gip[j] = gip[i];                                \
                gip[i] = xchg;                                  \
            }                                                   \
        }                                                       \
    }

    if(sort_type == GSW_SORT_PING) {
        GSW_SORT_FUNCTION(gip[i].ping > gip[j].ping)

    } else if(sort_type == GSW_SORT_NAME) {
        GSW_SORT_FUNCTION(gsw_stricmp(gip[i].name, gip[j].name) > 0)

    } else if(sort_type == GSW_SORT_MAP) {
        GSW_SORT_FUNCTION(gsw_stricmp(gip[i].map, gip[j].map) > 0)

    } else if(sort_type == GSW_SORT_TYPE) {
        GSW_SORT_FUNCTION(gsw_stricmp(gip[i].type, gip[j].type) > 0)

    } else if(sort_type == GSW_SORT_PLAYER) {
        GSW_SORT_FUNCTION(gip[i].players > gip[j].players)

    } else if(sort_type == GSW_SORT_VER) {
        GSW_SORT_FUNCTION(gsw_stricmp(gip[i].ver, gip[j].ver) > 0)

    } else if(sort_type == GSW_SORT_MOD) {
        GSW_SORT_FUNCTION(gsw_stricmp(gip[i].mod, gip[j].mod) > 0)

    } else if(sort_type == GSW_SORT_DED) {
        GSW_SORT_FUNCTION(gip[i].ded < gip[j].ded)

    } else if(sort_type == GSW_SORT_PWD) {
        GSW_SORT_FUNCTION(gip[i].pwd < gip[j].pwd)

    } else if(sort_type == GSW_SORT_PB) {
        GSW_SORT_FUNCTION(gip[i].pb < gip[j].pb)

    } else if(sort_type == GSW_SORT_RANK) {
        GSW_SORT_FUNCTION(gip[i].rank < gip[j].rank)

    } else if(sort_type == GSW_SORT_MODE) {
        GSW_SORT_FUNCTION(gsw_stricmp(gip[i].mode, gip[j].mode) > 0)

    } else if(sort_type == GSW_SORT_COUNTRY) {
        GSW_SORT_FUNCTION(gsw_stricmp(gip[i].country, gip[j].country) > 0)
    }

#undef GSW_SORT_FUNCTION

/* OLD lame method
    for(curr = servers; curr; curr--) {
        ping    = -1;
        pingptr = 0;
        for(rest = curr, i = 0; i < servers; i++) {
                // not yet sorted                  && minor ping
            if((gip[i].sort != IPDATA_SORT_SORTED) && (gip[i].ping < ping)) {
                pingptr = i;
                ping    = gip[i].ping;
                if(!--rest) break;
            }
        }

        i = pingptr;
        if(gip[i].sort == IPDATA_SORT_CLEAR) {
            if(gsw_noping) break;
            gip[i].ping = 0;
        }
        gip[i].sort = IPDATA_SORT_SORTED;

        gsweb_show_ipport(sock, game, &gip[i], "", 0);
    }
*/
}

