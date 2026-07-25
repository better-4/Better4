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

int cool_download(u8 *fname, u8 *host, u16 port, u8 *uri) {
    mydown_options  mop;
    int     size;
    u8      *url;

    fname = gslfopen(fname, NULL);
    spr(&url, "http://%s:%hu/%s", host, port, uri);

    memset(&mop, 0, sizeof(mop));
    mop.onlyifdiff = 1;     // doesn't download the file if size is the same
    mop.useragent  = GSUSERAGENT;
    mop.onflyunzip = 1;

    size = mydown(url, fname, &mop);
    FREEX(url);
    FREEX(fname);
    return(size);
}


