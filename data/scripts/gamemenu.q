ALWAYSPLAYMUSIC = 1
HIDEHUD = 0
meta_button_map_ps2 = [
  3
  0
  0
  1
  2
  2
  1
  1
  2
  1
  14
  15
  0
  1
  2
  16
  17
  2
  1
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
]
meta_button_map_gamecube = [
  3
  1
  0
  1
  2
  2
  1
  1
  2
  0
  14
  15
  1
  2
  2
  14
  15
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
]
meta_button_map_xbox = [
  3
  2
  0
  1
  2
  2
  1
  1
  0
  1
  14
  15
  2
  1
  1
  14
  15
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
]
smallfont_colors = [
  [ 128 128 128 100 ]
  [ 102 26 8 100 ]
  [ 17 64 116 100 ]
  [ 9 107 36 100 ]
  [ 123 99 3 100 ]
  [ 0 128 128 100 ]
  [ 128 0 128 100 ]
  [ 30 50 80 100 ]
  [ 88 105 112 128 ]
]
dialogfont_colors = [
  [ 88 105 112 128 ]
  [ 102 26 8 100 ]
  [ 17 64 116 100 ]
  [ 9 107 36 100 ]
  [ 123 99 3 100 ]
  [ 127 102 0 100 ]
  [ 100 100 128 100 ]
]
script new_screen_element_test
  PushMemProfile "Fonts and Bitmaps"
  ScreenElementSystemInit
  LoadLevelPreFile "panelsprites.pre"
  LoadFont "testtitle" char_spacing = -4 space_spacing = 15
  LoadFont "newtrickfont" char_spacing = -1 space_spacing = 14 color_tab = newtrickfont_colors
  LoadFont "small" char_spacing = 1.5 space_spacing = 9 color_tab = smallfont_colors
  LoadFont "newtimerfont" char_spacing = -1
  LoadFont "dialog" char_spacing = 0 space_spacing = 10 color_tab = dialogfont_colors
  LoadFont better4_control_buttonsfont_value buttons_font
  load_textures_to_main_memory
  load_permanent_textures
  create_panel_stuff
  UnloadPreFile "panelsprites.pre" dont_assert
  setup_main_button_event_mappings
  SetScreenElementProps {
    id = root_window
    tags = { menu_state = off }
  }
  FireEvent type = focus target = root_window
  PopMemProfile
endscript
script handle_start_pressed
  root_window:GetTags
  if ChecksumEquals a = <menu_state> b = on
    if GotParam pause_controller
      if not ( <pause_controller> = -1 )
        if not ( <device_num> = <pause_controller> )
          return
        endif
      endif
    endif
    if not InNetGame
      UnPauseGame
    endif
    exit_pause_menu
  endif
  if ChecksumEquals a = <menu_state> b = off
    if not InMultiplayerGame
      if not ControllerBoundToSkater controller = <device_num> skater = 0
        return
      endif
    else
      if InSplitScreenGame
        if not ControllerBoundToSkater controller = <device_num> skater = 0
          if not ControllerBoundToSkater controller = <device_num> skater = 1
            return
          endif
        endif
      endif
    endif
    SetTags pause_controller = <device_num>
    possibly_remove_temp_special_trick
    if not InNetGame
      GetSkaterID
      if GetSkaterCamAnimParams skater = <objId>
        if ( <allow_pause> = 0 )
          return
        endif
      endif
      Printf "-------------------- PAUSING GAME ----------------------"
      PauseGame
      Wait 1 gameframe
      pause_trick_text
      pause_balance_meter
      kill_blur
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
      hide_goal_panel_messages
      GoalManager_PauseAllGoals
    endif
    create_pause_menu device_num = <device_num>
  endif
endscript
script restore_start_key_binding
  SetScreenElementProps {
    id = root_window
    event_handlers = [ { pad_start handle_start_pressed } ]
    replace_handlers
  }
endscript
script kill_start_key_binding
  SetScreenElementProps {
    id = root_window
    event_handlers = [ { pad_start null_script } ]
    replace_handlers
  }
endscript
script make_new_ingame_menu
  make_new_menu <...>
endscript
script make_new_menu { menu_title = "Paused"
    padding_scale = 1.15
    internal_scale = 1
    pos = (230, 109)
    dims = (200, 100)
    internal_just = [ left top ]
    parent = root_window
    just = [ center center ]
    scrolling_menu_offset = (0, 10)
  }
   <pos> = ( <pos> + (0, 12) )
  SetScreenElementLock id = <parent> off
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = <menu_id>
    font = small
    pos = (320, 240)
    scale = 1
    dims = (640, 480)
    focusable_child = <vmenu_id>
  }
  switch <type>
  case VScrollingMenu
    if GotParam scrolling_menu_title_id
      CreateScreenElement {
        type = TextElement
        parent = <menu_id>
        id = <scrolling_menu_title_id>
        font = testtitle
        text = <menu_title>
        scale = 1.4
        pos = <pos>
        just = [ left top ]
        rgba = [ 128 128 128 98 ]
        not_focusable
      }
      GetStackedScreenElementPos y id = <id> offset = <scrolling_menu_offset>
    endif
    CreateScreenElement {
      type = VScrollingMenu
      parent = <menu_id>
      id = <scrolling_menu_id>
      pos = <pos>
      just = [ left top ]
      dims = <dims>
      scale = <scale>
      internal_just = [ left top ]
      num_items_to_show = <num_items_to_show>
    }
     <vscrolling_menu_id> = <id>
    CreateScreenElement {
      type = VMenu
      parent = <vscrolling_menu_id>
      id = <vmenu_id>
      dims = <dims>
      dims = <dims>
      font = small
      just = [ left top ]
      pos = (0, 0)
      scale = <scale>
      regular_space_amount = <regular_space_amount>
      padding_scale = <padding_scale>
      internal_scale = <internal_scale>
      internal_just = <internal_just>
       <dont_allow_wrap>
      event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { Up } }
        { pad_down generic_menu_up_or_down_sound params = { Down } }
        { pad_back generic_menu_pad_back_sound }
      ]
    }
  default
    if ( <menu_id> = main_menu )
      pad_back_script = null_script
    else
      pad_back_script = generic_menu_pad_back_sound
    endif
    CreateScreenElement {
      type = VMenu
      parent = <menu_id>
      id = <vmenu_id>
      font = small
      just = [ left top ]
      pos = <pos>
      padding_scale = <padding_scale>
      internal_scale = <internal_scale>
      internal_just = <internal_just>
       <dont_allow_wrap>
      event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { Up } }
        { pad_down generic_menu_up_or_down_sound params = { Down } }
        { pad_back <pad_back_script> }
      ]
    }
    CreateScreenElement {
      type = TextElement
      parent = <vmenu_id>
      font = testtitle
      text = <menu_title>
      scale = 1.4
      rgba = [ 128 128 128 98 ]
      not_focusable
    }
  endswitch
  AssignAlias id = <menu_id> alias = current_menu_anchor
  AssignAlias id = <vmenu_id> alias = current_menu
  if GotParam helper_text
    create_helper_text <helper_text>
  endif
endscript
script make_new_sprite_menu menu_id = main_menu_anchor vmenu_id = main_menu pad_back_script = exit_pause_menu
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = <menu_id>
    font = small
    pos = (320, 240)
    just = [ center center ]
    scale = 0
    dims = (640, 480)
    focusable_child = <vmenu_id>
  }
  if GotParam menu_title
    CreateScreenElement {
      type = SpriteElement
      parent = <menu_id>
      texture = <menu_title>
      pos = (330, 60)
      just = [ left top ]
      rgba = [ 128 128 128 70 ]
    }
  endif
  CreateScreenElement {
    type = VMenu
    parent = <menu_id>
    id = <vmenu_id>
    font = small
    just = [ left top ]
    pos = (241, 80)
    internal_just = [ left top ]
    event_handlers = [ { pad_back generic_menu_pad_back_sound }
      { pad_back <pad_back_script> params = <pad_back_params> }
      { pad_up generic_menu_up_or_down_sound params = { Up } }
      { pad_down generic_menu_up_or_down_sound params = { Down } }
    ]
  }
  AssignAlias id = <menu_id> alias = current_menu_anchor
  AssignAlias id = <vmenu_id> alias = current_menu
endscript
script set_menu_bg parent = current_menu_anchor
   <number_of_slices> = 7
   <slice_height> = 32
   <slice_scale> = (1, 1.25)
   <slice_height> = ( ( (0, 1).<slice_scale> ) * <slice_height> )
  CreateScreenElement {
    type = SpriteElement
    parent = <parent>
    texture = paused
    pos = (153, 69)
    just = [ left top ]
    rgba = [ 118 118 128 120 ]
  }
  GetStackedScreenElementPos x id = <id> offset = (-8, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = <parent>
    texture = SlicePause_1
    pos = <pos>
    just = [ left top ]
    scale = <paused_bar_scale>
  }
  if ObjectExists id = current_menu
    SetScreenElementLock id = current_menu on
    GetScreenElementDims id = current_menu
    GetScreenElementPosition id = <id>
     <top_of_first_slice> = ( <screenelementpos>.(0, 1) )
    GetScreenElementPosition id = current_menu
     <top_of_menu> = ( <screenelementpos>.(0, 1) )
     <height> = ( <height> - <slice_height> )
     <height> = ( <height> + ( <top_of_menu> - <top_of_first_slice> ) )
     <draw_all> = 0
  else
     <height> = 400
     <draw_all> = 1
  endif
   <last_slice> = 1
  begin
    if ( <draw_all> = 0 )
      if ( ( <height> < 0 ) or ( <last_slice> = <number_of_slices> ) )
        break
      endif
    else
      if ( <last_slice> = <number_of_slices> )
        break
      endif
    endif
     <last_slice> = ( <last_slice> + 1 )
    FormatText ChecksumName = texture_name "SlicePause_%i" i = <last_slice>
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = <parent>
      texture = <texture_name>
      pos = <pos>
      just = [ left top ]
      scale = <slice_scale>
    }
     <height> = ( <height> - <slice_height> )
  repeat
endscript
script set_sub_bg { parent = current_menu_anchor
    pos = (326, 115)
    scale = (1.17, 1.1)
    just = [ center top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <parent>
    texture = options_bg
    draw_behind_parent
    pos = <pos>
    scale = <scale>
    just = <just>
    rgba = [ 128 128 128 128 ]
    z_priority = 1
  }
endscript
script set_sub_bg_goal goal_mid_scale = (14.8, 1.33) pos = (250, 23) goal_end_scale = (1, 1.33)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = options_bg
    draw_behind_parent
    pos = <pos>
    scale = (1.1, 1)
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 0
  }
  GetStackedScreenElementPos y id = <id> offset = (5, -36)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_left
    draw_behind_parent
    pos = <pos>
    scale = <goal_end_scale>
    just = [ left top ]
    rgba = [ 56 60 71 118 ]
    z_priority = 0
  }
  GetStackedScreenElementPos x id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_mid
    draw_behind_parent
    pos = <pos>
    scale = <goal_mid_scale>
    just = [ left top ]
    rgba = [ 56 60 71 118 ]
    z_priority = 0
  }
  GetStackedScreenElementPos x id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    draw_behind_parent
    pos = <pos>
    scale = <goal_end_scale>
    just = [ left top ]
    rgba = [ 56 60 71 118 ]
    z_priority = 0
  }
endscript
script create_icon pos = (176, 115) parent = current_menu_anchor scale = (0.95, 0.95) z_priority = 5
  CreateScreenElement {
    type = SpriteElement
    parent = <parent>
    id = <id>
    pos = <pos>
    scale = <scale>
    just = [ left top ]
    rgba = [ 127 102 0 128 ]
    z_priority = <z_priority>
    texture = <texture>
  }
endscript
script make_text_sprite pos = (-27, 10) just = [ center center ] rgba = [ 128 128 128 50 ] scale = 0.45
  CreateScreenElement {
    type = SpriteElement
    parent = <parent>
    texture = <texture>
    pos = <pos>
    rgba = [ 0 0 0 0 ]
    just = <just>
    scale = <scale>
  }
endscript
script create_pause_menu
  if CustomParkMode editing
    SetParkEditorPauseMode pause
  endif
  if not GotParam no_sound
    PlaySound MenuBack vol = 50
  endif
  remove_ss_menu_textures_from_vram
  add_pause_menu_textures_to_vram
  unhide_root_window
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
  endif
  if InNetGame
    if LocalSkaterExists
      skater:NetDisablePlayerInput
    endif
  else
    if CustomParkMode editing
      parked_setup_main_menu
      PauseMusicAndStreams 1
      return
    endif
    if CustomParkMode testing
      parked_setup_test_play_menu
      PauseMusicAndStreams 1
      return
    endif
    if InSplitScreenGame
      create_mp_pause_menu
      PauseMusicAndStreams 1
      return
    endif
  endif
  PauseMusicAndStreams 1
  if GotParam no_exit
    make_new_sprite_menu menu_id = pause_menu vmenu_id = pause_vmenu pad_back_script = nullscript
  else
    make_new_sprite_menu menu_id = pause_menu vmenu_id = pause_vmenu pad_back_script = handle_start_pressed
  endif
  if not GotParam no_exit
    create_helper_text generic_helper_text
  else
    create_helper_text generic_helper_text_no_back
  endif
  kill_start_key_binding
  if GameModeEquals is_singlesession
    if GoalManager_GoalIsActive name = TrickAttack
      make_sprite_menu_item text = "Continue" id = menu_continue pad_choose_script = handle_start_pressed
      make_text_sprite texture = PA_continue parent = menu_continue
    else
      SetScreenElementProps id = pause_vmenu event_handlers = [ { pad_back null_script } ] replace_handlers
      create_helper_text generic_helper_text_no_back
    endif
  else
    if not GotParam no_exit
      make_sprite_menu_item text = "Continue" id = menu_continue pad_choose_script = handle_start_pressed
      if InNetGame
        if not IsBetterObserving
          make_sprite_menu_item text = "Observe" id = menu_network_observe_select pad_choose_script = EnterBetterObserve
        else
          if not GoalManager_HasActiveGoals
            make_text_sub_menu_item text = "Quit Observing" id = quit_observe_temp pad_choose_script = QuitBetterObservivng
          else
            make_text_sub_menu_item text = "Quit Observing" not_focusable id = quit_observe_temp pad_choose_script = QuitBetterObservivng
          endif
        endif
      endif
      make_text_sprite texture = PA_continue parent = menu_continue
    endif
  endif
  if GameModeEquals is_goal_attack
    if not IsBetterObserving
      if GoalManager_CanRetryGoal
        if GoalManager_GetLastGoalId
          if not GoalManager_HasWonGoal name = <goal_id>
            make_sprite_menu_item text = "Retry Last Goal" id = menu_retry_goal pad_choose_script = menu_select pad_choose_params = { menu_select_script = RetryCurrentGoal }
            make_text_sprite texture = PA_retry parent = menu_retry_goal
          endif
        endif
      endif
    endif
    make_sprite_menu_item text = "View Goals" id = menu_view_goals pad_choose_script = create_view_selected_goals_menu
    make_text_sprite texture = PA_view parent = menu_view_goals
  endif
  if GameModeEquals is_career
    if GoalManager_IsInCompetition
      GoalManager_GetGoalParams name = <goal_id>
      if GotParam already_ended_run
        if ( <already_ended_run> = 0 )
          make_sprite_menu_item text = "End Current Run" id = menu_end_run pad_choose_script = goal_comp_end_current_run
          make_text_sprite texture = PA_end parent = menu_end_run
        endif
      endif
    endif
    if GoalManager_CanRetryGoal
      make_sprite_menu_item text = "Retry Last Goal" id = menu_retry_goal pad_choose_script = menu_select pad_choose_params = { stop_streams menu_select_script = RetryCurrentGoal }
      make_text_sprite texture = PA_retry parent = menu_retry_goal
    endif
    if GoalManager_HasActiveGoals
      make_sprite_menu_item text = "End Current Goal" id = menu_end_current_goal pad_choose_script = menu_select pad_choose_params = { menu_select_script = end_current_goal_run }
      make_text_sprite texture = PA_end parent = menu_end_current_goal
    endif
    make_sprite_menu_item text = "View Goals" id = menu_view_goals pad_choose_script = create_view_goals_menu
    make_text_sprite texture = PA_view parent = menu_view_goals
  else
    if GameModeEquals is_singlesession
      make_sprite_menu_item text = "Retry High Score" id = menu_retry_high_score pad_choose_script = change_gamemode_singlesession_menu
      make_text_sprite texture = PA_rescore parent = menu_retry_high_score
    endif
  endif
  if InNetGame
    if OnServer
      if OnXbox
        if not IsBetterObserving
          make_sprite_menu_item text = "Sit Out" id = menu_network_sit_select pad_choose_script = launch_network_sit_out_menu
        endif
        make_sprite_menu_item text = "Host Options" id = menu_network_server_opts_select pad_choose_script = network_options_selected
      else
        make_sprite_menu_item text = "Server Options" id = menu_network_server_opts_select pad_choose_script = network_options_selected
      endif
      make_text_sprite texture = PA_network parent = menu_network_server_opts_select
    endif
    if IsHost
      if GameModeEquals is_lobby
        if not OnServer
          if OnXbox
            make_sprite_menu_item text = "Server Options" id = menu_network_server_opts_select pad_choose_script = network_options_selected
          else
            make_sprite_menu_item text = "Server Options" id = menu_network_server_opts_select pad_choose_script = network_options_selected
          endif
          make_text_sprite texture = PA_network parent = menu_network_server_opts_select
        endif
        if not NetworkGamePending
          if not ChangeLevelPending
            make_sprite_menu_item text = "Start Game" id = menu_network_start_select pad_choose_script = network_game_options_selected
            make_text_sprite texture = PA_retry parent = menu_network_start_select
            make_sprite_menu_item text = "Change level" id = menu_level_select pad_choose_script = launch_level_select_menu pad_choose_params = { show_warning }
            make_text_sprite texture = PA_level parent = menu_level_select
          endif
        endif
      else
        make_sprite_menu_item text = "Restart Game" id = menu_network_restart_select pad_choose_script = network_game_options_selected
        make_text_sprite texture = PA_retry parent = menu_network_restart_select
        make_sprite_menu_item text = "End Current Game" id = menu_network_end_select pad_choose_script = network_end_game_selected
        make_text_sprite texture = PA_end parent = menu_network_end_select
      endif
    endif
    make_sprite_menu_item text = "Options" id = menu_options pad_choose_script = create_options_menu
    make_text_sprite texture = PA_options parent = menu_options
    if not OnXbox
      if IsTrue bootstrap_build
        make_sprite_menu_item text = "Player List" id = menu_network_remove_select pad_choose_script = launch_remove_players_menu not_focusable = not_focusable
        make_text_sprite texture = PA_fonts parent = menu_network_remove_select
      else
        make_sprite_menu_item text = "Player List" id = menu_network_player_list_select pad_choose_script = launch_player_list_menu
        make_text_sprite texture = PA_fonts parent = menu_network_player_list_select
        if ProfileLoggedIn
          make_sprite_menu_item text = "Homie List" id = menu_network_homie_list_select pad_choose_script = launch_shell_buddy_list
          make_text_sprite texture = PA_fonts parent = menu_network_homie_list_select
        endif
      endif
    endif
  else
    if not IsTrue bootstrap_build
      make_sprite_menu_item text = "Change level" id = menu_level_select pad_choose_script = launch_level_select_menu
      make_text_sprite texture = PA_level parent = menu_level_select
      make_sprite_menu_item text = "Save Game" id = menu_save_game pad_choose_script = launch_pause_menu_save_game_sequence
      make_text_sprite texture = PA_save parent = menu_save_game
    endif
    make_sprite_menu_item text = "Instant Replay" id = menu_view_replay pad_choose_script = in_game_view_replay
    make_text_sprite texture = PA_movie parent = menu_view_replay
    make_sprite_menu_item text = "Options" id = menu_options pad_choose_script = create_options_menu
    make_text_sprite texture = PA_options parent = menu_options
    if not IsTrue DEMO_BUILD
      if not CD
        make_sprite_menu_item text = "Goto Restart" id = menu_skip_to_restart pad_choose_script = launch_restart_menu
        make_text_sprite texture = PA_restart parent = menu_skip_to_restart
        make_sprite_menu_item text = "Debug Menu" id = debug_menu pad_choose_script = create_debug_menu
        make_text_sprite texture = PA_Model parent = debug_menu
      endif
    endif
    if not LevelIs Load_Sk4Ed_gameplay
      make_sprite_menu_item text = "View Gaps" id = menu_skip_to_gap pad_choose_script = launch_gap_menu
      make_text_sprite texture = PA_gap parent = menu_skip_to_gap
    endif
  endif
  if InNetGame
    if GameModeEquals is_lobby
      if not IsBetterObserving
        make_sprite_menu_item {
          text = "Set Cust Restart"
          id = menu_set_custom
          pad_choose_script = menu_select
          pad_choose_params = { menu_select_script = set_custom_restart }
        }
        make_text_sprite texture = PA_set_cust parent = menu_set_custom
        if skater:SetCustomRestart
          make_sprite_menu_item text = "Goto Cust Restart" id = menu_skip_to_custom pad_choose_script = menu_select pad_choose_params = { menu_select_script = skip_to_custom_restart }
          make_text_sprite texture = PA_skip_cust parent = menu_skip_to_custom
        endif
      endif
    endif
  else
    if not GoalManager_HasActiveGoals count_all
      make_sprite_menu_item text = "Set Cust Restart" id = menu_set_custom pad_choose_script = menu_select pad_choose_params = { menu_select_script = set_custom_restart }
      make_text_sprite texture = PA_set_cust parent = menu_set_custom
      if skater:SetCustomRestart
        make_sprite_menu_item text = "Goto Cust Restart" id = menu_skip_to_custom pad_choose_script = menu_select pad_choose_params = { menu_select_script = skip_to_custom_restart }
        make_text_sprite texture = PA_skip_cust parent = menu_skip_to_custom
      endif
    endif
  endif
  // make_sprite_menu_item text = "Anim Debug 1" id = menu_anim_debug pad_choose_script = better4_anim_debug pad_choose_params = { index = 0 }
  // make_text_sprite texture = PA_options parent = menu_anim_debug
  // make_sprite_menu_item text = "Anim Debug 2" id = menu_anim_debug2 pad_choose_script = better4_anim_debug pad_choose_params = { index = 1 }
  // make_text_sprite texture = PA_options parent = menu_anim_debug2
  // make_sprite_menu_item text = "Anim Debug 3" id = menu_anim_debug3 pad_choose_script = better4_anim_debug pad_choose_params = { index = 2 }
  // make_text_sprite texture = PA_options parent = menu_anim_debug3
  if InNetGame
    make_sprite_menu_item text = "Chat Message" id = menu_chat pad_choose_script = launch_chat_keyboard
    make_text_sprite texture = PA_taunt parent = menu_chat
    if not OnServer
      if not IsBetterObserving
        if InInternetMode
          if IsTrue bootstrap_build
            make_sprite_menu_item text = "Observe" id = menu_network_observe_select pad_choose_script = chose_observe not_focusable = not_focusable
            make_text_sprite texture = PA_network parent = menu_network_observe_select
          else
            make_sprite_menu_item text = "Observe" id = menu_network_observe_select pad_choose_script = chose_observe
            make_text_sprite texture = PA_network parent = menu_network_observe_select
          endif
        endif
      endif
    endif
    if OnServer
      if IsHost
        if GameModeEquals is_lobby
          if not NetworkGamePending
            if not ChangeLevelPending
              GetPreferenceChecksum pref_type = network device_type
              switch <checksum>
              case device_sony_modem
              case device_usb_modem
                do_nothing
              default
                if InInternetMode
                  if IsTrue bootstrap_build
                    make_sprite_menu_item text = "Sit Out" id = menu_network_sit_select pad_choose_script = launch_network_sit_out_menu not_focusable = not_focusable
                    make_text_sprite texture = PA_pause parent = menu_network_sit_select
                  else
                    make_sprite_menu_item text = "Sit Out" id = menu_network_sit_select pad_choose_script = launch_network_sit_out_menu
                    make_text_sprite texture = PA_pause parent = menu_network_sit_select
                  endif
                endif
              endswitch
            endif
          endif
        endif
      endif
    endif
    make_sprite_menu_item text = "Quit" id = menu_quit pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = launch_quit_game_dialog }
    make_text_sprite texture = PA_quit parent = menu_quit
  else
    if CustomParkMode testing
      Printf "PARK EDITOR TEST PLAY MENU"
      make_sprite_menu_item text = "Back to editor" id = menu_skateshop pad_choose_script = menu_confirm_quit pad_choose_params = { yes_script = exit_test_play }
      make_text_sprite texture = PA_quit parent = menu_skateshop
    else
      make_sprite_menu_item text = "Quit" id = menu_skateshop pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = menu_confirm_quit }
      make_text_sprite texture = PA_quit parent = menu_skateshop
    endif
  endif
  set_menu_bg
  RunScriptOnScreenElement id = pause_menu menu_onscreen
endscript
script create_mp_pause_menu
  SetButtonEventMappings unblock_menu_input
  make_new_sprite_menu menu_id = pause_menu vmenu_id = pause_vmenu pad_back_script = handle_start_pressed
  kill_start_key_binding
  create_helper_text generic_helper_text
  make_sprite_menu_item text = "Continue" id = menu_continue pad_choose_script = handle_start_pressed
  make_text_sprite texture = PA_continue parent = menu_continue
  make_sprite_menu_item text = "End Current Game" id = menu_network_end_select pad_choose_script = network_end_game_selected
  make_text_sprite texture = PA_network parent = menu_network_end_select
  make_sprite_menu_item text = "Options" id = menu_mp_options pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_options_menu }
  make_text_sprite texture = PA_options parent = menu_mp_options
  make_sprite_menu_item text = "Quit" id = menu_skateshop pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = menu_confirm_quit }
  make_text_sprite texture = PA_quit parent = menu_skateshop
  set_menu_bg
  RunScriptOnScreenElement id = pause_menu menu_onscreen
endscript
script exit_pause_menu menu_id = current_menu_anchor
  Debounce x time = 0.3
  if InNetGame
    if LocalSkaterExists
      skater:NetEnablePlayerInput
    endif
  endif
  if not RunningReplay
    UnPauseGame
  endif
  PauseStream 0
  if GoalManager_HasActiveGoals
    PauseMusic 0
  else
    if IsTrue ALWAYSPLAYMUSIC
      PauseMusic 0
    endif
  endif
  if not InNetGame
    unpause_trick_text
  endif
  Unpause_Balance_Meter
  possibly_add_temp_special_trick
  if ObjectExists id = speech_box_anchor
    RunScriptOnScreenElement id = speech_box_anchor unhide_screen_element
  endif
  if ObjectExists id = goal_start_dialog
    RunScriptOnScreenElement id = goal_start_dialog unhide_screen_element
  endif
  if ObjectExists id = ped_speech_dialog
    RunScriptOnScreenElement id = ped_speech_dialog unhide_screen_element
  endif
  show_goal_panel_messages
  if not RunningReplay
    GoalManager_UnPauseAllGoals
  endif
  SetViewMode 0
  if ObjectExists id = <menu_id>
    DestroyScreenElement id = <menu_id>
  endif
  remove_pause_menu_textures_from_vram no_assert
  remove_level_select_menu_textures_from_vram no_assert
  remove_select_skater_textures_from_vram no_assert
  remove_edit_skater_textures_from_vram no_assert
  kill_pause_menu_cams
  SetScreenElementProps id = root_window tags = { menu_state = off }
  if not InMultiplayerGame
    GoalManager_ShowPoints
    if not GoalManager_HasActiveGoals
      GoalManager_ShowGoalPoints
    else
      GoalManager_HideGoalPoints
    endif
  endif
  if CustomParkMode editing
    remove_pause_menu_textures_from_vram
    SetParkEditorState state = edit
    SetParkEditorPauseMode unpause
  endif
  if LevelIs load_skateshop
    SetScreenElementProps {
      id = root_window
      tags = { menu_state = off }
      event_handlers = [ { pad_start skateshop_practice_start_pressed } ]
      replace_handlers
    }
  else
    restore_start_key_binding
  endif
  if ObjectExists id = console_message_vmenu
    DoScreenElementMorph id = console_message_vmenu time = 0 scale = 1
  endif
  if ( HIDEHUD = 1 )
    Printf "hiding"
    hide_root_window
  endif
endscript
script kill_pause_menu_cams
  kill_proset_cams
endscript
script set_custom_restart
  skater:SetCustomRestart Set
endscript
script skip_to_custom_restart
  skater:SkipToCustomRestart
endscript
script launch_restart_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_restart_menu
endscript
script create_restart_menu
  make_new_menu menu_id = restart_menu vmenu_id = restart_vmenu menu_title = "RESTART" padding_scale = 0.8 internal_scale = 0.8 type = VScrollingMenu dims = (320, 280)
  SetScreenElementProps { id = restart_menu
    event_handlers = [ { pad_back generic_menu_pad_back params = { callback = create_pause_menu } } ]
    pos = (315, 180)
  }
  AddRestartsToMenu initial_scale = 0.8
  set_sub_bg pos = (320, 108)
  create_icon texture = PA_restart pos = (169, 108)
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script skip_to_selected_restart
  ResetSkaters <...>
  exit_pause_menu
endscript
script preview_restart
  pulse_blur start = 200 speed = 5
  ResetSkaters <...>
  SetProps rgba = [ 128 128 0 128 ]
  DoMorph time = 0.25 scale = 1.0
endscript
script scale_down_restart
  SetProps rgba = [ 88 105 112 128 ]
  DoMorph time = 0.25 scale = 0.8
endscript
script launch_gap_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  create_gap_menu
endscript
script create_gap_menu
  remove_pause_menu_textures_from_vram
  add_gap_menu_textures_to_vram
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = gap_menu
    dims = (640, 480)
    pos = (320, 240)
  }
  AssignAlias id = gap_menu alias = current_menu_anchor
  create_helper_text { helper_text_elements = [ { text = "\b7/\b4 = Select" }
      { text = "\m1 = Back" }
    ]
  }
  kill_start_key_binding
  set_sub_bg_goal goal_mid_scale = (19, 1.33) pos = (180, 23)
  create_icon texture = PA_gap pos = (37, 23)
   <root_pos> = (80, 25)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "GAP CHECKLIST"
    rgba = [ 128 128 128 85 ]
    pos = ( <root_pos> + (4, 0) )
    just = [ left top ]
    scale = 1.35
  }
  GetStackedScreenElementPos y id = <id> offset = (-19, -4)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = view_gaps_menu_top_bar
    texture = black
    rgba = [ 0 0 0 85 ]
    scale = (124, 7)
    pos = <pos>
    just = [ left top ]
    z_priority = 2
  }
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = dialog
    text = "Score"
    rgba = [ 127 102 0 100 ]
    scale = 0.9
    pos = ( <pos> + (7, 5) )
    just = [ left top ]
    z_priority = 3
  }
  GetStackedScreenElementPos x id = <id> offset = (15, 0)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = dialog
    text = "Name"
    rgba = [ 127 102 0 100 ]
    pos = <pos>
    just = [ left top ]
    scale = 0.9
    z_priority = 3
  }
  GetStackedScreenElementPos x id = <id> offset = (115, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = view_gaps_menu_up_arrow
    texture = up_arrow
    rgba = [ 128 128 128 85 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 3
  }
  GetStackedScreenElementPos x id = <id> offset = (168, 0)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = dialog
    text = "Times"
    rgba = [ 127 102 0 100 ]
    pos = <pos>
    just = [ left top ]
    scale = 0.9
    z_priority = 3
  }
  GetStackedScreenElementPos y id = view_gaps_menu_top_bar offset = (60, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    scale = (2, 78)
    pos = <pos>
    just = [ left top ]
    rgba = [ 0 0 0 80 ]
  }
  GetStackedScreenElementPos x id = <id> offset = (355, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    scale = (2, 78)
    pos = <pos>
    just = [ left top ]
    rgba = [ 0 0 0 80 ]
  }
  GetStackedScreenElementPos y id = view_gaps_menu_top_bar offset = (0, 287)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    rgba = [ 0 0 0 105 ]
    scale = (124, 6)
    pos = <pos>
    just = [ left top ]
    z_priority = 2
  }
  GetStackedScreenElementPos y id = view_gaps_menu_up_arrow offset = (0, 300)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = view_gaps_menu_down_arrow
    texture = down_arrow
    rgba = [ 128 128 128 85 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 3
  }
  GetStackedScreenElementPos y id = view_gaps_menu_top_bar offset = (20, 5)
  CreateScreenElement {
    type = VScrollingMenu
    parent = current_menu_anchor
    dims = (640, 278)
    pos = <pos>
    just = [ left top ]
    internal_just = [ center top ]
  }
  CreateScreenElement {
    type = VMenu
    parent = <id>
    id = gap_vmenu
    pos = (0, 0)
    just = [ left top ]
    internal_just = [ left top ]
    dont_allow_wrap
    event_handlers = [
      { pad_up set_which_arrow params = { arrow = view_gaps_menu_up_arrow } }
      { pad_down set_which_arrow params = { arrow = view_gaps_menu_down_arrow } }
      { pad_up generic_menu_up_or_down_sound params = { Up } }
      { pad_down generic_menu_up_or_down_sound params = { Down } }
      { pad_back generic_menu_pad_back_sound }
    ]
  }
  AssignAlias id = gap_vmenu alias = current_menu
  SetScreenElementProps {
    id = current_menu
    event_handlers = [ { pad_back gap_menu_exit_to_pause_menu } ]
  }
  AddGapsToMenu initial_scale = 0.8
  RunScriptOnScreenElement id = current_menu_anchor animate_in params = { menu_id = current_menu }
endscript
script gap_menu_add_item
  if GotParam first_item
    focus_params = { first_item }
  else
    if GotParam last_item
      focus_params = { last_item }
    endif
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    dims = (200, 20)
    event_handlers = [ { focus gap_menu_focus params = { <focus_params> times = <times> } }
      { unfocus gap_menu_unfocus params = { times = <times> } }
      { pad_choose nullscript }
    ]
  }
   <anchor_id> = <id>
  if ( <times> > 0 )
    rgba = [ 25 83 67 128 ]
  else
    rgba = [ 88 105 112 128 ]
  endif
  FormatText TextName = gap_score "%i" i = <gap_score>
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    text = <gap_score>
    pos = (13, 0)
    just = [ center top ]
    rgba = <rgba>
    scale = 0.8
  }
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = dialog
    text = <gap_name>
    pos = (55, 0)
    just = [ left top ]
    rgba = <rgba>
    scale = 0.8
  }
  if ( <times> > 0 )
    GetScreenElementDims id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = <id>
      texture = goal_line
      pos = (-8, 13)
      just = [ left center ]
      rgba = [ 128 128 128 128 ]
      z_priority = 10
      scale = ( ( (1, 0) * ( <width> * 1.25 ) / 32 ) + (0.3, 0.4) )
    }
  endif
  if ( <times> > 99999 )
     <times> = 99999
  endif
  FormatText TextName = times "%i" i = <times>
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    text = <times>
    pos = (444, 0)
    just = [ center top ]
    rgba = <rgba>
    scale = 0.8
  }
endscript
script skip_to_selected_gap
endscript
script preview_gap
  SetProps rgba = [ 127 102 0 100 ]
  DoMorph time = 0.1 scale = 0.85
  GetTags
endscript
script gap_menu_focus
  GetTags
  if ( <times> > 0 )
    rgba = [ 99 121 6 128 ]
  else
    rgba = [ 127 102 0 100 ]
  endif
  SetScreenElementProps {
    id = { <id> child = 0 }
    rgba = <rgba>
  }
  RunScriptOnScreenElement id = { <id> child = 1 } do_scale_up params = { rgba = <rgba> }
  SetScreenElementProps {
    id = { <id> child = 2 }
    rgba = <rgba>
  }
  if GotParam first_item
    SetScreenElementProps {
      id = view_gaps_menu_up_arrow
      rgba = [ 128 128 128 0 ]
    }
  else
    SetScreenElementProps {
      id = view_gaps_menu_up_arrow
      rgba = [ 128 128 128 85 ]
    }
  endif
  if GotParam last_item
    SetScreenElementProps {
      id = view_gaps_menu_down_arrow
      rgba = [ 128 128 128 0 ]
    }
  else
    SetScreenElementProps {
      id = view_gaps_menu_down_arrow
      rgba = [ 128 128 128 85 ]
    }
  endif
  gap_vmenu:GetTags
  if GotParam arrow_id
    menu_vert_blink_arrow { id = <arrow_id> }
  endif
endscript
script gap_menu_unfocus
  GetTags
  if ( <times> > 0 )
    rgba = [ 25 83 67 128 ]
  else
    rgba = [ 88 105 112 128 ]
  endif
  SetScreenElementProps {
    id = { <id> child = 0 }
    rgba = <rgba>
  }
  RunScriptOnScreenElement id = { <id> child = 1 } do_scale_down params = { rgba = <rgba> }
  SetScreenElementProps {
    id = { <id> child = 2 }
    rgba = <rgba>
  }
endscript
script gap_menu_exit_to_pause_menu
  GoalManager_ShowPoints
  if not GoalManager_HasActiveGoals
    GoalManager_ShowGoalPoints
  endif
  remove_gap_menu_textures_from_vram
  add_pause_menu_textures_to_vram
  restore_start_key_binding
  create_pause_menu
endscript
script add_gap_menu_textures_to_vram
  AddTextureToVram "up_arrow"
  AddTextureToVram "down_arrow"
  AddTextureToVram "goal_left"
  AddTextureToVram "goal_mid"
  AddTextureToVram "goal_right"
  AddTextureToVram "pa_gap"
  AddTextureToVram "pa_sound"
  AddTextureToVram "goal_line"
endscript
script remove_gap_menu_textures_from_vram
  RemoveTextureFromVram "up_arrow"
  RemoveTextureFromVram "down_arrow"
  RemoveTextureFromVram "goal_left"
  RemoveTextureFromVram "goal_mid"
  RemoveTextureFromVram "goal_right"
  RemoveTextureFromVram "pa_gap"
  RemoveTextureFromVram "pa_sound"
  RemoveTextureFromVram "goal_line"
endscript
script got_all_gaps_screen_create
  if GetGlobalFlag flag = GOT_ALL_GAPS
    return
  endif
  SetGlobalFlag flag = GOT_ALL_GAPS
  GoalManager_AddCash 1500
  create_panel_message id = goal_current_reward text = "You got $1500" style = goal_message_got_bigbucks params = { sound = cash }
  if not InNetGame
    PauseGame
  endif
  StopStream
  PlayStream FoundAllGaps vol = 150
  create_dialog_box { title = "All Gaps!"
    text = "Incredible! You got every single gap in the game! We didn't even know it was possible...You should come test THPS5 at Neversoft!"
    pos = (310, 183)
    just = [ center center ]
    text_rgba = [ 88 105 112 128 ]
    pad_back_script = <back_script>
    buttons = [ { font = small text = "OK" pad_choose_script = got_all_gaps_screen_exit } ]
    delay_input
  }
endscript
script got_all_gaps_screen_exit
  dialog_box_exit
  if LevelIs load_skateshop
    SetScreenElementProps {
      id = root_window
      event_handlers = [ { pad_start skateshop_practice_start_pressed } ]
      replace_handlers
    }
  endif
  UnPauseGame
endscript
script launch_pause_menu cur_menu = current_menu_anchor
  Printf "why was this called?"
endscript
script menu_confirm_quit_out_yes
  DebugFn766
   <yes_script> params = <...>
endscript
script menu_confirm_quit_out_no
  DebugFn 766
   <no_script> params = <...>
endscript
script menu_confirm_quit {
    yes_script = level_select_change_level_quit
    no_script = menu_quit_no
    back_script = menu_quit_no
    title = "QUIT?"
    text = "Are you sure?"
    params = { }
  }
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_pause_menu_textures_from_vram
  if not IsTrue bootstrap_build
    create_error_box { title = <title>
      text = <text>
      pos = (310, 183)
      just = [ center center ]
      text_rgba = [ 88 105 112 128 ]
      pad_back_script = <back_script>
      pad_back_params = <params>
      buttons = [ { font = small text = "Yes" pad_choose_script = <yes_script> pad_choose_params = { level = load_skateshop <params> } }
        { font = small text = "No" pad_choose_script = <no_script> pad_choose_params = <params> }
      ]
    }
  else
    create_error_box { title = <title>
      text = "Exit Demo?"
      pos = (310, 183)
      just = [ center center ]
      text_rgba = [ 88 105 112 128 ]
      pad_back_script = <back_script>
      buttons = [ { font = small text = "Yes" pad_choose_script = bootstrap_quit }
        { font = small text = "No" pad_choose_script = <back_script> }
      ]
    }
  endif
endscript
script menu_confirm_quit_park_editor {
    yes_script = launch_park_editor_save_park_sequence
    no_script = parked_quit
    back_script = menu_quit_no
    title = "Save Park?"
  }
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_pause_menu_textures_from_vram
  if IsParkUnsaved
    if IsXBOX
      error_text = "Network Play may cause you to lose unsaved changes to this park. Save it now?"
    else
      if IsNGC
        error_text = "Do you want to save your park before quitting?"
      else
        error_text = "Playing online or downloading a new park will cause you to lose unsaved changes to this park. Save it now?"
      endif
    endif
    create_error_box { title = <title>
      text = <error_text>
      pos = (310, 183)
      just = [ center center ]
      text_rgba = [ 88 105 112 128 ]
      pad_back_script = <back_script>
      buttons = [ { font = small text = "Yes" pad_choose_script = <yes_script> pad_choose_params = { level = load_skateshop } }
        { font = small text = "No" pad_choose_script = <no_script> pad_choose_params = { level = load_skateshop } }
      ]
    }
  else
     <no_script> level = load_skateshop
  endif
endscript
script menu_confirm_goto_secret_shop {
    yes_script = exit_to_secrets
    no_script = menu_cash_no
    back_script = menu_cash_no
    title = "QUIT?"
    error_text = "Are you sure you want to quit to go spend cash?"
  }
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  if GotParam change_skater
    error_text = "Are you sure you want to quit to change skaters?"
    yes_script = exit_to_skaters
  endif
  remove_pause_menu_textures_from_vram
  create_error_box { title = <title>
    text = <error_text>
    pos = (310, 183)
    just = [ center center ]
    text_rgba = [ 88 105 112 128 ]
    pad_back_script = <back_script>
    buttons = [ { font = small text = "Yes" pad_choose_script = <yes_script> }
      { font = small text = "No" pad_choose_script = <no_script> }
    ]
  }
  create_helper_text generic_helper_text_left_right parent = dialog_box_anchor
endscript
script exit_to_secrets
  Change goto_secret_shop = 1
  level_select_change_level_quit level = load_skateshop
endscript
script exit_to_skaters
  Change goto_secret_shop = 2
  level_select_change_level_quit level = load_skateshop
endscript
script level_select_change_level_quit
  MakeSkaterGoto SkaterInit
  SetButtonEventMappings block_menu_input
  GoalManager_DeactivateAllGoals
  GoalManager_LevelUnload
  Printf "leaving and destroying server"
  SetParkEditorState state = off
  UnPauseGame
  chosen_leave_server
  DisplayLoadingScreen "loadscrn_generic"
  SetGameType career
  SetCurrentGameType
  SetStatOverride
  SetServerMode on
  StartServer
  SetJoinMode JOIN_MODE_PLAY
  Printf "attempting to join server"
  JoinServer
  Printf "waiting"
  begin
    Printf "waiting 1 frame"
    if JoinServerComplete
      break
    else
      Wait 1
    endif
    Printf "still waiting"
  repeat
  Printf "attempting to change level"
  level_select_change_level <...>
  SetButtonEventMappings unblock_menu_input
endscript
script menu_quit_no
  generic_menu_pad_back_sound
  dialog_box_exit
  create_pause_menu
endscript
script menu_cash_no
  dialog_box_exit
  create_options_menu
endscript
script bootstrap_quit
  dialog_box_exit
  SetButtonEventMappings block_menu_input
  skater:DisablePlayerInput
  PauseGame
  Cleanup
  DisplayLoadingScreen "loadscrn_marketing"
  Wait 5 seconds
  ExitDemo
endscript
script launch_view_models_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_view_models_menu
endscript
script make_select_view_model_line
  make_text_sub_menu_item text = <text> pad_choose_script = view_model pad_choose_params = { <...> }
endscript
script create_view_models_menu
  make_new_menu menu_id = view_models_menu vmenu_id = view_models_vmenu menu_title = "MODELS" type = VScrollingMenu dims = (320, 200)
  SetScreenElementProps { id = view_models_menu event_handlers = [
      { pad_back create_pause_menu }
    ]
  }
  add_view_models_to_menu
  set_sub_bg
  create_icon texture = PA_Model
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script view_model
  Printf "View Model here"
  SetViewerModel <...>
  restore_start_key_binding
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen
endscript
script launch_set_pro_skater_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_set_pro_skater_menu
endscript
script make_select_set_pro_skater_line
  make_text_sub_menu_item text = <text> pad_choose_script = set_pro_skater pad_choose_params = <...>
endscript
script create_set_pro_skater_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu menu_id = set_pro_skater_menu vmenu_id = set_pro_skater_vmenu menu_title = "PRO SKATERS"
  if LevelIs load_skateshop
    KillSkaterCamAnim all
    PlaySkaterCamAnim name = SS_SkaterChoosing play_hold
    SetScreenElementProps {
      id = set_pro_skater_menu
      event_handlers = [ { pad_back launch_main_menu } ]
      replace_handlers
    }
    make_text_sub_menu_item { text = "Continue"
      pad_choose_script = skateshop_transition
      pad_choose_params = { new_menu_script = launch_ss_menu }
    }
  else
    SetScreenElementProps {
      id = set_pro_skater_menu
      event_handlers = [ { pad_back create_debug_menu } ]
      replace_handlers
    }
  endif
  add_set_pro_skater_to_menu
  set_sub_bg
  create_icon texture = PA_Model
  RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = (320, 134) }
endscript
script set_pro_skater
  Printf "Set pro skater here"
  load_pro_skater { profile = 0 skater = 0 <...> }
  if LevelIs load_skateshop
    Printf "we're in the skateshop"
    launch_ss_menu
  else
    exit_pause_menu
  endif
endscript
script launch_change_skater_appearance_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_change_skater_appearance_menu
endscript
script make_select_change_skater_appearance_line
  make_text_sub_menu_item text = <text> pad_choose_script = change_skater_appearance pad_choose_params = { <...> }
endscript
script create_change_skater_appearance_menu
  make_new_menu menu_id = change_skater_appearance_menu vmenu_id = change_skater_appearance_vmenu menu_title = "APPEARANCE"
  SetScreenElementProps { id = change_skater_appearance_menu event_handlers = [
      { pad_back create_pause_menu }
    ]
  }
  add_change_skater_appearance_to_menu
  set_sub_bg
  create_icon texture = PA_Model
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script change_skater_appearance
  Printf "Change skater appearance here"
  InitSkaterModel skater = 0 <...>
  exit_pause_menu
endscript
script create_debug_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu {
    menu_id = debug_menu
    vmenu_id = debug_vmenu
    menu_title = "DEBUG"
    type = VScrollingMenu
    dims = (200, 200)
    padding_scale = 0.95
    pos = (243, 113)
  }
  SetScreenElementProps { id = debug_menu
    event_handlers = [
      { pad_back create_pause_menu }
    ]
  }
  make_text_sub_menu_item text = "View Models" id = menu_view_models pad_choose_script = launch_view_models_menu
  make_text_sub_menu_item text = "Create-a-Skater" id = menu_create_a_skater pad_choose_script = launch_cas_menu
  make_text_sub_menu_item text = "Set Pro Skater" id = menu_set_pro_skater pad_choose_script = create_set_pro_skater_menu
  make_text_sub_menu_item text = "Menu Test" id = menu_test pad_choose_script = launch_menu_test
  make_text_sub_menu_item text = "Toggle Profiler" id = menu_profiler pad_choose_script = launch_toggle_profiler
  make_text_sub_menu_item text = "Start AutoTest" id = menu_start_autotest pad_choose_script = menu_start_autotest
  make_text_sub_menu_item text = "Stop AutoTest" id = menu_stop_autotest pad_choose_script = menu_stop_autotest
  make_text_sub_menu_item text = "Dump MemCard ScreenShots" id = menu_dumpshots pad_choose_script = launch_dumpshots
  make_text_sub_menu_item text = "Wireframe Toggle" pad_choose_script = toggle_wireframe
  make_text_sub_menu_item text = "Show Vert Polys" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_vert }
  make_text_sub_menu_item text = "Show Wallride Polys" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_wallride }
  make_text_sub_menu_item text = "Show Trigger Polys" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_trigger }
  make_text_sub_menu_item text = "Show Camera Polys" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_camera }
  make_text_sub_menu_item text = "Show Not Skateable" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_not_skatable }
  make_text_sub_menu_item text = "Show skater shadow" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_skater_shadow }
  make_text_sub_menu_item text = "Show no skater shadow" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_no_skater_shadow }
  make_text_sub_menu_item text = "Show no skater shadow wall" pad_choose_script = toggle_show_polys pad_choose_params = { showscript = show_no_skater_shadow_wall }
  make_text_sub_menu_item text = "CheckForHoles (Slow)" pad_choose_script = hole_check
  make_text_sub_menu_item text = "Rail Display Toggle" pad_choose_script = toggle_rails
  make_text_sub_menu_item text = "Keyboard" pad_choose_script = launch_keyboard
  if CareerLevelIs LevelNum_Sch
    make_text_sub_menu_item text = "Screensaver" pad_choose_script = screensaver
  endif
  make_text_sub_menu_item text = "Statistics test" pad_choose_script = create_statistics_menu
  make_text_sub_menu_item text = "Secrets test" pad_choose_script = create_secrets_menu
  make_text_sub_menu_item text = "Done" id = menu_done pad_choose_script = create_pause_menu
  set_sub_bg
  create_icon texture = PA_Model
  RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = (320, 134) }
endscript
script screensaver
  SpawnScript create_startup_menu
  exit_pause_menu
endscript
script hole_check
  CheckForHoles
  create_pause_menu
endscript
script launch_toggle_profiler
  ToggleMetrics
  create_pause_menu
endscript
script launch_dumpshots
  DumpShots
  create_pause_menu
endscript
script toggle_rails
  ToggleRails
  pulse_item
endscript
script toggle_wireframe
  ToggleRenderMode
  show_all
  pulse_item
endscript
script toggle_show_all
  show_all
endscript
script toggle_show_polys showscript = show_vert
   <showscript>
  pulse_item
endscript
script launch_keyboard
  DestroyScreenElement id = current_menu_anchor
  create_onscreen_keyboard
endscript
script launch_level_select_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_pause_menu_textures_from_vram
  add_level_select_menu_textures_to_vram
  SetMenuPadMappings [ active
    use_as_first
  ]
  create_level_select_menu <...>
endscript
script create_level_select_menu pad_back_script = level_select_menu_exit
  SetScreenElementLock id = root_window off
  pulse_blur
  if GotParam from_server_options
    change_gamemode_net
    net_pad_back = 0
    pad_back_script = network_level_select_pad_back
  endif
  if not GotParam no_cam_anim
    level_select_play_cam
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = level_select_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  if InSplitScreenGame
    ScriptGetScreenMode
    if ( <screen_mode> = split_horizontal )
       <root_pos> = (50, 30)
    else
       <root_pos> = (50, 30)
    endif
  else
     <root_pos> = (50, 30)
  endif
  AssignAlias id = level_select_anchor alias = current_menu_anchor
  create_helper_text generic_helper_text
  kill_start_key_binding
  GoalManager_HidePoints
  if ObjectExists id = current_goal
    DoScreenElementMorph {
      id = current_goal
      alpha = 0
      remember_alpha
    }
  endif
  if GameModeEquals is_career
    GoalManager_ShowGoalPoints
  endif
  level_select_create_top_bar {
    text = "LEVEL SELECT"
    root_pos = <root_pos>
    scale = (1, 1)
  }
  level_select_create_menu_block pad_back_script = <pad_back_script> <...>
  if IsTrue DEMO_BUILD
    ForEachIn e3_level_select_menu_level_info do = level_select_menu_add_item params = <...>
  else
    RemoveParameter text
    RemoveParameter name
    if AllLevelsUnlockedBeenox
      ForEachIn level_select_menu_level_info_unlock do = level_select_menu_add_item params = <...>
    else
      ForEachIn level_select_menu_level_info do = level_select_menu_add_item params = <...>
    endif
  endif
  level_select_create_info_box
  RunScriptOnScreenElement id = level_select_anchor_top select_skater_menu_animate_top
  RunScriptOnScreenElement id = level_select_anchor_middle select_skater_menu_animate_stats
  FireEvent type = focus target = level_select_vmenu
  SetButtonEventMappings block_menu_input
  WaitForEvent type = select_skater_menu_animate_stats_done
  SetButtonEventMappings unblock_menu_input
endscript
script level_select_create_top_bar scale = (1.14, 1) text = "" parent = level_select_anchor
   <pos> = <root_pos>
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = level_select_anchor_top
    pos = (320, 240)
    dims = (640, 480)
  }
  CreateScreenElement {
    type = TextElement
    parent = level_select_anchor_top
    id = select_skater_name
    text = <text>
    font = testtitle
    pos = ( <pos> + (18, 20) )
    scale = 1.3
    just = [ left center ]
    rgba = [ 88 105 112 118 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = level_select_anchor_top
    id = select_skater_mainbar
    texture = mainbar
    pos = <pos>
    scale = <scale>
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = select_skater_mainbar
  CreateScreenElement {
    type = SpriteElement
    parent = level_select_anchor_top
    texture = mainbar_join
    pos = <pos>
    just = [ left top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = level_select_anchor_top
    texture = longbar_edgy
    pos = <pos>
    scale = (3, 1)
    just = [ left top ]
  }
endscript
script level_select_create_menu_block
  if ObjectExists id = level_select_anchor_middle
    DestroyScreenElement id = level_select_anchor_middle
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = level_select_anchor
    id = level_select_anchor_middle
    dims = (640, 480)
    pos = (320, 240)
  }
  GetStackedScreenElementPos y id = select_skater_mainbar
  CreateScreenElement {
    type = SpriteElement
    parent = level_select_anchor_middle
    id = level_select_menu_top_sprite
    texture = level_top_piece
    scale = (1.04, 1)
    rgba = [ 128 128 128 90 ]
    pos = <pos>
    just = [ left top ]
  }
  GetStackedScreenElementPos y id = level_select_menu_top_sprite offset = (28, 5)
  CreateScreenElement {
    type = VMenu
    parent = level_select_anchor_middle
    id = level_select_vmenu
    pos = <pos>
    just = [ left top ]
    internal_just = [ left center ]
    event_handlers = [ { pad_back <pad_back_script> params = { <...> } }
      { pad_up generic_menu_up_or_down_sound params = { Up } }
      { pad_down generic_menu_up_or_down_sound params = { Down } }
      { pad_back generic_menu_pad_back_sound }
    ]
    padding_scale = 0.9
    replace_handlers
  }
  AssignAlias id = level_select_vmenu alias = current_menu
  if GameModeEquals is_career
    goals_title_rgba = [ 88 105 112 128 ]
  else
    goals_title_rgba = [ 0 0 0 0 ]
  endif
  GetStackedScreenElementPos y id = level_select_menu_top_sprite offset = (196, -13)
  CreateScreenElement {
    type = TextElement
    parent = level_select_anchor_middle
    font = small
    text = "Goals"
    pos = <pos>
    just = [ left top ]
    rgba = <goals_title_rgba>
    scale = 0.8
    z_priority = 5
  }
   <id> = level_select_menu_top_sprite
  begin
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = level_select_anchor_middle
      texture = level_repeat_mid
      pos = <pos>
      just = [ left top ]
      scale = (1.04, 1)
      rgba = [ 128 128 128 90 ]
    }
  repeat 13
  bottom_cap_rgba = [ 128 128 128 90 ]
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if GotParam is_secret
    bottom_cap_rgba = [ 128 128 128 0 ]
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = level_select_anchor_middle
      texture = level_repeat_mid
      pos = <pos>
      just = [ left top ]
      scale = (1.04, 1)
      rgba = [ 128 128 128 90 ]
    }
    GetStackedScreenElementPos y id = <id>
     <lower_piece_pos> = <pos>
    CreateScreenElement {
      type = SpriteElement
      parent = level_select_anchor_middle
      id = level_select_menu_other_bottom_piece
      texture = level_bottom_piece
      pos = <pos>
      scale = (1, 1)
      rgba = [ 128 128 128 90 ]
      just = [ left top ]
    }
  else
    if not GameModeEquals is_career
      bottom_cap_rgba = [ 128 128 128 0 ]
      GetStackedScreenElementPos y id = <id>
      CreateScreenElement {
        type = SpriteElement
        parent = level_select_anchor_middle
        texture = level_repeat_mid
        pos = <pos>
        just = [ left top ]
        scale = (1.04, 1)
        rgba = [ 128 128 128 90 ]
      }
      GetStackedScreenElementPos y id = <id>
       <lower_piece_pos> = <pos>
      CreateScreenElement {
        type = SpriteElement
        parent = level_select_anchor_middle
        id = level_select_menu_other_bottom_piece
        texture = level_bottom_piece
        pos = <pos>
        scale = (1, 1)
        rgba = [ 128 128 128 90 ]
        just = [ left top ]
      }
    endif
  endif
  GetStackedScreenElementPos y id = <id>
   <lower_piece_pos> = <pos>
  CreateScreenElement {
    type = SpriteElement
    parent = level_select_anchor_middle
    id = level_select_menu_lower_piece
    texture = level_lower_piece
    pos = <pos>
    scale = (1.035, 1)
    rgba = <bottom_cap_rgba>
    just = [ left top ]
  }
  GetStackedScreenElementPos y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = level_select_anchor_middle
    texture = level_bottom_piece
    pos = <pos>
    scale = (1.04, 1)
    rgba = <bottom_cap_rgba>
    just = [ left top ]
  }
  GetStackedScreenElementPos XY id = level_select_menu_lower_piece offset = (0, -14)
  CreateScreenElement {
    type = SpriteElement
    parent = level_select_anchor_middle
    id = level_select_menu_bottom_cap
    texture = level_bottom_cap
    pos = <pos>
    rgba = <bottom_cap_rgba>
    just = [ left center ]
  }
  if GameModeEquals is_career
    CreateScreenElement {
      type = TextBlockElement
      parent = level_select_anchor_middle
      id = pro_specific_challenge_text
      font = dialog
      text = ""
      pos = ( <lower_piece_pos> + (40, 33) )
      just = [ left center ]
      scale = 0.75
      rgba = <pro_specific_challenge_text_rgba>
      z_priority = 3
      internal_just = [ left top ]
      dims = (340, 0)
      allow_expansion
    }
    GetStackedScreenElementPos x id = <id> offset = (-285, 5)
    CreateScreenElement {
      type = SpriteElement
      parent = level_select_anchor_middle
      id = pro_specific_challenge_icon
      texture = GO_done
      pos = <pos>
      rgba = [ 127 102 0 0 ]
      just = [ left top ]
      scale = 0.6
      z_priority = 5
    }
  endif
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  GoalManager_GetNumberOfGoalPoints total
   <points_to_go> = ( points_to_pro_challenge - <goal_points> )
  if GameModeEquals is_career
    if GotParam is_secret
      return
    endif
    if ObjectExists id = pro_specific_challenge_text
      if GoalManager_ProSpecificChallengesUnlocked
        if GotParam is_secret
          return
        endif
        if GoalManager_SkaterHasBeatenProSpecificChallenge skater = <name>
           <pro_challenge_texture> = GO_done
           <pro_challenge_texture_rgba> = [ 127 102 0 100 ]
           <pro_specific_challenge_text_rgba> = [ 25 83 67 128 ]
          if ( <is_pro> = 0 )
            FormatText {
              TextName = level_text
              "%d's Pro Challenge"
              d = <display_name>
            }
          else
            FormatText {
              TextName = level_text
              "%p's Pro Challenge"
              p = <first_name>
            }
          endif
        else
           <pro_challenge_texture> = GO_fail
           <pro_challenge_texture_rgba> = [ 115 26 26 128 ]
           <pro_specific_challenge_text_rgba> = [ 88 105 112 128 ]
          if ( <is_pro> = 0 )
            FormatText {
              TextName = level_text
              "%d's Pro Challenge:\n%s"
              d = <display_name>
              s = ( ( level_select_pro_challenge_info.<name> ).text )
            }
          else
            FormatText {
              TextName = level_text
              "%p's Pro Challenge:\n%s"
              p = <first_name>
              s = ( ( level_select_pro_challenge_info.<name> ).text )
            }
          endif
        endif
        SetScreenElementProps {
          id = pro_specific_challenge_text
          text = <level_text>
        }
        SetScreenElementProps {
          id = pro_specific_challenge_text
          rgba = <pro_specific_challenge_text_rgba>
        }
        SetScreenElementProps {
          id = pro_specific_challenge_icon
          texture = <pro_challenge_texture>
          rgba = <pro_challenge_texture_rgba>
        }
        DoScreenElementMorph {
          id = pro_specific_challenge_icon
          alpha = 1
        }
        if GoalManager_SkaterHasBeatenProSpecificChallenge skater = <name>
          GetStackedScreenElementPos x id = pro_specific_challenge_icon offset = (5, 3)
          GetScreenElementDims id = pro_specific_challenge_text
          CreateScreenElement {
            type = SpriteElement
            parent = level_select_anchor_middle
            id = pro_specific_challenge_strikeout
            texture = goal_line
            rgba = [ 18 87 18 128 ]
            pos = <pos>
            scale = ( ( (1, 0) * ( <width> * 0.7 ) / 32 ) + (0, 0.3) )
            just = [ left top ]
            z_priority = 5
          }
        endif
      else
        if IsTrue bootstrap_build
          SetScreenElementProps {
            id = pro_specific_challenge_text
            text = "NOT IN DEMO"
          }
        else
          if ( <points_to_go> = 1 )
            if ( <is_pro> = 0 )
              FormatText {
                TextName = locked_text
                "%d's Pro Challenge:\n%i more Pro Point to unlock"
                d = <display_name>
                i = <points_to_go>
              }
            else
              FormatText {
                TextName = locked_text
                "%p's Pro Challenge:\n%i more Pro Point to unlock"
                p = <first_name>
                i = <points_to_go>
              }
            endif
          else
            if ( <is_pro> = 0 )
              FormatText {
                TextName = locked_text
                "%d's Pro Challenge:\n%i more Pro Points to unlock"
                d = <display_name>
                i = <points_to_go>
              }
            else
              FormatText {
                TextName = locked_text
                "%p's Pro Challenge:\n%i more Pro Points to unlock"
                p = <first_name>
                i = <points_to_go>
              }
            endif
          endif
          SetScreenElementProps {
            id = pro_specific_challenge_text
            text = <locked_text>
          }
        endif
        DoScreenElementMorph {
          id = pro_specific_challenge_icon
          alpha = 0
        }
      endif
    endif
  endif
  if ScreenElementExists id = pro_specific_challenge_text
    if ( <is_pro> = 0 )
      test_text = <display_name>
    else
      test_text = <first_name>
    endif
    CreateScreenElement {
      type = TextElement
      parent = current_menu_anchor
      id = width_test_text
      text = <test_text>
      font = dialog
      scale = 0.75
      alpha = 0
    }
    GetScreenElementDims id = width_test_text
    if ( ( <width> > 118 ) or ( French ) or ( German ) )
      if GoalManager_ProSpecificChallengesUnlocked
        if GoalManager_SkaterHasBeatenProSpecificChallenge skater = <name>
          FormatText {
            TextName = locked_text
            "Pro Challenge"
          }
        else
          FormatText {
            TextName = locked_text
            "Pro Challenge:\n%s"
            s = ( ( level_select_pro_challenge_info.<name> ).text )
          }
        endif
      else
        if ( <points_to_go> = 1 )
          FormatText {
            TextName = locked_text
            "Pro Challenge:\n%i more Pro Point to unlock"
            i = <points_to_go>
          }
        else
          FormatText {
            TextName = locked_text
            "Pro Challenge:\n%i more Pro Points to unlock"
            i = <points_to_go>
          }
        endif
      endif
      SetScreenElementProps {
        id = pro_specific_challenge_text
        text = <locked_text>
      }
    endif
  endif
endscript
script level_select_create_info_box
  if GameModeEquals is_career
    pos = (320, 240)
  else
    pos = (320, 208)
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = level_select_anchor
    id = level_select_anchor_info
    pos = <pos>
    dims = (640, 480)
  }
  GetStackedScreenElementPos x id = level_select_menu_bottom_cap offset = (10, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = level_select_anchor_info
    id = level_select_info_box_left
    texture = bottom_l_cap
    pos = <pos>
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = level_select_anchor_info
    id = level_select_info_box_middle
    texture = bottom_mid
    pos = <pos>
    just = [ left top ]
    scale = (14, 1)
  }
  GetStackedScreenElementPos x id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = level_select_anchor_info
    texture = bottom_r_cap
    pos = <pos>
    scale = (1.4, 1)
    just = [ left top ]
    z_priority = 10
  }
  GetStackedScreenElementPos x id = level_select_info_box_left offset = (0, 10)
  GetScreenElementDims id = level_select_info_box_middle
  CreateScreenElement {
    type = TextBlockElement
    parent = level_select_anchor_info
    id = level_select_points_info
    font = dialog
    text = ""
    dims = ( (1, 0) * <width> * 1.176 )
    allow_expansion
    pos = <pos>
    just = [ left top ]
    scale = 0.8
    internal_just = [ center top ]
    rgba = [ 88 105 112 128 ]
    z_priority = 4
  }
endscript
script level_select_menu_add_item
  if ( ( GameModeEquals is_career ) and ( <level_num> = 10 ) )
    return
  endif
   <can_afford_level> = 0
   <in_locked_group> = 0
  if IntegerEquals a = All_Levels_Unlocked b = 1
     <rgba> = [ 88 105 112 128 ]
    if ( <level_num> = 10 )
       <pad_choose_script> = level_select_created_park_menu
    else
      if GotParam from_server_options
         <pad_choose_script> = level_select_menu_exit
      else
         <pad_choose_script> = level_select_change_level
      endif
    endif
     <pad_choose_params> = <...>
     <locked> = 0
  else
    if GetGlobalFlag flag = <flag>
       <rgba> = [ 88 105 112 128 ]
      if ( <level_num> = 10 )
         <pad_choose_script> = level_select_created_park_menu
      else
        if GotParam from_server_options
           <pad_choose_script> = level_select_menu_exit
        else
           <pad_choose_script> = level_select_change_level
        endif
      endif
       <pad_choose_params> = <...>
       <locked> = 0
    else
      if GotParam PreReq_flags
        GetArraySize <PreReq_flags>
         <index> = 0
        begin
          if not GetGlobalFlag flag = ( <PreReq_flags> [ <index> ] )
             <in_locked_group> = 1
            break
          endif
           <index> = ( <index> + 1 )
        repeat <array_size>
      endif
      if ( <points_to_unlock> = -1 )
         <rgba> = [ 47 42 38 128 ]
         <pad_choose_script> = level_select_invalid_choice
         <locked> = 1
      else
        if not GameModeEquals is_career
           <rgba> = [ 47 42 38 128 ]
           <pad_choose_script> = level_select_invalid_choice
           <locked> = 1
        else
          if not IsDemo
            if GoalManager_HasGoalPoints <points_to_unlock>
              if ( <in_locked_group> = 1 )
                 <rgba> = [ 47 42 38 128 ]
                 <pad_choose_script> = level_select_invalid_choice
              else
                 <rgba> = [ 26 85 37 128 ]
                 <pad_choose_script> = level_select_spend_points_dialog
              endif
               <pad_choose_params> = <...>
               <locked> = 1
               <can_afford_level> = 1
            else
               <rgba> = [ 47 42 38 128 ]
               <pad_choose_script> = level_select_invalid_choice
               <pad_choose_params> = <...>
               <locked> = 1
            endif
          else
             <rgba> = [ 47 42 38 128 ]
             <pad_choose_script> = level_select_invalid_choice
             <pad_choose_params> = <...>
             <locked> = 1
          endif
        endif
      endif
    endif
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    id = <level>
    dims = (256, 25)
    event_handlers = [ { pad_choose generic_menu_pad_choose_sound }
      { pad_start generic_menu_pad_choose_sound }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_start <pad_choose_script> params = <pad_choose_params> }
      { focus level_select_menu_focus params = <...> }
      { unfocus level_select_menu_unfocus params = { rgba = <rgba> } }
    ]
    replace_handlers
  }
  CreateScreenElement {
    type = TextElement
    parent = <id>
    font = dialog
    just = [ left top ]
    text = <text>
    rgba = <rgba>
    scale = 0.9
  }
  GoalManager_NumGoalsBeatenInLevel <level_num>
  if ( ( ( <can_afford_level> = 0 ) and ( <locked> = 1 ) ) or ( <in_locked_group> = 1 ) )
    FormatText TextName = goals_beaten "N/A"
  else
    if ( <num_goals> = 0 )
      goals_beaten = ""
    else
      if GoalManager_IsPro
        FormatText TextName = goals_beaten "%b/%t" b = <num_beaten> t = <num_goals>
      else
        FormatText TextName = goals_beaten "%b/%t" b = <num_beaten> t = <num_am_goals>
      endif
    endif
  endif
  if not GameModeEquals is_career
     <rgba> = [ 0 0 0 0 ]
  endif
  CreateScreenElement {
    type = TextElement
    parent = <level>
    font = small
    pos = (173, 3)
    rgba = <rgba>
    just = [ left top ]
    text = <goals_beaten>
    scale = 0.8
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <level>
    texture = highlight_bar
    pos = (-20, 2)
    just = [ left top ]
    scale = (0.95, 1.2)
    rgba = [ 128 128 128 0 ]
  }
endscript
script network_level_select_pad_back
   <net_pad_back> = 1
  level_select_menu_exit <...>
endscript
script level_select_menu_exit
  kill_level_select_cams
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_level_select_menu_textures_from_vram
  if LevelIs load_skateshop
    GoalManager_HideGoalPoints
    if GotParam from_server_options
      if ( <net_pad_back> = 0 )
        prefs = network
        field = "level"
        string = <text>
        checksum = <level>
        select_host_option <...>
      endif
      if ObjectExists id = host_options_menu
        DestroyScreenElement id = host_options_menu
      endif
      KillSkaterCamAnim all
      PlaySkaterCamAnim name = SS_MenuCam play_hold
      create_network_host_options_menu
    else
      add_pause_menu_textures_to_vram
      launch_ss_menu <...>
    endif
  else
    add_pause_menu_textures_to_vram
    if GotParam end_run
      create_end_run_menu
    else
      GoalManager_ShowPoints
      if GoalManager_HasActiveGoals
        GoalManager_HideGoalPoints
        if ObjectExists id = current_goal
          DoScreenElementMorph {
            id = current_goal
            restore_alpha
          }
        endif
      else
        GoalManager_ShowGoalPoints
      endif
      create_pause_menu
    endif
  endif
endscript
script level_select_menu_focus
  GetTags
  SetScreenElementProps {
    id = { <id> child = 0 }
    rgba = [ 128 118 0 128 ]
  }
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  if GameModeEquals is_career
    SetScreenElementProps {
      id = { <id> child = 1 }
      rgba = [ 128 118 0 128 ]
    }
  endif
  SetScreenElementProps {
    id = { <id> child = 2 }
    rgba = [ 128 128 128 50 ]
  }
  if LevelIs load_skateshop
    Kill prefix = "Cab_sign_"
    Create name = <taxi_id>
  endif
  RunScriptOnScreenElement id = level_select_anchor_info level_select_hide_info
  if ( <locked> = 1 )
    if ( <points_to_unlock> = -1 )
      if IsDemo
         <info_text> = "Not available in demo version."
      else
         <info_text> = "Buy this level in the secrets shop."
      endif
      if LevelIs load_skateshop
        Kill prefix = "Cab_sign_"
        Create name = Cab_sign_11_Locked
      endif
    else
      if ( <points_to_unlock> > 1 )
         <points_text> = "Points"
      else
         <points_text> = "Point"
      endif
      if LevelIs load_skateshop
        Kill prefix = "Cab_sign_"
        Create name = Cab_sign_11_Locked
      endif
      GoalManager_GetNumberOfGoalPoints total
       <total_goal_points> = <goal_points>
      GoalManager_GetNumberOfGoalPoints
       <current_goal_points> = <goal_points>
      GetArraySize level_select_menu_level_info
       <level_info_index> = 0
      begin
        if GetGlobalFlag flag = ( ( level_select_menu_level_info [ <level_info_index> ] ).flag )
           <points_to_unlock> = ( <points_to_unlock> + ( ( level_select_menu_level_info [ <level_info_index> ] ).points_to_unlock ) )
        endif
         <level_info_index> = ( <level_info_index> + 1 )
      repeat <array_size>
      if IsDemo
        FormatText TextName = info_text "Not available in demo version."
      else
        if GameModeEquals is_career
          if ( <in_locked_group> = 1 )
             <info_text> = <PreReq_message>
          else
            if ( <can_afford_level> = 1 )
              FormatText TextName = info_text "%i Pro %p to\nunlock the next level" p = <points_text> i = <points_to_unlock>
            else
              FormatText TextName = info_text "%i Pro %p to\nunlock the next level" p = <points_text> i = <points_to_unlock>
            endif
          endif
        else
          FormatText TextName = info_text "Unlock in Career Mode"
        endif
      endif
    endif
    SetScreenElementProps {
      id = level_select_points_info
      text = <info_text>
    }
    RunScriptOnScreenElement id = level_select_anchor_info level_select_animate_info
  endif
endscript
created_park_warning = 0
script level_select_created_park_menu
  make_new_skateshop_menu {
    parent = current_menu_anchor
    pos = (369, 93)
    internal_just = [ left center ]
    menu_id = created_park_menu
    vmenu_id = created_park_vmenu
    menu_title = ""
  }
  kill_start_key_binding
  if GotParam show_warning
    Change created_park_warning = 1
  endif
  create_icon texture = PA_Pro pos = (320, 85)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = options_bg
    draw_behind_parent
    pos = (469, 85)
    scale = (1.17, 1.1)
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 3
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_blue_bar
    texture = stats_notch
    pos = (461, 230)
    rgba = [ 42 48 77 50 ]
    scale = (14, 0.2)
    just = [ center top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_box_top
    texture = level_top_piece
    pos = (467, 103)
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
  }
  begin
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
    }
  repeat 6
  GetStackedScreenElementPos y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (0.96, 1)
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = main_menu_box_top offset = (-20, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    scale = (0.8, 0.56)
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = (467, 117)
    rgba = [ 0 0 0 30 ]
    scale = (59, 5)
    just = [ center top ]
  }
  GetCustomParkName
  if ( <name> = "" )
     <name> = "unnamed park"
  endif
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    pos = (467, 115)
    font = dialog
    text = <name>
    just = [ center top ]
    scale = 1
    rgba = [ 128 128 128 80 ]
    not_focusable
    z_priority = 5
  }
  truncate_string id = <id> max_width = 200
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    pos = (365, 90)
    font = testtitle
    text = "CREATED PARK"
    just = [ left top ]
    scale = 1.4
    rgba = [ 128 128 128 98 ]
    not_focusable
    z_priority = 5
  }
  CreateScreenElement {
    type = TextElement
    parent = current_menu
    font = small
    text = ""
    not_focusable
  }
  SetScreenElementProps {
    id = created_park_vmenu
    event_handlers = [
      { pad_back generic_menu_pad_back_sound }
      { pad_back level_select_created_park_menu_exit }
    ]
    replace_handlers
  }
  if GotParam from_server_options
    main_menu_add_item { text = 'Play Park'
      id = created_park_play_park
      pad_choose_script = created_park_launch
      pad_choose_params = { from_server_options }
    }
  else
    main_menu_add_item { text = 'Play Park'
      id = created_park_play_park
      pad_choose_script = created_park_launch
      pad_choose_params = { }
    }
  endif
  if GotParam from_server_options
    main_menu_add_item { text = 'Load Park'
      id = created_park_load_park
      pad_choose_script = confirm_load_park
      pad_choose_params = { load_park from_server_options }
    }
  else
    main_menu_add_item { text = 'Load Park'
      id = created_park_load_park
      pad_choose_script = confirm_load_park
      pad_choose_params = { load_park }
    }
  endif
  if GotParam from_server_options
    main_menu_add_item { text = 'Pre-Made Parks'
      id = created_park_premade
      pad_choose_script = level_select_created_park_menu_exit
      pad_choose_params = { park_list from_server_options }
    }
  else
    main_menu_add_item { text = 'Pre-Made Parks'
      id = created_park_premade
      pad_choose_script = level_select_created_park_menu_exit
      pad_choose_params = { park_list }
    }
  endif
  main_menu_add_item { text = 'Back'
    id = created_park_back
    pad_choose_script = level_select_created_park_menu_exit
    pad_choose_params = { }
  }
  FireEvent type = unfocus target = level_select_vmenu
  RunScriptOnScreenElement id = created_park_menu animate_in
endscript
script created_park_launch
  if GotParam from_server_options
    level_select_created_park_menu_exit from_server_options
    level = Load_Sk4Ed_gameplay
    string = "Created Park"
    level_select_menu_exit from_server_options net_pad_back = 0 <...>
  else
    level_select_created_park_menu_exit
    if ( created_park_warning = 1 )
      Change created_park_warning = 0
      level_select_change_level level = Load_Sk4Ed_gameplay <...> show_warning
    else
      level_select_change_level level = Load_Sk4Ed_gameplay <...>
    endif
  endif
endscript
script confirm_load_park
  level_select_created_park_menu_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  if GotParam from_server_options
    Change still_in_net_area = 1
    if IsParkUnsaved
      menu_confirm_quit { yes_script = launch_level_select_load_park_sequence
        title = "Replace unsaved park?"
        back_script = return_to_created_park_menu
        no_script = return_to_created_park_menu
        params = { from_server_options }
      }
    else
      launch_level_select_load_park_sequence
    endif
  else
    if IsParkUnsaved
      menu_confirm_quit { yes_script = launch_level_select_load_park_sequence
        title = "Replace unsaved park?"
        back_script = return_to_created_park_menu
        no_script = return_to_created_park_menu
      }
    else
      launch_level_select_load_park_sequence
    endif
  endif
endscript
still_in_net_area = 0
script return_to_created_park_menu
  dialog_box_exit
  launch_level_select_menu
  level_select_created_park_menu <...>
endscript
script level_select_created_park_menu_exit
  if ObjectExists id = created_park_menu
    DestroyScreenElement id = created_park_menu
  endif
  AssignAlias id = level_select_anchor alias = current_menu_anchor
  if GotParam launch_level
    Printf "launching created level"
  endif
  if GotParam load_park
    Printf "launching created level"
  endif
  if GotParam park_list
    level_select_created_park_list <...>
  else
    FireEvent type = focus target = level_select_vmenu
  endif
endscript
script level_select_created_park_list
  Printf "level_select_created_park_list"
  dialog_box_exit
  if GotParam in_park_editor
    if ObjectExists id = current_menu_anchor
      DestroyScreenElement id = current_menu_anchor
    endif
    delta_pos = (-130, 0)
  else
    delta_pos = (0, 0)
  endif
  remove_pause_menu_textures_from_vram
  add_level_select_menu_textures_to_vram
  make_new_skateshop_menu {
    parent = <id>
    pos = ( (369, 97) + <delta_pos> )
    dims = (200, 229)
    internal_just = [ left center ]
    menu_id = created_park_menu
    vmenu_id = created_park_vmenu
    menu_title = ""
    type = VScrollingMenu
    scrolling_menu_title_id = ""
    dont_allow_wrap = dont_allow_wrap
  }
  kill_start_key_binding
  SetScreenElementProps { id = created_park_vmenu
    event_handlers = [
      { pad_down menu_vert_blink_arrow params = { id = park_menu_down_arrow } }
      { pad_up menu_vert_blink_arrow params = { id = park_menu_up_arrow } }
    ]
  }
  if GotParam in_park_editor
    create_helper_text generic_helper_text
  endif
  create_icon texture = PA_Pro pos = ( (320, 85) + <delta_pos> )
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "PRE-MADE"
    scale = 1.4
    pos = ( (369, 88) + <delta_pos> )
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = options_bg
    draw_behind_parent
    pos = ( (469, 85) + <delta_pos> )
    scale = (1.17, 1.1)
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 2
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_blue_bar
    texture = stats_notch
    pos = ( (461, 364) + <delta_pos> )
    rgba = [ 42 48 77 50 ]
    scale = (14, 0.2)
    just = [ center top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = park_menu_up_arrow
    texture = up_arrow
    pos = ( (467, 115) + <delta_pos> )
    rgba = [ 128 128 128 128 ]
    just = [ center top ]
    z_priority = 4
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = park_menu_down_arrow
    texture = down_arrow
    pos = ( (467, 368) + <delta_pos> )
    rgba = [ 128 128 128 128 ]
    just = [ center top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_box_top
    texture = level_top_piece
    pos = ( (467, 103) + <delta_pos> )
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
  }
  begin
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
    }
  repeat 15
  GetStackedScreenElementPos y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (0.96, 1)
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = main_menu_box_top offset = (-20, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    scale = (0.8, 1.12)
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
  }
  if GotParam from_server_options
    pad_back_params = { from_server_options }
  else
    pad_back_params = { }
  endif
  SetScreenElementProps {
    id = created_park_vmenu
    event_handlers = [ { pad_back level_select_created_park_list_exit params = <pad_back_params> } ]
    replace_handlers
  }
  GetArraySize premade_parks_info
  index = 0
  begin
    main_menu_add_item { text = ( premade_parks_info [ <index> ].name )
      pad_choose_script = level_select_created_park_list_exit
      pad_choose_params = { <pad_back_params> slot = ( premade_parks_info [ <index> ].slot ) }
    }
     <index> = ( <index> + 1 )
  repeat <array_size>
  if ScreenElementExists id = level_select_vmenu
    FireEvent type = unfocus target = level_select_vmenu
  endif
  RunScriptOnScreenElement id = created_park_menu animate_in
endscript
script level_select_created_park_list_exit
  if ObjectExists id = created_park_menu
    DestroyScreenElement id = created_park_menu
  endif
  if ObjectExists id = level_select_anchor
    AssignAlias id = level_select_anchor alias = current_menu_anchor
  else
    in_park_ed = 1
  endif
  if GotParam slot
    Printf "loading from disk"
    if GotParam in_park_ed
      Printf "in the park editor"
      parked_load_from_disk slot = <slot>
    else
      if GotParam from_server_options
        LoadParkFromDisk slot = <slot> block_rebuild
        created_park_launch from_server_options
      else
        LoadParkFromDisk slot = <slot> block_rebuild
        created_park_launch
      endif
    endif
  else
    if GotParam in_park_ed
      remove_level_select_menu_textures_from_vram
      parked_setup_main_menu
    else
      level_select_created_park_menu <...>
    endif
  endif
endscript
script premade_park_wait_message
  Printf "premade_park_wait_message"
  DoScreenElementMorph id = current_menu_anchor scale = 0
  create_error_box title = "Loading..." text = "Please wait while the pre-made park is loaded."
  FireEvent type = showed_wait_message target = system
endscript
script level_select_hide_info
  DoMorph scale = 0
endscript
script level_select_animate_info
  DoMorph scale = 1
endscript
script level_select_menu_unfocus
  GetTags
  SetScreenElementProps {
    id = { <id> child = 0 }
    rgba = <rgba>
  }
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down params = { rgba = <rgba> }
  if GameModeEquals is_career
    SetScreenElementProps {
      id = { <id> child = 1 }
      rgba = <rgba>
    }
  endif
  SetScreenElementProps {
    id = { <id> child = 2 }
    rgba = [ 128 128 128 0 ]
  }
endscript
script level_select_play_cam
  kill_level_select_cams
  if LevelIs load_skateshop
    KillSkaterCamAnim all
    PlaySkaterCamAnim skater = 0 name = SS_LevelSelect play_hold
  else
    PlaySkaterCamAnim skater = 0 name = MapGuy_ViewCam play_hold
    SetSkaterCamAnimShouldPause name = MapGuy_ViewCam 0
  endif
endscript
script kill_level_select_cams
  KillSkaterCamAnim name = MapGuy_ViewCam
endscript
script really_change_level
  if OnServer
    change_level <...>
  else
    if IsHost
      FCFSRequestChangeLevel <...>
    endif
  endif
endscript
script level_select_change_level
  PlaySound GoToLoadLevel
  GoalManager_ShowPoints
  if not GoalManager_HasActiveGoals
    GoalManager_ShowGoalPoints
  endif
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_level_select_menu_textures_from_vram
  kill_level_select_cams
  if CD
    if IsCustomPark
      really_change_level <...>
    else
      if not LevelIs <level>
        really_change_level <...>
      else
        if GotParam chose_same_level_script
           <chose_same_level_script>
        else
          if GotParam end_run
            create_end_run_menu
            return
          endif
        endif
      endif
    endif
  else
    really_change_level <...>
  endif
  restore_start_key_binding
  exit_pause_menu
endscript
script level_select_invalid_choice
endscript
script level_select_spend_points_dialog level_name = "Zoo" level = Load_Zoo
  RunScriptOnScreenElement id = current_menu_anchor hide_main_menu_anchor
  if ( <points_to_unlock> = 1 )
    FormatText { TextName = prompt
      "Unlock %%level?"
      level = <text>
    }
  else
    FormatText { TextName = prompt
      "Unlock %%level?"
      level = <text>
    }
  endif
  FireEvent type = unfocus target = current_menu
  create_dialog_box { title = " "
    text = <prompt>
    pos = (320, 185)
    just = [ center center ]
    text_rgba = [ 88 105 112 128 ]
    text_scale = 1
    pad_back_script = level_select_dialog_no
    buttons = [ { font = small text = "Yes" pad_choose_script = level_select_spend_points pad_choose_params = { level = <level> goal_points = <points_to_unlock> flag = <flag> } }
      { font = small text = "No" pad_choose_script = level_select_dialog_no pad_choose_params = <...> }
    ]
  }
endscript
script level_select_spend_points
  GoalManager_SpendGoalPoints <goal_points>
  SetGlobalFlag flag = <flag>
  SetScreenElementProps {
    id = root_window
    event_handlers = [ { pad_start handle_start_pressed } ]
    replace_handlers
  }
  dialog_box_exit
  change_level <...>
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_level_select_menu_textures_from_vram
  exit_pause_menu
endscript
script level_select_dialog_no
  DestroyScreenElement id = dialog_box_anchor
  RunScriptOnScreenElement id = current_menu_anchor show_main_menu_anchor
  Wait 1 frame
  FireEvent type = focus target = current_menu
endscript
script hide_main_menu_anchor
  DoMorph time = 0 scale = 0
endscript
script show_main_menu_anchor
  DoMorph time = 0 scale = 1
endscript
script add_level_select_menu_textures_to_vram
  AddTextureToVram "level_top_piece"
  AddTextureToVram "level_repeat_mid"
  AddTextureToVram "level_lower_piece"
  AddTextureToVram "level_bottom_piece"
  AddTextureToVram "level_bottom_cap"
  AddTextureToVram "bottom_l_cap"
  AddTextureToVram "bottom_mid"
  AddTextureToVram "bottom_r_cap"
  AddTextureToVram "mainbar"
  AddTextureToVram "mainbar_join"
  AddTextureToVram "longbar_edgy"
  AddTextureToVram "goal_right"
  AddTextureToVram "pa_pro"
  AddTextureToVram "stats_notch"
  AddTextureToVram "up_arrow"
  AddTextureToVram "down_arrow"
  AddTextureToVram "goal_line"
endscript
script remove_level_select_menu_textures_from_vram
  RemoveTextureFromVram "level_top_piece"
  RemoveTextureFromVram "level_repeat_mid"
  RemoveTextureFromVram "level_lower_piece"
  RemoveTextureFromVram "level_bottom_piece"
  RemoveTextureFromVram "level_bottom_cap"
  RemoveTextureFromVram "bottom_l_cap"
  RemoveTextureFromVram "bottom_mid"
  RemoveTextureFromVram "bottom_r_cap"
  RemoveTextureFromVram "mainbar"
  RemoveTextureFromVram "mainbar_join"
  RemoveTextureFromVram "longbar_edgy"
  RemoveTextureFromVram "goal_right"
  RemoveTextureFromVram "pa_pro"
  RemoveTextureFromVram "stats_notch"
  RemoveTextureFromVram "up_arrow"
  RemoveTextureFromVram "down_arrow"
  RemoveTextureFromVram "goal_line"
endscript
e3_level_select_menu_level_info = [
  { text = "College" level_num = 1 points_to_unlock = 0 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_SCH level = load_sch taxi_id = Cab_sign_1_College }
  { text = "Zoo" level_num = 7 points_to_unlock = 0 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_ZOO level = Load_Zoo taxi_id = Cab_sign_7_Zoo }
]
level_select_menu_level_info = [
  { text = "College" level_num = 1 points_to_unlock = 0 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_SCH level = load_sch taxi_id = Cab_sign_1_College }
  { text = "San Francisco" level_num = 2 points_to_unlock = 8 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_SF2 level = Load_SF2 taxi_id = Cab_sign_2_San_Fran }
  { text = "Alcatraz" level_num = 3 points_to_unlock = 8 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_ALC level = Load_Alc taxi_id = Cab_sign_3_Alcatraz }
  { text = "Kona" level_num = 4 points_to_unlock = 8 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_KON level = Load_Kon taxi_id = Cab_sign_4_Kona PreReq_flags = [ LEVEL_UNLOCKED_SCH LEVEL_UNLOCKED_SF2 LEVEL_UNLOCKED_ALC ] PreReq_message = "Visit Alcatraz and San Francisco first." }
  { text = "Shipyard" level_num = 5 points_to_unlock = 8 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_JNK level = Load_Jnk taxi_id = Cab_sign_5_Shipyard PreReq_flags = [ LEVEL_UNLOCKED_SCH LEVEL_UNLOCKED_SF2 LEVEL_UNLOCKED_ALC ] PreReq_message = "Visit Alcatraz and San Francisco first." }
  { text = "London" level_num = 6 points_to_unlock = 8 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_LON level = Load_Lon taxi_id = Cab_sign_6_London PreReq_flags = [ LEVEL_UNLOCKED_KON LEVEL_UNLOCKED_JNK ] PreReq_message = "Visit Kona and the Shipyard first." }
  { text = "Zoo" level_num = 7 points_to_unlock = 8 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_ZOO level = Load_Zoo taxi_id = Cab_sign_7_Zoo PreReq_flags = [ LEVEL_UNLOCKED_KON LEVEL_UNLOCKED_JNK ] PreReq_message = "Visit Kona and the Shipyard first." }
  { text = "Carnival" level_num = 8 points_to_unlock = -1 num_am_goals = 14 num_goals = 14 flag = LEVEL_UNLOCKED_CNV level = Load_Cnv taxi_id = Cab_sign_8_Carnival }
  { text = "Chicago" level_num = 9 points_to_unlock = -1 num_am_goals = 14 num_goals = 14 flag = LEVEL_UNLOCKED_HOF level = Load_Hof taxi_id = Cab_sign_9_Chicago }
  { text = "Created Park" level_num = 10 points_to_unlock = 0 num_goals = 0 flag = LEVEL_UNLOCKED_CPK level = Load_Sk4Ed_gameplay taxi_id = Cab_sign_10_Custom }
]
level_select_menu_level_info_unlock = [
  { text = "College" level_num = 1 points_to_unlock = 0 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_SCH level = load_sch taxi_id = Cab_sign_1_College }
  { text = "San Francisco" level_num = 2 points_to_unlock = 0 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_SCH level = Load_SF2 taxi_id = Cab_sign_2_San_Fran }
  { text = "Alcatraz" level_num = 3 points_to_unlock = 0 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_SCH level = Load_Alc taxi_id = Cab_sign_3_Alcatraz }
  { text = "Kona" level_num = 4 points_to_unlock = 0 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_SCH level = Load_Kon taxi_id = Cab_sign_4_Kona }
  { text = "Shipyard" level_num = 5 points_to_unlock = 0 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_SCH level = Load_Jnk taxi_id = Cab_sign_5_Shipyard }
  { text = "London" level_num = 6 points_to_unlock = 0 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_SCH level = Load_Lon taxi_id = Cab_sign_6_London }
  { text = "Zoo" level_num = 7 points_to_unlock = 0 num_am_goals = 16 num_goals = 21 flag = LEVEL_UNLOCKED_SCH level = Load_Zoo taxi_id = Cab_sign_7_Zoo }
  { text = "Carnival" level_num = 8 points_to_unlock = 0 num_am_goals = 14 num_goals = 14 flag = LEVEL_UNLOCKED_SCH level = Load_Cnv taxi_id = Cab_sign_8_Carnival }
  { text = "Chicago" level_num = 9 points_to_unlock = 0 num_am_goals = 14 num_goals = 14 flag = LEVEL_UNLOCKED_SCH level = Load_Hof taxi_id = Cab_sign_9_Chicago }
  { text = "Created Park" level_num = 10 points_to_unlock = 0 num_goals = 0 flag = LEVEL_UNLOCKED_SCH level = Load_Sk4Ed_gameplay taxi_id = Cab_sign_10_Custom }
]
level_select_pro_challenge_info = {
  Hawk = { text = "In the College" }
  Thomas = { text = "In the College" }
  Burnquist = { text = "In the Zoo" }
  Campbell = { text = "In San Francisco" }
  Steamer = { text = "In Alcatraz" }
  Mullen = { text = "In Kona Park" }
  Lasek = { text = "In the Shipyard" }
  Rowley = { text = "In London" }
  Muska = { text = "In San Francisco" }
  Glifberg = { text = "In Alcatraz" }
  Caballero = { text = "In Kona Park" }
  Margera = { text = "In Alcatraz" }
  Koston = { text = "In the Shipyard" }
  Reynolds = { text = "In San Francisco" }
  custom = { text = "In the Shipyard" }
}
premade_parks_info = [
  { name = "DDT 3" slot = 5 }
  { name = "Splintzville" slot = 19 }
  { name = "Ledge Monkey" slot = 24 }
  { name = "Skillzilla Park" slot = 18 }
  { name = "FULL ON!" slot = 22 }
  { name = "Auto Bazootie" slot = 14 }
  { name = "Jiland 2" slot = 13 }
  { name = "A Happy Place" slot = 6 }
  { name = "Montana" slot = 3 }
  { name = "Purgatory" slot = 9 }
  { name = "Excavation" slot = 15 }
  { name = "Pools of Fury" slot = 20 }
  { name = "Lucifers Launch" slot = 25 }
  { name = "Libertyville" slot = 12 }
  { name = "D'Apark" slot = 2 }
  { name = "Wreck Center" slot = 23 }
  { name = "Owasis" slot = 4 }
  { name = "Skatechupichu" slot = 7 }
  { name = "The Reservoir" slot = 8 }
  { name = "Mongoose Maze" slot = 10 }
  { name = "Concrete Jinkin" slot = 11 }
  { name = "The Hole" slot = 1 }
  { name = "BARNS ONLY" slot = 17 }
  { name = "Kastle" slot = 21 }
  { name = "The Funk Hole" slot = 16 }
]
script create_options_menu
  GoalManager_ShowPoints
  if not GoalManager_HasActiveGoals
    GoalManager_ShowGoalPoints
  endif
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  add_pause_menu_textures_to_vram
  if InSplitScreenGame
    GoalManager_ShowPoints
    options_pos = (230, 88)
  else
    options_pos = (230, 38)
  endif
  make_new_menu {
    menu_id = options_menu
    vmenu_id = options_vmenu
    menu_title = "OPTIONS"
    pos = <options_pos>
  }
  create_helper_text generic_helper_text
  kill_start_key_binding
  if LevelIs load_skateshop
    pad_back_script = skateshop_practice_pause_menu
  else
    pad_back_script = create_pause_menu
  endif
  SetScreenElementProps { id = options_menu
    event_handlers = [
      { pad_back <pad_back_script> }
    ]
  }
  if GameModeEquals is_career
    if not IsTrue DEMO_BUILD
      make_text_sub_menu_item text = "Game Progress" id = menu_game_progress pad_choose_script = game_progress_menu_create
      make_text_sub_menu_item text = "Change Skater" id = menu_skater pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = menu_confirm_goto_secret_shop change_skater }
      if IsDemo
        make_text_sub_menu_item text = "Spend Cash" id = menu_secret not_focusable = not_focusable pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = menu_confirm_goto_secret_shop }
      else
        make_text_sub_menu_item text = "Spend Cash" id = menu_secret pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = menu_confirm_goto_secret_shop }
      endif
    endif
  endif
  make_text_sub_menu_item text = better4_options_text id = menu_mod pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = better4_options_menu close_script = create_options_menu }
  if not InMultiplayerGame
    if IsNGC
      switch camera_angle
      case 0
        camera_text = "Camera Angle: 1"
      case 1
        camera_text = "Camera Angle: 2"
      case 2
        camera_text = "Camera Angle: 3"
      case 3
        camera_text = "Camera Angle: 4"
      endswitch
      make_text_sub_menu_item text = <camera_text> id = menu_camera pad_choose_script = toggle_camera_angle pad_choose_params = { }
    endif
    make_text_sub_menu_item text = "Edit Stats" id = menu_edit_stats pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_stats_menu }
        make_text_sub_menu_item {
          text = "Edit Tricks"
          id = menu_edit_tricks
          pad_choose_script = create_edit_tricks_menu
        }
    if GameModeEquals is_career
      if GoalManager_HasActiveGoals count_all
        make_text_sub_menu_item {
          text = "Pro Trick Objects"
          pad_choose_script = generic_menu_pad_choose
          pad_choose_params = { callback = create_pro_trick_objects_menu }
          not_focusable
          rgba = [ 50 50 50 90 ]
        }
      else
        make_text_sub_menu_item {
          text = "Pro Trick Objects"
          pad_choose_script = generic_menu_pad_choose
          pad_choose_params = { callback = create_pro_trick_objects_menu }
        }
      endif
    endif
    if not ( ( IsTrue bootstrap_build ) or ( IsTrue DEMO_BUILD ) )
      if not CD
        make_text_sub_menu_item text = "Cheats: DO NOT TEST" id = menu_cheats pad_choose_script = launch_cheats_menu
      endif
      if IsDemo
        make_text_sub_menu_item text = "Cheats" id = menu_real_cheats not_focusable = not_focusable pad_choose_script = create_real_cheats_menu
      else
        make_text_sub_menu_item text = "Cheats" id = menu_real_cheats pad_choose_script = create_real_cheats_menu
      endif
    endif
  else
          make_text_sub_menu_item {
            text = "Edit Tricks"
            id = menu_edit_tricks
            pad_choose_script = create_edit_tricks_menu
          }
    if InNetGame
      if GameModeEquals is_lobby
        if GoalManager_HasActiveGoals count_all
          make_text_sub_menu_item {
            text = "Pro Trick Objects"
            pad_choose_script = generic_menu_pad_choose
            pad_choose_params = { callback = create_pro_trick_objects_menu }
            not_focusable
            rgba = [ 50 50 50 90 ]
          }
        else
          make_text_sub_menu_item {
            text = "Pro Trick Objects"
            pad_choose_script = generic_menu_pad_choose
            pad_choose_params = { callback = create_pro_trick_objects_menu }
          }
        endif
      endif
      if not ( ( IsTrue bootstrap_build ) or ( IsTrue DEMO_BUILD ) )
        if not CD
          make_text_sub_menu_item text = "Cheats: DO NOT TEST" id = menu_cheats pad_choose_script = launch_cheats_menu
        endif
      endif
    else
    endif
  endif
  if IsXBOX
    make_text_sub_menu_item text = "Adjust Gamma" id = menu_gamma pad_choose_script = create_gamma_menu
  else
    make_text_sub_menu_item text = "Screen Mode" id = menu_screen pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_screen_menu }
  endif
  make_text_sub_menu_item text = "Sound Options" id = menu_sound_options pad_choose_script = launch_sound_options_menu pad_choose_params = { from_options }
  if InNetGame
    if InTeamGame
      GetPreferenceString pref_type = network score_display
      make_text_sub_menu_item text = "Score Display Mode" id = menu_score_display pad_choose_script = create_options_score_display_menu
      make_text_sub_menu_item text = <ui_string> id = menu_score_display_str rgba = [ 80 80 80 128 ] not_focusable
    endif
    GetPreferenceString pref_type = network show_names
    options_menu_add_toggle_item text = "Player Names:" id = menu_toggle_names pad_choose_script = toggle_show_name_option on_off_text = <ui_string>
    GetPreferenceString pref_type = network auto_brake
    options_menu_add_toggle_item text = "Auto-Brake:" id = menu_auto_brake pad_choose_script = toggle_auto_brake_option on_off_text = <ui_string>
  else
    if not ObjectExists id = menu_real_cheats
      if IsDemo
        make_text_sub_menu_item text = "Cheats" id = menu_real_cheats not_focusable = not_focusable pad_choose_script = create_real_cheats_menu
      else
        make_text_sub_menu_item text = "Cheats" id = menu_real_cheats pad_choose_script = create_real_cheats_menu
      endif
    endif
  endif
  make_text_sub_menu_item text = "Done" id = menu_done pad_choose_script = <pad_back_script> pad_choose_params = { no_sound }
  if InSplitScreenGame
    set_sub_bg pos = (326, 95)
    create_icon pos = (176, 95) texture = PA_options
  else
    set_sub_bg pos = (326, 45)
    create_icon pos = (176, 45) texture = PA_options
  endif
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script options_menu_add_toggle_item { focus_script = do_scale_up
    unfocus_script = do_scale_down
    pad_choose_script = nullscript
    font_face = small
    parent_menu_id = current_menu
    scale = 1
    rgba = [ 88 105 112 128 ]
    on_off_text = "On"
  }
  if GotParam not_focusable
    CreateScreenElement {
      type = TextElement
      parent = <parent_menu_id>
      id = <id>
      text = <text>
      font = <font_face>
      rgba = [ 30 30 30 128 ]
      scale = <scale>
      dims = <dims>
      not_focusable
    }
  else
    CreateScreenElement {
      type = TextElement
      parent = <parent_menu_id>
      id = <id>
      text = <text>
      font = <font_face>
      rgba = <rgba>
      scale = <scale>
      dims = <dims>
      event_handlers = [
        { focus <focus_script> params = <focus_params> }
        { unfocus <unfocus_script> params = <unfocus_params> }
        { pad_choose generic_menu_pad_choose_sound }
        { pad_start generic_menu_pad_choose_sound }
        { pad_choose <pad_choose_script> params = <pad_choose_params> }
        { pad_start <pad_choose_script> params = <pad_choose_params> }
      ]
    }
    GetScreenElementDims id = <id>
    toggle_pos = ( ( <width> * (1, 0) ) + (10, 12) )
    CreateScreenElement {
      type = TextElement
      parent = <id>
      pos = <toggle_pos>
      just = [ left center ]
      text = <on_off_text>
      font = <font_face>
      rgba = <rgba>
      scale = <scale>
    }
  endif
endscript
camera_angle = 0
script toggle_camera_angle
  switch camera_angle
  case 0
    Change camera_angle = 1
    SetScreenElementProps id = menu_camera text = "Camera Angle: 2"
    ToggleSkaterCamMode skater = 0
  case 1
    Change camera_angle = 2
    SetScreenElementProps id = menu_camera text = "Camera Angle: 3"
    ToggleSkaterCamMode skater = 0
  case 2
    Change camera_angle = 3
    SetScreenElementProps id = menu_camera text = "Camera Angle: 4"
    ToggleSkaterCamMode skater = 0
  case 3
    Change camera_angle = 0
    SetScreenElementProps id = menu_camera text = "Camera Angle: 1"
    ToggleSkaterCamMode skater = 0
  endswitch
endscript
script create_real_cheats_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  if InSplitScreenGame
    GoalManager_HidePoints
  endif
  make_new_menu {
    menu_id = cheats_menu
    vmenu_id = cheats_vmenu
    menu_title = "CHEATS"
    pos = (230, 38)
  }
  SetScreenElementProps { id = cheats_menu
    event_handlers = [
      { pad_back generic_menu_pad_back params = { callback = create_options_menu } }
    ]
  }
  create_helper_text generic_helper_text_toggle
  kill_start_key_binding
  if GetGlobalFlag flag = CHEAT_UNLOCKED_1
    make_cheats_menu_item text = "Cool Specials" cheat_flag = CHEAT_COOL_SPECIAL_TRICKS pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_2
    make_cheats_menu_item {
      text = "Gorilla Mode"
      id = menu_gorilla
      cheat_flag = CHEAT_GORILLA
      pad_choose_script = toggle_cheat
      pad_choose_params = {
        on_callback = refresh_skater_model_for_cheats
        off_callback = refresh_skater_model_for_cheats
      }
    }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_3
    make_cheats_menu_item {
      text = "Kid Mode"
      cheat_flag = CHEAT_KID
      pad_choose_script = toggle_cheat
      pad_choose_params = {
        on_callback = refresh_skater_model_for_cheats
        off_callback = refresh_skater_model_for_cheats
      }
    }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_4
    make_cheats_menu_item {
      text = "Big Head Mode"
      id = menu_bighead
      cheat_flag = CHEAT_BIGHEAD
      pad_choose_script = toggle_cheat
      pad_choose_params = {
        on_callback = refresh_skater_model_for_cheats
        off_callback = refresh_skater_model_for_cheats
      }
    }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_5
    make_cheats_menu_item {
      text = "Hoverboard"
      cheat_flag = CHEAT_HOVERBOARD
      pad_choose_script = toggle_cheat
      pad_choose_params = {
        on_callback = refresh_skater_model_for_cheats
        off_callback = refresh_skater_model_for_cheats
      }
    }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_6
    make_cheats_menu_item text = "Slomo" cheat_flag = CHEAT_SLOMO pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_7
    if not InSplitScreenGame
      make_cheats_menu_item text = "Disco Mode" cheat_flag = CHEAT_DISCO pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
    endif
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_8
    make_cheats_menu_item {
      text = "Invisible"
      cheat_flag = CHEAT_INVISIBLE
      pad_choose_script = toggle_cheat
      pad_choose_params = {
        on_callback = refresh_skater_model_for_cheats
        off_callback = refresh_skater_model_for_cheats
      }
    }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_9
    make_cheats_menu_item text = "Super Blood" cheat_flag = CHEAT_SUPER_BLOOD pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_10
    make_cheats_menu_item text = "Flame" cheat_flag = CHEAT_FLAME pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_11
    make_cheats_menu_item text = "Sim Mode" cheat_flag = CHEAT_SIM pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_12
    make_cheats_menu_item text = "Always Special" cheat_flag = CHEAT_ALWAYS_SPECIAL pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_13
    make_cheats_menu_item text = "Perfect Rail" cheat_flag = CHEAT_PERFECT_RAIL pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_14
    make_cheats_menu_item text = "Perfect Skitch" cheat_flag = CHEAT_PERFECT_SKITCH pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_15
    make_cheats_menu_item text = "Stats 13" cheat_flag = CHEAT_STATS_13 pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_16
    make_cheats_menu_item text = "Perfect Manual" cheat_flag = CHEAT_PERFECT_MANUAL pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_17
    make_cheats_menu_item text = "Moon Gravity" cheat_flag = CHEAT_MOON pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  if GetGlobalFlag flag = CHEAT_UNLOCKED_18
    make_cheats_menu_item text = "Matrix Mode" cheat_flag = CHEAT_MATRIX pad_choose_script = toggle_cheat pad_choose_params = { on_callback = nullscript off_callback = nullscript }
  endif
  make_text_sub_menu_item text = "Done" id = menu_done scale = 0.8 pad_choose_script = create_options_menu
  set_sub_bg pos = (326, 45)
  create_icon pos = (174, 45) texture = PA_options
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script make_cheats_menu_item { focus_script = do_scale_up
    unfocus_script = do_scale_down
    pad_choose_script = nullscript
    font_face = small
    parent_menu_id = current_menu
    scale = 0.8
    dims = (350, 14)
    rgba = [ 88 105 112 128 ]
  }
  pad_choose_params = { cheat_flag = <cheat_flag> <pad_choose_params> }
  if GotParam not_focusable
    CreateScreenElement {
      type = TextElement
      parent = <parent_menu_id>
      id = <id>
      text = <text>
      font = <font_face>
      rgba = [ 30 30 30 128 ]
      scale = <scale>
      dims = <dims>
      not_focusable
    }
  else
    CreateScreenElement {
      type = TextElement
      parent = <parent_menu_id>
      id = <id>
      text = <text>
      font = <font_face>
      rgba = <rgba>
      scale = <scale>
      dims = <dims>
      event_handlers = [
        { focus <focus_script> params = <focus_params> }
        { unfocus <unfocus_script> params = <unfocus_params> }
        { pad_choose generic_menu_pad_choose_sound }
        { pad_choose <pad_choose_script> params = <pad_choose_params> }
        { pad_start <pad_choose_script> params = <pad_choose_params> }
      ]
    }
    GetScreenElementDims id = <id>
    toggle_pos = ( ( <width> * (1, 0) ) + (-50, 12) )
    if ( GetGlobalFlag flag = <cheat_flag> )
      on_off_text = "On"
    else
      on_off_text = "Off"
    endif
    CreateScreenElement {
      type = TextElement
      parent = <id>
      pos = <toggle_pos>
      just = [ left center ]
      text = <on_off_text>
      font = <font_face>
      rgba = <rgba>
      scale = <scale>
    }
  endif
endscript
script choose_boolean_option
  set_preferences_from_ui prefs = network <...>
  remove_pause_menu_textures_from_vram
  create_options_menu
endscript
script back_from_boolean_menus
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_pause_menu_textures_from_vram
  create_options_menu
endscript
script create_options_score_display_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu {
    menu_id = score_display_options_menu
    vmenu_id = score_display_options_vmenu
    menu_title = "SCORE DISPLAY MODE"
    pos = (230, 79)
  }
  SetScreenElementProps {
    id = score_display_options_menu
    event_handlers = [ { pad_back back_from_boolean_menus } ]
    replace_handlers
  }
  make_text_sub_menu_item text = "Show Players" id = menu_players pad_choose_script = choose_boolean_option pad_choose_params = { field = "score_display" checksum = score_players string = "Show Players" }
  make_text_sub_menu_item text = "Show Teams" id = menu_teams pad_choose_script = choose_boolean_option pad_choose_params = { field = "score_display" checksum = score_teams string = "Show Teams" }
  make_text_sub_menu_item text = "Done" id = menu_done pad_choose_script = back_from_boolean_menus
  set_sub_bg pos = (326, 85)
  create_icon pos = (176, 85) texture = PA_options
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script toggle_show_name_option
  GetTags
  GetPreferenceString pref_type = network show_names
  if ( <ui_string> = "Off" )
    text = "On"
    set_preferences_from_ui prefs = network field = "show_names" checksum = boolean_true string = "On"
    SetScreenElementProps id = { <id> child = 0 } text = "On"
  else
    text = "Off"
    set_preferences_from_ui prefs = network field = "show_names" checksum = boolean_false string = "Off"
    SetScreenElementProps id = { <id> child = 0 } text = "Off"
    destroy_all_player_names
  endif
endscript
script toggle_auto_brake_option
  GetTags
  GetPreferenceString pref_type = network auto_brake
  if ( <ui_string> = "Off" )
    text = "On"
    set_preferences_from_ui prefs = network field = "auto_brake" checksum = boolean_true string = "On"
    SetScreenElementProps id = { <id> child = 0 } text = "On"
  else
    text = "Off"
    set_preferences_from_ui prefs = network field = "auto_brake" checksum = boolean_false string = "Off"
    SetScreenElementProps id = { <id> child = 0 } text = "Off"
  endif
endscript
script create_gamma_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu menu_title = "GAMMA" menu_id = gamma_menu vmenu_id = gamma_vmenu
  SetScreenElementProps {
    id = gamma_menu
    event_handlers = [ { pad_back create_options_menu } ]
    replace_handlers
  }
  set_sub_bg
  create_icon texture = PA_options
  make_text_sub_menu_item text = "Red: " id = gamma_menu_red
  make_text_sub_menu_item text = "Green: " id = gamma_menu_green
  make_text_sub_menu_item text = "Blue: " id = gamma_menu_blue
  make_text_sub_menu_item text = "Done" id = gamma_menu_done pad_choose_script = create_options_menu
  SetScreenElementProps {
    id = gamma_menu_red
    event_handlers = [ { pad_left gamma_menu_turn_down params = { color = red } }
      { pad_right gamma_menu_turn_up params = { color = red } }
    ]
    replace_handlers
  }
  SetScreenElementProps {
    id = gamma_menu_green
    event_handlers = [ { pad_left gamma_menu_turn_down params = { color = green } }
      { pad_right gamma_menu_turn_up params = { color = green } }
    ]
    replace_handlers
  }
  SetScreenElementProps {
    id = gamma_menu_blue
    event_handlers = [ { pad_left gamma_menu_turn_down params = { color = blue } }
      { pad_right gamma_menu_turn_up params = { color = blue } }
    ]
    replace_handlers
  }
  GetGammaValues
  FormatText TextName = red_text "%i" i = <red>
  FormatText TextName = green_text "%i" i = <green>
  FormatText TextName = blue_text "%i" i = <blue>
  gamma_menu_create_child text = <red_text> parent = gamma_menu_red
  gamma_menu_create_child text = <green_text> parent = gamma_menu_green
  gamma_menu_create_child text = <blue_text> parent = gamma_menu_blue
  create_helper_text { helper_text_elements = [ { text = "\b7/\b4=Select" }
      { text = "\b6/\b5=Adjust" }
      { text = "\m0=Accept" }
      { text = "\m1=Back" }
    ]
  }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script gamma_menu_create_child
  SetScreenElementLock id = <parent> off
  CreateScreenElement {
    type = TextElement
    parent = <parent>
    text = <text>
    font = small
    just = [ right top ]
    pos = (150, 0)
  }
endscript
script gamma_menu_check_levels
  GetGammaValues
  FormatText TextName = red_text "%i" i = <red>
  FormatText TextName = green_text "%i" i = <green>
  FormatText TextName = blue_text "%i" i = <blue>
  SetScreenElementLock id = gamma_menu_red off
  SetScreenElementLock id = gamma_menu_green off
  SetScreenElementLock id = gamma_menu_blue off
  SetScreenElementProps {
    id = { gamma_menu_red child = 0 }
    text = <red_text>
  }
  SetScreenElementProps {
    id = { gamma_menu_green child = 0 }
    text = <green_text>
  }
  SetScreenElementProps {
    id = { gamma_menu_blue child = 0 }
    text = <blue_text>
  }
endscript
script gamma_menu_turn_up
  GetGammaValues
  switch <color>
  case red
    if not ( <red> > 99 )
      PlaySound GUI_click06
    endif
  case blue
    if not ( <blue> > 99 )
      PlaySound GUI_click06
    endif
  case green
    if not ( <green> > 99 )
      PlaySound GUI_click06
    endif
  endswitch
  ApplyChangeGamma <...> Change = 0.01
  Wait 1 frame
  gamma_menu_check_levels
endscript
script gamma_menu_turn_down
  GetGammaValues
  switch <color>
  case red
    if not ( 1 > <red> )
      PlaySound GUI_click06
    endif
  case blue
    if not ( 1 > <blue> )
      PlaySound GUI_click06
    endif
  case green
    if not ( 1 > <green> )
      PlaySound GUI_click06
    endif
  endswitch
  ApplyChangeGamma <...> Change = -0.01
  Wait 1 frame
  gamma_menu_check_levels
endscript
script create_split_menu callback_script = create_options_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu menu_title = "SCREEN SETUP" menu_id = screen_menu vmenu_id = screen_vmenu
  create_helper_text generic_helper_text
  SetScreenElementProps {
    id = screen_menu
    event_handlers = [ { pad_back generic_menu_pad_back params = { callback = <callback_script> } } ]
    replace_handlers
  }
  set_sub_bg
  create_icon texture = PA_network
  make_text_sub_menu_item text = "Horizontal" pad_choose_script = generic_menu_pad_choose pad_choose_params = { <...> callback = split_setup_horizontal }
  make_text_sub_menu_item text = "Vertical" pad_choose_script = generic_menu_pad_choose pad_choose_params = { <...> callback = split_setup_vertical }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script create_screen_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu menu_title = "SCREEN SETUP" menu_id = screen_menu vmenu_id = screen_vmenu helper_text = generic_helper_text
  SetScreenElementProps {
    id = screen_menu
    event_handlers = [ { pad_back generic_menu_pad_back params = { callback = create_options_menu } } ]
    replace_handlers
  }
  set_sub_bg
  create_icon texture = PA_options
  if IsPS2
    make_text_sub_menu_item text = "Standard 4:3" pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = screen_setup_standard }
    make_text_sub_menu_item text = "Widescreen 16:9" pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = screen_setup_widescreen }
  endif
  if IsNGC
    make_text_sub_menu_item text = "Standard 4:3" pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = screen_setup_standard }
    make_text_sub_menu_item text = "Widescreen 16:9" pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = screen_setup_widescreen }
  endif
  if not IsTrue bootstrap_build
    make_text_sub_menu_item text = "Done" id = screen_menu_done pad_choose_script = create_options_menu
  endif
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script screen_option_update_hud_toggle
  if ( HIDEHUD = 1 )
    FormatText TextName = text "HUD: off"
  else
    FormatText TextName = text "HUD: on"
  endif
  SetScreenElementProps {
    id = screen_option_hide_hud
    text = <text>
  }
endscript
script screen_setup_hide_hud
  if ( HIDEHUD = 0 )
    Change HIDEHUD = 1
  else
    Change HIDEHUD = 0
  endif
  screen_option_update_hud_toggle
endscript
script split_setup_horizontal
  Printf "changing split mode to horizontal"
  SetScreenMode split_horizontal
  ResetSkaterCameras
  ScreenElementSystemCleanup
  if GotParam end_run
    create_end_run_menu
  else
    create_pause_menu
  endif
  UpdateScore
endscript
script split_setup_vertical
  Printf "changing split mode to vertical"
  SetScreenMode split_vertical
  ResetSkaterCameras
  ScreenElementSystemCleanup
  if GotParam end_run
    create_end_run_menu
  else
    create_pause_menu
  endif
  UpdateScore
endscript
script launch_cheats_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_cheats_menu
endscript
script create_cheats_menu
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  make_new_menu {
    padding_scale = 1
    menu_id = cheats_menu
    vmenu_id = cheats_vmenu
    menu_title = "CHEATS"
    padding_scale = 0.9
    pos = (230, 40)
    helper_text = generic_helper_text
  }
  kill_start_key_binding
  SetScreenElementProps { id = cheats_menu
    event_handlers = [ { pad_back create_options_menu } ]
  }
  make_toggle_menu_item id = cheats_menu_level_lock text = "Levels unlocked: " pad_choose_script = cheats_menu_change_level_lock
  make_text_sub_menu_item text = "100 Stat Points" pad_choose_script = cheats_menu_100_stat_points
  make_text_sub_menu_item text = "$5000 cash" pad_choose_script = cheats_menu_cash
  if GoalManager_HasActiveGoals
    make_text_sub_menu_item text = "Beat current goal" pad_choose_script = cheats_menu_beat_current_goal
  endif
  make_text_sub_menu_item text = "Unlock all goals" pad_choose_script = cheats_menu_UnlockAllGoals
  make_text_sub_menu_item text = "Score 5 million points" pad_choose_script = cheats_menu_score5mil
  make_text_sub_menu_item text = "Turn Pro" pad_choose_script = cheats_menu_turnPro
  make_text_sub_menu_item text = "Mark all goals unbeaten" pad_choose_script = cheats_menu_UnBeatAllGoals
  make_text_sub_menu_item text = "Add 1 pro point" pad_choose_script = cheats_menu_addgoalpoint
  RunScriptOnScreenElement id = cheats_menu_level_lock cheats_menu_check_level_lock
  set_sub_bg pos = (330, 40)
  create_icon texture = PA_cheats pos = (180, 40)
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script cheats_menu_change_flag
  GetTags
  if GetGlobalFlag flag = <flag>
    UnSetGlobalFlag flag = <flag>
    toggle_menu_item_off id = <id>
  else
    SetGlobalFlag flag = <flag>
    toggle_menu_item_on id = <id>
  endif
endscript
script cheats_menu_check_flag
  GetTags
  if GetGlobalFlag flag = <flag>
    toggle_menu_item_on id = <id>
  else
    toggle_menu_item_off id = <id>
  endif
endscript
script cheats_menu_check_level_lock
  GetTags
  if IntegerEquals a = All_Levels_Unlocked b = 1
    toggle_menu_item_on id = <id>
  else
    toggle_menu_item_off id = <id>
  endif
endscript
script cheats_menu_change_level_lock
  GetTags
  if IntegerEquals a = All_Levels_Unlocked b = 1
    toggle_menu_item_off id = <id>
    Change All_Levels_Unlocked = 0
  else
    if IntegerEquals a = All_Levels_Unlocked b = 0
      toggle_menu_item_on id = <id>
      Change All_Levels_Unlocked = 1
    endif
  endif
  pulse_item
endscript
script cheats_menu_check_cool_special
  GetTags
  if IntegerEquals a = COOL_SPECIAL_TRICKS b = 1
    toggle_menu_item_on id = <id>
  else
    toggle_menu_item_off id = <id>
  endif
endscript
script cheats_menu_change_cool_special
  GetTags
  if IntegerEquals a = COOL_SPECIAL_TRICKS b = 1
    toggle_menu_item_off id = <id>
    Change COOL_SPECIAL_TRICKS = 0
  else
    if IntegerEquals a = COOL_SPECIAL_TRICKS b = 0
      toggle_menu_item_on id = <id>
      Change COOL_SPECIAL_TRICKS = 1
    endif
  endif
  pulse_item
endscript
script cheats_menu_100_stat_points
  AwardStatPoint 100
  pulse_item
endscript
script cheats_menu_UnlockAllGoals
  GoalManager_UnlockAllGoals
  GoalManager_UnlockProSpecificChallenges
  pulse_item
endscript
script cheats_menu_score5mil
  skater:SetTrickName "You cheat like Kurt"
  skater:SetTrickScore 5000000
  skater:Display
endscript
script cheats_menu_turnPro
  GoalManager_TurnPro
endscript
script cheats_menu_UnBeatAllGoals
  GoalManager_UnBeatAllGoals
endscript
script cheats_menu_addgoalpoint
  GoalManager_AddGoalPoint
endscript
script cheats_menu_unlockProChallenges
  GoalManager_UnlockProSpecificChallenges
endscript
script cheats_menu_cash
  GoalManager_AddCash 5000
endscript
script cheats_menu_beat_current_goal
  if GoalManager_GetActiveGoalId
    exit_pause_menu
    GoalManager_WinGoal name = <goal_id>
  endif
endscript
current_soundtrack = #""
script launch_sound_options_menu
  if GotParam from_options
    RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_sound_options_menu callback_params = { from_options }
  else
    RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_sound_options_menu
  endif
endscript
script create_sound_options_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  make_new_skateshop_menu {
    internal_just = [ left center ]
    menu_id = sound_options_menu
    vmenu_id = sound_options_vmenu
    menu_title = "SOUND"
    helper_text = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
        { text = "\b6/\b5 = Adjust Levels" }
        { text = "\m1 = Back" }
        { text = "\m0 = Accept" }
      ]
    }
  }
  kill_start_key_binding
  delta_pos = (95, 25)
  if IsXBOX
    middle_repeat = 9
    blue_bar_pos = ( (230, 280) + <delta_pos> )
    goal_right_scale = (0.8, 0.75)
  else
    middle_repeat = 8
    blue_bar_pos = ( (230, 259) + <delta_pos> )
    goal_right_scale = (0.8, 0.68)
  endif
  GetStackedScreenElementPos x id = current_menu_anchor
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = sound_options_bg
    texture = options_bg
    draw_behind_parent
    pos = ( (232, 88) + <delta_pos> )
    scale = (1.17, 1.1)
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 2
  }
  GetStackedScreenElementPos x id = sound_options_bg
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_blue_bar
    texture = stats_notch
    pos = ( (230, 118) + <delta_pos> )
    rgba = [ 42 48 77 50 ]
    scale = (14, 0.2)
    just = [ center top ]
    z_priority = 5
  }
  GetStackedScreenElementPos x id = sound_options_bg
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_blue_bar2
    texture = stats_notch
    pos = <blue_bar_pos>
    rgba = [ 42 48 77 50 ]
    scale = (14, 0.2)
    just = [ center top ]
  }
  GetStackedScreenElementPos x id = sound_options_bg
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_box_top
    texture = level_top_piece
    pos = ( (230, 100) + <delta_pos> )
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
  }
  begin
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
    }
  repeat <middle_repeat>
  GetStackedScreenElementPos y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (0.96, 1)
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = main_menu_box_top offset = (-20, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    scale = <goal_right_scale>
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = sound_options_bg
  create_icon texture = PA_sound pos = ( (80, 88) + <delta_pos> )
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu
    texture = stats_notch
    rgba = [ 42 48 77 0 ]
    scale = (14, 0.2)
    not_focusable
  }
  if GotParam from_options
    SetScreenElementProps { id = sound_options_menu
      event_handlers = [
        { pad_back generic_menu_pad_back params = { callback = sound_options_exit from_options } }
      ]
    }
  else
    SetScreenElementProps { id = sound_options_menu
      event_handlers = [
        { pad_back generic_menu_pad_back params = { callback = sound_options_exit } }
      ]
    }
  endif
  if ( SongOrder = 0 )
    song_text = "Songs: Random"
  else
    song_text = "Songs: In Order"
  endif
  main_menu_add_item { text = <song_text>
    id = menu_song_order
    pad_choose_script = toggle_song_order
    highlight_bar_scale = (0.94, 1.3)
    highlight_bar_pos = (94, -7)
  }
  if IsDemo
    main_menu_add_item { text = "Skip Track"
      not_focusable = not_focusable
      id = menu_skip_track
      focus_script = skip_track_focus
      unfocus_script = skip_track_unfocus
      pad_choose_script = generic_menu_pad_choose
      pad_choose_params = { callback = skip_track }
      highlight_bar_scale = (0.94, 1.3)
      highlight_bar_pos = (94, -7)
    }
  else
    main_menu_add_item { text = "Skip Track"
      id = menu_skip_track
      focus_script = skip_track_focus
      unfocus_script = skip_track_unfocus
      pad_choose_script = generic_menu_pad_choose
      pad_choose_params = { callback = skip_track }
      highlight_bar_scale = (0.94, 1.3)
      highlight_bar_pos = (94, -7)
    }
  endif
  if GotParam from_options
    if IsXBOX
    endif
    if ( current_soundtrack = #"" )
      if IsDemo
        main_menu_add_item { text = "Playlist"
          id = menu_playlist
          not_focusable = not_focusable
          pad_choose_script = generic_menu_pad_choose
          pad_choose_params = { callback = create_playlist_menu from_options }
          highlight_bar_scale = (0.94, 1.3)
          highlight_bar_pos = (94, -7)
        }
      else
        main_menu_add_item { text = "Playlist"
          id = menu_playlist
          pad_choose_script = generic_menu_pad_choose
          pad_choose_params = { callback = create_playlist_menu from_options }
          highlight_bar_scale = (0.94, 1.3)
          highlight_bar_pos = (94, -7)
        }
      endif
    else
      main_menu_add_item { text = "Playlist"
        id = menu_playlist
        pad_choose_script = nullscript
        not_focusable = not_focusable
        highlight_bar_scale = (0.94, 1.3)
        highlight_bar_pos = (94, -7)
      }
    endif
  else
    if IsXBOX
    endif
    if ( current_soundtrack = #"" )
      if IsDemo
        main_menu_add_item { text = "Playlist"
          id = menu_playlist
          not_focusable = not_focusable
          pad_choose_script = generic_menu_pad_choose
          pad_choose_params = { callback = create_playlist_menu }
          highlight_bar_scale = (0.94, 1.3)
          highlight_bar_pos = (94, -7)
        }
      else
        main_menu_add_item { text = "Playlist"
          id = menu_playlist
          pad_choose_script = generic_menu_pad_choose
          pad_choose_params = { callback = create_playlist_menu }
          highlight_bar_scale = (0.94, 1.3)
          highlight_bar_pos = (94, -7)
        }
      endif
    else
      main_menu_add_item { text = "Playlist"
        id = menu_playlist
        pad_choose_script = nullscript
        not_focusable = not_focusable
        highlight_bar_scale = (0.94, 1.3)
        highlight_bar_pos = (94, -7)
      }
    endif
  endif
  main_menu_add_item { text = "Music Level:    "
    id = menu_music_level
    focus_script = menu_music_level_focus
    unfocus_script = menu_music_level_unfocus
    highlight_bar_scale = (0.94, 1.3)
    highlight_bar_pos = (94, -7)
    no_sound
  }
  main_menu_add_item { text = "Sound Level:    "
    id = menu_sound_level
    focus_script = menu_music_level_focus
    unfocus_script = menu_music_level_unfocus
    highlight_bar_scale = (0.94, 1.3)
    highlight_bar_pos = (94, -7)
    no_sound
  }
  if GotParam from_options
    main_menu_add_item text = "Done" id = menu_done pad_choose_script = sound_options_exit pad_choose_params = { from_options } highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (94, -7)
  else
    main_menu_add_item text = "Done" id = menu_done pad_choose_script = sound_options_exit highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (94, -7)
  endif
  sound_options_show_levels
  RunScriptOnScreenElement id = current_menu_anchor animate_in
  PauseMusic
endscript
script sound_options_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_ss_menu_textures_from_vram
  if GotParam just_remove
    return
  endif
  if GotParam from_options
    add_pause_menu_textures_to_vram
    PauseMusic 1
    create_options_menu
  else
    PauseMusic 0
    create_setup_options_menu
  endif
endscript
script sound_options_show_levels
  GetValueFromVolume cdvol
  FormatText TextName = cdvol "%v" v = <value>
  CreateScreenElement {
    type = TextElement
    parent = menu_music_level
    font = small
    just = [ center top ]
    pos = (188, -17)
    text = <cdvol>
    rgba = [ 88 105 112 128 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = menu_music_level
    texture = left_arrow
    rgba = [ 128 128 128 0 ]
    pos = (172, -17)
    just = [ right top ]
    scale = 0.75
  }
  CreateScreenElement {
    type = SpriteElement
    parent = menu_music_level
    texture = right_arrow
    rgba = [ 128 128 128 0 ]
    pos = (200, -17)
    just = [ left top ]
    scale = 0.75
  }
  GetValueFromVolume sfxvol
  FormatText TextName = sfxvol "%v" v = <value>
  CreateScreenElement {
    type = TextElement
    parent = menu_sound_level
    font = small
    just = [ center top ]
    pos = (188, -17)
    text = <sfxvol>
    rgba = [ 88 105 112 128 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = menu_sound_level
    texture = left_arrow
    rgba = [ 128 128 128 0 ]
    pos = (172, -17)
    just = [ right top ]
    scale = 0.75
  }
  CreateScreenElement {
    type = SpriteElement
    parent = menu_sound_level
    texture = right_arrow
    rgba = [ 128 128 128 0 ]
    pos = (200, -17)
    just = [ left top ]
    scale = 0.75
  }
  SetScreenElementProps {
    id = menu_music_level
    event_handlers = [ { pad_left menu_turn_music_down }
      { pad_right menu_turn_music_up }
    ]
    replace_handlers
  }
  SetScreenElementProps {
    id = menu_sound_level
    event_handlers = [ { pad_left menu_turn_sound_down }
      { pad_right menu_turn_sound_up }
    ]
    replace_handlers
  }
endscript
script create_sound_options_mini_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  if GotParam song_order
    title = "SONG ORDER"
  endif
  if GotParam music_or_ambience
    title = "SOUND MODE"
  endif
  make_new_skateshop_menu {
    internal_just = [ left center ]
    menu_id = sound_options_mini_menu
    vmenu_id = sound_options_mini_vmenu
    menu_title = <title>
    helper_text = generic_helper_text
  }
  kill_start_key_binding
  if GotParam from_options
    SetScreenElementProps { id = sound_options_mini_menu
      event_handlers = [
        { pad_back generic_menu_pad_back params = { callback = create_sound_options_menu from_options } }
      ]
    }
  else
    SetScreenElementProps { id = sound_options_mini_menu
      event_handlers = [
        { pad_back generic_menu_pad_back params = { callback = create_sound_options_menu } }
      ]
    }
  endif
  delta_pos = (100, 30)
  GetStackedScreenElementPos x id = current_menu_anchor
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = sound_options_bg
    texture = options_bg
    draw_behind_parent
    pos = ( (232, 85) + <delta_pos> )
    scale = (1.17, 1.1)
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 3
  }
  GetStackedScreenElementPos x id = sound_options_bg
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_blue_bar2
    texture = stats_notch
    pos = ( (228, 194) + <delta_pos> )
    rgba = [ 42 48 77 50 ]
    scale = (14, 0.2)
    just = [ center top ]
  }
  GetStackedScreenElementPos x id = sound_options_bg
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_box_top
    texture = level_top_piece
    pos = ( (230, 100) + <delta_pos> )
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
  }
  begin
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
    }
  repeat 4
  GetStackedScreenElementPos y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (0.96, 0.6)
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = main_menu_box_top offset = (-20, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    scale = (0.8, 0.412)
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = sound_options_bg
  create_icon texture = PA_sound pos = ( (80, 85) + <delta_pos> )
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu
    texture = stats_notch
    rgba = [ 42 48 77 0 ]
    scale = (14, 0.2)
    not_focusable
  }
  if GotParam from_options
    if GotParam song_order
      main_menu_add_item { text = "In Order"
        id = menu_in_order
        pad_choose_script = generic_menu_pad_choose
        pad_choose_params = { callback = sound_mini_menu_select choice = inorder from_options }
      }
      main_menu_add_item { text = "Random"
        id = menu_random
        pad_choose_script = generic_menu_pad_choose
        pad_choose_params = { callback = sound_mini_menu_select choice = randomly from_options }
      }
    endif
    if GotParam music_or_ambience
      main_menu_add_item { text = "Music"
        id = menu_music
        pad_choose_script = generic_menu_pad_choose
        pad_choose_params = { callback = sound_mini_menu_select choice = music from_options }
      }
      main_menu_add_item { text = "Ambience"
        id = menu_ambience
        pad_choose_script = generic_menu_pad_choose
        pad_choose_params = { callback = sound_mini_menu_select choice = ambience from_options }
      }
    endif
    main_menu_add_item text = "Done" id = menu_done pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_sound_options_menu from_options }
  else
    if GotParam song_order
      main_menu_add_item { text = "In Order"
        id = menu_in_order
        pad_choose_script = generic_menu_pad_choose
        pad_choose_params = { callback = sound_mini_menu_select choice = inorder }
      }
      main_menu_add_item { text = "Random"
        id = menu_random
        pad_choose_script = generic_menu_pad_choose
        pad_choose_params = { callback = sound_mini_menu_select choice = randomly }
      }
    endif
    if GotParam music_or_ambience
      main_menu_add_item { text = "Music"
        id = menu_music
        pad_choose_script = generic_menu_pad_choose
        pad_choose_params = { callback = sound_mini_menu_select choice = music }
      }
      main_menu_add_item { text = "Ambience"
        id = menu_ambience
        pad_choose_script = generic_menu_pad_choose
        pad_choose_params = { callback = sound_mini_menu_select choice = ambience }
      }
    endif
    main_menu_add_item text = "Done" id = menu_done pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_sound_options_menu }
  endif
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script sound_mini_menu_select
  switch <choice>
  case inorder
    PlaySongsInOrder
  case randomly
    PlaySongsRandomly
  case music
    SetCDToMusic
  case ambience
    SetCDToAmbience
  endswitch
  if GotParam from_options
    create_sound_options_menu from_options
  else
    create_sound_options_menu
  endif
endscript
SongOrder = 0
script toggle_song_order
  if ( SongOrder = 1 )
    SetScreenElementProps id = { menu_song_order child = 0 } text = "Songs: Random"
    PlaySongsRandomly
    Change SongOrder = 0
  else
    SetScreenElementProps id = { menu_song_order child = 0 } text = "Songs: In Order"
    PlaySongsInOrder
    Change SongOrder = 1
  endif
endscript
script create_playlist_menu
  if not CD
    if not ( TestMusicFromHost = 1 )
      return
    endif
  endif
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_pause_menu_textures_from_vram
  add_gap_menu_textures_to_vram
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = playlist_menu
    dims = (640, 480)
    pos = (320, 240)
  }
  AssignAlias id = playlist_menu alias = current_menu_anchor
  create_helper_text { helper_text_elements = [ { text = "\b7/\b4 = Select" }
      { text = "\m1 = Back" }
      { text = "\b3 = Toggle" }
      { text = "\me = Preview Track" }
    ]
  }
  kill_start_key_binding
  set_sub_bg_goal goal_mid_scale = (19, 1.33) pos = (180, 23)
  create_icon texture = PA_sound pos = (33, 23)
   <root_pos> = (80, 25)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "PLAYLIST"
    rgba = [ 128 128 128 85 ]
    pos = <root_pos>
    just = [ left top ]
    scale = 1.35
  }
  GetStackedScreenElementPos y id = <id> offset = (-15, -4)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = view_gaps_menu_top_bar
    texture = black
    rgba = [ 0 0 0 85 ]
    scale = (124, 7)
    pos = <pos>
    just = [ left top ]
    z_priority = 2
  }
  GetStackedScreenElementPos x id = view_gaps_menu_top_bar offset = (-260, 5)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = view_gaps_menu_up_arrow
    texture = up_arrow
    rgba = [ 128 128 128 85 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 3
  }
  GetStackedScreenElementPos x id = view_gaps_menu_top_bar offset = (-60, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    scale = (2, 78)
    pos = <pos>
    just = [ left top ]
    rgba = [ 0 0 0 80 ]
    z_priority = 5
  }
  GetStackedScreenElementPos y id = view_gaps_menu_top_bar offset = (0, 285)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    rgba = [ 0 0 0 105 ]
    scale = (124, 6)
    pos = <pos>
    just = [ left top ]
    z_priority = 2
  }
  GetStackedScreenElementPos y id = view_gaps_menu_up_arrow offset = (0, 300)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = view_gaps_menu_down_arrow
    texture = down_arrow
    rgba = [ 128 128 128 85 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 3
  }
  GetStackedScreenElementPos y id = view_gaps_menu_top_bar offset = (20, 5)
  CreateScreenElement {
    type = VScrollingMenu
    parent = current_menu_anchor
    dims = (640, 280)
    pos = <pos>
    just = [ left top ]
    internal_just = [ center top ]
  }
   <callback> = exit_playlist_menu
  CreateScreenElement {
    type = VMenu
    parent = <id>
    id = gap_vmenu
    pos = (0, 0)
    just = [ left top ]
    internal_just = [ left top ]
    dont_allow_wrap
    event_handlers = [
      { pad_up set_which_arrow params = { arrow = view_gaps_menu_up_arrow } }
      { pad_down set_which_arrow params = { arrow = view_gaps_menu_down_arrow } }
      { pad_back generic_menu_pad_back params = { <...> } }
      { pad_up generic_menu_up_or_down_sound params = { Up } }
      { pad_down generic_menu_up_or_down_sound params = { Down } }
      { pad_back generic_menu_pad_back_sound }
    ]
  }
  AssignAlias id = gap_vmenu alias = current_menu
  kill_start_key_binding
  add_tracks_to_menu
  PrintStruct <...>
  RunScriptOnScreenElement id = current_menu_anchor animate_in params = { menu_id = current_menu }
endscript
script exit_playlist_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_gap_menu_textures_from_vram
  if GotParam from_options
    create_sound_options_menu from_options
  else
    create_sound_options_menu
  endif
endscript
script create_soundtrack_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  scale = (1.75, 1)
  GetNumSoundtracks
  if ( <numsoundtracks> = 0 )
    empty = 1
  else
    empty = 0
  endif
  if ( 9 > <numsoundtracks> )
    middle_repeat = ( ( ( <numsoundtracks> * 3 ) / 2 ) + 2 )
    menu_pos = (230, 110)
    switch <numsoundtracks>
    case 0
      box_right_scale = (0.8, 0.29)
    case 1
      middle_repeat = 5
      box_right_scale = (0.8, 0.475)
    case 2
      box_right_scale = (0.8, 0.475)
    case 3
      box_right_scale = (0.8, 0.535)
    case 4
      box_right_scale = (0.8, 0.66)
    case 5
      box_right_scale = (0.8, 0.72)
    case 6
      box_right_scale = (0.8, 0.845)
    case 7
      box_right_scale = (0.8, 0.905)
    case 8
      box_right_scale = (0.8, 1.04)
    endswitch
  else
    middle_repeat = 16
    menu_pos = (230, 125)
    box_right_scale = (0.8, 1.16)
  endif
  make_new_skateshop_menu {
    internal_just = [ left top ]
    menu_id = soundtrack_menu
    vmenu_id = soundtrack_vmenu
    type = VScrollingMenu
    pos = <menu_pos>
    dims = (300, 252)
    just = [ center top ]
    dont_allow_wrap = dont_allow_wrap
    helper_text = generic_helper_text
  }
  kill_start_key_binding
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "SOUNDTRACKS"
    scale = 1.4
    pos = (135, 80)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
    z_priority = 5
  }
  if ( <numsoundtracks> > 9 )
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      id = soundtrack_up_arrow
      texture = up_arrow
      pos = (320, 105)
      just = [ center top ]
      rgba = [ 128 128 128 128 ]
      z_priority = 3
    }
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      id = soundtrack_down_arrow
      texture = down_arrow
      pos = (320, 372)
      just = [ center top ]
      rgba = [ 128 128 128 128 ]
      z_priority = 3
    }
  endif
  if GotParam from_options
    SetScreenElementProps { id = soundtrack_menu
      event_handlers = [
        { pad_back generic_menu_pad_back params = { callback = create_sound_options_menu from_options } }
      ]
    }
  else
    SetScreenElementProps { id = soundtrack_menu
      event_handlers = [
        { pad_back generic_menu_pad_back params = { callback = create_sound_options_menu } }
      ]
    }
  endif
  delta_pos = (100, 0)
  GetStackedScreenElementPos x id = current_menu_anchor
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = sound_options_bg
    texture = options_bg
    draw_behind_parent
    pos = ( (228, 75) + <delta_pos> )
    scale = (2, 1.1)
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 3
  }
  GetStackedScreenElementPos x id = sound_options_bg
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_box_top
    texture = level_top_piece
    pos = ( (230, 90) + <delta_pos> )
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
  }
  begin
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
    }
  repeat <middle_repeat>
  GetStackedScreenElementPos y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (1.7, 0.6)
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = main_menu_box_top offset = (-25, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    scale = <box_right_scale>
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
  }
  create_icon texture = PA_sound pos = ( (-15, 75) + <delta_pos> )
  main_menu_add_item { text = "THPS4 Playlist"
    focus_script = soundtrack_focus
    pad_choose_script = generic_menu_pad_choose
    pad_choose_params = { callback = SetSoundtrack track = "" }
    highlight_bar_scale = (1.625, 1.3)
  }
  if not ( <empty> = 1 )
    index = 0
    begin
      GetSoundtrackName <index>
      main_menu_add_item { text = <soundtrackname>
        focus_script = soundtrack_focus
        pad_choose_script = generic_menu_pad_choose
        pad_choose_params = { callback = SetSoundtrack track = <soundtrackname> }
        highlight_bar_scale = (1.625, 1.3)
        max_width = 380
      }
       <index> = ( <index> + 1 )
    repeat <numsoundtracks>
  endif
  if GotParam from_options
    main_menu_add_item text = "Done" id = menu_done focus_script = soundtrack_focus pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_sound_options_menu from_options } highlight_bar_scale = (1.625, 1.3)
  else
    main_menu_add_item text = "Done" id = menu_done focus_script = soundtrack_focus pad_choose_script = generic_menu_pad_choose pad_choose_params = { callback = create_sound_options_menu } highlight_bar_scale = (1.625, 1.3)
  endif
  if ObjectExists id = soundtrack_up_arrow
    SetScreenElementProps { id = soundtrack_vmenu
      event_handlers = [
        { pad_down menu_vert_blink_arrow params = { id = soundtrack_down_arrow } }
        { pad_up menu_vert_blink_arrow params = { id = soundtrack_up_arrow } }
      ]
    }
  endif
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script GetSoundtracks
  GetNumSoundtracks
  index = 0
  begin
    GetSoundtrackName <index>
    soundtracks [ <index> ] = <soundtrackname>
  repeat <numsoundtracks>
  return soundtracks
endscript
script SetSoundtrack
  if IsPS2
    return
  endif
  FormatText ChecksumName = trackchecksum "%t" t = <track>
  Printf "soundtrack = %i" i = <trackchecksum>
  generic_menu_pad_choose
  SoundtrackExists trackname = <track>
  Printf "soundtrack index = %i" i = <index>
  if not ( current_soundtrack = <trackchecksum> )
    StopMusic
  endif
  if ( <index> = -1 )
    Printf "use playlist"
    UseStandardSoundtrack
  else
    Printf "use soundtrack"
    UseUserSoundtrack <index>
  endif
  Change current_soundtrack = <trackchecksum>
  if LevelIs load_skateshop
    create_sound_options_menu
  else
    create_sound_options_menu from_options
  endif
endscript
script SoundtrackExists trackname = ""
  Printf "trackname = %t" t = <trackname>
  FormatText ChecksumName = tracknamesum "%t" t = <trackname>
  GetNumSoundtracks
  if not ( <numsoundtracks> = 0 )
    index = 0
    begin
      GetSoundtrackName <index>
      Printf "soundtrackname = %t" t = <soundtrackname>
      FormatText ChecksumName = soundtracksum "%s" s = <soundtrackname>
      if ( <tracknamesum> = <soundtracksum> )
        return { index = <index> }
      endif
      index = ( <index> + 1 )
    repeat <numsoundtracks>
  endif
  return { index = -1 }
endscript
script set_loaded_soundtrack
  Printf "set_loaded_soundtrack"
  if not IsXBOX
    return
  endif
  current_soundtrack_exists
  if not ( current_soundtrack = #"" )
    StopMusic
  endif
  if ( <index> = -1 )
    Printf "use playlist"
    UseStandardSoundtrack
  else
    Printf "use soundtrack %i" i = <index>
    UseUserSoundtrack <index>
  endif
endscript
script current_soundtrack_exists
  GetNumSoundtracks
  if not ( <numsoundtracks> = 0 )
    index = 0
    begin
      GetSoundtrackName <index>
      FormatText ChecksumName = soundtracksum "%s" s = <soundtrackname>
      if ( current_soundtrack = <soundtracksum> )
        return { index = <index> }
      endif
      index = ( <index> + 1 )
    repeat <numsoundtracks>
  endif
  return { index = -1 }
endscript
script soundtrack_focus
  if ObjectExists id = soundtrack_up_arrow
    generic_menu_update_arrows menu_id = soundtrack_vmenu up_arrow_id = soundtrack_up_arrow down_arrow_id = soundtrack_down_arrow
  endif
  main_menu_focus
endscript
script add_tracks_to_menu
  if IsTrue Xbox
  endif
  GetArraySize playlist_tracks
  index = 0
  begin
    playlist_menu_add_item { index = <index> }
     <index> = ( <index> + 1 )
  repeat <array_size>
endscript
script playlist_menu_add_item highlight_bar_scale = (1.9, 1) highlight_bar_pos = (227, 7)
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    dims = (200, 20)
    event_handlers = [ { focus playlist_menu_focus params = <focus_params> }
      { unfocus playlist_menu_unfocus }
      { pad_choose change_track_state params = { index = <index> } }
      { pad_choose generic_menu_pad_choose_sound }
      { pad_start change_track_state params = { index = <index> } }
      { pad_start generic_menu_pad_choose_sound }
      { pad_option preview_music_track params = { index = <index> } }
    ]
  }
   <anchor_id> = <id>
  track_title = ( ( playlist_tracks [ <index> ] ).track_title )
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    text = <track_title>
    pos = (-5, 0)
    just = [ left top ]
    rgba = [ 88 105 112 128 ]
    scale = 0.7
  }
  if TrackEnabled <index>
    on_or_off = "on"
  else
    on_or_off = "off"
  endif
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    text = <on_or_off>
    pos = (444, 0)
    just = [ center top ]
    rgba = [ 88 105 112 128 ]
    scale = 0.7
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
endscript
script change_track_state
  GetTags
  if TrackEnabled <index>
    ChangeTrackState <index> off
    PauseMusic 1
    SetScreenElementProps id = { <id> child = 1 } text = "off"
  else
    ChangeTrackState <index> on
    SetScreenElementProps id = { <id> child = 1 } text = "on"
  endif
endscript
script preview_music_track
  GetTags
  if not TrackEnabled <index>
    ChangeTrackState <index> on
    SetScreenElementProps id = { <id> child = 1 } text = "on"
  endif
  if MusicIsPaused
    PauseMusic 0
    StopMusic
    Wait 0.5 second
    GetValueFromVolume cdvol
    if ( <value> = 0 )
      SetCDToMusic
      SetMusicVolume 50
    endif
    PlayTrack <index>
  else
    PauseMusic 1
  endif
endscript
script playlist_menu_focus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  SetScreenElementProps { id = { <id> child = 1 } rgba = [ 128 118 0 128 ] }
  SetScreenElementProps { id = { <id> child = 2 } rgba = [ 128 128 128 50 ] }
  gap_vmenu:GetTags
  if GotParam arrow_id
    menu_vert_blink_arrow { id = <arrow_id> }
  endif
  generic_menu_update_arrows menu_id = gap_vmenu up_arrow_id = view_gaps_menu_up_arrow down_arrow_id = view_gaps_menu_down_arrow
endscript
script playlist_menu_unfocus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down
  RunScriptOnScreenElement id = { <id> child = 1 } do_scale_down
  SetScreenElementProps { id = { <id> child = 2 } rgba = [ 128 128 128 0 ] }
  PauseMusic 1
endscript
script menu_music_level_focus
  PauseMusic 0
  menu_sound_level_focus { music_level <...> }
endscript
script menu_music_level_unfocus
  menu_sound_level_unfocus <...>
  PauseMusic 1
endscript
script skip_track_focus
  PauseMusic 0
  main_menu_focus <...>
endscript
script skip_track_unfocus
  main_menu_unfocus <...>
  PauseMusic 1
endscript
script menu_sound_level_focus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  RunScriptOnScreenElement id = { <id> child = 2 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  SetScreenElementProps { id = { <id> child = 1 } rgba = [ 128 128 128 50 ] }
  if GotParam music_level
    GetValueFromVolume cdvol
  else
    GetValueFromVolume sfxvol
  endif
  if ( <value> = 0 )
    SetScreenElementProps { id = { <id> child = 3 } rgba = [ 128 128 128 0 ] }
  else
    SetScreenElementProps { id = { <id> child = 3 } rgba = [ 128 128 128 85 ] }
  endif
  if ( <value> = 10 )
    SetScreenElementProps { id = { <id> child = 4 } rgba = [ 128 128 128 0 ] }
  else
    SetScreenElementProps { id = { <id> child = 4 } rgba = [ 128 128 128 85 ] }
  endif
endscript
script menu_sound_level_unfocus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down
  RunScriptOnScreenElement id = { <id> child = 2 } do_scale_down
  SetScreenElementProps { id = { <id> child = 1 } rgba = [ 128 128 128 0 ] }
  SetScreenElementProps { id = { <id> child = 3 } rgba = [ 128 128 128 0 ] }
  SetScreenElementProps { id = { <id> child = 4 } rgba = [ 128 128 128 0 ] }
endscript
script menu_turn_music_down
  GetTags
  GetValueFromVolume cdvol
  if ( <value> > 0 )
    SetScreenElementProps id = { <id> child = 4 } rgba = [ 128 128 128 128 ]
     <value> = ( <value> - 1 )
    sound_options_set_level level = <value> id = menu_music_level type = cdvol
    menu_horiz_blink_arrow arrow_id = { <id> child = 3 }
  endif
  if ( <value> = 0 )
    SetScreenElementProps id = { <id> child = 3 } rgba = [ 128 128 128 0 ]
    SetCDToAmbience
    Printf "SetCDToAmbience"
  endif
endscript
script menu_turn_music_up
  GetTags
  GetValueFromVolume cdvol
  if ( <value> < 10 )
    SetScreenElementProps id = { <id> child = 3 } rgba = [ 128 128 128 128 ]
     <value> = ( <value> + 1 )
    sound_options_set_level level = <value> id = menu_music_level type = cdvol
    menu_horiz_blink_arrow arrow_id = { <id> child = 4 }
  endif
  if ( <value> = 10 )
    SetScreenElementProps id = { <id> child = 4 } rgba = [ 128 128 128 0 ]
  endif
  if ( <value> = 1 )
    SetCDToMusic
    Printf "SetCDToMusic"
  endif
endscript
script menu_turn_sound_down
  GetTags
  GetValueFromVolume sfxvol
  if ( <value> > 0 )
    SetScreenElementProps id = { <id> child = 4 } rgba = [ 128 128 128 128 ]
     <value> = ( <value> - 1 )
    sound_options_set_level level = <value> id = menu_sound_level type = sfxvol
    menu_horiz_blink_arrow arrow_id = { <id> child = 3 }
    PlaySound ollieconc vol = 70
  endif
  if ( <value> = 0 )
    SetScreenElementProps id = { <id> child = 3 } rgba = [ 128 128 128 0 ]
  endif
endscript
script menu_turn_sound_up
  GetTags
  GetValueFromVolume sfxvol
  if ( <value> < 10 )
    SetScreenElementProps id = { <id> child = 3 } rgba = [ 128 128 128 128 ]
     <value> = ( <value> + 1 )
    sound_options_set_level level = <value> id = menu_sound_level type = sfxvol
    menu_horiz_blink_arrow arrow_id = { <id> child = 4 }
    PlaySound ollieconc vol = 70
  endif
  if ( <value> = 10 )
    SetScreenElementProps id = { <id> child = 4 } rgba = [ 128 128 128 0 ]
  endif
endscript
script sound_options_set_level
  FormatText TextName = vol "%v" v = <level>
  SetScreenElementProps {
    id = { <id> child = 2 }
    text = <vol>
  }
   <level> = ( <level> * 10 )
  switch <type>
  case cdvol
    SetMusicVolume <level>
  case sfxvol
    SetSfxVolume <level>
  endswitch
endscript
script focus_skip_track
  do_scale_up
  PauseMusic 0
endscript
script unfocus_skip_track
  do_scale_down
  PauseMusic 1
endscript
script skip_track
  skiptrack
  pulse_item
endscript
script pulse_item
  DoMorph time = 0.05 scale = 0.9
  DoMorph time = 0.05 scale = 1.0
endscript
script change_music_mode
  DoMorph time = 0.1 scale = 0.9
  DoMorph time = 0.1 scale = 1.2
  DoMorph time = 0.1 scale = 1
  if IsTrue ALWAYSPLAYMUSIC
    Change ALWAYSPLAYMUSIC = 0
    SetScreenElementProps text = "Music Mode: Goals Only" id = menu_change_musicmode
  else
    Change ALWAYSPLAYMUSIC = 1
    SetScreenElementProps text = "Music Mode: Always On" id = menu_change_musicmode
  endif
endscript
script create_controller_config_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  if GotParam controller_number
    FormatText TextName = menu_title "PLAYER %n" n = <controller_number>
    helper_text = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
        { text = "\b6/\b5 = Adjust" }
        { text = "\m1 = Back" }
        { text = "\m0 = Accept" }
      ]
    }
  else
    menu_title = "CONTROL SETUP"
    helper_text = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
        { text = "\m1 = Back" }
        { text = "\m0 = Accept" }
      ]
    }
  endif
  make_new_skateshop_menu {
    internal_just = [ left center ]
    menu_id = sound_options_menu
    vmenu_id = sound_options_vmenu
    menu_title = <menu_title>
    helper_text = <helper_text>
  }
  kill_start_key_binding
  delta_pos = (100, 25)
  if GotParam controller_number
    middle_repeat = 4
    box_right_scale = (0.8, 0.435)
  else
    if IsXBOX
      middle_repeat = 6
      box_right_scale = (0.8, 0.555)
    else
      middle_repeat = 3
      box_right_scale = (0.8, 0.375)
    endif
  endif
  GetStackedScreenElementPos x id = current_menu_anchor
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = sound_options_bg
    texture = options_bg
    draw_behind_parent
    pos = ( (232, 88) + <delta_pos> )
    scale = (1.17, 1.1)
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 2
  }
  GetStackedScreenElementPos x id = sound_options_bg
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_box_top
    texture = level_top_piece
    pos = ( (230, 100) + <delta_pos> )
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
  }
  begin
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
    }
  repeat <middle_repeat>
  GetStackedScreenElementPos y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (0.96, 1)
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = main_menu_box_top offset = (-20, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    scale = <box_right_scale>
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = sound_options_bg
  create_icon texture = PA_controls pos = ( (80, 88) + <delta_pos> )
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu
    texture = stats_notch
    rgba = [ 42 48 77 0 ]
    scale = (14, 0.2)
    not_focusable
  }
  if IsNGC
     <vibration_text> = "Rumble"
  else
     <vibration_text> = "Vibration  "
  endif
  if GotParam controller_number
    SetScreenElementProps { id = sound_options_menu
      event_handlers = [
        { pad_back generic_menu_pad_back params = { callback = create_controller_config_menu } }
      ]
    }
    main_menu_add_item { text = <vibration_text>
      id = menu_vibration
      focus_script = controller_config_focus
      unfocus_script = controller_config_unfocus
      pad_choose_script = nullscript
    }
    main_menu_add_item { text = "Autokick "
      id = menu_autokick
      focus_script = controller_config_focus
      unfocus_script = controller_config_unfocus
      pad_choose_script = nullscript
    }
    main_menu_add_item { text = "180 Spin Taps      "
      id = menu_spintaps
      focus_script = controller_config_focus
      unfocus_script = controller_config_unfocus
      pad_choose_script = nullscript
    }
    main_menu_add_item { text = "Done"
      id = menu_done
      pad_choose_script = generic_menu_pad_choose
      pad_choose_params = { callback = create_controller_config_menu }
    }
    control_config_show_values controller_number = <controller_number>
  else
    SetScreenElementProps { id = sound_options_menu
      event_handlers = [
        { pad_back generic_menu_pad_back params = { callback = controller_config_exit } }
      ]
    }
    main_menu_add_item { text = "Player 1"
      id = menu_controller_1
      pad_choose_script = generic_menu_pad_choose
      pad_choose_params = { callback = create_controller_config_menu controller_number = 1 }
    }
    if not IsDemo
      main_menu_add_item { text = "Player 2"
        id = menu_controller_2
        pad_choose_script = generic_menu_pad_choose
        pad_choose_params = { callback = create_controller_config_menu controller_number = 2 }
      }
    endif
    main_menu_add_item { text = "Done"
      id = menu_done
      pad_choose_script = generic_menu_pad_choose
      pad_choose_params = { callback = controller_config_exit }
    }
  endif
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script controller_config_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_ss_menu_textures_from_vram
  if GotParam from_options
    add_pause_menu_textures_to_vram
    create_options_menu
  else
    create_setup_options_menu
  endif
endscript
script control_change_values
  player = ( <controller_number> - 1 )
  if GotParam vibration
    KillSpawnedScript name = control_menu_vibrate_controller
    VibrateController port = <player> actuator = 1 percent = 0
    if VibrationIsOn <player>
      VibrationOff <player>
      SetScreenElementProps id = menu_vibration_value text = "off"
    else
      VibrationOn <player> pulse
      SetScreenElementProps id = menu_vibration_value text = "on"
      SpawnScript control_menu_vibrate_controller params = <...>
    endif
  endif
  if GotParam autokick
    if AutoKickIsOn <player>
      AutoKickOff <player>
      SetScreenElementProps id = menu_autokick_value text = "off"
    else
      AutoKickOn <player>
      SetScreenElementProps id = menu_autokick_value text = "on"
    endif
  endif
  if GotParam spintaps
    if SpinTapsAreOn <player>
      SpinTapsOff <player>
      SetScreenElementProps id = menu_spintaps_value text = "off"
    else
      SpinTapsOn <player>
      SetScreenElementProps id = menu_spintaps_value text = "on"
    endif
  endif
  GetTags
  if GotParam left
    RunScriptOnScreenElement id = { <id> child = 3 } menu_blink_arrow
  else
    RunScriptOnScreenElement id = { <id> child = 4 } menu_blink_arrow
  endif
  generic_menu_pad_choose_sound
endscript
script control_menu_vibrate_controller
  VibrateController port = <player> actuator = 1 percent = 70
  Wait 250
  VibrateController port = <player> actuator = 1 percent = 0
endscript
script control_config_show_values
  player = ( <controller_number> - 1 )
  if VibrationIsOn <player>
    vibration_value = "on"
  else
    vibration_value = "off"
  endif
  if AutoKickIsOn <player>
    autokick_value = "on"
  else
    autokick_value = "off"
  endif
  if SpinTapsAreOn <player>
    spintaps_value = "on"
  else
    spintaps_value = "off"
  endif
  CreateScreenElement {
    type = TextElement
    parent = menu_vibration
    id = menu_vibration_value
    font = small
    just = [ center top ]
    pos = (183, -17)
    text = <vibration_value>
    rgba = [ 88 105 112 128 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = menu_vibration
    texture = left_arrow
    rgba = [ 128 128 128 0 ]
    pos = (162, -17)
    just = [ right top ]
    scale = 0.75
  }
  CreateScreenElement {
    type = SpriteElement
    parent = menu_vibration
    texture = right_arrow
    rgba = [ 128 128 128 0 ]
    pos = (200, -17)
    just = [ left top ]
    scale = 0.75
  }
  CreateScreenElement {
    type = TextElement
    parent = menu_autokick
    id = menu_autokick_value
    font = small
    just = [ center top ]
    pos = (183, -17)
    text = <autokick_value>
    rgba = [ 88 105 112 128 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = menu_autokick
    texture = left_arrow
    rgba = [ 128 128 128 0 ]
    pos = (162, -17)
    just = [ right top ]
    scale = 0.75
  }
  CreateScreenElement {
    type = SpriteElement
    parent = menu_autokick
    texture = right_arrow
    rgba = [ 128 128 128 0 ]
    pos = (200, -17)
    just = [ left top ]
    scale = 0.75
  }
  CreateScreenElement {
    type = TextElement
    parent = menu_spintaps
    id = menu_spintaps_value
    font = small
    just = [ center top ]
    pos = (183, -17)
    text = <spintaps_value>
    rgba = [ 88 105 112 128 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = menu_spintaps
    texture = left_arrow
    rgba = [ 128 128 128 0 ]
    pos = (162, -17)
    just = [ right top ]
    scale = 0.75
  }
  CreateScreenElement {
    type = SpriteElement
    parent = menu_spintaps
    texture = right_arrow
    rgba = [ 128 128 128 0 ]
    pos = (200, -17)
    just = [ left top ]
    scale = 0.75
  }
  SetScreenElementProps {
    id = menu_vibration
    event_handlers = [ { pad_left control_change_values params = { vibration controller_number = <controller_number> left } }
      { pad_right control_change_values params = { vibration controller_number = <controller_number> } }
    ]
    replace_handlers
  }
  SetScreenElementProps {
    id = menu_autokick
    event_handlers = [ { pad_left control_change_values params = { autokick controller_number = <controller_number> left } }
      { pad_right control_change_values params = { autokick controller_number = <controller_number> } }
    ]
    replace_handlers
  }
  SetScreenElementProps {
    id = menu_spintaps
    event_handlers = [ { pad_left control_change_values params = { spintaps controller_number = <controller_number> left } }
      { pad_right control_change_values params = { spintaps controller_number = <controller_number> } }
    ]
    replace_handlers
  }
endscript
script controller_config_focus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  RunScriptOnScreenElement id = { <id> child = 2 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  SetScreenElementProps { id = { <id> child = 1 } rgba = [ 128 128 128 50 ] }
  SetScreenElementProps { id = { <id> child = 3 } rgba = [ 128 128 128 85 ] }
  SetScreenElementProps { id = { <id> child = 4 } rgba = [ 128 128 128 85 ] }
endscript
script controller_config_unfocus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down
  RunScriptOnScreenElement id = { <id> child = 2 } do_scale_down
  SetScreenElementProps { id = { <id> child = 1 } rgba = [ 128 128 128 0 ] }
  SetScreenElementProps { id = { <id> child = 3 } rgba = [ 128 128 128 0 ] }
  SetScreenElementProps { id = { <id> child = 4 } rgba = [ 128 128 128 0 ] }
endscript
script create_movies_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  pulse_blur
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  make_new_skateshop_menu {
    internal_just = [ left center ]
    menu_id = movies_menu
    vmenu_id = movies_vmenu
    type = VScrollingMenu
    dims = (300, 298)
    menu_title = "MOVIES"
    pos = (230, 82)
    scrolling_menu_id = movies_scrolling_vmenu
    dont_allow_wrap = dont_allow_wrap
    helper_text = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
        { text = "\m1 = Back" }
        { text = "\m0 = Accept" }
      ]
    }
  }
  kill_start_key_binding
  delta_pos = (100, -56)
  middle_repeat = 19
  box_right_scale = (0.8, 1.37)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "MOVIES"
    scale = 1.4
    pos = (230, 35)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  GetStackedScreenElementPos x id = current_menu_anchor
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = movies_bg
    texture = options_bg
    draw_behind_parent
    pos = ( (232, 88) + <delta_pos> )
    scale = (1.17, 1.1)
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 2
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = movie_up_arrow
    texture = up_arrow
    pos = ( (227, 118) + <delta_pos> )
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 4
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = movie_down_arrow
    texture = down_arrow
    pos = ( (227, 432) + <delta_pos> )
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 4
  }
  GetStackedScreenElementPos x id = movies_bg
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_box_top
    texture = level_top_piece
    pos = ( (230, 100) + <delta_pos> )
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
  }
  begin
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
    }
  repeat <middle_repeat>
  GetStackedScreenElementPos y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (0.96, 1)
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = main_menu_box_top offset = (-20, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    scale = <box_right_scale>
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = movies_bg
  create_icon texture = PA_movie pos = ( (80, 88) + <delta_pos> ) z_priority = 4
  SetScreenElementProps { id = movies_menu
    event_handlers = [
      { pad_back generic_menu_pad_back params = { callback = controller_config_exit } }
    ]
  }
  SetScreenElementProps { id = movies_vmenu
    event_handlers = [
      { pad_down menu_vert_blink_arrow params = { id = movie_down_arrow } }
      { pad_up menu_vert_blink_arrow params = { id = movie_up_arrow } }
    ]
  }
  GetArraySize movie_info
  index = 0
  begin
    if GetGlobalFlag flag = ( ( movie_info [ <index> ] ).flag )
      main_menu_add_item { text = ( ( movie_info [ <index> ] ).name )
        pad_choose_script = movie_menu_play_movie
        pad_choose_params = { movie_file = ( ( movie_info [ <index> ] ).file ) }
        focus_script = movie_menu_focus
      }
    else
      main_menu_add_item { text = ( ( movie_info [ <index> ] ).name )
        pad_choose_script = nullscript
        not_focusable = not_focusable
      }
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
  main_menu_add_item { text = "Done"
    id = menu_done
    pad_choose_script = generic_menu_pad_choose
    pad_choose_params = { callback = controller_config_exit }
    focus_script = movie_menu_focus
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = movie_black_box
    texture = black
    pos = (320, 240)
    rgba = [ 0 0 0 128 ]
    scale = (0, 0)
    just = [ center center ]
    z_priority = 5
  }
  KillSkaterCamAnim all
  PlaySkaterCamAnim name = SS_menucam_movies play_hold
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script movie_menu_play_movie
  if ObjectExists id = movie_black_box
    RunScriptOnScreenElement id = movie_black_box animate_movie_in
    Wait 0.21 seconds
  endif
  UnloadPreFile "skaterparts.pre"
  MemPushContext 0
  PlayMovie <movie_file>
  MemPopContext
  DumpHeaps
  LoadPreFile "skaterparts.pre"
  if ObjectExists id = movie_black_box
    RunScriptOnScreenElement id = movie_black_box animate_movie_out
  endif
endscript
script animate_movie_in
  SetButtonEventMappings block_menu_input
  SetScreenElementProps id = root_window tags = { menu_state = entering }
  DoMorph time = 0 scale = 190 alpha = 0
  DoMorph time = 0.07 scale = 190 alpha = 0.33
  DoMorph time = 0.07 scale = 190 alpha = 0.66
  DoMorph time = 0.07 scale = 190 alpha = 1
  SetScreenElementProps id = root_window tags = { menu_state = on }
  SetButtonEventMappings unblock_menu_input
endscript
script animate_movie_out
  GetTags
  SetButtonEventMappings block_menu_input
  SetScreenElementProps id = root_window tags = { menu_state = entering }
  DoMorph time = 0 scale = 190 alpha = 1
  DoMorph time = 0.07 scale = 190 alpha = 0.66
  DoMorph time = 0.07 scale = 190 alpha = 0.33
  DoMorph time = 0.07 scale = 190 alpha = 0
  SetScreenElementProps id = root_window tags = { menu_state = on }
  SetButtonEventMappings unblock_menu_input
endscript
script movie_menu_focus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  generic_menu_update_arrows {
    up_arrow_id = movie_up_arrow
    down_arrow_id = movie_down_arrow
  }
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = [ 128 128 128 50 ]
  }
endscript
movie_info = [
  { name = "Neversoft Logo" file = "movies\nslogo" flag = LEVEL_UNLOCKED_SCH first_name = "" }
  { name = "Activision Logo" file = "movies\atvi" flag = LEVEL_UNLOCKED_SCH first_name = "" }
  { name = "THPS4 Intro" file = "movies\intro" flag = LEVEL_UNLOCKED_SCH first_name = "" }
  { name = "Tony Hawk" file = "movies\hawk" flag = MOVIE_UNLOCKED_HAWK first_name = "Tony" }
  { name = "Bob Burnquist" file = "movies\burnq" flag = MOVIE_UNLOCKED_BURNQUIST first_name = "Bob" }
  { name = "Steve Caballero" file = "movies\cab" flag = MOVIE_UNLOCKED_CABALLERO first_name = "Steve" }
  { name = "Kareem Campbell" file = "movies\campbell" flag = MOVIE_UNLOCKED_CAMPBELL first_name = "Kareem" }
  { name = "Rune Glifberg" file = "movies\glifberg" flag = MOVIE_UNLOCKED_GLIFBERG first_name = "Rune" }
  { name = "Eric Koston" file = "movies\koston" flag = MOVIE_UNLOCKED_KOSTON first_name = "Eric" }
  { name = "Bucky Lasek" file = "movies\lasek" flag = MOVIE_UNLOCKED_LASEK first_name = "Bucky" }
  { name = "Bam Margera" file = "movies\margera" flag = MOVIE_UNLOCKED_MARGERA first_name = "Bam" }
  { name = "Rodney Mullen" file = "movies\mullen" flag = MOVIE_UNLOCKED_MULLEN first_name = "Rodney" }
  { name = "Chad Muska" file = "movies\muska" flag = MOVIE_UNLOCKED_MUSKA first_name = "Chad" }
  { name = "Andrew Reynolds" file = "movies\reynolds" flag = MOVIE_UNLOCKED_REYNOLDS first_name = "Andrew" }
  { name = "Geoff Rowley" file = "movies\rowley" flag = MOVIE_UNLOCKED_ROWLEY first_name = "Geoff" }
  { name = "Elissa Steamer" file = "movies\steamer" flag = MOVIE_UNLOCKED_STEAMER first_name = "Elissa" }
  { name = "Jamie Thomas" file = "movies\thomas" flag = MOVIE_UNLOCKED_THOMAS first_name = "Jamie" }
  { name = "Pro Bails 1" file = "movies\probails" flag = MOVIE_UNLOCKED_CAS first_name = "custom" }
  { name = "Pro Bails 2" file = "movies\bails2" flag = MOVIE_UNLOCKED_BAILS2 first_name = "" }
  { name = "Homies Skatin' 1" file = "movies\homiesp1" flag = MOVIE_UNLOCKED_HOMIES1 first_name = "" }
  { name = "Homies Skatin' 2" file = "movies\homiesp2" flag = MOVIE_UNLOCKED_HOMIES2 first_name = "" }
  { name = "Kona Old School" file = "movies\kona" flag = MOVIE_UNLOCKED_KONA first_name = "" }
  { name = "Outtakes" file = "movies\outtakes" flag = MOVIE_UNLOCKED_OUTTAKES first_name = "" }
]
script create_view_goals_menu
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 gameframe
    remove_pause_menu_textures_from_vram
  endif
  view_goals_menu_add_textures_to_vram
  make_new_menu {
    menu_id = view_goals_menu
    vmenu_id = view_goals_vmenu
    type = VScrollingMenu
    dims = (600, 288)
    padding_scale = 0.6
    pos = (90, 69)
    helper_text = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
        { text = "\m1 = Back" }
        { text = "\m0 = Jump to Goal (if unlocked)" }
      ]
    }
  }
  SetScreenElementProps {
    id = view_goals_vmenu
    dont_allow_wrap
    event_handlers = [ { pad_down menu_vert_blink_arrow params = { id = view_goals_menu_down_arrow } }
      { pad_up menu_vert_blink_arrow params = { id = view_goals_menu_up_arrow } }
    ]
  }
  SetScreenElementProps { id = view_goals_menu
    event_handlers = [
      { pad_back view_goals_menu_exit params = { callback = create_pause_menu } }
    ]
  }
  GoalManager_AddViewGoalsList
   <root_pos> = (190, 23)
  set_sub_bg_goal {
    pos = <root_pos>
    goal_mid_scale = (19, 1.33)
    goal_end_scale = (1, 1.33)
  }
  create_icon texture = PA_view pos = (47, 21)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "VIEW GOALS"
    rgba = [ 128 128 128 85 ]
    scale = 1.4
    pos = (93, 23)
    just = [ left top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = ( <root_pos> + (-110, 30) )
    just = [ left top ]
    rgba = [ 0 0 0 85 ]
    scale = (124, 7)
    z_priority = 2
  }
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = dialog
    text = "Goal"
    rgba = [ 127 102 0 100 ]
    scale = 0.9
    pos = ( <root_pos> + (-100, 35) )
    just = [ left top ]
    z_priority = 3
  }
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = dialog
    text = "Record"
    rgba = [ 127 102 0 100 ]
    scale = 0.9
    pos = ( <root_pos> + (259, 35) )
    just = [ left top ]
    z_priority = 3
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = view_goals_menu_up_arrow
    texture = up_arrow
    pos = ( <root_pos> + (119, 35) )
    just = [ left top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 3
  }
  GetScreenElementPosition id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = view_goals_menu_down_arrow
    texture = down_arrow
    pos = ( <root_pos> + (119, 345) )
    just = [ left top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 3
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = ( <root_pos> + (-110, 340) )
    just = [ left top ]
    rgba = [ 0 0 0 85 ]
    scale = (124, 7)
    z_priority = 2
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    scale = (2, 70.5)
    rgba = [ 0 0 0 80 ]
    pos = ( <root_pos> + (250, 58) )
    just = [ left top ]
  }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script view_goals_menu_add_item
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    id = <goal_id>
    dims = (500, 24)
  }
  CreateScreenElement {
    type = TextElement
    parent = <goal_id>
    text = <text>
    font = dialog
    scale = 0.75
    pos = (0, 0)
    just = [ left top ]
  }
  if GoalManager_HasWonGoal name = <goal_id>
    if not GotParam win_record_string
       <win_record_string> = "N/A"
    endif
    CreateScreenElement {
      type = TextElement
      parent = <goal_id>
      font = small
      text = <win_record_string>
      scale = 0.7
      pos = (420, 0)
      just = [ center top ]
    }
     <goal_id>:SetTags win_record
  endif
  if GoalManager_HasWonGoal name = <goal_id>
    view_goals_menu_set_color id = <goal_id> rgba = [ 25 83 67 128 ]
    SetScreenElementProps {
      id = <goal_id>
      event_handlers = [
        { focus view_goals_menu_focus_beaten }
        { unfocus view_goals_menu_unfocus_beaten }
        { pad_choose view_goals_menu_start_beaten_goal params = { goal_id = <goal_id> } }
        { pad_start view_goals_menu_start_beaten_goal params = { goal_id = <goal_id> } }
        { pad_choose generic_menu_pad_choose_sound }
      ]
    }
    GetScreenElementDims id = { <goal_id> child = 0 }
    CreateScreenElement {
      type = SpriteElement
      parent = { <goal_id> child = 0 }
      texture = goal_line
      pos = (-10, 13)
      just = [ left center ]
      rgba = [ 128 128 128 128 ]
      scale = ( ( (1, 0) * ( <width> * 1.38 ) / 32 ) + (0.3, 0.4) )
    }
  else
    if GoalManager_GoalIsLocked name = <goal_id>
      if IsTrue bootstrap_build
         <locked_text> = "NOT IN DEMO"
      else
        GoalManager_GetGoalParams name = <goal_id>
        if GotParam pro_goal
           <locked_text> = "Complete Pro Challenge to unlock"
        else
           <locked_text> = "Locked"
        endif
      endif
      view_goals_menu_set_color {
        id = <goal_id>
        rgba = [ 42 42 38 128 ]
        text = <locked_text>
      }
      SetScreenElementProps {
        id = <goal_id>
        event_handlers = [
          { focus view_goals_menu_focus_locked }
          { unfocus view_goals_menu_unfocus_locked }
          { pad_choose view_goals_menu_pad_choose_locked }
          { pad_start view_goals_menu_pad_choose_locked }
        ]
        replace_handlers
      }
    else
      if GoalManager_HasSeenGoal name = <goal_id>
        view_goals_menu_set_color {
          id = <goal_id>
          rgba = [ 88 105 112 128 ]
        }
        SetScreenElementProps {
          id = <goal_id>
          event_handlers = [
            { focus view_goals_menu_focus_unlocked params = { goal_id = <goal_id> } }
            { unfocus view_goals_menu_unfocus_unlocked params = { goal_id = <goal_id> } }
            { pad_choose view_goals_menu_start_goal params = { goal_id = <goal_id> } }
            { pad_start view_goals_menu_start_goal params = { goal_id = <goal_id> } }
          ]
          replace_handlers
        }
      else
        view_goals_menu_set_color {
          id = <goal_id>
          rgba = [ 42 42 38 128 ]
          text = "??????????"
        }
        SetScreenElementProps {
          id = <goal_id>
          event_handlers = [
            { focus view_goals_menu_focus_locked params = { goal_id = <goal_id> } }
            { unfocus view_goals_menu_unfocus_locked params = { goal_id = <goal_id> } }
            { pad_choose view_goals_menu_pad_choose_locked }
            { pad_start view_goals_menu_pad_choose_locked }
          ]
          replace_handlers
        }
      endif
    endif
  endif
endscript
script view_goals_menu_set_color
  SetScreenElementProps {
    id = { <id> child = 0 }
    rgba = <rgba>
    text = <text>
  }
   <id>:GetTags
  if GotParam win_record
    SetScreenElementProps {
      id = { <id> child = 1 }
      rgba = <rgba>
      scale = <scale>
    }
  endif
endscript
script view_goals_menu_focus_locked
  generic_menu_update_arrows {
    menu_id = view_goals_vmenu
    up_arrow_id = view_goals_menu_up_arrow
    down_arrow_id = view_goals_menu_down_arrow
  }
  GetTags
  view_goals_menu_set_color id = <id> rgba = [ 67 62 58 128 ]
  RunScriptOnScreenElement id = { <id> child = 0 } do_random_effect
  if GotParam goal_id
    view_goals_menu_play_preview_cam <...>
  endif
endscript
script view_goals_menu_unfocus_locked
  GetTags
  generic_menu_pad_up_down_sound
  KillSpawnedScript name = do_random_effect
  view_goals_menu_set_color id = <id> rgba = [ 47 42 38 128 ]
  if GotParam goal_id
    view_goals_menu_kill_preview_cam <...>
  endif
endscript
script view_goals_menu_focus_unlocked
  generic_menu_update_arrows {
    menu_id = view_goals_vmenu
    up_arrow_id = view_goals_menu_up_arrow
    down_arrow_id = view_goals_menu_down_arrow
  }
  GetTags
  view_goals_menu_set_color id = <id> rgba = [ 127 102 0 128 ]
  RunScriptOnScreenElement id = { <id> child = 0 } do_random_effect
  view_goals_menu_play_preview_cam <...>
endscript
script view_goals_menu_unfocus_unlocked
  GetTags
  generic_menu_pad_up_down_sound
  KillSpawnedScript name = do_random_effect
  view_goals_menu_set_color id = <id> rgba = [ 88 105 112 128 ]
  view_goals_menu_kill_preview_cam <...>
endscript
script view_goals_menu_focus_beaten
  generic_menu_update_arrows {
    menu_id = view_goals_vmenu
    up_arrow_id = view_goals_menu_up_arrow
    down_arrow_id = view_goals_menu_down_arrow
  }
  GetTags
  view_goals_menu_set_color id = <id> rgba = [ 99 121 6 128 ]
  RunScriptOnScreenElement id = { <id> child = 0 } do_random_effect
endscript
script view_goals_menu_unfocus_beaten
  GetTags
  generic_menu_pad_up_down_sound
  KillSpawnedScript name = do_random_effect
  view_goals_menu_set_color id = <id> rgba = [ 25 83 67 128 ]
endscript
script view_goals_menu_pad_choose_locked
endscript
script view_goals_menu_start_goal
  view_goals_menu_exit callback = exit_pause_menu
  GoalManager_DeactivateAllGoals
  goal_accept_trigger goal_id = <goal_id> force_start
endscript
script view_goals_menu_start_beaten_goal
  view_goals_menu_exit callback = exit_pause_menu
  GoalManager_DeactivateAllGoals
  goal_accept_trigger goal_id = <goal_id> force_start
endscript
script view_goals_menu_play_preview_cam
  GoalManager_GetGoalParams name = <goal_id>
  if IsAlive name = <trigger_obj_id>
     <trigger_obj_id>:Obj_GetId
     <targetId> = <objId>
    GetSkaterID
    PlaySkaterCamAnim { name = <goal_id>
      skater = <objId>
      targetId = <targetId>
      targetOffset = (0, 45, 0)
      positionOffset = (10, 10, 90)
      frames = 120
      skippable = 0
      virtual_cam
      play_hold
    }
    SetSkaterCamAnimShouldPause name = <goal_id> should_pause = 0
  endif
  view_goals_vmenu:SetTags current_cam_anim = <goal_id>
endscript
script view_goals_menu_kill_preview_cam
  GetSkaterID
  KillSkaterCamAnim skater = <objId> name = <goal_id>
endscript
script view_goals_menu_exit
  if ScreenElementExists id = view_goals_vmenu
    view_goals_vmenu:GetTags
    if GotParam current_cam_anim
      GetSkaterID
      KillSkaterCamAnim skater = <objId> name = <current_cam_anim>
    endif
  endif
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 gameframe
  endif
  view_goals_menu_remove_textures_from_vram
  add_pause_menu_textures_to_vram
  GoalManager_ShowPoints
  if not GoalManager_HasActiveGoals
    GoalManager_ShowGoalPoints
  endif
   <callback>
endscript
script view_goals_menu_add_textures_to_vram
  AddTextureToVram "PA_View"
  AddTextureToVram "goal_line"
  AddTextureToVram "up_arrow"
  AddTextureToVram "down_arrow"
  AddTextureToVram "goal_left"
  AddTextureToVram "goal_mid"
  AddTextureToVram "goal_right"
endscript
script view_goals_menu_remove_textures_from_vram
  RemoveTextureFromVram "PA_View"
  RemoveTextureFromVram "goal_line"
  RemoveTextureFromVram "up_arrow"
  RemoveTextureFromVram "down_arrow"
  RemoveTextureFromVram "goal_left"
  RemoveTextureFromVram "goal_mid"
  RemoveTextureFromVram "goal_right"
endscript
stat_names = [ { name = air string = "Air" description = "Your jump height out of a half pipe" }
  { name = hangtime string = "Hangtime" description = "How long you stay in the air" }
  { name = Ollie string = "Ollie" description = "How high you jump on flat ground" }
  { name = speed string = "Speed" description = "Your top speed on the ground" }
  { name = spin string = "Spin" description = "How fast you spin in the air" }
  { name = #"switch" string = "Switch" description = "When maxed out, you skate equally well switch and regular" }
  { name = flip_speed string = "Flip Speed" description = "How fast your flip tricks will turn" }
  { name = rail_balance string = "Rail Balance" description = "How well you balance on rails" }
  { name = lip_balance string = "Lip Balance" description = "How well you balance during lip trick stalls" }
  { name = manual_balance string = "Manual Balance" description = "How well you balance during manuals" }
]
script create_stats_menu root_pos = (115, 35)
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  if LevelIs load_skateshop
     <root_pos> = ( <root_pos> - (90, 0) )
  endif
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu {
    menu_title = "STATS"
    pos = ( <root_pos> + (52, -5) )
    menu_id = stats_menu
    vmenu_id = stats_vmenu
    padding_scale = 1
    helper_text = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
        { text = "\b5/\b6 = Change Stat" }
        { text = "\m1 = Back" }
        { text = "\m0 = Accept" }
      ]
    }
  }
  SetScreenElementProps {
    id = stats_vmenu
    event_handlers = [ { pad_up null_script }
      { pad_down null_script }
    ]
    replace_handlers
  }
  kill_start_key_binding
  create_icon texture = PA_fonts pos = <root_pos> id = stats_menu_icon
  SetScreenElementProps {
    id = stats_menu
    event_handlers = [ { pad_back generic_menu_pad_back_sound }
      { pad_back generic_menu_pad_back params = { callback = stats_menu_exit } }
    ]
    replace_handlers
  }
  GetStackedScreenElementPos x id = stats_menu_icon offset = (-33, 0)
  set_sub_bg pos = <pos> just = [ left top ]
  GetArraySize stat_names
   <index> = 0
  begin
    stats_menu_add_item ( stat_names [ <index> ] ) <...> stats_parent = current_menu
     <index> = ( <index> + 1 )
  repeat <array_size>
  if LevelIs load_skateshop
     <done_button_pad_choose_script> = launch_ss_menu
  else
    if not GotParam done_button_pad_choose_script
       <done_button_pad_choose_script> = create_options_menu
    endif
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    dims = (200, 40)
    event_handlers = [ { pad_choose generic_menu_pad_choose_sound }
      { pad_start generic_menu_pad_choose_sound }
      { pad_choose <done_button_pad_choose_script> }
      { pad_start <done_button_pad_choose_script> }
      { focus stats_menu_done_focus }
      { unfocus stats_menu_done_unfocus }
    ]
    z_priority = 10
  }
  CreateScreenElement {
    type = TextElement
    parent = <id>
    pos = (150, 20)
    rgba = [ 88 105 112 128 ]
    font = small
    text = "Done"
    scale = 0.85
  }
  GetStackedScreenElementPos x id = stats_menu_icon offset = (116, 268)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = done_bg_box
    texture = black
    z_priority = 0
    scale = (18, 5)
    pos = <pos>
    just = [ left top ]
    rgba = [ 0 0 0 90 ]
  }
  GetStackedScreenElementPos x id = done_bg_box offset = (0, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    z_priority = 0
    scale = (0.6, 0.07)
    pos = <pos>
    just = [ center top ]
    rgba = [ 0 0 0 90 ]
  }
  GetStackedScreenElementPos x id = done_bg_box offset = (-35, 3)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = stats_notch
    pos = <pos>
    scale = (4.1, 1.1)
    just = [ center top ]
    rgba = [ 100 100 100 30 ]
  }
  GetCurrentSkaterProfileIndex
  GetNumStatPointsAvailable player = <currentSkaterProfileIndex>
  FormatText TextName = points_text "Points Available: %i" i = <points_available>
  GetStackedScreenElementPos x id = done_bg_box offset = (-30, 40)
  CreateScreenElement {
    type = TextElement
    id = stat_points_available
    parent = current_menu_anchor
    pos = <pos>
    rgba = [ 127 102 0 128 ]
    font = small
    text = <points_text>
    scale = 0.8
    not_focusable
  }
  GetStackedScreenElementPos x id = done_bg_box offset = (-35, 29)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = stats_notch
    pos = <pos>
    scale = (18, 1.5)
    just = [ center top ]
    rgba = [ 100 100 100 30 ]
  }
  GetStackedScreenElementPos x id = stats_menu_icon offset = (333, 24)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    pos = <pos>
    z_priority = 0
    scale = (1, 0.9)
    just = [ center top ]
    rgba = [ 128 128 128 90 ]
  }
  GetStackedScreenElementPos x id = done_bg_box offset = (-35, 25)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = <pos>
    draw_behind_parent
    scale = (75, 15)
    just = [ center top ]
    rgba = [ 0 0 0 98 ]
  }
  GetStackedScreenElementPos x id = done_bg_box offset = (115, 25)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    pos = <pos>
    z_priority = 0
    scale = (0.8, 0.23)
    just = [ center top ]
    rgba = [ 128 128 128 90 ]
  }
  GetStackedScreenElementPos y id = done_bg_box offset = (40, 25)
  CreateScreenElement {
    type = TextBlockElement
    parent = current_menu_anchor
    id = stat_point_description
    dims = (347, 0)
    pos = <pos>
    rgba = [ 37 84 136 80 ]
    font = dialog
    just = [ center top ]
    scale = 0.8
    text = ( ( stat_names [ 0 ] ).description )
    not_focusable
    allow_expansion
  }
  RunScriptOnScreenElement id = stats_menu animate_in
endscript
script stats_menu_create_stats_block parent = current_menu scale = 1 pos = (180, 147)
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = stats_block_anchor
    pos = <pos>
    just = [ left top ]
    dims = (640, 480)
    scale = <scale>
  }
   <stats_parent> = <id>
  GetArraySize stat_names
   <index> = 0
  begin
    stats_menu_add_item ( stat_names [ <index> ] ) <...>
     <index> = ( <index> + 1 )
  repeat <array_size>
endscript
script stats_menu_add_item z_priority = 2
  FormatText ChecksumName = row_id "stats_menu_names_%n" n = <name>
   <pos> = ( (0, 1) * ( 23 * ( <index> + 1 ) ) )
   <pos> = ( <pos> + (150, -12) )
  CreateScreenElement {
    type = ContainerElement
    parent = <stats_parent>
    id = <row_id>
    dims = (300, 23)
    pos = <pos>
    event_handlers = [
      { focus stats_menu_focus params = { name = <name> row_id = <row_id> description = <description> } }
      { unfocus stats_menu_unfocus params = { name = <name> row_id = <row_id> } }
      { pad_right stats_menu_change_stat params = { name = <name> row_id = <row_id> Change = 1 update_all_skaters = <update_all_skaters> } }
      { pad_left stats_menu_change_stat params = { name = <name> row_id = <row_id> Change = -1 update_all_skaters = <update_all_skaters> } }
      { pad_choose stats_menu_fire_pad_down params = { target = <stats_parent> } }
      { pad_start stats_menu_fire_pad_down params = { target = <stats_parent> } }
      { pad_choose generic_menu_pad_choose_sound }
      { pad_start generic_menu_pad_choose_sound }
    ]
  }
   <anchor_id> = <id>
  if GotParam not_focusable
    SetScreenElementProps {
      id = <anchor_id>
      not_focusable
    }
  endif
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    rgba = [ 88 105 112 128 ]
    font = small
    text = <string>
    scale = 0.85
    z_priority = <z_priority>
    just = [ right top ]
    pos = (140, 0)
  }
   <x_pos> = 145
  begin
    CreateScreenElement {
      type = SpriteElement
      parent = <row_id>
      texture = pip_on
      pos = ( (1, 0) * <x_pos> + (0, 3) )
      just = [ left top ]
      z_priority = ( <z_priority> - 1 )
    }
     <x_pos> = ( <x_pos> + 18 )
  repeat 10
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = stats_bg
    pos = (-30, -5)
    scale = (1.4, 1.2)
    rgba = [ 128 128 128 100 ]
    just = [ left top ]
    z_priority = ( <z_priority> - 2 )
  }
  stats_menu_update_row <...>
endscript
script stats_menu_fire_pad_down
  FireEvent type = pad_down target = <target>
endscript
script stats_menu_update_row highlight_rgba = [ 75 75 75 128 ] locked_highlight_rgba = [ 95 75 75 128 ]
  if IsTrue gary_debug
    if GotParam skater_name
      script_assert "Get rid of skater name"
    endif
  endif
  GetStatValue <name>
  stats_menu_get_original_stat_value name = <name>
  if GotParam not_focusable
     <highlight_rgba> = [ 128 128 128 128 ]
     <locked_highlight_rgba> = [ 128 75 75 128 ]
  endif
   <child> = 1
  if GotParam original_stat_value
    if ( <original_stat_value> > 0 )
      if ( <stat_value> > 0 )
        begin
          SetScreenElementProps {
            id = { <row_id> child = <child> }
            rgba = <locked_highlight_rgba>
          }
           <child> = ( <child> + 1 )
        repeat <original_stat_value>
      endif
       <stat_value> = ( <stat_value> - <original_stat_value> )
    endif
  endif
  if ( <stat_value> > 0 )
    begin
      SetScreenElementProps {
        id = { <row_id> child = <child> }
        rgba = <highlight_rgba>
      }
       <child> = ( <child> + 1 )
    repeat <stat_value>
  endif
  begin
    if ( <child> < 11 )
      SetScreenElementProps {
        id = { <row_id> child = <child> }
        rgba = [ 40 40 40 70 ]
      }
       <child> = ( <child> + 1 )
    else
      break
    endif
  repeat
endscript
script stats_menu_get_original_stat_value
   <stat_name> = <name>
  if GotParam skater_name
    GetSkaterProfileInfoByName name = <skater_name>
  else
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  endif
  if ( <name> = custom )
    return original_stat_value = 0
  endif
  GetArraySize master_skater_list
   <index> = 0
  begin
    if ( ( ( master_skater_list [ <index> ] ).name ) = <name> )
       <original_stat_value> = ( ( master_skater_list [ <index> ] ).<stat_name> )
      break
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
  if not GotParam original_stat_value
    script_assert "couldn't find the stat!"
  endif
  return original_stat_value = <original_stat_value>
endscript
script stats_menu_change_stat
  GetCurrentSkaterProfileIndex
  GetNumStatPointsAvailable player = <currentSkaterProfileIndex>
  GetStatValue <name>
  if ( <Change> < 0 )
    if ( <stat_value> < 1 )
      return
    endif
  endif
  if ( <Change> > 0 )
    if ( <stat_value> > 9 )
      return
    endif
  endif
  if ( <points_available> < <Change> )
    return
  endif
  stats_menu_get_original_stat_value name = <name>
  if ( ( <stat_value> + <Change> ) < <original_stat_value> )
    return
  endif
  PlaySound menu03 vol = 100
  AwardStatPoint ( <Change> * -1 )
  GetNumStatPointsAvailable player = <currentSkaterProfileIndex>
  FormatText TextName = points_text "Points Available: %i" i = <points_available>
  SetScreenElementProps {
    id = stat_points_available
    text = <points_text>
  }
   <stat_value> = ( <stat_value> + <Change> )
  SetSkaterProfileProperty player = <currentSkaterProfileIndex> <name> <stat_value>
  if LevelIs load_skateshop
    UpdateSkaterStats player = 0
  else
    UpdateSkaterStats player = <currentSkaterProfileIndex>
  endif
  stats_menu_update_row name = <name> row_id = <row_id> highlight_rgba = [ 128 128 128 128 ] locked_highlight_rgba = [ 128 75 75 128 ]
  if GotParam update_all_skaters
     <stat_name> = <name>
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    ForEachSkaterProfile {
      do = stats_menu_change_other_skater_stats
      params = { Change = <Change>
        current_skater_name = <name>
        stat_name = <stat_name>
      }
    }
  endif
endscript
script stats_menu_focus
  stats_menu_update_row {
    name = <name>
    row_id = <row_id>
    highlight_rgba = [ 128 128 128 128 ]
    locked_highlight_rgba = [ 128 75 75 128 ]
  }
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up
  if ObjectExists id = stat_point_description
    SetScreenElementProps {
      id = stat_point_description
      text = <description>
    }
  endif
endscript
script stats_menu_unfocus
  stats_menu_update_row name = <name> row_id = <row_id>
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down
endscript
script stats_menu_done_focus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up
  if ObjectExists id = stat_point_description
    SetScreenElementProps {
      id = stat_point_description
      text = ""
    }
  endif
endscript
script stats_menu_done_unfocus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down
endscript
script stats_menu_change_other_skater_stats
  if ( <current_skater_name> = <name> )
    return
  endif
  if ( <Change> < 0 )
    return
  endif
  if ( <Change> > <points_available> )
    return
  endif
  GetStatValue skater = <name> <stat_name>
  if ( <stat_value> = 10 )
    GetArraySize stat_names
     <index> = 0
    begin
       <stat_name> = ( ( stat_names [ <index> ] ).name )
      GetStatValue skater = <name> <stat_name>
      if ( <stat_value> < 10 )
        break
      endif
       <index> = ( <index> + 1 )
      if ( <index> = <array_size> )
        return
      endif
    repeat <array_size>
  endif
  switch <stat_name>
  case air
    SetSkaterProfileInfoByName name = <name> params = { air = ( <stat_value> + <Change> ) }
  case hangtime
    SetSkaterProfileInfoByName name = <name> params = { hangtime = ( <stat_value> + <Change> ) }
  case Ollie
    SetSkaterProfileInfoByName name = <name> params = { Ollie = ( <stat_value> + <Change> ) }
  case speed
    SetSkaterProfileInfoByName name = <name> params = { speed = ( <stat_value> + <Change> ) }
  case spin
    SetSkaterProfileInfoByName name = <name> params = { spin = ( <stat_value> + <Change> ) }
  case #"switch"
    SetSkaterProfileInfoByName name = <name> params = { #"switch" = ( <stat_value> + <Change> ) }
  case flip_speed
    SetSkaterProfileInfoByName name = <name> params = { flip_speed = ( <stat_value> + <Change> ) }
  case rail_balance
    SetSkaterProfileInfoByName name = <name> params = { rail_balance = ( <stat_value> + <Change> ) }
  case lip_balance
    SetSkaterProfileInfoByName name = <name> params = { lip_balance = ( <stat_value> + <Change> ) }
  case manual_balance
    SetSkaterProfileInfoByName name = <name> params = { manual_balance = ( <stat_value> + <Change> ) }
  default
    script_assert "bad stat name"
  endswitch
   <points_available> = ( <points_available> - <Change> )
  if not SetSkaterProfileInfoByName name = <name> params = { points_available = <points_available> }
    Printf "############### couldn't change points available!"
  endif
endscript
script stats_menu_exit
  if LevelIs load_skateshop
    launch_ss_menu
  else
    GoalManager_ShowPoints
    if not GoalManager_HasActiveGoals
      GoalManager_ShowGoalPoints
    endif
    create_options_menu
  endif
endscript
script launch_gamemode_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_gamemode_menu
endscript
script create_gamemode_menu
  make_new_menu menu_id = gamemode_menu vmenu_id = gamemode_vmenu menu_title = "GAMEMODE" helper_text = generic_helper_text
  SetScreenElementProps { id = gamemode_menu
    event_handlers = [
      { pad_back create_options_menu }
    ]
  }
  make_text_sub_menu_item text = "Career Mode" id = gamemode_career_mode pad_choose_script = change_gamemode_career_menu
  make_text_sub_menu_item text = "Single Session" id = gamemode_single_session pad_choose_script = change_gamemode_singlesession_menu
  make_text_sub_menu_item text = "Free Skate" id = gamemode_free_skate pad_choose_script = change_gamemode_freeskate_menu
  make_text_sub_menu_item text = "Quickstart 2P" id = gamemode_quickstart_2p
  make_text_sub_menu_item text = "Quickstart Server" id = gamemode_quickstart_server
  make_text_sub_menu_item text = "Back" id = gamemode_back pad_choose_script = create_options_menu
  set_sub_bg
  create_icon texture = PA_mode
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script change_gamemode_career
  Printf "********** CHANGING GAME MODE TO CAREER"
  SetGameType career
  SetCurrentGameType
endscript
script change_gamemode_net
  Printf "********** CHANGING GAME MODE TO NET!!!"
  SetGameType net
  SetCurrentGameType
endscript
script change_gamemode_singlesession
  SetGameType singlesession
  SetCurrentGameType
endscript
script change_gamemode_freeskate_2p
  SetGameType freeskate2p
  SetCurrentGameType
endscript
script change_gamemode_freeskate
  SetGameType freeskate
  SetCurrentGameType
endscript
script change_gamemode_career_menu
  exit_pause_menu
  SetGameType career
  SetCurrentGameType
  Retry
endscript
script change_gamemode_singlesession_menu
  kill_all_panel_messages
  SetGameType singlesession
  SetCurrentGameType
  GoalManager_DeactivateAllGoals
  Change EndOfReplayShouldJumpToPauseMenu = 0
  Retry
endscript
script change_gamemode_freeskate_menu
  exit_pause_menu
  SetGameType freeskate
  SetCurrentGameType
  Retry
endscript
script create_statistics_menu { pad_back_script = statistics_menu_exit
    pad_choose_script = nullscript
  }
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
    remove_pause_menu_textures_from_vram
  endif
  add_statistics_menu_textures_to_vram
  make_new_menu { menu_id = statistics_menu
    vmenu_id = statistics_vmenu
    menu_title = "STATISTICS"
    padding_scale = 1
    internal_scale = 1
    pos = (160, 43)
  }
  SetScreenElementProps {
    id = current_menu
    event_handlers = [ { pad_back <pad_back_script> params = <pad_back_params> }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
    ]
    replace_handlers
  }
  create_icon texture = pa_stats pos = (113, 43)
  set_sub_bg pos = (263, 45)
  statistics_menu_add_item text = "Total Score:" value = 24925596
  statistics_menu_add_item text = "High Score:" value = 24925596
  statistics_menu_add_item text = "Longest Grind:" value = 12.23 unit = "seconds"
  statistics_menu_add_item text = "Longest manual:" value = 30.28 unit = "seconds"
  statistics_menu_add_item text = "Longest Lip:" value = 23.45 unit = "seconds"
  statistics_menu_add_item text = "Longest Combo:" value = 6 unit = "tricks"
  statistics_menu_add_item text = "Best Combo:" value = 90000 unit = "points"
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    dims = (500, 70)
    not_focusable
  }
   <anchor_id> = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = black
    pos = (-25, -5)
    just = [ left top ]
    scale = (100, 35)
    rgba = [ 0 0 0 70 ]
  }
   <text_block_scale> = 0.6
  CreateScreenElement {
    type = TextBlockElement
    parent = <anchor_id>
    font = newtrickfont
    dims = ( ( 1 / <text_block_scale> ) * (400, 140) )
    pos = (-25, 0)
    scale = <text_block_scale>
    rgba = [ 47 94 136 100 ]
    just = [ left top ]
    internal_just = [ center top ]
    text = [ "BS 50-50 + Pop Shove-It + Nose Manual + "
      "FS Boardslide + 360 360 Flip + Japan + "
      "The 900 + BS Nosegrind + some other trick "
      "+ whoa that was cool + you are so good + how long "
      " is this + almost fell + whatever "
      "FS Boardslide + 360 360 Flip + Japan + "
      "The 900 + BS Nosegrind + some other trick "
      "+ whoa that was cool + you are so good + how long "
      " is this + almost fell + whatever "
      "FS Boardslide + 360 360 Flip + Japan + "
      "The 900 + BS Nosegrind + some other trick "
      "+ whoa that was cool + you are so good + how long "
      " is this + almost fell + whatever "
    ]
  }
  FireEvent type = focus target = current_menu
endscript
script statistics_menu_add_item
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    dims = (500, 28)
    not_focusable
  }
   <container_id> = <id>
  CreateScreenElement {
    type = TextElement
    parent = <container_id>
    text = <text>
    font = small
    pos = (160, 8)
    just = [ right center ]
    rgba = [ 108 120 128 128 ]
    scale = 0.9
  }
  FormatText TextName = value_string "%v" v = <value>
  if GotParam unit
    FormatText TextName = value_string "%s %u" s = <value_string> u = <unit>
  endif
  CreateScreenElement {
    type = TextElement
    parent = <container_id>
    text = <value_string>
    font = dialog
    pos = (165, 8)
    just = [ left center ]
    rgba = [ 127 102 0 128 ]
    scale = 0.9
  }
   <pos> = (-25, -5)
  begin
    CreateScreenElement {
      type = SpriteElement
      parent = <container_id>
      texture = comp_single_line
      pos = <pos>
      just = [ left top ]
      scale = (1, 1)
      rgba = [ 128 128 128 90 ]
    }
    GetStackedScreenElementPos x id = <id>
  repeat 57
endscript
script statistics_menu_exit
  GoalManager_ShowPoints
  if not GoalManager_HasActiveGoals
    GoalManager_ShowGoalPoints
  endif
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 gameframe
    remove_statistics_menu_textures_from_vram
  endif
  add_pause_menu_textures_to_vram
  create_debug_menu
endscript
script add_statistics_menu_textures_to_vram
  AddTextureToVram "PA_Stats"
  AddTextureToVram "comp_single_line"
endscript
script remove_statistics_menu_textures_from_vram
  RemoveTextureFromVram "PA_Stats"
  RemoveTextureFromVram "comp_single_line"
endscript
script menu_start_autotest
  SetTesterScript TestLevels
  exit_pause_menu
endscript
script menu_stop_autotest
  KillTesterScript
  exit_pause_menu
endscript
script launch_menu_test
  RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_menu_test_menu
endscript
script menu_select menu_select_script = item_chosen
  if GotParam stop_streams
    StopStream
  endif
  exit_pause_menu
   <menu_select_script>
endscript
script item_chosen menu_id = current_menu_anchor
  Printf "item_chosen"
  RunScriptOnScreenElement id = <menu_id> animate_out callback = create_pause_menu
endscript
script make_text_sub_menu_item { focus_script = do_scale_up
    unfocus_script = do_scale_down
    pad_choose_script = nullscript
    font_face = small
    parent_menu_id = current_menu
    scale = 1
    rgba = [ 88 105 112 128 ]
  }
  if GotParam not_focusable
     <nofocus_rgba> = [ 60 60 60 75 ]
    CreateScreenElement {
      type = TextElement
      parent = <parent_menu_id>
      id = <id>
      text = <text>
      font = <font_face>
      rgba = <nofocus_rgba>
      scale = <scale>
      dims = <dims>
      event_handlers = [
        { focus <focus_script> params = <focus_params> }
        { unfocus <unfocus_script> params = <unfocus_params> }
        { pad_choose <pad_choose_script> params = <pad_choose_params> }
        { pad_start <pad_choose_script> params = <pad_choose_params> }
      ]
      not_focusable
    }
  else
    if GotParam no_choose_sound
      CreateScreenElement {
        type = TextElement
        parent = <parent_menu_id>
        id = <id>
        text = <text>
        font = <font_face>
        rgba = <rgba>
        scale = <scale>
        dims = <dims>
        event_handlers = [
          { focus <focus_script> params = <focus_params> }
          { unfocus <unfocus_script> params = <unfocus_params> }
          { pad_choose <pad_choose_script> params = <pad_choose_params> }
          { pad_start <pad_choose_script> params = <pad_choose_params> }
        ]
      }
    else
      CreateScreenElement {
        type = TextElement
        parent = <parent_menu_id>
        id = <id>
        text = <text>
        font = <font_face>
        rgba = <rgba>
        scale = <scale>
        dims = <dims>
        event_handlers = [
          { focus <focus_script> params = <focus_params> }
          { unfocus <unfocus_script> params = <unfocus_params> }
          { pad_choose generic_menu_pad_choose_sound }
          { pad_start generic_menu_pad_choose_sound }
          { pad_choose <pad_choose_script> params = <pad_choose_params> }
          { pad_start <pad_choose_script> params = <pad_choose_params> }
        ]
      }
    endif
  endif
  if GotParam pad_circle_script
    SetScreenElementProps { id = <id>
      event_handlers = [
        { pad_circle <pad_circle_script> params = <pad_circle_params> }
      ]
    }
  endif
endscript
script make_text_menu_item { focus_script = do_scale_up
    unfocus_script = do_scale_down
    pad_choose_script = item_chosen
    pad_back_script = exit_pause_menu
    font_face = small }
  CreateScreenElement {
    type = TextElement parent = current_menu
    id = <id>
    text = <text>
    font = <font_face>
    rgba = [ 128 128 128 75 ]
    event_handlers = [
      { focus <focus_script> }
      { unfocus <unfocus_script> }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_back <pad_back_script> }
    ]
  }
endscript
script make_sprite_menu_item { focus_script = sprite_focus
    text = "Default sprite text"
    unfocus_script = sprite_unfocus
    pad_choose_script = item_chosen
    scale = 1
    rgba = [ 88 105 112 128 ]
  }
  if GotParam not_focusable
     <rgba> = [ 60 60 60 75 ]
  endif
  CreateScreenElement {
    type = TextElement
    parent = current_menu
    id = <id>
    font = small
    text = <text>
    rgba = <rgba>
    scale = <scale>
    pos = (320, 240)
    just = [ center center ]
    event_handlers = [
      { focus <focus_script> params = { text = <text> } }
      { unfocus <unfocus_script> }
      { pad_start generic_menu_pad_choose_sound }
      { pad_choose generic_menu_pad_choose_sound }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_start <pad_choose_script> params = <pad_choose_params> }
    ]
     <not_focusable>
  }
endscript
script make_sprite_sub_menu_item { focus_script = sprite_focus
    text = "Default sprite text"
    unfocus_script = sprite_unfocus
    pad_choose_script = item_chosen
  }
  CreateScreenElement {
    type = TextElement parent = current_menu
    rgba = [ 92 92 92 70 ]
    id = <id>
    font = small
    text = <text>
    scale = 1.0
    pos = (320, 240)
    just = [ center center ]
    event_handlers = [
      { focus <focus_script> params = { text = <text> } }
      { unfocus <unfocus_script> }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
    ]
  }
endscript
script make_toggle_menu_item { font = small
    child_pos = { (210, 0) relative }
    rgba = [ 88 105 112 128 ]
    child_rgba = [ 88 105 112 128 ]
    just = [ right top ]
    child_just = [ left top ]
    child_scale = 1
    focus_script = do_scale_up
    unfocus_script = do_scale_down
    pad_choose_script = item_chosen
  }
  CreateScreenElement {
    type = TextElement
    parent = current_menu
    id = <id>
    font = <font>
    pos = <pos>
    rgba = <rgba>
    just = <just>
    text = <text>
    scale = <scale>
    event_handlers = [
      { focus <focus_script> params = <focus_params> }
      { unfocus <unfocus_script> params = <unfocus_params> }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_start <pad_choose_script> params = <pad_choose_params> }
    ]
  }
  CreateScreenElement {
    type = TextElement
    parent = <id>
    font = <font>
    pos = <child_pos>
    rgba = <child_rgba>
    just = <child_just>
    text = "off"
    scale = <child_scale>
  }
endscript
script toggle_menu_item_on
  SetScreenElementProps {
    id = { <id> child = 0 }
    text = "on"
  }
endscript
script toggle_menu_item_off
  SetScreenElementProps {
    id = { <id> child = 0 }
    text = "off"
  }
endscript
script animate_in
  PlaySound AnimateIn vol = 200
  SetButtonEventMappings block_menu_input
  SetScreenElementProps id = root_window tags = { menu_state = entering }
  DoMorph time = 0 scale = 0 alpha = 0
  FireEvent type = focus target = <menu_id>
  DoMorph time = 0.07 scale = 1.1 alpha = 0.4
  DoMorph time = 0.07 scale = 0.95 alpha = 1
  DoMorph time = 0.07 scale = 1.0
  SetScreenElementProps id = root_window tags = { menu_state = on }
  if not GotParam dont_unblock
    SetButtonEventMappings unblock_menu_input
  endif
endscript
script menu_onscreen menu_id = current_menu_anchor
  DoMorph scale = 1 time = 0
  if GotParam pos
    DoMorph pos = <pos>
  endif
  SetProps just = [ center center ]
  GetTags
  if GotParam focus_child
    FireEvent type = focus target = <menu_id> data = { child_id = <focus_child> }
  else
    FireEvent type = focus target = <id>
  endif
  if not GotParam preserve_menu_state
    SetScreenElementProps id = root_window tags = { menu_state = on }
  endif
endscript
script animate_out menu_id = current_menu_anchor
  PlaySound AnimateOut
  SetButtonEventMappings block_menu_input
  SetScreenElementProps id = root_window tags = { menu_state = leaving }
  GetTags
  SetProps just = [ center center ]
  DoMorph time = 0 scale = 1.0
  DoMorph time = 0.07 scale = 1.3
  DoMorph time = 0.05 scale = 1.4 alpha = 0.05
  DoMorph time = 0.15 scale = 0.0 alpha = 0
  SetScreenElementProps id = root_window tags = { menu_state = off }
  SetScreenElementLock id = root_window off
  DestroyScreenElement id = <menu_id>
  SetButtonEventMappings unblock_menu_input
endscript
script menu_offscreen
  SetScreenElementProps id = root_window tags = { menu_state = off }
  SetScreenElementLock id = root_window off
  GetTags
  FireEvent type = unfocus target = <id>
  DestroyScreenElement id = <id> recurse
endscript
script load_textures_to_main_memory
  LoadTexture no_vram_alloc "PanelSprites/paused"
  LoadTexture no_vram_alloc "PanelSprites/SlicePause_1"
  LoadTexture no_vram_alloc "PanelSprites/SlicePause_2"
  LoadTexture no_vram_alloc "PanelSprites/SlicePause_3"
  LoadTexture no_vram_alloc "PanelSprites/SlicePause_4"
  LoadTexture no_vram_alloc "PanelSprites/SlicePause_5"
  LoadTexture no_vram_alloc "PanelSprites/SlicePause_6"
  LoadTexture no_vram_alloc "PanelSprites/SlicePause_7"
  LoadTexture no_vram_alloc "PanelSprites/PA_continue"
  LoadTexture no_vram_alloc "PanelSprites/PA_retry"
  LoadTexture no_vram_alloc "PanelSprites/PA_end"
  LoadTexture no_vram_alloc "PanelSprites/PA_view"
  LoadTexture no_vram_alloc "PanelSprites/PA_rescore"
  LoadTexture no_vram_alloc "PanelSprites/PA_level"
  LoadTexture no_vram_alloc "PanelSprites/PA_save"
  LoadTexture no_vram_alloc "PanelSprites/PA_Load"
  LoadTexture no_vram_alloc "PanelSprites/PA_options"
  LoadTexture no_vram_alloc "PanelSprites/PA_nuke"
  LoadTexture no_vram_alloc "PanelSprites/PA_shop"
  LoadTexture no_vram_alloc "PanelSprites/PA_fonts"
  LoadTexture no_vram_alloc "PanelSprites/PA_set_cust"
  LoadTexture no_vram_alloc "PanelSprites/PA_skip_cust"
  LoadTexture no_vram_alloc "PanelSprites/PA_restart"
  LoadTexture no_vram_alloc "PanelSprites/PA_model"
  LoadTexture no_vram_alloc "PanelSprites/PA_startauto"
  LoadTexture no_vram_alloc "PanelSprites/PA_stopauto"
  LoadTexture no_vram_alloc "PanelSprites/PA_pro"
  LoadTexture no_vram_alloc "PanelSprites/PA_mode"
  LoadTexture no_vram_alloc "PanelSprites/PA_sound"
  LoadTexture no_vram_alloc "PanelSprites/PA_cheats"
  LoadTexture no_vram_alloc "PanelSprites/PA_quit"
  LoadTexture no_vram_alloc "PanelSprites/PA_pause"
  LoadTexture no_vram_alloc "PanelSprites/PA_gap"
  LoadTexture no_vram_alloc "PanelSprites/PA_taunt"
  LoadTexture no_vram_alloc "PanelSprites/PA_create"
  LoadTexture no_vram_alloc "PanelSprites/PA_controls"
  LoadTexture no_vram_alloc "PanelSprites/PA_movie"
  LoadTexture no_vram_alloc "PanelSprites/PA_replay"
  LoadTexture no_vram_alloc "PanelSprites/PA_homie"
  LoadTexture no_vram_alloc "PanelSprites/PA_hardware"
  LoadTexture no_vram_alloc "PanelSprites/PA_connection"
  LoadTexture no_vram_alloc "PanelSprites/goal_left"
  LoadTexture no_vram_alloc "PanelSprites/goal_mid"
  LoadTexture no_vram_alloc "PanelSprites/goal_right"
  LoadTexture no_vram_alloc "PanelSprites/goal_line"
  LoadTexture no_vram_alloc "PanelSprites/stats_notch"
  LoadTexture no_vram_alloc "PanelSprites/generic_key"
  LoadTexture no_vram_alloc "PanelSprites/key_left"
  LoadTexture no_vram_alloc "PanelSprites/key_middle"
  LoadTexture no_vram_alloc "PanelSprites/key_right"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/pip_on"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/bottom_l_cap"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/bottom_mid"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/bottom_r_cap"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/highlight_skater"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/left_arrow"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/lock_skater"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/longbar"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/longbar_cap"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/mainbar"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/mainbar_join"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/off_skater"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/right_arrow"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/stats_bg"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/tab"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/up_arrow"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/tab1"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/tab2"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/tab3"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/repeat_piece"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/repeat_piece2"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/repeat_piece3"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/menu_bottom"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/down_arrow"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_board"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_done"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_head"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_info"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_legs"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_pads"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_resize"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_secret"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_scale"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_tat"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_torso"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/ED_tricks"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/edit_bar"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/bw_slider"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/colorbar"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/scalebar"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/scale_down"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/scale_up"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/level_top_piece"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/level_repeat_mid"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/level_lower_piece"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/level_bottom_piece"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/level_bottom_cap"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/longbar_edgy"
  LoadTexture no_vram_alloc "PanelSprites/THPS4"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/grungeframe_top"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/grungeframe_mid"
  LoadTexture no_vram_alloc "PanelSprites/SkateSprites/grungeframe_bot"
  LoadTexture no_vram_alloc "PanelSprites/MemCardSprites/mem_career"
  LoadTexture no_vram_alloc "PanelSprites/MemCardSprites/mem_park"
  LoadTexture no_vram_alloc "PanelSprites/MemCardSprites/mem_replay"
  LoadTexture no_vram_alloc "PanelSprites/MemCardSprites/mem_skater"
  LoadTexture no_vram_alloc "PanelSprites/MemCardSprites/mem_bad"
  LoadTexture no_vram_alloc "PanelSprites/MemCardSprites/mem_net"
  LoadTexture no_vram_alloc "PanelSprites/pro_burnquist"
  LoadTexture no_vram_alloc "PanelSprites/pro_caballero"
  LoadTexture no_vram_alloc "PanelSprites/pro_campbell"
  LoadTexture no_vram_alloc "PanelSprites/pro_custom"
  LoadTexture no_vram_alloc "PanelSprites/pro_glifberg"
  LoadTexture no_vram_alloc "PanelSprites/pro_hawk"
  LoadTexture no_vram_alloc "PanelSprites/pro_koston"
  LoadTexture no_vram_alloc "PanelSprites/pro_lasek"
  LoadTexture no_vram_alloc "PanelSprites/pro_margera"
  LoadTexture no_vram_alloc "PanelSprites/pro_mullen"
  LoadTexture no_vram_alloc "PanelSprites/pro_muska"
  LoadTexture no_vram_alloc "PanelSprites/pro_reynolds"
  LoadTexture no_vram_alloc "PanelSprites/pro_rowley"
  LoadTexture no_vram_alloc "PanelSprites/pro_steamer"
  LoadTexture no_vram_alloc "PanelSprites/pro_thomas"
  LoadTexture no_vram_alloc "PanelSprites/PA_Stats"
  LoadTexture no_vram_alloc "PanelSprites/comp_single_line"
  LoadTexture no_vram_alloc "PanelSprites/PA_trick"
  LoadTexture no_vram_alloc "PanelSprites/PA_grab"
  LoadTexture no_vram_alloc "PanelSprites/PA_flip"
  LoadTexture no_vram_alloc "PanelSprites/PA_lip"
  LoadTexture no_vram_alloc "PanelSprites/PA_special"
  LoadTexture no_vram_alloc "PanelSprites/parked_piece_frame"
  LoadTexture no_vram_alloc "PanelSprites/HighScore"
  LoadTexture no_vram_alloc "PanelSprites/bot_gradient"
  LoadTexture no_vram_alloc "PanelSprites/top_gradient"
  LoadTexture no_vram_alloc "PanelSprites/bink"
  LoadTexture no_vram_alloc "PanelSprites/comp_base_line"
  LoadTexture no_vram_alloc "PanelSprites/comp_fill"
  LoadTexture no_vram_alloc "PanelSprites/comp_end_cap"
  LoadTexture no_vram_alloc "PanelSprites/comp_hori_lines"
  LoadTexture no_vram_alloc "PanelSprites/comp_tall_line"
  LoadTexture no_vram_alloc "PanelSprites/PA_goals"
  LoadTexture no_vram_alloc "better4/openspy"
endscript
script remove_temp_textures_from_vram
  RemoveTextureFromVram no_assert "paused"
  RemoveTextureFromVram no_assert "SlicePause_1"
  RemoveTextureFromVram no_assert "SlicePause_2"
  RemoveTextureFromVram no_assert "SlicePause_3"
  RemoveTextureFromVram no_assert "SlicePause_4"
  RemoveTextureFromVram no_assert "SlicePause_5"
  RemoveTextureFromVram no_assert "SlicePause_6"
  RemoveTextureFromVram no_assert "SlicePause_7"
  RemoveTextureFromVram no_assert "PA_continue"
  RemoveTextureFromVram no_assert "PA_retry"
  RemoveTextureFromVram no_assert "PA_end"
  RemoveTextureFromVram no_assert "PA_view"
  RemoveTextureFromVram no_assert "PA_rescore"
  RemoveTextureFromVram no_assert "PA_level"
  RemoveTextureFromVram no_assert "PA_save"
  RemoveTextureFromVram no_assert "PA_Load"
  RemoveTextureFromVram no_assert "PA_options"
  RemoveTextureFromVram no_assert "PA_shop"
  RemoveTextureFromVram no_assert "PA_fonts"
  RemoveTextureFromVram no_assert "PA_set_cust"
  RemoveTextureFromVram no_assert "PA_skip_cust"
  RemoveTextureFromVram no_assert "PA_restart"
  RemoveTextureFromVram no_assert "PA_model"
  RemoveTextureFromVram no_assert "PA_startauto"
  RemoveTextureFromVram no_assert "PA_stopauto"
  RemoveTextureFromVram no_assert "PA_pro"
  RemoveTextureFromVram no_assert "PA_mode"
  RemoveTextureFromVram no_assert "PA_sound"
  RemoveTextureFromVram no_assert "PA_cheats"
  RemoveTextureFromVram no_assert "PA_quit"
  RemoveTextureFromVram no_assert "PA_pause"
  RemoveTextureFromVram no_assert "PA_gap"
  RemoveTextureFromVram no_assert "PA_taunt"
  RemoveTextureFromVram no_assert "PA_create"
  RemoveTextureFromVram no_assert "PA_controls"
  RemoveTextureFromVram no_assert "PA_movie"
  RemoveTextureFromVram no_assert "PA_replay"
  RemoveTextureFromVram no_assert "PA_homie"
  RemoveTextureFromVram no_assert "PA_hardware"
  RemoveTextureFromVram no_assert "PA_connection"
  RemoveTextureFromVram no_assert "goal_left"
  RemoveTextureFromVram no_assert "goal_mid"
  RemoveTextureFromVram no_assert "goal_right"
  RemoveTextureFromVram no_assert "goal_line"
  RemoveTextureFromVram no_assert "stats_notch"
  RemoveTextureFromVram no_assert "generic_key"
  RemoveTextureFromVram no_assert "key_left"
  RemoveTextureFromVram no_assert "key_middle"
  RemoveTextureFromVram no_assert "key_right"
  RemoveTextureFromVram no_assert "pip_on"
  RemoveTextureFromVram no_assert "bottom_l_cap"
  RemoveTextureFromVram no_assert "bottom_mid"
  RemoveTextureFromVram no_assert "bottom_r_cap"
  RemoveTextureFromVram no_assert "highlight_skater"
  RemoveTextureFromVram no_assert "left_arrow"
  RemoveTextureFromVram no_assert "lock_skater"
  RemoveTextureFromVram no_assert "longbar"
  RemoveTextureFromVram no_assert "longbar_cap"
  RemoveTextureFromVram no_assert "mainbar"
  RemoveTextureFromVram no_assert "mainbar_join"
  RemoveTextureFromVram no_assert "off_skater"
  RemoveTextureFromVram no_assert "right_arrow"
  RemoveTextureFromVram no_assert "stats_bg"
  RemoveTextureFromVram no_assert "tab"
  RemoveTextureFromVram no_assert "up_arrow"
  RemoveTextureFromVram no_assert "tab1"
  RemoveTextureFromVram no_assert "tab2"
  RemoveTextureFromVram no_assert "tab3"
  RemoveTextureFromVram no_assert "repeat_piece"
  RemoveTextureFromVram no_assert "repeat_piece2"
  RemoveTextureFromVram no_assert "repeat_piece3"
  RemoveTextureFromVram no_assert "menu_bottom"
  RemoveTextureFromVram no_assert "down_arrow"
  RemoveTextureFromVram no_assert "ED_board"
  RemoveTextureFromVram no_assert "ED_done"
  RemoveTextureFromVram no_assert "ED_head"
  RemoveTextureFromVram no_assert "ED_info"
  RemoveTextureFromVram no_assert "ED_legs"
  RemoveTextureFromVram no_assert "ED_pads"
  RemoveTextureFromVram no_assert "ED_resize"
  RemoveTextureFromVram no_assert "ED_secret"
  RemoveTextureFromVram no_assert "ED_scale"
  RemoveTextureFromVram no_assert "ED_tat"
  RemoveTextureFromVram no_assert "ED_torso"
  RemoveTextureFromVram no_assert "ED_tricks"
  RemoveTextureFromVram no_assert "edit_bar"
  RemoveTextureFromVram no_assert "bw_slider"
  RemoveTextureFromVram no_assert "colorbar"
  RemoveTextureFromVram no_assert "scalebar"
  RemoveTextureFromVram no_assert "scale_down"
  RemoveTextureFromVram no_assert "scale_up"
  RemoveTextureFromVram no_assert "level_top_piece"
  RemoveTextureFromVram no_assert "level_repeat_mid"
  RemoveTextureFromVram no_assert "level_lower_piece"
  RemoveTextureFromVram no_assert "level_bottom_piece"
  RemoveTextureFromVram no_assert "level_bottom_cap"
  RemoveTextureFromVram no_assert "longbar_edgy"
  RemoveTextureFromVram no_assert "THPS4"
  RemoveTextureFromVram no_assert "grungeframe_top"
  RemoveTextureFromVram no_assert "grungeframe_mid"
  RemoveTextureFromVram no_assert "grungeframe_bot"
  RemoveTextureFromVram no_assert "mem_career"
  RemoveTextureFromVram no_assert "mem_park"
  RemoveTextureFromVram no_assert "mem_replay"
  RemoveTextureFromVram no_assert "mem_skater"
  RemoveTextureFromVram no_assert "mem_bad"
  RemoveTextureFromVram no_assert "mem_net"
  RemoveTextureFromVram no_assert "pro_burnquist"
  RemoveTextureFromVram no_assert "pro_caballero"
  RemoveTextureFromVram no_assert "pro_campbell"
  RemoveTextureFromVram no_assert "pro_custom"
  RemoveTextureFromVram no_assert "pro_glifberg"
  RemoveTextureFromVram no_assert "pro_hawk"
  RemoveTextureFromVram no_assert "pro_koston"
  RemoveTextureFromVram no_assert "pro_lasek"
  RemoveTextureFromVram no_assert "pro_margera"
  RemoveTextureFromVram no_assert "pro_mullen"
  RemoveTextureFromVram no_assert "pro_muska"
  RemoveTextureFromVram no_assert "pro_reynolds"
  RemoveTextureFromVram no_assert "pro_rowley"
  RemoveTextureFromVram no_assert "pro_steamer"
  RemoveTextureFromVram no_assert "pro_thomas"
  RemoveTextureFromVram no_assert "PA_Stats"
  RemoveTextureFromVram no_assert "comp_single_line"
  RemoveTextureFromVram no_assert "PA_trick"
  RemoveTextureFromVram no_assert "PA_grab"
  RemoveTextureFromVram no_assert "PA_flip"
  RemoveTextureFromVram no_assert "PA_lip"
  RemoveTextureFromVram no_assert "PA_special"
  RemoveTextureFromVram no_assert "parked_piece_frame"
  RemoveTextureFromVram no_assert "HighScore"
  RemoveTextureFromVram no_assert "bot_gradient"
  RemoveTextureFromVram no_assert "top_gradient"
  RemoveTextureFromVram no_assert "bink"
  RemoveTextureFromVram no_assert "comp_base_line"
  RemoveTextureFromVram no_assert "comp_fill"
  RemoveTextureFromVram no_assert "comp_end_cap"
  RemoveTextureFromVram no_assert "comp_hori_lines"
  RemoveTextureFromVram no_assert "comp_tall_line"
  RemoveTextureFromVram no_assert "PA_goals"
  if IsPS2
    RemoveTextureFromVram no_assert "gslogo"
  endif
endscript
script add_pause_menu_textures_to_vram
  AddTextureToVram "paused"
  AddTextureToVram "SlicePause_1"
  AddTextureToVram "SlicePause_2"
  AddTextureToVram "SlicePause_3"
  AddTextureToVram "SlicePause_4"
  AddTextureToVram "SlicePause_5"
  AddTextureToVram "SlicePause_6"
  AddTextureToVram "SlicePause_7"
  AddTextureToVram "PA_continue"
  AddTextureToVram "PA_retry"
  AddTextureToVram "PA_end"
  AddTextureToVram "PA_view"
  AddTextureToVram "PA_rescore"
  AddTextureToVram "PA_level"
  AddTextureToVram "PA_save"
  AddTextureToVram "PA_options"
  AddTextureToVram "PA_shop"
  AddTextureToVram "PA_fonts"
  AddTextureToVram "PA_set_cust"
  AddTextureToVram "PA_skip_cust"
  AddTextureToVram "PA_restart"
  AddTextureToVram "PA_model"
  AddTextureToVram "PA_startauto"
  AddTextureToVram "PA_stopauto"
  AddTextureToVram "PA_pro"
  AddTextureToVram "PA_mode"
  AddTextureToVram "PA_sound"
  AddTextureToVram "PA_cheats"
  AddTextureToVram "PA_quit"
  AddTextureToVram "PA_pause"
  AddTextureToVram "PA_gap"
  AddTextureToVram "PA_taunt"
  AddTextureToVram "PA_create"
  AddTextureToVram "PA_movie"
  AddTextureToVram "PA_replay"
  AddTextureToVram "goal_left"
  AddTextureToVram "goal_mid"
  AddTextureToVram "goal_right"
  AddTextureToVram "goal_line"
  AddTextureToVram "stats_bg"
  AddTextureToVram "stats_notch"
  AddTextureToVram "pip_on"
endscript
script remove_pause_menu_textures_from_vram
  RemoveTextureFromVram "paused"
  RemoveTextureFromVram "SlicePause_1"
  RemoveTextureFromVram "SlicePause_2"
  RemoveTextureFromVram "SlicePause_3"
  RemoveTextureFromVram "SlicePause_4"
  RemoveTextureFromVram "SlicePause_5"
  RemoveTextureFromVram "SlicePause_6"
  RemoveTextureFromVram "SlicePause_7"
  RemoveTextureFromVram "PA_continue"
  RemoveTextureFromVram "PA_retry"
  RemoveTextureFromVram "PA_end"
  RemoveTextureFromVram "PA_view"
  RemoveTextureFromVram "PA_rescore"
  RemoveTextureFromVram "PA_level"
  RemoveTextureFromVram "PA_save"
  RemoveTextureFromVram "PA_options"
  RemoveTextureFromVram "PA_shop"
  RemoveTextureFromVram "PA_fonts"
  RemoveTextureFromVram "PA_set_cust"
  RemoveTextureFromVram "PA_skip_cust"
  RemoveTextureFromVram "PA_restart"
  RemoveTextureFromVram "PA_model"
  RemoveTextureFromVram "PA_startauto"
  RemoveTextureFromVram "PA_stopauto"
  RemoveTextureFromVram "PA_pro"
  RemoveTextureFromVram "PA_mode"
  RemoveTextureFromVram "PA_sound"
  RemoveTextureFromVram "PA_cheats"
  RemoveTextureFromVram "PA_quit"
  RemoveTextureFromVram "PA_pause"
  RemoveTextureFromVram "PA_gap"
  RemoveTextureFromVram "PA_taunt"
  RemoveTextureFromVram "PA_create"
  RemoveTextureFromVram "PA_movie"
  RemoveTextureFromVram "PA_replay"
  RemoveTextureFromVram "goal_left"
  RemoveTextureFromVram "goal_mid"
  RemoveTextureFromVram "goal_right"
  RemoveTextureFromVram "goal_line"
  RemoveTextureFromVram "stats_bg"
  RemoveTextureFromVram "stats_notch"
  RemoveTextureFromVram "pip_on"
endscript
script load_all_textures
endscript
script sprite_focus
  SetProps rgba = [ 127 102 0 128 ]
  SetProps blur_effect
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } scale_sprite_up
  RunScriptOnScreenElement id = <id> do_blur_effect
  SetScreenElementProps {
    id = { <id> child = 0 }
    rgba = [ 127 102 0 128 ]
  }
endscript
script sprite_unfocus
  generic_menu_pad_up_down_sound
  SetProps rgba = [ 88 105 112 128 ]
  SetProps no_blur_effect
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } scale_sprite_down
  SetScreenElementProps {
    id = { <id> child = 0 }
    rgba = [ 128 128 128 40 ]
  }
endscript
script scale_sprite_up
  DoMorph time = 0.1 scale = 0.95
endscript
script scale_sprite_down
  DoMorph time = 0.0 scale = 0
endscript
script do_scale_up rgba = [ 127 102 0 100 ]
  GetTags
  SetProps rgba = <rgba>
  RunScriptOnScreenElement id = <id> do_random_effect params = { id = <id> }
endscript
script do_scale_down rgba = [ 88 105 112 128 ]
  if not GotParam no_sound
    generic_menu_pad_up_down_sound
  endif
  KillSpawnedScript name = do_random_effect
  SetProps no_blur_effect
  SetProps rgba = <rgba>
endscript
script do_random_effect
  GetTags
  SetTags random_effect_done = 0
  RunScriptOnScreenElement id = <id> do_random_effect2
  begin
    GetTags
    if ( <random_effect_done> = 1 )
      SetTags random_effect_done = 0
      RunScriptOnScreenElement id = <id> do_random_effect2 params = {
        id = <id>
        effect = random( @2 @3 @5 @8 @2 @3 @5 @2 @3 @5 @2 @10 @3 @2 @3 @5 @2 @3 @8 @3 @5 @9 @2 @3 @5 @2 @3 @5 @6 @2 @3 @9 @5 @3 @2 @3 @5 @2 @3 @5 @2 @3 @5 @6 @7 @1 ) 
      }
    endif
    Wait 10 frame
  repeat
endscript
script do_random_effect2
  switch <effect>
  case 1
    DoMorph time = 0.04 scale = (1.1, 0.95) alpha = 0.1 relative_scale
    DoMorph time = 0.04 scale = 1 alpha = 1 relative_scale
  case 2
    DoMorph time = 0.05 pos = { (-0.75, 0.5) relative }
    DoMorph time = 0.05 pos = { (1.5, -1) relative }
    DoMorph time = 0.05 pos = { (-0.75, 0.5) relative }
  case 3
    DoMorph time = 0.05 alpha = 0.6
    DoMorph time = 0.05 alpha = 1
  case 4
    SetProps blur_effect
    do_blur_effect_highlight
    SetProps no_blur_effect
  case 5
    DoMorph time = 0.05 pos = { (-1.5, 0.5) relative }
    DoMorph time = 0.05 pos = { (3, -1) relative }
    DoMorph time = 0.05 pos = { (-1.5, 0.5) relative }
  case 6
    DoMorph time = 0.05 pos = { (-0.75, 1.5) relative }
    DoMorph time = 0.05 pos = { (1.5, -3) relative }
    DoMorph time = 0.05 pos = { (-0.75, 1.5) relative }
  case 7
    SetProps blur_effect
    do_blur_effect_accept
    SetProps no_blur_effect
  case 8
    DoMorph time = 0.05 scale = 1.1 relative_scale
    DoMorph time = 0.05 scale = 1 relative_scale
  case 9
    DoMorph time = 0.04 scale = (0.95, 0.65) alpha = 0.8 relative_scale
    DoMorph time = 0.04 scale = 1 alpha = 1 relative_scale
  case 10
    DoMorph time = 0.05 pos = { (-2, 0) relative }
    DoMorph time = 0.05 pos = { (4, 0) relative }
    DoMorph time = 0.05 pos = { (-2, 0) relative }
  default
    SetProps blur_effect
    do_blur_effect
    SetProps no_blur_effect
  endswitch
  SetTags random_effect_done = 1
endscript
script hide_root_window
  RunScriptOnScreenElement id = root_window hide_screen_element
endscript
script unhide_root_window
  RunScriptOnScreenElement id = root_window unhide_screen_element
endscript
script hide_screen_element
  DoMorph scale = 0
endscript
script unhide_screen_element
  DoMorph scale = 1
endscript
script create_taunt_options_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  make_new_menu menu_id = network_options_menu vmenu_id = network_options_vmenu menu_title = "" pos = (226, 110) helper_text = generic_helper_text
  SetScreenElementProps { id = network_options_vmenu event_handlers = [
      { pad_back launch_setup_options_menu }
    ]
  }
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "TAUNT OPTIONS"
    scale = 1.4
    pos = (166, 118)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  main_menu_add_item text = "" not_focusable = not_focusable dims = (200, 18)
  if IsPS2
    noway_buttons = "(\be+\bf+\b2)"
    daddy_buttons = "(\be+\bf+\b1)"
    props_buttons = "(\be+\bf+\b0)"
    getsome_buttons = "(\be+\bf+\b3)"
  else
    noway_buttons = "(\bg+\b2)"
    daddy_buttons = "(\bg+\b1)"
    props_buttons = "(\bg+\b0)"
    getsome_buttons = "(\bg+\b3)"
  endif
  menu_item_dims = (200, 22)
  GetPreferenceString pref_type = taunt no_way_string
  taunt_options_add_item text = "'No Way' Text" button_text = <noway_buttons> text_pos = (110, -5) id = no_way_item pad_choose_script = launch_onscreen_keyboard_from_taunt_menu pad_choose_params = { field = "no_way_string" text = <ui_string> title = "NO WAY STRING" min_length = 1 max_length = 31 } dims = <menu_item_dims>
  main_menu_add_item text = <ui_string> id = no_way_item_string max_width = 300 rgba = [ 80 80 80 128 ] scale = 0.9 not_focusable = not_focusable dims = <menu_item_dims> font = dialog
  GetPreferenceString pref_type = taunt your_daddy_string
  taunt_options_add_item text = "'Your Daddy' Text" button_text = <daddy_buttons> text_pos = (137, -5) id = your_daddy_item pad_choose_script = launch_onscreen_keyboard_from_taunt_menu pad_choose_params = { field = "your_daddy_string" text = <ui_string> title = "YOUR DADDY STRING" min_length = 1 max_length = 31 } dims = <menu_item_dims>
  main_menu_add_item text = <ui_string> id = your_daddy_item_string max_width = 300 rgba = [ 80 80 80 128 ] scale = 0.9 not_focusable = not_focusable dims = <menu_item_dims> font = dialog
  GetPreferenceString pref_type = taunt props_string
  taunt_options_add_item text = "'Props' Text" button_text = <props_buttons> text_pos = (105, -5) id = props_item pad_choose_script = launch_onscreen_keyboard_from_taunt_menu pad_choose_params = { field = "props_string" text = <ui_string> title = "PROPS STRING" min_length = 1 max_length = 31 } dims = <menu_item_dims>
  main_menu_add_item text = <ui_string> id = props_item_string max_width = 300 rgba = [ 80 80 80 128 ] scale = 0.9 not_focusable = not_focusable dims = <menu_item_dims> font = dialog
  GetPreferenceString pref_type = taunt get_some_string
  taunt_options_add_item text = "'Get Some' Text" button_text = <getsome_buttons> text_pos = (125, -5) id = get_some_item pad_choose_script = launch_onscreen_keyboard_from_taunt_menu pad_choose_params = { field = "get_some_string" text = <ui_string> title = "GET SOME STRING" min_length = 1 max_length = 31 } dims = <menu_item_dims>
  main_menu_add_item text = <ui_string> id = get_some_item_string max_width = 300 rgba = [ 80 80 80 128 ] scale = 0.9 not_focusable = not_focusable dims = <menu_item_dims> font = dialog
  set_sub_bg type = SpriteElement pos = (125, 115) scale = (1.74, 1.1) just = [ left top ]
  create_icon texture = PA_taunt pos = (113, 115)
  CreateScreenElement {
    type = SpriteElement
    parent = network_options_menu
    id = taunt_blackbar_1
    texture = black
    pos = (145, 190)
    rgba = [ 0 0 0 60 ]
    just = [ left center ]
    scale = (90, 5)
  }
  CreateScreenElement {
    type = SpriteElement
    parent = network_options_menu
    id = taunt_blackbar_2
    texture = black
    pos = (145, 240)
    rgba = [ 0 0 0 60 ]
    just = [ left center ]
    scale = (90, 5)
  }
  CreateScreenElement {
    type = SpriteElement
    parent = network_options_menu
    id = taunt_blackbar_3
    texture = black
    pos = (145, 291)
    rgba = [ 0 0 0 60 ]
    just = [ left center ]
    scale = (90, 5)
  }
  CreateScreenElement {
    type = SpriteElement
    parent = network_options_menu
    id = taunt_blackbar_4
    texture = black
    pos = (145, 342)
    rgba = [ 0 0 0 60 ]
    just = [ left center ]
    scale = (90, 5)
  }
  draw_menu_box delta_pos = (94, 30) middle_repeat = 12 box_right_scale = (0.8, 0.935) scale = (1.5, 1) box_bottom_scale = (1.45, 1) box_right_offset = (-23, 0)
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script taunt_options_add_item { parent = current_menu
    font = small
    highlight_bar_scale = (1.4, 1.3)
    highlight_bar_pos = (97, -7)
    focus_script = main_menu_focus
    unfocus_script = main_menu_unfocus
    text_just = [ right center ]
    text_pos = (95, -5)
    dims = (200, 20)
    pad_choose_script = nullscript
  }
  if GotParam not_focusable
    CreateScreenElement {
      type = ContainerElement
      parent = <parent>
      id = <id>
      dims = <dims>
      event_handlers = [ { focus <focus_script> params = <focus_params> }
        { unfocus <unfocus_script> params = <unfocus_params> }
        { pad_choose <pad_choose_script> params = <pad_choose_params> }
        { pad_start <pad_choose_script> params = <pad_choose_params> }
      ]
      replace_handlers
      not_focusable
    }
  else
    CreateScreenElement {
      type = ContainerElement
      parent = <parent>
      id = <id>
      dims = <dims>
      event_handlers = [ { focus <focus_script> params = <focus_params> }
        { unfocus <unfocus_script> params = <unfocus_params> }
        { pad_choose generic_menu_pad_choose_sound }
        { pad_choose <pad_choose_script> params = <pad_choose_params> }
        { pad_start <pad_choose_script> params = <pad_choose_params> }
      ]
      replace_handlers
    }
  endif
   <anchor_id> = <id>
  if GotParam mark_first_input
    SetScreenElementProps {
      id = <anchor_id>
      event_handlers = [ { pad_choose mark_first_input_received }
        { pad_choose generic_menu_pad_choose_sound }
        { pad_choose <pad_choose_script> params = <pad_choose_params> }
      ]
      replace_handlers
    }
  endif
  if GotParam not_focusable
     <text_rgba> = [ 60 60 60 75 ]
    CreateScreenElement {
      type = TextElement
      parent = <anchor_id>
      id = <text_id>
      font = <font>
      text = <text>
      scale = <scale>
      pos = <text_pos>
      just = <text_just>
      rgba = <text_rgba>
      not_focusable
    }
  else
     <text_rgba> = [ 88 105 112 128 ]
    CreateScreenElement {
      type = TextElement
      parent = <anchor_id>
      id = <text_id>
      font = <font>
      text = <text>
      scale = <scale>
      pos = <text_pos>
      just = <text_just>
      rgba = <text_rgba>
    }
  endif
  text_id = <id>
  if GotParam max_width
    truncate_string id = <id> max_width = <max_width>
  endif
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
    type = TextElement
    parent = <anchor_id>
    pos = ( <text_pos> + (20, 7) )
    font = <font>
    text = <button_text>
    scale = 0.8
    just = [ top right ]
    rgba = <text_rgba>
  }
endscript
script create_end_run_menu
  dialog_box_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  SetGameType freeskate2p
  SetCurrentGameType
  PauseGame
  add_pause_menu_textures_to_vram
  make_new_menu menu_id = end_run_menu vmenu_id = end_run_vmenu menu_title = "TWO PLAYERS"
  create_helper_text generic_helper_text_no_back
  make_text_sub_menu_item text = "Start Game" id = menu_end_run_start_game pad_choose_script = create_network_game_options_menu pad_choose_params = { end_run }
  make_text_sub_menu_item text = "Change Levels" id = menu_end_run_change_levels pad_choose_script = launch_level_select_menu pad_choose_params = { end_run }
  make_text_sub_menu_item text = "Split Mode" id = menu_end_run_split_mode pad_choose_script = create_split_menu pad_choose_params = { callback_script = create_end_run_menu end_run }
  make_text_sub_menu_item text = "Quit" id = menu_end_run_quit pad_choose_script = menu_confirm_quit pad_choose_params = { no_script = create_end_run_menu back_script = create_end_run_menu }
  set_sub_bg type = SpriteElement
  create_icon texture = PA_network
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
  kill_start_key_binding
endscript
script set_taunt_preference
  GetTextElementString id = keyboard_current_string
  set_preferences_from_ui prefs = taunt <...>
  destroy_onscreen_keyboard
  add_ss_menu_textures_to_vram
  create_taunt_options_menu
endscript
script taunt_back_from_keyboard
  destroy_onscreen_keyboard
  add_ss_menu_textures_to_vram
  create_taunt_options_menu
endscript
script launch_onscreen_keyboard_from_taunt_menu
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = pre_create_onscreen_keyboard callback_params = { allow_cancel keyboard_cancel_script = taunt_back_from_keyboard keyboard_done_script = set_taunt_preference keyboard_title = <title> <...> }
endscript
script pre_create_onscreen_keyboard
  remove_pause_menu_textures_from_vram
  create_onscreen_keyboard allow_cancel keyboard_cancel_script = taunt_back_from_keyboard keyboard_done_script = set_taunt_preference keyboard_title = <title> <...>
endscript
script generic_menu_update_arrows menu_id = current_menu
  if not ObjectExists id = <up_arrow_id>
    return
  endif
  if not ObjectExists id = <down_arrow_id>
    return
  endif
  if MenuSelectedIndexIs id = <menu_id> first
    SetScreenElementProps {
      id = <up_arrow_id>
      rgba = [ 128 128 128 0 ]
    }
  else
    SetScreenElementProps {
      id = <up_arrow_id>
      rgba = [ 128 128 128 128 ]
    }
  endif
  if MenuSelectedIndexIs id = <menu_id> last
    SetScreenElementProps {
      id = <down_arrow_id>
      rgba = [ 128 128 128 0 ]
    }
  else
    SetScreenElementProps {
      id = <down_arrow_id>
      rgba = [ 128 128 128 128 ]
    }
  endif
endscript
script generic_menu_pad_back
  generic_menu_pad_back_sound
  if GotParam callback
     <callback> <...>
  endif
endscript
script generic_menu_pad_choose
  if GotParam callback
     <callback> <...>
  endif
endscript
script generic_menu_pad_back_sound
  PlaySound MenuBack vol = 100
endscript
script generic_menu_pad_up_down_sound
endscript
script generic_menu_pad_choose_sound
  PlaySound MenuSelect vol = 100
endscript
script generic_menu_up_or_down_sound menu_id = current_menu
  if GotParam Up
    PlaySound MenuUp vol = 100
  endif
  if GotParam Down
    PlaySound MenuDown vol = 100
  endif
endscript
script generic_menu_scroll_sideways_sound
  PlaySound gui_type02 vol = 100
endscript
script parked_scroll_sideways_sound
  PlaySound gui_type02 vol = 100
endscript
script generic_keyboard_sound
  PlaySound GUI_click06
endscript
