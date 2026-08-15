
script game_progress_menu_create
  SetScreenElementLock id = root_window off
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
    SetScreenElementLock id = root_window off
  endif
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  remove_pause_menu_textures_from_vram
  game_progress_menu_add_textures_to_vram
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = game_progress_menu_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  AssignAlias id = game_progress_menu_anchor alias = current_menu_anchor
   <root_pos> = (90, 25)
  set_sub_bg_goal {
    pos = ( <root_pos> + (147, 3) )
    goal_mid_scale = (14.8, 1.33)
    goal_end_scale = (1, 1.33)
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = PA_model
    pos = <root_pos>
    just = [ left top ]
    rgba = [ 127 102 0 128 ]
  }
  GetStackedScreenElementPos x id = <id> offset = (0, 5)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = TestTitle
    text = "GAME PROGRESS"
    scale = 1.31
    pos = <pos>
    just = [ left top ]
    rgba = [ 128 128 128 85 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = ( <root_pos> + (39, 36) )
    just = [ left top ]
    scale = (98, 5)
    rgba = [ 0 0 0 80 ]
    z_priority = 1
  }
  GetStackedScreenElementPos y id = <id> offset = (0, 292)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = <pos>
    just = [ left top ]
    scale = (98, 5)
    rgba = [ 0 0 0 80 ]
    z_priority = 1
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = ( <root_pos> + (275, 56) )
    just = [ left top ]
    scale = (2, 73)
    rgba = [ 0 0 0 128 ]
    z_priority = 1
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = game_progress_menu_up_arrow
    texture = up_arrow
    pos = ( <root_pos> + (140, 35) )
    just = [ left top ]
    rgba = [ 128 128 128 128 ]
  }
  GetStackedScreenElementPos y id = <id> offset = (0, 300)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = game_progress_menu_down_arrow
    texture = down_arrow
    pos = <pos>
    just = [ left top ]
    rgba = [ 128 128 128 128 ]
  }
  CreateScreenElement {
    type = VScrollingMenu
    parent = current_menu_anchor
    pos = ( <root_pos> + (39, 56) )
    just = [ left top ]
    dims = (400, 288)
  }
  CreateScreenElement {
    type = VMenu
    parent = <id>
    id = game_progress_vmenu
    just = [ left top ]
    internal_just = [ left top ]
    event_handlers = [ { pad_back game_progress_menu_exit }
      { pad_up set_which_arrow params = { arrow = game_progress_menu_up_arrow } }
      { pad_down set_which_arrow params = { arrow = game_progress_menu_down_arrow } }
      { pad_up generic_menu_up_or_down_sound params = { up } }
      { pad_down generic_menu_up_or_down_sound params = { down } }
      { pad_back generic_menu_pad_back_sound }
    ]
  }
  AssignAlias id = game_progress_vmenu alias = current_menu
  game_progress_menu_fill
  create_helper_text { helper_text_elements = [ { text = "\b7/\b4 = Select" }
      { text = "\m1 = Back" }
    ]
  }
  FireEvent type = focus target = current_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script game_progress_menu_fill
  GoalManager_GetNumberOfGoalPoints total
  FormatText TextName = goal_points "%i / 190" i = <goal_points>
  game_progress_menu_add_section_header {
    first_column_text = "TOTAL GOALS:"
    second_column_text = <goal_points>
    second_column_rgba = [ 88 105 112 128 ]
    second_column_scale = 0.9
  }
  GoalManager_GetCash total
  FormatText TextName = cash "$%i" i = <cash>
  game_progress_menu_add_section_header {
    first_column_text = "TOTAL CASH:"
    second_column_text = <cash>
    second_column_rgba = [ 88 105 112 128 ]
    second_column_scale = 0.9
  }
  game_progress_menu_add_section_header {
    create_bg
    icon = pa_view
    first_column_text = "GOALS"
    not_focusable = not_focusable
  }
  GetArraySize level_select_menu_level_info
   <index> = 0
  begin
    if not ( ( ( level_select_menu_level_info [ <index> ] ).Level ) = load_sk4ed_gameplay )
       <level_num> = ( ( level_select_menu_level_info [ <index> ] ).level_num )
      GoalManager_NumGoalsBeatenInLevel <level_num>
       <total_goals> = ( ( level_select_menu_level_info [ <index> ] ).num_goals )
      FormatText TextName = goals_beaten_text "%i/%j" i = <num_beaten> j = <total_goals>
       <level_text> = ( ( level_select_menu_level_info [ <index> ] ).text )
      game_progress_menu_add_item {
        first_column_text = <level_text>
        second_column_text = <goals_beaten_text>
      }
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
  game_progress_menu_add_section_header {
    create_bg
    icon = pa_special
    first_column_text = "PRO CHALLENGE"
    not_focusable = not_focusable
  }
  GetArraySize master_skater_list
   <index> = 0
  begin
    if not StructureContains structure = ( master_skater_list [ <index> ] ) is_secret
       <skater_display_name> = ( ( master_skater_list [ <index> ] ).display_name )
       <skater_name> = ( ( master_skater_list [ <index> ] ).name )
      Printf "looking for skater %s" s = <skater_name>
      if GoalManager_SkaterHasBeatenProSpecificChallenge skater = <skater_name>
         <beaten_text> = "Complete"
      else
         <beaten_text> = "Not Finished"
      endif
      game_progress_menu_add_item {
        first_column_text = <skater_display_name>
        second_column_text = <beaten_text>
      }
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
  game_progress_menu_add_section_header {
    create_bg
    icon = pa_gap
    first_column_text = "GAPS"
    not_focusable = not_focusable
  }
  GetArraySize level_select_menu_level_info
   <index> = 0
  begin
    if not ( ( ( level_select_menu_level_info [ <index> ] ).Level ) = load_sk4ed_gameplay )
       <level_num> = ( ( level_select_menu_level_info [ <index> ] ).level_num )
      GetLevelGapTotals Level = <level_num>
      if ( <num_gaps> = 0 )
         <gaps_text> = "0/??"
      else
        FormatText TextName = gaps_text "%i/%j" i = <num_collected_gaps> j = <num_gaps>
      endif
       <level_text> = ( ( level_select_menu_level_info [ <index> ] ).text )
      game_progress_menu_add_item {
        first_column_text = <level_text>
        second_column_text = <gaps_text>
      }
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
  game_progress_menu_add_section_header {
    create_bg
    icon = pa_shop
    first_column_text = "CASH ICONS"
    not_focusable = not_focusable
  }
  GetArraySize level_select_menu_level_info
   <index> = 0
  begin
    if not ( ( ( level_select_menu_level_info [ <index> ] ).Level ) = load_sk4ed_gameplay )
       <level_num> = ( ( level_select_menu_level_info [ <index> ] ).level_num )
       <num_collected> = 0
       <flag_number> = 64
      begin
        if GetFlag flag = <flag_number> Level = <level_num>
           <num_collected> = ( <num_collected> + 1 )
        endif
         <flag_number> = ( <flag_number> + 1 )
      repeat 25
       <level_text> = ( ( level_select_menu_level_info [ <index> ] ).text )
      FormatText TextName = cash_text "%i/25" i = <num_collected>
      game_progress_menu_add_item {
        first_column_text = <level_text>
        second_column_text = <cash_text>
      }
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
endscript
script game_progress_menu_add_section_header { first_column_rgba = [ 127 102 0 128 ]
    first_column_scale = 0.8
    second_column_rgba = [ 127 102 0 128 ]
    second_column_scale = 0.8
  }
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    dims = (400, 20)
    event_handlers = [ { focus game_progress_menu_focus }
      { unfocus game_progress_menu_unfocus params = { first_column_rgba = <first_column_rgba> } }
    ]
     <not_focusable>
  }
   <anchor_id> = <id>
  if GotParam create_bg
    CreateScreenElement {
      type = SpriteElement
      parent = <anchor_id>
      texture = black
      rgba = [ 0 0 0 80 ]
      pos = (0, 0)
      just = [ left top ]
      scale = (98, 5)
      z_priority = 1
    }
  endif
  if GotParam icon
    CreateScreenElement {
      type = SpriteElement
      parent = <anchor_id>
      texture = <icon>
      pos = (3, -7)
      just = [ left top ]
      rgba = [ 80 80 80 128 ]
      scale = 0.8
      z_priority = 2
    }
  endif
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = dialog
    text = <first_column_text>
    pos = (50, 0)
    just = [ left top ]
    rgba = <first_column_rgba>
    scale = <first_column_scale>
    z_priority = 2
  }
  if GotParam second_column_text
    CreateScreenElement {
      type = TextElement
      parent = <anchor_id>
      font = dialog
      text = <second_column_text>
      pos = (315, 0)
      just = [ center top ]
      rgba = <second_column_rgba>
      scale = <second_column_scale>
      z_priority = 2
    }
  endif
endscript
script game_progress_menu_add_item
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    dims = (400, 20)
    event_handlers = [ { focus game_progress_menu_focus }
      { unfocus game_progress_menu_unfocus }
    ]
  }
   <anchor_id> = <id>
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = dialog
    text = <first_column_text>
    pos = (50, 0)
    just = [ left top ]
    rgba = [ 88 105 112 128 ]
    scale = 0.9
    z_priority = 1
  }
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = dialog
    text = <second_column_text>
    pos = (315, 0)
    just = [ center top ]
    rgba = [ 88 105 112 128 ]
    scale = 0.9
    z_priority = 1
  }
endscript
script game_progress_menu_focus
  GetTags
  SetScreenElementLock id = <id> off
  SetScreenElementProps {
    id = { <id> child = 0 }
    rgba = [ 127 102 0 128 ]
  }
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = [ 127 102 0 128 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <id>
    texture = highlight_bar
    pos = (0, 0)
    just = [ left top ]
    scale = (1.5, 1.2)
    rgba = [ 128 128 128 80 ]
    z_priority = 0
  }
  generic_menu_update_arrows {
    menu_id = game_progress_vmenu
    up_arrow_id = game_progress_menu_up_arrow
    down_arrow_id = game_progress_menu_down_arrow
  }
  game_progress_vmenu:GetTags
  if GotParam arrow_id
    menu_vert_blink_arrow { id = <arrow_id> }
  endif
endscript
script game_progress_menu_unfocus first_column_rgba = [ 88 105 112 128 ]
  GetTags
  SetScreenElementLock id = <id> off
  SetScreenElementProps {
    id = { <id> child = 0 }
    rgba = <first_column_rgba>
  }
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = [ 88 105 112 128 ]
  }
  if ScreenElementExists id = { <id> child = 2 }
    DestroyScreenElement id = { <id> child = 2 }
  endif
endscript
script game_progress_menu_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 gameframe
  endif
  game_progress_menu_remove_textures_from_vram
  if LevelIs load_skateshop
    add_ss_menu_textures_to_vram
    create_ss_menu
  else
    add_pause_menu_textures_to_vram
    create_options_menu
  endif
endscript
script game_progress_menu_add_textures_to_vram
  AddTextureToVram "PA_Model"
  AddTextureToVram "PA_Shop"
  AddTextureToVram "PA_View"
  AddTextureToVram "PA_Special"
  AddTextureToVram "PA_Gap"
  AddTextureToVram "goal_left"
  AddTextureToVram "goal_mid"
  AddTextureToVram "goal_right"
  AddTextureToVram "up_arrow"
  AddTextureToVram "down_arrow"
endscript
script game_progress_menu_remove_textures_from_vram
  RemoveTextureFromVram "PA_Model"
  RemoveTextureFromVram "PA_Shop"
  RemoveTextureFromVram "PA_View"
  RemoveTextureFromVram "PA_Special"
  RemoveTextureFromVram "PA_Gap"
  RemoveTextureFromVram "goal_left"
  RemoveTextureFromVram "goal_mid"
  RemoveTextureFromVram "goal_right"
  RemoveTextureFromVram "up_arrow"
  RemoveTextureFromVram "down_arrow"
endscript
