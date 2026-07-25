CFLAGS	+= -O2 -s -fstack-protector-all
PREFIX	= /usr/local
BINDIR	= $(PREFIX)/bin
SRC	= src/gslist.c src/enctype1_decoder.c src/enctype2_decoder.c src/enctype_shared.c src/mydownlib.c
#LIBS	= -lpthread /usr/lib/libGeoIP.a /usr/lib/i386-linux-gnu/libz.a
#SQLIBS	= /usr/lib/i386-linux-gnu/libmysqlclient.a /usr/lib/i386-linux-gnu/libm.a -ldl
LIBS	= -lpthread -lGeoIP -lz
SQLIBS	= -lmysqlclient
O	= $(SRC:.c=.o)

all:	gslist gslistsql

gslist:	
	$(CC) $(SRC) $(CFLAGS) -o gslist $(LIBS) -DGSWEB
	$(CC) $(SRC) $(CFLAGS) -o gslistsql $(SQLIBS) $(LIBS) -DGSWEB -DSQL

clean:
	rm -f gslist gslistsql src/gslist.o src/enctype1_decoder.o src/enctype2_decoder.o src/enctype_shared.o src/enctypex_decoder.o src/mydownlib.o

install:
	install -m 755 -d $(BINDIR)
	install -m 755 gslist $(BINDIR)/gslist
	install -m 755 gslistsql $(BINDIR)/gslistsql

.PHONY:
	clean install

