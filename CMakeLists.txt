cmake_minimum_required(VERSION 3.10)

project(better4)

set(SRC "${PROJECT_SOURCE_DIR}/src")
set(VENDOR "${PROJECT_SOURCE_DIR}/vendor")

add_library(better4 SHARED
    "${SRC}/cfuncs.c"
    "${SRC}/cfuncs.h"
    "${SRC}/input.c"
    "${SRC}/input.h"
    "${SRC}/log.c"
    "${SRC}/log.h"
    "${SRC}/main.c"
    "${SRC}/online.c"
    "${SRC}/online.h"
    "${SRC}/decomp/CArray.c"
    "${SRC}/decomp/CArray.h"
    "${SRC}/decomp/common.h"
    "${SRC}/decomp/CScript.c"
    "${SRC}/decomp/CScript.h"
    "${SRC}/decomp/CStruct.c"
    "${SRC}/decomp/CStruct.h"
    "${SRC}/decomp/Lst_Search.c"
    "${SRC}/decomp/Lst_Search.h"
    "${SRC}/decomp/Mdl_Skate.c"
    "${SRC}/decomp/Mdl_Skate.h"
    "${SRC}/decomp/Net_Manager.c"
    "${SRC}/decomp/Net_Manager.h"
    "${SRC}/decomp/Net_PlayerInfo.c"
    "${SRC}/decomp/Net_PlayerInfo.h"
    "${SRC}/decomp/Obj_CSkater.h"
    "${SRC}/decomp/Obj_CSkaterCam.c"
    "${SRC}/decomp/Obj_CSkaterCam.h"

)

target_include_directories(better4 PUBLIC
    ${SRC}
    ${VENDOR}
)

add_subdirectory("${VENDOR}/partymod-thps4")
add_subdirectory("${VENDOR}/gslist")

target_link_libraries(better4 PRIVATE partymod gslist)
