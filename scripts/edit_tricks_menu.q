
edit_tricks_menu_1_index = 0
edit_tricks_menu_2_index = 0
script create_edit_tricks_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 gameframe
  endif
  remove_pause_menu_textures_from_vram
  add_edit_tricks_menu_textures_to_vram
  SetScreenElementLock id = root_window off
  kill_start_key_binding
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = edit_tricks_menu_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  AssignAlias id = edit_tricks_menu_anchor alias = current_menu_anchor
  create_helper_text generic_helper_text
  if not LevelIs load_skateshop
    PauseMusicAndStreams 1
  endif
  if GotParam from_ss_menu
    SetScreenElementProps {
      id = edit_tricks_menu_anchor
      event_handlers = [ { pad_back edit_tricks_menu_exit params = { from_ss_menu } }
        { pad_back generic_menu_pad_back_sound }
      ]
      replace_handlers
    }
  else
    SetScreenElementProps {
      id = edit_tricks_menu_anchor
      event_handlers = [ { pad_back edit_tricks_menu_exit }
        { pad_back generic_menu_pad_back_sound }
      ]
      replace_handlers
    }
  endif
  if ( LevelIs load_skateshop )
     <root_pos> = (80, 120)
  else
     <root_pos> = (180, 120)
  endif
  CreateScreenElement {
    type = SpriteElement
    parent = edit_tricks_menu_anchor
    texture = PA_Trick
    pos = ( <root_pos> + (3, 0) )
    just = [ left top ]
    rgba = [ 127 102 0 128 ]
    z_priority = 5
  }
  if GoalManager_HasActiveGoals
     <title> = "VIEW TRICKS"
  else
     <title> = "EDIT TRICKS"
  endif
  GetStackedScreenElementPos x id = <id>
  CreateScreenElement {
    type = TextElement
    parent = edit_tricks_menu_anchor
    id = edit_tricks_menu_title
    font = TestTitle
    text = <title>
    rgba = [ 128 128 128 98 ]
    scale = 1.4
    pos = ( <pos> + (0, 2) )
    just = [ left top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = edit_tricks_menu_anchor
    texture = options_bg
    scale = (1.17, 1.1)
    pos = ( <root_pos> + (18, 0) )
    just = [ left top ]
  }
  GetStackedScreenElementPos y id = edit_tricks_menu_title offset = (2, 17)
  CreateScreenElement {
    type = VMenu
    parent = current_menu_anchor
    id = edit_tricks_vmenu
    pos = <pos>
    just = [ left top ]
    event_handlers = [ { pad_up generic_menu_up_or_down_sound params = { up } }
      { pad_down generic_menu_up_or_down_sound params = { down } }
      { pad_back generic_menu_pad_back_sound }
    ]
  }
  AssignAlias id = edit_tricks_vmenu alias = current_menu
  edit_tricks_menu_add_item {
    first_item
    text = "Grab Tricks"
    pad_choose_script = create_edit_tricks_sub_menu
    pad_choose_params = { type = grab_tricks }
    focus_params = { highlight_bar_scale = (0.98, 1.3) highlight_bar_pos = (-24, -20) }
  }
  edit_tricks_menu_add_item {
    text = "Flip Tricks"
    pad_choose_script = create_edit_tricks_sub_menu
    pad_choose_params = { type = flip_tricks }
    focus_params = { highlight_bar_scale = (0.98, 1.3) highlight_bar_pos = (-24, -20) }
  }
  edit_tricks_menu_add_item {
    text = "Lip Tricks"
    pad_choose_script = create_edit_tricks_sub_menu
    pad_choose_params = { type = lip_tricks }
    focus_params = { highlight_bar_scale = (0.98, 1.3) highlight_bar_pos = (-24, -20) }
  }
  edit_tricks_menu_add_item {
    text = "Special Tricks"
    pad_choose_script = create_edit_tricks_sub_menu
    pad_choose_params = { type = special_tricks }
    focus_params = { highlight_bar_scale = (0.98, 1.3) highlight_bar_pos = (-24, -20) }
  }
  if GotParam from_ss_menu
    edit_tricks_menu_add_item {
      text = "Done"
      pad_choose_script = edit_tricks_menu_exit
      pad_choose_params = { from_ss_menu }
      focus_params = { highlight_bar_scale = (0.98, 1.3) highlight_bar_pos = (-24, -20) }
      last_item
    }
  else
    edit_tricks_menu_add_item {
      text = "Done"
      pad_choose_script = edit_tricks_menu_exit
      focus_params = { highlight_bar_scale = (0.98, 1.3) highlight_bar_pos = (-24, -20) }
      last_item
    }
  endif
  FireEvent type = focus target = current_menu_anchor
  FireEvent type = focus target = current_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script create_edit_tricks_sub_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  SetScreenElementLock id = root_window off
  switch <type>
  case grab_tricks
     <title> = "GRAB TRICKS"
     <icon_texture> = pa_grab
     <key_combo_array> = edit_tricks_menu_grab_key_combos
     <trick_type> = GrabTrick
     <vertical_bar_offset> = (85, 17)
     <key_combo_highlight_bar_scale> = (2, 1.2)
     <key_combo_short_highlight_bar_scale> = (0.38, 1.2)
     <trick_highlight_bar_scale> = (1.57, 1.3)
  case flip_tricks
     <title> = "FLIP TRICKS"
     <icon_texture> = pa_flip
     <key_combo_array> = edit_tricks_menu_flip_key_combos
     <vertical_bar_offset> = (85, 17)
     <trick_type> = FlipTrick
     <key_combo_highlight_bar_scale> = (2, 1.2)
     <key_combo_short_highlight_bar_scale> = (0.38, 1.2)
     <trick_highlight_bar_scale> = (1.57, 1.3)
  case lip_tricks
     <title> = "LIP TRICKS"
     <icon_texture> = pa_lip
     <key_combo_array> = edit_tricks_menu_lip_key_combos
     <trick_type> = LipMacro2
     <vertical_bar_offset> = (60, 17)
     <key_combo_highlight_bar_scale> = (2, 1.2)
     <key_combo_short_highlight_bar_scale> = (0.28, 1.2)
     <trick_highlight_bar_scale> = (1.67, 1.3)
  case special_tricks
     <title> = "SPECIAL TRICKS"
     <icon_texture> = pa_special
     <vertical_bar_offset> = (30, 17)
     <trick_type> = special_tricks
  endswitch
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = edit_tricks_sub_menu_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  AssignAlias id = edit_tricks_sub_menu_anchor alias = current_menu_anchor
  create_helper_text generic_helper_text
   <root_pos> = (40, 20)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = <icon_texture>
    pos = <root_pos>
    just = [ left top ]
    rgba = [ 127 102 0 128 ]
  }
  GetStackedScreenElementPos x id = <id> offset = (0, 2)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    id = edit_tricks_sub_menu_title
    font = TestTitle
    text = <title>
    rgba = [ 128 128 128 98 ]
    scale = 1.4
    pos = ( <pos> + (0, 2) )
    just = [ left top ]
  }
  GetStackedScreenElementPos y id = <id> offset = (-15, 1)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = <pos>
    just = [ left top ]
    scale = (127.75, 5)
    rgba = [ 0 0 0 128 ]
    z_priority = 1
  }
  set_sub_bg_goal {
    pos = (185, 23)
    goal_mid_scale = (20, 1.33)
  }
  GetStackedScreenElementPos y id = edit_tricks_sub_menu_title offset = (-10, 42)
  CreateScreenElement {
    type = VMenu
    parent = current_menu_anchor
    id = edit_tricks_menu_1
    pos = <pos>
    just = [ left top ]
    event_handlers = [ { pad_back edit_tricks_sub_menu_exit }
      { pad_up generic_menu_up_or_down_sound params = { up } }
      { pad_down generic_menu_up_or_down_sound params = { down } }
      { pad_back generic_menu_pad_back_sound }
      { focus edit_tricks_menu_create_current_mapping_list params = { key_combo_array = <key_combo_array> type = <type> } }
      { unfocus edit_tricks_menu_destroy_current_mapping_list }
    ]
  }
  GetStackedScreenElementPos y id = edit_tricks_sub_menu_title offset = <vertical_bar_offset>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = edit_tricks_menu_vertical_bar
    texture = black
    rgba = [ 0 0 0 128 ]
    scale = (2, 80)
    pos = <pos>
    just = [ left top ]
    z_priority = 4
  }
   <vertical_bar_id> = <id>
  GetStackedScreenElementPos x id = <vertical_bar_id> offset = (8, 24)
  CreateScreenElement {
    type = VScrollingMenu
    parent = current_menu_anchor
    pos = <pos>
    just = [ left top ]
    dims = (400, 275)
    internal_just = [ left top ]
  }
   <vscrolling_menu_id> = <id>
  CreateScreenElement {
    type = VMenu
    parent = <vscrolling_menu_id>
    id = edit_tricks_menu_2
    pos = (0, 0)
    just = [ left top ]
    event_handlers = [ { focus edit_tricks_menu_show_on_focus }
      { unfocus edit_tricks_menu_hide_on_unfocus params = <unfocus_params> }
      { pad_back edit_tricks_menu_back_from_trick_list }
      { pad_up set_which_arrow params = { arrow = edit_tricks_menu_up_arrow } }
      { pad_down set_which_arrow params = { arrow = edit_tricks_menu_down_arrow } }
      { pad_up generic_menu_up_or_down_sound params = { up } }
      { pad_down generic_menu_up_or_down_sound params = { down } }
      { pad_back generic_menu_pad_back_sound }
    ]
  }
  edit_tricks_menu_2:SetTags scrolling_parent = <vscrolling_menu_id>
  if ( <trick_type> = special_tricks )
    create_special_tricks_menu
    return
  endif
  GetStackedScreenElementPos x id = <vertical_bar_id> offset = (48, 5)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = edit_tricks_menu_up_arrow
    texture = up_arrow
    pos = <pos>
    just = [ left top ]
    scale = 0.9
    rgba = [ 128 128 128 0 ]
    z_priority = 3
  }
  GetStackedScreenElementPos y id = <id> offset = (0, 282)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = edit_tricks_menu_down_arrow
    texture = down_arrow
    pos = <pos>
    just = [ left top ]
    scale = 0.9
    rgba = [ 128 128 128 0 ]
    z_priority = 4
  }
  GetStackedScreenElementPos y id = edit_tricks_sub_menu_title offset = (-7, -2)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = dialog
    text = "Combo "
    scale = 0.9
    pos = <pos>
    just = [ left top ]
    rgba = [ 88 105 112 128 ]
  }
  if ( <type> = lip_tricks )
     <tap_info_text> = "Trick"
  else
     <tap_info_text> = "Single tap / Double tap"
  endif
  GetStackedScreenElementPos x id = <vertical_bar_id> offset = (5, -18)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    id = double_tap_info
    font = dialog
    text = <tap_info_text>
    rgba = [ 88 105 112 128 ]
    pos = <pos>
    scale = 0.9
    just = [ left top ]
  }
  if GotParam key_combo_array
    GetArraySize <key_combo_array>
     <index> = 0
    begin
      edit_tricks_sub_menu_add_key_combo {
        key_combo = ( <key_combo_array> [ <index> ] )
        highlight_bar_scale = <key_combo_highlight_bar_scale>
        short_highlight_bar_scale = <key_combo_short_highlight_bar_scale>
      }
       <index> = ( <index> + 1 )
    repeat <array_size>
  endif
  if GotParam trick_type
    if GetConfigurableTricksFromType type = <trick_type> <special>
      GetArraySize <ConfigurableTricks>
       <index> = 0
      if ( <array_size> > 0 )
        begin
           <trick_name> = ( <ConfigurableTricks> [ <index> ] )
          if not TrickIsLocked trick = <trick_name>
            RemoveParameter extra_trick_string
            GetTrickDisplayText trick = <trick_name>
            if not ( <type> = lip_tricks )
              if GotParam extra_trick_string
                FormatText TextName = trick_display_text "%f / %s" f = <trick_display_text> s = <extra_trick_string>
              endif
            endif
            if ( <index> = ( <array_size> - 1 ) )
              edit_tricks_sub_menu_add_trick {
                text = <trick_display_text>
                trick = <trick_name>
                focus_params = { last_item highlight_bar_scale = <trick_highlight_bar_scale> }
                pad_choose_params = { new_trick = <trick_name> callback = edit_tricks_menu_back_from_trick_list }
              }
            else
              if ( <index> = 0 )
                edit_tricks_sub_menu_add_trick {
                  text = <trick_display_text>
                  trick = <trick_name>
                  focus_params = { first_item highlight_bar_scale = <trick_highlight_bar_scale> }
                  pad_choose_params = { new_trick = <trick_name> callback = edit_tricks_menu_back_from_trick_list }
                }
              else
                edit_tricks_sub_menu_add_trick {
                  text = <trick_display_text>
                  trick = <trick_name>
                  focus_params = { highlight_bar_scale = <trick_highlight_bar_scale> }
                  pad_choose_params = { new_trick = <trick_name> callback = edit_tricks_menu_back_from_trick_list }
                }
              endif
            endif
             <index> = ( <index> + 1 )
          endif
        repeat <array_size>
      endif
    endif
    SetScreenElementLock id = edit_tricks_menu_2 on
    SetScreenElementLock id = edit_tricks_menu_2 off
    FireEvent type = focus target = edit_tricks_menu_2
    FireEvent type = unfocus target = edit_tricks_menu_2
    edit_tricks_menu_back_from_trick_list
  endif
  FireEvent type = focus target = edit_tricks_menu_1
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script create_special_tricks_menu
  special_tricks_menu_fill_trick_list
  FireEvent type = unfocus target = edit_tricks_menu_2
  SetScreenElementProps {
    id = edit_tricks_menu_1
    event_handlers = [ { focus edit_tricks_menu_special_tricks_focus } ]
    replace_handlers
  }
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
   <index> = 1
  begin
    special_tricks_menu_add_slot index = <index>
     <index> = ( <index> + 1 )
  repeat <max_specials>
  GetStackedScreenElementPos y id = edit_tricks_sub_menu_title offset = (155, 0)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = dialog
    text = "Trick"
    scale = 0.9
    pos = <pos>
    just = [ left top ]
    rgba = [ 88 105 112 128 ]
  }
  GetStackedScreenElementPos x id = <id> offset = (207, 0)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = dialog
    text = "Combo "
    scale = 0.9
    pos = <pos>
    just = [ left top ]
    rgba = [ 88 105 112 128 ]
  }
  GetStackedScreenElementPos x id = edit_tricks_menu_vertical_bar offset = (50, 5)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = edit_tricks_menu_up_arrow
    texture = up_arrow
    pos = <pos>
    just = [ left top ]
    scale = 0.9
    rgba = [ 128 128 128 0 ]
    z_priority = 3
  }
  GetStackedScreenElementPos y id = <id> offset = (0, 282)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = edit_tricks_menu_down_arrow
    texture = down_arrow
    pos = <pos>
    just = [ left top ]
    scale = 0.9
    rgba = [ 128 128 128 0 ]
    z_priority = 4
  }
  GetStackedScreenElementPos x id = edit_tricks_menu_vertical_bar offset = (350, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = special_tricks_menu_second_vertical_bar
    texture = black
    rgba = [ 0 0 0 128 ]
    scale = (2, 80)
    pos = <pos>
    just = [ left top ]
    z_priority = 4
  }
  special_tricks_menu_create_menu_3
  FireEvent type = focus target = edit_tricks_menu_1
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script special_tricks_menu_create_menu_3
  SetScreenElementLock id = current_menu_anchor off
  if ObjectExists id = special_tricks_menu_key_combo_up_arrow
    DestroyScreenElement id = special_tricks_menu_key_combo_up_arrow
  endif
  if ObjectExists id = special_tricks_menu_key_combo_down_arrow
    DestroyScreenElement id = special_tricks_menu_key_combo_down_arrow
  endif
  GetStackedScreenElementPos x id = special_tricks_menu_second_vertical_bar offset = (35, 5)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = special_tricks_menu_key_combo_up_arrow
    texture = up_arrow
    scale = 0.9
    pos = <pos>
    just = [ left top ]
    rgba = [ 128 128 128 0 ]
  }
  GetStackedScreenElementPos y id = special_tricks_menu_key_combo_up_arrow offset = (-30, 13)
  CreateScreenElement {
    type = VScrollingMenu
    parent = current_menu_anchor
    id = edit_tricks_menu_3_parent
    pos = <pos>
    just = [ left top ]
    dims = (300, 275)
    internal_just = [ left top ]
  }
  CreateScreenElement {
    type = VMenu
    parent = <id>
    id = edit_tricks_menu_3
    just = [ left top ]
    event_handlers = [ { focus edit_tricks_menu_show_on_focus }
      { unfocus edit_tricks_menu_hide_on_unfocus }
      { pad_back special_tricks_menu_goto_trick_list }
      { pad_up set_which_arrow params = { arrow = special_tricks_menu_key_combo_up_arrow } }
      { pad_down set_which_arrow params = { arrow = special_tricks_menu_key_combo_down_arrow } }
      { pad_up generic_menu_up_or_down_sound params = { up } }
      { pad_down generic_menu_up_or_down_sound params = { down } }
      { pad_back generic_menu_pad_back_sound }
    ]
  }
  GetStackedScreenElementPos y id = special_tricks_menu_key_combo_up_arrow offset = (0, 282)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = special_tricks_menu_key_combo_down_arrow
    texture = down_arrow
    scale = 0.9
    pos = <pos>
    just = [ left top ]
    rgba = [ 128 128 128 0 ]
  }
endscript
script special_tricks_menu_create_current_mapping_list
  if ScreenElementExists id = special_tricks_current_mapping
    DestroyScreenElement id = special_tricks_current_mapping
  endif
  FireEvent type = unfocus target = edit_tricks_menu_3
  SetScreenElementLock id = current_menu_anchor off
  GetStackedScreenElementPos x id = edit_tricks_menu_vertical_bar offset = (0, 25)
  CreateScreenElement {
    type = VMenu
    parent = current_menu_anchor
    id = special_tricks_current_mapping
    pos = <pos>
    just = [ left top ]
  }
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
   <index> = 0
  begin
    special_tricks_menu_add_special_to_mapping index = <index>
     <index> = ( <index> + 1 )
  repeat <max_specials>
  edit_tricks_menu_assign_current_menu_alias
endscript
script edit_tricks_menu_create_current_mapping_list
  if ObjectExists id = edit_tricks_menu_current_mapping
    DestroyScreenElement id = edit_tricks_menu_current_mapping
  endif
  SetScreenElementLock id = current_menu_anchor off
  GetStackedScreenElementPos x id = edit_tricks_menu_vertical_bar offset = (10, 27)
  CreateScreenElement {
    type = VMenu
    parent = current_menu_anchor
    id = edit_tricks_menu_current_mapping
    pos = <pos>
    just = [ left top ]
  }
  if GotParam key_combo_array
    GetArraySize <key_combo_array>
     <index> = 0
    begin
      CreateScreenElement {
        type = ContainerElement
        parent = edit_tricks_menu_current_mapping
        dims = (100, 22)
      }
      if GoalManager_GetTrickFromKeyCombo key_combo = ( <key_combo_array> [ <index> ] )
        if not ( <type> = lip_tricks )
          if GotParam extra_trick_string
            FormatText TextName = trick_string "%f / %s" f = <trick_string> s = <extra_trick_string>
          endif
        endif
        CreateScreenElement {
          type = TextElement
          parent = <id>
          font = small
          rgba = [ 88 105 112 128 ]
          text = <trick_string>
          pos = (-5, 0)
          scale = 0.75
          just = [ left center ]
        }
      endif
       <index> = ( <index> + 1 )
      RemoveParameter extra_trick_string
    repeat <array_size>
  endif
  edit_tricks_menu_assign_current_menu_alias
endscript
script edit_tricks_menu_destroy_current_mapping_list
  if ObjectExists id = edit_tricks_menu_current_mapping
    DestroyScreenElement id = edit_tricks_menu_current_mapping
  endif
endscript
script special_tricks_menu_fill_trick_list
  ForEachIn special_trick_types do = special_tricks_menu_add_type
endscript
script edit_tricks_menu_add_item { parent = current_menu
    font = small
    focus_script = edit_tricks_menu_focus
    unfocus_script = edit_tricks_menu_unfocus
    pad_choose_script = nullscript
    text_pos = (100, -8)
    bg_scale = (64, 6)
    bg_pos = (-30, -18)
    dims = (100, 24)
    rgba = [ 88 105 112 128 ]
    text_just = [ center center ]
  }
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = <id>
    dims = <dims>
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
    text = <text>
    pos = <text_pos>
    just = <text_just>
    rgba = <rgba>
    z_priority = 4
    scale = <text_scale>
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = black
    scale = <bg_scale>
    pos = <bg_pos>
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
  GetStackedScreenElementPos x id = <id> offset = (-15, 0)
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
  if GotParam add_deck_line
    CreateScreenElement {
      type = SpriteElement
      parent = <anchor_id>
      texture = black
      pos = <text_pos>
      scale = (40, 0.25)
      rgba = [ 18 87 18 128 ]
      alpha = 0
      just = [ center top ]
      z_priority = 5
    }
  endif
endscript
script edit_tricks_sub_menu_add_key_combo { pad_choose_script = edit_tricks_menu_goto_trick_list
    highlight_bar_scale = (0.38, 1.2)
    parent = edit_tricks_menu_1
  }
  if GoalManager_HasActiveGoals
    pad_choose_script = nullscript
  endif
  if not GotParam focus_params
    focus_params = { highlight_bar_scale = <highlight_bar_scale> }
  endif
  SetScreenElementLock id = <parent> off
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    dims = (100, 22)
    event_handlers = [ { focus edit_tricks_menu_key_combo_focus params = <focus_params> }
      { unfocus edit_tricks_menu_key_combo_unfocus }
    ]
    tags = { tag_grid_x = <index> }
     <not_focusable>
  }
   <anchor_id> = <id>
  if not GotParam pad_choose_params
    pad_choose_params = {
      key_combo = <key_combo>
      index = <index>
      id = <anchor_id>
      highlight_script = edit_tricks_menu_key_combo_focus
      highlight_bar_scale = <short_highlight_bar_scale>
    }
  endif
  SetScreenElementProps {
    id = <anchor_id>
    event_handlers = [ { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_start <pad_choose_script> params = <pad_choose_params> }
      { pad_choose generic_menu_pad_choose_sound }
    ]
  }
  if GotParam not_focusable
     <text_rgba> = [ 70 70 70 90 ]
  else
     <text_rgba> = [ 128 128 128 128 ]
  endif
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    text = ( goal_tetris_trick_text.<key_combo> )
    rgba = <text_rgba>
    scale = 0.7
    pos = (0, 0)
    just = [ left center ]
    z_priority = 4
  }
endscript
script edit_tricks_sub_menu_add_trick pad_choose_script = edit_tricks_menu_bind_trick
  CreateScreenElement {
    type = ContainerElement
    parent = edit_tricks_menu_2
    dims = (400, 24)
    event_handlers = [ { focus edit_tricks_menu_focus params = <focus_params> }
      { unfocus edit_tricks_menu_unfocus params = { rgba = [ 90 90 90 100 ] } }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_start <pad_choose_script> params = <pad_choose_params> }
      { pad_choose generic_menu_pad_choose_sound }
    ]
  }
   <anchor_id> = <id>
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    text = <text>
    pos = (0, 0)
    just = [ left top ]
    rgba = [ 90 90 90 100 ]
    scale = 0.75
  }
endscript
script special_tricks_menu_add_slot { pad_choose_script = special_tricks_menu_goto_trick_list
    highlight_bar_scale = (2, 1.3)
  }
  if GoalManager_HasActiveGoals
    pad_choose_script = nullscript
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = edit_tricks_menu_1
    dims = (40, 24)
    event_handlers = [ { focus edit_tricks_menu_focus params = { highlight_bar_pos = (-5, 0) highlight_bar_scale = <highlight_bar_scale> first_item last_item no_arrows } }
      { unfocus edit_tricks_menu_unfocus params = { rgba = [ 90 90 90 100 ] } }
      { pad_choose <pad_choose_script> params = { highlight_script = edit_tricks_menu_focus highlight_bar_scale = (0.18, 1.3) index = <index> } }
      { pad_start <pad_choose_script> params = { highlight_script = edit_tricks_menu_focus highlight_bar_scale = (0.18, 1.3) index = <index> } }
      { pad_choose generic_menu_pad_choose_sound }
    ]
    tags = { tag_grid_x = <index> }
  }
   <anchor_id> = <id>
  FormatText TextName = slot_num "%s-" s = <index>
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    text = <slot_num>
    pos = (20, 10)
    just = [ center center ]
    rgba = [ 90 90 90 100 ]
    z_priority = 4
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = highlight_bar
    pos = (-5, -1)
    just = [ left top ]
    rgba = [ 128 128 128 0 ]
    scale = <highlight_bar_scale>
    z_priority = 3
  }
endscript
script special_tricks_menu_add_special_to_mapping
  GetSpecialTrickInfo index = <index>
  CreateScreenElement {
    type = ContainerElement
    parent = special_tricks_current_mapping
    dims = (40, 24)
  }
   <anchor_id> = <id>
  if ( <special_trickname> = Unassigned )
     <trick_display_text> = "Unassigned"
  else
    GetTrickDisplayText trick = <special_trickname>
  endif
  if ( <special_trickslot> = Unassigned )
     <special_trickslot_text> = ""
  else
     <special_trickslot_text> = ( goal_tetris_trick_text.<special_trickslot> )
  endif
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    scale = 0.8
    text = <trick_display_text>
    pos = (340, 0)
    just = [ right top ]
    rgba = [ 88 105 112 128 ]
  }
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    scale = 0.75
    text = <special_trickslot_text>
    pos = (362, 0)
    just = [ left top ]
  }
endscript
script special_tricks_menu_add_type
  GetConfigurableTricksFromType type = <type> special
  SetScreenElementLock id = edit_tricks_menu_2 off
  CreateScreenElement {
    type = ContainerElement
    parent = edit_tricks_menu_2
    dims = (40, 24)
    not_focusable
  }
   <anchor_id> = <id>
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = dialog
    text = <Heading>
    rgba = [ 128 128 128 128 ]
    pos = (0, 0)
    scale = 0.9
    just = [ left top ]
    z_priority = 1
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = black
    rgba = [ 0 0 0 128 ]
    scale = (90, 6)
    pos = (-10, 0)
    just = [ left top ]
    z_priority = 0
  }
  GetArraySize <ConfigurableTricks>
   <index> = 0
  begin
    if ( ( <index> = 0 ) and ( <type> = FlipTrick ) )
       <first_item> = first_item
    else
      RemoveParameter first_item
      if ( ( <index> = ( <array_size> - 1 ) ) and ( <type> = Manual ) )
         <last_item> = last_item
      else
        RemoveParameter last_item
      endif
    endif
    if not TrickIsLocked trick = ( <ConfigurableTricks> [ <index> ] )
      special_tricks_menu_add_trick {
        trick = ( <ConfigurableTricks> [ <index> ] )
        type = <type>
        first_item = <first_item>
        last_item = <last_item>
      }
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
  CreateScreenElement {
    type = ContainerElement
    parent = edit_tricks_menu_2
    dims = (40, 24)
    not_focusable
  }
endscript
script special_tricks_menu_add_trick
  if GotParam first_item
    focus_params = { first_item }
  else
    if GotParam last_item
      focus_params = { last_item }
    endif
  endif
   <trick_name_string> = ( <trick>.params.name )
  FormatText ChecksumName = trick_name_checksum "%s" s = <trick_name_string>
  CreateScreenElement {
    type = ContainerElement
    parent = edit_tricks_menu_2
    id = <trick_name_checksum>
    dims = (40, 24)
  }
   <anchor_id> = <id>
  SetScreenElementProps {
    id = <anchor_id>
    event_handlers = [ { focus special_tricks_menu_focus params = <focus_params> }
      { unfocus special_tricks_menu_unfocus params = { rgba = [ 90 90 90 100 ] } }
      { pad_choose special_tricks_menu_select_trick params = { rgba = [ 128 118 0 128 ] highlight_bar_scale = (1.35, 1.3) trick = <trick> type = <type> id = <anchor_id> } }
      { pad_start special_tricks_menu_select_trick params = { rgba = [ 128 118 0 128 ] highlight_bar_scale = (1.35, 1.3) trick = <trick> type = <type> id = <anchor_id> } }
      { pad_choose generic_menu_pad_choose_sound }
    ]
  }
  GetTrickDisplayText trick = <trick>
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    text = <trick_display_text>
    rgba = [ 90 90 90 100 ]
    pos = (0, 0)
    just = [ left top ]
    scale = 0.8
  }
endscript
script edit_tricks_menu_focus highlight_bar_scale = (1, 1.3) highlight_bar_pos = (-8, 0)
  GetTags
  SetScreenElementLock id = <id> off
  KillSpawnedScript name = do_random_effect
  if GotParam flagged_deck
    RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 99 121 6 128 ] }
  else
    RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  endif
  if ObjectExists id = edit_tricks_menu_highlight_bar
    DestroyScreenElement id = edit_tricks_menu_highlight_bar
  endif
  CreateScreenElement {
    type = SpriteElement
    parent = <id>
    id = edit_tricks_menu_highlight_bar
    texture = highlight_bar
    rgba = [ 128 128 128 50 ]
    pos = <highlight_bar_pos>
    just = [ left top ]
    scale = <highlight_bar_scale>
    z_priority = 3
  }
  if not GotParam no_arrows
    if ObjectExists id = edit_tricks_menu_up_arrow
      if GotParam first_item
        SetScreenElementProps {
          id = edit_tricks_menu_up_arrow
          rgba = [ 128 128 128 0 ]
        }
      else
        SetScreenElementProps {
          id = edit_tricks_menu_up_arrow
          rgba = [ 128 128 128 85 ]
        }
      endif
    endif
    if ObjectExists id = edit_tricks_menu_down_arrow
      if GotParam last_item
        SetScreenElementProps {
          id = edit_tricks_menu_down_arrow
          rgba = [ 128 128 128 0 ]
        }
      else
        SetScreenElementProps {
          id = edit_tricks_menu_down_arrow
          rgba = [ 128 128 128 85 ]
        }
      endif
    endif
    if ( ObjectExists id = edit_tricks_menu_up_arrow )
      AssignAlias id = edit_tricks_menu_2 alias = current_menu
      edit_tricks_menu_2:GetTags
      if GotParam arrow_id
        menu_vert_blink_arrow { id = <arrow_id> }
      endif
    endif
  endif
endscript
script edit_tricks_menu_unfocus
  GetTags
  if GotParam flagged_deck
    RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down params = { rgba = [ 25 83 67 128 ] no_sound }
  else
    RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down params = { rgba = <rgba> no_sound }
  endif
  if ObjectExists id = edit_tricks_menu_highlight_bar
    DestroyScreenElement id = edit_tricks_menu_highlight_bar
  endif
endscript
script special_tricks_menu_focus highlight_bar_scale = (1.35, 1.3)
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  SetScreenElementLock id = <id> off
  CreateScreenElement {
    type = SpriteElement
    parent = <id>
    texture = highlight_bar
    pos = (-7, 0)
    rgba = [ 128 128 128 50 ]
    scale = <highlight_bar_scale>
    just = [ left top ]
  }
  if ObjectExists id = edit_tricks_menu_up_arrow
    if GotParam first_item
      SetScreenElementProps {
        id = edit_tricks_menu_up_arrow
        rgba = [ 128 128 128 0 ]
      }
    else
      SetScreenElementProps {
        id = edit_tricks_menu_up_arrow
        rgba = [ 128 128 128 85 ]
      }
    endif
  endif
  if ObjectExists id = edit_tricks_menu_down_arrow
    if GotParam last_item
      SetScreenElementProps {
        id = edit_tricks_menu_down_arrow
        rgba = [ 128 128 128 0 ]
      }
    else
      SetScreenElementProps {
        id = edit_tricks_menu_down_arrow
        rgba = [ 128 128 128 85 ]
      }
    endif
  endif
  if ScreenElementExists id = edit_tricks_menu_up_arrow
    AssignAlias id = edit_tricks_menu_2 alias = current_menu
    edit_tricks_menu_2:GetTags
    if GotParam first_item
      SetScreenElementProps id = <scrolling_parent> reset_window_top
    endif
    if GotParam last_item
      SetScreenElementProps id = <scrolling_parent> reset_window_bottom
    endif
    if not GotParam first_item
      if not GotParam last_item
        if GotParam arrow_id
          menu_vert_blink_arrow { id = <arrow_id> }
        endif
      endif
    endif
  endif
endscript
script special_tricks_menu_unfocus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down params = { rgba = <rgba> no_sound }
  DestroyScreenElement id = { <id> child = 1 }
endscript
script edit_tricks_menu_key_combo_focus
  GetTags
  SetScreenElementLock id = <id> off
  CreateScreenElement {
    type = SpriteElement
    parent = <id>
    id = key_combo_highlight_bar
    texture = highlight_bar
    scale = <highlight_bar_scale>
    pos = (-4, -9)
    just = [ left top ]
    rgba = [ 128 128 128 50 ]
    z_priority = 3
  }
  if GotParam rgba
    SetScreenElementProps {
      id = { <id> child = 0 }
      rgba = <rgba>
    }
  endif
  if GotParam up_arrow_id
    if GotParam first_item
      SetScreenElementProps {
        id = <up_arrow_id>
        rgba = [ 128 128 128 0 ]
      }
    else
      SetScreenElementProps {
        id = <up_arrow_id>
        rgba = [ 128 128 128 85 ]
      }
    endif
  endif
  if GotParam down_arrow_id
    if GotParam last_item
      SetScreenElementProps {
        id = <down_arrow_id>
        rgba = [ 128 128 128 0 ]
      }
    else
      SetScreenElementProps {
        id = <down_arrow_id>
        rgba = [ 128 128 128 85 ]
      }
    endif
  endif
  if ( ObjectExists id = special_tricks_menu_key_combo_up_arrow )
    AssignAlias id = edit_tricks_menu_3 alias = current_menu
    edit_tricks_menu_3:GetTags
    if GotParam arrow_id
      menu_vert_blink_arrow { id = <arrow_id> }
    endif
  endif
endscript
script edit_tricks_menu_key_combo_unfocus
  GetTags
  if ObjectExists id = key_combo_highlight_bar
    DestroyScreenElement id = key_combo_highlight_bar
  endif
endscript
script edit_tricks_menu_goto_trick_list
  FireEvent type = unfocus target = edit_tricks_menu_1
  edit_tricks_menu_1_index = <index>
  if GotParam key_combo
    SetScreenElementProps {
      id = edit_tricks_menu_2
      tags = { new_key_combo = <key_combo> }
    }
  endif
  if GotParam highlight_script
    RunScriptOnScreenElement id = <id> <highlight_script> params = { highlight_bar_scale = <highlight_bar_scale> }
  endif
  FireEvent type = focus target = edit_tricks_menu_2
endscript
script edit_tricks_menu_special_tricks_focus
  special_tricks_menu_create_current_mapping_list
endscript
script special_tricks_menu_goto_trick_list
  GetTags
  if ObjectExists id = special_tricks_temp_trick_highlight_bar
    DestroyScreenElement id = special_tricks_temp_trick_highlight_bar
  endif
  if GotParam element_to_unfocus
    SetScreenElementProps {
      id = <element_to_unfocus>
      rgba = [ 90 90 90 100 ]
    }
  endif
  if ObjectExists id = special_tricks_current_mapping
    DestroyScreenElement id = special_tricks_current_mapping
  endif
  FireEvent type = unfocus target = edit_tricks_menu_1
  if GotParam index
    SetScreenElementProps {
      id = edit_tricks_menu_2
      tags = { index = ( <index> - 1 ) }
    }
  endif
  if GotParam highlight_script
    RunScriptOnScreenElement id = <id> <highlight_script> params = { highlight_bar_scale = <highlight_bar_scale> }
  endif
  SetScreenElementLock id = edit_tricks_menu_2 on
  SetScreenElementLock id = edit_tricks_menu_2 off
  FireEvent type = unfocus target = edit_tricks_menu_3
  if GotParam index
    GetSpecialTrickInfo index = ( <index> - 1 )
    if ( <special_trickslot> = Unassigned )
      FireEvent type = focus target = edit_tricks_menu_2
    else
       <special_trickname_string> = ( ( <special_trickname> ).params.name )
      FormatText ChecksumName = special_trickname_checksum "%s" s = <special_trickname_string>
      FireEvent type = focus target = edit_tricks_menu_2 data = { child_id = <special_trickname_checksum> }
    endif
  else
    FireEvent type = focus target = edit_tricks_menu_2
  endif
endscript
script edit_tricks_menu_back_from_trick_list
  if ObjectExists id = key_combo_highlight_bar
    DestroyScreenElement id = key_combo_highlight_bar
  endif
  FireEvent type = unfocus target = edit_tricks_menu_2
  if ObjectExists id = edit_tricks_menu_1
    FireEvent type = focus target = edit_tricks_menu_1 data = { grid_index = edit_tricks_menu_1_index }
  endif
  if ObjectExists id = edit_tricks_menu_up_arrow
    SetScreenElementProps {
      id = edit_tricks_menu_up_arrow
      rgba = [ 128 128 128 0 ]
    }
  endif
  if ObjectExists id = edit_tricks_menu_down_arrow
    SetScreenElementProps {
      id = edit_tricks_menu_down_arrow
      rgba = [ 128 128 128 0 ]
    }
  endif
endscript
script edit_tricks_menu_bind_trick
  if not GotParam new_key_combo
    edit_tricks_menu_2:GetTags
  endif
  if not GotParam new_key_combo
    Printf "no new_key_combo"
    return
  endif
  if not GotParam new_trick
    Printf "no new_trick"
    return
  endif
  if InSplitScreenGame
     <update_mappings> = 0
  else
     <update_mappings> = 1
  endif
  if GotParam special
    if GoalManager_GetTrickFromKeyCombo special key_combo = <new_key_combo>
      Printf "special key combo already bound"
      BindTrickToKeyCombo {
        special
        index = <current_index>
        key_combo = Unassigned
        trick = Unassigned
        update_mappings = <update_mappings>
      }
    endif
    if GetKeyComboBoundToTrick special trick = <new_trick>
      BindTrickToKeyCombo {
        special
        index = <current_index>
        key_combo = Unassigned
        trick = Unassigned
        update_mappings = <update_mappings>
      }
    endif
  else
    if GetKeyComboBoundToTrick trick = <new_trick>
      Printf "trick already bound"
      if GoalManager_GetTrickFromKeyCombo key_combo = <new_key_combo>
        Printf "rebinding"
        PrintStruct <...>
        BindTrickToKeyCombo {
          key_combo = <current_key_combo>
          trick = <trick_checksum>
          update_mappings = <update_mappings>
        }
      endif
    endif
  endif
  Printf "binding new trick"
  if GotParam special
    BindTrickToKeyCombo {
      special
      index = <index>
      key_combo = <new_key_combo>
      trick = <new_trick>
      update_mappings = <update_mappings>
    }
  else
    BindTrickToKeyCombo {
      key_combo = <new_key_combo>
      trick = <new_trick>
      update_mappings = <update_mappings>
    }
  endif
  GetCurrentSkaterProfileIndex
  if InSplitScreenGame
    Printf "in a split screen game"
  else
    UpdateTrickMappings skater = <currentSkaterProfileIndex>
  endif
  GoalManager_ReplaceTrickText all
  if GotParam callback
     <callback>
  endif
endscript
script special_tricks_menu_select_trick
  FireEvent type = unfocus target = edit_tricks_menu_2
  DoScreenElementMorph {
    id = edit_tricks_menu_2
    alpha = 1
  }
  if GotParam id
    SetScreenElementProps {
      id = { <id> child = 0 }
      rgba = [ 127 102 0 100 ]
    }
    SetScreenElementProps {
      id = edit_tricks_menu_3
      event_handlers = [ { pad_back special_tricks_menu_goto_trick_list params = { element_to_unfocus = <id> } } ]
      replace_handlers
    }
    CreateScreenElement {
      type = SpriteElement
      parent = <id>
      id = special_tricks_temp_trick_highlight_bar
      texture = highlight_bar
      pos = (-7, 0)
      rgba = [ 128 128 128 50 ]
      scale = <highlight_bar_scale>
      just = [ left top ]
    }
  endif
  DestroyScreenElement id = edit_tricks_menu_3_parent
  special_tricks_menu_create_menu_3
  edit_tricks_menu_3:SetTags trick = <trick>
  switch <type>
  case FlipTrick
  case GrabTrick
     <key_combo_array> = special_trick_air_key_combos
  case LipMacro2
     <key_combo_array> = special_trick_lip_key_combos
  case GrindTrick
     <key_combo_array> = special_trick_grind_key_combos
  case Manual
     <key_combo_array> = special_trick_manual_key_combos
  default
    PrintStruct <...>
    script_assert "Unknown type"
  endswitch
  GetArraySize <key_combo_array>
   <key_combo_index> = 0
  begin
    if ( <key_combo_index> = 0 )
       <first_item> = first_item
    else
      if ( <key_combo_index> = ( <array_size> - 1 ) )
         <last_item> = last_item
      endif
    endif
    if GoalManager_GetTrickFromKeyCombo special key_combo = ( <key_combo_array> [ <key_combo_index> ] )
      edit_tricks_menu_2:GetTags
      GetSpecialTrickInfo index = <index>
      if not ( <special_trickslot> = ( <key_combo_array> [ <key_combo_index> ] ) )
         <not_focusable> = not_focusable
      endif
    endif
    edit_tricks_sub_menu_add_key_combo {
      key_combo = ( <key_combo_array> [ <key_combo_index> ] )
      parent = edit_tricks_menu_3
      pad_choose_script = special_tricks_menu_select_key_combo
      focus_params = { highlight_bar_scale = (0.38, 1.3)
        up_arrow_id = special_tricks_menu_key_combo_up_arrow
        down_arrow_id = special_tricks_menu_key_combo_down_arrow
        key_combo = ( <key_combo_array> [ <key_combo_index> ] )
         <first_item>
         <last_item>
      }
      pad_choose_params = { key_combo = ( <key_combo_array> [ <key_combo_index> ] )
        index = <key_combo_index>
        id = <anchor_id>
        highlight_script = edit_tricks_menu_key_combo_focus
        highlight_bar_scale = <short_highlight_bar_scale>
      }
      not_focusable = <not_focusable>
    }
    RemoveParameter first_item
    RemoveParameter last_item
    RemoveParameter not_focusable
     <key_combo_index> = ( <key_combo_index> + 1 )
  repeat <array_size>
  SetScreenElementLock id = edit_tricks_menu_3 on
  SetScreenElementLock id = edit_tricks_menu_3_parent on
  FireEvent type = focus target = edit_tricks_menu_3
endscript
script special_tricks_menu_select_key_combo
  edit_tricks_menu_2:GetTags
  edit_tricks_menu_3:GetTags
  Printf "special_tricks_menu_select_key_combo"
  PrintStruct <...>
  edit_tricks_menu_bind_trick new_key_combo = <key_combo> new_trick = <trick> index = <index> special
  special_tricks_menu_goto_trick_list
  edit_tricks_menu_back_from_trick_list
endscript
script edit_tricks_menu_show_on_focus
  GetTags
  DoMorph alpha = 1
endscript
script edit_tricks_menu_hide_on_unfocus
  DoMorph alpha = 0
  if ObjectExists id = special_tricks_menu_key_combo_up_arrow
    SetScreenElementProps {
      id = special_tricks_menu_key_combo_up_arrow
      rgba = [ 128 128 128 0 ]
    }
  endif
  if ObjectExists id = special_tricks_menu_key_combo_down_arrow
    SetScreenElementProps {
      id = special_tricks_menu_key_combo_down_arrow
      rgba = [ 128 128 128 0 ]
    }
  endif
  if ObjectExists id = edit_tricks_menu_up_arrow
    SetScreenElementProps {
      id = edit_tricks_menu_up_arrow
      rgba = [ 128 128 128 0 ]
    }
  endif
  if ObjectExists id = edit_tricks_menu_down_arrow
    SetScreenElementProps {
      id = edit_tricks_menu_down_arrow
      rgba = [ 128 128 128 0 ]
    }
  endif
endscript
script edit_tricks_menu_assign_current_menu_alias
  if not GotParam id
    GetTags
  endif
  AssignAlias id = <id> alias = current_menu
endscript
script edit_tricks_menu_exit
  if ObjectExists id = edit_tricks_menu_anchor
    DestroyScreenElement id = edit_tricks_menu_anchor
    Wait 1 frame
  endif
  remove_edit_tricks_menu_textures_from_vram
  if GotParam just_remove
    return
  endif
  if GotParam just_remove
    return
  endif
  if ( LevelIs load_skateshop )
    restore_start_key_binding
    launch_ss_menu
  else
    add_pause_menu_textures_to_vram
    restore_start_key_binding
    create_options_menu
  endif
endscript
script edit_tricks_sub_menu_exit
  if ObjectExists id = edit_tricks_sub_menu_anchor
    DestroyScreenElement id = edit_tricks_sub_menu_anchor
    Wait 1 frame
  endif
  GoalManager_ShowPoints
  if not GoalManager_HasActiveGoals
    GoalManager_ShowGoalPoints
  endif
  create_edit_tricks_menu
endscript
script add_edit_tricks_menu_textures_to_vram
  AddTextureToVram "PA_trick"
  AddTextureToVram "PA_grab"
  AddTextureToVram "PA_flip"
  AddTextureToVram "PA_lip"
  AddTextureToVram "PA_special"
  AddTextureToVram "grungeframe_top"
  AddTextureToVram "grungeframe_mid"
  AddTextureToVram "grungeframe_bot"
  AddTextureToVram "goal_left"
  AddTextureToVram "goal_mid"
  AddTextureToVram "goal_right"
  AddTextureToVram "goal_line"
  AddTextureToVram "up_arrow"
  AddTextureToVram "down_arrow"
endscript
script remove_edit_tricks_menu_textures_from_vram
  RemoveTextureFromVram "PA_trick"
  RemoveTextureFromVram "PA_grab"
  RemoveTextureFromVram "PA_flip"
  RemoveTextureFromVram "PA_lip"
  RemoveTextureFromVram "PA_special"
  RemoveTextureFromVram "grungeframe_top"
  RemoveTextureFromVram "grungeframe_mid"
  RemoveTextureFromVram "grungeframe_bot"
  RemoveTextureFromVram "goal_left"
  RemoveTextureFromVram "goal_mid"
  RemoveTextureFromVram "goal_right"
  RemoveTextureFromVram "goal_line"
  RemoveTextureFromVram "up_arrow"
  RemoveTextureFromVram "down_arrow"
endscript
edit_tricks_menu_grab_key_combos = [
  Air_CircleD
  Air_CircleDL
  Air_CircleDR
  Air_CircleL
  Air_CircleR
  Air_CircleU
  Air_CircleUL
  Air_CircleUR
  Air_D_D_Circle
  Air_L_L_Circle
  Air_R_R_Circle
  Air_U_U_Circle
]
edit_tricks_menu_lip_key_combos = [
  Lip_TriangleD
  Lip_TriangleDL
  Lip_TriangleDR
  Lip_TriangleL
  Lip_TriangleR
  Lip_TriangleU
  Lip_TriangleUL
  Lip_TriangleUR
]
edit_tricks_menu_flip_key_combos = [
  Air_SquareD
  Air_SquareDL
  Air_SquareDR
  Air_SquareL
  Air_SquareR
  Air_SquareU
  Air_SquareUL
  Air_SquareUR
  Air_D_D_Square
  Air_L_L_Square
  Air_R_R_Square
  Air_U_U_Square
]
special_trick_types = [
  { type = FlipTrick Heading = "Air Tricks" }
  { type = GrabTrick Heading = "Grab Tricks" }
  { type = LipMacro2 Heading = "Lip Tricks" }
  { type = GrindTrick Heading = "Grind Tricks" }
  { type = Manual Heading = "Manual Tricks" }
]
special_trick_air_key_combos = [
  SpAir_D_L_Circle
  SpAir_D_R_Circle
  SpAir_D_U_Circle
  SpAir_L_D_Circle
  SpAir_L_R_Circle
  SpAir_L_U_Circle
  SpAir_R_D_Circle
  SpAir_R_L_Circle
  SpAir_R_U_Circle
  SpAir_U_D_Circle
  SpAir_U_L_Circle
  SpAir_U_R_Circle
  SpAir_D_L_Square
  SpAir_D_R_Square
  SpAir_D_U_Square
  SpAir_L_D_Square
  SpAir_L_R_Square
  SpAir_L_U_Square
  SpAir_R_D_Square
  SpAir_R_L_Square
  SpAir_R_U_Square
  SpAir_U_D_Square
  SpAir_U_L_Square
  SpAir_U_R_Square
]
special_trick_grind_key_combos = [
  SpGrind_D_L_Triangle
  SpGrind_D_R_Triangle
  SpGrind_D_U_Triangle
  SpGrind_L_D_Triangle
  SpGrind_L_R_Triangle
  SpGrind_L_U_Triangle
  SpGrind_R_D_Triangle
  SpGrind_R_L_Triangle
  SpGrind_R_U_Triangle
  SpGrind_U_D_Triangle
  SpGrind_U_L_Triangle
  SpGrind_U_R_Triangle
]
special_trick_lip_key_combos = [
  SpLip_D_L_Triangle
  SpLip_D_R_Triangle
  SpLip_D_U_Triangle
  SpLip_L_D_Triangle
  SpLip_L_R_Triangle
  SpLip_L_U_Triangle
  SpLip_R_D_Triangle
  SpLip_R_L_Triangle
  SpLip_R_U_Triangle
  SpLip_U_D_Triangle
  SpLip_U_L_Triangle
  SpLip_U_R_Triangle
  SpLip_U_U_Triangle
]
special_trick_manual_key_combos = [
  SpMan_D_L_Triangle
  SpMan_D_R_Triangle
  SpMan_D_U_Triangle
  SpMan_L_D_Triangle
  SpMan_L_R_Triangle
  SpMan_L_U_Triangle
  SpMan_R_D_Triangle
  SpMan_R_L_Triangle
  SpMan_R_U_Triangle
  SpMan_U_D_Triangle
  SpMan_U_L_Triangle
  SpMan_U_R_Triangle
]
