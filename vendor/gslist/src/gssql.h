/*
    Copyright 2006,2007,2008,2009,2010 Luigi Auriemma

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

#include <mysql/mysql.h>



#define SQLSZ       262144  /* useful to avoid security problems without checks */
#define SQLTIMEOUT  300000



MYSQL   dbase;
int     sqldebug    = 0;
u8      *sqlquery   = NULL;



void sql_fix(u8 *data) {
    u8      *p;

    for(p = data; *p; p++) {
        switch(*p) {
            case '\'':
            case '\"':
            case '&':
            case '^':
            case '?':
            case '{':
            case '}':
            case '(':
            case ')':
            case '[':
            case ']':
            case '-':
            case ';':
            case '~':
            case '|':
            case '$':
            case '!':
            case '<':
            case '>':
            case '*':
            case '%':
            case ',': *p = '.'; break;
            default: break;
        }
    }
}



void sql_parse(u8 *data, u8 *limit, u8 *query) {    // data can be modified without problems
    int     nt = 0;
    u8      minitmp[32],
            *p,
            *port,
            *par    = NULL;

    port = strchr(data, ':');
    if(!port) return;
    port++;
    p = strchr(port, ' ');
    if(!p) return;

    port[-1] = 0;
    *p++ = 0;
    if(*p == '\\') *p++ = 0;    // avoid possible bug

    replace(query, "#IP",   data);
    replace(query, "#PORT", port);
    sprintf(minitmp,"%u",   (unsigned)time(NULL));
    replace(query, "#DATE", minitmp);

    for(data = p; data < limit; data = p + 1, nt++) {
        p = strchr(data, '\\');
        if(p) *p = 0;

        if(nt & 1) {
            if(!quiet) fprintf(stderr, "%s\n", data);
            if(par) {
                //enctypex_data_cleaner(par,  par,  strlen(par)); // parameters don't need to be clean
                enctypex_data_cleaner(data, data, -1);
                sql_fix(par);
                sql_fix(data);
                replace(query, par, data);
            }
        } else {
            if(!*data) break;
            if(!quiet) fprintf(stderr, "%28s: ", data);
            par  = data - 1;
            *par = '#';
        }
        if(!p) break;
    }
}



int gssql_init(void) {
    fprintf(stderr, "\n- MySQL server connection\n");

    if(!strcmp(sql_host, "0.0.0.0")) {   // debugging
        sqldebug = 1;
    } else {
        sqldebug = 0;
        if(!mysql_init(&dbase)) {
            fprintf(stderr, "\nError: database initialization error\n\n");
            exit(1);
        }
        if(!mysql_real_connect(&dbase, sql_host, sql_username, sql_password, sql_database, 0, NULL, 0)) {
            fprintf(stderr, "\nError: %s\n\n", mysql_error(&dbase));
            exit(1);
        }
    }

    sqlquery = malloc(SQLSZ + 1);
    if(!sqlquery) std_err();
    return(0);
}



int gssql_later(void) {
    if(sql_queryl && (sql_queryl[0] >= ' ')) {  // lame fix?
        if(!quiet) fprintf(stderr, "\n* SQL_LATER:\n  %s\n", sql_queryl);

        if(!sqldebug) {
            if(mysql_real_query(&dbase, sql_queryl, strlen(sql_queryl))) {
                fprintf(stderr, "\nError: %s\n\n", mysql_error(&dbase));
                if(!ignore_errors) exit(1);
                sleep(ONESEC);
                return(-1);
            }
            if(!mysql_affected_rows(&dbase)) {
                fprintf(stderr, "\nAlert: no rows have been affected by the SQL operation\n\n");
            }
        }
    }
    return(0);
}



int gssql_close(void) {
    if(!sqldebug) {
        mysql_close(&dbase);
        FREEX(sqlquery);
    }
    return(0);
}



int gssql(u8 *data) {
    static int  datab_size  = 0;
    int         datalen;
    static u8   *datab      = NULL;

    datalen = strlen(data);
    if(!datalen) return(0);

    if(sql_queryb) {
        if(datalen > datab_size) {
            datab_size = datalen + 1; // final NULL
            datab = realloc(datab, datab_size);
            if(!datab) std_err();
        }
        strcpy(datab, data);
        strcpy(sqlquery, sql_queryb);
        sql_parse(datab, datab + datalen, sqlquery);
        if(!quiet) fprintf(stderr, "\n* SQL BEFORE:\n  %s\n", sqlquery);
        if(!sqldebug) {
            if(mysql_real_query(&dbase, sqlquery, strlen(sqlquery))) {
                fprintf(stderr, "\nError: %s\n\n", mysql_error(&dbase));
                if(!ignore_errors) exit(1);
                sleep(ONESEC);
                return(-1);
            }
            if(mysql_affected_rows(&dbase)) return(0);
            if(!quiet) fprintf(stderr, "* operation failed, continue with the normal query\n");
        }
    }

    strcpy(sqlquery, sql_query);
    sql_parse(data, data + datalen, sqlquery);
    if(!quiet) fprintf(stderr, "\n* SQL:\n  %s\n", sqlquery);
    if(!sqldebug) {
        if(mysql_real_query(&dbase, sqlquery, strlen(sqlquery))) {
            fprintf(stderr, "\nError: %s\n\n", mysql_error(&dbase));
            if(!ignore_errors) exit(1);
            sleep(ONESEC);
            return(-1);
        }
        if(!mysql_affected_rows(&dbase)) {
            fprintf(stderr, "\nAlert: no rows have been affected by the SQL operation\n\n");
        }
    }
    return(0);
}


