chat_commands = 
[
  { command_text = "/obs" command_scr = EnterBetterObserve }
  { command_text = "/set" command_scr = set_cust_command }
  { command_text = "/goto" command_scr = goto_cust_command }
  { command_text = "/clear" command_scr = console_clear}
  { command_text = "/warp" command_scr = create_net_panel_message params = { text = "Coming soon..." style = generic_net_panel_message } }

  { command_text = "7obs" command_scr = EnterBetterObserve }
  { command_text = "7set" command_scr = set_cust_command }
  { command_text = "7goto" command_scr = goto_cust_command }
  { command_text = "7clear" command_scr = console_clear}
  { command_text = "7warp" command_scr = create_net_panel_message params = { text = "Coming soon..." style = generic_net_panel_message } }
]
load_icon_properties = {
  x = 50.0
  y = 50.0
  anim_delay = 16
  images = [
    "images/panelsprites/wheel_001.png"
    "images/panelsprites/wheel_002.png"
    "images/panelsprites/wheel_003.png"
    "images/panelsprites/wheel_004.png"
    "images/panelsprites/wheel_005.png"
    "images/panelsprites/wheel_006.png"
  ]
}
game_menu_properties = {
  x = 150.0 y = 90.0 w = 320.0 h = 336.0
  just_center_x
  just_center_y
}
EnteringStatsMenuFromGameFlow = 0
script PauseMusicAndStreams
  PauseMusic 1
  PauseStream 1
endscript
script UnPauseMusicAndStreams
  PauseMusic 0
  PauseStream 0
endscript
script do_backend_retry
  GoalManager_UninitializeAllGoals
  if InNetGame
    ResetProSetFlags
  endif
  SpawnScript do_screen_freeze
endscript
script do_screen_freeze
  kill_net_panel_messages
  PauseGame
  if InNetGame
    exit_pause_menu menu_id = pause_menu
    force_close_rankings
    destroy_onscreen_keyboard
    StartNetworkLobby
  else
    exit_pause_menu menu_id = pause_menu
    force_close_rankings
    SetGameType freeskate2p
    SetCurrentGameType
  endif
  Wait 2 gameframe
  UnPauseGame
  Retry
endscript
script do_backend_end_run
  if InSplitScreenGame
    UseBothPadsInFrontEnd
  endif
  EndRun
endscript
script Paused_menu_backevent
  if CareerLevelIs LevelNum_Tutorials
    PauseStream 0
  else
    UnPauseMusicAndStreams
  endif
endscript
script do_backend_continue
  if CareerLevelIs LevelNum_Tutorials
    PauseStream 0
  else
    UnPauseMusicAndStreams
  endif
endscript
script do_backend_continue_delay
  Wait 0.2 seconds
endscript
script View_Goal_movies
  Printf "viewing movies -----------------------"
  SpawnSkaterScript StartRunScript params = { from_menu }
endscript
script View_ListAllGoals
endscript
script ResetLevelGoals
  UnSetGoal goal = GOAL_HIGHSCORE
  UnSetGoal goal = GOAL_PROSCORE
  UnSetGoal goal = GOAL_SICKSCORE
  UnSetGoal goal = GOAL_SKATE
  UnSetGoal goal = GOAL_TRICKSPOT
  UnSetGoal goal = GOAL_TAPE
  UnSetGoal goal = GOAL_SCRIPTED1
  UnSetGoal goal = GOAL_SCRIPTED2
  UnSetGoal goal = GOAL_SCRIPTED3
  UnSetFlag flag = GOAL_STAT_POINT1
  UnSetFlag flag = GOAL_STAT_POINT2
  UnSetFlag flag = GOAL_STAT_POINT3
  UnSetFlag flag = GOAL_STAT_POINT4
  UnSetFlag flag = GOAL_STAT_POINT5
  UnSetFlag flag = GOAL_STAT_POINTS
  UnSetFlag flag = GOAL_DECK
  LaunchLocalMessage "Goals reset"
  if CareerLevelIs LevelNum_Canada
    UnSetFlag flag = LEVEL_FLAG_AJC_CAN_LOG_LOADER_SEQUENCE_PLAYED_ALREADY
    UnSetFlag flag = LEVEL_FLAG_AJC_CAN_LOG_LOADER_IS_UP
    SetFlag flag = LEVEL_FLAG_AJC_CAN_LOG_LOADER_IS_DOWN
  endif
  if CareerLevelIs LevelNum_Ship
    UnSetFlag flag = BDJ_SHP_POOL
    UnSetFlag flag = BDJ_SHP_FERRY
    UnSetFlag flag = BDJ_SHP_NETS
    BDJ_SHP_RestartSetup
  endif
endscript
script do_end_comp
  EndCompetition
endscript
script test_fragmentation
  begin
    Wait 0.05 second
    Printf "Launching Message"
  repeat
endscript
script RefreshGameMenu_Replay
  PauseMusicAndStreams
  AddLine parent = game_menu id = backend_continue text = "Continue" target = "do_backend_continue" kill_menu
  AddLine parent = end_run_menu id = backend_watchreplay text = "Restart Replay" target = "WatchEndOfRunReplay" kill_menu
  if ReplayModeEquals REPLAY_MODE_PLAY_AFTER_RUN
    AddLine parent = game_menu id = backend_retry text = "Retry" target = "do_backend_retry" kill_menu
    AddLine parent = game_menu id = save_replay_from_pause text = "Save Replay" link = "_EndRunSaveReplay"
    AddLine parent = game_menu id = exit_replay_from_pause text = "Exit" link = "ExitReplayAfterEndOfRun"
  else
    AddLine parent = game_menu id = exit_replay_from_pause text = "Exit" link = "ExitSavedReplay"
  endif
endscript
script RefreshGameMenu
  Printf "refreshing"
  helper_select_choose_back_centered
  if InNetGame
  else
    PauseMusicAndStreams
  endif
  AddLine parent = game_menu id = backend_continue text = "Continue" target = "do_backend_continue" kill_menu
  if IsCareerMode
    if GetFlag flag = GOAL_MID_GOAL
      AddLine parent = game_menu id = end_current_goal text = "End Current Goal Try" target = "ResetAllOfTheGoals" kill_menu
    endif
    AddLine parent = game_menu id = retry_current_goal text = "Retry Last Goal" target = "RetryCurrentGoal" kill_menu
    AddLine parent = game_menu id = backend_end_run text = "goto Skate shop" target = "do_backend_end_run" kill_menu
  else
    AddLine parent = game_menu id = backend_retry text = "Retry" target = "do_backend_retry" kill_menu
  endif
  if InSplitScreenGame
    DestroyElement id = goto_trickset_menu
  else
  endif
  if IsCareerMode
    AddLine parent = game_menu id = ListAllGoals text = "View Current Goals" target = "View_ListAllGoals" kill_menu
    if CD
      DestroyElement id = backend_resetgoals
    else
      AddLine parent = game_menu id = backend_resetgoals text = "Reset Level Goals" target = "ResetLevelGoals" kill_menu
    endif
  else
    DestroyElement id = backend_resetgoals
    DestroyElement id = ListAllGoals
  endif
  AddLine parent = game_menu id = backend_sound_options text = "Sound Options" link = sfx_menu_container
  DestroyElement id = backend_cheat_menu
  if InNetGame
  else
    if GetGlobalFlag flag = CHEAT_UNLOCKED_1
      AddLine parent = game_menu id = backend_cheat_menu text = "Cheats" link = cheat_menu
    endif
  endif
  if CD
    DestroyElement id = goto_restart_menu
    DestroyElement id = game_menu_debug
  else
    AddLine parent = game_menu id = goto_restart_menu text = "Skip to Restart" link = restart_menu
    AddLine parent = game_menu id = game_menu_debug text = "debug menu" link = debug_main_menu
  endif
  if IsCompetition
    AddLine parent = game_menu id = end_comp text = "End Competition" target = "do_end_comp" kill_menu
  else
    DestroyElement id = end_comp
  endif
  SelectElement id = backend_continue
  if CareerLevelIs LevelNum_Tutorials
    if GetFlag flag = TUTORIAL_RUNNING
      AddLine parent = game_menu id = end_tutorial_item text = "Tutorials Menu" target = "EndCurrentTutorial" kill_menu
    endif
    DestroyElement id = goto_trickset_menu
    DestroyElement id = backend_cheat_menu
    DestroyElement id = backend_retry
    DestroyElement id = goto_restart_menu
    DestroyElement id = game_menu_debug
    DestroyElement id = backend_end_run
  else
  endif
endscript
script EndofRun_helper
  helper_hide
  FireMenuEvent Type = SHOW id = helper_menu_1 target = helper_menu_1
  FireMenuEvent Type = SHOW id = helper_menu_2 target = helper_menu_2
  helper_set_positions x1 = 190 x2 = 330
  SetMenuElementText id = helper_menu_1 "Select"
  SetMenuElementText id = helper_menu_2 "Accept"
endscript
script Refresh_EndofRunMenu
  EndofRun_helper
  if InNetGame
  else
    PauseMusicAndStreams
  endif
  if IsCareerMode
    if GetGlobalFlag flag = JUST_UNLOCKED_LEVEL
      SelectElement id = backend_change_level
    else
      SelectElement id = backend_retry2
    endif
  else
    SelectElement id = backend_retry2
  endif
  if IsCompetition
    AddLine parent = end_run_menu id = backend_retry2 text = "Restart Comp" target = "do_backend_retry" kill_menu
  else
    AddLine parent = end_run_menu id = backend_retry2 text = "Retry" target = "do_backend_retry" kill_menu
  endif
  if InSplitScreenGame
    AddLine parent = end_run_menu id = gameoptions_item text = "Game options" link = splitscreen_setup_menu
  else
    DestroyElement id = gameoptions_item
  endif
  if IsCareerMode
    if IsCompetition
      DestroyElement id = backend_watchreplay
    else
      AddLine parent = end_run_menu id = backend_watchreplay text = "Watch Replay" target = "WatchEndOfRunReplay" kill_menu
    endif
  else
    if GameModeEquals is_singlesession
      if IsCustomPark
        DestroyElement id = backend_watchreplay
      else
        AddLine parent = end_run_menu id = backend_watchreplay text = "Watch Replay" target = "WatchEndOfRunReplay" kill_menu
      endif
    else
      DestroyElement id = backend_watchreplay
    endif
  endif
  if IsTrue ShouldDisableReplays
    DestroyElement id = backend_watchreplay
  endif
  if IsCareerMode
    if IsCompetition
      DestroyElement id = view_goals_movies_element
    else
      AddLine parent = end_run_menu id = view_goals_movies_element text = "View Goal Movies" target = "View_Goal_movies" kill_menu
    endif
  else
    DestroyElement id = view_goals_movies_element
  endif
  if InSplitScreenGame
    DestroyElement id = goto_trickset_menu
  else
  endif
  if IsCareerMode
    AddLine parent = end_run_menu id = backend_change_level text = "Change Level" link = career_change_level_menu
  else
    AddLine parent = end_run_menu id = backend_change_level text = "Change Level" link = change_level_menu
  endif
  if IsCustomPark
    DestroyElement id = backend_change_level
  endif
  if InSplitScreenGame
    DestroyElement id = goto_trickset_menu
    DestroyElement id = save_game
  else
    AddLine parent = end_run_menu id = goto_trickset_menu text = "Edit Tricks" link = trick_menu_container
    AddLine parent = end_run_menu id = save_game text = "Save game" target = "InGameSave"
  endif
  DestroyElement id = endrun_cheat_menu
  if InNetGame
  else
    if GetGlobalFlag flag = CHEAT_UNLOCKED_1
      AddLine parent = end_run_menu id = endrun_cheat_menu text = "Cheats" link = cheat_menu
    endif
  endif
  AddLine parent = end_run_menu id = main_menu text = "Quit" link = quitgame_yesno_menu
  if CD
    DestroyElement id = backend_debug_menu
    DestroyElement id = backend_change_test_level
  else
    AddLine parent = end_run_menu id = backend_debug_menu text = "Debug Menu" link = debug_main_menu
    AddLine parent = end_run_menu id = backend_change_test_level text = "Change Test Level" link = test_level_menu
  endif
endscript
script goto_skateshop
  Change AutoLinkToCareerScreen = 1
  chosen_leave_server
endscript
script InGameEndMemCardSaveLoad
  SwitchToMenu menu = end_run_menu
endscript
script _InGameEndMemCardSaveLoad
  SpawnScript InGameEndMemCardSaveLoad params = <...>
endscript
script InGameSave
  helper_hide
  SpawnScript SaveOptionsAndPros params = { EndScr = InGameEndMemCardSaveLoad }
endscript
script Continue_to_endofrun
  SwitchToMenu menu = end_run_menu
endscript
script front_end_set_inactive
  FrontEndSetInactive
  if CareerLevelIs LevelNum_Tutorials
    PauseStream 0
  else
    UnPauseMusicAndStreams
  endif
endscript
script Select_No
  SelectElement id = quit_no
  helper_select_choose_back_centered
endscript
script Server_Select_No
  SelectElement id = server_quit_no
  helper_select_choose_back_centered
endscript
script Client_Select_No
  SelectElement id = client_quit_no
  helper_select_choose_back_centered
endscript
script populate_goals_menu
  DestroyElement id = level2
  DestroyElement id = level3
  DestroyElement id = level4
  DestroyElement id = level5
  DestroyElement id = level6
  DestroyElement id = level7
  DestroyElement id = level8
  DestroyElement id = level9
  GetGoalsCompleted LevelNum_Foundry
  AddLine parent = career_level_goals id = level1 text = <GoalsCompleted>
  GetGoalsCompleted LevelNum_Canada
  if GetGlobalFlag flag = LEVEL_UNLOCKED_CANADA
    AddLine parent = career_level_goals id = level2 text = <GoalsCompleted>
  else
    AddLine parent = career_level_goals id = level2 text = <GoalsCompleted> static
  endif
  GetGoalsCompleted LevelNum_Rio
  if GetGlobalFlag flag = LEVEL_UNLOCKED_RIO
    AddLine parent = career_level_goals id = level3 text = <BestMedal>
  else
    Printf "--------------------- Printing best medal for Rio"
    AddLine parent = career_level_goals id = level3 text = <BestMedal> static
  endif
  GetGoalsCompleted LevelNum_Suburbia
  if GetGlobalFlag flag = LEVEL_UNLOCKED_SUBURBIA
    AddLine parent = career_level_goals id = level4 text = <GoalsCompleted>
  else
    AddLine parent = career_level_goals id = level4 text = <GoalsCompleted> static
  endif
  GetGoalsCompleted LevelNum_Airport
  if GetGlobalFlag flag = LEVEL_UNLOCKED_AIRPORT
    AddLine parent = career_level_goals id = level5 text = <GoalsCompleted>
  else
    AddLine parent = career_level_goals id = level5 text = <GoalsCompleted> static
  endif
  GetGoalsCompleted LevelNum_SkaterIsland
  if GetGlobalFlag flag = LEVEL_UNLOCKED_SKATERISLAND
    AddLine parent = career_level_goals id = level6 text = <BestMedal>
  else
    AddLine parent = career_level_goals id = level6 text = <BestMedal> static
  endif
  GetGoalsCompleted LevelNum_LA
  if GetGlobalFlag flag = LEVEL_UNLOCKED_LOSANGELES
    AddLine parent = career_level_goals id = level7 text = <GoalsCompleted>
  else
    AddLine parent = career_level_goals id = level7 text = <GoalsCompleted> static
  endif
  GetGoalsCompleted LevelNum_Tokyo
  if GetGlobalFlag flag = LEVEL_UNLOCKED_TOKYO
    AddLine parent = career_level_goals id = level8 text = <BestMedal>
  else
    AddLine parent = career_level_goals id = level8 text = <BestMedal> static
  endif
  if GetGlobalFlag flag = SPECIAL_HAS_SEEN_SHIP
    GetGoalsCompleted LevelNum_Ship
    if GetGlobalFlag flag = LEVEL_UNLOCKED_SHIP
      AddLine parent = career_level_goals id = level9 text = <GoalsCompleted>
    else
      AddLine parent = career_level_goals id = level9 text = <GoalsCompleted> static
    endif
  else
    DestroyElement id = level9
  endif
endscript
script populate_level_menu
  helper_hide
  helper_select_choose_back x1 = 167 x2 = 282 x3 = 392
  if IsCareerMode
    populate_goals_menu
    GetNextLevelRequirements
    if GetGlobalFlag flag = SPECIAL_HAS_SEEN_SHIP
      DestroyElement id = next_level_at
      if GetGlobalFlag flag = LEVEL_UNLOCKED_SHIP
        AddLine parent = career_change_level_menu id = next_level_at text = "All levels unlocked" static drawer = main_smaller lock_layout y = 220
      else
        AddLine parent = career_change_level_menu id = next_level_at text = <NextLevelRequirements> static drawer = main_smaller lock_layout y = 220
      endif
    else
      AddLine parent = career_change_level_menu id = next_level_at text = <NextLevelRequirements> static drawer = main_smaller lock_layout y = 201
    endif
  else
    DestroyElement id = next_level_at
  endif
  VerifyParam param = parent_menu func = populate_level_menu <...>
  VerifyParam param = choose_script func = populate_level_menu <...>
  ForEachIn master_level_list do = add_level_menu_item params = { mask = regular_level target_script = <choose_script> parent_menu = <parent_menu> }
endscript
script toggle_player_names
  TogglePlayerNames
endscript
script toggle_scores
  ToggleScores
endscript
script enter_observer_mode
  EnterObserverMode
endscript
script enter_chat_mode
endscript
script back_to_main
  Printf "running back_to_main"
  LaunchMenuScreen screen = main_menu
endscript
script change_airtricks1
  Change Air_CircleL = Trick_Stiffy
endscript
script change_airtricks2
  Change Air_CircleR = Trick_Judo
endscript
script change_airtricks3
  Change Airtricks = Airtricks3
  Change JumpTricks = Jumptricks3
endscript
script set_cust_command
  if not IsBetterObserving
    if not IsObserving
      if not GoalManager_HasActiveGoals count_all
        set_custom_restart
      endif
    endif
  endif
endscript
script goto_cust_command
  if not IsBetterObserving
    if not IsObserving
      if not GoalManager_HasActiveGoals count_all
        if skater:SetCustomRestart
          skip_to_custom_restart
        endif
      endif   
    endif
  endif
endscript
script entered_chat_message
  GetTextElementString id = keyboard_current_string
  <message> = <string>
  GetArraySize chat_commands
  <index> = 0
  begin
    if ( <index> = <array_size> )
      SendChatMessage string = <message>
      break
    endif
    AddParams ( chat_commands [ <index> ] )
    if ( <message> = <command_text> )
      <command_scr> <params>
      break
    endif
     <index> = ( <index> + 1 )
  repeat
  destroy_onscreen_keyboard
endscript
script menu_entered_chat_message
  entered_chat_message
  create_pause_menu
endscript
script cancel_chat_menu
  destroy_onscreen_keyboard
  create_pause_menu
endscript
script launch_chat_keyboard
  DestroyScreenElement id = current_menu_anchor
  remove_pause_menu_textures_from_vram
  create_onscreen_keyboard allow_cancel keyboard_cancel_script = cancel_chat_menu keyboard_done_script = menu_entered_chat_message keyboard_title = "ENTER MESSAGE" min_length = 0 max_length = 50
endscript
script enter_kb_chat
  create_onscreen_keyboard allow_cancel no_buttons keyboard_done_script = entered_chat_message keyboard_title = "ENTER MESSAGE" min_length = 1 max_length = 50
endscript
script send_chat_message
  Printf "Sending chat message..."
  SendChatMessage <...>
endscript
script PreRunQueuedScripts
  SetSlomo 100.0
endscript
script PostRunQueuedScripts
  SetSlomo 1
endscript
