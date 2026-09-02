
script launch_cas_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_cas_menu
endscript
script create_cas_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu menu_id = cas_menu vmenu_id = cas_vmenu menu_title = "CREATE A SKATER" type = vscrollingmenu dims = (320, 200)
  if LevelIs Load_Skateshop
    SetScreenElementProps {
      id = cas_menu
      event_handlers = [ { pad_back launch_ss_menu } ]
      replace_handlers
    }
  else
    SetScreenElementProps {
      id = cas_menu
      event_handlers = [ { pad_back create_debug_menu } ]
      replace_handlers
    }
  endif
  make_text_sub_menu_item {
    text = "SEX"
    pad_choose_script = launch_sex_menu
  }
  add_cas_to_menu
  make_text_sub_menu_item {
    text = "BUILDS"
    pad_choose_script = launch_bodyshape_menu
  }
  set_sub_bg type = spriteelement
  create_icon texture = PA_model
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script add_cas_to_menu editable_list = master_editable_list
  GetArraySize <editable_list>
   <index> = 0
  begin
    AddParams ( <editable_list> [ <index> ] )
     <shouldDisplayList> = 0
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    if ( <is_male> = 1 )
      if GotParam male
         <shouldDisplayList> = ( <male> = 1 )
      endif
    else
      if GotParam female
         <shouldDisplayList> = ( <female> = 1 )
      endif
    endif
    if not ( <shouldDisplayList> = 0 )
      make_text_sub_menu_item {
        text = ( ( <editable_list> [ <index> ] ).text )
        pad_choose_script = launch_cas_submenu
        pad_choose_params = { <...> }
      }
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
endscript
script launch_cas_submenu
  RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_cas_submenu callback_params = { <...> }
endscript
script create_cas_submenu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu menu_id = cas_submenu vmenu_id = cas_subvmenu menu_title = <text> type = vscrollingmenu dims = (320, 200)
  SetScreenElementProps {
    id = cas_submenu
    event_handlers = [ { pad_back create_cas_menu } ]
    replace_handlers
  }
  add_cas_sub_to_menu <...>
  set_sub_bg type = spriteelement
  create_icon texture = PA_model
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script cas_add_item
  Printf "Adding CAS item here"
  if GotParam play_deck_sound
    PlaySound MenuSelect vol = 100
  endif
  cas_handle_disqualifications <...>
  GetCurrentSkaterProfileIndex
  if LevelIs Load_Skateshop
    EditPlayerAppearance player = 0 profile = <currentSkaterProfileIndex> target = SetPart targetParams = { <...> }
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
  else
    EditPlayerAppearance player = <currentSkaterProfileIndex> profile = <currentSkaterProfileIndex> target = SetPart targetParams = { <...> }
    RefreshSkaterModel skater = <currentSkaterProfileIndex> profile = <currentSkaterProfileIndex>
  endif
  if IsTrue cas_debug
    DumpHeaps
  endif
endscript
script cas_remove_item
  Printf "Removing CAS item here"
  PrintStruct <...>
  GetCurrentSkaterProfileIndex
  if LevelIs Load_Skateshop
    EditPlayerAppearance player = 0 profile = <currentSkaterProfileIndex> target = ClearPart targetParams = { <...> }
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
  else
    EditPlayerAppearance player = <currentSkaterProfileIndex> profile = <currentSkaterProfileIndex> target = ClearPart targetParams = { <...> }
    RefreshSkaterModel skater = <currentSkaterProfileIndex> profile = <currentSkaterProfileIndex>
  endif
endscript
script possibly_add_cas_item
  if not GotParam hidden
    if not GotParam FrontEnd_Desc
       <frontend_desc_local> = "Unknown"
    else
       <frontend_desc_local> = <FrontEnd_Desc>
    endif
    make_text_sub_menu_item {
      text = <frontend_desc_local>
      pad_choose_script = cas_add_item
      pad_choose_params = { part = <partChecksum> desc_id = <desc_id> }
    }
  endif
endscript
script add_cas_sub_to_menu
  RemoveComponent name = index
  make_text_sub_menu_item {
    text = "Remove Item"
    pad_choose_script = cas_remove_item
    pad_choose_params = { part = <part> }
  }
  GetArraySize <part>
   <index> = 0
  begin
    possibly_add_cas_item ( <part> [ <index> ] ) partChecksum = <part>
     <index> = ( <index> + 1 )
  repeat <array_size>
endscript
script launch_bodyshape_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_bodyshape_menu callback_params = { <...> }
endscript
script create_bodyshape_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu menu_id = cas_submenu vmenu_id = cas_subvmenu menu_title = "BUILDS" type = vscrollingmenu dims = (320, 200)
  SetScreenElementProps {
    id = cas_submenu
    event_handlers = [ { pad_back create_cas_menu } ]
    replace_handlers
  }
  add_bodyshapes_to_menu <...>
  set_sub_bg type = spriteelement
  create_icon texture = PA_model
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script add_bodyshapes_to_menu
  GetArraySize master_bodyshape_list
   <index> = 0
  begin
    make_text_sub_menu_item {
      text = ( ( master_bodyshape_list [ <index> ] ).text )
      pad_choose_script = cas_apply_bodyshape
      pad_choose_params = { field = body_shape value = ( ( master_bodyshape_list [ <index> ] ).scaling_table ) }
    }
     <index> = ( <index> + 1 )
  repeat <array_size>
endscript
master_bodyshape_list = [
  { text = "Normal" scaling_table = normal_scale_info }
  { text = "Large" scaling_table = fat_scale_info }
  { text = "Athletic" scaling_table = athletic_scale_info }
  { text = "Kid" scaling_table = kid_scale_info }
]
script cas_apply_bodyshape
  Printf "Applying body shape here"
  GetCurrentSkaterProfileIndex
  if LevelIs Load_Skateshop
    EditPlayerAppearance player = 0 profile = <currentSkaterProfileIndex> target = SetChecksum targetParams = { <...> }
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
  else
    EditPlayerAppearance player = <currentSkaterProfileIndex> profile = <currentSkaterProfileIndex> target = SetPart targetParams = { <...> }
    RefreshSkaterModel skater = <currentSkaterProfileIndex> profile = <currentSkaterProfileIndex>
  endif
endscript
script launch_sex_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_sex_menu callback_params = { <...> }
endscript
script create_sex_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu menu_id = cas_submenu vmenu_id = cas_subvmenu menu_title = "SEX" type = vscrollingmenu dims = (320, 200)
  SetScreenElementProps {
    id = cas_submenu
    event_handlers = [ { pad_back create_cas_menu } ]
    replace_handlers
  }
  add_sexes_to_menu
  set_sub_bg type = spriteelement
  create_icon texture = PA_model
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script add_sexes_to_menu
  make_text_sub_menu_item {
    text = "Male"
    pad_choose_script = cas_apply_sex
    pad_choose_params = { apply_male = 1 }
  }
  make_text_sub_menu_item {
    text = "Female"
    pad_choose_script = cas_apply_sex
    pad_choose_params = { apply_male = 0 }
  }
endscript
script cas_apply_sex apply_male = 1
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if ( <is_male> = 1 )
     <success> = 1
  else
     <success> = 0
  endif
  if ( <success> = <apply_male> )
    Printf "Same sex"
  else
    if ( <apply_male> = 1 )
      RememberTemporaryAppearance player = <currentSkaterProfileIndex> name = old_female_profile
      RestoreTemporaryAppearance player = <currentSkaterProfileIndex> name = old_male_profile
      SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1
    else
      RememberTemporaryAppearance player = <currentSkaterProfileIndex> name = old_male_profile
      RestoreTemporaryAppearance player = <currentSkaterProfileIndex> name = old_female_profile
      SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0
    endif
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
  endif
  if LevelIs Load_Skateshop
  else
    create_cas_menu
  endif
endscript
script refresh_skater_model
  GetCurrentSkaterProfileIndex
  if LevelIs Load_Skateshop
     <skaterIndex> = 0
  else
     <skaterIndex> = <currentSkaterProfileIndex>
  endif
  RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = <skaterIndex>
  RefreshSkaterScale profile = <currentSkaterProfileIndex> skater = <skaterIndex>
  RefreshSkaterVisibility profile = <currentSkaterProfileIndex> skater = <skaterIndex>
endscript
script refresh_skater_model_for_cheats
   <refresh_both_skaters> = 0
  if InSplitScreenGame
     <refresh_both_skaters> = 1
    if LevelIs Load_Skateshop
       <refresh_both_skaters> = 0
    endif
  endif
  if ( <refresh_both_skaters> = 1 )
    RefreshSkaterScale profile = 0 skater = 0
    RefreshSkaterVisibility profile = 0 skater = 0
    RefreshSkaterScale profile = 1 skater = 1
    RefreshSkaterVisibility profile = 1 skater = 1
  else
    GetCurrentSkaterProfileIndex
    if LevelIs Load_Skateshop
       <skaterIndex> = 0
    else
       <skaterIndex> = <currentSkaterProfileIndex>
    endif
    RefreshSkaterScale profile = <currentSkaterProfileIndex> skater = <skaterIndex>
    RefreshSkaterVisibility profile = <currentSkaterProfileIndex> skater = <skaterIndex>
  endif
endscript
script create_preview_models
endscript
script ss_appearance_focus
  edit_skater_menu_focus
  rebuild_preview_models <...>
endscript
temp_preview_appearance = {
}
script rebuild_preview_head
  if GetPlayerAppearancePart player = 0 part = skater_m_head
    AppendStruct struct = temp_preview_appearance field = skater_m_head params = { desc_id = <desc_id> }
  endif
  if GetPlayerAppearancePart player = 0 part = skater_m_hair
    AppendStruct struct = temp_preview_appearance field = skater_m_hair params = { desc_id = <desc_id> }
  endif
  if GetPlayerAppearancePart player = 0 part = skater_m_jaw
    AppendStruct struct = temp_preview_appearance field = skater_m_jaw params = { desc_id = <desc_id> }
  endif
  if GetPlayerAppearancePart player = 0 part = skater_f_head
    AppendStruct struct = temp_preview_appearance field = skater_f_head params = { desc_id = <desc_id> }
  endif
  if GetPlayerAppearancePart player = 0 part = skater_f_hair
    AppendStruct struct = temp_preview_appearance field = skater_f_hair params = { desc_id = <desc_id> }
  endif
  if GetPlayerAppearancePart player = 0 part = glasses
    AppendStruct struct = temp_preview_appearance field = glasses params = { desc_id = <desc_id> }
  endif
  if GetPlayerAppearancePart player = 0 part = hat
    AppendStruct struct = temp_preview_appearance field = hat params = { desc_id = <desc_id> }
  endif
  if GetPlayerAppearancePart player = 0 part = hat_logo
    AppendStruct struct = temp_preview_appearance field = hat_logo params = { desc_id = <desc_id> }
  endif
  if GetPlayerAppearancePart player = 0 part = helmet
    AppendStruct struct = temp_preview_appearance field = helmet params = { desc_id = <desc_id> }
  endif
endscript
script rebuild_preview_models
endscript
script get_desc_id_from_structure
  return returned_id = <desc_id>
endscript
script get_next_array_index curr = 0
   <curr> = ( <curr> + 1 )
  if ( <curr> > ( <total> - 1 ) )
    return next_index = 0
  else
    return next_index = <curr>
  endif
endscript
script get_prev_array_index curr = 0
   <curr> = ( <curr> - 1 )
  if ( <curr> < 0 )
    return prev_index = ( <total> - 1 )
  else
    return prev_index = <curr>
  endif
endscript
script load_pro_skater
  SelectCurrentSkater name = <name>
  if InNetGame
    GetLocalSkaterIndex
    RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = <index>
  else
    GetCurrentSkaterProfileIndex
    RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = <index>
  endif
endscript
