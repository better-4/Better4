cmake_minimum_required(VERSION 3.10)

project(better4)

set(SRC "${PROJECT_SOURCE_DIR}/src")
set(VENDOR "${PROJECT_SOURCE_DIR}/vendor")

add_subdirectory("${VENDOR}/partymod-thps4")

add_library(better4 SHARED
    "${SRC}/cfuncs.c"
    "${SRC}/cfuncs.h"
    "${SRC}/log.c"
    "${SRC}/log.h"
    "${SRC}/main.c"
    "${SRC}/online.c"
    "${SRC}/online.h"
    "${SRC}/qb.c"
    "${SRC}/qb.h"
)

target_include_directories(better4 PUBLIC
    ${SRC}
    ${VENDOR}
)

target_link_libraries(better4 PRIVATE partymod)
