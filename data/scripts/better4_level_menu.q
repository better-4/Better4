script better4_create_level_menu pad_back_script = level_select_menu_exit
  if GameModeEquals is_career
    // Always use vanilla level menu for career
    create_level_select_menu <...>
    return
  endif

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

  better4_create_level_menu_block {
    pad_back_script = <pad_back_script>
    middle_texture = repeat_piece
    bottom_texture = menu_bottom
    <...>
  }

  RemoveParameter text
  RemoveParameter name

  ForEachIn level_select_menu_level_info do = level_select_menu_add_item params = <...>

  RunScriptOnScreenElement id = level_select_anchor_top select_skater_menu_animate_top
  RunScriptOnScreenElement id = level_select_anchor_middle select_skater_menu_animate_stats

  FireEvent type = focus target = level_select_vmenu

  SetButtonEventMappings block_menu_input
  WaitForEvent type = select_skater_menu_animate_stats_done
  SetButtonEventMappings unblock_menu_input

  SetScreenElementLock id = root_window on

  AssignAlias id = level_select_anchor alias = current_menu_anchor
endscript

script better4_create_level_menu_block
  if GameModeEquals is_career
    // Always use vanilla level menu for career
    level_select_create_menu_block <...>
    return
  endif

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

  better4_create_level_menu_tabs

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
      { pad_left better4_level_menu_left }
      { pad_right better4_level_menu_right }
    ]
    padding_scale = 0.9
    replace_handlers
  }
  AssignAlias id = level_select_vmenu alias = current_menu
  if GameModeEquals is_career
    goals_title_rgba = [ 88 105 112 128 ]
  else
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
      texture = repeat_piece
      pos = <pos>
      just = [ left top ]
      scale = (1.04, 1)
      rgba = [ 128 128 128 90 ]
    }
  repeat 13
  bottom_cap_rgba = [ 128 128 128 90 ]
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  GetStackedScreenElementPos y id = <id>

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
endscript

script better4_create_level_menu_tabs
  GetStackedScreenElementPos Y id = select_skater_mainbar offset = (0, 10)
  CreateScreenElement {
    parent = level_select_anchor
    type = SpriteElement
    id = level_select_menu_top_sprite
    texture = tab1
    scale = (1, 1)
    rgba = [ 128 128 128 100 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 9998
  }
  GetStackedScreenElementPos Y id = select_skater_mainbar offset = (32, 18)
  CreateScreenElement {
    parent = level_select_anchor
    type = TextElement
    id = level_select_menu_top_text
    text = "THPS4"
    font = newtrickfont
    scale = (0.5)
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 9999
  }

  GetStackedScreenElementPos Y id = select_skater_mainbar offset = (0, 10)
  CreateScreenElement {
    parent = level_select_anchor
    type = SpriteElement
    id = level_select_menu_top_sprite2
    texture = tab2
    scale = (1, 1)
    rgba = [ 128 128 128 100 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 9996
  }
  GetStackedScreenElementPos Y id = select_skater_mainbar offset = (99, 18)
  CreateScreenElement {
    parent = level_select_anchor
    type = TextElement
    id = level_select_menu_top_text2
    text = "THPS3"
    font = newtrickfont
    scale = (0.5)
    rgba = [ 128 128 128 40 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 9997
  }
endscript

script better4_level_menu_left
  SetScreenElementProps {
    id = level_select_menu_top_sprite
    z_priority = 9998
  }
  SetScreenElementProps {
    id = level_select_menu_top_text
    z_priority = 9999
  }
  SetScreenElementProps {
    id = level_select_menu_top_sprite2
    z_priority = 9996
  }
  SetScreenElementProps {
    id = level_select_menu_top_text2
    rgba = [ 128 128 128 40 ]
    z_priority = 9997
  }
endscript

script better4_level_menu_right
  SetScreenElementProps {
    id = level_select_menu_top_sprite
    z_priority = 9996
  }
  SetScreenElementProps {
    id = level_select_menu_top_text
    z_priority = 9997
  }
  SetScreenElementProps {
    id = level_select_menu_top_sprite2
    z_priority = 9998
  }
  SetScreenElementProps {
    id = level_select_menu_top_text2
    rgba = [ 128 128 128 100 ]
    z_priority = 9999
  }
endscript

script better4_create_level_select_menu_game
  if ObjectExists id = level_select_anchor_game
    DestroyScreenElement id = level_select_anchor_game
  endif

  SetScreenElementProps {
    id = level_select_vmenu
    event_handlers = [
      { pad_left better4_level_menu_left }
      { pad_right better4_level_menu_right }
    ]
  }

  CreateScreenElement {
    type = ContainerElement
    parent = level_select_anchor
    id = level_select_anchor_game
    dims = (640, 480)
    pos = (320, 240)
  }

  // GetStackedScreenElementPos y id = select_skater_mainbar offset = (28, 5)
  GetStackedScreenElementPos y id = select_skater_mainbar offset = (128, 27)
  CreateScreenElement {
    type = TextElement
    id = level_select_game_text
    parent = level_select_anchor_game
    font = dialog
    text = "THPS4"
    rgba = [ 88 105 112 128 ]
    just = [ center center ]
    scale = 0.7
    pos = <pos>
    z_priority = 10
    not_focusable
  }

  CreateScreenElement {
    type = SpriteElement
    id = level_select_game_left
    parent = level_select_anchor_game
    pos = ( <pos> - (33, 0) )
    scale = (0.5, 0.5)
    texture = left_arrow
    // XXX (ellie): only start left at full alpha since thps4 is default
    rgba = [ 128 128 128 100 ]
    // rgba = [ 128 128 128 0 ]
    z_priority = 10
  }
  CreateScreenElement {
    type = SpriteElement
    id = level_select_game_right
    parent = level_select_anchor_game
    pos = ( <pos> + (33, 0) )
    scale = (0.5, 0.5)
    texture = right_arrow
    rgba = [ 128 128 128 0 ]
    z_priority = 10
  }
endscript

// XXX (ellie): make this cycle properly to add more levels at some point. maybe HMenu?
script better4_level_menu_left
  SetScreenElementProps {
    id = level_select_game_text
    text = "THPS3"
  }
  SetScreenElementProps {
    id = level_select_game_left
    rgba = [ 128 128 128 0 ]
  }
  SetScreenElementProps {
    id = level_select_game_right
    rgba = [ 128 128 128 100 ]
  }
  generic_menu_up_or_down_sound Down
  RunScriptOnScreenElement id = level_select_game_right menu_blink_arrow
  better4_level_menu_list levels = thps3_level_info
endscript

script better4_level_menu_right
  SetScreenElementProps {
    id = level_select_game_text
    text = "THPS4"
  }
  SetScreenElementProps {
    id = level_select_game_left
    rgba = [ 128 128 128 100 ]
  }
  SetScreenElementProps {
    id = level_select_game_right
    rgba = [ 128 128 128 0 ]
  }
  generic_menu_up_or_down_sound Up
  RunScriptOnScreenElement id = level_select_game_left menu_blink_arrow
  better4_level_menu_list levels = level_select_menu_level_info
endscript

script better4_level_menu_list
  if ObjectExists id = level_select_vmenu
    SetScreenElementLock id = level_select_vmenu off
    DestroyScreenElement id = level_select_vmenu recurse preserve_parent
  endif

  AssignAlias id = level_select_vmenu alias = current_menu
  ForEachIn <levels> do = level_select_menu_add_item params = <...>
  FireEvent type = focus target = level_select_vmenu
endscript
