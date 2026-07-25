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

#define GSWHTTP         "HTTP/1.1 200 OK\r\n" \
                        "Connection: close\r\n" \
                        "Content-Type: text/html\r\n" \
                        "\r\n"
#define GSWCFG          "gsweb.cfg"
#define GSWFONTSZ       11
#define GSWQUERYSZ      512
#define DETECTSZ        300
#define GSWDEFTIMEOUT   2
#define GSWFILTERSZ     128
#define HTTPAMP         "&amp;" // & or &amp;

#define GSWSEND(x)      send(sock, x, sizeof(x) - 1, 0)



#ifdef WINTRAY
    #include "gswtray.h"
#endif



int     gsw_allow_refresh = 1;  /* options */
u8      *gsw_admin_IP     = NULL;



gsw_data_t      *gsw_data;
gsw_fav_data_t  *gsw_fav_data;
int     gsw_tot,
        gsw_fav_tot,
        gsw_maxping,
        gsw_noping,
        gsw_maxservers,
        gsw_font_size;
u8      *gsw_player,
        *gsw_filter;        // temporary



int gsw_get_query_for_game(u8 *game) {
    int     i;

    for(i = 0; i < gsw_tot; i++) {
        if(!strcmp(gsw_data[i].game, game)) return(gsw_data[i].query);
    }

    return(0);
}



u8 *gsw_calc_query(u8 *buff, int type) {
    int     i;
    u8      *p,
            *query;

    p = buff;
    p += sprintf(p, "<select name=\"query\">");

    for(i = 0; (query = switch_type_query(i, NULL, NULL, NULL, 3)); i++) {
        p += sprintf(p,
            "<option value=\"%d\"%s>%s",
            i,
            (i == type) ? " selected" : "",
            query);
    }
    strcpy(p, "</select>");

    return(buff);
}



void gsw_apply_font(int size) {
    u8      *p;

    p = (u8 *)stristr(gsw_skin_head, "font-size:");
    if(p) {
        p[10] = (size / 10) + '0';
        p[11] = (size % 10) + '0';
    }
    gsw_font_size = size;
}



void gsweb_initconf(void) {
    init_geoip();
    if(myenctype < 0) {
        msip = 0;
        if(!enctypex_query[0]) enctypex_query = ENCTYPEX_QUERY_GSLIST;
    } else {
        fprintf(stderr, "- resolv %s ... ", mshost);
        msip = resolv(mshost);  // dnsdb is not needed here
        fprintf(stderr, "%s\n", myinetntoa(msip));
    }

    gsw_player        = strdup("player");
    gsw_tot           = 0;
    gsw_fav_tot       = 0;
    gsw_filter        = strdup("");
    gsw_data          = NULL;
    gsw_fav_data      = NULL;
    gsw_maxping       = GSWDEFTIMEOUT;
    gsw_noping        = 0;
    gsw_maxservers    = 0;
    gsw_apply_font(GSWFONTSZ);
    gsw_refresh.game  = NULL;
    gsw_refresh.buff  = NULL;
    gsw_refresh.len   = 0;
}



void gsweb_saveconf(int save_filter) {
    FILE    *fd;
    int     i;

    fd = gslfopen(GSWCFG, "wb");
    if(!fd) std_err();

    fprintf(fd, "player=%s\n",     gsw_player);         /* player */

    for(i = 0; i < gsw_tot; i++) {                      /* game */
        fprintf(fd, "game=%s;%s;%s;%s;%d;%s\n",
            gsw_data[i].game,
            gsw_data[i].key,
            gsw_data[i].full,
            gsw_data[i].path,
            gsw_data[i].query,
            gsw_data[i].filter);
    }

    for(i = 0; i < gsw_fav_tot; i++) {                  /* favorite */
        fprintf(fd, "fav=%s;%s;%hu;%s\n",
            gsw_fav_data[i].game,
            myinetntoa(gsw_fav_data[i].ip),
            gsw_fav_data[i].port,
            gsw_fav_data[i].pass);
    }

    fprintf(fd, "maxping=%d\n",    gsw_maxping);        /* ping */
    fprintf(fd, "noping=%d\n",     gsw_noping);         /* noping */
    fprintf(fd, "maxservers=%d\n", gsw_maxservers);     /* maxservers */
    fprintf(fd, "font_size=%d\n",  gsw_font_size);      /* font_size */
    fprintf(fd, "enctype=%d\n",    myenctype);          /* enctype */
    if(save_filter) {
        fprintf(fd, "filter=%s\n", gsw_filter);         /* filter */
    }

    fclose(fd);
}



int gsw_sort_game_description(void) {
    gsw_data_t  xchg;
    int     i,
            j,
            sorted = 0;

    for(i = 0; i < (gsw_tot - 1); i++) {
        for(j = i + 1; j < gsw_tot; j++) {
            if(gsw_stricmp(gsw_data[j].full, gsw_data[i].full) < 0) {
                xchg        = gsw_data[j];
                gsw_data[j] = gsw_data[i];
                gsw_data[i] = xchg;
                sorted++;
            }
        }
    }

    return(sorted);
}



void gsweb_loadconf(void) {
    FILE    *fd;
    u8      buff[32 + GSMAXPATH + 1],
            *val,
            *key,
            *full,
            *path,
            *query,
            *filter,
            *ip,
            *port,
            *pass;

    fprintf(stderr, "- load configuration file %s\n", GSWCFG);

    fd = gslfopen(GSWCFG, "rb");
    if(!fd) {
        fd = gslfopen(GSWCFG, "wb");
        if(!fd) std_err();
        fclose(fd);
        return;
    }

    while(fgets(buff, sizeof(buff), fd)) {
        delimit(buff);

    #define FINDIT(x,y,z)   x = strchr(y, z);   \
                            if(x) {             \
                                *x++ = 0;       \
                            } else {            \
                                x = "";         \
                            }

        FINDIT(val, buff, '=');

        if(!strcmp(buff, "player")) {               /* player */
            MYDUP(gsw_player, val);

        } else if(!strcmp(buff, "game")) {          /* game */
            FINDIT(key,    val,   ';');
            FINDIT(full,   key,   ';');
            FINDIT(path,   full,  ';');
            FINDIT(query,  path,  ';');
            FINDIT(filter, query, ';');

            gsw_data = realloc((u8 *)gsw_data, (gsw_tot + 1) * sizeof(gsw_data_t));
            if(!gsw_data) std_err();
            memset(&gsw_data[gsw_tot], 0, sizeof(gsw_data_t));

            MYDUP(gsw_data[gsw_tot].game,   val);
            MYDUP(gsw_data[gsw_tot].key,    key);
            MYDUP(gsw_data[gsw_tot].full,   full);
            MYDUP(gsw_data[gsw_tot].path,   path);
            gsw_data[gsw_tot].query         = atoi(query);
            MYDUP(gsw_data[gsw_tot].filter, filter);

            gsw_tot++;

        } else if(!strcmp(buff, "fav")) {           /* fav */
            FINDIT(ip,     val,   ';');
            FINDIT(port,   ip,    ';');
            FINDIT(pass,   port,  ';');

            gsw_fav_data = realloc((u8 *)gsw_fav_data, (gsw_fav_tot + 1) * sizeof(gsw_fav_data_t));
            if(!gsw_fav_data) std_err();
            memset(&gsw_fav_data[gsw_fav_tot], 0, sizeof(gsw_fav_data_t));

            MYDUP(gsw_fav_data[gsw_fav_tot].game, val);
            gsw_fav_data[gsw_fav_tot].ip          = resolv(ip);
            gsw_fav_data[gsw_fav_tot].port        = atoi(port);
            MYDUP(gsw_fav_data[gsw_fav_tot].pass, pass);

            gsw_fav_tot++;

        } else if(!strcmp(buff, "filter")) {        /* filter (compatibility only!) */
            MYDUP(gsw_filter, val);

        } else if(!strcmp(buff, "maxping")) {       /* ping */
            gsw_maxping = atoi(val);

        } else if(!strcmp(buff, "noping")) {        /* noping */
            gsw_noping = atoi(val);

        } else if(!strcmp(buff, "maxservers")) {    /* maxservers */
            gsw_maxservers = atoi(val);

        } else if(!strcmp(buff, "font_size")) {     /* font size */
            gsw_apply_font(atoi(val));

        } else if(!strcmp(buff, "enctype")) {
            myenctype = atoi(val);
        }
    }

    #undef FINDIT

    fclose(fd);
    fprintf(stderr, "- %d games loaded and configured\n", gsw_tot);
    fprintf(stderr, "- %d favorites loaded and configured\n", gsw_fav_tot);

    if(gsw_sort_game_description()) gsweb_saveconf(0);
}



int gsw_game_exists(u8 *value) {
    int     i;

    for(i = 0; i < gsw_tot; i++) {
        if(!strcmp(gsw_data[i].game, value)) return(i);
    }
    return(-1);
}



int gsw_read_cfg_value(u8 *fname, u8 *game, u8 *parcmp, u8 *buff, int max, FILE *fd) {
    int     type,
            found = 0;
    u8      *par,
            *val;

    if(fname) {
        fd = gslfopen(fname, "rb");
        if(!fd) return(0);
    } else {
        rewind(fd); // fast solution
    }

    while((type = myreadini(fd, buff, max, &par, &val)) >= 0) {
        if(!type) {             /* gamename */
            if(found) break;
            if(!strcmp(par, game)) found++;
        } else if(found) {      /* parameter/value */
            if(!strcmp(par, parcmp)) break;
        }
    }

    if(fname) fclose(fd);

    if(val) return(mystrcpy(buff, val, max));
    return(0);
}



void gsw_memcpy_filter(u8 *dst, u8 *src, int len, u8 *filter) {
    int     i;

    if(filter) {
        for(i = 0; i < len; i++) {
            dst[i] = src[i];
            if(strchr(filter, dst[i])) dst[i] = ' ';
        }
    } else {
        memcpy(dst, src, len);
    }
}


int gsw_substitute(u8 *buff, int bufflen, u8 *from, u8 *to, int add_apex) {
    int     fromlen = strlen(from),
            tolen   = strlen(to);
    u8      *p;

    while((p = (u8 *)stristr(buff, from))) {    // case insensitive
        if(add_apex && (*(p - 1) != '\"') && (p[fromlen] != '\"')) {
            memmove(p + 1 + tolen + 1, p + fromlen, bufflen + 1);
            *p++ = '\"';
            //memcpy(p, to, tolen);
            gsw_memcpy_filter(p, to, tolen, "\"\'");
            *(p + tolen) = '\"';
            tolen += 2;
        } else {
            memmove(p + tolen, p + fromlen, bufflen + 1);
            //memcpy(p, to, tolen);
            gsw_memcpy_filter(p, to, tolen, "\"\'");
        }
        bufflen += (tolen - fromlen);
    }
    return(bufflen);
}



u8 *gsw_http_value(u8 *req, u8 *par, u8 *value) {
    u8      *p;

    *(u8 **)par   = NULL;
    *(u8 **)value = NULL;

    p = strchr(req, '?');   /* par */
    if(p) {
        p++;
    } else {
        p = req;
    }
    *(u8 **)par = p;

    p = strchr(p, '=');     /* value */
    if(!p) return(NULL);
    *p++ = 0;
    *(u8 **)value = p;

    p = strchr(p, '&');     /* next */
    if(!p) return(NULL);
    *p++ = 0;
    return(p);
}



void gsw_http2chr(u8 *data, int len) {
    int     chr;
    u8      *out;

    for(out = data; len; out++, data++, len--) {
        if(*data == '%') {
            sscanf(data + 1, "%02x", &chr);
            *out = chr;
            len  -= 2;
            data += 2;
            continue;
        } else if(*data == '+') {
            *out = ' ';
        } else {
            *out = *data;
        }
    }
    *out = 0;
}



void gsweb_update(int sock) {
    GSWSEND(GSWDEFAULT3);
    GSWSEND(GSWUPDATE1);

    gsfullup_aluigi();
    if(
      (cool_download(FULLCFG,   ALUIGIHOST, 80, "papers/" FULLCFG) < 0) ||
      (cool_download(DETECTCFG, ALUIGIHOST, 80, "papers/" DETECTCFG) < 0)) {
        if(cool_download(KNOWNCFG, HOST, 28900, "software/services/index.aspx") > 0) {
            verify_gamespy();
        }
        cool_download(DETECTCFG, HOST, 28900,   "software/services/index.aspx?mode=detect");
    }

    GSWSEND(GSWUPDATE2);
}



void gsweb_update_aluigi(int sock) {
    GSWSEND(GSWDEFAULT3);
    GSWSEND(GSWUPDATE1);

    gsfullup_aluigi();
    cool_download(FULLCFG,   ALUIGIHOST, 80, "papers/" FULLCFG);
    cool_download(DETECTCFG, ALUIGIHOST, 80, "papers/" DETECTCFG);

    GSWSEND(GSWUPDATE2);
}



void gsweb_show_bottom(int sock, u8 *game, int servers, u8 *psa) {
    int     i,
            thisone = 0;
    u8      *filter = "",
            *filter_status;

    for(i = 0; i < gsw_tot; i++) {
        if(strcmp(gsw_data[i].game, game)) continue;
        filter  = gsw_data[i].filter;
        thisone = i;
        break;
    }
    if(filter[0]) {
        filter_status = "<b>ON</b>";
    } else {
        filter_status = "off";
    }
    if(gsw_filter[0]) {
        filter = gsw_filter;
        filter_status = "<b>ON (temp)</b>";
    }

    tcpspr(sock,
        "</table>"  // not closed before
        "%s"
        "<td width=\"12%%\">%s</td>"
        "<td width=\"12%%\">hosts %d</td>"
        "<td width=\"12%%\">filter %s</td>"
        "<td width=\"64%%\">"
        "<form action=\"list\" method=\"get\">"
        "<select name=\"game\">",
        GSWDEFAULT1,
        game,
        servers,
        filter_status);

    for(i = 0; i < gsw_tot; i++) {
        tcpspr(sock,
            "<option value=\"%s\"%s>%s",
            gsw_data[i].game,
            (i == thisone) ? " selected" : "",
            gsw_data[i].full);
    }

    tcpspr(sock,
        "</select>"
        " sort: "
        "<select name=\"sort\">"
        "<option value=\"%d\"%s>%s"
        "<option value=\"%d\">%s"
        "<option value=\"%d\">%s"
        "<option value=\"%d\">%s"
        "<option value=\"%d\"%s>%s"
        "<option value=\"%d\">%s"
        "<option value=\"%d\">%s"
        "<option value=\"%d\">%s"
        "<option value=\"%d\">%s"
        "<option value=\"%d\">%s"
        "<option value=\"%d\">%s"
        "<option value=\"%d\">%s"
        "<option value=\"%d\">%s",
        GSW_SORT_PING,      (myenctype >= 0) ? " selected" : "", "ping",
        GSW_SORT_NAME,      "name",
        GSW_SORT_MAP,       "map",
        GSW_SORT_TYPE,      "type",
        GSW_SORT_PLAYER,    (myenctype < 0) ? " selected" : "", "players",
        GSW_SORT_VER,       "version",
        GSW_SORT_MOD,       "mod",
        GSW_SORT_DED,       "dedicated",
        GSW_SORT_PWD,       "password",
        GSW_SORT_PB,        "punkbuster",
        GSW_SORT_RANK,      "ranked",
        GSW_SORT_MODE,      "mode",
        GSW_SORT_COUNTRY,   "country");

    if(gsw_refresh.len) {
        tcpspr(sock,
            "</select>"
            "<input type=\"submit\" value=\"LIST\">"
//            "<input type=\"hidden\" name=\"game\" value=\"%s\">"
            " ");
        if(myenctype >= 0) tcpspr(sock, "<input type=\"submit\" name=\"refresh\" value=\"REPING\">");

        tcpspr(sock,
            "</form>"
            "</td>"
            "</tr>"
            "</table>"
            "%s"
            "<td align=\"center\">%s</td>"
            "</tr>",
//            game,
            GSWDEFAULT1,
            psa);
    } else {
        tcpspr(sock,
            "</select>"
            "<input type=\"submit\" value=\"LIST\">"
            "</form>"
            "</td>"
            "</tr>"
            "</table>"
            "%s"
            "<td align=\"center\">%s</td>"
            "</tr>",
            GSWDEFAULT1,
            psa);
    }
}



void gsweb_index(int sock) {
    GSWSEND(gsw_skin_games);
    gsweb_show_bottom(sock, "", 0, "");
}



void gsweb_show_ipport(int sock, u8 *game, ipdata_t *gip, u8 *pass, int favport) {
    int     gyr = 0;    // 0 = g, 1 = y, 2 = r
    u8      mypass[64],
            myfav[256],
            *ipc,
            *entryc   = "",
            *playersc = "",
            *modec    = "",
            *ded      = "",
            *pwd      = "",
            *pwdc     = "",
            *pb       = "",
            *pbc      = "",
            *rank     = "";

#define GREEN   " class=\"g\""
#define YELLOW  " class=\"y\""
#define RED     " class=\"r\""
#define BLUE    " class=\"b\""
    entryc = GREEN;

    ipc = myinetntoa(gip->ip);
    if((gip->ded == '1')  || ((gip->ded | 0x20) == 't')) {
        ded = "D";
    }
    if((gip->pwd == '1')  || ((gip->pwd | 0x20) == 't')) {
        pwd  = "P";
        pwdc = YELLOW;
        gyr  = 1;
    }
    if((gip->pb  == '1')  || ((gip->pb  | 0x20) == 't')) {
        pb  = "PB";
        pbc = BLUE;
        //gyr = 1;
    }
    if((gip->rank == '1') || ((gip->rank | 0x20) == 't')) {
        rank = "R";
    }
    if(!gip->players) {
        playersc = YELLOW;
        gyr = 1;
    } else if(gip->players >= gip->max) {
        playersc = RED;
        gyr = 2;
    }
    if(!gip->max) {
        playersc = RED;
        gyr = 2;
    }
    if(gip->mode && strstr(gip->mode, "close")) {
        modec = RED;
        gyr = 2;
    }
    if(gyr == 1) {
        entryc = YELLOW;
    } else if(gyr == 2) {
        entryc = RED;
    }

    if(pass && *pass) {
        mysnprintf(mypass, sizeof(mypass), HTTPAMP "pass=%s", pass);
    } else {
        *mypass = 0;
    }

    if(favport) {
        mysnprintf(myfav, sizeof(myfav),
            //"<form action=\"fav\" method=get>"
            //"<input type=\"hidden\" name=\"ip\" value=\"%s\">"
            //"<input type=\"hidden\" name=\"port\" value=\"%hu\">"
            //"<input type=\"submit\" name=\"rem\" value=\"R\">"
            //"</form>",
            "<a href=\"fav?ip=%s" HTTPAMP "port=%hu" HTTPAMP "rem=1\"><b>x</b></a>",
            ipc, favport);
        // favport is REQUIRED because sometimes the query port is different than the game port...
    } else {
        //*myfav = 0;
        mysnprintf(myfav, sizeof(myfav),
            "<a href=\"fav?game=%s"  HTTPAMP "ip=%s" HTTPAMP "port=%hu" "%s" HTTPAMP "add=FAVORITE\"><b>o</b></a>",
            game, ipc, ntohs(gip->qport), mypass);
    }

    tcpspr(sock,
        "<tr>"
        "<td>%s</td>"           // fav
        "<td%s><a href=\"play?game=%s" HTTPAMP "ip=%s" HTTPAMP "port=%hu" "%s" "\">%s:%hu</a></td>"
        "<td>%.50s</td>"        // name
        "<td>%.50s</td>"        // map
        "<td>%.30s</td>"        // type
        "<td%s>%u/%u</td>"      // players
        "<td>%.30s</td>"        // version
        "<td>%.30s</td>"        // mod
        "<td>%s</td>"           // dedicated
        "<td%s>%s</td>"         // password
        "<td%s>%s</td>"         // punkbuster
        "<td>%s</td>"           // ranked/rated
        "<td%s>%.50s</td>"      // mode
        "<td>%s</td>"           // country
        "<td>%s</td>"           // query port
        "<td>%d</td>"           // ping
        "</tr>",
        myfav,
        entryc, game, ipc, ntohs(gip->port), mypass, ipc, ntohs(gip->port),
        gip->name    ? gip->name   : (u8 *)"",
        gip->map     ? gip->map    : (u8 *)"",
        gip->type    ? gip->type   : (u8 *)"",
        playersc, gip->players,
        gip->max,
        gip->ver     ? gip->ver    : (u8 *)"",
        gip->mod     ? gip->mod    : (u8 *)"",
        ded,
        pwdc, pwd,
        pbc, pb,
        rank,
        modec, gip->mode ? gip->mode : (u8 *)"",
        gip->country ? gip->country : (u8 *)"",
        (gip->port == gip->qport) ? (u8 *)"" : myitoa(ntohs(gip->qport)),
        gip->ping);

#undef GREEN
#undef YELLOW
#undef RED
#undef BLUE
}



void gsweb_join(int sock, u8 *req) {
    ipdata_t    *gip;
    ipport_t    ipport;
    u32     ping    = gsw_maxping;
    int     i,
            query   = -1,
            thisone = 0;
    u16     port    = 0;
    u8      tmpquery[GSWQUERYSZ + 1],
            *p,
            *par,
            *value,
            *game   = "",
            *ip     = NULL,
            *pass   = "";

    if(req) {
        p = req;
        do {
            p = gsw_http_value(p, (u8 *)&par, (u8 *)&value);
            if(!value) break;

            if(!strcmp(par, "ip")) {
                ip = value;

            } else if(!strcmp(par, "port")) {
                port = atoi(value);

            } else if(!strcmp(par, "game")) {
                game = value;

            } else if(!strcmp(par, "ping")) {
                ping = atoi(value);

            } else if(!strcmp(par, "query")) {
                query = atoi(value);

            } else if(!strcmp(par, "pass")) {
                pass = value;
            }
        } while(p);
    }

    GSWSEND(GSWDEFAULT3);

    for(i = 0; i < gsw_tot; i++) {
        if(strcmp(gsw_data[i].game, game)) continue;
        thisone = i;
        break;
    }

    GSWSEND(
        "<tr>"
        "<td>"
        "IP:PORT");

    tcpspr(sock,        /* PING */
        "<form action=\"join\" method=get>"
        "<input type=\"text\" name=\"ip\" value=\"%s%s%s\" size=21>"
        "%s"
        "<input type=\"submit\" value=\"PING\">"
        "</form>",
        ip   ? ip           : (u8 *)"",
        port ? ":"          : "",
        port ? myitoa(port) : (u8 *)"",
        gsw_calc_query(tmpquery, 0));

    tcpspr(sock,        /* PING2 */
        "<form action=\"join\" method=get>"
        "<input type=\"text\" name=\"ip\" value=\"%s%s%s\" size=21>"
        "<select name=\"game\">",
        ip   ? ip           : (u8 *)"",
        port ? ":"          : "",
        port ? myitoa(port) : (u8 *)"");

    for(i = 0; i < gsw_tot; i++) {
        tcpspr(sock,
            "<option value=\"%s\"%s>%s",
            gsw_data[i].game,
            (i == thisone) ? " selected" : "",
            gsw_data[i].full);
    }

    GSWSEND(
        "</select>"
        "<input type=\"submit\" value=\"PING\">"
        "</form>"
    );

    tcpspr(sock,        /* JOIN */
        "<form action=\"play\" method=get>"
        "<input type=\"text\" name=\"ip\" value=\"%s%s%s\" size=21>"
        "<select name=\"game\">",
        ip   ? ip           : (u8 *)"",
        port ? ":"          : "",
        port ? myitoa(port) : (u8 *)"");

    for(i = 0; i < gsw_tot; i++) {
        tcpspr(sock,
            "<option value=\"%s\"%s>%s",
            gsw_data[i].game,
            (i == thisone) ? " selected" : "",
            gsw_data[i].full);
    }

    GSWSEND(
        "</select>"
        "password:<input type=\"password\" name=\"pass\" value=\"\" size=10>"
        "<input type=\"submit\" value=\"JOIN\">"
        "</form>"
    );

    tcpspr(sock,        /* FAV */
        "<form action=\"fav\" method=get>"
        "<input type=\"text\" name=\"ip\" value=\"%s%s%s\" size=21>"
        "<select name=\"game\">",
        ip   ? ip           : (u8 *)"",
        port ? ":"          : "",
        port ? myitoa(port) : (u8 *)"");

    for(i = 0; i < gsw_tot; i++) {
        tcpspr(sock,
            "<option value=\"%s\"%s>%s",
            gsw_data[i].game,
            (i == thisone) ? " selected" : "",
            gsw_data[i].full);
    }

    GSWSEND(
        "</select>"
        "password:<input type=\"password\" name=\"pass\" value=\"\" size=10>"
        "<input type=\"submit\" name=\"add\" value=\"FAVORITE\">"
        "</form>"
    );

    GSWSEND("</td></tr>");

    if(!ip) return;

    p = strchr(ip, ':');
    if(p) {
        *p = 0;
        port = atoi(p + 1);
    }

    if(!port) {
        GSWSEND("<br>No valid port specified, use IP:PORT<br>");
        return;
    }
    if(query < 0) {
        if(!*game) return;
        query = gsw_get_query_for_game(game);
    }

    GSWSEND(gsw_skin_games);

    ipport.ip   = resolv(ip);
    ipport.port = htons(port);

    gip = calloc(2, sizeof(ipdata_t));
    if(!gip) std_err();

    multi_scan(game, query, &ipport, 1, gip, ping);
    if(gip[0].sort == IPDATA_SORT_CLEAR) gip[0].ping = 0;
    gsweb_show_ipport(sock, game, &gip[0], "", 0);

    free_ipdata(gip, 2);

    GSWSEND("</table>");
}



void gsweb_fav(int sock, u8 *req) {
    ipdata_t    *gip;
    ipport_t    ipport;
    in_addr_t   ip;
    int     i,
            query,
            op      = 0;
    u16     port    = 0;
    u8      *p,
            *par,
            *value,
            *game   = "",
            *ipc    = NULL,
            *pass   = "";

    if(req) {
        p = req;
        do {
            p = gsw_http_value(p, (u8 *)&par, (u8 *)&value);
            if(!value) break;

            if(!strcmp(par, "ip")) {
                ipc = value;

            } else if(!strcmp(par, "port")) {
                port = atoi(value);

            } else if(!strcmp(par, "game")) {
                game = value;

            } else if(!strcmp(par, "pass")) {
                pass = value;

            } else if(!strcmp(par, "add")) {
                op = 1;

            } else if(!strcmp(par, "rem")) {
                op = 2;
            }
        } while(p);

        if(!ipc || !port) return;

        p = strchr(ipc, ':');
        if(p) {
            *p = 0;
            port = atoi(p + 1);
        }
        ip = resolv(ipc);

        if(op == 1) {
            for(i = 0; i < gsw_fav_tot; i++) {
                if((gsw_fav_data[i].ip == ip) && (gsw_fav_data[i].port == port)) return;
            }


            gsw_fav_data = realloc((u8 *)gsw_fav_data, (gsw_fav_tot + 1) * sizeof(gsw_fav_data_t));
            if(!gsw_data) std_err();
            memset(&gsw_fav_data[gsw_fav_tot], 0, sizeof(gsw_fav_data_t));

            MYDUP(gsw_fav_data[gsw_fav_tot].game, game);
            gsw_fav_data[gsw_fav_tot].ip          = ip;
            gsw_fav_data[gsw_fav_tot].port        = port;
            MYDUP(gsw_fav_data[gsw_fav_tot].pass, pass);

            gsw_fav_tot++;
            gsweb_saveconf(0);

            GSWSEND("server added to favorites");
            return;

        } else if(op == 2) {
            for(i = 0; i < gsw_fav_tot; i++) {
                if((gsw_fav_data[i].ip == ip) && (gsw_fav_data[i].port == port)) break;
            }
            if(i < gsw_fav_tot) {
                gsw_fav_tot--;
                if(i != gsw_fav_tot) {
                    memmove(&gsw_fav_data[i], &gsw_fav_data[gsw_fav_tot], sizeof(gsw_fav_data_t));
                }
                gsweb_saveconf(0);
            }
            GSWSEND("server removed from favorites");
            return;
        }
    }

    GSWSEND(gsw_skin_games);

    gip = calloc(2, sizeof(ipdata_t));
    if(!gip) std_err();

    for(i = 0; i < gsw_fav_tot; i++) {
        ipport.ip   = gsw_fav_data[i].ip;
        ipport.port = htons(gsw_fav_data[i].port);
        query       = gsw_get_query_for_game(gsw_fav_data[i].game);

        memset(gip, 0, sizeof(ipdata_t));
        multi_scan(game, query, &ipport, 1, gip, gsw_maxping);
        if(gip[0].sort == IPDATA_SORT_CLEAR) gip[0].ping = 0;
        gsweb_show_ipport(sock, gsw_fav_data[i].game, &gip[0], gsw_fav_data[i].pass, gsw_fav_data[i].port);
    }

    free_ipdata(gip, 2);

    GSWSEND("</table><table><br><br>if all the servers of one game can't be queried go in the &quot;Config&quot; section and choose a different &quot;query&quot; for that game,<br>for example replace &quot;Gamespy \\status\\&quot; with &quot;Gamespy 3&quot;");
}



int enctypex_info_to_gip(ipdata_t *gip, u8 *data) {
    int     i,
            t,
            nt = 0;
    u8      *p,
            *port,
            *par    = NULL,
            *limit;

    limit = data + strlen(data);

    //memset(gip, 0, sizeof(ipdata_t)); not needed

    port = strchr(data, ':');
    if(!port) return(-1);
    port++;
    p = strchr(port, ' ');
    if(!p) return(-1);

    port[-1] = 0;
    *p++ = 0;
    if(*p == '\\') *p++ = 0;    // avoid possible bug

    gip->ip     = resolv(data);
    gip->port   = htons(atoi(port));
    gip->qport  = gip->port;

    for(data = p; data < limit; data = p + 1, nt++) {
        p = strchr(data, '\\');
        if(p) *p = 0;

        if(nt & 1) {
            if(par) {
                for(i = 1; i < 8192; i <<= 1) { // value referred to handle_query_par
                    t = handle_query_par(par, i);
                    if(!handle_query_val(data, t, gip)) break;
                }
            }
        } else {
            if(!*data) break;
            par  = data;
        }
        if(!p) break;
    }

    if(geoipx) {
        gip->country = (void *)GeoIP_country_code_by_addr(geoipx, myinetntoa(gip->ip));
    }
    return(0);
}



int enctypeX_to_gsweb(ipdata_t *gip, u8 *buff, enctypex_data_t *enctypex_data) {
    int     len,
            servers;
    u8      enctypex_info[QUERYSZ];

    servers = 0;
    for(len = 0;;) {
        len = enctypex_decoder_convert_to_ipport(buff + enctypex_data->start, enctypex_data->offset - enctypex_data->start, NULL, enctypex_info, sizeof(enctypex_info), len);
        if(len <= 0) break;
        if(enctypex_info_to_gip(&gip[servers], enctypex_info) < 0) continue;
        servers++;
    }
    return(servers);
}



void gsweb_list(int sock, u8 *req) {
    enctypex_data_t enctypex_data;
    ipdata_t    *gip;
    ipport_t    *ipport;
    struct  sockaddr_in peer;
    u32     ping;
    int     i,
            servers   = 0,
            sd,
            len,
            dynsz,
            query,
            refresh   = 0,
            sort_type = GSW_SORT_PING,
            free_servers,
            itsok;
    u8      *buff     = NULL,
            psa[280],
            *gamestr  = "",
            *gamekey  = "",
            *filter   = "",
            validate[89],
            secure[66],
            *p,
            *par,
            *value,
            *enctypextmp     = NULL;

    if(!req) {
        gsweb_index(sock);
        return;
    }

    if(myenctype < 0) {
        sort_type = GSW_SORT_PLAYER;
    }

    ping  = gsw_maxping;
    query = -1;
    p     = req;
    do {
        p = gsw_http_value(p, (u8 *)&par, (u8 *)&value);
        if(!value) break;

        if(!strcmp(par, "game")) {
            if(*value) gamestr = value;

        } else if(!strcmp(par, "ping")) {
            ping = atoi(value);

        } else if(!strcmp(par, "query")) {
            query = atoi(value);

        } else if(!strcmp(par, "key")) {
            gamekey = value;

        } else if(!strcmp(par, "filter")) {
            filter = value;

        } else if(!strcmp(par, "refresh")) {
            refresh = 1;

        } else if(!strcmp(par, "sort")) {
            sort_type = atoi(value);
        }
    } while(p);

    if(!gamestr || !*gamestr) goto quit;

    i = gsw_game_exists(gamestr);
    if(i < 0) {
        if(query < 0) query = 0;    /* default \status\ */
    } else {
        if(!*gamestr) gamestr = gsw_data[i].game;
        if(query < 0) query   = gsw_data[i].query;
        if(!*filter)  filter  = gsw_data[i].filter;
    }
    if(gsw_filter[0]) filter = gsw_filter;

    if(gsw_allow_refresh && refresh && gsw_refresh.game && !strcmp(gsw_refresh.game, gamestr)) {
        len    = gsw_refresh.len;
        ipport = (ipport_t *)gsw_refresh.buff;
        goto scanner;
    } else {
        refresh = 0;
        FREEX(gsw_refresh.buff);
        gsw_refresh.game = NULL;
        gsw_refresh.buff = NULL;
        gsw_refresh.len  = 0;
    }

    gslist_step_1(gamestr, filter);

    peer.sin_addr.s_addr = msip;
    peer.sin_port        = htons(msport);
    peer.sin_family      = AF_INET;

    buff = malloc(BUFFSZ + 1);
    if(!buff) std_err();
    dynsz = BUFFSZ;

    sd = gslist_step_2(&peer, buff, secure, gamestr, validate, filter, &enctypex_data);
    if(sd < 0) {
        if(!quiet) fputs("- connection refused\n", stderr);
        goto quit;
    }

    ipport = gslist_step_3(sd, validate, &enctypex_data, &len, &buff, &dynsz);

    itsok = gslist_step_4(secure, buff, &enctypex_data, &ipport, &len);

scanner:
    GSWSEND(gsw_skin_games);

    if(!len) goto quit;

    servers = (len / 6) + 1;                    /* +1 is needed for zeroing the latest IP! */
    free_servers = servers;                     /* do NOT touch */
    gip = calloc(servers, sizeof(ipdata_t));    /* calloc for zeroing everything */
    if(!gip) std_err();
    for(i = 0; i < servers; i++) {
        gip[i].ping = -1;
    }

    if(gsw_maxservers && (gsw_maxservers < servers) && !quiet) {
        fprintf(stderr, "- limit warning: ping %d servers\n", servers);
    }

    if(myenctype < 0) {
        if(ipport) {
            servers = enctypeX_to_gsweb(gip, buff, &enctypex_data);
        } else {
            servers = 0;
        }
    } else {
        servers = multi_scan(gamestr, query, ipport, servers - 1, gip, ping);
    }

    if(gsw_allow_refresh && !refresh) {
        len = servers * 6;
        FREEX(gsw_refresh.buff);
        gsw_refresh.buff = malloc(len);
        if(!gsw_refresh.buff) std_err();
        if(ipport) memcpy(gsw_refresh.buff, ipport, len);
        MYDUP(gsw_refresh.game, gamestr);
        gsw_refresh.len  = len;
    }

    if(gsw_maxservers && (gsw_maxservers < servers)) {
        servers = gsw_maxservers;
    }

    gsw_sort_IP(gip, servers, sort_type);
    for(i = 0; i < servers; i++) {
        if(gsw_noping && (gip[i].sort == IPDATA_SORT_CLEAR)) continue;
        gsweb_show_ipport(sock, gamestr, &gip[i], "", 0);
    }

    free_ipdata(gip, free_servers);

quit:
    if(!gsw_read_cfg_value(DETECTCFG, gamestr, "PSA", psa, sizeof(psa), NULL)) {
        *psa = 0;
    }
    FREEX(enctypextmp);
    FREEX(buff);

    gsweb_show_bottom(sock, gamestr, servers, psa);
}



void gsweb_clean_exec(u8 *data) {
    u8      *p;

    for(p = data; *p; p++) {
        if(strchr("><;&|", *p)) *p = ' ';
    }
}



void gsweb_play(int sock, u8 *req, int localip) {
    int     i = -1,
            len,
            ret;
    u8      buff[FULLSZ + 128],
            *exe,
            *p,
            *l,
            *par,
            *value,
            *ip   = NULL,
            *port = NULL,
            *pass = NULL;

    if(!req) {
        gsweb_index(sock);
        return;
    }

    p = req;
    do {
        p = gsw_http_value(p, (u8 *)&par, (u8 *)&value);
        if(!value) break;

        if(!strcmp(par, "game")) {
            i = gsw_game_exists(value);

        } else if(!strcmp(par, "ip")) {
            ip = value;

        } else if(!strcmp(par, "port")) {
            port = value;

        } else if(!strcmp(par, "pass")) {   /* works but is manual for the moment! */
            pass = value;
        }
    } while(p);

    if(!ip || !port || (i < 0)) {
        gsweb_index(sock);
        return;
    }

    exe = strrchr(gsw_data[i].path, PATH_SLASH);
    if(exe) {
        *exe = 0;
        ret = chdir(gsw_data[i].path);
        *exe = PATH_SLASH;
        if(ret < 0) {
            tcpspr(sock,
                "<br><br>Error while entering in the game folder: %s<br>",
                gsw_data[i].path);
            return;
        }
        exe++;
    } else {
        exe = gsw_data[i].path;
    }
#ifndef WIN32
    p = malloc(strlen(exe) + 3);
    sprintf(p, "./%s", exe);
    exe = p;
#endif

    if(!exe || !exe[0]) {
        tcpspr(sock,
            "<br><br>Error: there is no executable path assigned to this game, set it in <a href=\"config\">Config</a><br>",
            gsw_data[i].path);
        return;
    }

    GSWSEND(GSWDEFAULT3);

    len = gsw_read_cfg_value(FULLCFG, gsw_data[i].game, "jointemplate", buff, FULLSZ, NULL);
    if(len) {
        len = gsw_substitute(buff, len, "#EXEPATH#",     exe,        1);
        len = gsw_substitute(buff, len, "#SERVERIP#",    ip,         0);
        len = gsw_substitute(buff, len, "#SERVERPORT#",  port,       0);
        len = gsw_substitute(buff, len, "#PLAYERNAME#",  gsw_player, 1);
        len = gsw_substitute(buff, len, "#PLAYER#",      gsw_player, 1);

            /* NOT YET SUPPORTED!!! */
        len = gsw_substitute(buff, len, "#LOCALIP#",     "",         0);
        len = gsw_substitute(buff, len, "#ALLIPS#",      "",         0);
        len = gsw_substitute(buff, len, "#GAMEVARIANT#", "",         1);
        len = gsw_substitute(buff, len, "#ROOMNAME#",    "",         1);
        len = gsw_substitute(buff, len, "#GROUPID#",     "",         1);
        len = gsw_substitute(buff, len, "#PLAYEREMAIL#", "",         1);
        len = gsw_substitute(buff, len, "#PLAYERPID#",   "",         1);
        len = gsw_substitute(buff, len, "#PLAYERPW#",    "",         1);
        len = gsw_substitute(buff, len, "#PASSWORD#",    "",         1);
        len = gsw_substitute(buff, len, "#GPNAME#",      "",         1);
        len = gsw_substitute(buff, len, "#CHATNAME#",    "",         1);
        len = gsw_substitute(buff, len, "#GAMETYPE#",    "",         1);
        len = gsw_substitute(buff, len, "#MAXCLIENTS#",  "",         1);
        len = gsw_substitute(buff, len, "#GAMETYPECMD#", "",         1);

        // #RULE(gamever)#
        // #RULE('gamever')#
        // #REGVAL(HKEY_LOCAL_MACHINE\Software\Monolith Productions\Aliens vs. Predator 2\1.0\InstallDir)#

        p = strstr(buff, "[$SERVERPW$");
        if(p) {
            if(pass) {
                memmove(p, p + 11, (len + 1) - 11);
                len = gsw_substitute(buff, len - 11, "#SERVERPW#", pass,  1);
                l = strchr(p, ']');
                if(l) {
                    memmove(l, l + 1, (len + 1) - (l - buff));
                    len--;
                }
            } else {
                l = strchr(p, ']');
                if(l) {
                    l++;
                } else {
                    l = buff + len;
                }
                memmove(p, l, (len + 1) - (l - buff));
                len -= (l - p);
            }
        }

    } else {
        if(!quiet) fprintf(stderr, "- this game doesn't support direct IP join, I launch the game\n");
        len = sprintf(buff, "\"%s\"", exe);
    }

#ifndef WIN32
    FREEX(exe);
#endif

    if(localip && !quiet) fprintf(stderr, "- Execute: %s\n", buff);
    send(sock, buff, len, 0);

    if(!localip) return;

    p = strchr(buff + 1, '\"');
    if(p != (buff + 1)) {

        gsweb_clean_exec(buff);
        gsweb_clean_exec(p);

#ifdef WIN32
        if(p) {
            p++;
            *p = 0;
            p++;
        }

        ret = (int)ShellExecute(
            NULL,
            "open",
            buff,
            p,
            NULL,
            SW_SHOW);
#else
        strcat(buff, " &");
        ret = system(buff);
#endif

        tcpspr(sock, "<br><br>Return code %d<br>", ret);
    }
}



void gsweb_show_filter_option(int sock, u8 *name, u8 *val1, u8 *op, u8 *val2) {
    tcpspr(sock,    // lame solution, consider it a work-around
        "<tr>"
        "<td><b>%s</b></td>"
        "<td><input type=\"hidden\" name=\"op\" value=\"%s\"></td>"
        "<td><input type=\"checkbox\" name=\"%s\" value=\"%s\"></td>"
        GSWFILTERX,
        name,
        op,
        val1,
        val2);
}



void gsweb_show_filter(int sock, u8 *name, int type) {
#define TEXT1   "<option value=\"LIKE\">equal"          \
                "<option value=\"NOT LIKE\">different"
#define TEXT2   "<option value=\"&gt;\">major"          \
                "<option value=\"&lt;\">minor"          \
                "<option value=\"=\">equal"             \
                "<option value=\"!=\">different"        \
                "<option value=\"&gt;=\">major equal"   \
                "<option value=\"&lt;=\">minor equal"

    tcpspr(sock,
        "<tr>"
        "<td><b>%s</b></td>"
        "<td>"
        "<select name=\"op\">"
        "%s"
        "</select>"
        "</td>"
        "<td><input type=\"text\" name=\"%s\" size=33></td>"
        GSWFILTERX,
        name,
        type ? TEXT2 : TEXT1,
        name);

#undef TEXT1
#undef TEXT2
}



void gsweb_set_filter(int sock, u8 *req) {
    int     i,
            mlen;
    u8      *p,
            *f,
            *par,
            *value,
            *op;

    if(req) {
        mlen = strlen(req);
        p = req;
        do {
            p = gsw_http_value(p, (u8 *)&par, (u8 *)&value);
            if(!value) break;

            if(!strcmp(par, "full")) {
                MYDUP(gsw_filter, value);
                continue;
            }

            FREEX(gsw_filter);
            gsw_filter = malloc((mlen * 3) + 1);    /* not really right */
            if(!gsw_filter) std_err();

            f = gsw_filter;
            *f++ = '(';
            op = value;         /* avoid errors */
            do {
                if(!strcmp(par, "op")) {
                    op = value;
                    if(!*op) op = "==";

                } else if(!strcmp(par, "more") && *value) {
                    if((*(f - 1) == ')')) {
                        f += sprintf(f, " %s ", value);
                    }

                } else if(*value && (*(value + 1) != '\'')) {
                    f += sprintf(f,
                        "(%s %s %s%s%s)",
                        par, op,
                        (*op >= 'A') ? "'" : "",
                        value,
                        (*op >= 'A') ? "'" : "");
                }
                if(!p) break;
                p = gsw_http_value(p, (u8 *)&par, (u8 *)&value);
            } while(value);

            if(*(f - 1) == '(') {
                f--;
            } else {
                if(*(f - 1) == ' ') {
                    for(f--; *f != ')'; f--);
                    f++;
                }
                *f++ = ')';
            }
            *f = 0;
        } while(p);
    }

    GSWSEND(GSWDEFAULT3);

    tcpspr(sock,
        "%s"
        "%s"
        "<b>current filter</b><br>"
        "you can set it manually with the following entry or using the various options below<br>"
        "<input type=\"text\" name=\"full\" value=\"%s\" size=64>"
        "%s"
        "%s"
        "%s",
        GSWFILTER1,
        GSWFILTER2,
        gsw_filter,
        GSWFILTER3,
        GSWDEFAULT2,
        GSWFILTER2);

    gsweb_show_filter(sock, "hostaddr",  0);
    gsweb_show_filter(sock, "hostport",  1);
    gsweb_show_filter(sock, "gamever",   1);

    GSWSEND(
        "<tr>"
        "<td><b>country</b></td>"
        "<td></td>"
        "<td>"
        "<input type=\"hidden\" name=\"op\" value=\"LIKE\">"
        "<select name=\"country\">");

    for(i = 0; countries[i][0]; i++) {
        tcpspr(sock,
            "<option value=\"%s\">%s",
            (*countries[i][0] != '[') ? countries[i][0] : "",
            countries[i][1]);
    }

    GSWSEND("</select></td>");
    GSWSEND(GSWFILTERX);

    gsweb_show_filter(sock, "hostname",   0);
    gsweb_show_filter(sock, "mapname",    0);
    gsweb_show_filter(sock, "gametype",   0);
    gsweb_show_filter(sock, "gamemode",   0);
    gsweb_show_filter(sock, "numplayers", 1);
    gsweb_show_filter(sock, "maxplayers", 1);
    gsweb_show_filter_option(sock, "no empty",       "numplayers",    ">",  "0");
    gsweb_show_filter_option(sock, "no full",        "numplayers",    "<",  "maxplayers");
    gsweb_show_filter_option(sock, "no password*",   "password",      "!=", "1");
    gsweb_show_filter_option(sock, "no punkbuster*", "sv_punkbuster", "!=", "1");
    gsweb_show_filter_option(sock, "punkbuster*",    "sv_punkbuster", "==", "1");

    GSWSEND(GSWFILTER4);
}



void gsw_config_form(int sock, u8 *msg, u8 *name, u8 *value, int input_size) {
    tcpspr(sock,
        "<tr>"
        "<td>"
        "<b>%s</b>"
        "<form action=\"config\" method=get>"
        "<input type=\"text\" name=\"%s\" value=\"%s\" size=%d>"
        "<input type=\"submit\" value=\"save\">"
        "</form>"
        "<br>"  // useful
        "</td>"
        "</tr>",
        msg,
        name,
        value,
        input_size);
}



void gsw_config_form_game(int sock, int pos) {
    u8      tmpquery[GSWQUERYSZ + 1];

    tcpspr(sock,
        "<tr>"
        "<td>"
        "<br>"  // useful
        "<center><b>%s</b></center>"
        "<center>(%s)</center>"
        "<form action=\"config\" method=get>"
        "<input type=\"hidden\" name=\"game\" value=\"%s\">gamename<br>"
        "<input type=\"text\" name=\"path\" value=\"%s\" size=50> executable's path<br>"
        "<input type=\"file\" size=30> find the game's executable and paste the link in the path entry <u>above</u>!<br>"
        "%s query<br>",
        gsw_data[pos].full,
        gsw_data[pos].game,
        gsw_data[pos].game,
        gsw_data[pos].path,
        gsw_calc_query(tmpquery, gsw_data[pos].query));

    if(gsw_filter && gsw_filter[0]) {
        tcpspr(sock,
            "<input type=\"submit\" name=\"filter\" value=\"%s\"> apply the current temporary <a href=\"filter\">filter</a><br>",
            gsw_filter);
    }
    if(gsw_data[pos].filter && gsw_data[pos].filter[0]) {
        tcpspr(sock,
            "<input type=\"text\" name=\"filter\" value=\"%s\" size=70> filter currently in use for this game<br>"
            "<input type=\"submit\" name=\"filter\" value=\"reset\"> reset the game's filter<br>",
            gsw_data[pos].filter);
    } else {
        tcpspr(sock,
            "<input type=\"text\" name=\"filter\" value=\"\" size=1> no custom filter currently in use for this game, go in <a href=\"/filter\">Filter</a> first<br>");
    }
    tcpspr(sock,
        "<input type=\"submit\" name=\"remove\" value=\"remove\"> remove this game entry from Gslist<br>"
        "<input type=\"submit\" value=\"save\"> confirm the changes for this game entry"
        "</form>"
        "<br>"  // useful
        "</td>"
        "</tr>");
}



void gsweb_config(int sock, u8 *req) {
    int     i = -1,
            saveme = 0;
    u8      *p,
            *par,
            *value;

    if(req) {
        p = req;
        do {
            p = gsw_http_value(p, (u8 *)&par, (u8 *)&value);
            if(!value) break;

            if(!strcmp(par, "player")) {
                MYDUP(gsw_player, value);
                saveme++;

            } else if(!strcmp(par, "game")) {
                i = gsw_game_exists(value);
                if(i < 0) continue;

            } else if(!strcmp(par, "path")) {
                if(i < 0) continue;
                MYDUP(gsw_data[i].path, value);
                saveme++;

            } else if(!strcmp(par, "query")) {
                if(i < 0) continue;
                gsw_data[i].query  = atoi(value);
                saveme++;

            } else if(!strcmp(par, "filter")) {
                if(i < 0) continue;
                MYDUP(gsw_data[i].filter, value);
                saveme++;

            } else if(!strcmp(par, "remove")) {
                if(i < 0) continue;
                gsw_tot--;
                if(i != gsw_tot) {
                    memmove(&gsw_data[i], &gsw_data[gsw_tot], sizeof(gsw_data_t));
                    gsw_sort_game_description();
                }
                saveme++;

            } if(!strcmp(par, "maxping")) {
                gsw_maxping = atoi(value);
                saveme++;

            } if(!strcmp(par, "noping")) {
                atoi(value) ? (gsw_noping = 1) : (gsw_noping = 0);
                saveme++;

            } if(!strcmp(par, "maxservers")) {
                gsw_maxservers = atoi(value);
                saveme++;

            } if(!strcmp(par, "font_size")) {
                gsw_apply_font(atoi(value));
                saveme++;

            } if(!strcmp(par, "enctype")) {
                myenctype = atoi(value);
                saveme++;
            }
        } while(p);
    }

    if(saveme) gsweb_saveconf(0);

    GSWSEND(GSWDEFAULT4);

    gsw_config_form(sock,
        "Player name",
        "player",
        gsw_player,
        64);

    for(i = 0; i < gsw_tot; i++) {
        gsw_config_form_game(sock, i);
    }

    gsw_config_form(sock,
        "Max ping timeout in seconds",
        "maxping",
        myitoa(gsw_maxping),
        10);

    gsw_config_form(sock,
        "set to 1 for not showing the unpingable (no replies) servers",
        "noping",
        myitoa(gsw_noping),
        10);

    gsw_config_form(sock,
        "Max servers visualized (0 for no limit)",
        "maxservers",
        myitoa(gsw_maxservers),
        10);

    gsw_config_form(sock,
        "Font size",
        "font_size",
        myitoa(gsw_font_size),
        10);

    gsw_config_form(sock,
        "Enctype: -1 is fast but shows no pings while 1 and 2 show pings but are slower",
        "enctype",
        myitoa(myenctype),
        10);
}



int gsw_game_cmp(u8 *s1, u8 *s2) {
    while(*s1) {
        if(*s1 != *s2) return(1);
        s1++;
        s2++;
    }
    return(0);
}



int gsw_get_query(u8 *game, FILE *fastfd) {
    u8      tmp[FULLSZ + 1],
            tmpgame[CNAMELEN + 1],
            *p;

    mystrcpy(tmpgame, game, sizeof(tmpgame));
    p = tmpgame + strlen(tmpgame) - 3;
    if(!strcmp(p, "ps2")) strcpy(p, "pc");

    if(gsw_read_cfg_value(fastfd ? NULL : FULLCFG, tmpgame, "serverclass", tmp, sizeof(tmp), fastfd) ||
       gsw_read_cfg_value(fastfd ? NULL : FULLCFG, tmpgame, "veserverclass", tmp, sizeof(tmp), fastfd)) {
        if(!strcmp(tmp, "qr2")) {
            return(8);
        } else if(!strcmp(tmp, "quake3")) {
            return(1);
        } else if(!strcmp(tmp, "doom3")) {
            return(6);
        } else if(!strcmp(tmp, "halflife")) {
            return(4);
        } else if(!strcmp(tmp, "source")) {
            return(9);
        } else if(!strcmp(tmp, "tribes2")) {
            return(10);
        }
    }

    /* work-arounds */
    #define W(x,y)  if(!gsw_game_cmp(x, tmpgame)) return(y);

         W("closecomftf",   8)
    else W("cmr4p",         8)
    else W("cmr5p",         8)
    else W("halflife",      4)
    else W("juiced",        8)
    else W("mclub2",        8)
    else W("mclub3",        8)
    else W("quake3",        1)
    else W("racedriver2",   8)
    else W("source",        9)
    else W("stef1",         1)

    #undef W

    return(0);
}



int gsweb_add_game(u8 *game, u8 *full, u8 *path) {
    if(!game || !full) return(-1);
    if(!path) path = "";
    if(gsw_game_exists(game) >= 0) return(-1);

    gsw_data = realloc((u8 *)gsw_data, (gsw_tot + 1) * sizeof(gsw_data_t));
    if(!gsw_data) std_err();                            /* if the adding fails we will continue  */
    memset(&gsw_data[gsw_tot], 0, sizeof(gsw_data_t));  /* to have an allocated buffer for later */

    MYDUP(gsw_data[gsw_tot].game,   game);
    MYDUP(gsw_data[gsw_tot].path,   path);
    MYDUP(gsw_data[gsw_tot].key,    "");
    MYDUP(gsw_data[gsw_tot].filter, "");

/*
    get_key(game, gsw_data[gsw_tot].key, gsw_data[gsw_tot].full);
  GAMEKEY is no longer supported
  but can be easily re-implemented
  in any moment if needed
*/

    if(full[0]) MYDUP(gsw_data[gsw_tot].full, full);
    if(path)    MYDUP(gsw_data[gsw_tot].path, path);
    gsw_data[gsw_tot].query = gsw_get_query(game, NULL);
    gsw_tot++;

    gsw_sort_game_description(); // sorting
    return(0);
}



void gsweb_add(int sock, u8 *req, int fast) {
    u8      *p,
            *par,
            *value,
            *game = NULL,
            *full = NULL,
            *path = NULL;

    if(!req) {
        gsweb_index(sock);
        return;
    }

    p = req;
    do {
        p = gsw_http_value(p, (u8 *)&par, (u8 *)&value);
        if(!value) break;

        if(!strcmp(par, "game")) {
            game = value;

        } else if(!strcmp(par, "full")) {
            full = value;

        } else if(!strcmp(par, "path")) {
            path = value;
        }
    } while(p);

    if(!gsweb_add_game(game, full, path)) {
        gsweb_saveconf(0);
    }

    if(fast) return;
    gsweb_config(sock, NULL);
}



void gsweb_search(int sock, u8 *req) {
    FILE    *fd,
            *fastfd;
    u8      buff[GSLISTSZ + 1],
            tmpquery[GSWQUERYSZ + 1],
            url[FULLSZ + 1],
            tmpfull[CFNAMELEN + 1],
            *p,
            *f,
            *par,
            *value,
            *game;

    fd = gslfopen(GSLISTCFG, "rb");
    if(!fd) {
        gsweb_update(sock);
        return;
    }

    GSWSEND(GSWDEFAULT1);
    GSWSEND(GSWSEARCHT);

    if(req) {
        p = req;
        req = NULL;
        do {
            p = gsw_http_value(p, (u8 *)&par, (u8 *)&value);
            if(!value) break;

            if(!strcmp(par, "q")) {
                req = value;    // req has a double use here
            }
        } while(p);
    }

    if(!req) goto goto_gsweb_search;

    fastfd = gslfopen(FULLCFG, "rb");   // avoids fopen/fclose
    if(!fastfd) {
        gsweb_update(sock);
        return;
    }

    while(fgets(buff, sizeof(buff), fd)) {
        if(stristr(buff, req) || !*req) {
            zero_equal(buff + CFNAMEEND);
            zero_equal(buff + CNAMEEND);
            if(buff[CKEYOFF] > ' ') {
                buff[CKEYOFF + 6] = 0;
            } else {
                buff[CKEYOFF] = 0;
            }
            game = buff + CNAMEOFF;

            if(!gsw_read_cfg_value(NULL, game, "newsurl", url, sizeof(url), fastfd)) {
                *url = 0;
            }

            p = buff + CFNAMEOFF;
            f = tmpfull;
            while(*p) {
                if(*p == ' ') {
                    *f = '+';
                } else {
                    *f = *p;
                }
                p++;
                f++;
            }
            strcpy(tmpfull, buff + CFNAMEOFF);  // required for the spaces
            for(p = tmpfull; *p; p++) {
                if(*p == ' ') *p = '+';
            }

            tcpspr(sock,
                "<tr>"
                "<td>%s</td>"
                "<td>%s</td>"
                "<td>%s</td>"
                "<td><a href=\"add?game=%s"  HTTPAMP "full=%s\">O</a></td>"
                "<td><a href=\"list?game=%s" HTTPAMP "ping=0\">O</a></td>"
                "<td>"
                "<form action=\"list\" method=get>"
                "<input type=\"hidden\" name=\"game\" value=\"%s\">"
                "%s"
                "<input type=\"submit\" value=\"O\">"
                "</form></td>"
                "<td>%s%s%s</td>"
                "</tr>",
                buff + CFNAMEOFF,
                game,
                buff + CKEYOFF,
                game,
                tmpfull,
                game,
                game,
                (myenctype < 0) ? (u8 *)"enctypeX" : gsw_calc_query(tmpquery, gsw_get_query(game, fastfd)),
                *url ? "<a href=\"" : "",
                *url ? (char *)url  : "",
                *url ? "\">O</a>"   : "");
        }
    }

    fclose(fastfd);

goto_gsweb_search:
    fclose(fd);
    GSWSEND(gsw_skin_search);
}



int gsweb_scan_dir(u8 *filedir, int filedirsz, gsw_scan_data_t *list) {
    int     i,
            namelen;
    int     plen,
            ret     = -1;

#ifdef WIN32
    static int      winnt = -1;
    OSVERSIONINFO   osver;
    WIN32_FIND_DATA wfd;
    HANDLE  hFind;

    if(winnt < 0) {
        osver.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
        GetVersionEx(&osver);
        if(osver.dwPlatformId >= VER_PLATFORM_WIN32_NT) {
            winnt = 1;
        } else {
            winnt = 0;
        }
    }

    plen = strlen(filedir);
    strcpy(filedir + plen, "\\*.*");
    plen++;

    if(winnt) { // required to avoid problems with Vista and Windows7!
        hFind = FindFirstFileEx(filedir, FindExInfoStandard, &wfd, FindExSearchNameMatch, NULL, 0);
    } else {
        hFind = FindFirstFile(filedir, &wfd);
    }
    if(hFind == INVALID_HANDLE_VALUE) return(0);
    do {
        if(!strcmp(wfd.cFileName, ".") || !strcmp(wfd.cFileName, "..")) continue;

        namelen = strlen(wfd.cFileName);
        if((plen + namelen) >= filedirsz) goto quit;
        strcpy(filedir + plen, wfd.cFileName);

        if(wfd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
            if(gsweb_scan_dir(filedir, filedirsz, list) < 0) goto quit;
            continue;
        }

        if(namelen < 4) continue;
        if(stricmp(wfd.cFileName + namelen - 4, ".exe")) continue;

        for(i = 0; list[i].game && list[i].exe; i++) {
            if(!stricmp(wfd.cFileName, list[i].exe)) {
                if(!quiet) fprintf(stderr, "- %30s %s\n", list[i].game, filedir);
                gsweb_add_game(list[i].game, list[i].full, filedir);
                break;
            }
        }
    } while(FindNextFile(hFind, &wfd));
    ret = 0;

quit:
    FindClose(hFind);
#else
    // not implemented, useless
#endif
    filedir[plen - 1] = 0;
    return(ret);
}



void gsweb_scan_drive(int sock, u8 *drive) {
    gsw_scan_data_t *list;
    FILE    *fd;
    u32     startoff;
    int     i,
            num;
    u8      mypath[GSMAXPATH + 1];

    fd = gslfopen(DETECTCFG, "rb");
    if(!fd) {
        gsweb_update(sock);
        return;
    }

    num  = 500;
    list = malloc((num + 1) * sizeof(gsw_scan_data_t));
    if(!list) std_err();

    i = 0;
    for(;;) {
        startoff = find_config_entry(fd, &list[i].game);
        if(!startoff) break;

        if(!read_config_entry(
            fd,
            startoff,
            "findexename",
            &list[i].exe)) continue;

        read_config_entry(
            fd,
            startoff,
            "commonname",
            &list[i].full);

        if(++i == num) {
            num += 250;
            list = realloc(list, (num + 1) * sizeof(gsw_scan_data_t));
            if(!list) std_err();
        }
    }

    list[i + 1].game = NULL;
    list[i + 1].full = NULL;
    list[i + 1].exe  = NULL;

    mystrcpy(mypath, drive, sizeof(mypath));
    gsweb_scan_dir(mypath, sizeof(mypath), list);

    fclose(fd);
    free_gsw_scan_data(list, num + 1);
    gsweb_saveconf(0);
}



void gsweb_scan_registry(int sock) {
#ifdef WIN32
    HKEY    key,
            root;
    FILE    *fd;
    u32     startoff;
    int     len;
    u8      tmpgame[CNAMELEN + 1],
            tmpbuff[GSMAXPATH + 1],
            *regpath,
            *fullname,
            *p,
            *tmp,
            *value,
            *save;

    fd = gslfopen(DETECTCFG, "rb");
    if(!fd) {
        gsweb_update(sock);
        return;
    }

    for(;;) {
        startoff = find_config_entry(fd, &tmp);
        if(!startoff) break;

        mystrcpy(tmpgame, tmp, sizeof(tmpgame));
        FREEX(tmp);

        save = read_config_entry(
            fd,
            startoff,
            "findregkey",
            &tmp);
        if(!save) continue;

        p = strchr(save, '\\');
        if(p) *p = 0;
        if(!strcmp(save, "HKEY_CLASSES_ROOT")) {
            root = HKEY_CLASSES_ROOT;
        } else if(!strcmp(save, "HKEY_CURRENT_USER")) {
            root = HKEY_CURRENT_USER;
        } else if(!strcmp(save, "HKEY_LOCAL_MACHINE")) {
            root = HKEY_LOCAL_MACHINE;
        } else if(!strcmp(save, "HKEY_USERS")) {
            root = HKEY_USERS;
        } else if(!strcmp(save, "HKEY_PERFORMANCE_DATA")) {
            root = HKEY_PERFORMANCE_DATA;
        } else if(!strcmp(save, "HKEY_CURRENT_CONFIG")) {
            root = HKEY_CURRENT_CONFIG;
        } else if(!strcmp(save, "HKEY_DYN_DATA")) {
            root = HKEY_DYN_DATA;
        } else {
            continue;
        }

        save = p + 1;
        value = strrchr(save, '\\');
        if(!value) continue;
        *value++ = 0;

        len = RegOpenKeyEx(root, save, 0, KEY_READ, &key);
        FREEX(tmp);
        if(len) continue;

        len = sizeof(tmpbuff) - 1;
        if(!RegQueryValueEx(key, value, NULL, NULL, tmpbuff, (void *)&len)) {
            tmpbuff[len - 1] = '\\';

            read_config_entry(
                fd,
                startoff,
                "addtoregpath",
                &regpath);

            if(regpath) {
                read_config_entry(
                    fd,
                    startoff,
                    "commonname",
                    &fullname);

                if(fullname) {
                    len += mystrcpy(tmpbuff + len, regpath, sizeof(tmpbuff) - len);
                    gsw_substitute(tmpbuff, len, "\\\\", "\\", 0);
                    gsweb_add_game(tmpgame, fullname, tmpbuff);
                    FREEX(fullname);
                }

                FREEX(regpath);
            }
        }

        RegCloseKey(key);
    }

    fclose(fd);
    gsweb_saveconf(0);
#endif
}



void gsweb_scan_games(int sock, u8 *req) {
#ifdef WIN32
    int     i,
            drives;
    u8      drvstr[4],
            *p,
            *par,
            *value;

    if(!req) {
        drives = GetLogicalDrives();

        GSWSEND(GSWDEFAULT3);
        GSWSEND(
            "<form action=\"scan\" method=get>"
            "<input type=\"checkbox\" name=\"registry\" value=\"1\" checked>registry<br>");

        for(i = 0; i < 26; i++) {
            if(drives & (1 << i)) {
                sprintf(drvstr, "%c:\\", i + 'a');
                if(GetDriveType(drvstr) != DRIVE_FIXED) continue;
                tcpspr(sock,
                    "<input type=\"checkbox\" name=\"drive\" value=\"%.2s\">%s<br>",
                    drvstr, drvstr);
            }
        }

        GSWSEND("<input type=\"submit\" value=\"scan\"></form>");
        return;
    }

    p = req;
    do {
        p = gsw_http_value(p, (u8 *)&par, (u8 *)&value);
        if(!value) break;

        if(!strcmp(par, "registry")) {
            if(atoi(value)) gsweb_scan_registry(sock);

        } else if(!strcmp(par, "drive")) {
            if(*value) gsweb_scan_drive(sock, value);

        }
    } while(p);

#endif

    gsweb_config(sock, NULL);
}



void gsweb_about(int sock) {
    GSWSEND(GSWDEFAULT3);
    tcpspr(sock,
        gsw_skin_about,
        gslist_path, gslist_path);

    GSWSEND(gsw_skin_games);
    tcpspr(sock,
        "<tr>"
        "<td class=\"y\">add favorite</td>"
        "<td class=\"y\">IP:PORT</td>"
        "<td class=\"y\">host name</td>"
        "<td class=\"y\">map name</td>"
        "<td class=\"y\">game type</td>"
        "<td class=\"y\">players/max_players</td>"
        "<td class=\"y\">version</td>"
        "<td class=\"y\">mod or game</td>"
        "<td class=\"y\">dedicated</td>"
        "<td class=\"y\">password</td>"
        "<td class=\"y\">punkbuster</td>"
        "<td class=\"y\">ranked or rated</td>"
        "<td class=\"y\">game mode</td>"
        "<td class=\"y\">country</td>"
        "<td class=\"y\">query port</td>"
        "<td class=\"y\">ping ms</td>"
        "</tr>"
        "</table>"
        "</td>"
        "</tr>"
        "<tr>"
        "<td width=\"100%\"><table border=0 cellspacing=0 cellpadding=0 width=\"100%\">"
        "<tr><td class=\"g\">OK</td><td>the server has no password, it's not full or empty... a perfect server where playing</td></tr>"
        "<tr><td class=\"y\">CAN JOIN BUT...</td><td>the server is empty or uses a password</td></tr>"
        "<tr><td class=\"r\">CAN'T JOIN</td><td>the server is full or there are no players and it's protected by password too</td></tr>"
        "<tr><td class=\"b\">PUNKBUSTER</td><td>used only to highlight the pb field for the servers which use PunkBuster</td></tr>"
        "</table>"
        "</td>"
        "</tr>");
}



void gsweb_kick(int sock) {
    GSWSEND(GSWDEFAULT3);
    GSWSEND(GSWKICK);
}



quick_thread(client, int sock) {
    int     t,
            len,
            localip = 0;
    u8      buff[1024],         /* enough for any parameter */
            *req,
            *p,
            *l = NULL;

    if(sock < 0) {  /* local IP: negative = local IP */
        sock = -sock;
        localip = 1;
    }

    p = buff;
    len = sizeof(buff) - 1;
    do {
        t = recv(sock, p, len, 0);
        if(t < 0) goto client_quit;
        if(!t) break;
        p += t;
        *p = 0;
        l = strchr(buff, '\n');
    } while(!l && (len -= t));

    if(!l) goto client_quit;

    gsw_http2chr(buff, l - buff);   /* no XSS checks */

    req = strchr(buff, ' ');
    if(req) {
        *req++ = 0;
    } else {
        req = buff;
    }

    p = strrchr(req, ' ');
    if(p) *p = 0;

    if(!localip && p && !quiet) {
        fprintf(stderr, "  %s\n", req);
    }

    if(*req == '/') req++;  /* req is the request, like /index */
    p = strchr(req, '?');
    if(p) *p++ = 0;         /* p are the parameters */

    GSWSEND(GSWHTTP);
    GSWSEND(gsw_skin_head);
    GSWSEND(gsw_skin_window);

    if(!strcmp(req, "list")) {
        gsweb_list(sock, p);

    } else if(!strcmp(req, "join")) {
        gsweb_join(sock, p);

    } else if(!strcmp(req, "fav")) {
        localip ? gsweb_fav(sock, p)  : gsweb_kick(sock);

    } else if(!strcmp(req, "play")) {
        gsweb_play(sock, p, localip);

    } else if(!strcmp(req, "filter")) {
        localip ? gsweb_set_filter(sock, p) : gsweb_kick(sock);

    } else if(!strcmp(req, "config")) {
        localip ? gsweb_config(sock, p) : gsweb_kick(sock);

    } else if(!strcmp(req, "add")) {
        localip ? gsweb_add(sock, p, 0) : gsweb_kick(sock);

    } else if(!strcmp(req, "search")) {
        gsweb_search(sock, p);

    } else if(!strcmp(req, "scan")) {
        localip ? gsweb_scan_games(sock, p) : gsweb_kick(sock);

    } else if(!strcmp(req, "about")) {
        gsweb_about(sock);

    } else if(!strcmp(req, "update")) {
        localip ? gsweb_update(sock) : gsweb_kick(sock);

    } else if(!strcmp(req, "update_aluigi")) {
        localip ? gsweb_update_aluigi(sock) : gsweb_kick(sock);

    } else if(!strcmp(req, "quit")) {
        if(localip) {
            GSWSEND(gsw_skin_end);
            fputs("- quit Gslist\n", stderr);
            shutdown(sock, 2);
            close(sock);
            if(gsw_data)     free_gsw_data(gsw_data, gsw_tot);
            if(gsw_fav_data) free_gsw_fav_data(gsw_fav_data, gsw_fav_tot);
#ifdef WINTRAY
            Shell_NotifyIcon(NIM_DELETE, &gslist_tray);
#endif
            exit(0);
        }
        gsweb_kick(sock);

    } else {
        gsweb_index(sock);
    }

    GSWSEND(gsw_skin_end);

client_quit:
    shutdown(sock, 2);
    close(sock);
    return(0);
}



void gsweb(in_addr_t ip, u16 port) {
    in_addr_t gsw_localip;
    struct  sockaddr_in peer;
    int     sdl,
            sda,
            //on = 1,
            psz;

    sdl = tcpsocket();
//	if(setsockopt(sdl, SOL_SOCKET, SO_REUSEADDR, (char *)&on, sizeof(on))
//	  < 0) std_err();
    while(port) {
        peer.sin_addr.s_addr = ip;
        peer.sin_port        = htons(port);
        peer.sin_family      = AF_INET;
        if(!bind(sdl, (struct sockaddr *)&peer, sizeof(struct sockaddr_in))) break;
#ifdef WINTRAY
        MessageBox(0, "the port used by Gslistweb is already occupied\nprobably it's already running, check your system tray", "Gslist", MB_OK | MB_ICONERROR);
#else
        fprintf(stderr, "\nError: the specified port is already occupied\n");
#endif
        exit(1);
        port++;
    }
    if(!port) std_err();
    if(listen(sdl, SOMAXCONN)
      < 0) std_err();

    gsweb_initconf();
    gsweb_loadconf();

    fprintf(stderr, "\n  Gslist web interface ready\n");
    if(peer.sin_addr.s_addr == htonl(INADDR_ANY)) {
        gsw_localip = resolv("127.0.0.1");
        fprintf(stderr, "  Now connect to port %hu\n", port);
    } else {
        gsw_localip = ip;
        fprintf(stderr, "  Now connect to http://%s:%hu\n",
            inet_ntoa(peer.sin_addr), port);
    }
    if(gsw_admin_IP) gsw_localip = resolv(gsw_admin_IP);

#ifdef WINTRAY
    quick_threadx(gsweb_tray, &peer);
#endif

    for(;;) {
        psz = sizeof(struct sockaddr_in);
        sda = accept(sdl, (struct sockaddr *)&peer, &psz);
        if(sda < 0) std_err();

        if(peer.sin_addr.s_addr == gsw_localip) {
            sda = -sda;
        } else if(!quiet) {
            fprintf(stderr, "  %s:%hu ",
                inet_ntoa(peer.sin_addr),
                ntohs(peer.sin_port));
        }

        quick_threadx(client, (void *)sda);
    }

    close(sdl);
}


