boardshop_deck_price = 50
script launch_boardshop_menu
  SetScreenElementLock id = root_window off
  pulse_blur
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  if GotParam parent_index
    Change edit_skater_menu_level_1_index = <parent_index>
  endif
  KillSpawnedScript name = Skateshop_slideshow
  KillSkaterCamAnim all
  PlaySkaterCamAnim name = SS_BoardSelect play_hold
  if GotParam previous_menu
    switch <previous_menu>
    case edit_skater
      remove_edit_skater_textures_from_vram
    default
      remove_pause_menu_textures_from_vram
    endswitch
  endif
  boardshop_add_textures_to_vram
  boardshop_create_initial_menus
endscript
script boardshop_create_initial_menus
  SetScreenElementLock id = root_window off
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  GoalManager_HidePoints
  GoalManager_ShowGoalPoints
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = boardshop_menu_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  AssignAlias id = boardshop_menu_anchor alias = current_menu_anchor
  boardshop_create_background
  boardshop_create_main_menu
  if GotParam animate
    RunScriptOnScreenElement id = boardshop_anchor_top select_skater_menu_animate_top
  endif
endscript
script boardshop_create_background
  SetScreenElementLock id = current_menu_anchor off
   <root_pos> = (30, 30)
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    id = boardshop_anchor_top
    dims = (640, 480)
    pos = (320, 240)
  }
  CreateScreenElement {
    type = SpriteElement
    parent = boardshop_anchor_top
    texture = PA_Mode
    rgba = [ 127 102 0 128 ]
    pos = (30, 41)
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = <id> offset = (0, 2)
  CreateScreenElement {
    type = TextElement
    parent = boardshop_anchor_top
    font = TestTitle
    text = "BOARDSHOP"
    rgba = [ 128 128 128 98 ]
    scale = 1.4
    pos = ( <pos> + (0, 0) )
    just = [ left top ]
  }
  set_sub_bg pos = ( <root_pos> + (152, 12) ) parent = boardshop_anchor_top
endscript
script boardshop_create_main_menu
  SetScreenElementLock id = current_menu_anchor off
  if ObjectExists id = boardshop_anchor_middle
    DestroyScreenElement id = boardshop_anchor_middle
  endif
  if not IsAlive name = TRG_Deck_Main
    Create name = TRG_Deck_Main
    TRG_Deck_Main:boardshop_reset_main_board
  endif
  if not IsAlive name = TRG_Deck_MainTrucks
    Create name = TRG_Deck_MainTrucks
    TRG_Deck_MainTrucks:boardshop_reset_main_trucks
  endif
  if not IsAlive name = TRG_Deck_MainJets
    Create name = TRG_Deck_MainJets
    TRG_Deck_MainJets:boardshop_reset_main_trucks
  endif
  TRG_Deck_Main:Hide
  TRG_Deck_MainTrucks:Hide
  TRG_Deck_MainJets:Hide
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    id = boardshop_anchor_middle
    dims = (640, 480)
    pos = (320, 240)
  }
   <root_pos> = (390, 79)
  CreateScreenElement {
    type = VMenu
    parent = boardshop_anchor_middle
    id = boardshop_vmenu
    pos = <root_pos>
    just = [ left top ]
    event_handlers = [ { pad_back generic_menu_pad_back_sound }
      { pad_back boardshop_menu_exit params = <...> }
      { pad_up generic_menu_up_or_down_sound params = { up } }
      { pad_down generic_menu_up_or_down_sound params = { down } }
    ]
  }
  AssignAlias id = boardshop_vmenu alias = current_menu
  create_helper_text generic_helper_text
  get_current_skater_deck_menu_enabled
  if ( <decks_menu_enabled> = 0 )
     <deck_menu_not_focusable> = not_focusable
     <deck_menu_rgba> = [ 60 60 60 85 ]
  endif
  GetCurrentSkaterProfileIndex
  edit_tricks_menu_add_item {
    first_item
    text = "Change Deck"
    pad_choose_script = boardshop_create_deck_menu
    pad_choose_params = { profile_index = <currentSkaterProfileIndex> }
    text_pos = (90, -5)
    bg_scale = (60, 6)
    dims = (256, 24)
    not_focusable = <deck_menu_not_focusable>
    rgba = <deck_menu_rgba>
    focus_params = { highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (-28, -16) }
  }
  get_current_skater_griptape_menu_enabled
  if ( <griptape_menu_enabled> = 0 )
     <griptape_menu_not_focusable> = not_focusable
     <griptape_menu_rgba> = [ 60 60 60 85 ]
  endif
  edit_tricks_menu_add_item {
    text = "Griptape"
    text_pos = (90, -5)
    bg_scale = (60, 6)
    dims = (256, 24)
    pad_choose_script = boardshop_create_griptape_menu
    pad_choose_params = { current_group = 1 }
    not_focusable = <griptape_menu_not_focusable>
    rgba = <griptape_menu_rgba>
    focus_params = { highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (-28, -16) }
  }
  get_current_skater_wheel_menu_enabled
  if ( <wheels_menu_enabled> = 0 )
     <wheel_menu_not_focusable> = not_focusable
     <wheel_menu_rgba> = [ 60 60 60 85 ]
  endif
  get_current_skater_wheel_color_menu_name
  edit_tricks_menu_add_item {
    text = <wheel_color_menu_name>
    text_pos = (90, -5)
    bg_scale = (60, 6)
    dims = (256, 24)
    pad_choose_script = boardshop_create_wheel_color_menu
    not_focusable = <wheel_menu_not_focusable>
    rgba = <wheel_menu_rgba>
    focus_params = { highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (-28, -16) }
  }
   edit_tricks_menu_add_item {
    text = "Boards"
    text_pos = (90, -5)
    bg_scale = (60, 6)
    dims = (256, 24)
    pad_choose_script = boardshop_create_board_menu
    focus_params = { highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (-28, -16) }
  }
  edit_tricks_menu_add_item {
    last_item
    text = "Done"
    text_pos = (90, -5)
    bg_scale = (60, 6)
    dims = (256, 24)
    pad_choose_script = boardshop_menu_exit
    pad_choose_params = <...>
    focus_params = { highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (-28, -16) }
  }
  FireEvent type = focus target = boardshop_vmenu
endscript
script boardshop_create_deck_menu
  if not GotParam profile_index
    Printf "no index!"
    return
  endif
  boardshop_sync_to_skater_griptape
  TRG_Deck_Main:Unhide
  TRG_Deck_Main:boardshop_reset_main_board
  TRG_Deck_MainTrucks:Hide
  TRG_Deck_MainJets:Hide
  GetSkaterProfileInfo player = <profile_index>
  GetArraySize deck_graphic
   <index> = 0
  begin
    if ( ( deck_graphic [ <index> ] ).skater = <name> )
      Change boardshop_current_deck_list_index = <index>
      break
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
  SetScreenElementProps id = root_window off
  if ObjectExists id = boardshop_anchor_middle
    DestroyScreenElement id = boardshop_anchor_middle
  endif
   <root_pos> = (360, 67)
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    id = boardshop_anchor_middle
    dims = (640, 480)
    pos = (320, 240)
  }
  if ( <name> = custom )
     <arrow_alpha> = 1
     <pad_left_script> = boardshop_switch_deck_list
     <pad_left_params> = { left is_pro = <is_pro> }
     <pad_right_script> = boardshop_switch_deck_list
     <pad_right_params> = { right is_pro = <is_pro> }
  else
     <arrow_alpha> = 0
     <pad_left_script> = nullscript
     <pad_right_script> = nullscript
  endif
  if GotParam from_secrets
    pad_back_script = boardshop_menu_exit
    pad_back_params = { to_secrets }
  else
    pad_back_script = boardshop_create_main_menu
  endif
  CreateScreenElement {
    type = VMenu
    parent = boardshop_anchor_middle
    id = boardshop_deck_design_menu
    pos = <root_pos>
    just = [ left top ]
    event_handlers = [ { pad_back generic_menu_pad_back_sound }
      { pad_back <pad_back_script> params = <pad_back_params> }
      { pad_left <pad_left_script> params = <pad_left_params> }
      { pad_right <pad_right_script> params = <pad_right_params> }
      { pad_up generic_menu_up_or_down_sound params = { up } }
      { pad_down generic_menu_up_or_down_sound params = { down } }
    ]
  }
  AssignAlias id = boardshop_deck_design_menu alias = current_menu
  kill_start_key_binding
  if ( <name> = custom )
    create_helper_text generic_helper_text_up_down_left_right
  else
    create_helper_text generic_helper_text
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = boardshop_deck_design_menu
    dims = (100, 40)
    not_focusable
  }
   <anchor_id> = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = black
    scale = (60, 7)
    pos = (0, -6)
    just = [ left top ]
    rgba = [ 0 0 0 85 ]
    z_priority = 1
  }
  GetStackedScreenElementPos x id = <id> offset = (-15, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = grungeframe_top
    pos = <pos>
    just = [ left top ]
    rgba = [ 128 128 128 70 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = left_arrow
    pos = (2, -6)
    just = [ left top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 2
    alpha = <arrow_alpha>
  }
  GetStackedScreenElementPos x id = <id> offset = (2, 4)
   <gray_bg_pos> = <pos>
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = stats_notch
    scale = (12.5, 1.8)
    just = [ left top ]
    pos = <pos>
    rgba = [ 100 100 100 30 ]
    z_priority = 2
  }
  GetStackedScreenElementPos x id = <id> offset = (2, -4)
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = right_arrow
    pos = <pos>
    just = [ left top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 2
    alpha = <arrow_alpha>
  }
  FormatText TextName = deck_set_text "%s Decks" s = <display_name>
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    id = boardshop_deck_list_title
    font = dialog
    text = <deck_set_text>
    rgba = [ 127 102 0 128 ]
    pos = ( <gray_bg_pos> + (102, 2) )
    just = [ center top ]
    scale = 0.85
    z_priority = 3
  }
   <index> = 1
  begin
    FormatText TextName = deck_name "%s Design %i" s = <display_name> i = <index>
    if ( <index> = 10 )
       <last_item> = last_item
    endif
    edit_tricks_menu_add_item {
      text = <deck_name>
      text_pos = (100, -5)
      dims = (40, 24)
      bg_scale = (60, 6)
      text_scale = 0.7
      pad_choose_script = boardshop_menu_choose_deck
      pad_choose_params = { deck_index = <index> }
      focus_script = boardshop_deck_design_focus
      focus_params = { highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (-28, -16) }
      add_deck_line
       <last_item>
    }
     <index> = ( <index> + 1 )
  repeat 10
  SetScreenElementLock id = boardshop_deck_design_menu on
  SetScreenElementLock id = boardshop_deck_design_menu off
  GetStackedScreenElementPos y id = boardshop_deck_design_menu offset = (-58, -10)
  CreateScreenElement {
    type = SpriteElement
    parent = boardshop_anchor_middle
    texture = black
    pos = <pos>
    draw_behind_parent
    scale = (75, 15)
    just = [ left top ]
    rgba = [ 0 0 0 98 ]
    z_priority = 1
  }
  CreateScreenElement {
    type = SpriteElement
    parent = boardshop_anchor_middle
    texture = stats_notch
    pos = ( <pos> + (5, 5) )
    scale = (18, 1.5)
    just = [ left top ]
    rgba = [ 100 100 100 30 ]
    z_priority = 2
  }
  GetCurrentSkaterProfileIndex
  GoalManager_GetCash
  FormatText TextName = cash_text "Cash Available: $%i" i = <cash>
  CreateScreenElement {
    type = TextElement
    id = boardshop_cash_available
    parent = boardshop_anchor_middle
    pos = ( <pos> + (150, 5) )
    just = [ center top ]
    rgba = [ 127 102 0 128 ]
    font = small
    text = <cash_text>
    scale = 0.8
    z_priority = 3
  }
  CreateScreenElement {
    type = SpriteElement
    parent = boardshop_anchor_middle
    texture = goal_right
    pos = ( <pos> + (286, 0) )
    z_priority = 0
    scale = (0.8, 0.23)
    just = [ left top ]
    rgba = [ 128 128 128 90 ]
  }
  FormatText TextName = deck_price "This deck is $%i" i = boardshop_deck_price
  CreateScreenElement {
    type = TextElement
    parent = boardshop_anchor_middle
    id = boardshop_deck_price
    pos = ( <pos> + (150, 30) )
    rgba = [ 128 128 128 128 ]
    font = dialog
    just = [ center top ]
    scale = 0.8
    text = <deck_price>
    not_focusable
  }
  boardshop_replace_small_deck_textures currentSkaterProfileIndex = <currentSkaterProfileIndex>
  FireEvent type = focus target = boardshop_deck_design_menu
endscript
script boardshop_create_griptape_menu
  boardshop_sync_to_skater_graphic
  TRG_Deck_Main:boardshop_reset_main_griptape
  TRG_Deck_Main:Unhide
  TRG_Deck_MainTrucks:Hide
  TRG_Deck_MainJets:Hide
  SetScreenElementLock id = current_menu_anchor off
  GetArraySize griptape
  if not GotParam index
     <index> = 0
  endif
   <pad_left_start_index> = ( <index> - 10 )
   <pad_right_start_index> = ( <index> + 10 )
  if ( <pad_left_start_index> < 0 )
     <pad_left_script> = nullscript
  else
     <pad_left_script> = boardshop_change_griptape_group
  endif
  if ( <pad_right_start_index> > ( <array_size> - 2 ) )
     <pad_right_script> = nullscript
  else
     <pad_right_script> = boardshop_change_griptape_group
  endif
  boardshop_add_griptape_wheel_menu {
    title = "Griptape"
    use_arrows
    pad_left_script = <pad_left_script>
    pad_left_params = { index = <pad_left_start_index> left }
    pad_right_script = <pad_right_script>
    pad_right_params = { index = <pad_right_start_index> right }
    internal_just = [ left top ]
  }
  create_helper_text generic_helper_text_up_down_left_right
  if ( <pad_left_script> = nullscript )
    SetScreenElementProps {
      id = boardshop_left_arrow
      rgba = [ 128 128 128 0 ]
    }
  else
    SetScreenElementProps {
      id = boardshop_left_arrow
      rgba = [ 128 128 128 128 ]
    }
  endif
  if ( <pad_right_script> = nullscript )
    SetScreenElementProps {
      id = boardshop_right_arrow
      rgba = [ 128 128 128 0 ]
    }
  else
    SetScreenElementProps {
      id = boardshop_right_arrow
      rgba = [ 128 128 128 128 ]
    }
  endif
  SetScreenElementLock id = boardshop_griptape_menu on
  SetScreenElementLock id = boardshop_griptape_menu off
  boardshop_reset_small_griptapes
   <count> = 0
  begin
    if ( <count> = 9 )
       <last_item> = last_item
    endif
    if ( <index> = ( <array_size> - 1 ) )
      break
    endif
    if ( <index> = ( <array_size> - 2 ) )
       <last_item> = last_item
    endif
    edit_tricks_menu_add_item {
      text = ( ( griptape [ <index> ] ).frontend_desc )
      text_pos = (128, 5)
      text_just = [ center top ]
      bg_pos = (0, 0)
      bg_scale = (60, 6)
      dims = (256, 24)
      text_scale = 0.7
      pad_choose_script = boardshop_menu_choose_griptape
      pad_choose_params = { desc_id = ( ( griptape [ <index> ].desc_id ) ) }
      focus_script = boardshop_griptape_focus
      focus_params = { dest = ( ( griptape [ <index> ] ).with ) highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (2, 2) }
       <last_item>
    }
    boardshop_get_small_deck_model_checksum index = <count>
    RunScriptOnObject {
      id = <model_checksum>
      boardshop_rotate_small_griptape
      params = { dest = ( ( griptape [ <index> ] ).with ) id = <model_checksum> wait_frames = ( ( <count> + 1 ) * 3 ) }
    }
     <model_checksum>:Unhide
     <index> = ( <index> + 1 )
     <count> = ( <count> + 1 )
  repeat 10
  if ( <count> < 9 )
    begin
      if ( <count> = 10 )
        break
      endif
      boardshop_get_small_deck_model_checksum index = <count>
       <model_checksum>:Hide
       <count> = ( <count> + 1 )
    repeat 10
  endif
  FireEvent type = focus target = boardshop_griptape_menu
endscript
script boardshop_create_board_menu
  GetArraySize board
  if not GotParam index
     <index> = 0
  endif
  SetScreenElementLock id = current_menu_anchor off
    boardshop_add_griptape_wheel_menu {
    title = "Board"
    internal_just = [ left top ]
  }
  create_helper_text { helper_text_elements = [ { text = "\b7/\b4 = Select" }
      { text = "\m1 = Back" }
      { text = "\m0 = Accept" }
    ]
  }
  SetScreenElementLock id = boardshop_griptape_menu on
  SetScreenElementLock id = boardshop_griptape_menu off
  GetStackedScreenElementPos y id = boardshop_griptape_menu
  begin
    if ( <index> = 6 )
       <last_item> = last_item
    endif
  edit_tricks_menu_add_item {
      text = ( ( board [ <index> ] ).frontend_desc )
      text_pos = (128, 5)
      text_just = [ center top ]
      bg_pos = (0, 0)
      bg_scale = (60, 6)
      dims = (256, 24)
      text_scale = 0.7
      pad_choose_script = boardshop_menu_choose_board
      pad_choose_params = { desc_id = ( ( board [ <index> ].desc_id ) ) }
      focus_script = boardshop_griptape_focus
      focus_params = { dest = ( ( board [ <index> ] ).with ) highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (2, 2) }
     <last_item>
   }
   <index> = ( <index> + 1 )
   repeat 6
   FireEvent type = focus target = boardshop_griptape_menu
endscript
script boardshop_create_wheel_color_menu
  boardshop_sync_to_skater_graphic
  boardshop_sync_to_skater_griptape
  TRG_Deck_Main:boardshop_reset_main_board
  SetScreenElementLock id = current_menu_anchor off
  get_current_skater_wheel_color_menu_name
  boardshop_add_griptape_wheel_menu {
    title = <wheel_color_menu_name>
    internal_just = [ right top ]
  }
  create_helper_text { helper_text_elements = [ { text = "\b7/\b4 = Select" }
      { text = "\b6/\b5 = Adjust" }
      { text = "\m1 = Back" }
      { text = "\m0 = Accept" }
    ]
  }
  SetScreenElementLock id = boardshop_griptape_menu on
  SetScreenElementLock id = boardshop_griptape_menu off
  GetStackedScreenElementPos y id = boardshop_griptape_menu
  CreateScreenElement {
    type = SpriteElement
    parent = boardshop_anchor_middle
    texture = black
    rgba = [ 0 0 0 85 ]
    scale = (62, 29)
    pos = <pos>
    just = [ left top ]
  }
  TRG_Deck_Main:Obj_GetId
  colormenu_add_options_to_menu {
    part = board
    dims = (70, 5)
  }
  boardshop_reset_small_decks
   <count> = 0
  begin
    boardshop_get_small_deck_model_checksum index = <count>
    RunScriptOnObject {
      id = <model_checksum>
      boardshop_rotate_small_deck
      params = { id = <model_checksum> wait_frames = ( ( <count> + 1 ) * 3 ) }
    }
     <model_checksum>:Unhide
     <index> = ( <index> + 1 )
     <count> = ( <count> + 1 )
  repeat 10
  FireEvent type = focus target = boardshop_griptape_menu
endscript
script boardshop_add_griptape_wheel_menu internal_just = [ left top ]
  if ObjectExists id = boardshop_anchor_middle
    DestroyScreenElement id = boardshop_anchor_middle
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    id = boardshop_anchor_middle
    dims = (640, 480)
    pos = (320, 240)
  }
   <root_pos> = (360, 60)
  CreateScreenElement {
    type = VMenu
    parent = boardshop_anchor_middle
    id = boardshop_griptape_menu
    pos = <root_pos>
    just = [ left top ]
    internal_just = <internal_just>
    event_handlers = [ { pad_back generic_menu_pad_back_sound }
      { pad_back boardshop_create_main_menu }
      { pad_up generic_menu_up_or_down_sound params = { up } }
      { pad_down generic_menu_up_or_down_sound params = { down } }
    ]
  }
  AssignAlias id = boardshop_griptape_menu alias = current_menu
  if GotParam use_arrows
    SetScreenElementProps {
      id = <id>
      event_handlers = [ { pad_right <pad_right_script> params = <pad_right_params> }
        { pad_left <pad_left_script> params = <pad_left_params> }
      ]
    }
    boardshop_add_menu_title_with_arrows {
      parent = boardshop_griptape_menu
      text = <title>
    }
  else
    boardshop_add_menu_title {
      parent = boardshop_griptape_menu
      text = <title>
    }
  endif
endscript
script boardshop_add_menu_title
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    dims = (200, 28)
    not_focusable
  }
   <anchor_id> = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = black
    scale = (60, 7)
    pos = (0, 0)
    just = [ left top ]
    rgba = [ 0 0 0 85 ]
    z_priority = 1
  }
  GetStackedScreenElementPos x id = <id> offset = (-15, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = grungeframe_top
    pos = <pos>
    just = [ left top ]
    rgba = [ 128 128 128 70 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = stats_notch
    scale = (12.5, 1.8)
    just = [ left top ]
    pos = (20, 3)
    rgba = [ 100 100 100 30 ]
    z_priority = 2
  }
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    text = <text>
    rgba = [ 127 102 0 128 ]
    pos = (118, 3)
    just = [ center top ]
    scale = 1
    z_priority = 3
  }
endscript
script boardshop_add_menu_title_with_arrows
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    dims = (200, 28)
    not_focusable
  }
   <anchor_id> = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = black
    scale = (60, 7)
    pos = (0, 0)
    just = [ left top ]
    rgba = [ 0 0 0 85 ]
    z_priority = 1
  }
  GetStackedScreenElementPos x id = <id> offset = (-15, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = grungeframe_top
    pos = <pos>
    just = [ left top ]
    rgba = [ 128 128 128 70 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    id = boardshop_left_arrow
    texture = left_arrow
    pos = (2, 0)
    just = [ left top ]
    rgba = [ 128 128 128 0 ]
    z_priority = 3
  }
  GetStackedScreenElementPos x id = <id> offset = (2, 3)
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = stats_notch
    scale = (12.5, 1.8)
    just = [ left top ]
    pos = <pos>
    rgba = [ 100 100 100 30 ]
    z_priority = 2
  }
  GetStackedScreenElementPos x id = <id> offset = (1, -3)
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    id = boardshop_right_arrow
    pos = <pos>
    just = [ left top ]
    texture = right_arrow
    rgba = [ 128 128 128 128 ]
    z_priority = 3
  }
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = small
    text = <text>
    rgba = [ 127 102 0 128 ]
    pos = (118, 3)
    just = [ center top ]
    scale = 1
    z_priority = 3
  }
endscript
script boardshop_buy_deck
  FireEvent type = unfocus target = boardshop_deck_design_menu
  DoScreenElementMorph {
    id = current_menu_anchor
    scale = 0
  }
  FormatText TextName = text "Buy this board for $%i?" i = boardshop_deck_price
  create_dialog_box { title = "Boardshop"
    text = <text>
    pos = (310, 183)
    just = [ center center ]
    text_rgba = [ 88 105 112 128 ]
    no_pad_start
    pad_back_script = boardshop_buy_deck_reject
    buttons = [ { font = small text = "Yes" pad_choose_script = boardshop_buy_deck_accept pad_choose_params = <...> }
      { font = small text = "No" pad_choose_script = boardshop_buy_deck_reject }
    ]
  }
endscript
script boardshop_buy_deck_reject
  dialog_box_exit no_pad_start
  GoalManager_GetCash
  FormatText TextName = cash_text "Cash Available: $%i" i = <cash>
  if ObjectExists id = boardshop_cash_available
    SetScreenElementProps {
      id = boardshop_cash_available
      text = <cash_text>
    }
  endif
  DoScreenElementMorph {
    id = current_menu_anchor
    scale = 1
  }
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  SetScreenElementLock id = boardshop_menu_anchor off
  if ( <name> = custom )
    create_helper_text generic_helper_text_up_down_left_right
  else
    create_helper_text generic_helper_text
  endif
  SetScreenElementLock id = boardshop_menu_anchor on
  FireEvent type = focus target = boardshop_deck_design_menu
endscript
script boardshop_buy_deck_accept
  if GoalManager_SpendCash boardshop_deck_price
    GoalManager_ShowGoalPoints
    SetGlobalFlag flag = <flag>
    boardshop_reset_small_decks
    boardshop_replace_small_deck_textures <...>
    if GotParam dest
      boardshop_menu_choose_deck <...>
    endif
    boardshop_buy_deck_reject
  else
    boardshop_buy_deck_reject
  endif
endscript
script boardshop_not_enough_money
  Printf "you don't have the money!"
  generic_menu_pad_back_sound
  PlaySound CheatBad vol = 50
endscript
script boardshop_switch_deck_list
  boardshop_reset_small_decks
  Wait 1 gameframe
   <temp_index> = boardshop_current_deck_list_index
  GetArraySize master_skater_list
   <number_of_skaters> = ( <array_size> + 1 )
  GetArraySize deck_graphic
   <found_new_profile> = 0
  begin
    if GotParam left
       <temp_index> = ( <temp_index> - 10 )
    else
      if GotParam right
         <temp_index> = ( <temp_index> + 10 )
      endif
    endif
    if ( <temp_index> > ( <array_size> - 1 ) )
       <temp_index> = 1
    endif
    if ( <temp_index> < 0 )
       <temp_index> = ( <array_size> - 10 )
    endif
     <skater_name> = ( ( deck_graphic [ <temp_index> ] ).skater )
    if not ( <skater_name> = None )
      GetSkaterProfileInfoByName name = <skater_name>
      if GotParam is_hidden
        if not ( <is_hidden> = 1 )
           <found_new_profile> = 1
          break
        endif
        RemoveParameter is_hidden
      else
         <found_new_profile> = 1
        break
      endif
    endif
  repeat <number_of_skaters>
  if ( <found_new_profile> = 1 )
    Change boardshop_current_deck_list_index = <temp_index>
    boardshop_replace_small_deck_textures {
      name = <name>
      display_name = <display_name>
      is_pro = <is_pro>
      index = ( <temp_index> - 1 )
    }
  endif
endscript
script boardshop_menu_exit
  if IsAlive name = TRG_Deck_Main
    Kill name = TRG_Deck_Main
  endif
  if IsAlive name = TRG_Deck_MainTrucks
    Kill name = TRG_Deck_MainTrucks
  endif
  if IsAlive name = TRG_Deck_MainJets
    Kill name = TRG_Deck_MainJets
  endif
  boardshop_kill_spawned_scripts
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 gameframe
  endif
  boardshop_remove_textures_from_vram
  GoalManager_HideGoalPoints
  if GotParam to_secrets
    create_secrets_menu
  else
    create_edit_skater_menu <edit_skater_menu_params>
  endif
endscript
script boardshop_deck_design_focus
  GetTags
  KillSpawnedScript name = boardshop_replace_main_board_texture
  if GotParam flag
    if GetGlobalFlag flag = <flag>
      SetScreenElementProps {
        id = boardshop_deck_price
        text = "\c3Press \c0\m0\c3 to equip this board"
      }
      if GotParam dest
        RunScriptOnObject id = TRG_Deck_Main boardshop_replace_main_board_texture params = { dest = <dest> }
      endif
    else
      GoalManager_GetCash
      if ( <cash> > 49 )
        FormatText TextName = price_text "\c3This Board is $%i." i = boardshop_deck_price
        SetScreenElementProps {
          id = boardshop_deck_price
          text = <price_text>
        }
      else
        SetScreenElementProps {
          id = boardshop_deck_price
          text = "\c3You can't afford this board"
        }
      endif
      RunScriptOnObject id = TRG_Deck_Main boardshop_replace_main_board_texture params = { dest = "textures\boards\LockedB01" }
    endif
  endif
  edit_tricks_menu_focus <...>
endscript
script boardshop_griptape_focus
  KillSpawnedScript name = boardshop_replace_main_griptape
  if GotParam dest
    RunScriptOnObject id = TRG_Deck_Main boardshop_replace_main_griptape params = { dest = <dest> }
  endif
  edit_tricks_menu_focus <...>
endscript
script boardshop_change_griptape_group
  SpawnScript boardshop_create_griptape_menu params = <...>
endscript
script boardshop_reset_small_decks
  KillSpawnedScript name = boardshop_replace_small_deck_textures
  KillSpawnedScript name = boardshop_rotate_small_deck
   <index> = 0
  begin
    boardshop_get_small_deck_model_checksum index = <index>
     <model_checksum>:boardshop_reset_small_deck
     <index> = ( <index> + 1 )
  repeat 10
endscript
script boardshop_reset_small_griptapes
  KillSpawnedScript name = boardshop_rotate_small_griptape
   <index> = 0
  begin
    boardshop_get_small_deck_model_checksum index = <index>
     <model_checksum>:boardshop_reset_small_griptape
     <index> = ( <index> + 1 )
  repeat 10
  PlaySound BoardsFlip
endscript
script boardshop_replace_small_deck_textures
  if not GotParam name
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  endif
  if GotParam display_name
    if ( <is_pro> = 0 )
      deck_title = "Custom Skater"
    else
      deck_title = <display_name>
    endif
    if ObjectExists id = boardshop_deck_list_title
      SetScreenElementProps {
        id = boardshop_deck_list_title
        text = <deck_title>
      }
    endif
  endif
   <board_index> = 1
  if not GotParam index
     <index> = ( boardshop_current_deck_list_index - 1 )
  endif
  begin
    if not GetIndexOfItemContaining array = deck_graphic index = ( <index> + 1 ) name = skater value = <name>
      break
    endif
     <dest> = ( ( deck_graphic [ <index> ] ).with )
     <flag> = ( ( deck_graphic [ <index> ] ).flag )
    if ObjectExists id = boardshop_deck_design_menu
      if GetGlobalFlag flag = <flag>
        SetScreenElementProps {
          id = { boardshop_deck_design_menu child = <board_index> }
          event_handlers = [ { focus boardshop_deck_design_focus params = { flagged_deck flag = <flag> dest = ( ( deck_graphic [ <index> ] ).with ) highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (-28, -16) } }
            { unfocus edit_tricks_menu_unfocus params = { flagged_deck } }
            { pad_choose boardshop_menu_choose_deck params = { dest = ( ( deck_graphic [ <index> ] ).with ) desc_id = ( ( deck_graphic [ <index> ] ).desc_id ) } }
            { pad_start boardshop_menu_choose_deck params = { dest = ( ( deck_graphic [ <index> ] ).with ) desc_id = ( ( deck_graphic [ <index> ] ).desc_id ) } }
          ]
          replace_handlers
        }
        SetScreenElementProps {
          id = { boardshop_deck_design_menu child = { <board_index> child = 0 } }
          text = ( ( deck_graphic [ <index> ] ).frontend_desc )
          rgba = [ 25 83 67 128 ]
        }
        GetScreenElementDims id = { boardshop_deck_design_menu child = { <board_index> child = 0 } }
        line_scale = ( ( ( <width> / 4 ) * (1, 0) ) + (0, 0.25) )
        DoScreenElementMorph {
          id = { boardshop_deck_design_menu child = { <board_index> child = 3 } }
          alpha = 1
          scale = <line_scale>
          time = 0
        }
      else
        GoalManager_GetCash
        if ( <cash> > 49 )
           <buy_deck_script> = boardshop_buy_deck
        else
           <buy_deck_script> = boardshop_not_enough_money
        endif
        SetScreenElementProps {
          id = { boardshop_deck_design_menu child = <board_index> }
          event_handlers = [ { focus boardshop_deck_design_focus params = { flag = <flag> dest = ( ( deck_graphic [ <index> ] ).with ) highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (-28, -16) } }
            { pad_choose <buy_deck_script> params = { flag = <flag> currentSkaterProfileIndex = <currentSkaterProfileIndex> name = <name> dest = ( ( deck_graphic [ <index> ] ).with ) desc_id = ( ( deck_graphic [ <index> ] ).desc_id ) } }
            { pad_start <buy_deck_script> params = { flag = <flag> currentSkaterProfileIndex = <currentSkaterProfileIndex> name = <name> dest = ( ( deck_graphic [ <index> ] ).with ) desc_id = ( ( deck_graphic [ <index> ] ).desc_id ) } }
            { focus boardshop_deck_design_focus params = { flag = <flag> dest = ( ( deck_graphic [ <index> ] ).with ) highlight_bar_scale = (0.94, 1.3) highlight_bar_pos = (-28, -16) } }
            { unfocus edit_tricks_menu_unfocus params = { } }
          ]
          replace_handlers
        }
        SetScreenElementProps {
          id = { boardshop_deck_design_menu child = { <board_index> child = 0 } }
          text = ( ( deck_graphic [ <index> ] ).frontend_desc )
          rgba = [ 88 105 112 128 ]
        }
        DoScreenElementMorph {
          id = { boardshop_deck_design_menu child = { <board_index> child = 3 } }
          alpha = 0
          time = 0
        }
         <dest> = "textures\boards\LockedB01"
      endif
    endif
    boardshop_get_small_deck_model_checksum index = ( <board_index> - 1 )
    RunScriptOnObject {
      id = <model_checksum>
      boardshop_rotate_small_deck
      params = { dest = <dest> id = <model_checksum> wait_frames = ( <board_index> * 3 ) }
    }
     <model_checksum>:Unhide
     <board_index> = ( <board_index> + 1 )
  repeat 10
  if ObjectExists id = boardshop_deck_design_menu
    boardshop_deck_design_menu:GetTags
    if GotParam tag_selected_id
      FireEvent type = focus target = <tag_selected_id>
    endif
  endif
  PlaySound BoardsFlip
endscript
script boardshop_add_textures_to_vram
  AddTextureToVram "PA_Mode"
  AddTextureToVram "grungeframe_top"
  AddTextureToVram "grungeframe_mid"
  AddTextureToVram "grungeframe_bot"
  AddTextureToVram "right_arrow"
  AddTextureToVram "left_arrow"
  AddTextureToVram "up_arrow"
  AddTextureToVram "down_arrow"
  AddTextureToVram "goal_right"
  AddTextureToVram "stats_notch"
  AddTextureToVram "colorbar"
  AddTextureToVram "bw_slider"
endscript
script boardshop_remove_textures_from_vram
  RemoveTextureFromVram "PA_Mode"
  RemoveTextureFromVram "grungeframe_top"
  RemoveTextureFromVram "grungeframe_mid"
  RemoveTextureFromVram "grungeframe_bot"
  RemoveTextureFromVram "right_arrow"
  RemoveTextureFromVram "left_arrow"
  RemoveTextureFromVram "up_arrow"
  RemoveTextureFromVram "down_arrow"
  RemoveTextureFromVram "goal_right"
  RemoveTextureFromVram "stats_notch"
  RemoveTextureFromVram "colorbar"
endscript
script boardshop_get_small_deck_model_checksum
   <index> = ( <index> + 1 )
  board_id = "TRG_Deck_"
  if ( <index> < 10 )
    FormatText TextName = board_id "%s0" s = <board_id>
  endif
  FormatText ChecksumName = board_id_checksum "%s%i" s = <board_id> i = <index>
  return model_checksum = <board_id_checksum>
endscript
script boardshop_menu_choose_deck
  cas_add_item part = deck_graphic desc_id = <desc_id> play_deck_sound
endscript
script boardshop_menu_choose_griptape
  cas_add_item part = griptape desc_id = <desc_id>
endscript
script boardshop_menu_choose_board
  cas_add_item part = board desc_id = <desc_id>
  get_current_skater_use_jets
  if ( <use_jets> = 1 )
    TRG_Deck_MainTrucks:Hide
    TRG_Deck_MainJets:Unhide
  else
    TRG_Deck_MainTrucks:Unhide
    TRG_Deck_MainJets:Hide
  endif
  TRG_Deck_Main:Hide
  TRG_Deck_Main:Unhide
 
endscript
script boardshop_sync_to_skater_graphic
  GetCurrentSkaterProfileIndex
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = deck_graphic
    GetActualCASOptionStruct part = deck_graphic desc_id = <desc_id>
    TRG_Deck_Main:Obj_ReplaceTexture src = "DM_thps4_board01.png" dest = <with>
  endif
endscript
script boardshop_sync_to_skater_griptape
  GetCurrentSkaterProfileIndex
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = griptape
    GetActualCASOptionStruct part = griptape desc_id = <desc_id>
    TRG_Deck_Main:Obj_ReplaceTexture src = "cw_ss_generic_griptape_01.png" dest = <with>
  endif
endscript
script boardshop_kill_spawned_scripts
  KillSpawnedScript name = boardshop_reset_small_deck
  KillSpawnedScript name = boardshop_reset_small_griptape
  KillSpawnedScript name = boardshop_rotate_small_deck
  KillSpawnedScript name = boardshop_rotate_small_griptape
  KillSpawnedScript name = boardshop_replace_main_board_texture
  KillSpawnedScript name = boardshop_replace_main_griptape
endscript
script boardshop_rotate_small_deck
  Obj_Rotate absolute = (0, 0, 0)
  Wait <wait_frames> gameframe
   <src> = "DM_thps4_board01.png"
  Obj_Rotate time = 0.25 relative = (0, 180, 0)
  Obj_WaitRotate
  if GotParam dest
    Obj_ReplaceTexture src = <src> dest = <dest>
  endif
  Obj_Rotate time = 0.25 relative = (0, 180, 0)
  Obj_WaitRotate
endscript
script boardshop_rotate_small_griptape
  Obj_Rotate absolute = (0, 180, 0)
  Wait <wait_frames> gameframe
   <src> = "cw_ss_generic_griptape_01.png"
  Obj_Rotate time = 0.25 relative = (0, 180, 0)
  Obj_WaitRotate
  if GotParam dest
    Obj_ReplaceTexture src = <src> dest = <dest>
  endif
  Obj_Rotate time = 0.25 relative = (0, 180, 0)
  Obj_WaitRotate
endscript
script boardshop_replace_main_board_texture
  Obj_Rotate absolute = (0, 300, 0)
  Wait 1 gameframe
  Obj_ReplaceTexture src = "DM_thps4_board01.png" dest = <dest>
endscript
script boardshop_replace_main_griptape
  Obj_Rotate absolute = (0, 120, 0)
  Wait 1 gameframe
  Obj_ReplaceTexture src = "cw_ss_generic_griptape_01.png" dest = <dest>
endscript
script boardshop_reset_main_board
  Obj_Rotate absolute = (0, 300, 0)
endscript
script boardshop_reset_main_griptape
  Obj_Rotate absolute = (0, 120, 0)
endscript
script boardshop_reset_main_trucks
  Obj_Rotate absolute = (90, 300, 0)
endscript
script boardshop_reset_small_deck
  Obj_Rotate absolute = (0, 0, 0)
endscript
script boardshop_reset_small_griptape
  Obj_Rotate absolute = (0, 180, 0)
endscript
boardshop_current_deck_list_index = 0
