/*

Built-in "puzzle" interface for gslist webgui

*/

#define GSWKICK     "This option can be used only by the local server interface (like 127.0.0.1)<br>"
#define GSWUPDATE1  "Update in progress, wait some seconds...<br>"
#define GSWUPDATE2  "Update complete!"
#define GSWUPDATE3  "Update FAILED! Anyway your game database has not been modified<br>" \
                    "<br>" \
                    "You can automatically get the latest pre-built files from <b><a href=\"update_aluigi\">aluigi.org</a></b>"
#define GSWDEF(x,y) "</td></tr>" \
                    "<tr><td>" \
                    "<table border=0 cellspacing=0 cellpadding=0" x ">" \
                    y
#define GSWDEFAULT1 GSWDEF(" width=\"100%\"", "<tr>")
#define GSWDEFAULT2 GSWDEF("", "<tr>")
#define GSWDEFAULT3 GSWDEF(" width=\"100%\"", "<tr><td>")
#define GSWDEFAULT4 GSWDEF(" width=\"100%\"", "")
#define GSWFILTER1  "<i>" \
                    "This template will help you to build a perfect <b>temporary</b> filter which will be <b>lost</b> when you will close Gslist<br>" \
                    "Go in <a href=\"/config\">Config</a> for using and storing this filter for a specific game, otherwise this filter will be NOT used<br>" \
                    "</i>" \
                    "<i>Wildcard character:</i> <b>%</b><br>" \
                    "</td></tr>" \
                    "<tr><td>"
#define GSWFILTER2  "<tr><td>" \
                    "<form action=\"filter\" method=get>"
#define GSWFILTER3  "<input type=\"submit\" value=\"set\">" \
                    "</form>"
#define GSWFILTER4  "<input type=\"submit\" value=\"set\"> &lt;= click here for generating the filter with the parameters below:" \
                    "</form>"
#define GSWFILTERX  "<td>" \
                    "<select name=\"more\">" \
                    "<option value=\"AND\">AND" \
                    "<option value=\"NOT\">NOT" \
                    "<option value=\"OR\">OR" \
                    "</select>" \
                    "</td>" \
                    "</tr>"
#define GSWSEARCHT  "<th>Description</th>" \
                    "<th>Gamename</th>" \
                    "<th>Gamekey</th>" \
                    "<td>add<br>game</td>" \
                    "<td>list<br>only</td>" \
                    "<td>ping<br>list</td>" \
                    "<td>game<br>info</td>" \
                    "</tr>"

#define GSWFONTCOL  "000060"
#define GSWBORDER   "d0d0d8"

u8 gsw_skin_head[] =
    "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">"
    "<html>"
    "<head>"
    "<title>Gslist</title>"
    "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">"
    "<style type=\"text/css\"><!--"
    "*{margin:0;padding:0;color:#" GSWFONTCOL ";font-size:00px;font-family:sans-serif;text-decoration:none;}"
    "a:hover{color:#5050FF}"
    "th{background-color:#e8e8ff;border:#" GSWBORDER ";border-style:solid;border-width:0px 0px 1px 1px}"
    "td{background-color:#f4f4ff;border:#" GSWBORDER ";border-style:solid;border-width:0px 0px 1px 1px}"
    "th.menu{background-color:#d0d0ff;border-width:0px 0px 0px 0px}"
    "td.r{background-color:#ffd0d0}"
    "td.g{background-color:#d0ffd0}"
    "td.b{background-color:#d0d0ff}"
    "td.y{background-color:#ffffd0}"
    "--></style>"
    "</head>"
    "<body bgcolor=\"#f8f8ff\" link=\"#"GSWFONTCOL"\" vlink=\"#"GSWFONTCOL"\" alink=\"#"GSWFONTCOL"\">";

u8 gsw_skin_window[] =
        /* container */
    "<table border=0 cellspacing=0 cellpadding=0 width=\"100%\">"
    "<tr>"
    "<td>"
        /* menu */
    "<table border=1 cellspacing=0 cellpadding=0 width=\"100%\">"
    "<tr>"
    "<th class=\"menu\" title=\"main menu\" width=\"10%\"><a href=\"index\">Main</a></th>"
    "<th class=\"menu\" title=\"direct IP query and join\" width=\"10%\"><a href=\"join\">IP</a></th>"
    "<th class=\"menu\" title=\"favorite servers\" width=\"10%\"><a href=\"fav\">Fav</a></th>"
    "<th class=\"menu\" title=\"configuration\" width=\"10%\"><a href=\"config\">Config</a></th>"
    "<th class=\"menu\" title=\"games database\" width=\"10%\"><a href=\"search\">DB</a></th>"
    "<th class=\"menu\" title=\"search games on your computer\" width=\"10%\"><a href=\"scan\">Scan</a></th>"
    "<th class=\"menu\" title=\"set the servers filter\" width=\"10%\"><a href=\"filter\">Filter</a></th>"
    "<th class=\"menu\" title=\"update the database\" width=\"10%\"><a href=\"update\">Update</a></th>"
    "<th class=\"menu\" title=\"about this program\" width=\"10%\"><a href=\"about\">About</a></th>"
    "<th class=\"menu\" title=\"terminate Gslist\" width=\"10%\"><a href=\"quit\">Quit</a></th>"
    "</tr>"
    "</table>";

u8 gsw_skin_games[] =
    "<tr>"
    "<td width=\"100%\">"
        /* servers */
    "<table border=0 cellspacing=0 cellpadding=0 width=\"100%\">"
    "<tr>"
    "<th title=\"add to favorites\">fav</th>"
    "<th title=\"server IP address and port\">IP</th>"
    "<th title=\"name or description\">name</th>"
    "<th title=\"current map\">map</th>"
    "<th title=\"game type\">type</th>"
    "<th title=\"current and max players\">players</th>"
    "<th title=\"version\">ver</th>"
    "<th title=\"mods in use\">mod</th>"
    "<th title=\"dedicated server\">d</th>"
    "<th title=\"password protected\">p</th>"
    "<th title=\"punkbuster\">pb</th>"
    "<th title=\"ranked or rated server\">r</th>"
    "<th title=\"game mode or match status\">mode</th>"
    "<th title=\"country\">c</th>"
    "<th title=\"server query port\">qp</th>"
    "<th title=\"ping time\">ping</th>"
    "</tr>";

u8 gsw_skin_search[] =
    "</table>"
    "<tr>"
    "<td>"
    "<table border=0 cellspacing=0 cellpadding=0 width=\"100%\">"
    "<tr>"
    "<td align=\"center\">"
    "<form action=\"search\">"
    "<input type=\"text\" name=\"q\">"
    "<input type=\"submit\" value=\"SEARCH\">"
    "</form>"
    "</td>"
    "</tr>";

u8 gsw_skin_end[] =
    "</table>"
    "</td>"
    "</tr>"
    "</table>"
    "</body>"
    "</html>";

u8 gsw_skin_about[] =
    "<center>"
    "<b>Gslist "VER"</b><br>"
    "by Luigi Auriemma<br>"
    "e-mail: <a href=\"mailto://aluigi@autistici.org\">aluigi@autistici.org</a><br>"
    "web: <a href=\"http://aluigi.org\">aluigi.org</a><br>"
    "<b><a href=\"http://aluigi.org/papers.htm#gslist\">Homepage</a></b><br>"
    "<br>"
    "<b>Configuration folder:</b> <a href=\"file:///%s\">%s</a><br>"
    "<br>"
    "<b>Some tips</b><br>"
    "press F11 for full screen visualization (it seems a game station!)<br>"
    "press Ctrl and F for searching words in the screens<br>"
    "browsers support bookmarks, use this feature when you need it<br>"
    "enable the servers limitations in the Configuration screen: unpingable and max servers<br>"
    "go on &quot;Update&quot; when you have a recent new game that is not included in your list<br>"
    "use &quot;Filter&quot; for easily create a temporary filter<br>"
    "the filter can be saved in the configuration file ONLY through the &quot;Configure&quot; menu<br>"
    "go on &quot;Scan&quot; everytime you install a new game<br>"
    "the Back and Forward button (arrows) of your browser exist to be used, remember it...<br>"
    "same story for the Refresh button, it is very useful if you want to reping the servers<br>"
    "press Ctrl and T for opening another browser tab, sometimes useful for multiple games<br>"
    "<br><br>"
    "<i>Many thanx to all the people that have helped me to improve this tool and also<br>"
    "to all the others that use it and find it useful or interesting.<br>"
    "If you have ideas for improving Gslist you are welcome, send me a mail!<br></i>"
    "</center><br>"
    "the following is an explanation of the fields visualized by this webGUI and their colors:<br>";

