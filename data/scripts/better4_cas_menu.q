better4_cas_category_index = 0

script better4_create_cas_part_menu
  Change better4_cas_category_index = 0
  if GotParam cam_anim_sub
    KillSkaterCamAnim all
    PlaySkaterCamAnim name = <cam_anim_sub> play_hold
  endif

  if GotParam parent_index
    Change edit_skater_menu_level_2_index = <parent_index>
  endif

  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>

  GetArraySize master_editable_list
  <master_size> = <array_size>
  <index> = 0
  <current_submenu> = <submenu>
  <found> = 0
  begin
    RemoveParameter flags
    RemoveParameter preview_menu
    RemoveParameter submenu
    AddParams ( master_editable_list [ <index> ] )
    <shouldDisplayList> = 0

    if ( <is_male> = 1 )
      if GotParam male
         <shouldDisplayList> = ( <male> = 1 )
      endif
    else
      if GotParam female
         <shouldDisplayList> = ( <female> = 1 )
      endif
    endif

    if GotParam submenu
      if ( <submenu> = <current_submenu> )
        if not ( <shouldDisplayList> = 0 )
          <found> = 1
          break
        endif
      endif
    endif

    <index> = ( <index> + 1 )
  repeat <master_size>

  if ( <found> = 1 )
    edit_skater_create_menu_block tab_texture = tab3 middle_texture = repeat_piece3 bottom_texture = menu_bottom
    GetStackedScreenElementPos y id = edit_skater_menu_tab offset = (182, -17)
    CreateScreenElement {
      type = TextElement
      id = edit_skater_category
      parent = edit_skater_anchor_middle
      font = dialog
      text = "THPS4"
      rgba = [ 88 105 112 128 ]
      just = [ center center ]
      scale = 0.8
      pos = <pos>
      z_priority = 10
      not_focusable
    }
    CreateScreenElement {
      type = SpriteElement
      id = edit_skater_category_left
      parent = edit_skater_anchor_middle
      pos = ( <pos> - (41, 0) )
      scale = (0.7, 0.7)
      texture = left_arrow
      rgba = [ 128 128 128 100 ]
      z_priority = 10
    }
    CreateScreenElement {
      type = SpriteElement
      id = edit_skater_category_right
      parent = edit_skater_anchor_middle
      pos = ( <pos> + (41, 0) )
      scale = (0.7, 0.7)
      texture = right_arrow
      rgba = [ 128 128 128 100 ]
      z_priority = 10
    }
    edit_skater_create_scrolling_menu {
      tab = tab3
      pad_back_script = edit_skater_create_options_menu
      pad_back_params = { options_array = <options_array> cam_anim = <cam_anim> should_add_reset_tattoos = <should_add_reset_tattoos> should_add_reset_scaling = <should_add_reset_scaling> }
      pad_left_script = better4_cas_category_left
      pad_left_params = <...>
      pad_right_script = better4_cas_category_right
      pad_right_params = <...>
    }
    better4_create_cas_part_category <...>
  else
    LogWarning "did not find correct part/submenu; returning to options menu"
    edit_skater_create_options_menu options_array = <options_array> cam_anim = <cam_anim> should_add_reset_tattoos = <should_add_reset_tattoos> should_add_reset_scaling = <should_add_reset_scaling>
  endif
endscript

script better4_create_cas_part_category
  AddParams ( <categories> [ better4_cas_category_index ] )
  LogInfo "Opening Category label=%l" l = <label>

  if ScreenElementExists id = edit_skater_vmenu
    DestroyScreenElement id = edit_skater_vmenu recurse preserve_parent
  endif
  if ScreenElementExists id = edit_skater_category
    SetScreenElementProps id = edit_skater_category text = <label>
  endif

  GetArraySize <items>
  <item_index> = 0
  begin
    edit_skater_possibly_add_cas_item {
      ( <items> [ <item_index> ] )
      part = <part>
      desc_id = <desc_id>
      flags = <flags>
      index = <index>
    }
    <item_index> = ( <item_index> + 1 )
  repeat <array_size>

  edit_skater_menu_add_item {
    text = 'Done'
    tab = tab3
    pad_choose_script = edit_skater_create_options_menu
    pad_choose_params = {
      options_array = <options_array>
      cam_anim = <cam_anim>
      should_add_reset_tattoos = <should_add_reset_tattoos>
      should_add_reset_scaling = <should_add_reset_scaling>
    }
  }

  FireEvent type = focus target = current_menu
  generic_menu_update_arrows {
    up_arrow_id = edit_skater_menu_up_arrow
    down_arrow_id = edit_skater_menu_down_arrow
  }
endscript

script better4_cas_category_left
  generic_menu_up_or_down_sound Down
  RunScriptOnScreenElement id = edit_skater_category_left menu_blink_arrow
  <new_index> = better4_cas_category_index
  if ( <new_index> > 0 )
    <new_index> = ( <new_index> - 1 )
  else
    GetArraySize <categories>
    <new_index> = ( <array_size> - 1 )
  endif
  Change better4_cas_category_index = <new_index>
  better4_create_cas_part_category <...>
endscript

script better4_cas_category_right
  generic_menu_up_or_down_sound Up
  RunScriptOnScreenElement id = edit_skater_category_right menu_blink_arrow
  <new_index> = better4_cas_category_index
  GetArraySize <categories>
  if ( <new_index> < ( <array_size> - 1 ) )
    <new_index> = ( <new_index> + 1 )
  else
    <new_index> = 0
  endif
  Change better4_cas_category_index = <new_index>
  better4_create_cas_part_category <...>
endscript
