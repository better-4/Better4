#include "online/player_list.h"

#include "decomp/CStruct.h"
#include "decomp/CScript.h"
#include "decomp/GameNet_Manager.h"
#include "decomp/GameNet_PlayerInfo.h"
#include "decomp/Lst_Search.h"

int __cdecl CFunc_FillPlayerListMenu(CStruct *params) {
    GameNet_Manager *gamenet_manager = GameNet_Manager_Instance();

    Lst_Search search = Lst_Search_PlayerInfo();
    GameNet_PlayerInfo *current_player = GameNet_Manager_FirstPlayerInfo(gamenet_manager, &search, 1);

    int i = 0;
    while (current_player != 0) {
        if (GameNet_PlayerInfo_IsLocalPlayer(current_player)) {
            current_player = GameNet_Manager_NextPlayerInfo(gamenet_manager, &search, 1);
            i++;
            continue;
        }

        CStruct *choose_params = CStruct_New();
        CStruct_AddInteger(choose_params, 0x7f8c98fe/*index*/, i);
        CStruct_AddString(choose_params, 0xa1dc81f9/*name*/, current_player->name);

        CStruct *item_params = CStruct_New();
        CStruct_AddString(item_params, 0xc4745838/*text*/, current_player->name);
        CStruct_AddChecksum(item_params, 0x40c698af/*id*/, 123456 + i);
        CStruct_AddChecksum(item_params, 0x2b0cfca1/*pad_choose_script*/, 0x405a36f9/*choose_selected_player*/);
        CStruct_AddStructure(item_params, 0xb8437568/*pad_choose_params*/, choose_params);

		Script_RunScript(0xbeed50b6/*make_text_sub_menu_item*/, item_params, 0, 0, 0);

        CStruct_Free(item_params);
        CStruct_Free(choose_params);

        current_player = GameNet_Manager_NextPlayerInfo(gamenet_manager, &search, 1);
        i++;
    }

    return 1;
}
