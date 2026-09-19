level_menu_game_index = 3 // 0: THPS, 1: THPS2, 2: THPS3, 3: THPS4
level_menu_num_games = 4

lvl_menu_helper_text = { helper_text_elements = [
  { text = "\b7/\b4 = Select" }
  { text = "\b2 = Back" }
  { text = "\b3 = Accept" }
  { text = "\b1 = Random Level" }
  ]
}

script better4_create_level_select_menu_game
  if ObjectExists id = level_select_anchor_game
    DestroyScreenElement id = level_select_anchor_game
  endif
  Change level_menu_game_index = 3 // Default to THPS4
  create_helper_text lvl_menu_helper_text

  SetScreenElementProps {
    id = level_select_vmenu
    event_handlers = [
      { pad_left better4_level_menu_left params = <...> }
      { pad_right better4_level_menu_right params = <...> }
      { pad_option better4_change_level_random params = <...>  }
    ]
  }

  CreateScreenElement {
    type = ContainerElement
    parent = level_select_anchor
    id = level_select_anchor_game
    dims = (640, 480)
    pos = (320, 240)
  }

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
    rgba = [ 128 128 128 100 ]
    z_priority = 10
  }
  CreateScreenElement {
    type = SpriteElement
    id = level_select_game_right
    parent = level_select_anchor_game
    pos = ( <pos> + (33, 0) )
    scale = (0.5, 0.5)
    texture = right_arrow
    rgba = [ 128 128 128 100 ]
    z_priority = 10
  }
endscript

script better4_level_menu_left
  generic_menu_up_or_down_sound Down
  RunScriptOnScreenElement id = level_select_game_left menu_blink_arrow

  <new_index> = level_menu_game_index
  if ( <new_index> > 0 )
    <new_index> = ( <new_index> - 1 )
  else
    <new_index> = ( level_menu_num_games - 1 )
  endif
  Printf "@@ LEVEL_MENU_LEFT: prev=%p new=%n" p = level_menu_game_index n = <new_index>
  Change level_menu_game_index = <new_index>

  better4_level_menu_refresh
endscript

script better4_level_menu_right
  generic_menu_up_or_down_sound Up
  RunScriptOnScreenElement id = level_select_game_right menu_blink_arrow

  <new_index> = level_menu_game_index
  if ( <new_index> < ( level_menu_num_games - 1 ) )
    <new_index> = ( <new_index> + 1 )
  else
    <new_index> = 0
  endif
  Printf "@@ LEVEL_MENU_RIGHT: prev=%p new=%n" p = level_menu_game_index n = <new_index>
  Change level_menu_game_index = <new_index>

  better4_level_menu_refresh
endscript

script better4_level_menu_refresh
  switch level_menu_game_index
  case 0
    <text> = "THPS"
    <levels> = thps_level_info
  case 1
    <text> = "THPS2"
    <levels> = thps2_level_info
  case 2
    <text> = "THPS3"
    <levels> = thps3_level_info
  case 3
    <text> = "THPS4"
    <levels> = level_select_menu_level_info
  endswitch
  Printf "@@ LEVEL_MENU_REFRESH: text=%t" t = <text>

  SetScreenElementProps {
    id = level_select_game_text
    text = <text>
  }
  better4_level_menu_list levels = <levels>
endscript

script better4_level_menu_list
  Printf "@@ 1"
  FireEvent type = unfocus target = level_select_vmenu

  Printf "@@ 2"
  if ObjectExists id = level_select_vmenu
    SetScreenElementLock id = level_select_vmenu off
    DestroyScreenElement id = level_select_vmenu recurse preserve_parent
  endif

  Printf "@@ 3"
  AssignAlias id = level_select_vmenu alias = current_menu
  Printf "@@ 4"
  ForEachIn <levels> do = level_select_menu_add_item params = <...>
  Printf "@@ 5"
  FireEvent type = focus target = level_select_vmenu
  Printf "@@ 6"
endscript

script better4_change_level_random
  GetArraySize level_info
  begin
    GetRandomValue name = index integer a = 0 b = ( <array_size> - 3 ) // excludes created parks and motox
    <text> = ( ( level_info [ <index> ] ).name )
    <level> = ( ( level_info [ <index> ] ).checksum )
    if not LevelIs <level>
      if InNetGame
        level_select_change_level <...> show_warning
      else
        if GotParam from_server_options
          level_select_menu_exit <...> net_pad_back = 0 from_server_options
        else
          level_select_change_level <...>
        endif
      endif
      break
    endif
  repeat
endscript
