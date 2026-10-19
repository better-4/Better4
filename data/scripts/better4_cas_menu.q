script better4_create_cas_part_menu {
  category_index = 0
}
  edit_skater_create_menu_block tab_texture = tab3 middle_texture = repeat_piece3 bottom_texture = menu_bottom

  if GotParam cam_anim_sub
    KillSkaterCamAnim all
    PlaySkaterCamAnim name = <cam_anim_sub> play_hold
  endif

  if GotParam parent_index
    Change edit_skater_menu_level_2_index = <parent_index>
  endif

  edit_skater_create_scrolling_menu {
    tab = tab3
    pad_back_script = edit_skater_create_options_menu
    pad_back_params = { options_array = <options_array> cam_anim = <cam_anim> should_add_reset_tattoos = <should_add_reset_tattoos> should_add_reset_scaling = <should_add_reset_scaling> }
  }

  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>

  GetArraySize master_editable_list
   <master_size> = <array_size>
   <index> = 0
   <current_submenu> = <submenu>
  begin
    RemoveParameter flags
    RemoveParameter preview_menu
    RemoveParameter colormenu
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
          better4_create_cas_part_category <...>
        endif
      endif
    endif

    if GotParam colormenu
      if ( <colormenu> = <current_submenu> )
        if not ( <shouldDisplayList> = 0 )
          if ScreenElementExists id = edit_skater_menu_up_arrow
            DoScreenElementMorph {
              id = edit_skater_menu_up_arrow
              scale = 0
              relative_scale
            }
          endif
          if ScreenElementExists id = edit_skater_menu_down_arrow
            DoScreenElementMorph {
              id = edit_skater_menu_down_arrow
              scale = 0
              relative_scale
            }
          endif
          colormenu_add_options_to_menu part = <part> from_cas
        endif
      endif
    endif

    <index> = ( <index> + 1 )
  repeat <master_size>

  if GotParam should_add_scaling_options
    scalingmenu_add_options_to_menu part = <bone_group> <scaling_params>
  endif

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
endscript

script better4_create_cas_part_category {
  category_index = 0
}
  <category> = ( <categories> [ <category_index> ] )
  <label> = ( ( <category> ).label )
  <items> = ( ( <category> ).items )
  LogInfo "OPENING CATEGORY label=%l" l = <label>

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
endscript
