InNetOptionsFromNetPlay = 0
script launch_viewer
  Printf "launch_viewer is no longer needed ... you can remove it from your startup script"
endscript
script auto_launch_viewer
  LoadFromMemoryCard name = "Network settings" type = NetworkSettings
  UseNetworkPreferences
  LaunchViewer
endscript
NO_NET_MODE = 0
LAN_MODE = 1
INTERNET_MODE = 2
HOST_MODE_SERVE = 0
HOST_MODE_AUTO_SERVE = 1
HOST_MODE_FCFS = 2
JOIN_MODE_PLAY = 0
JOIN_MODE_OBSERVE = 1
e3_level_info = [
  { name = "College" checksum = load_sch }
  { name = "Zoo" checksum = load_zoo }
]
level_info = [
  { name = "College" checksum = load_sch }
  { name = "San Francisco" checksum = load_sf2 }
  { name = "Alcatraz" checksum = load_alc }
  { name = "Shipyard" checksum = load_jnk }
  { name = "London" checksum = load_lon }
  { name = "Kona" checksum = load_kon }
  { name = "Zoo" checksum = load_zoo }
  { name = "Carnival" checksum = load_cnv }
  { name = "Chicago" checksum = load_hof }
  { name = "Created Park" checksum = load_Sk4Ed_gameplay }
]
num_players_info = [
  { name = "2 Players" checksum = num_2 }
  { name = "3 Players" checksum = num_3 }
  { name = "4 Players" checksum = num_4 broadband_only }
  { name = "5 Players" checksum = num_5 broadband_only }
  { name = "6 Players" checksum = num_6 broadband_only }
  { name = "7 Players" checksum = num_7 broadband_only }
  { name = "8 Players" checksum = num_8 broadband_only }
]
net_game_type_info = [
  { name = "Trick Attack" description = "Player with the highest score at the end of the time limit wins" checksum = nettrickattack goal_script = StartGoal_TrickAttack }
  { name = "Score Challenge" description = "The first player to reach the\nset score wins" checksum = netscorechallenge goal_script = StartGoal_ScoreChallenge }
  { name = "Combo Mambo" description = "The player who busts the biggest combo during the time limit, wins" checksum = netcombomambo goal_script = StartGoal_ComboMambo }
  { name = "Slap!" description = "The player who slaps their opponents the most times, wins" checksum = netslap goal_script = StartGoal_Slap }
  { name = "King of the Hill" description = "The player who holds the crown\nfor the set time wins" checksum = netking goal_script = StartGoal_King }
  { name = "Graffiti" description = "The player who tags the most objects wins" checksum = netgraffiti goal_script = StartGoal_Graffiti }
  { name = "Goal Attack" description = "First one to finish all the \nselected goals wins" checksum = netgoalattack goal_script = StartGoal_GoalAttack not_in_custom_parks }
  { name = "Capture the Flag" description = "Capture another team's flag and return it to your base" checksum = netctf goal_script = StartGoal_CTF }
]
net_game_type_info_demo = [
  { name = "Trick Attack" description = "Player with the highest score at the end of the time limit wins" checksum = nettrickattack goal_script = StartGoal_TrickAttack }
  { name = "Slap!" description = "Player who slaps their opponent the most times within the time limit wins" checksum = netslap goal_script = StartGoal_Slap }
  { name = "King of the Hill" description = "Player who holds the crown for the set time wins" checksum = netking goal_script = StartGoal_King }
  { name = "Graffiti" description = "Player who tags the most objects wins" checksum = netgraffiti goal_script = StartGoal_Graffiti }
]
mp_game_type_info = [
  { name = "Trick Attack" description = "Player with the highest score at the end of the time limit wins" checksum = TrickAttack goal_script = StartGoal_TrickAttack }
  { name = "Score Challenge" description = "First one to reach set score wins" checksum = scorechallenge goal_script = StartGoal_ScoreChallenge }
  { name = "Combo Mambo" description = "The player who busts the biggest combo during the time limit, wins!" checksum = combomambo goal_script = StartGoal_ComboMambo }
  { name = "Slap!" description = "Player who slaps their opponent the most times within the time limit wins" checksum = slap goal_script = StartGoal_Slap }
  { name = "King of the Hill" description = "Player who holds the crown for the set time wins" checksum = king goal_script = StartGoal_King }
  { name = "Graffiti" description = "Player who tags the most objects wins" checksum = graffiti goal_script = StartGoal_Graffiti }
  { name = "Horse" description = "Pull off combos until someone spells horse" checksum = horse goal_script = do_nothing }
  { name = "Free Skate" description = "Skate the level freely" checksum = freeskate2p goal_script = StartFreeSkate }
]
num_observers_info = [
  { name = "No Observers" checksum = num_0 }
  { name = "1 Observer" checksum = num_1 broadband_only }
]
skill_level_info = [
  { name = "1: Baby Steps    " checksum = num_1 }
  { name = "2: I Can Crawl!  " checksum = num_2 }
  { name = "3: Hold My Own" checksum = num_3 }
  { name = "4: Let's Do This " checksum = num_4 }
  { name = "5: Bring It On!  " checksum = num_5 }
]
script sign_out
  SignOut
  create_pause_menu
endscript
script go_to_xbox_dashboard
  GotoXboxDashboard
endscript
script create_big_black_hiding_box
  unlock_root_window
  CreateScreenElement {
    type = SpriteElement
    parent = root_window
    id = big_black_box
    texture = black
    pos = (320, 240)
    rgba = [ 0 0 0 128 ]
    scale = (190, 190)
    just = [ center center ]
    z_priority = 5001
  }
endscript
script quit_network_game
  if OnXbox
    DisplayLoadingScreen "loadscrn_generic" 17
  else
    create_big_black_hiding_box
  endif
  console_destroy
  SetScreenElementProps {
    id = root_window
    event_handlers = [
      { pad_start handle_start_pressed }
    ]
    replace_handlers
  }
  if InInternetMode
    if ProfileLoggedIn
      SetLobbyStatus
    endif
  endif
  chosen_leave_server
  dialog_box_exit
  SetGameType career
  SetCurrentGameType
  SetStatOverride
  SetServerMode on
  StartServer
  SetJoinMode JOIN_MODE_PLAY
  JoinServer
  begin
    if JoinServerComplete
      break
    else
      Wait 1
    endif
  repeat
  if InInternetMode
    SetQuietMode off
  endif
  level_select_change_level level = load_skateshop no_levelUnload
endscript
script spawned_chosen_host_game
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  remove_host_options_sub_menu_textures_from_vram
  Cleanup preserve_skaters
  if IsXBOX
    DisplayLoadingScreen "loadscrn_system_link_x"
  else
    DisplayLoadingScreen "loadscrn_Online"
  endif
  FreeServerList
  LeaveServer
  SetGameType NetLobby
  SetCurrentGameType
  InitSkaterHeaps
  SetServerMode
  StartServer
  SetJoinMode JOIN_MODE_PLAY
  JoinServer
  begin
    if JoinServerComplete
      break
    else
      Wait 1
    endif
  repeat
  ChangeLevel level = use_preferences
  leave_front_end
  exit_pause_menu
endscript
script chosen_host_game
  if InNetGame
    network_start_selected
  else
    if InSplitScreenGame
      ApplySplitScreenOptions
      chosen_start_game
    else
      SpawnScript spawned_chosen_host_game NotSessionSpecific = 1
    endif
  endif
endscript
script network_selected
  change_gamemode_net
  SetMemThreadSafe
  remove_pause_menu_textures_from_vram
  UseNetworkPreferences
  TestNetworkSetup
endscript
script add_network_menu_textures_to_vram
  AddTextureToVram "level_top_piece"
  AddTextureToVram "level_repeat_mid"
  AddTextureToVram "level_bottom_piece"
  AddTextureToVram "goal_right"
  AddTextureToVram "stats_notch"
  AddTextureToVram "longbar"
  AddTextureToVram "up_arrow"
  AddTextureToVram "down_arrow"
  if IsPS2
    AddTextureToVram "gslogo"
  endif
endscript
script remove_network_menu_textures_from_vram
  RemoveTextureFromVram "level_top_piece"
  RemoveTextureFromVram "level_repeat_mid"
  RemoveTextureFromVram "level_bottom_piece"
  RemoveTextureFromVram "goal_right"
  RemoveTextureFromVram "stats_notch"
  RemoveTextureFromVram "longbar"
  RemoveTextureFromVram "up_arrow"
  RemoveTextureFromVram "down_arrow"
  if IsPS2
    RemoveTextureFromVram "gslogo"
  endif
endscript
script launch_network_host_options_sub_menu
  PrintStruct <...>
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
   <sub_menu_script> <...>
endscript
script back_from_account_list_menu
  CancelLogon
  SetNetworkMode
  create_pause_menu
endscript
script back_from_create_account_dialog
  dialog_box_exit
  back_from_account_list_menu
endscript
script back_from_wrong_pin_dialog
  dialog_box_exit
  ConnectToInternet
endscript
script launch_no_accounts_dialog
  create_dialog_box { title = "NO ACCOUNTS FOUND"
    text = "No accounts were found on your system. Would you like to create an account now?"
    buttons = [ { text = "Yes" pad_choose_script = go_to_xbox_dashboard }
      { text = "No" pad_choose_script = back_from_create_account_dialog }
    ]
  }
endscript
script launch_auto_server_notification
  destroy_onscreen_keyboard
  create_error_box { title = "Auto-Server"
    text = "This server is in auto-server mode.  When at least two players are present, games will launch one-after-another."
    buttons = [ { text = "ok" pad_choose_script = dialog_box_exit }
    ]
    no_animate
    delay_input
  }
endscript
script launch_auto_server_explanation
  destroy_onscreen_keyboard
  create_error_box { title = "Auto-Serve"
    text = "You are in auto-server mode.  When at least two players have joined, a new game will start and new games will follow thereafter."
    buttons = [ { text = "ok" pad_choose_script = dialog_box_exit }
    ]
    no_animate
    delay_input
  }
endscript
script launch_fcfs_notification
  if ( <checksum> = boolean_true )
    set_preferences_from_ui prefs = network field = "player_collision" string = "On" <...>
  else
    set_preferences_from_ui prefs = network field = "player_collision" string = "Off" <...>
  endif
  destroy_onscreen_keyboard
  force_close_rankings
  exit_pause_menu
  create_error_box { title = "Host Notification"
    text = "This server is in First Come First Serve mode.  You are the designated host.  You may change options and start games."
    buttons = [ { text = "ok" pad_choose_script = exit_async_dialog }
    ]
    no_animate
    delay_input
  }
endscript
script fcfs_confirm
  DestroyScreenElement id = current_menu_anchor
  remove_ss_menu_textures_from_vram
  create_dialog_box { title = "First Come First Serve"
    text = "This option will make you a permanent observer and will allow the first joining player to choose game modes and change levels.  Are you sure?"
    buttons = [ { text = "Yes" pad_choose_script = fcfs_selected }
      { text = "No" pad_choose_script = create_sit_out_menu }
    ]
    no_animate
  }
endscript
script auto_serve_confirm
  DestroyScreenElement id = current_menu_anchor
  remove_ss_menu_textures_from_vram
  create_dialog_box { title = "Auto Serve"
    text = "This option will make you a permanent observer. When at least two players have joined, a new game of the current game mode will start and new games will follow thereafter. Are you sure?"
    buttons = [ { text = "Yes" pad_choose_script = auto_serve_selected }
      { text = "No" pad_choose_script = create_sit_out_menu }
    ]
    no_animate
  }
endscript
script create_kick_ban_menu
  DestroyScreenElement id = current_menu_anchor
  create_dialog_box { title = <name>
    text = "Remove Player?"
    buttons = [ { text = "cancel" pad_choose_script = cancel_remove_player }
      { text = "kick" pad_choose_script = kick_player }
      { text = "ban" pad_choose_script = ban_player }
    ]
    no_animate
  }
endscript
script create_player_options_dialog
  if GotParam allow_remove_homie
    DestroyScreenElement id = current_menu_anchor
    if OnServer
      create_dialog_box { title = "Player Options"
        text = <name>
        buttons = [ { text = "cancel" pad_choose_script = cancel_remove_player }
          { text = "kick" pad_choose_script = kick_player }
          { text = "ban" pad_choose_script = ban_player }
          { text = "remove homie" pad_choose_script = remove_buddy pad_choose_params = <...> }
        ]
        no_animate
      }
    else
      create_dialog_box { title = "Player Options"
        text = <name>
        buttons = [ { text = "cancel" pad_choose_script = cancel_remove_player }
          { text = "remove homie" pad_choose_script = remove_buddy pad_choose_params = <...> }
        ]
        no_animate
      }
    endif
  else
    if GotParam allow_add_homie
      DestroyScreenElement id = current_menu_anchor
      if OnServer
        create_dialog_box { title = "Player Options"
          text = <name>
          buttons = [ { text = "cancel" pad_choose_script = cancel_remove_player }
            { text = "kick" pad_choose_script = kick_player }
            { text = "ban" pad_choose_script = ban_player }
            { text = "add homie" pad_choose_script = add_buddy pad_choose_params = <...> }
          ]
          no_animate
        }
      else
        create_dialog_box { title = "Player Options"
          text = <name>
          buttons = [ { text = "cancel" pad_choose_script = cancel_remove_player }
            { text = "add homie" pad_choose_script = add_buddy pad_choose_params = <...> }
          ]
          no_animate
        }
      endif
    else
      if OnServer
        DestroyScreenElement id = current_menu_anchor
        create_dialog_box { title = "Player Options"
          text = <name>
          buttons = [ { text = "cancel" pad_choose_script = cancel_remove_player }
            { text = "kick" pad_choose_script = kick_player }
            { text = "ban" pad_choose_script = ban_player }
          ]
          no_animate
        }
      endif
    endif
  endif
endscript
script launch_quit_game_dialog
  dialog_box_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_pause_menu_textures_from_vram
  create_quit_game_dialog
endscript
script create_quit_game_dialog
  create_error_box { title = "Quit Game"
    text = "Are you sure?"
    buttons = [ { text = "Yes" pad_choose_script = quit_network_game }
      { text = "No" pad_choose_script = quit_game_dialog_box_exit }
    ]
    no_animate
  }
endscript
script quit_game_dialog_box_exit
  generic_menu_pad_back_sound
  exit_pause_menu
  dialog_box_exit
endscript
script launch_wrong_pin_dialog_box
  DestroyScreenElement id = current_menu_anchor
  create_dialog_box { title = "WRONG PIN"
    text = "The PIN you have entered is incorrect."
    buttons = [ { text = "ok" pad_choose_script = back_from_wrong_pin_dialog }
    ]
  }
endscript
script select_xbox_multiplayer
  change_gamemode_net
  launch_select_skater_menu
endscript
script launch_network_select_games_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  create_network_select_games_menu play_cam
endscript
script launch_remove_players_menu
  DestroyScreenElement id = current_menu_anchor
  create_remove_players_menu
endscript
script launch_xbox_online_menu
  DestroyScreenElement id = current_menu_anchor
  create_xbox_online_menu
endscript
script chose_xbox_online
  if AlreadySignedIn
    create_xbox_online_menu
  else
    chose_internet
  endif
endscript
script chose_internet
  SetNetworkMode INTERNET_MODE
  if OnXbox
    ConnectToInternet
  else
    if ConnectToInternet
      if AlreadyGotMotd
        if ObjectExists id = current_menu_anchor
          DestroyScreenElement id = current_menu_anchor
        endif
        if not ProfileLogIn
          create_internet_options
        endif
      endif
    else
      if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
      endif
    endif
  endif
endscript
script confirm_observe
  dialog_box_exit
  EnterObserverMode
endscript
script chose_observe
  exit_pause_menu
  EnterObserverMode
endscript
script launch_motd_wait_dialog
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  create_motd_wait_dialog
endscript
script launch_network_select_lan_games_menu
  SetNetworkMode LAN_MODE
  launch_network_select_games_menu
endscript
script launch_network_host_options_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  create_network_host_options_menu
endscript
script host_chosen
  console_hide
  GSDisableNet
  StopServerList
  FreeServerList
  launch_network_host_options_menu
endscript
script host_net_chosen
  console_hide
  GSEnableNet
  StopServerList
  FreeServerList
  launch_network_host_options_menu
endscript
script fcfs_selected
  dialog_box_exit
  SetHostMode HOST_MODE_FCFS
  exit_pause_menu
endscript
script auto_serve_selected
  dialog_box_exit
  GetPreferenceChecksum pref_type = network game_type
  switch <checksum>
  case netgoalattack
    if not GoalManager_GoalsAreSelected
      exit_pause_menu
      create_dialog_box { title = "No Goals Selected"
        text = "You must select goals before starting the Goal Attack auto-server."
        buttons = [ { text = "ok" pad_choose_script = back_from_dialog }
        ]
      }
      return
    endif
  endswitch
  SetHostMode HOST_MODE_AUTO_SERVE
  exit_pause_menu
endscript
script join_chosen
  if FoundServers
    StopServerList
    SetJoinMode JOIN_MODE_PLAY
    actions_menu_anchor:DoMorph scale = 0
    DoScreenElementMorph id = game_list_up_arrow time = 0 scale = 1
    DoScreenElementMorph id = game_list_down_arrow time = 0 scale = 1
    hide_internet_only_menus
    server_desc_menu_anchor:DoMorph scale = 1
    FireEvent type = unfocus target = actions_menu
    FireEvent type = focus target = server_list_menu
    Change current_lobby_focus = 1
    AssignAlias id = server_list_menu alias = current_menu
  endif
endscript
script observe_chosen
  if FoundServers
    StopServerList
    SetJoinMode JOIN_MODE_OBSERVE
    actions_menu_anchor:DoMorph scale = 0
    hide_internet_only_menus
    server_desc_menu_anchor:DoMorph scale = 1
    FireEvent type = unfocus target = actions_menu
    FireEvent type = focus target = server_list_menu
    Change current_lobby_focus = 1
    AssignAlias id = server_list_menu alias = current_menu
  endif
endscript
script user_list_chosen
  DoScreenElementMorph id = user_list_up_arrow time = 0 scale = 1
  DoScreenElementMorph id = user_list_down_arrow time = 0 scale = 1
  FireEvent type = unfocus target = actions_menu
  FireEvent type = focus target = lobby_player_list_menu
  Change current_lobby_focus = 2
  AssignAlias id = lobby_player_list_menu alias = current_menu
endscript
script buddy_list_chosen
  FillBuddyList clear_list allow_remove
  DoScreenElementMorph id = player_list_anchor time = 0 scale = 0
  DoScreenElementMorph id = buddy_list_anchor time = 0 scale = 1
  FireEvent type = unfocus target = actions_menu
  FireEvent type = focus target = lobby_buddy_list_menu
endscript
script add_buddy_chosen
  FillLobbyProspectiveBuddyList
  actions_menu_anchor:DoMorph scale = 0
  lobby_buddy_list_menu:DoMorph time = 0 scale = 0.65
  lobby_buddy_list_title:DoMorph time = 0 scale = 0.65
  FireEvent type = unfocus target = actions_menu
  FireEvent type = focus target = lobby_buddy_list_menu
endscript
script refresh_chosen
  RefreshServerList
  if InInternetMode
    FillPlayerList
  endif
endscript
script refocus_actions_menu
  FireEvent type = unfocus target = server_list_menu
  FireEvent type = focus target = actions_menu
  Change current_lobby_focus = 0
  AssignAlias id = actions_menu alias = current_menu
  if InInternetMode
    FireEvent type = unfocus target = lobby_player_list_menu
    if ObjectExists id = lobby_buddy_list_menu
      FireEvent type = unfocus target = lobby_buddy_list_menu
    endif
    DoScreenElementMorph id = user_list_up_arrow time = 0 scale = 0
    DoScreenElementMorph id = user_list_down_arrow time = 0 scale = 0
    DoScreenElementMorph id = game_list_up_arrow time = 0 scale = 0
    DoScreenElementMorph id = game_list_down_arrow time = 0 scale = 0
    DoScreenElementMorph id = player_list_anchor time = 0 scale = 1
    DoScreenElementMorph id = chat_box_anchor time = 0 scale = 1
    if ObjectExists id = console_message_vmenu
      DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1
    endif
    DoScreenElementMorph id = buddy_list_anchor time = 0 scale = 0
  endif
endscript
script refocus_gamelist_menu
  SetScreenElementProps id = game_list_up_arrow alpha = 1
  SetScreenElementProps id = game_list_down_arrow alpha = 1
  FireEvent type = unfocus target = server_desc_menu
  FireEvent type = focus target = server_list_menu
endscript
script back_from_internet_options
  ProfileLogOff
  DestroyScreenElement id = current_menu_anchor
  create_network_select_menu
endscript
script create_profile_warning_dialog
  create_dialog_box { title = "GameSpy Profile"
    text = "Would you like to create a GameSpy profile? When logged in with a profile, you can find friends more easily."
    buttons = [ { text = "Yes" pad_choose_script = launch_profile_menu }
      { text = " No " pad_choose_script = create_internet_options }
    ]
  }
endscript
script hide_internet_only_menus
  if InInternetMode
    if ObjectExists id = console_message_vmenu
      DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
    endif
    DoScreenElementMorph id = chat_box_anchor time = 0 scale = 0
    DoScreenElementMorph id = player_list_anchor time = 0 scale = 0
  endif
endscript
script restore_internet_only_menus
  if InInternetMode
    DoScreenElementMorph id = player_list_anchor time = 0 scale = 1
    DoScreenElementMorph id = chat_box_anchor time = 0 scale = 1
    if ObjectExists id = console_message_vmenu
      DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1
    endif
  endif
endscript
script create_internet_options
  dialog_box_exit
  add_ss_menu_textures_to_vram
  GetPreferenceChecksum pref_type = network profile_warning_shown
  if ( <checksum> = boolean_false )
    set_preferences_from_ui prefs = network field = "profile_warning_shown" checksum = boolean_true string = "Yes"
    create_profile_warning_dialog
    return
  endif
  Change in_net_lobby = 0
  dialog_box_exit
  if not English
    make_new_menu menu_id = internet_options_menu vmenu_id = internet_options_vmenu menu_title = "" dims = (420, 100) pos = (220, 109)
  else
    make_new_menu menu_id = internet_options_menu vmenu_id = internet_options_vmenu menu_title = "" dims = (400, 100) pos = (220, 109)
  endif
  SetScreenElementProps { id = internet_options_menu event_handlers = [
      { pad_back back_from_internet_options }
    ]
  }
  create_helper_text generic_helper_text
  if not English
    CreateScreenElement {
      type = TextElement
      parent = current_menu_anchor
      font = testtitle
      text = "INTERNET OPTIONS"
      scale = 1.4
      pos = (180, 119)
      just = [ left top ]
      rgba = [ 128 128 128 98 ]
      not_focusable
      z_priority = 5
    }
  else
    CreateScreenElement {
      type = TextElement
      parent = current_menu_anchor
      font = testtitle
      text = "INTERNET OPTIONS"
      scale = 1.4
      pos = (190, 119)
      just = [ left top ]
      rgba = [ 128 128 128 98 ]
      not_focusable
      z_priority = 5
    }
  endif
  main_menu_add_item text = "" not_focusable = not_focusable dims = (300, 18)
  if not English
    highlight_bar_scale = (1.3, 1.3)
  else
    highlight_bar_scale = (1.1, 1.3)
  endif
  main_menu_add_item text = "Play Online" id = menu_play_online pad_choose_script = spawn_lobby_list highlight_bar_scale = <highlight_bar_scale>
  if not ProfileLoggedIn
    if IsTrue Demo_Build
      main_menu_add_item text = "Login/Create Profile" id = menu_create_profile highlight_bar_scale = <highlight_bar_scale> not_focusable = not_focusable
    else
      main_menu_add_item text = "Login/Create Profile" id = menu_create_profile pad_choose_script = launch_profile_menu highlight_bar_scale = <highlight_bar_scale>
    endif
  endif
  if IsTrue Demo_Build
    main_menu_add_item text = "Upload Parks" id = menu_upload highlight_bar_scale = <highlight_bar_scale> not_focusable = not_focusable
    main_menu_add_item text = "Download Parks" id = menu_download highlight_bar_scale = <highlight_bar_scale> not_focusable = not_focusable
  else
    main_menu_add_item text = "Upload Parks" id = menu_upload pad_choose_script = confirm_upload_current_park pad_choose_params = { load_park } highlight_bar_scale = <highlight_bar_scale>
    main_menu_add_item text = "Download Parks" id = menu_download pad_choose_script = download_content highlight_bar_scale = <highlight_bar_scale>
    main_menu_add_item text = "Save Settings" id = menu_save pad_choose_script = launch_save_internet_settings highlight_bar_scale = <highlight_bar_scale>
  endif
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
  if not English
    set_sub_bg pos = (320, 115) type = SpriteElement scale = (1.6, 1.1)
    draw_menu_box delta_pos = (88, 30) middle_repeat = 6 box_right_scale = (0.8, 0.56) scale = (1.4, 1) box_bottom_scale = (1.35, 1)
    create_icon pos = (123, 115) texture = PA_network
  else
    set_sub_bg pos = (298, 115) type = SpriteElement
    draw_menu_box delta_pos = (88, 30) middle_repeat = 6 box_right_scale = (0.8, 0.56) scale = (1.2, 1) box_bottom_scale = (1.16, 1)
    create_icon pos = (146, 115) texture = PA_network
  endif
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script confirm_upload_current_park
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  yes_script = upload_content
  no_script = confirm_upload_park
  back_script = create_internet_options
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_pause_menu_textures_from_vram
  create_error_box { title = "Upload Current Park?"
    text = "Do you want to upload the current park or a saved park?"
    pos = (310, 183)
    just = [ center center ]
    text_rgba = [ 88 105 112 128 ]
    pad_back_script = <back_script>
    pad_back_params = <params>
    buttons = [ { font = small text = "Current Park" pad_choose_script = <yes_script> pad_choose_params = { level = load_skateshop <params> } }
      { font = small text = "Saved Park" pad_choose_script = <no_script> pad_choose_params = <params> }
    ]
  }
  create_helper_text generic_helper_text_left_right parent = dialog_box_anchor
endscript
script confirm_upload_park
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  if IsParkUnsaved
    menu_confirm_quit { yes_script = launch_upload_park_load_park_sequence
      no_script = create_internet_options
      title = "Replace unsaved park?"
      back_script = create_internet_options
    }
  else
    launch_upload_park_load_park_sequence
  endif
endscript
script upload_content
  Printf "Uploading content"
  create_dialog_box { title = "Uploading file" text = "Starting transfer..." }
  UploadFile
endscript
script download_content
  Printf "retrieving directory listing"
  DestroyScreenElement id = current_menu_anchor
  create_dialog_box { title = net_status_msg
    text = "Retrieving directory listing..."
  }
  DownloadDirectoryList
endscript
script download_selected_file
  Printf "Downloading content"
  DestroyScreenElement id = current_menu_anchor
  create_dialog_box { title = "Downloading File"
    text = ""
  }
  DownloadFile <...>
endscript
script update_transfer_progress
  if ObjectExists id = dialog_box_text
    SetScreenElementProps {
      id = dialog_box_text
      text = <text>
    }
  endif
endscript
script back_from_transfer_dialog
  FreeDirectoryListing
  dialog_box_exit
  add_network_menu_textures_to_vram
  create_internet_options
endscript
script back_from_transfer_succeeded_dialog
  dialog_box_exit
  memcard_menus_cleanup
  net_vault_menu_create
endscript
script LaunchTransferFailedDialog
  net_vault_menu_exit
  dialog_box_exit
  create_dialog_box { title = "Transfer Failed"
    text = "Please check your network cables."
    buttons = [ { text = "ok" pad_choose_script = back_from_transfer_dialog }
    ]
  }
endscript
script LaunchDownloadCompleteDialog
  net_vault_menu_exit
  dialog_box_exit
  create_dialog_box { title = "Download Complete"
    text = "Save downloaded park?"
    buttons = [ { text = "Yes" pad_choose_script = launch_download_park_save_sequence }
      { text = "No" pad_choose_script = back_from_transfer_succeeded_dialog }
    ]
  }
endscript
script LaunchUploadCompleteDialog
  net_vault_menu_exit
  dialog_box_exit
  create_dialog_box { title = "Upload Complete"
    text = ""
    buttons = [ { text = "ok" pad_choose_script = back_from_transfer_dialog }
    ]
  }
endscript
script back_from_directory_listing
  DestroyScreenElement id = current_menu_anchor
  create_internet_options
endscript
script LaunchDirectoryListing
  dialog_box_exit
  make_new_menu menu_id = directory_listing_menu vmenu_id = directory_listing_vmenu menu_title = "DIRECTORY CONTENTS" type = VScrollingMenu dims = (200, 300) vscroll_pos = (230, 30) internal_scale = 0.25 allow_wrap = 0
  SetScreenElementProps { id = directory_listing_menu event_handlers = [
      { pad_back back_from_directory_listing }
    ]
  }
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript
script spawn_lobby_list
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  dialog_box_exit
  create_dialog_box { title = net_status_msg
    text = "Connecting to GameSpy..."
  }
  LobbyConnect
endscript
script back_from_internet_menu
  console_destroy
  LeaveLobby
  launch_lobby_list
endscript
script back_from_internet_host_options
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  remove_host_options_sub_menu_textures_from_vram
  if InNetGame
    create_pause_menu
  else
    launch_network_select_games_menu
  endif
endscript
script launch_lobby_list
  DestroyScreenElement id = current_menu_anchor
  StartLobbyList
endscript
script back_from_network_select_menu
  SetNetworkMode
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  remove_network_menu_textures_from_vram
  if not GotParam no_menu
    launch_ss_menu
  endif
endscript
script disconnect_from_internet
  DestroyScreenElement id = current_menu_anchor
  DisconnectFromInternet
endscript
in_net_lobby = 0
script create_network_select_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  make_new_menu menu_id = network_select_menu pos = (226, 109) vmenu_id = network_select_vmenu menu_title = "NETWORK" helper_text = generic_helper_text
  kill_start_key_binding
  KillSkaterCamAnim all
  PlaySkaterCamAnim name = SS_MenuCam play_hold
  SetScreenElementProps { id = network_select_vmenu event_handlers = [
      { pad_back back_from_network_select_menu }
    ]
  }
  menu_items = 0
  main_menu_add_item text = "" not_focusable = not_focusable dims = (200, 18)
  main_menu_add_item {
    text = "Internet"
    id = menu_network_select_internet
    pad_choose_script = network_select_menu_exit
    pad_choose_params = { callback = chose_internet }
  }
   <menu_items> = ( <menu_items> + 1 )
  GetPreferenceChecksum pref_type = network device_type
  switch <checksum>
  case device_sony_modem
  case device_usb_modem
    do_nothing
  default
    main_menu_add_item {
      text = "LAN"
      id = menu_network_select_lan
      pad_choose_script = network_select_menu_exit
      pad_choose_params = { callback = launch_network_select_lan_games_menu }
    }
     <menu_items> = ( <menu_items> + 1 )
  endswitch
  if IsOnline
    GetPreferenceChecksum pref_type = network device_type
    switch <checksum>
    case device_sony_modem
    case device_usb_modem
      main_menu_add_item text = "Hang Up Modem" id = menu_network_select_hang_up pad_choose_script = disconnect_from_internet
       <menu_items> = ( <menu_items> + 1 )
    endswitch
  endif
  set_sub_bg type = SpriteElement
  create_icon texture = PA_network
  if ( <menu_items> = 3 )
    middle_repeat = 4 box_right_scale = (0.8, 0.43)
  else
    middle_repeat = 2 box_right_scale = (0.8, 0.3)
  endif
  draw_menu_box delta_pos = (94, 30) middle_repeat = <middle_repeat> box_right_scale = <box_right_scale>
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script network_select_menu_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  remove_ss_menu_textures_from_vram
  add_network_menu_textures_to_vram
   <callback>
endscript
script make_server_list_menu
  create_console
  console_unhide
  add_network_menu_textures_to_vram
  SetScreenElementLock id = root_window off
  Change in_net_lobby = 1
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = server_list_anchor
    pos = (320, 224)
    just = [ center center ]
    scale = 0
    dims = (640, 448)
    focusable_child = actions_menu
  }
  if ( ( French ) or ( German ) or 1 )
    CreateScreenElement {
      type = ContainerElement
      parent = server_list_anchor
      id = actions_menu_anchor
      pos = (345, 320)
      dims = (640, 480)
    }
  else
    CreateScreenElement {
      type = ContainerElement
      parent = server_list_anchor
      id = actions_menu_anchor
      pos = (340, 300)
      dims = (640, 480)
    }
  endif
  if ( ( French ) or ( German ) or 1 )
    CreateScreenElement {
      type = VMenu
      parent = actions_menu_anchor
      id = actions_menu
      font = small
      just = [ left top ]
      pos = (65, 44)
      dims = (222, 170)
      internal_just = [ center top ]
      event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { Up } }
        { pad_down generic_menu_up_or_down_sound params = { Down } }
        { pad_back generic_menu_pad_back_sound }
      ]
    }
  else
    CreateScreenElement {
      type = VMenu
      parent = actions_menu_anchor
      id = actions_menu
      font = small
      just = [ left top ]
      pos = (20, 24)
      dims = (222, 170)
      internal_just = [ center top ]
      event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { Up } }
        { pad_down generic_menu_up_or_down_sound params = { Down } }
        { pad_back generic_menu_pad_back_sound }
      ]
    }
  endif
  if ( ( French ) or ( German ) or 1 )
    CreateScreenElement {
      type = TextElement
      parent = actions_menu_anchor
      font = testtitle
      text = "ACTIONS"
      scale = 1.45
      pos = (41, 4)
      just = [ left top ]
      rgba = [ 128 128 128 105 ]
      not_focusable
    }
  else
    CreateScreenElement {
      type = TextElement
      parent = actions_menu_anchor
      font = testtitle
      text = "ACTIONS"
      scale = 1.45
      pos = (60, 4)
      just = [ left top ]
      rgba = [ 128 128 128 105 ]
      not_focusable
    }
  endif
  if ( ( French ) or ( German ) or 1 )
    net_menu_add_bg {
      parent = actions_menu_anchor
      anchor_id = actions_menu_bg_anchor
      anchor_pos = (-130, -115)
      bg_scale = (1.54, 1)
      bg_repeat = 7
      box_right_scale = (0.7, 0.56)
    }
  else
    net_menu_add_bg {
      parent = actions_menu_anchor
      anchor_id = actions_menu_bg_anchor
      anchor_pos = (-178, -115)
      bg_scale = (0.8, 1)
      bg_repeat = 7
      box_right_scale = (0.7, 0.56)
    }
  endif
  if ( ( French ) or ( German ) or 1 )
    CreateScreenElement {
      type = SpriteElement
      parent = actions_menu_anchor
      id = actions_blue_bar
      texture = stats_notch
      pos = (70, 153)
      rgba = [ 42 48 77 50 ]
      scale = (14.5, 0.2)
      just = [ center top ]
    }
    set_sub_bg pos = (115, 0) parent = actions_menu_anchor
    create_icon pos = (-20, 0) parent = actions_menu_anchor texture = PA_network
  else
    CreateScreenElement {
      type = SpriteElement
      parent = actions_menu_anchor
      id = actions_blue_bar
      texture = stats_notch
      pos = (131, 153)
      rgba = [ 42 48 77 50 ]
      scale = (11.5, 0.2)
      just = [ center top ]
    }
    set_sub_bg pos = (158, 0) parent = actions_menu_anchor
    create_icon pos = (8, 0) parent = actions_menu_anchor texture = PA_network
  endif
  if ( ( French ) or ( German ) or 1 )
  else
    GetStackedScreenElementPos X id = <id> offset = (178, 50)
    CreateScreenElement {
      type = SpriteElement
      parent = actions_menu_bg_anchor
      texture = black
      rgba = [ 0 0 0 128 ]
      pos = <pos>
      just = [ left top ]
      scale = (35, 1.5)
    }
  endif
  CreateScreenElement {
    type = TextElement
    parent = actions_menu
    text = ""
    font = small
    scale = 0.9
    not_focusable
  }
  if ( ( French ) or ( German ) or 1 )
    CreateScreenElement {
      type = ContainerElement
      parent = server_list_anchor
      id = game_list_menu_anchor
      dims = (640, 480)
      pos = (383, 320)
    }
  else
    CreateScreenElement {
      type = ContainerElement
      parent = server_list_anchor
      id = game_list_menu_anchor
      dims = (640, 480)
      pos = (350, 300)
    }
  endif
  if ( ( French ) or ( German ) or 1 )
    CreateScreenElement {
      type = VScrollingMenu
      parent = game_list_menu_anchor
      id = server_list_scrolling_menu
      just = [ left top ]
      pos = (373, 80)
      dims = (440, 90)
      internal_just = [ left top ]
    }
  else
    CreateScreenElement {
      type = VScrollingMenu
      parent = game_list_menu_anchor
      id = server_list_scrolling_menu
      just = [ left top ]
      pos = (383, 80)
      dims = (440, 90)
      internal_just = [ left top ]
    }
  endif
  CreateScreenElement {
    type = VMenu
    parent = server_list_scrolling_menu
    id = server_list_menu
    font = small
    scale = 0.9
    just = [ left top ]
    pos = (10, 0)
    dims = (440, 200)
    internal_just = [ left top ]
    event_handlers = [
      { pad_up server_blink_up_arrow }
      { pad_down server_blink_down_arrow }
      { pad_up generic_menu_up_or_down_sound params = { Up } }
      { pad_down generic_menu_up_or_down_sound params = { Down } }
      { pad_back generic_menu_pad_back_sound }
    ]
    dont_allow_wrap
  }
  CreateScreenElement {
    type = TextElement
    parent = game_list_menu_anchor
    id = lobby_game_list_title
    font = dialog
    text = "LAN Games: 0"
    scale = 0.95
    pos = (395, 27)
    just = [ left top ]
    rgba = [ 46 105 57 128 ]
    not_focusable
  }
  CreateScreenElement {
    type = SpriteElement
    parent = game_list_menu_anchor
    id = game_list_up_arrow
    texture = up_arrow
    just = [ left top ]
    pos = (445, 48)
    not_focusable
    scale = 0
  }
  CreateScreenElement {
    type = SpriteElement
    parent = game_list_menu_anchor
    id = game_list_down_arrow
    texture = down_arrow
    just = [ left top ]
    pos = (445, 155)
    not_focusable
    scale = 0
  }
  if ( ( French ) or ( German ) or 1 )
    net_menu_add_bg {
      parent = game_list_menu_anchor
      anchor_id = server_list_menu_bg_anchor
      anchor_pos = (151, -115)
      bg_scale = (1.15, 1)
      bg_repeat = 7
      box_right_scale = (0.7, 0.56)
    }
  else
    net_menu_add_bg {
      parent = game_list_menu_anchor
      anchor_id = server_list_menu_bg_anchor
      anchor_pos = (151, -115)
      bg_scale = (0.85, 1)
      bg_repeat = 7
      box_right_scale = (0.7, 0.56)
    }
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = server_list_anchor
    id = server_desc_menu_anchor
    scale = 0
    pos = (320, 300)
    dims = (640, 480)
  }
  CreateScreenElement {
    type = VMenu
    parent = server_desc_menu_anchor
    id = server_desc_menu
    font = small
    scale = 0.9
    just = [ left top ]
    pos = (60, 30)
    dims = (200, 170)
    internal_just = [ left top ]
    not_focusable
  }
  net_menu_add_bg {
    parent = server_desc_menu_anchor
    anchor_id = server_desc_menu_bg_anchor
    anchor_pos = (-123, -115)
    bg_scale = (1.1, 1)
    bg_repeat = 17
    box_right_scale = (0.7, 1.18)
  }
  set_sub_bg pos = (170, 0) parent = server_desc_menu_anchor
  create_icon pos = (15, 0) parent = server_desc_menu_anchor texture = PA_network
  GetStackedScreenElementPos X id = <id> offset = (-7, 58)
  CreateScreenElement {
    type = SpriteElement
    parent = server_desc_menu_bg_anchor
    texture = black
    rgba = [ 0 0 0 128 ]
    pos = <pos>
    just = [ left top ]
    scale = (15, 1.5)
  }
  CreateScreenElement {
    type = TextElement
    parent = server_desc_menu_anchor
    id = server_desc_title
    font = testtitle
    text = "GAME INFO"
    pos = (65, 5)
    scale = 1.35
    just = [ left top ]
    rgba = [ 128 128 128 85 ]
    not_focusable
  }
  if InInternetMode
    CreateScreenElement {
      type = SpriteElement
      parent = game_list_menu_anchor
      pos = (455, 10)
      texture = gslogo scale = 1.1
    }
    GetStackedScreenElementPos X id = server_list_anchor offset = (50, 20)
    CreateScreenElement {
      type = ContainerElement
      parent = server_list_anchor
      id = player_list_anchor
      dims = (640, 480)
      pos = <pos>
    }
    CreateScreenElement {
      type = VScrollingMenu
      parent = player_list_anchor
      id = player_list_scrolling_menu
      just = [ left top ]
      pos = (365, 296)
      dims = (200, 80)
      internal_just = [ left top ]
    }
    CreateScreenElement {
      type = VMenu
      parent = player_list_scrolling_menu
      id = lobby_player_list_menu
      font = small
      just = [ left top ]
      pos = (0, 0)
      dims = (200, 100)
      internal_just = [ left top ]
      scale = 0.8
      event_handlers = [
        { pad_up user_blink_up_arrow }
        { pad_down user_blink_down_arrow }
        { pad_up generic_menu_up_or_down_sound params = { Up } }
        { pad_down generic_menu_up_or_down_sound params = { Down } }
        { pad_back generic_menu_pad_back_sound }
      ]
      dont_allow_wrap
    }
    if French
      item_pos = (365, 242)
    else
      item_pos = (400, 242)
    endif
    CreateScreenElement {
      type = TextElement
      parent = player_list_anchor
      id = lobby_player_list_title
      font = dialog
      text = "Users: 0"
      scale = 0.95
      pos = <item_pos>
      just = [ left top ]
      rgba = [ 46 105 57 128 ]
      not_focusable
    }
    CreateScreenElement {
      type = SpriteElement
      parent = player_list_anchor
      id = user_list_up_arrow
      texture = up_arrow
      just = [ left top ]
      pos = (430, 263)
      not_focusable
      scale = 0
    }
    CreateScreenElement {
      type = SpriteElement
      parent = player_list_anchor
      id = user_list_down_arrow
      texture = down_arrow
      just = [ left top ]
      pos = (430, 370)
      not_focusable
      scale = 0
    }
    net_menu_add_bg {
      parent = player_list_anchor
      anchor_id = lobby_player_list_bg
      anchor_pos = (132, 100)
      bg_scale = (0.85, 1)
      bg_repeat = 7
      box_right_scale = (0.7, 0.56)
    }
    GetStackedScreenElementPos X id = <id> offset = (-114, 100)
    CreateScreenElement {
      type = ContainerElement
      parent = server_list_anchor
      id = buddy_list_anchor
      dims = (640, 480)
      pos = <pos>
      scale = 0
    }
    GetStackedScreenElementPos X id = server_list_anchor offset = (-135, 21)
    CreateScreenElement {
      type = ContainerElement
      parent = server_list_anchor
      id = chat_box_anchor
      dims = (640, 480)
      pos = <pos>
    }
    CreateScreenElement {
      type = SpriteElement
      parent = chat_box_anchor
      texture = black
      rgba = [ 0 0 0 128 ]
      pos = <pos>
      just = [ left top ]
      scale = (84, 1.5)
    }
    CreateScreenElement {
      type = SpriteElement
      parent = chat_box_anchor
      texture = black
      rgba = [ 0 0 0 128 ]
      pos = ( <pos> + (0, 8) )
      just = [ left top ]
      scale = (84, 0.5)
    }
    CreateScreenElement {
      type = SpriteElement
      parent = chat_box_anchor
      texture = black
      rgba = [ 40 40 70 50 ]
      pos = <pos>
      just = [ left top ]
      scale = (84, 34.5)
      z_priority = 0
    }
    CreateScreenElement {
      type = SpriteElement
      parent = chat_box_anchor
      texture = black
      rgba = [ 0 0 0 128 ]
      pos = ( <pos> + (0, 137) )
      just = [ left top ]
      scale = (84, 1.5)
    }
    CreateScreenElement {
      type = SpriteElement
      parent = chat_box_anchor
      texture = black
      rgba = [ 0 0 0 128 ]
      pos = ( <pos> + (0, 133) )
      just = [ left top ]
      scale = (84, 0.5)
    }
  endif
  if InInternetMode
    DoScreenElementMorph id = player_list_anchor time = 0 scale = 1
    FillPlayerList
    FireEvent type = unfocus target = lobby_player_list_menu
    DoScreenElementMorph id = chat_box_anchor time = 0 scale = 1
    DoScreenElementMorph id = buddy_list_anchor time = 0 scale = 0
  endif
  AssignAlias id = server_list_anchor alias = current_menu_anchor
  AssignAlias id = actions_menu alias = current_menu
endscript
current_lobby_focus = 0
script server_list_menu_add_item
  if ObjectExists id = server_list_menu
     <highlight_bar_scale> = (0.87, 1.1)
     <highlight_bar_pos> = (96, -6)
     <focus_script> = server_list_focus
    SetScreenElementLock id = server_list_menu off
    main_menu_add_item <...> max_width = 220
    SetScreenElementLock id = server_list_menu on
    update_lobby_server_list
  endif
endscript
script player_list_add_item
  if ObjectExists id = <id>
    return
  endif
  if ObjectExists id = lobby_player_list_menu
    SetScreenElementLock id = lobby_player_list_menu off
    main_menu_add_item { parent = lobby_player_list_menu highlight_bar_scale = (0.975, 1.2) highlight_bar_pos = (94, -6) focus_script = player_list_focus <...> }
    SetScreenElementLock id = lobby_player_list_menu on
    update_lobby_player_list
  endif
endscript
script update_lobby_player_list
  if ScreenElementExists id = lobby_player_list_menu
    if not ( current_lobby_focus = 2 )
      if ScreenElementExists id = lobby_player_list_title
        NumPlayersInLobby
        FormatText TextName = title_text "Users: %n" n = <num_players>
        SetScreenElementProps id = lobby_player_list_title text = <title_text>
      endif
      SetScreenElementProps id = player_list_scrolling_menu reset_window
    endif
  endif
endscript
script update_lobby_server_list
  if ScreenElementExists id = server_list_menu
    if not ( current_lobby_focus = 1 )
      if ScreenElementExists id = lobby_game_list_title
        NumServersInLobby
        FormatText TextName = title_text "LAN Games: %n" n = <num_servers>
        SetScreenElementProps id = lobby_game_list_title text = <title_text>
      endif
      SetScreenElementProps id = server_list_scrolling_menu reset_window
    endif
  endif
endscript
script return_current_lobby_focus
  switch current_lobby_focus
  case 0
    FireEvent type = focus target = actions_menu
  case 1
    FireEvent type = focus target = server_list_menu
  case 2
    FireEvent type = focus target = lobby_player_list_menu
  default
    Printf "return_current_lobby_focus This should never happen!"
  endswitch
endscript
script server_list_focus
  generic_menu_update_arrows menu_id = server_list_menu up_arrow_id = game_list_up_arrow down_arrow_id = game_list_down_arrow
  describe_selected_server <...>
endscript
script player_list_focus
  generic_menu_update_arrows menu_id = lobby_player_list_menu up_arrow_id = user_list_up_arrow down_arrow_id = user_list_down_arrow
  main_menu_focus
endscript
script user_blink_up_arrow
  RunScriptOnScreenElement id = user_list_up_arrow menu_blink_arrow
endscript
script user_blink_down_arrow
  RunScriptOnScreenElement id = user_list_down_arrow menu_blink_arrow
endscript
script server_blink_up_arrow
  RunScriptOnScreenElement id = game_list_up_arrow menu_blink_arrow
endscript
script server_blink_down_arrow
  RunScriptOnScreenElement id = game_list_down_arrow menu_blink_arrow
endscript
script homie_list_add_item name = "" status = "" location = ""
  Printf "homie_list_add_item"
  if ObjectExists id = lobby_buddy_list_menu
    CreateScreenElement {
      type = ContainerElement
      parent = lobby_buddy_list_menu
      dims = (500, 24)
      event_handlers = [
        { focus homie_list_focus }
        { unfocus homie_list_unfocus }
        { pad_choose present_buddy_options params = { <pad_choose_params> } }
        { pad_start present_buddy_options params = { <pad_choose_params> } }
        { pad_choose generic_menu_pad_choose_sound }
      ]
    }
    anchor_id = <id>
    CreateScreenElement {
      type = TextElement
      parent = <anchor_id>
      text = <name>
      font = dialog
      scale = 0.75
      pos = (0, 0)
      just = [ left top ]
      rgba = [ 88 105 112 128 ]
    }
    CreateScreenElement {
      type = TextElement
      parent = <anchor_id>
      text = <status>
      font = dialog
      scale = 0.75
      pos = (160, 0)
      just = [ left top ]
      rgba = [ 88 105 112 128 ]
    }
    CreateScreenElement {
      type = TextElement
      parent = <anchor_id>
      font = dialog
      text = <location>
      scale = 0.75
      pos = (265, 0)
      just = [ left top ]
      rgba = [ 88 105 112 128 ]
    }
    truncate_string id = <id> max_width = 205
  endif
endscript
script homie_list_focus
  generic_menu_update_arrows {
    menu_id = lobby_buddy_list_menu
    up_arrow_id = buddy_list_up_arrow
    down_arrow_id = buddy_list_down_arrow
  }
  GetTags
  SetScreenElementProps id = { <id> child = 0 } rgba = [ 127 102 0 128 ]
  SetScreenElementProps id = { <id> child = 1 } rgba = [ 127 102 0 128 ]
  SetScreenElementProps id = { <id> child = 2 } rgba = [ 127 102 0 128 ]
endscript
script homie_list_unfocus
  GetTags
  generic_menu_pad_up_down_sound
  KillSpawnedScript name = do_random_effect
  SetScreenElementProps id = { <id> child = 0 } rgba = [ 88 105 112 128 ]
  SetScreenElementProps id = { <id> child = 1 } rgba = [ 88 105 112 128 ]
  SetScreenElementProps id = { <id> child = 2 } rgba = [ 88 105 112 128 ]
endscript
script net_menu_add_bg
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = <anchor_id>
    dims = (640, 480)
    pos = <anchor_pos>
    just = [ left top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = level_top_piece
    pos = (310, 145)
    rgba = [ 128 128 128 100 ]
    scale = <bg_scale>
    just = [ center top ]
    z_priority = -1
  }
   <top_piece_id> = <id>
  begin
    GetStackedScreenElementPos Y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = <anchor_id>
      texture = level_repeat_mid
      pos = <pos>
      scale = <bg_scale>
      rgba = [ 128 128 128 100 ]
      just = [ left top ]
      z_priority = -1
    }
  repeat <bg_repeat>
  GetStackedScreenElementPos X id = <top_piece_id> offset = (-20, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = goal_right
    scale = <box_right_scale>
    rgba = [ 128 128 128 100 ]
    pos = <pos>
    just = [ left top ]
    z_priority = -1
  }
  return id = <id>
endscript
script back_from_game_list
  TryJoinServerIPCancel
  RefreshServerList force_refresh
  actions_menu_anchor:DoMorph scale = 1
  server_desc_menu_anchor:DoMorph scale = 0
  destroy_server_desc_children
  refocus_actions_menu
endscript
script back_from_user_list
  actions_menu_anchor:DoMorph scale = 1
  refocus_actions_menu
endscript
script back_from_buddy_list
  actions_menu_anchor:DoMorph scale = 1
  refocus_actions_menu
endscript
script start_internet_game2
  SetNetworkMode LAN_MODE
  Change check_for_unplugged_controllers = 1
  console_hide
  StopServerList
  FreeServerList
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  create_network_host_options_menu2
endscript
script check_ip_from_keyboard_failure_exit
  dialog_box_exit
  create_network_select_games_menu
endscript
script check_ip_from_keyboard_failure
  TryJoinServerIPCancel
  create_snazzy_dialog_box {
    title = 'Unable to connect'
    text = 'Unable to connect to server.'
    pad_back_script = create_network_select_games_menu
    buttons = [
      { font = small text = 'OK' pad_choose_script = check_ip_from_keyboard_failure_exit }
    ]
  }
  ResetTimer
  begin
    if TimeGreaterThan 5
      break
    endif
    Wait 1 gameframe
  repeat
  if ScreenElementExists id = dialog_box_anchor
    dialog_box_exit
    create_network_select_games_menu play_cam
  endif
endscript
script check_ip_from_keyboard_cancel
  dialog_box_exit
  TryJoinServerIPCancel
  add_pause_menu_textures_to_vram
  create_network_select_games_menu play_cam
endscript
script check_ip_from_keyboard
  GetTextElementString id = keyboard_current_string
  destroy_onscreen_keyboard
  if not GotParam cancel
    TryJoinServerIP string = <string>
    ResetTimer
    create_snazzy_dialog_box { title = 'Checking...'
      text = 'Checking for server...'
      pad_back_script = check_ip_from_keyboard_cancel
      buttons = [
        { font = small text = 'Cancel' pad_choose_script = check_ip_from_keyboard_cancel }
      ]
    }
    begin
      if TimeGreaterThan 5
        break
      endif
      if TryJoinServerIPSuccess
        break
      endif
      Wait 1 gameframe
    repeat
  endif
  if GotParam cancel
    create_network_select_games_menu
  else
    if not TryJoinServerIPSuccess
      if ScreenElementExists id = dialog_box_anchor
        dialog_box_exit
        check_ip_from_keyboard_failure
      endif
    else
      dialog_box_exit
      add_pause_menu_textures_to_vram
      create_network_select_games_menu play_cam
    endif
  endif
endscript
script check_join_internet_ip
  console_hide
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  TryJoinInternetGame
  create_snazzy_dialog_box { title = 'Checking...'
    text = 'Checking for server...'
    pad_back_script = check_ip_from_keyboard_cancel
    buttons = [
      { font = small text = 'Cancel' pad_choose_script = check_ip_from_keyboard_cancel }
    ]
  }
  begin
    if not TryingToJoinGame
      break
    endif
    TryJoinInternetGame
    ResetTimer
    begin
      if TimeGreaterThan 3
        break
      endif
      if TryJoinServerIPSuccess
        break
      endif
      Wait 1 gameframe
    repeat
    if TryJoinServerIPSuccess
      break
    endif
  repeat 10
  if not TryJoinServerIPSuccess
    TryJoinServerIPCancel
    if ScreenElementExists id = dialog_box_anchor
      dialog_box_exit
      check_ip_from_keyboard_failure
    endif
  else
    dialog_box_exit
    add_pause_menu_textures_to_vram
    create_network_select_games_menu play_cam
  endif
endscript
script create_network_menu_exit
  console_hide
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
   <new_menu_script> <...>
endscript
script create_network_select_games_menu
  if GotParam play_cam
    KillSkaterCamAnim all
    PlaySkaterCamAnim name = SS_MenuCam play_hold
  endif
  dialog_box_exit
  SetNetworkMode LAN_MODE
  if IsInternetGameHost
    host_net_chosen
  else
    SetNetworkMode LAN_MODE
    make_server_list_menu
    create_helper_text generic_helper_text pos = (0, 0)
    if OnXbox
      SetNetworkMode LAN_MODE
    endif
    if InInternetMode
      SetScreenElementProps { id = actions_menu event_handlers = [
          { pad_back back_from_internet_menu }
        ]
      }
      SetScreenElementProps { id = lobby_player_list_menu event_handlers = [
          { pad_back back_from_user_list }
        ]
      }
      if ObjectExists id = lobby_buddy_list_menu
        SetScreenElementProps { id = lobby_buddy_list_menu event_handlers = [
            { pad_back back_from_buddy_list }
          ]
        }
      endif
    else
      if OnXbox
        SetScreenElementProps { id = actions_menu event_handlers = [
            { pad_back back_from_multiplayer_menu }
          ]
        }
      else
        SetScreenElementProps { id = actions_menu event_handlers = [
            { pad_back back_from_network_menu }
          ]
        }
      endif
    endif
    SetScreenElementProps { id = server_list_menu event_handlers = [
        { pad_back back_from_game_list }
      ]
    }
    if ( ( French ) or ( German ) or 1 )
      main_menu_add_item text = "Host LAN Game" parent = actions_menu id = menu_network_select_host pad_choose_script = host_chosen highlight_bar_scale = (1.43, 1.3)
      main_menu_add_item text = "Host GameSpy Arcade Game" parent = actions_menu id = menu_network_select_net_host pad_choose_script = host_net_chosen highlight_bar_scale = (1.43, 1.3)
      main_menu_add_item text = "Join LAN Game" parent = actions_menu id = menu_network_select_join pad_choose_script = join_chosen highlight_bar_scale = (1.43, 1.3)
      main_menu_add_item { text = 'Join IP'
        id = menu_network_select_join_ip
        highlight_bar_scale = (1.43, 1.3)
        pad_choose_script = create_network_menu_exit
        pad_choose_params = { new_menu_script = create_onscreen_keyboard
          text = ""
          keyboard_title = "ENTER IP"
          min_length = 1
          max_length = 15
          keyboard_done_script = check_ip_from_keyboard
          keyboard_cancel_script = check_ip_from_keyboard
          keyboard_cancel_params = { cancel }
          allow_cancel }
      }
      if InInternetMode
        main_menu_add_item text = "Observe Game" parent = actions_menu id = menu_network_select_observe pad_choose_script = observe_chosen highlight_bar_scale = (1.43, 1.3)
      endif
      main_menu_add_item text = "Refresh" parent = actions_menu id = menu_network_select_refresh pad_choose_script = refresh_chosen highlight_bar_scale = (1.43, 1.3)
      if InInternetMode
        main_menu_add_item text = "User List" parent = actions_menu id = menu_network_select_user_list pad_choose_script = user_list_chosen highlight_bar_scale = (1.43, 1.3)
        main_menu_add_item text = "Homie List" parent = actions_menu id = menu_network_select_buddy_list pad_choose_script = launch_shell_buddy_list pad_choose_params = { from_lobby } highlight_bar_scale = (1.43, 1.3)
        main_menu_add_item text = "Enter Message" parent = actions_menu id = menu_network_select_chat pad_choose_script = create_lobby_onscreen_kb highlight_bar_scale = (1.43, 1.3)
      endif
      add_no_servers_found_message refocus
    else
      main_menu_add_item text = "Host LAN Game" parent = actions_menu id = menu_network_select_host pad_choose_script = host_chosen highlight_bar_scale = (0.73, 1.3)
      main_menu_add_item text = "Host GameSpy Arcade Game" parent = actions_menu id = menu_network_select_net_host pad_choose_script = host_net_chosen highlight_bar_scale = (0.73, 1.3)
      main_menu_add_item text = "Join LAN Game" parent = actions_menu id = menu_network_select_join pad_choose_script = join_chosen highlight_bar_scale = (0.73, 1.3)
      main_menu_add_item { text = 'Join IP'
        id = menu_network_select_join_ip
        highlight_bar_scale = (0.73, 1.3)
        pad_choose_script = create_network_menu_exit
        pad_choose_params = { new_menu_script = create_onscreen_keyboard
          text = ""
          keyboard_title = "ENTER IP"
          min_length = 1
          max_length = 15
          keyboard_done_script = check_ip_from_keyboard
          keyboard_cancel_script = check_ip_from_keyboard
          keyboard_cancel_params = { cancel }
          allow_cancel }
      }
      if InInternetMode
        main_menu_add_item text = "Observe Game" parent = actions_menu id = menu_network_select_observe pad_choose_script = observe_chosen highlight_bar_scale = (0.73, 1.3)
      endif
      main_menu_add_item text = "Refresh" parent = actions_menu id = menu_network_select_refresh pad_choose_script = refresh_chosen highlight_bar_scale = (0.73, 1.3)
      if InInternetMode
        main_menu_add_item text = "User List" parent = actions_menu id = menu_network_select_user_list pad_choose_script = user_list_chosen highlight_bar_scale = (0.73, 1.3)
        main_menu_add_item text = "Homie List" parent = actions_menu id = menu_network_select_buddy_list pad_choose_script = launch_shell_buddy_list pad_choose_params = { from_lobby } highlight_bar_scale = (0.73, 1.3)
        main_menu_add_item text = "Enter Message" parent = actions_menu id = menu_network_select_chat pad_choose_script = create_lobby_onscreen_kb highlight_bar_scale = (0.73, 1.3)
      endif
      add_no_servers_found_message refocus
    endif
    RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
    FireEvent type = unfocus target = server_list_menu
    FireEvent type = unfocus target = server_desc_menu
    if InInternetMode
      FireEvent type = unfocus target = lobby_player_list_menu
    endif
    FireEvent type = focus target = actions_menu
    Change current_lobby_focus = 0
    AssignAlias id = actions_menu alias = current_menu
    if IsJoiningInternetGame
      check_join_internet_ip
    else
      if not TryJoinServerIPSuccess
        RefreshServerList force_refresh
      endif
      Change check_for_unplugged_controllers = 1
      if GotParam focus_on_enter_message
        RunScriptOnScreenElement id = current_menu_anchor set_enter_message_focus
      endif
      if TryJoinServerIPSuccess
        Wait 3 gameframe
        ForceServerListRefresh
        join_chosen
      endif
    endif
  endif
endscript
script set_enter_message_focus
  menu_onscreen <...>
  FireEvent type = unfocus target = actions_menu
  FireEvent type = focus target = actions_menu data = { child_id = menu_network_select_chat }
endscript
script back_to_server_list_from_buddy_list
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_buddy_list_textures_from_vram
  create_network_select_games_menu
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1
  endif
endscript
script back_to_pause_menu_from_buddy_list
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_buddy_list_textures_from_vram
  remove_ss_menu_textures_from_vram
  GoalManager_ShowPoints
  create_pause_menu
endscript
script create_remove_players_menu
  make_new_menu menu_id = remove_players_menu vmenu_id = remove_players_vmenu menu_title = "REMOVE WHICH PLAYER?"
  SetScreenElementProps { id = remove_players_menu event_handlers = [
      { pad_back create_pause_menu }
    ]
  }
  FillRemovePlayersMenu
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript
script create_xbox_online_menu
  make_new_menu menu_id = xbox_online_menu vmenu_id = xbox_online_vmenu menu_title = "XBOX ONLINE"
  SetScreenElementProps { id = xbox_online_menu event_handlers = [
      { pad_back create_pause_menu }
    ]
  }
  make_text_sub_menu_item text = "Play Live" id = menu_xonline_play_live pad_choose_script = do_nothing
  make_text_sub_menu_item text = "Friends" id = menu_xonline_friends pad_choose_script = launch_buddy_list
  make_text_sub_menu_item text = "Sign Out" id = menu_xonline_sign_out pad_choose_script = sign_out
  make_text_sub_menu_item text = "Xbox Dashboard" id = menu_xonline_dashboard pad_choose_script = go_to_xbox_dashboard
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript
script create_sit_out_menu
  dialog_box_exit
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  make_new_menu menu_id = sit_out_menu vmenu_id = sit_out_vmenu menu_title = ""
  SetScreenElementProps { id = sit_out_menu event_handlers = [
      { pad_back create_pause_menu }
    ]
  }
  create_helper_text generic_helper_text
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "SIT OUT"
    scale = 1.4
    pos = (206, 112)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  main_menu_add_item text = "" pad_choose_script = null_script not_focusable = not_focusable
  main_menu_add_item text = "First Come, First Serve" id = menu_network_fcfs_select pad_choose_script = fcfs_confirm highlight_bar_scale = (1.15, 1.3) highlight_bar_pos = (97, -7)
  main_menu_add_item text = "Auto-Serve" id = menu_network_auto_serve_select pad_choose_script = auto_serve_confirm highlight_bar_scale = (1.15, 1.3) highlight_bar_pos = (97, -7)
  set_sub_bg pos = (166, 108) just = [ left top ] scale = (1.37, 1.1)
  create_icon texture = PA_options pos = (151, 108)
  draw_menu_box middle_repeat = 2 box_right_scale = (0.8, 0.31) scale = (1.25, 1) box_bottom_scale = (1.2, 1) box_right_offset = (-25, 0)
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript
script launch_network_sit_out_menu
  DestroyScreenElement id = current_menu_anchor
  create_sit_out_menu
endscript
script do_nothing
endscript
script create_motd_menu
  dialog_box_exit
  create_dialog_box { title = "MESSAGE"
    text = <message>
    buttons = [ { text = "ok" pad_choose_script = profile_connect }
    ]
  }
endscript
script create_motd_wait_dialog
  create_dialog_box { title = net_status_msg
    text = net_status_checking_motd
    no_animate
  }
endscript
script CreateMotdRetryDialog
  dialog_box_exit
  create_dialog_box { title = net_status_msg
    text = <message>
  }
endscript
script CreateMotdFailedDialog
  dialog_box_exit
  create_dialog_box { title = net_status_msg
    text = net_status_motd_failed
    buttons = [ { text = "ok" pad_choose_script = back_from_startup_error_dialog }
    ]
  }
endscript
script CreateBuddyLoginFailedDialog
  dialog_box_exit
  create_dialog_box { title = net_error_msg
    text = net_status_buddy_login_failed
    buttons = [ { text = "ok" pad_choose_script = back_from_profile_error }
    ]
  }
endscript
script back_from_removed_dialog
  dialog_box_exit
  if EnteringNetGame
    cancel_join_server
  else
    quit_network_game
  endif
endscript
script CreateServerRemovedYouDialog
  HideLoadingScreen
  force_close_rankings dont_retry
  destroy_onscreen_keyboard
  dialog_box_exit
  exit_pause_menu
  if not IsObserving
    skater:Vibrate off
  endif
  create_error_box { title = net_notice_msg
    text = net_message_server_removed_you
    buttons = [ { text = "ok" pad_choose_script = back_from_removed_dialog }
    ]
    delay_input
  }
endscript
script CreateServerMovedOnDialog
  HideLoadingScreen
  force_close_rankings dont_retry
  destroy_onscreen_keyboard
  dialog_box_exit
  exit_pause_menu
  if not IsObserving
    skater:Vibrate off
  endif
  create_error_box { title = net_notice_msg
    text = net_message_server_moved_on
    buttons = [ { text = "ok" pad_choose_script = back_from_removed_dialog }
    ]
    delay_input
  }
endscript
script destroy_server_menu_children
  if ObjectExists id = server_list_menu
    SetScreenElementLock id = server_list_menu off
    DestroyScreenElement id = server_list_menu recurse preserve_parent
    if GotParam refocus
      refocus_actions_menu
    endif
  endif
endscript
script destroy_server_desc_children
  SetScreenElementLock id = server_desc_menu off
  DestroyScreenElement id = server_desc_menu recurse preserve_parent
  refocus_gamelist_menu
endscript
script destroy_lobby_user_list_children
  if ObjectExists id = lobby_player_list_menu
    prepare_lobby_user_list_for_new_children
    DestroyScreenElement id = lobby_player_list_menu recurse preserve_parent
  endif
endscript
script destroy_lobby_user
  if ObjectExists id = <user_id>
    DestroyScreenElement id = <user_id>
  endif
endscript
script destroy_lobby_server
  if ObjectExists id = <server_id>
    DestroyScreenElement id = <server_id>
  endif
endscript
script destroy_lobby_buddy_list_children
  if ObjectExists id = lobby_buddy_list_menu
    prepare_lobby_buddy_list_for_new_children
    DestroyScreenElement id = lobby_buddy_list_menu recurse preserve_parent
  endif
endscript
script add_no_servers_found_message
  if ObjectExists id = server_list_menu
    SetScreenElementLock id = server_list_menu off
    main_menu_add_item text = "No LAN Servers Found" parent = server_list_menu id = menu_network_no_servers
    if GotParam refocus
      refocus_actions_menu
    endif
  endif
endscript
script prepare_server_menu_for_new_children
  if ObjectExists id = server_list_menu
    SetScreenElementLock id = server_list_menu off
  endif
endscript
script prepare_lobby_user_list_for_new_children
  if ObjectExists id = lobby_player_list_menu
    SetScreenElementLock id = lobby_player_list_menu off
  endif
endscript
script prepare_lobby_buddy_list_for_new_children
  if ObjectExists id = lobby_buddy_list_menu
    SetScreenElementLock id = lobby_buddy_list_menu off
  endif
endscript
script choose_selected_lobby
  ChooseLobby <...>
  DestroyScreenElement id = current_menu_anchor
  create_joining_lobby_dialog
endscript
script choose_selected_server
  console_hide
  ChooseServer <...>
  DestroyScreenElement id = current_menu_anchor
endscript
script describe_selected_server
  main_menu_focus
  DescribeServer <...>
endscript
script choose_selected_player
  if OnXbox
    RemovePlayer <...>
  else
    CreatePlayerOptions <...>
  endif
endscript
script choose_selected_account
  ChooseAccount <...>
endscript
script cancel_remove_player
  CancelRemovePlayer
  dialog_box_exit
  create_pause_menu
endscript
script kick_player
  KickPlayer
  dialog_box_exit
  create_pause_menu
endscript
script back_from_dialog
  dialog_box_exit
  create_pause_menu
endscript
script ban_player
  BanPlayer
  dialog_box_exit
  create_pause_menu
endscript
script launch_pin_entry_menu
  DestroyScreenElement id = current_menu_anchor
  create_pin_entry_menu
endscript
script launch_buddy_list
  DestroyScreenElement id = current_menu_anchor
  create_buddy_list_menu
endscript
script net_chosen_join_server
  LeaveServer
  SetServerMode off
  JoinServer <...>
  PlaySkaterCamAnim name = SS_MenuCam play_hold
  kill_start_key_binding
  leave_front_end
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  Change check_for_unplugged_controllers = 0
endscript
script net_chosen_join_server_ip
  LeaveServer
  SetServerMode off
  JoinServerIP
  PlaySkaterCamAnim name = SS_MenuCam play_hold
  kill_start_key_binding
  leave_front_end
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  Change check_for_unplugged_controllers = 0
endscript
script create_lobby_list_menu
  make_new_menu { menu_id = lobby_list_menu
    type = VScrollingMenu
    dims = (200, 252)
    pos = (226, 116)
    vmenu_id = lobby_list_vmenu
    menu_title = ""
    dont_allow_wrap = dont_allow_wrap
  }
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "REGIONS"
    scale = 1.4
    pos = (205, 70)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = regions_up_arrow
    texture = up_arrow
    scale = 1
    pos = (305, 95)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = regions_down_arrow
    texture = down_arrow
    scale = 1
    pos = (305, 365)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  SetScreenElementLock id = root_window off
  create_helper_text generic_helper_text
  SetScreenElementProps { id = lobby_list_menu event_handlers = [ { pad_back back_from_regions_menu } ] }
  SetScreenElementProps { id = lobby_list_vmenu event_handlers = [
      { pad_up set_which_arrow params = { arrow = regions_up_arrow } }
      { pad_down set_which_arrow params = { arrow = regions_down_arrow } }
    ]
  }
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
  set_sub_bg pos = (330, 65) scale = (1.47, 1.1)
  create_icon texture = PA_network pos = (145, 65)
  draw_menu_box delta_pos = (96, -20) middle_repeat = 16 box_right_scale = (0.8, 1.185) box_right_offset = (-25, 0) scale = (1.25, 1) box_bottom_scale = (1.2, 1)
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script regions_menu_add_item
  main_menu_add_item <...> highlight_bar_scale = (1.15, 1.3)
endscript
script regions_menu_set_focus
  generic_menu_update_arrows {
    up_arrow_id = regions_up_arrow
    down_arrow_id = regions_down_arrow
  }
  lobby_list_vmenu:GetTags
  if GotParam arrow_id
    menu_vert_blink_arrow { id = <arrow_id> }
  endif
  main_menu_focus <...>
endscript
script create_pin_entry_menu
  make_new_menu menu_id = pin_entry_menu vmenu_id = pin_entry_vmenu menu_title = "ENTER PIN"
  SetScreenElementLock id = root_window off
  SetScreenElementProps { id = pin_entry_menu event_handlers = [
      { pad_back do_nothing }
    ]
  }
  RunScriptOnScreenElement id = main_menu_anchor menu_onscreen
endscript
script create_buddy_list_menu
  make_new_menu menu_title = "Friend List"
  SetScreenElementLock id = root_window off
  SetScreenElementProps { id = main_menu event_handlers = [
      { pad_back launch_xbox_online_menu }
    ]
  }
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript
script back_from_regions_menu
  StopServerList
  FreeServerList
  LobbyDisconnect
  DestroyScreenElement id = current_menu_anchor
  create_internet_options
endscript
script back_from_network_menu
  StopServerList
  FreeServerList
  DestroyScreenElement id = current_menu_anchor
  create_network_select_menu
endscript
script back_from_multiplayer_menu
  StopServerList
  FreeServerList
  back_from_network_select_menu <...>
endscript
script select_host_option
  set_preferences_from_ui <...>
  if ObjectExists id = current_menu_anchor
    RunScriptOnScreenElement id = current_menu_anchor animate_out callback = select_host_option2
  else
    select_host_option2
  endif
endscript
script select_host_option2
  remove_host_options_sub_menu_textures_from_vram
  launch_network_host_options_menu
endscript
script select_game_option
  if ( <checksum> = netctf )
    if not InTeamGame
      set_preferences_from_ui prefs = network field = "team_mode" checksum = teams_two string = "2"
      SetNumTeams 2
    endif
  endif
  set_preferences_from_ui <...>
  switch <checksum>
  case netscorechallenge
  case scorechallenge
    set_preferences_from_ui prefs = <prefs> field = "target_score" checksum = score_1000000 Score = 1000000 string = "1,000,000 points"
  case netking
  case king
    set_preferences_from_ui prefs = <prefs> field = "target_score" checksum = time_120 time = 120 string = "2 minutes"
  case netctf
    set_preferences_from_ui prefs = <prefs> field = "target_score" checksum = score_5 Score = 5 string = "5 captures"
  endswitch
  create_network_game_options_menu <...>
endscript
script select_team_mode_option
  set_preferences_from_ui <...>
  if GameModeEquals is_lobby
    GetPreferenceChecksum pref_type = network team_mode
    switch <checksum>
    case teams_none
      SetNumTeams 0
    case teams_two
      SetNumTeams 2
    case teams_three
      SetNumTeams 3
    case teams_four
      SetNumTeams 4
    default
    endswitch
  endif
  launch_network_host_options_menu
endscript
script create_host_options_sub_menu
  make_new_menu menu_id = options_sub_menu vmenu_id = options_sub_vmenu <...> padding_scale = 1 pos = (200, 110)
  SetScreenElementProps { id = options_sub_menu
    event_handlers = [ { pad_back launch_network_host_options_menu } ]
  }
  add_host_options_sub_menu_textures_to_vram
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    dims = (200, 13)
    not_focusable
  }
  set_sub_bg pos = (162, 114) just = [ left top ] scale = (1.37, 1.1)
  create_icon texture = PA_network pos = (148, 114)
  RemoveParameter id
  if GotParam array
    GetArraySize <array>
     <index> = 0
    begin
      if ( <index> = 0 )
        host_options_sub_menu_add_item first_item <...> ( <array> [ <index> ] )
      else
        if ( <index> = ( <array_size> - 1 ) )
          host_options_sub_menu_add_item last_item <...> ( <array> [ <index> ] )
        else
          host_options_sub_menu_add_item <...> ( <array> [ <index> ] )
        endif
      endif
       <index> = ( <index> + 1 )
    repeat <array_size>
  endif
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script host_options_sub_menu_add_item { parent = current_menu
    font = dialog
    highlight_bar_scale = (1.15, 1.3)
    highlight_bar_pos = (123, -2)
    text_just = [ center center ]
    focus_script = main_menu_focus
    unfocus_script = main_menu_unfocus
    text_pos = (115, 0)
    pad_choose_script = select_host_option
  }
  if GotParam broadband_only
    orig_checksum = <checksum>
    GetPreferenceChecksum pref_type = network device_type
    switch <checksum>
    case device_sony_modem
    case device_usb_modem
      return
    endswitch
    checksum = <orig_checksum>
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = <id>
    dims = (320, 24)
    event_handlers = [ { focus <focus_script> params = <focus_params> }
      { unfocus <unfocus_script> params = <unfocus_params> }
      { pad_choose generic_menu_pad_choose_sound }
      { pad_start generic_menu_pad_choose_sound }
      { pad_choose <pad_choose_script> params = { prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> } }
      { pad_start <pad_choose_script> params = { prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> } }
    ]
     <not_focusable>
  }
   <anchor_id> = <id>
  if GotParam not_focusable
     <text_rgba> = [ 60 60 60 75 ]
  else
     <text_rgba> = [ 88 105 112 128 ]
  endif
  if ( <menu_title> = "SKILL LEVEL" )
  endif
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = <font>
    scale = 0.95
    text = <name>
    pos = <text_pos>
    just = <text_just>
    rgba = <text_rgba>
     <not_focusable>
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = highlight_bar
    pos = <highlight_bar_pos>
    scale = <highlight_bar_scale>
    just = [ center center ]
    rgba = [ 128 128 128 0 ]
    z_priority = 3
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = black
    scale = (75, 6)
    pos = (-30, -13)
    just = [ left top ]
    rgba = [ 0 0 0 85 ]
    z_priority = 0
  }
   <cap_texture> = grungeframe_mid
  if GotParam first_item
     <cap_texture> = grungeframe_top
  else
    if GotParam last_item
       <cap_texture> = grungeframe_bot
    endif
  endif
  GetStackedScreenElementPos X id = <id> offset = (-15, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = <cap_texture>
    pos = <pos>
    scale = (1, 0.75)
    rgba = [ 128 128 128 70 ]
    just = [ left top ]
    z_priority = -1
  }
endscript
script remove_host_options_sub_menu_textures_from_vram
  RemoveTextureFromVram "grungeframe_top"
  RemoveTextureFromVram "grungeframe_mid"
  RemoveTextureFromVram "grungeframe_bot"
endscript
script add_host_options_sub_menu_textures_to_vram
  AddTextureToVram "grungeframe_top"
  AddTextureToVram "grungeframe_mid"
  AddTextureToVram "grungeframe_bot"
endscript
script create_game_options_sub_menu
  if ( <pref_field> = "game_type" )
    make_new_menu menu_id = options_sub_menu vmenu_id = options_sub_vmenu <...> pos = (230, 89)
    SetScreenElementProps { id = options_sub_menu event_handlers = [
        { pad_back create_network_game_options_menu params = { <...> } }
      ]
    }
    generic_array_menu_setup <...>
    game_type_description_box
  else
    make_new_menu menu_id = options_sub_menu vmenu_id = options_sub_vmenu <...>
    SetScreenElementProps { id = options_sub_menu event_handlers = [
        { pad_back create_network_game_options_menu params = { <...> } }
      ]
    }
    generic_array_menu_setup <...>
  endif
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script set_host_option_preference
  GetTextElementString id = keyboard_current_string
  set_preferences_from_ui prefs = network <...>
  destroy_onscreen_keyboard
  create_network_host_options_menu
endscript
script host_options_back_from_keyboard
  destroy_onscreen_keyboard
  create_network_host_options_menu
endscript
script set_horse_option_preference
  GetTextElementString id = keyboard_current_string
  set_preferences_from_ui prefs = splitscreen <...>
  horse_word_back_from_keyboard
endscript
script horse_word_back_from_keyboard
  destroy_onscreen_keyboard
  add_pause_menu_textures_to_vram
  create_network_game_options_menu end_run
endscript
script create_network_host_options_server_name_menu
  GetPreferenceString pref_type = network server_name
  DestroyScreenElement id = current_menu_anchor
  create_onscreen_keyboard allow_cancel keyboard_cancel_script = host_options_back_from_keyboard keyboard_done_script = set_host_option_preference keyboard_title = "SERVER ID" field = "server_name" text = <ui_string> min_length = 1 max_length = 15
endscript
script create_network_host_options_password_menu
  GetPreferenceString pref_type = network password
  DestroyScreenElement id = current_menu_anchor
  create_onscreen_keyboard password allow_cancel keyboard_cancel_script = host_options_back_from_keyboard keyboard_done_script = set_host_option_preference keyboard_title = "PASSWORD" field = "password" text = <ui_string> min_length = 0 max_length = 9
endscript
script create_network_host_options_levels_menu
  if IsTrue bootstrap_build
    create_host_options_sub_menu menu_title = "LEVEL" pref_type = network pref_field = "level" array = e3_level_info call_script = select_host_option pos = (227, 112)
  else
    create_host_options_sub_menu menu_title = "LEVEL" pref_type = network pref_field = "level" array = level_info call_script = select_host_option pos = (227, 112) helper_text = generic_helper_text
  endif
endscript
script create_network_host_options_max_players_menu
  create_host_options_sub_menu menu_title = "PLAYERS" pref_type = network pref_field = "num_players" array = num_players_info pad_choose_script = select_host_option pos = (227, 112) helper_text = generic_helper_text
endscript
script create_network_host_options_max_observers_menu
  create_host_options_sub_menu menu_title = "OBSERVERS" pref_type = network pref_field = "num_observers" array = num_observers_info pad_choose_script = select_host_option pos = (227, 112) helper_text = generic_helper_text
endscript
script create_network_host_options_player_collision_menu
  create_host_options_sub_menu menu_title = "PLAYER COLLISION" pref_type = network pref_field = "player_collision" array = on_off_types pad_choose_script = select_host_option helper_text = generic_helper_text
endscript
script create_network_host_options_team_menu
  create_host_options_sub_menu menu_title = "TEAMS" pref_type = network pref_field = "team_mode" array = team_types pad_choose_script = select_team_mode_option pos = (227, 112) helper_text = generic_helper_text
endscript
script create_network_host_options_skill_level_menu
  create_host_options_sub_menu menu_title = "SKILL LEVEL" pref_type = network pref_field = "skill_level" array = skill_level_info pad_choose_script = select_host_option pos = (227, 112) helper_text = generic_helper_text
endscript
script create_mp_game_options_game_type_menu
  create_game_options_sub_menu menu_title = "GAME TYPE" pref_type = splitscreen pref_field = "game_type" array = mp_game_type_info call_script = select_game_option helper_text = generic_helper_text <...>
  set_sub_bg type = SpriteElement pos = (326, 95)
  create_icon texture = PA_options pos = (176, 95)
endscript
script create_network_game_options_game_type_menu
  if IsTrue Demo_Build
    create_game_options_sub_menu menu_title = "GAME TYPE" pref_type = network pref_field = "game_type" array = net_game_type_info_demo call_script = select_game_option helper_text = generic_helper_text <...>
  else
    create_game_options_sub_menu menu_title = "GAME TYPE" pref_type = network pref_field = "game_type" array = net_game_type_info call_script = select_game_option helper_text = generic_helper_text <...>
  endif
  set_sub_bg type = SpriteElement pos = (326, 95)
  create_icon texture = PA_options pos = (176, 95)
endscript
script create_network_game_options_score_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  create_game_options_sub_menu menu_title = "TARGET SCORE" pref_type = <prefs> pref_field = "target_score" array = target_score_options call_script = select_game_option helper_text = generic_helper_text <...>
  set_sub_bg type = SpriteElement
  draw_menu_box delta_pos = (97, 30) middle_repeat = 12 box_right_scale = (0.8, 0.925)
  create_icon texture = PA_options
endscript
script create_network_game_options_captures_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  create_game_options_sub_menu menu_title = "CAPTURES" pref_type = <prefs> pref_field = "target_score" array = capture_options call_script = select_game_option helper_text = generic_helper_text <...>
  set_sub_bg type = SpriteElement
  draw_menu_box delta_pos = (97, 30)
  create_icon texture = PA_options
endscript
script create_network_game_options_target_time_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  create_game_options_sub_menu menu_title = "TIME LIMIT" pref_type = <prefs> pref_field = "target_score" array = time_limit_options call_script = select_game_option helper_text = generic_helper_text <...>
  set_sub_bg type = SpriteElement
  draw_menu_box delta_pos = (97, 30)
  create_icon texture = PA_options
endscript
script create_network_game_options_time_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  create_game_options_sub_menu menu_title = "TIME LIMIT" pref_type = network pref_field = "time_limit" array = time_limit_options call_script = select_game_option helper_text = generic_helper_text <...>
  set_sub_bg type = SpriteElement
  draw_menu_box delta_pos = (97, 30)
  create_icon texture = PA_options
endscript
script create_mp_game_options_time_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  create_game_options_sub_menu menu_title = "TIME LIMIT" pref_type = splitscreen pref_field = "time_limit" array = time_limit_options call_script = select_game_option helper_text = generic_helper_text <...>
  set_sub_bg type = SpriteElement
  draw_menu_box delta_pos = (97, 30)
  create_icon texture = PA_options
endscript
script create_mp_game_options_horse_time_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  create_game_options_sub_menu menu_title = "TIME LIMIT" pref_type = splitscreen pref_field = "horse_time_limit" array = horse_time_limit_options call_script = select_game_option helper_text = generic_helper_text prefs = splitscreen <...>
  set_sub_bg type = SpriteElement
  draw_menu_box delta_pos = (97, 30) middle_repeat = 4 box_right_scale = (0.8, 0.428)
  create_icon texture = PA_options
endscript
script create_mp_game_options_horse_word_menu
  remove_pause_menu_textures_from_vram
  GetPreferenceString pref_type = splitscreen horse_word
  create_onscreen_keyboard allow_cancel keyboard_cancel_script = horse_word_back_from_keyboard keyboard_done_script = set_horse_option_preference keyboard_title = "HORSE WORD" field = "horse_word" text = <ui_string> min_length = 1 max_length = 15 pos = (320, 290)
endscript
script create_account_list_menu
  make_new_menu menu_id = account_list_menu vmenu_id = account_list_vmenu menu_title = "CHOOSE AN ACCOUNT"
  SetScreenElementLock id = root_window off
  SetScreenElementProps { id = account_list_menu event_handlers = [
      { pad_back back_from_account_list_menu }
    ]
  }
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript
script create_network_game_options_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  if InSplitScreenGame
    prefs = splitscreen
  else
    prefs = network
  endif
  remove_ss_menu_textures_from_vram
  add_pause_menu_textures_to_vram
  GoalManager_ShowPoints
  hide_net_player_names on
  make_new_menu menu_id = host_options_menu vmenu_id = host_options_vmenu menu_title = "GAME OPTIONS" helper_text = generic_helper_text
  if GotParam end_run
    SetScreenElementProps { id = host_options_menu event_handlers = [
        { pad_back create_end_run_menu }
      ]
    }
  else
    SetScreenElementProps { id = host_options_menu event_handlers = [
        { pad_back create_pause_menu }
      ]
    }
  endif
  if InNetGame
    if CustomParkMode just_using
      GetPreferenceChecksum pref_type = network game_type
      if ( <checksum> = netgoalattack )
        set_preferences_from_ui prefs = network field = "game_type" checksum = nettrickattack string = "Trick Attack"
      endif
    endif
  endif
  GetPreferenceString pref_type = <prefs> game_type
  if InNetGame
    make_text_sub_menu_item text = "Game Type:" id = menu_network_host_options_game_type pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_game_type_menu }
  else
    if GotParam end_run
      make_text_sub_menu_item text = "Game Type:" id = menu_network_host_options_game_type pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_mp_game_options_game_type_menu }
    else
      make_text_sub_menu_item text = "Game Type:" id = menu_network_host_options_game_type pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_game_type_menu }
    endif
  endif
  GetScreenElementDims id = menu_network_host_options_game_type
  item_pos = ( ( ( 235 + <width> ) * (1, 0) ) + (0, 158) )
  CreateScreenElement { type = TextElement parent = host_options_menu text = <ui_string> id = menu_network_host_options_game_type_string rgba = [ 80 80 80 128 ]
    scale = 0.8 pos = <item_pos> font = dialog just = [ left center ] not_focusable }
  GetPreferenceChecksum pref_type = <prefs> game_type
  switch <checksum>
  case netgoalattack
    make_text_sub_menu_item text = "Choose Goals" id = menu_network_host_options_choose_goals pad_choose_script = create_choose_goals_menu
    if GoalManager_GoalsAreSelected
      make_text_sub_menu_item text = "Ready" id = menu_network_host_options_ready pad_choose_script = chosen_host_game
    else
      make_text_sub_menu_item text = "Ready" id = menu_network_host_options_ready pad_choose_script = chosen_host_game font = dialog not_focusable rgba = [ 80 80 80 128 ]
    endif
  case freeskate2p
    make_text_sub_menu_item text = "Ready" id = menu_network_host_options_ready pad_choose_script = chosen_host_game
  case horse
  case nethorse
    make_text_sub_menu_item text = "Time Limit:" id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_mp_game_options_horse_time_menu }
    GetPreferenceString pref_type = <prefs> horse_time_limit
    GetScreenElementDims id = menu_network_host_options_time_limit
    item_pos = ( ( ( 235 + <width> ) * (1, 0) ) + (0, 185) )
    CreateScreenElement { type = TextElement parent = host_options_menu text = <ui_string> id = menu_network_host_options_time_limit_string rgba = [ 80 80 80 128 ]
      scale = 0.8 pos = <item_pos> font = dialog just = [ left center ] not_focusable }
    make_text_sub_menu_item text = "Horse Word:" id = menu_network_host_options_horse_word pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_mp_game_options_horse_word_menu }
    GetPreferenceString pref_type = <prefs> horse_word
    GetScreenElementDims id = menu_network_host_options_horse_word
    item_pos = ( ( ( 235 + <width> ) * (1, 0) ) + (0, 212) )
    CreateScreenElement { type = TextElement parent = host_options_menu text = <ui_string> id = menu_network_host_options_horse_word_string rgba = [ 80 80 80 128 ]
      scale = 0.8 pos = <item_pos> font = dialog just = [ left center ] not_focusable }
    make_text_sub_menu_item text = "Ready" id = menu_network_host_options_ready pad_choose_script = chosen_host_game
  case scorechallenge
  case netscorechallenge
    if GotParam end_run
      make_text_sub_menu_item text = "Target Score:" id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_network_game_options_score_menu prefs = <prefs> }
    else
      make_text_sub_menu_item text = "Target Score:" id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_score_menu prefs = <prefs> }
    endif
    GetPreferenceString pref_type = <prefs> target_score
    GetScreenElementDims id = menu_network_host_options_target_score
    item_pos = ( ( ( 235 + <width> ) * (1, 0) ) + (0, 185) )
    CreateScreenElement { type = TextElement parent = host_options_menu text = <ui_string> id = menu_network_host_options_target_score_string rgba = [ 80 80 80 128 ]
      scale = 0.8 pos = <item_pos> font = dialog just = [ left center ] not_focusable }
    make_text_sub_menu_item text = "Ready" id = menu_network_host_options_ready pad_choose_script = chosen_host_game
  case netctf
    make_text_sub_menu_item text = "Captures:" id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_captures_menu prefs = <prefs> }
    GetPreferenceString pref_type = <prefs> target_score
    GetScreenElementDims id = menu_network_host_options_target_score
    item_pos = ( ( ( 235 + <width> ) * (1, 0) ) + (0, 185) )
    CreateScreenElement { type = TextElement parent = host_options_menu text = <ui_string> id = menu_network_host_options_target_score_string rgba = [ 80 80 80 128 ]
      scale = 0.8 pos = <item_pos> font = dialog just = [ left center ] not_focusable }
    make_text_sub_menu_item text = "Ready" id = menu_network_host_options_ready pad_choose_script = chosen_host_game
  case king
  case netking
    if GotParam end_run
      make_text_sub_menu_item text = "Time Limit:" id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_network_game_options_target_time_menu prefs = <prefs> }
    else
      make_text_sub_menu_item text = "Time Limit:" id = menu_network_host_options_target_score pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_target_time_menu prefs = <prefs> }
    endif
    GetPreferenceString pref_type = <prefs> target_score
    GetScreenElementDims id = menu_network_host_options_target_score
    item_pos = ( ( ( 235 + <width> ) * (1, 0) ) + (0, 185) )
    CreateScreenElement { type = TextElement parent = host_options_menu text = <ui_string> id = menu_network_host_options_target_score_string rgba = [ 80 80 80 128 ]
      scale = 0.8 pos = <item_pos> font = dialog just = [ left center ] not_focusable }
    make_text_sub_menu_item text = "Ready" id = menu_network_host_options_ready pad_choose_script = chosen_host_game
  default
    if InNetGame
      make_text_sub_menu_item text = "Time Limit:" id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_network_game_options_time_menu }
    else
      if GotParam end_run
        make_text_sub_menu_item text = "Time Limit:" id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { end_run sub_menu_script = create_mp_game_options_time_menu }
      else
        make_text_sub_menu_item text = "Time Limit:" id = menu_network_host_options_time_limit pad_choose_script = launch_network_host_options_sub_menu pad_choose_params = { sub_menu_script = create_mp_game_options_time_menu }
      endif
    endif
    GetPreferenceString pref_type = <prefs> time_limit
    GetScreenElementDims id = menu_network_host_options_time_limit
    item_pos = ( ( ( 235 + <width> ) * (1, 0) ) + (0, 185) )
    CreateScreenElement { type = TextElement parent = host_options_menu text = <ui_string> id = menu_network_host_options_time_limit_string rgba = [ 80 80 80 128 ]
      scale = 0.8 pos = <item_pos> font = dialog just = [ left center ] not_focusable }
    make_text_sub_menu_item text = "Ready" id = menu_network_host_options_ready pad_choose_script = chosen_host_game
  endswitch
  set_sub_bg type = SpriteElement
  create_icon texture = PA_options
  RunScriptOnScreenElement id = current_menu_anchor set_game_options_ready_focus
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script set_game_options_ready_focus
  menu_onscreen <...>
  FireEvent type = unfocus target = host_options_vmenu
  FireEvent type = focus target = host_options_vmenu data = { child_id = menu_network_host_options_ready }
endscript
script create_network_host_options_menu
  remove_pause_menu_textures_from_vram
  add_host_options_sub_menu_textures_to_vram
  if OnXbox
    title_text = "SERVER OPTIONS"
  else
    title_text = "SERVER OPTIONS"
  endif
  make_new_menu {
    menu_id = host_options_menu
    vmenu_id = host_options_vmenu
    menu_title = <title_text>
    pos = (170, 87)
    padding_scale = 1
    helper_text = generic_helper_text
  }
  if IsInternetGameHost
    SetScreenElementProps {
      id = host_options_menu
      event_handlers = [ { pad_back launch_ss_menu } ]
    }
  else
    SetScreenElementProps {
      id = host_options_menu
      event_handlers = [ { pad_back back_from_internet_host_options } ]
    }
  endif
  kill_start_key_binding
  if InNetGame
    if OnServer
      actual_server = 1
    else
      actual_server = 0
    endif
  else
    actual_server = 1
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    dims = (300, 17)
    not_focusable
  }
  if ( <actual_server> = 1 )
    GetPreferenceString pref_type = network server_name
    network_host_options_menu_add_item {
      text1 = "Name:"
      text2 = <ui_string>
      id = menu_network_host_options_server_name
      pad_choose_script = create_network_host_options_server_name_menu
      first_item
    }
  endif
  if not InNetGame
    GetPreferenceString pref_type = network level
    network_host_options_menu_add_item {
      text1 = "Level:"
      text2 = <ui_string>
      id = menu_network_host_options_level
      pad_choose_script = launch_level_select_menu
      pad_choose_params = { from_server_options }
    }
  endif
  if OnServer
    GetPreferenceString pref_type = network num_players
    if IsMacInternetGameHost
      network_host_options_menu_add_item {
        text1 = "Players:"
        text2 = <ui_string>
        id = menu_network_host_options_max_players
        pad_choose_script = launch_network_host_options_sub_menu
        pad_choose_params = { sub_menu_script = create_network_host_options_max_players_menu }
        not_focusable = not_focusable
      }
    else
      network_host_options_menu_add_item {
        text1 = "Players:"
        text2 = <ui_string>
        id = menu_network_host_options_max_players
        pad_choose_script = launch_network_host_options_sub_menu
        pad_choose_params = { sub_menu_script = create_network_host_options_max_players_menu }
      }
    endif
    if InInternetMode
      GetPreferenceString pref_type = network num_observers
      network_host_options_menu_add_item {
        text1 = "Observers:"
        text2 = <ui_string>
        id = menu_network_host_options_max_observers
        pad_choose_script = launch_network_host_options_sub_menu
        pad_choose_params = { sub_menu_script = create_network_host_options_max_observers_menu }
      }
    endif
  endif
  if not InNetGame
    GetPreferenceString pref_type = network team_mode
    network_host_options_menu_add_item {
      text1 = "Teams:"
      text2 = <ui_string>
      id = menu_network_host_options_player_team
      pad_choose_script = launch_network_host_options_sub_menu
      pad_choose_params = { sub_menu_script = create_network_host_options_team_menu }
    }
  else
    if GameModeEquals is_lobby
      if IsHost
        if OnServer
          GetPreferenceString pref_type = network team_mode
          network_host_options_menu_add_item {
            text1 = "Teams:"
            text2 = <ui_string>
            id = menu_network_host_options_player_team
            pad_choose_script = launch_network_host_options_sub_menu
            pad_choose_params = { sub_menu_script = create_network_host_options_team_menu }
          }
        else
          GetPreferenceString pref_type = network team_mode
          network_host_options_menu_add_item {
            text1 = "Teams:"
            text2 = <ui_string>
            id = menu_network_host_options_player_team
            pad_choose_script = launch_network_host_options_sub_menu
            pad_choose_params = { sub_menu_script = create_network_host_options_team_menu }
            first_item
          }
        endif
      endif
    endif
  endif
  if IsHost
    if GameModeEquals is_lobby
      GetPreferenceString pref_type = network player_collision
      network_host_options_menu_add_item {
        text1 = "Collision:"
        text2 = <ui_string>
        id = menu_network_host_options_player_collision
        pad_choose_script = launch_network_host_options_sub_menu
        pad_choose_params = { sub_menu_script = create_network_host_options_player_collision_menu }
      }
    endif
  endif
  if ( <actual_server> = 1 )
    GetPreferenceString pref_type = network skill_level
    network_host_options_menu_add_item {
      text1 = "Skill Level:"
      text2 = <ui_string>
      id = menu_network_host_options_skill_level
      pad_choose_script = launch_network_host_options_sub_menu
      pad_choose_params = { sub_menu_script = create_network_host_options_skill_level_menu }
    }
    GetPreferencePassword pref_type = network password
    if IsMacInternetGameHost
      network_host_options_menu_add_item {
        text1 = "Password:"
        text2 = <password_string>
        id = menu_network_host_options_password
        pad_choose_script = create_network_host_options_password_menu
        not_focusable = not_focusable
      }
    else
      network_host_options_menu_add_item {
        text1 = "Password:"
        text2 = <password_string>
        id = menu_network_host_options_password
        pad_choose_script = create_network_host_options_password_menu
      }
    endif
    network_host_options_menu_add_item {
      not_focusable = not_focusable
    }
  endif
  if not InNetGame
    network_host_options_menu_add_item {
      text1 = "Ready"
      id = menu_network_host_options_ready
      pad_choose_script = chosen_host_game
      last_item
    }
  endif
  set_sub_bg pos = (267, 90)
  create_icon texture = PA_network pos = (115, 90)
  if InNetGame
    RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
  else
    RunScriptOnScreenElement id = current_menu_anchor set_ready_focus
  endif
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script create_network_host_options_menu2
  remove_pause_menu_textures_from_vram
  add_host_options_sub_menu_textures_to_vram
  kill_start_key_binding
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  Wait 1 frame
  chosen_host_game
endscript
script set_ready_focus
  menu_onscreen <...>
  FireEvent type = unfocus target = host_options_vmenu
  FireEvent type = focus target = host_options_vmenu data = { child_id = menu_network_host_options_ready }
endscript
script network_host_options_menu_add_item { parent = current_menu
    font = small
    highlight_bar_scale = (1.55, 1.3)
    highlight_bar_pos = (173, -7)
    focus_script = network_host_options_menu_focus
    unfocus_script = network_host_options_menu_unfocus
    pad_choose_script = nullscript
    text_pos = (110, -5)
  }
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = <id>
    dims = (400, 24)
    event_handlers = [ { focus <focus_script> params = <focus_params> }
      { unfocus <unfocus_script> params = <unfocus_params> }
      { pad_choose generic_menu_pad_choose_sound }
      { pad_start generic_menu_pad_choose_sound }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_start <pad_choose_script> params = <pad_choose_params> }
    ]
     <not_focusable>
  }
   <anchor_id> = <id>
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    text = <text1>
    pos = <text_pos>
    just = [ right center ]
    rgba = [ 88 105 112 128 ]
  }
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = dialog
    text = <text2>
    pos = ( <text_pos> + (5, 0) )
    scale = 0.83
    just = [ left center ]
    rgba = [ 127 102 0 128 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = highlight_bar
    pos = <highlight_bar_pos>
    scale = <highlight_bar_scale>
    just = [ center center ]
    rgba = [ 128 128 128 0 ]
    z_priority = 3
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = black
    scale = (100, 6)
    pos = (-30, -18)
    just = [ left top ]
    rgba = [ 0 0 0 85 ]
    z_priority = 0
  }
   <cap_texture> = grungeframe_mid
  if GotParam first_item
     <cap_texture> = grungeframe_top
  else
    if GotParam last_item
       <cap_texture> = grungeframe_bot
    endif
  endif
  GetStackedScreenElementPos X id = <id> offset = (-15, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = <cap_texture>
    pos = <pos>
    scale = (1, 0.75)
    rgba = [ 128 128 128 70 ]
    just = [ left top ]
    z_priority = -1
  }
endscript
script network_host_options_menu_focus
  GetTags
  SetScreenElementProps {
    id = { <id> child = 0 }
    rgba = [ 128 128 128 128 ]
  }
  RunScriptOnScreenElement id = { <id> child = 1 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  SetScreenElementProps {
    id = { <id> child = 2 }
    rgba = [ 128 128 128 50 ]
  }
endscript
script network_host_options_menu_unfocus
  GetTags
  SetScreenElementProps {
    id = { <id> child = 0 }
    rgba = [ 88 105 112 128 ]
  }
  RunScriptOnScreenElement id = { <id> child = 1 } do_scale_down params = { rgba = [ 127 102 0 128 ] }
  SetScreenElementProps {
    id = { <id> child = 2 }
    rgba = [ 128 128 128 0 ]
  }
endscript
script chosen_start_game
  if InNetGame
    GetPreferenceChecksum pref_type = network game_type
    if ( <checksum> = netctf )
      if not InTeamGame
        set_preferences_from_ui prefs = network field = "team_mode" checksum = teams_two string = "2"
        SetNumTeams 2
      endif
    endif
  else
    UnPauseGame
  endif
  LoadPendingPlayers
  StartNetworkGame
  if ObjectExists id = current_menu_anchor
    exit_pause_menu
  endif
endscript
script network_options_selected
  PauseMusicAndStreams 1
  launch_network_host_options_menu
endscript
script network_game_options_selected
  create_network_game_options_menu <...>
endscript
script network_start_selected
  if OnServer
    chosen_start_game
  else
    FCFSRequestStartGame
    exit_pause_menu
  endif
endscript
script network_end_game_selected
  kill_all_panel_messages
  if InSplitScreenGame
    SetStatOverride
    GoalManager_DeactivateAllGoals
    change_gamemode_freeskate_2p
    ClearTrickAndScoreText
    create_end_run_menu
  else
    EndNetworkGame
  endif
endscript
script generic_array_menu_setup time = 60
  add_item_script = main_menu_add_item
  if not ( <pref_field> = "game_type" )
    if not ( <pref_field> = "device_type" )
       <add_item_script> text = <name> not_focusable = not_focusable
    endif
  endif
  begin
    GetNextArrayElement <array>
    if GotParam Element
      AddParams <Element>
      if ( <pref_field> = "game_type" )
        focus_script = game_options_focus_script
        focus_params = { description = <description> }
        add_item_script = make_text_sub_menu_item
      endif
      if GotParam not_in_custom_parks
        if CustomParkMode just_using
          show_option = 0
        else
          show_option = 1
        endif
      else
        show_option = 1
      endif
      if GotParam not_pal
        if IsPal
          show_option = 0
        endif
      endif
      if ( <show_option> = 1 )
        if GotParam not_available
           <add_item_script> text = <name> rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> } not_focusable highlight_bar_scale = <highlight_bar_scale> scale = <scale>
        else
          if GotParam team_only
            if InTeamGame
               <add_item_script> text = <name> pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> <...> } focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> scale = <scale>
            else
               <add_item_script> text = <name> rgba = [ 80 80 80 128 ] pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> } not_focusable highlight_bar_scale = <highlight_bar_scale> scale = <scale>
            endif
          else
             <add_item_script> text = <name> pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = <name> checksum = <checksum> time = <time> <...> } focus_script = <focus_script> focus_params = <focus_params> highlight_bar_scale = <highlight_bar_scale> scale = <scale>
          endif
        endif
      endif
      RemoveParameter not_available
      RemoveParameter not_in_custom_parks
      RemoveParameter not_pal
    else
      break
    endif
  repeat
endscript
script game_options_focus_script
  SetScreenElementProps id = item_description_text text = <description>
  do_scale_up
endscript
script game_type_description_box
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = item_bg_box
    texture = black
    z_priority = 0
    scale = (85, 12)
    pos = (160, 350)
    just = [ left top ]
    rgba = [ 0 0 0 80 ]
  }
  GetStackedScreenElementPos X id = item_bg_box offset = (1, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    z_priority = 0
    scale = (0.85, 0.18)
    pos = <pos>
    just = [ center top ]
    rgba = [ 0 0 0 80 ]
  }
  GetStackedScreenElementPos X id = item_bg_box offset = (-170, 4)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = stats_notch
    pos = <pos>
    z_priority = 1
    scale = (21, 1.1)
    just = [ center top ]
    rgba = [ 100 100 100 40 ]
  }
  GetStackedScreenElementPos X id = item_bg_box offset = (-170, 2)
  CreateScreenElement {
    type = TextBlockElement
    parent = current_menu_anchor
    id = item_description_text
    dims = (420, 0)
    pos = <pos>
    rgba = [ 37 84 136 80 ]
    font = dialog
    just = [ center top ]
    internal_just = [ center top ]
    scale = 0.8
    text = ""
    not_focusable
    allow_expansion
  }
  Wait 1 gameframe
  remove_ss_menu_textures_from_vram
  add_pause_menu_textures_to_vram
endscript
script end_network_game
  kill_all_panel_messages
  dialog_box_exit
  do_backend_retry
endscript
script CreateServerQuitDialog
  if not LevelIs load_skateshop
    GoalManager_DeactivateAllGoals
    GoalManager_SetCanStartGoal 0
    kill_net_panel_messages
    destroy_onscreen_keyboard
    force_close_rankings dont_retry
    exit_pause_menu
    HideLoadingScreen
    if not IsObserving
      skater:Vibrate off
    endif
    create_error_box { title = "Notice"
      text = "The server has quit. Select OK to leave this game."
      buttons = [ { text = "ok" pad_choose_script = quit_network_game }
      ]
      delay_input
      delay_input_time = 3000
    }
  endif
endscript
script create_game_ended_dialog
  if not LevelIs load_skateshop
    GoalManager_DeactivateAllGoals
    GoalManager_SetCanStartGoal 0
    kill_net_panel_messages
    destroy_onscreen_keyboard
    force_close_rankings
    exit_pause_menu
    create_error_box { title = "Notice"
      text = "The server has terminated the current game.  Select OK to go back to freeskate."
      buttons = [ { text = "ok" pad_choose_script = end_network_game }
      ]
      delay_input
    }
  endif
endscript
script accept_lost_connection
  dialog_box_exit
  if EnteringNetGame
    cancel_join_server
  else
    quit_network_game
  endif
endscript
script CreateLostConnectionDialog
  HideLoadingScreen
  exit_pause_menu
  destroy_onscreen_keyboard
  force_close_rankings dont_retry
  if InNetGame
    if LocalSkaterExists
      skater:Vibrate off
    endif
  endif
  dialog_box_exit
  dialog_box_exit anchor_id = link_lost_dialog_anchor
  create_error_box { title = "Notice"
    text = "You have lost connection to the server. Select OK to leave this game."
    buttons = [ { text = "ok" pad_choose_script = accept_lost_connection }
    ]
    delay_input
  }
endscript
script BackToServerListFromJoinRefusedDialog
  dialog_box_exit
  create_network_select_games_menu
endscript
script CreateJoinRefusedDialog
  if InNetGame
    create_dialog_box { title = net_refused_msg
      text = <reason>
      buttons = [ { text = "ok" pad_choose_script = dialog_box_exit }
      ]
    }
  else
    if GotParam just_dialog
      create_dialog_box { title = net_refused_msg
        text = <reason>
        buttons = [ { text = "ok" pad_choose_script = BackToServerListFromJoinRefusedDialog }
        ]
      }
    else
      cancel_join_server show_refused_dialog <...>
    endif
  endif
endscript
script create_refused_dialog
  Printf "******* in cancel_join_server 12"
  if InNetGame
    create_dialog_box { title = net_refused_msg
      text = <reason>
      buttons = [ { text = "ok" pad_choose_script = dialog_box_exit }
      ]
    }
  else
    create_dialog_box { title = net_refused_msg
      text = <reason>
      buttons = [ { text = "ok" pad_choose_script = BackToServerListFromJoinRefusedDialog }
      ]
    }
  endif
endscript
script reattempt_join_server
  ReattemptJoinServer
  PlaySkaterCamAnim name = SS_MenuCam play_hold
endscript
script cancel_join_server
  Printf "******* in cancel_join_server"
  destroy_onscreen_keyboard
  dialog_box_exit
  Printf "******* in cancel_join_server 2"
  if InInternetMode
    Printf "******* in cancel_join_server 3"
    CancelJoinServer
    restart_local_server
    SetNetworkMode INTERNET_MODE
  else
    Printf "******* in cancel_join_server 4"
    CancelJoinServer
    Printf "******* in cancel_join_server 5"
    restart_local_server
    Printf "******* in cancel_join_server 6"
    SetNetworkMode LAN_MODE
  endif
  Printf "******* in cancel_join_server 7"
  if GotParam show_timeout
    Printf "******* in cancel_join_server 8"
    create_join_timeout_dialog
  else
    if GotParam show_refused_dialog
      Printf "******* in cancel_join_server 9"
      create_refused_dialog <...>
    else
      Printf "******* in cancel_join_server 10"
      create_network_select_games_menu
    endif
  endif
  kill_start_key_binding
  Printf "******* in cancel_join_server 11"
  begin
    Printf "******* in cancel_join_server 12"
    if LocalSkaterExists
      MakeSkaterGoto SkateshopAI params = { NoSFX }
      KillSkaterCamAnim all
      PlaySkaterCamAnim name = SS_MenuCam play_hold
      break
    else
      Wait 1
    endif
  repeat
endscript
script CreateEnterPasswordControl
  dialog_box_exit
  create_onscreen_keyboard password allow_cancel keyboard_cancel_script = cancel_join_server keyboard_done_script = try_password keyboard_title = "ENTER PASSWORD" min_length = 1 max_length = 9
endscript
script try_password
  GetTextElementString id = keyboard_current_string
  destroy_onscreen_keyboard
  JoinWithPassword <...>
endscript
script CreateGameInProgressDialog
  dialog_box_exit
  kill_start_key_binding
  create_dialog_box { title = net_status_msg
    text = net_message_game_in_progress
    buttons = [
      { text = "ok" pad_choose_script = reattempt_join_server }
      { text = "cancel" pad_choose_script = cancel_join_server }
    ]
  }
endscript
script CreateConnectingDialog
  kill_start_key_binding
  create_dialog_box { title = net_status_msg
    text = net_status_connecting
    buttons = [
      { text = "cancel" pad_choose_script = cancel_join_server }
    ]
  }
endscript
script CreateJoiningDialog
  dialog_box_exit
  kill_start_key_binding
  create_dialog_box { title = net_status_msg
    text = net_status_joining
    buttons = [
      { text = "cancel" pad_choose_script = cancel_join_server }
    ]
  }
endscript
script CreateTryingPasswordDialog
  kill_start_key_binding
  create_dialog_box { title = net_status_msg
    text = net_status_trying_password
    buttons = [
      { text = "cancel" pad_choose_script = cancel_join_server }
    ]
  }
endscript
script wait_for_players
  dialog_box_exit
  create_net_panel_message text = net_message_game_will_start
endscript
script dont_wait_for_players
  dialog_box_exit
  DropPendingPlayers
endscript
script CreateWaitForPlayersDialog
  if ObjectExists id = pause_menu
    exit_pause_menu
  endif
  destroy_onscreen_keyboard
  create_error_box { title = net_status_msg
    text = net_message_waiting_for_players
    buttons = [
      { text = "Yes" pad_choose_script = wait_for_players }
      { text = " No " pad_choose_script = dont_wait_for_players }
    ]
    no_animate
    delay_input
  }
endscript
script back_from_join_timeout
  dialog_box_exit
  create_network_select_games_menu
endscript
script ShowJoinTimeoutNotice
  SpawnScript cancel_join_server params = { show_timeout }
endscript
script create_join_timeout_dialog
  create_dialog_box { title = net_status_msg
    text = net_status_join_timeout
    buttons = [
      { text = "ok" pad_choose_script = back_from_join_timeout }
    ]
  }
endscript
script exit_net_menus
  dialog_box_exit
  SetGameType career
  SetCurrentGameType
  launch_main_menu
endscript
script create_link_unplugged_front_end_dialog
  back_from_multiplayer_menu no_menu
  create_dialog_box { title = net_status_msg
    text = net_error_unplugged_front_end
    buttons = [
      { text = "ok" pad_choose_script = exit_net_menus }
    ]
  }
endscript
script link_unplugged_ok
  dialog_box_exit anchor_id = link_lost_dialog_anchor no_pad_start
   <found_menu> = 0
  if ScreenElementExists id = current_menu_anchor
     <found_menu> = 1
    DoScreenElementMorph {
      id = current_menu_anchor
      scale = 1
    }
    FireEvent type = focus target = current_menu_anchor
  endif
  if ScreenElementExists id = current_menu
     <found_menu> = 1
    FireEvent type = focus target = current_menu
  endif
  if not LevelIs load_skateshop
    if ( <found_menu> = 0 )
      if SkaterCamAnimFinished
        create_pause_menu
      else
      endif
    endif
  endif
endscript
script link_unplugged_quit
  link_unplugged_ok
  launch_quit_game_dialog
endscript
script create_link_unplugged_dialog
  if ScreenElementExists id = dialog_box_anchor
    return
  endif
  if ScreenElementExists id = current_menu_anchor
    DoScreenElementMorph {
      id = current_menu_anchor
      scale = 0
    }
    FireEvent type = unfocus target = current_menu_anchor
  endif
  if ScreenElementExists id = current_menu
    FireEvent type = unfocus target = current_menu
  endif
  destroy_onscreen_keyboard
  create_error_box { title = net_error_msg
    anchor_id = link_lost_dialog_anchor
    text = net_error_unplugged
    buttons = [
      { text = "ok" pad_choose_script = link_unplugged_ok }
      { text = "quit" pad_choose_script = link_unplugged_quit }
    ]
    no_animate
  }
  kill_start_key_binding
endscript
script exit_async_dialog
  dialog_box_exit
  if GameIsOver
    do_backend_retry
  endif
endscript
script CreateNotPostedDialog
  kill_all_panel_messages
  create_error_box { title = net_error_msg
    text = net_status_not_posted
    buttons = [
      { text = "ok" pad_choose_script = exit_async_dialog }
    ]
    no_animate
    delay_input
    z_priority = 50
  }
endscript
script CreateGettingLobbyListDialog
  dialog_box_exit
  create_dialog_box { title = net_status_msg
    text = net_status_getting_lobbies
  }
endscript
script CreateFailedLobbyListDialog
  LobbyDisconnect
  dialog_box_exit
  create_dialog_box { title = net_status_msg
    text = <message>
    buttons = [
      { text = "ok" pad_choose_script = cancel_gamespy_connection_failure_dialog }
    ]
  }
endscript
script CreateJoinLobbyFailedDialog
  LobbyDisconnect
  dialog_box_exit
  create_dialog_box { title = net_status_msg
    text = "Failed to join lobby."
    buttons = [
      { text = "ok" pad_choose_script = spawn_lobby_list }
    ]
  }
endscript
script CreateConnectingChatDialog
  create_dialog_box { title = net_status_msg
    text = net_status_connecting_chat
  }
endscript
script create_joining_lobby_dialog
  create_dialog_box { title = net_status_msg
    text = "Joining lobby..."
  }
endscript
script create_net_panel_message msg_time = 2000
  create_panel_block id = net_panel_msg <...> pos = (320, 150) rgba = [ 144 144 144 128 ] dims = (450, 0) z_priority = -10 time = <msg_time>
endscript
script kill_net_panel_messages
  console_clear
  if ObjectExists id = net_panel_msg
    DestroyScreenElement id = net_panel_msg
  endif
  if ObjectExists id = taunt_msg_id
    DestroyScreenElement id = taunt_msg_id
  endif
  if ScreenElementExists id = perfect
    DestroyScreenElement id = perfect
  endif
  if ScreenElementExists id = perfect2
    DestroyScreenElement id = perfect2
  endif
  if ScreenElementExists id = death_message
    DestroyScreenElement id = death_message
  endif
  if ObjectExists id = speech_box_anchor
    RunScriptOnScreenElement id = speech_box_anchor hide_screen_element
  endif
  if ScreenElementExists id = goal_start_dialog
    DestroyScreenElement id = goal_start_dialog
  endif
  if ObjectExists id = ped_speech_dialog
    DestroyScreenElement id = ped_speech_dialog
  endif
  if ObjectExists id = goal_retry_anchor
    DestroyScreenElement id = goal_retry_anchor
  endif
  GetArraySize goal_panel_message_ids
   <index> = 0
  begin
    if ScreenElementExists id = ( goal_panel_message_ids [ <index> ] )
      DestroyScreenElement id = ( goal_panel_message_ids [ <index> ] )
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
endscript
script cancel_connect_to_internet
  dialog_box_exit
  CancelConnectToInternet
endscript
script create_modem_state_dialog
  create_dialog_box { title = net_status_msg
    text = <text>
    buttons = [
      { text = "cancel" pad_choose_script = cancel_connect_to_internet }
    ]
  }
endscript
script create_modem_status_dialog
  create_dialog_box { title = net_status_msg
    text = <text>
  }
endscript
script create_modem_final_state_dialog
  create_dialog_box { title = net_status_msg
    text = <text>
    buttons = [
      { text = "ok" pad_choose_script = cancel_connect_to_internet }
    ]
  }
endscript
script cancel_gamespy_connection_failure_dialog
  dialog_box_exit
  ProfileLogOff
  console_destroy
  create_network_select_menu
  SetNetworkMode
endscript
script create_gamespy_connection_failure_dialog
  LobbyDisconnect
  create_dialog_box { title = net_error_msg
    text = net_status_gamespy_no_connect
    buttons = [
      { text = "ok" pad_choose_script = cancel_gamespy_connection_failure_dialog }
    ]
  }
endscript
script lost_connection_to_gamespy
  LobbyDisconnect
  if LevelIs load_skateshop
    if ObjectExists id = console_message_vmenu
      DoScreenElementMorph id = console_message_vmenu alpha = 0
    endif
    cancel_keyboard
    dialog_box_exit
    exit_pause_menu
    remove_network_menu_textures_from_vram
    remove_buddy_list_textures_from_vram
    remove_host_options_sub_menu_textures_from_vram
    create_dialog_box { title = net_error_msg
      text = net_status_gamespy_lost_connection
      buttons = [
        { text = "ok" pad_choose_script = cancel_gamespy_connection_failure_dialog }
      ]
    }
  endif
endscript
script cancel_keyboard
  if ObjectExists id = keyboard_anchor
    DestroyScreenElement id = keyboard_anchor
  else
    return
  endif
  StopKeyboardHandler
  RemoveTextureFromVram "generic_key" no_assert
  RemoveTextureFromVram "key_left" no_assert
  RemoveTextureFromVram "key_middle" no_assert
  RemoveTextureFromVram "key_right" no_assert
  RemoveTextureFromVram "goal_left" no_assert
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu alpha = 1
  endif
  create_network_select_games_menu <...>
endscript
script enter_kb_chat_message
  GetTextElementString id = keyboard_current_string
  cancel_keyboard focus_on_enter_message
  SendMessage text = <string>
endscript
script create_lobby_onscreen_kb
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu alpha = 0
  endif
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  create_onscreen_keyboard allow_cancel keyboard_cancel_script = cancel_keyboard keyboard_done_script = enter_kb_chat_message keyboard_title = "ENTER CHAT MESSAGE" min_length = 1
endscript
script add_multiplayer_mode_goals
  AddGoal_TrickAttack
  AddGoal_ComboMambo
  AddGoal_ScoreChallenge
  AddGoal_Graffiti
  AddGoal_Slap
  AddGoal_King
  AddGoal_Ctf
  AddGoal_Horse_Mp
  AddGoal_GoalAttack
endscript
script create_score_menu
  if not ObjectExists id = net_score_menu
    SetScreenElementLock id = root_window off
    CreateScreenElement {
      type = ContainerElement
      parent = root_window
      id = net_score_menu
      font = small
      pos = (0, 0)
      just = [ left top ]
      scale = 0
      dims = (640, 480)
    }
    CreateScreenElement {
      type = VMenu
      parent = net_score_menu
      id = net_score_vmenu
      font = small
      just = [ left top ]
      pos = (45, 60)
      scale = 0.9
      padding_scale = 1
      internal_scale = 1
      internal_just = [ left top ]
    }
     <index> = 1
    begin
      FormatText ChecksumName = current_id "net_score_%i" i = <index>
      CreateScreenElement {
        type = TextElement
        parent = net_score_vmenu
        id = <current_id>
        font = small
        text = ""
        scale = 0.9
        rgba = [ 128 128 128 98 ]
        not_focusable
        z_priority = -5
      }
       <index> = ( <index> + 1 )
    repeat 8
    RunScriptOnScreenElement id = net_score_menu menu_onscreen params = { preserve_menu_state }
  endif
endscript
script clear_scores
  if ObjectExists id = net_score_menu
     <index> = 1
    begin
      FormatText ChecksumName = current_id "net_score_%i" i = <index>
      SetScreenElementProps {
        id = <current_id>
        text = ""
      }
       <index> = ( <index> + 1 )
    repeat 8
  endif
endscript
script update_score
  if ObjectExists id = net_score_menu
    SetScreenElementProps {
      id = <id>
      text = <text>
    }
  endif
endscript
script entered_network_game
  if InInternetMode
    SetQuietMode
  endif
  kill_net_panel_messages
  console_unhide
  remove_network_menu_textures_from_vram
  restore_start_key_binding
  if LocalSkaterExists
    refresh_skater_model_for_cheats
  endif
  Change check_for_unplugged_controllers = 1
  EnteredNetworkGame
endscript
script restart_local_server
  SetNetworkMode
  SetServerMode on
  SetJoinMode JOIN_MODE_PLAY
  StartServer
  JoinServer <...>
endscript
script handle_keyboard_input
  if ObjectExists id = keyboard_anchor
    if GotParam got_enter
      if ScreenElementExists id = keyboard_done_button
        FireEvent type = pad_choose target = keyboard_done_button
      else
        FireEvent type = pad_choose target = keyboard_anchor
      endif
    else
      if GotParam got_backspace
        keyboard_handle_backspace
      else
        keyboard_button_pressed <...>
      endif
    endif
  endif
endscript
script back_from_profile_options
  DestroyScreenElement id = current_menu_anchor
  remove_buddy_list_textures_from_vram
  create_internet_options
endscript
script back_from_profile_error
  dialog_box_exit
  create_internet_options
endscript
script profile_connect
  dialog_box_exit
  if not ProfileLogIn
    create_internet_options
  endif
endscript
script launch_profile_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  dialog_box_exit
  create_profile_menu
endscript
script create_profile_menu
  add_ss_menu_textures_to_vram
  make_new_menu menu_id = profile_options_menu vmenu_id = profile_options_vmenu menu_title = "LOGIN/PROFILE" pos = (225, 109)
  SetScreenElementProps { id = profile_options_menu event_handlers = [
      { pad_back back_from_profile_options }
    ]
  }
  create_helper_text generic_helper_text
  main_menu_add_item text = "" not_focusable = not_focusable dims = (200, 14)
  GetPreferenceString pref_type = network profile_email
  main_menu_add_item text = "Email Address" id = network_profile_email pad_choose_script = launch_email_keyboard pad_choose_params = { field = "profile_email" text = <ui_string> title = "EMAIL ADDRESS" min_length = 1 max_length = 50 }
  main_menu_add_item text = <ui_string> id = network_profile_email_string text_rgba = [ 128 128 128 128 ] scale = 0.8 not_focusable = not_focusable font = dialog
  GetPreferenceString pref_type = network profile_password
  GetPreferencePassword pref_type = network profile_password
  main_menu_add_item text = "Password" id = network_profile_password pad_choose_script = launch_onscreen_keyboard_from_profile_menu pad_choose_params = { field = "profile_password" text = <ui_string> title = "PROFILE PASSWORD" min_length = 1 max_length = 10 password }
  main_menu_add_item text = <password_string> id = network_profile_password_string not_focusable = not_focusable font = dialog
  GetPreferenceString pref_type = network profile_password_confirm
  GetPreferencePassword pref_type = network profile_password_confirm
  main_menu_add_item text = "Confirm Password" id = network_profile_password_confirm pad_choose_script = launch_onscreen_keyboard_from_profile_menu pad_choose_params = { field = "profile_password_confirm" text = <ui_string> title = "PROFILE PASSWORD CONFIRM" min_length = 1 max_length = 10 password }
  main_menu_add_item text = <password_string> id = network_profile_password_confirm_string not_focusable = not_focusable font = dialog
  GetPreferenceString pref_type = network profile_email
  if ( <ui_string> = "" )
    main_menu_add_item text = "Login/Create" id = network_profile_create pad_choose_script = create_profile not_focusable
  else
    GetPreferenceString pref_type = network profile_password
    if ( <ui_string> = "" )
      main_menu_add_item text = "Login/Create" id = network_profile_create pad_choose_script = create_profile not_focusable
    else
      pw_string = <ui_string>
      GetPreferenceString pref_type = network profile_password_confirm
      if ( <pw_string> = <ui_string> )
        main_menu_add_item text = "Login/Create" id = network_profile_create pad_choose_script = create_profile
      else
        main_menu_add_item text = "Login/Create" id = network_profile_create pad_choose_script = create_profile not_focusable
      endif
    endif
  endif
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
  set_sub_bg type = SpriteElement
  create_icon texture = PA_network
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = (323, 170)
    rgba = [ 0 0 0 50 ]
    scale = (58, 6)
    just = [ center top ]
    z_priority = 2
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = (323, 215)
    rgba = [ 0 0 0 50 ]
    scale = (58, 6)
    just = [ center top ]
    z_priority = 2
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = (323, 260)
    rgba = [ 0 0 0 50 ]
    scale = (58, 6)
    just = [ center top ]
    z_priority = 2
  }
  draw_menu_box delta_pos = (94, 30) middle_repeat = 9 box_right_scale = (0.8, 0.75)
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script launch_onscreen_keyboard_from_profile_menu
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_onscreen_keyboard callback_params = { allow_cancel keyboard_cancel_script = profile_setup_back_from_keyboard keyboard_done_script = set_profile_setting keyboard_title = <title> <...> }
endscript
script profile_setup_back_from_keyboard
  destroy_onscreen_keyboard
  create_profile_menu
endscript
script set_profile_setting
  GetTextElementString id = keyboard_current_string
  set_preferences_from_ui prefs = network <...>
  destroy_onscreen_keyboard
  create_profile_menu
endscript
script create_profile
  DestroyScreenElement id = current_menu_anchor
  CreateProfile
  create_dialog_box { title = net_status_msg
    text = "Please Wait..."
  }
endscript
script log_in_profile
  dialog_box_exit
  create_dialog_box { title = net_status_msg
    text = "Logging in..."
  }
endscript
script back_to_profile_menu
  dialog_box_exit
  create_profile_menu
endscript
script create_wrong_profile_password_dialog
  dialog_box_exit
  create_dialog_box { title = "WRONG PASSWORD"
    text = "The password you have entered is invalid for this account."
    buttons = [ { text = "ok" pad_choose_script = back_to_profile_menu }
    ]
  }
endscript
script profile_logged_in
  set_preferences_from_ui prefs = network field = "profile_success" string = "Yes" checksum = boolean_true
  dialog_box_exit
  create_internet_options
endscript
script launch_add_buddy
  DestroyScreenElement id = current_menu_anchor
  make_new_menu menu_id = add_buddy_menu vmenu_id = lobby_buddy_list_menu menu_title = "ADD HOMIE"
  SetScreenElementProps { id = add_buddy_menu event_handlers = [
      { pad_back create_pause_menu }
    ]
  }
  FillProspectiveBuddyList
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript
script cancel_add_buddy
  dialog_box_exit
  Printf "cancel_add_buddy"
  actions_menu_anchor:DoMorph scale = 1
  game_list_menu_anchor:DoMorph scale = 1
  DoScreenElementMorph id = player_list_anchor time = 0 scale = 1
  DoScreenElementMorph id = chat_box_anchor time = 0 scale = 1
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1
  endif
  FireEvent type = focus target = lobby_player_list_menu
  Change current_lobby_focus = 2
  Change check_for_unplugged_controllers = 1
  AssignAlias id = lobby_player_list_menu alias = current_menu
endscript
script cant_add_buddy_prompt_1
  FireEvent type = unfocus target = lobby_player_list_menu
  Change check_for_unplugged_controllers = 0
  actions_menu_anchor:DoMorph scale = 0
  game_list_menu_anchor:DoMorph scale = 0
  DoScreenElementMorph id = player_list_anchor time = 0 scale = 0
  DoScreenElementMorph id = chat_box_anchor time = 0 scale = 0
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
  endif
  FormatText TextName = msg_text "This user does not have a GameSpy profile and therefore can not be tracked and added to your homie list."
  create_dialog_box { title = "PLAYER NOT LOGGED IN"
    text = <msg_text>
    buttons = [ { text = "ok" pad_choose_script = cancel_add_buddy }
    ]
  }
endscript
script cant_add_buddy_prompt_3
  FireEvent type = unfocus target = lobby_player_list_menu
  Change check_for_unplugged_controllers = 0
  actions_menu_anchor:DoMorph scale = 0
  game_list_menu_anchor:DoMorph scale = 0
  DoScreenElementMorph id = player_list_anchor time = 0 scale = 0
  DoScreenElementMorph id = chat_box_anchor time = 0 scale = 0
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
  endif
  FormatText TextName = msg_text "Your homie list is full. You must remove some homies before adding new ones."
  create_dialog_box { title = "HOMIE LIST FULL"
    text = <msg_text>
    buttons = [ { text = "ok" pad_choose_script = cancel_add_buddy }
    ]
  }
endscript
script cant_add_buddy_prompt_2
  FireEvent type = unfocus target = lobby_player_list_menu
  Change check_for_unplugged_controllers = 0
  actions_menu_anchor:DoMorph scale = 0
  game_list_menu_anchor:DoMorph scale = 0
  DoScreenElementMorph id = player_list_anchor time = 0 scale = 0
  DoScreenElementMorph id = chat_box_anchor time = 0 scale = 0
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
  endif
  FormatText TextName = msg_text "You must create a GameSpy profile before you can track users by adding them to your homie list."
  create_dialog_box { title = "NO GAMESPY PROFILE"
    text = <msg_text>
    buttons = [ { text = "ok" pad_choose_script = cancel_add_buddy }
    ]
  }
endscript
script cant_add_self_to_buddy_prompt
  FireEvent type = unfocus target = lobby_player_list_menu
  Change check_for_unplugged_controllers = 0
  actions_menu_anchor:DoMorph scale = 0
  game_list_menu_anchor:DoMorph scale = 0
  DoScreenElementMorph id = player_list_anchor time = 0 scale = 0
  DoScreenElementMorph id = chat_box_anchor time = 0 scale = 0
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
  endif
  FormatText TextName = msg_text "You may not add yourself to your own homie list."
  create_dialog_box { title = "MY OWN HOMIE"
    text = <msg_text>
    buttons = [ { text = "ok" pad_choose_script = cancel_add_buddy }
    ]
  }
endscript
script already_buddy_prompt
  FireEvent type = unfocus target = lobby_player_list_menu
  Change check_for_unplugged_controllers = 0
  actions_menu_anchor:DoMorph scale = 0
  game_list_menu_anchor:DoMorph scale = 0
  DoScreenElementMorph id = player_list_anchor time = 0 scale = 0
  DoScreenElementMorph id = chat_box_anchor time = 0 scale = 0
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
  endif
  FormatText TextName = msg_text "This user is already on your homie list."
  create_dialog_box { title = "ALREADY YOUR HOMIE"
    text = <msg_text>
    buttons = [ { text = "ok" pad_choose_script = cancel_add_buddy }
    ]
  }
endscript
script add_buddy_prompt
  FireEvent type = unfocus target = lobby_player_list_menu
  Change check_for_unplugged_controllers = 0
  actions_menu_anchor:DoMorph scale = 0
  game_list_menu_anchor:DoMorph scale = 0
  DoScreenElementMorph id = player_list_anchor time = 0 scale = 0
  DoScreenElementMorph id = chat_box_anchor time = 0 scale = 0
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
  endif
  FormatText TextName = msg_text "Add %s to your homie list?" s = <net_name>
  create_dialog_box { title = "ADD HOMIE"
    text = <msg_text>
    buttons = [ { text = "Yes" pad_choose_script = lobby_add_buddy pad_choose_params = <...> }
      { text = "No" pad_choose_script = cancel_add_buddy }
    ]
  }
endscript
script add_buddy
  if BuddyListFull
    dialog_box_exit
    create_buddy_list_full_dialog
  else
    AddBuddy <...>
    dialog_box_exit
    create_adding_buddy_dialog
  endif
endscript
script remove_buddy
  RemoveBuddy <...>
  dialog_box_exit
  create_removed_buddy_dialog
endscript
script lobby_add_buddy
  dialog_box_exit
  AddBuddy profile = <profile> nick = <net_name>
  if InNetGame
    create_dialog_box { title = net_status_msg
      text = "Added homie"
      buttons = [ { text = "close" pad_choose_script = cancel_add_buddy }
      ]
    }
  else
    FormatText TextName = msg_text "Adding %s to homie list..." s = <net_name>
    SendMessage text = <msg_text> system_message
    cancel_add_buddy
    if ScreenElementExists id = actions_menu
      FillPlayerList
      if ( current_lobby_focus = 2 )
        refocus_actions_menu
      endif
    endif
  endif
endscript
script create_adding_buddy_dialog
  create_dialog_box { title = net_status_msg
    text = "Adding homie..."
    buttons = [ { text = "close" pad_choose_script = close_add_buddy }
    ]
    dialog_tracker_id
  }
endscript
script create_buddy_list_full_dialog
  create_dialog_box { title = net_error_msg
    text = "Your homie list is full. You must remove some homies before adding new ones."
    buttons = [ { text = "close" pad_choose_script = close_add_buddy }
    ]
  }
endscript
script failed_add_buddy_already_buddy
  if InNetGame
    create_failed_add_buddy_dialog
  else
    SendMessage text = "User already on homie list." system_message
  endif
endscript
script added_buddy
  if LevelIs load_skateshop
    FormatText TextName = msg_text "Added %s to homie list." s = <net_name>
    SendMessage text = <msg_text> system_message
  else
    create_added_buddy_dialog
  endif
endscript
script removed_buddy
  if ObjectExists id = <id>
    DestroyScreenElement id = <id>
  endif
endscript
script create_added_buddy_dialog
  if ObjectExists id = dialog_tracker_id
    dialog_box_exit
  endif
  if not ObjectExists id = dialog_box_anchor
    create_dialog_box { title = net_status_msg
      text = "Added homie."
      buttons = [ { text = "ok" pad_choose_script = accept_buddy_ok }
      ]
    }
  endif
endscript
script create_removed_buddy_dialog
  dialog_box_exit
  create_dialog_box { title = net_status_msg
    text = "Removed homie."
    buttons = [ { text = "ok" pad_choose_script = accept_buddy_ok }
    ]
  }
endscript
script create_failed_add_buddy_dialog
  destroy_onscreen_keyboard
  dialog_box_exit
  create_error_box { title = net_status_msg
    text = "User was already your homie."
    buttons = [ { text = "ok" pad_choose_script = accept_buddy_ok }
    ]
  }
endscript
script close_add_buddy
  dialog_box_exit
  create_pause_menu
endscript
script accept_buddy_ok
  dialog_box_exit
  create_pause_menu
endscript
script launch_in_game_buddy_list
  DestroyScreenElement id = current_menu_anchor
  make_new_menu menu_id = buddy_list_menu vmenu_id = lobby_buddy_list_menu menu_title = "HOMIE LIST"
  SetScreenElementProps { id = buddy_list_menu event_handlers = [
      { pad_back create_pause_menu }
    ]
  }
  FillBuddyList
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript
script launch_shell_buddy_list parent = root_window
  dialog_box_exit
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
  endif
  if InNetGame
    remove_pause_menu_textures_from_vram
    add_ss_menu_textures_to_vram
    GoalManager_HidePoints
  endif
  add_buddy_list_textures_to_vram
  if ( <parent> = root_window )
    if ObjectExists id = current_menu_anchor
      DestroyScreenElement id = current_menu_anchor
    endif
  endif
  make_new_menu { parent = <parent>
    type = VScrollingMenu
    menu_id = buddy_list_menu
    vmenu_id = lobby_buddy_list_menu
    menu_title = ""
    pos = (250, 160)
    dims = (600, 284)
    padding_scale = 0.6
    pos = (90, 69)
    helper_text = generic_helper_text
    dont_allow_wrap = dont_allow_wrap
  }
   <root_pos> = (190, 23)
  set_sub_bg_goal {
    pos = <root_pos>
    goal_mid_scale = (19, 1.33)
    goal_end_scale = (1, 1.33)
  }
  create_icon texture = PA_homie pos = (47, 21)
  CreateScreenElement {
    type = TextElement
    parent = buddy_list_menu
    font = testtitle
    text = "HOMIE LIST"
    rgba = [ 128 128 128 85 ]
    scale = 1.4
    pos = (93, 23)
    just = [ left top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = buddy_list_menu
    texture = black
    pos = ( <root_pos> + (-110, 30) )
    just = [ left top ]
    rgba = [ 0 0 0 85 ]
    scale = (124, 7)
    z_priority = 2
  }
  CreateScreenElement {
    type = TextElement
    parent = buddy_list_menu
    font = dialog
    text = "Name"
    rgba = [ 127 102 0 100 ]
    scale = 0.9
    pos = ( <root_pos> + (-100, 35) )
    just = [ left top ]
    z_priority = 3
  }
  CreateScreenElement {
    type = TextElement
    parent = buddy_list_menu
    font = dialog
    text = "Status"
    rgba = [ 127 102 0 100 ]
    scale = 0.9
    pos = ( <root_pos> + (50, 35) )
    just = [ left top ]
    z_priority = 3
  }
  CreateScreenElement {
    type = TextElement
    parent = buddy_list_menu
    font = dialog
    text = "Location"
    rgba = [ 127 102 0 100 ]
    scale = 0.9
    pos = ( <root_pos> + (165, 35) )
    just = [ left top ]
    z_priority = 3
  }
  CreateScreenElement {
    type = SpriteElement
    parent = buddy_list_menu
    id = buddy_list_up_arrow
    texture = up_arrow
    pos = ( <root_pos> + (119, 35) )
    just = [ left top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 3
  }
  GetScreenElementPosition id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = buddy_list_menu
    id = buddy_list_down_arrow
    texture = down_arrow
    pos = ( <root_pos> + (119, 345) )
    just = [ left top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 3
  }
  CreateScreenElement {
    type = SpriteElement
    parent = buddy_list_menu
    texture = black
    pos = ( <root_pos> + (-110, 340) )
    just = [ left top ]
    rgba = [ 0 0 0 85 ]
    scale = (124, 7)
    z_priority = 2
  }
  CreateScreenElement {
    type = SpriteElement
    parent = buddy_list_menu
    texture = black
    scale = (2, 70.5)
    rgba = [ 0 0 0 80 ]
    pos = ( <root_pos> + (40, 58) )
    just = [ left top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = buddy_list_menu
    texture = black
    scale = (2, 70.5)
    rgba = [ 0 0 0 80 ]
    pos = ( <root_pos> + (150, 58) )
    just = [ left top ]
  }
  if InNetGame
    SetScreenElementProps { id = buddy_list_menu event_handlers = [ { pad_back back_to_pause_menu_from_buddy_list } ] }
  else
    if ( in_net_lobby = 1 )
      SetScreenElementProps { id = buddy_list_menu event_handlers = [ { pad_back back_to_server_list_from_buddy_list } ] }
    else
      SetScreenElementProps { id = buddy_list_menu event_handlers = [ { pad_back back_from_profile_options } ] }
    endif
  endif
  if HasBuddies
    if InGroupRoom
      FillBuddyList allow_remove
    else
      FillBuddyList allow_remove
    endif
  endif
  if ( <parent> = root_window )
    RunScriptOnScreenElement id = buddy_list_menu menu_onscreen
  else
  endif
  if not GotParam dont_animate_in
    RunScriptOnScreenElement id = current_menu_anchor animate_in
  endif
endscript
script add_buddy_list_textures_to_vram
  AddTextureToVram "pa_homie"
  AddTextureToVram "goal_line"
  AddTextureToVram "goal_left"
  AddTextureToVram "goal_mid"
  AddTextureToVram "goal_right"
endscript
script remove_buddy_list_textures_from_vram
  RemoveTextureFromVram "pa_homie"
  RemoveTextureFromVram "goal_line"
  RemoveTextureFromVram "goal_left"
  RemoveTextureFromVram "goal_mid"
  RemoveTextureFromVram "goal_right"
endscript
script back_from_buddy_options
  lobby_buddy_list_menu:DoMorph time = 0 scale = 0.65
  lobby_buddy_list_title:DoMorph time = 0 scale = 0.65
  FireEvent type = focus target = lobby_buddy_list_menu
  dialog_box_exit
endscript
script present_buddy_options back_script = launch_shell_buddy_list remove_script = lobby_remove_buddy
  if GotParam in_lobby
    if ObjectExists id = current_menu_anchor
      DestroyScreenElement id = current_menu_anchor
    endif
    pad_back_params = { from_lobby }
  else
    DestroyScreenElement id = current_menu_anchor
  endif
  back_script = launch_shell_buddy_list
  nick = <name>
  if GotParam allow_join
    if GotParam allow_remove
      FormatText TextName = msg_text "%s : %t" s = <status> t = <location>
      create_dialog_box { title = <nick>
        text = <msg_text>
        buttons = [ { text = "back" pad_choose_script = <back_script> pad_choose_params = <pad_back_params> }
          { text = "join" pad_choose_script = join_buddy pad_choose_params = <...> }
          { text = "observe" pad_choose_script = observe_buddy pad_choose_params = <...> }
          { text = "remove" pad_choose_script = <remove_script> pad_choose_params = <...> }
        ]
      }
    else
      FormatText TextName = msg_text "%s : %t" s = <status> t = <location>
      create_dialog_box { title = <nick>
        text = <msg_text>
        buttons = [ { text = "back" pad_choose_script = <back_script> pad_choose_params = <pad_back_params> }
          { text = "join" pad_choose_script = join_buddy pad_choose_params = <...> }
          { text = "observe" pad_choose_script = observe_buddy pad_choose_params = <...> }
        ]
      }
    endif
  else
    if GotParam allow_remove
      FormatText TextName = msg_text "%s : %t" s = <status> t = <location>
      create_dialog_box { title = <nick>
        text = <msg_text>
        buttons = [ { text = "back" pad_choose_script = <back_script> pad_choose_params = <pad_back_params> }
          { text = "remove" pad_choose_script = <remove_script> pad_choose_params = <...> }
        ]
      }
    else
      FormatText TextName = msg_text "%s : %t" s = <status> t = <location>
      create_dialog_box { title = <nick>
        text = <msg_text>
        buttons = [ { text = "back" pad_choose_script = <back_script> pad_choose_params = <pad_back_params> }
        ]
      }
    endif
  endif
endscript
script join_buddy
  JoinBuddy <...>
endscript
script observe_buddy
  JoinBuddy <...> observe
endscript
script lobby_remove_buddy
  RemoveBuddy <...>
  FillBuddyList clear_list allow_remove
  launch_shell_buddy_list
endscript
script shell_remove_buddy
  RemoveBuddy <...>
  back_from_shell_buddy_options
endscript
script back_from_shell_buddy_options
  dialog_box_exit
  launch_shell_buddy_list
endscript
script launch_player_list_menu
  DestroyScreenElement id = current_menu_anchor
  make_new_menu menu_id = buddy_list_menu vmenu_id = lobby_buddy_list_menu menu_title = "PLAYER LIST"
  create_helper_text generic_helper_text
  set_sub_bg type = SpriteElement
  create_icon texture = PA_fonts
  SetScreenElementProps { id = buddy_list_menu event_handlers = [
      { pad_back create_pause_menu }
    ]
  }
  FillPlayerListMenu
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script update_buddy_status
  if ObjectExists id = <id>
    SetScreenElementProps {
      id = <id>
      text = <text>
      status = <status>
      location = <location>
    }
  endif
endscript
script StartFreeSkate
  MakeSkaterGosub add_skater_to_world skater = 0
  MakeSkaterGosub add_skater_to_world skater = 1
  SetGameType freeskate2p
  SetCurrentGameType
  SetScreenModeFromGameMode
endscript
script kill_all_panel_messages
  exit_pause_menu
  dialog_box_exit
  speech_box_exit
  force_close_rankings
  close_goals_menu
  kill_net_panel_messages
  destroy_onscreen_keyboard
  if ObjectExists id = perfect
    DestroyScreenElement id = perfect
  endif
  if ObjectExists id = perfect2
    DestroyScreenElement id = perfect2
  endif
  if ObjectExists id = death_message
    DestroyScreenElement id = death_message
  endif
  if ObjectExists id = leaving_message
    DestroyScreenElement id = leaving_message
  endif
  if ObjectExists id = goal_message
    DestroyScreenElement id = goal_message
  endif
endscript
script StartingNewNetGame
  sound_options_exit just_remove
  edit_tricks_menu_exit just_remove
  kill_all_panel_messages
  GoalManager_SetCanStartGoal 1
endscript
script unlock_root_window
  SetScreenElementLock id = root_window off
endscript
script create_player_name
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    id = <id>
    type = TextElement
    parent = root_window
    font = small
    text = ""
    scale = 1.0
    pos3D = (0, 0, 0)
    rgba = [ 128 128 0 128 ]
  }
endscript
script update_player_name
  if not ObjectExists id = <id>
    create_player_name <...>
  endif
  SetScreenElementProps {
    id = <id>
    text = <text>
    pos3D = <pos3D>
  }
endscript
script destroy_player_name
  if ObjectExists id = <id>
    DestroyScreenElement id = <id>
  endif
endscript
script destroy_all_player_names
  if ObjectExists id = skater_name_0
    DestroyScreenElement id = skater_name_0
  endif
  if ObjectExists id = skater_name_1
    DestroyScreenElement id = skater_name_1
  endif
  if ObjectExists id = skater_name_2
    DestroyScreenElement id = skater_name_2
  endif
  if ObjectExists id = skater_name_3
    DestroyScreenElement id = skater_name_3
  endif
  if ObjectExists id = skater_name_4
    DestroyScreenElement id = skater_name_4
  endif
  if ObjectExists id = skater_name_5
    DestroyScreenElement id = skater_name_5
  endif
  if ObjectExists id = skater_name_6
    DestroyScreenElement id = skater_name_6
  endif
  if ObjectExists id = skater_name_7
    DestroyScreenElement id = skater_name_7
  endif
endscript
script create_net_metrics
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    id = net_metrics
    type = TextElement
    parent = root_window
    font = small
    text = ""
    scale = 1.0
    pos = (150, 400)
    rgba = [ 128 128 0 128 ]
  }
endscript
script update_net_metrics
  if not ObjectExists id = net_metrics
    create_net_metrics
  endif
  SetScreenElementProps {
    id = net_metrics
    text = <text>
  }
endscript
