@echo off

set GSLIST_MINGW_PATH=c:\mingw
set GSLIST_MINGW_OPT=-s -O2 -mtune=generic -fstack-protector-all -Wall -Wextra -Wunused -Wshadow -Wno-pointer-sign -Wno-sign-compare -Wno-unused-parameter
set GSLIST_MINGW_LIBS=gslist_icon.o stristr.c -lGeoIP -DGSWEB "%GSLIST_MINGW_PATH%\lib\libz.a" "%GSLIST_MINGW_PATH%\lib\libws2_32.a"
set GSLIST_FILES=gslist.c enctype1_decoder.c enctype2_decoder.c enctype_shared.c mydownlib.c

"%GSLIST_MINGW_PATH%\bin\windres" gslist_icon.rc gslist_icon.o

echo ----------
echo - gslist -
echo ----------
"%GSLIST_MINGW_PATH%\bin\gcc" %GSLIST_MINGW_OPT% -o ..\gslist.exe    %GSLIST_FILES% %GSLIST_MINGW_LIBS%

echo -------------
echo - gslistweb -
echo -------------
"%GSLIST_MINGW_PATH%\bin\gcc" %GSLIST_MINGW_OPT% -o ..\gslistweb.exe %GSLIST_FILES% %GSLIST_MINGW_LIBS% -mwindows -DWINTRAY

echo -------------
echo - gslistsql -
echo -------------
"%GSLIST_MINGW_PATH%\bin\gcc" %GSLIST_MINGW_OPT% -o ..\gslistsql.exe %GSLIST_FILES% %GSLIST_MINGW_LIBS% -DSQL "%GSLIST_MINGW_PATH%\lib\libmysql.lib"

del gslist_icon.o
