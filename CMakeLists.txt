cmake_minimum_required(VERSION 3.10)

project(better4)

set(SRC "${PROJECT_SOURCE_DIR}/src")
set(VENDOR "${PROJECT_SOURCE_DIR}/vendor")

add_subdirectory("${VENDOR}/partymod-thps4")
add_subdirectory("${VENDOR}/UniSpySDK")

if(UNISPY_WINSOCK2)
    add_definitions(-DGSI_WINSOCK2)
endif()

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
    "${SRC}/security.c"
    "${SRC}/security.h"
    "${SRC}/updater.c"
    "${SRC}/updater.h"
    "${SRC}/version.c"
    "${SRC}/version.h"
    "${SRC}/decomp/CArray.c"
    "${SRC}/decomp/CArray.h"
    "${SRC}/decomp/common.h"
    "${SRC}/decomp/CScript.c"
    "${SRC}/decomp/CScript.h"
    "${SRC}/decomp/CStruct.c"
    "${SRC}/decomp/CStruct.h"
    "${SRC}/decomp/GameNet_Manager.c"
    "${SRC}/decomp/GameNet_Manager.h"
    "${SRC}/decomp/GameNet_PlayerInfo.c"
    "${SRC}/decomp/GameNet_PlayerInfo.h"
    "${SRC}/decomp/Lst_Search.c"
    "${SRC}/decomp/Lst_Search.h"
    "${SRC}/decomp/Mdl_Skate.c"
    "${SRC}/decomp/Mdl_Skate.h"
    "${SRC}/decomp/Net_App.h"
    "${SRC}/decomp/Net_Conn.h"
    "${SRC}/decomp/Obj_CSkater.h"
    "${SRC}/decomp/Obj_CSkaterCam.c"
    "${SRC}/decomp/Obj_CSkaterCam.h"
    "${SRC}/decomp/Prefs_Preferences.c"
    "${SRC}/decomp/Prefs_Preferences.h"
    "${SRC}/online/client.c"
    "${SRC}/online/client.h"
    "${SRC}/online/lobby_list.c"
    "${SRC}/online/lobby_list.h"
    "${SRC}/online/patches.c"
    "${SRC}/online/patches.h"
    "${SRC}/online/peer.c"
    "${SRC}/online/peer.h"
    "${SRC}/online/server.c"
    "${SRC}/online/server.h"
    "${SRC}/online/server_list.c"
    "${SRC}/online/server_list.h"

)
target_include_directories(better4 PUBLIC
    ${SRC}
    ${VENDOR}
)
target_link_libraries(better4 PRIVATE partymod usserverbrowsing usnatneg uspeer)
