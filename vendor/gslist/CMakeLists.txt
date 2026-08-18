cmake_minimum_required(VERSION 3.10)

project(gslist)

add_library(gslist INTERFACE
    countries.h
    enctypex_decoder.h
    gslegacy.h
    gslist.h
    gsmsalg.h
    gsmyfunc.h
    gsnatneg.h
    gsshow.h
    gssql.h
    gswtray.h
    multi_query.h
    stristr.h
    winerr.h
)

target_link_libraries(gslist INTERFACE
    wsock32
)
