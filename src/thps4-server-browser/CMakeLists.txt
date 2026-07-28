cmake_minimum_required(VERSION 3.10)
project(th4-server-browser C)

set(CMAKE_C_STANDARD 99)

add_executable(th4-server-browser main.c
        query.c
        query.h)

target_link_libraries(th4-server-browser PRIVATE shell32 ole32)
