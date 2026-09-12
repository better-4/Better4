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
