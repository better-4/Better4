
toggle_comp_geo_params = {
  flag = FLAG_G_COMP_GEO_ON
  geo_prefix = "G_COMP_"
  trg_prefix = "TRG_G_COMP_"
  geo_not_prefix = "G_COMPNOT_"
  trg_not_prefix = "TRG_G_COMPNOT_"
  text_on = "Competition Geo: ON"
  text_off = "Competition Geo: OFF"
  text_locked = "Competition Geo: LOCKED"
  id = toggle_comp_geo
  node = trg_G_COMP_restartnode
  camera = G_COMP_viewcam }
toggle_proset1_params = {
  bit = 0
  param_id = toggle_proset1_params
  flag = FLAG_PROSET1_GEO_ON
  geo_prefix = "Proset1_"
  trg_prefix = "TRG_Proset1_"
  geo_not_prefix = "PROSET1NOT_"
  trg_not_prefix = "TRG_PROSET1NOT_"
  text_on = "ProSet1: ON"
  text_off = "ProSet1: OFF"
  text_locked = "ProSet1: LOCKED"
  id = toggle_proset1
  node = trg_Proset1_restartnode
  camera = PROSET1_viewcam }
toggle_proset2_params = {
  bit = 1
  param_id = toggle_proset2_params
  flag = FLAG_PROSET2_GEO_ON
  geo_prefix = "Proset2_"
  trg_prefix = "TRG_Proset2_"
  geo_not_prefix = "PROSET2NOT_"
  trg_not_prefix = "TRG_PROSET2NOT_"
  text_on = "ProSet2: ON"
  text_off = "ProSet2: OFF"
  text_locked = "ProSet2: LOCKED"
  id = toggle_proset2
  node = trg_Proset2_restartnode
  camera = PROSET2_viewcam }
toggle_proset3_params = {
  bit = 2
  param_id = toggle_proset3_params
  flag = FLAG_PROSET3_GEO_ON
  geo_prefix = "Proset3_"
  trg_prefix = "TRG_Proset3_"
  geo_not_prefix = "PROSET3NOT_"
  trg_not_prefix = "TRG_PROSET3NOT_"
  text_on = "ProSet3: ON"
  text_off = "ProSet3: OFF"
  text_locked = "ProSet3: LOCKED"
  id = toggle_proset3
  node = trg_Proset3_restartnode
  camera = PROSET3_viewcam }
toggle_proset4_params = {
  bit = 3
  param_id = toggle_proset4_params
  flag = FLAG_PROSET4_GEO_ON
  geo_prefix = "Proset4_"
  trg_prefix = "TRG_Proset4_"
  geo_not_prefix = "PROSET4NOT_"
  trg_not_prefix = "TRG_PROSET4NOT_"
  text_on = "ProSet4: ON"
  text_off = "ProSet4: OFF"
  text_locked = "ProSet4: LOCKED"
  id = toggle_proset4
  node = trg_Proset4_restartnode
  camera = PROSET4_viewcam }
toggle_proset5_params = {
  bit = 4
  param_id = toggle_proset5_params
  flag = FLAG_PROSET5_GEO_ON
  geo_prefix = "Proset5_"
  trg_prefix = "TRG_Proset5_"
  geo_not_prefix = "PROSET5NOT_"
  trg_not_prefix = "TRG_PROSET5NOT_"
  text_on = "ProSet5: ON"
  text_off = "ProSet5: OFF"
  text_locked = "ProSet5: LOCKED"
  id = toggle_proset5
  node = trg_Proset5_restartnode
  camera = PROSET5_viewcam }
toggle_proset6_params = {
  bit = 5
  param_id = toggle_proset6_params
  flag = FLAG_PROSET6_GEO_ON
  geo_prefix = "Proset6_"
  trg_prefix = "TRG_Proset6_"
  geo_not_prefix = "PROSET6NOT_"
  trg_not_prefix = "TRG_PROSET6NOT_"
  text_on = "ProSet6: ON"
  text_off = "ProSet6: OFF"
  text_locked = "ProSet6: LOCKED"
  id = toggle_proset6
  node = trg_Proset6_restartnode
  camera = PROSET6_viewcam }
toggle_proset7_params = {
  bit = 6
  param_id = toggle_proset7_params
  flag = FLAG_PROSET7_GEO_ON
  geo_prefix = "Proset7_"
  trg_prefix = "TRG_Proset7_"
  geo_not_prefix = "PROSET7NOT_"
  trg_not_prefix = "TRG_PROSET7NOT_"
  text_on = "ProSet7: ON"
  text_off = "ProSet7: OFF"
  text_locked = "ProSet7: LOCKED"
  id = toggle_proset7
  node = trg_Proset7_restartnode
  camera = PROSET7_viewcam }
script create_pro_trick_objects_menu
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_pro_trick_objects_menu2
endscript
script create_pro_trick_objects_menu2
  make_new_menu menu_id = pro_trick_objects_menu vmenu_id = pro_trick_objects_vmenu menu_title = "PRO TRICKS" helper_text = generic_helper_text
  SetScreenElementProps { id = pro_trick_objects_menu
    event_handlers = [
      { pad_back generic_menu_pad_back params = { callback = exit_pro_trick_menu } }
    ]
  }
  kill_start_key_binding
  
  make_text_sub_menu_item text = "Competition Geo: OFF" id = toggle_comp_geo pad_choose_script = toggle_geo pad_choose_params = toggle_comp_geo_params focus_script = preview_geo focus_params = toggle_comp_geo_params pad_circle_script = goto_geo pad_circle_params = toggle_comp_geo_params
  check_geo toggle_comp_geo_params

  make_text_sub_menu_item {
    text = "ProSet1: OFF"
    id = toggle_proset1
    pad_choose_script = toggle_geo
    pad_choose_params = toggle_proset1_params
    focus_script = preview_geo
    focus_params = toggle_proset1_params
    pad_circle_script = goto_geo
    pad_circle_params = toggle_proset1_params
  }
  make_text_sub_menu_item {
    text = "ProSet2: OFF"
    id = toggle_proset2
    pad_choose_script = toggle_geo
    pad_choose_params = toggle_proset2_params
    focus_script = preview_geo
    focus_params = toggle_proset2_params
    pad_circle_script = goto_geo
    pad_circle_params = toggle_proset2_params
  }
  make_text_sub_menu_item {
    text = "ProSet3: OFF"
    id = toggle_proset3
    pad_choose_script = toggle_geo
    pad_choose_params = toggle_proset3_params
    focus_script = preview_geo
    focus_params = toggle_proset3_params
    pad_circle_script = goto_geo
    pad_circle_params = toggle_proset3_params
  }
  make_text_sub_menu_item {
    text = "ProSet4: OFF"
    id = toggle_proset4
    pad_choose_script = toggle_geo
    pad_choose_params = toggle_proset4_params
    focus_script = preview_geo
    focus_params = toggle_proset4_params
    pad_circle_script = goto_geo
    pad_circle_params = toggle_proset4_params
  }
  make_text_sub_menu_item {
    text = "ProSet5: OFF"
    id = toggle_proset5
    pad_choose_script = toggle_geo
    pad_choose_params = toggle_proset5_params
    focus_script = preview_geo
    focus_params = toggle_proset5_params
    pad_circle_script = goto_geo
    pad_circle_params = toggle_proset5_params
  }
  make_text_sub_menu_item {
    text = "ProSet6: OFF"
    id = toggle_proset6
    pad_choose_script = toggle_geo
    pad_choose_params = toggle_proset6_params
    focus_script = preview_geo
    focus_params = toggle_proset6_params
    pad_circle_script = goto_geo
    pad_circle_params = toggle_proset6_params
  }
  make_text_sub_menu_item {
    text = "ProSet7: OFF"
    id = toggle_proset7
    pad_choose_script = toggle_geo
    pad_choose_params = toggle_proset7_params
    focus_script = preview_geo
    focus_params = toggle_proset7_params
    pad_circle_script = goto_geo
    pad_circle_params = toggle_proset7_params
  }
  make_text_sub_menu_item {
    text = "Done"
    id = menu_done
    pad_choose_script = exit_pro_trick_menu
  }
  if IsTrue Bootstrap_Build
    SetScreenElementProps text = "ProSet1: NOT IN DEMO" id = toggle_proset1 not_focusable rgba = [ 65 65 65 128 ]
    SetScreenElementProps text = "ProSet2: NOT IN DEMO" id = toggle_proset2 not_focusable rgba = [ 65 65 65 128 ]
    SetScreenElementProps text = "ProSet3: NOT IN DEMO" id = toggle_proset3 not_focusable rgba = [ 65 65 65 128 ]
    SetScreenElementProps text = "ProSet5: NOT IN DEMO" id = toggle_proset5 not_focusable rgba = [ 65 65 65 128 ]
    SetScreenElementProps text = "ProSet7: NOT IN DEMO" id = toggle_proset7 not_focusable rgba = [ 65 65 65 128 ]
    check_geo toggle_proset4_params
    check_geo toggle_proset6_params
  else
    check_geo toggle_proset1_params
    check_geo toggle_proset2_params
    check_geo toggle_proset3_params
    check_geo toggle_proset4_params
    check_geo toggle_proset5_params
    check_geo toggle_proset6_params
    check_geo toggle_proset7_params
  endif
  set_sub_bg type = spriteelement
  create_icon texture = PA_PRO
  RunScriptOnScreenElement id = pro_trick_objects_menu menu_onscreen
endscript
script exit_pro_trick_menu
  kill_proset_cams
  if InNetGame
    if ObjectExists id = current_menu_anchor
      DestroyScreenElement id = current_menu_anchor
    endif
    create_network_host_options_menu
  else
    create_options_menu
  endif
endscript
script goto_geo
  if NodeExists <node>
    ResetSkaters node_name = <node>
  endif
  kill_proset_cams
  exit_pause_menu
endscript
script preview_geo
  do_scale_up
  kill_proset_cams
  PlaySkaterCamAnim skater = 0 name = <camera> skippable = 1 play_hold
  SetSkaterCamAnimShouldPause name = <camera> 0
endscript
script Pro_Pause_Game
  PauseGame
endscript
script check_geo
  if IsTrue ALL_LEVELS_UNLOCKED
    create_proset_item <...>
  endif
  if NodeExists <node>
  else
    if ScreenElementExists id = <id>
      DestroyScreenElement id = <id>
    endif
  endif
endscript
script create_proset_item
  if GetFlag flag = <flag>
    SetScreenElementProps text = <text_on> id = <id>
  else
    SetScreenElementProps text = <text_off> id = <id>
  endif
endscript
script toggle_geo
  if InNetGame
    if not OnServer
      FCFSRequestToggleProSet bit = <bit> param_id = <param_id>
      return
    endif
  endif
  pulse_blur start = 200 speed = 2
  if GetFlag flag = <flag>
    UnSetFlag flag = <flag>
    SetScreenElementProps text = <text_off> id = <id>
    if InNetGame
      if OnServer
        ToggleProSet bit = <bit> param_id = <param_id>
      endif
    endif
    Kill prefix = <geo_prefix>
    Kill prefix = <trg_prefix>
    Create prefix = <geo_not_prefix>
    Create prefix = <trg_not_prefix>
    KillAllTextureSplats
  else
    Create prefix = <geo_prefix>
    Create prefix = <trg_prefix>
    Kill prefix = <geo_not_prefix>
    Kill prefix = <trg_not_prefix>
    SetFlag flag = <flag>
    SetScreenElementProps text = <text_on> id = <id>
    if InNetGame
      if OnServer
        ToggleProSet bit = <bit> param_id = <param_id>
      endif
    else
      if NodeExists <node>
        ResetSkaters node_name = <node>
      endif
    endif
  endif
  pulse_item
endscript
script toggle_geo_nomenu
  Kill prefix = <geo_prefix>
  Kill prefix = <trg_prefix>
  Kill prefix = <geo_not_prefix>
  Kill prefix = <trg_not_prefix>
  Create prefix = <geo_not_prefix>
  Create prefix = <trg_not_prefix>
  if GetFlag flag = <flag>
    Printf "turning it on"
    Create prefix = <geo_prefix>
    Create prefix = <trg_prefix>
    Kill prefix = <geo_not_prefix>
    Kill prefix = <trg_not_prefix>
  endif
endscript
script toggle_proset_flag
  if GetFlag flag = <flag>
    UnSetFlag flag = <flag>
    if ObjectExists id = <id>
      SetScreenElementProps text = <text_off> id = <id>
    endif
  else
    SetFlag flag = <flag>
    if ObjectExists id = <id>
      SetScreenElementProps text = <text_on> id = <id>
    endif
  endif
endscript
script kill_proset_cams
  KillSkaterCamAnim name = G_COMP_viewcam
  KillSkaterCamAnim name = PROSET1_viewcam
  KillSkaterCamAnim name = PROSET2_viewcam
  KillSkaterCamAnim name = PROSET3_viewcam
  KillSkaterCamAnim name = PROSET4_viewcam
  KillSkaterCamAnim name = PROSET5_viewcam
  KillSkaterCamAnim name = PROSET6_viewcam
  KillSkaterCamAnim name = PROSET7_viewcam
endscript
