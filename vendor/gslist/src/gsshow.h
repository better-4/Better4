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

void show_list(u8 *name) {
    FILE    *fd;
    u8      buff[GSLISTSZ + 1];

    fd = gslfopen(GSLISTCFG, "rb");
    if(!fd) {
        fprintf(stderr, "- you must use the -u option the first time or use -p if %s is in another folder", GSLISTCFG);
        std_err();
    }

    if(!quiet) {
        fprintf(fdout,
            "DESCRIPTION                                           GAMENAME           KEY\n"
            "-------------------------------------------------------------------------------\n");
    }

    if(name) {
        while(fgets(buff, sizeof(buff), fd)) {
            if(stristr(buff, name)) fputs(buff, fdout);
        }
    } else {
        while(fgets(buff, sizeof(buff), fd)) {
            fputs(buff, fdout);
        }
    }
    fclose(fd);
}



void show_countries(void) {
    int     i;

    for(i = 0; countries[i][0]; i++) {
        fprintf(stderr, "%s   %s\n", countries[i][0], countries[i][1]);
    }
}



void show_help(void) {
    fprintf(stdout, 
        "-n GAMENAME    servers list of the game GAMENAME (use -l or -s to know it)\n"
        "               you can also specify multiple GAMENAMEs: -n GN1,GN2,...,GNN\n"
        "-l             complete list of supported games and their details\n"
        "-s PATTERN     search for games in the database (case insensitve)\n"
        "-u             update the database of supported games (http://%s)\n"
        "-i HOST PORT   send a query to a remote server that supports the old Gamespy\n"
        "               query protocol ("OLDGSINFO"). HOST:PORT is accepted too\n"
        "-I HOST PORT   as above but uses the new Gamespy query protocol (FE FD ...)\n"
        "-d T HOST PORT another option for various queries. The T parameter is referred\n"
        "               to the type of query you want to use. Use -d ? for the list\n"
        "-f FILTERS     specify a filter to apply to the servers list. Use -f ? for help\n"
        "-r \"prog...\"   lets you to execute a specific program for each IP found.\n"
        "               there are 2 available parameters: #IP and #PORT automatically\n"
        "               substituited with the IP and port of the each online game server\n"
        "-o OUT         specify a different output for the servers list (default output\n"
        "               is screen). Use -o ? for the list of options\n"
#ifdef GSWEB
        "-w IP PORT     start the web interface binding your local IP and port\n"
        "               Use 127.0.0.1 and 80 if you have doubts and then connect your\n"
        "               browser to http://127.0.0.1. Use 0 for all the interfaces\n"
        "-W OPTIONS     comma separated options for gsweb with the format OPTION=VALUE\n"
        "               refresh=0        disable the refresh buffer/button\n"
        "               admin=127.0.0.1  IP of the admin with access to all the sections\n"
#endif
        "-q             quiet output, many informations will be not showed\n"
        "-x S[:P]       specify a different master server (S) and port (P is optional)\n"
        "               default is %s:%hu\n"
        "-b PORT        heartbeats sender, your IP address will be included in the\n"
        "               online servers list, PORT is the query port of your server.\n"
        "-B PORT        as above but the port is not bound, your server must support\n"
        "               the old Gamespy query protocol ("OLDGSINFO") for being included\n"
        "-L SEC         continuous servers list loop each SEC seconds\n"
        "-t NUM         enctype: 0 (only old games), 1 (Gamespy3d), 2 and -1/X (default)\n"
        "-c             list of country codes to use with the \"country\" filter\n"
        "-Y NAME KEY    custom gamename and game key for \"accessing\" the master server\n"
        "-p PATH        directory where your want to read/store the configuration files\n"
        "-m             manual generation of "GSLISTCFG" (-M from scratch), users use -u\n"
        "-Q T           super query, each host in the list will be queried and the info\n"
        "               will be showed with the backslash '\\' delimiter or added to SQL\n"
        "               T is the same parameter you can see using -d\n"
        "               Source engine, DirectPlay and ASE queries are not supported\n"
        "               use ever -X instead of -Q because it's faster since the info are\n"
        "               got directly from the master server\n"
        "-X INFO        similar to the above option except that all the info are sent by\n"
        "               the same master server saving time, bandwidth and is error free,\n"
        "               the INFO parameter has the format \\parameter1\\parameter2 like:\n"
        "               -t -1 -X \"\\hostname\\gamever\\numplayers\\maxplayers\\mapname\"\n"
        "               works only with enctype -1 and has no NAT limits\n"
        "               use -X \"\" or -X \\ for the pre-build parameters built in gslist\n"
        "-D MS          milliseconds to wait between each information query with -Q (%d)\n"
#ifdef SQL
        "-S             show the SQL options (experimental!!!)\n"
        "-E             ignore the SQL errors and continues after some seconds\n"
#endif
        "-C             do not filter colors from the game info replied by the servers\n"
        "-G             force the usage of gsnatneg when querying the servers\n"
        "-z FILE        get the list of servers (IP PORT or IP:PORT and so on) from the\n"
        "               text file FILE, useful only for specific query scannings\n"
        "-R             retrieve all the Gamespy peerchat rooms of a specific game\n"
        "-e             some usage examples\n"
        "-v             show the version of Gslist and its database's folder\n"
        "-0             don't wait when using -d/D/i/I\n"
        "\n", ALUIGIHOST, MS, MSPORT, scandelay);
}



void show_examples(void) {
    fputs(
        "Some examples of the Gslist's usage:\n"
        "\n"
        "-N ut2              retrieves the list of UT2003'servers\n"
        "-n 168              retrieves the list of UT2003'servers (168 is the\n"
        "                    current identifier of UT2003, but it can change when you\n"
        "                    update the games'list with the -u or -U options)\n"
        "-n ut2,racedriver   servers list of both UT2003 and Toca Race Driver\n"
        "-N ut2 -f \"country=IT\" to retrieve all the italian servers\n"
        "-q -N ut2           retrieves the list of UT2003'servers but shows less info\n"
        "-o 1 -N ut2         the servers'list will be dumped in the file ut2.gls\n"
        "-o 2 -N ut2         the servers'list will be dumped in "FILEOUT"\n"
        "-o 3 -N ut2         the servers'list will be saved in binary form in ut2.gls\n"
        "-o 4 -N ut2         same as above but in the file "FILEOUT"\n"
        "-o x.txt -N ut2     saves the output in the file x.txt (just as you see it on\n"
        "                    screen but without errors and headers), like > x.txt\n"
        "-o 6                full hexadecimal visualization of the raw servers list\n"
        "-l                  shows the list of all the available games\n"
        "-s serious          shows all the games having a name containing \"serious\"\n"
        "                    and also -s SeRiou or -s SERIOUS is the same\n"
        "-i 1.2.3.4 1234     uses the Gamespy query protocol to retrieve remote info\n"
        "                    (not all the games support this protocol)\n"
        "-I 1.2.3.4 1234     as above but uses the new Gamespy protocol\n"
        "-d 1 1.2.3.4 1234   as above but uses a Quake 3 query\n"
        "-u                  update the list of supported games\n"
        "-x localhost -n 2   retrieves the servers'list of the game identified by the\n"
        "                    number 2 using the masterserver at localhost:28900\n"
        "                    If you use -x localhost:1234 will be contacted the master\n"
        "                    server port 1234\n"
        "-o file.txt -l      the games'list will be dumped in file.txt\n"
        "-r \"ping -n 1 #IP\"  will ping each IP found\n"
        "-r \"gsinfo #IP #PORT\" will launch the program gsinfo\n"
        "-b 7778 -N ut2      adds your IP to the game list of Unreal Tournament 2003\n"
        "                    your port 7778 will be temporary bound and your server\n"
        "                    will be not reacheable for some milliseconds\n"
        "-B 7778 -N ut2      as above but no ports will be bound. Your server must\n"
        "                    support the "OLDGSINFO" query\n"
        "-c                  shows the list of country codes existent\n"
        "-L 60 -N ut2        retrieves the servers of UT2003 each minute\n"
        "-w 127.0.0.1 80     web interface enabled\n"
        "-v                  shows the version of Gslist you are using\n"
        "-t -1 -X \\hostname -n halor same output of -Q but all the info (hostname in\n"
        "                    this case) comes directly from the same master server\n"
        "                    if you want to receive specific informations quickly and\n"
        "                    without problems of NATted servers, this IS your option\n"
        "\n"
        "I think these examples are enough, however contact me if you have problems\n"
        "\n", stdout);
}



void show_sql(void) {
    fputs("\n"
        "NOTE THAT SQL IS IMPLEMENTED BUT IS NOT DOCUMENTED AND IS EXPERIMENTAL!\n"
        "\n"
        "-S H DB U P Q QB QL\n"
        "  H  = host or IP address of the SQL server (use 0.0.0.0 for debug)\n"
        "  DB = name of the database to use\n"
        "  U  = username for accessing the SQL database\n"
        "  P  = password\n"
        "  Q  = main SQL query string, watch below *\n"
        "  QB = specify an SQL query to do before the main one. If this query fails\n"
        "       will be executed the main one too. For example you can use an UPDATE\n"
        "       here that if fails will be followed by the main query (an INSERT) that\n"
        "       will add the new entry into the database\n"
        "  QL = specify a fixed SQL query (so NOT #IP and other dynamic values) to\n"
        "       be executed immediately after each scan (like a DELETE for example,)\n"
        "       to use for old entries\n"
        "\n"
        "  Use \"\" for skipping parameters, useful if you want to avoid QB and QL\n"
        "\n"
        "* The SQL query is just a SQL query containing the values you want to add\n"
        "  inserting a # before them like #GAMENAME for the gamename value and so on.\n"
        "  #IP is used for the IP address, #PORT for its port and #DATE for a decimal\n"
        "  number that identifies the current time in seconds (time(NULL)).\n"
        "  Remember to use '' for text values. An example of SQL_query is:\n"
        "  \"INSERT INTO mytable VALUES ('#IP',#PORT,'#GAMENAME','#GAMEVER',#NUMPLAYERS,#MAXPLAYERS);\"\n"
        "\n", stdout);
}



void show_filter_help(void) {
    fputs("\n"
        "  Valid operators are:\n"
        "    <>, !=, >=, !<, <=, !>, =, <, >, (, ), +, -, *, /, %,\n"
        "    AND, NOT, OR, LIKE, NOT LIKE, IS NULL, IS NOT NULL\n"
        "\n"
        "  Some valid items are:\n"
        "    hostaddr, hostport, gamever, country (check the -c option)\n"
        "    hostname, mapname, gametype, gamemode, numplayers, maxplayers\n"
        "\n"
        "  Exist also other parameters specifics for each game like:\n"
        "    password, dedicated, fraglimit, minnetver, maxteams and so on\n"
        "\n"
        "  Wildcard character: %\n"
        "  String delimiter:   '\n"
        "\n"
        "  Examples: -f \"((hostname LIKE '%Bob%') AND (country='US'))\"\n"
        "            -f \"(numplayers > 0)\"\n"
        "            -f \"(gamever LIKE '%1.00.06%')\" -n halor\n"
        "\n", stdout);
}



void show_output_help(void) {
    fputs("\n"
        "  1 = text output to a file for each game (ex: serioussam.gsl).\n"
        "      string: 1.2.3.4:1234 (plus a final line-feed)\n"
        "  2 = text output as above but to only one file ("FILEOUT")\n"
        "  3 = binary output to a file for each game: 4 bytes IP, 2 port\n"
        "      example: (hex) 7F0000011E62 = 127.0.0.1 7778\n"
        "  4 = binary output as above but to only one file ("FILEOUT")\n"
        "  5 = exactly like 1 but to stdout\n"
        "  6 = hexadecimal visualization of the raw servers list as is\n"
        "  FILENAME = if OUT is a filename all the screen output will be\n"
        "             dumped into the file FILENAME\n"
        "\n", stdout);
}


