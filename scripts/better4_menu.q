script create_mod_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  if not GetGlobalFlag flag = MOD_INI_FLAG
    SetGlobalFlag flag = MOD_INI_FLAG
    SetGlobalFlag flag = LIP_TRICK_FLAG
  endif
  make_new_menu {
    menu_id = mod_menu
    vmenu_id = vmod_menu
    menu_title = "MOD OPTIONS"
  }
  create_helper_text generic_helper_text
  kill_start_key_binding
  pad_back_script = create_options_menu
  SetScreenElementProps { id = mod_menu
    event_handlers = [
      { pad_back <pad_back_script> }
    ]
  }
  set_sub_bg
  make_toggle_menu_item id = wallplant_toggle text = "1 Tap Wallplant   " menu_done scale = 0.8 pad_choose_script = toggle_wallplant_input
  RunScriptOnScreenElement id = wallplant_toggle check_wallplant_input_flag
  make_toggle_menu_item id = lip_toggle text = "Lip Tricks              " menu_done scale = 0.8 pad_choose_script = toggle_lip_trick
  RunScriptOnScreenElement id = lip_toggle check_lip_trick_flag
  make_toggle_menu_item id = mm_toggle text = "Modern Manuals           " menu_done scale = 0.8 pad_choose_script = toggle_modern_manual
  RunScriptOnScreenElement id = mm_toggle check_modern_manual_flag
  make_toggle_menu_item id = mf_toggle text = "Restore MFs              " menu_done scale = 0.8 pad_choose_script = toggle_manual_float
  RunScriptOnScreenElement id = mf_toggle check_manual_float_flag
  make_toggle_menu_item id = nollie_360_toggle text = "Nollie 360 Flip        " menu_done scale = 0.8 pad_choose_script = toggle_nollie_360
  RunScriptOnScreenElement id = mf_toggle check_nollie_360_flag
  make_toggle_menu_item id = flip_variation_toggle text = "Flip Variations        " menu_done scale = 0.8 pad_choose_script = toggle_flip_variation
  RunScriptOnScreenElement id = mf_toggle check_flip_variation_flag
  make_text_sub_menu_item text = "Close" id = close_option pad_choose_script = create_options_menu
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script quit_observing
  if not GoalManager_HasActiveGoals
    DebugRenderIgnore
    if IsHost
      exit_pause_menu
      Wait 60 gameframe
      debugrendermode
      LoadPendingPlayers
      Wait 120 gameframe
      debugrendermode
    endif
  endif
endscript
script host_process_remote_exit_observer
  Wait 60 gameframe
  debugrendermode
  LoadPendingPlayers
  Wait 120 gameframe
  debugrendermode
endscript
script destroy_mod_menu
  ClearEventBuffer
  SetQueueTricks Ground
  restore_start_key_binding
  DestroyScreenElement id = current_menu_anchor
  UnPauseGame
endscript
script check_wallplant_input_flag
  if GetGlobalFlag flag = WALLPLANT_INPUT_FLAG
    toggle_menu_item_on id = wallplant_toggle
  else
    toggle_menu_item_off id = wallplant_toggle
  endif
endscript
script check_nollie_360_flag
  if GetGlobalFlag flag = NOLLIE_360_FLAG
    toggle_menu_item_on id = nollie_360_toggle
  else
    toggle_menu_item_off id = nollie_360_toggle
  endif
endscript
script toggle_nollie_360
  if GetGlobalFlag flag = NOLLIE_360_FLAG
    UnSetGlobalFlag flag = NOLLIE_360_FLAG
    toggle_menu_item_off id = nollie_360_toggle
  else
    SetGlobalFlag flag = NOLLIE_360_FLAG
    toggle_menu_item_on id = nollie_360_toggle
  endif
endscript
script check_flip_variation_flag
  if GetGlobalFlag flag = FLIP_VARIATION_FLAG
    toggle_menu_item_on id = flip_variation_toggle
  else
    toggle_menu_item_on id = flip_variation_toggle
  endif
endscript
script toggle_flip_variation
endscript
script check_lip_trick_flag
  if GetGlobalFlag flag = LIP_TRICK_FLAG
    toggle_menu_item_on id = lip_toggle
    Change LipAllowAngle = 15
    Change LipAllowAngle_Override = 60
  else
    toggle_menu_item_off id = lip_toggle
    Change LipAllowAngle = 360
    Change LipAllowAngle_Override = 360
  endif
endscript
script check_lip_trick_flag_hack
  if not GetGlobalFlag flag = MOD_INI_FLAG
    SetGlobalFlag flag = LIP_TRICK_FLAG
  endif
  if GetGlobalFlag flag = LIP_TRICK_FLAG
    Change LipAllowAngle = 15
    Change LipAllowAngle_Override = 60
  else
    Change LipAllowAngle = 360
    Change LipAllowAngle_Override = 360
  endif
endscript
script check_modern_manual_flag
  if GetGlobalFlag flag = MODERN_MANUAL_FLAG
    toggle_menu_item_on id = mm_toggle
  else
    toggle_menu_item_off id = mm_toggle
  endif
endscript
script check_manual_float_flag
  if GetGlobalFlag flag = MANUAL_FLOAT_FLAG
    toggle_menu_item_on id = mf_toggle
  else
    toggle_menu_item_off id = mf_toggle
  endif
endscript
script toggle_wallplant_input
  if GetGlobalFlag flag = WALLPLANT_INPUT_FLAG
    UnSetGlobalFlag flag = WALLPLANT_INPUT_FLAG
    toggle_menu_item_off id = wallplant_toggle
  else
    SetGlobalFlag flag = WALLPLANT_INPUT_FLAG
    toggle_menu_item_on id = wallplant_toggle
  endif
endscript
script toggle_lip_trick
  if GetGlobalFlag flag = LIP_TRICK_FLAG
    UnSetGlobalFlag flag = LIP_TRICK_FLAG
    Change LipAllowAngle = 360
    Change LipAllowAngle_Override = 360
    toggle_menu_item_off id = lip_toggle
  else
    SetGlobalFlag flag = LIP_TRICK_FLAG
    Change LipAllowAngle = 15
    Change LipAllowAngle_Override = 60
    toggle_menu_item_on id = lip_toggle
  endif
endscript
script toggle_modern_manual
  if GetGlobalFlag flag = MODERN_MANUAL_FLAG
    UnSetGlobalFlag flag = MODERN_MANUAL_FLAG
    toggle_menu_item_off id = mm_toggle
  else
    SetGlobalFlag flag = MODERN_MANUAL_FLAG
    toggle_menu_item_on id = mm_toggle
  endif
endscript
script toggle_manual_float
  if GetGlobalFlag flag = MANUAL_FLOAT_FLAG
    UnSetGlobalFlag flag = MANUAL_FLOAT_FLAG
    toggle_menu_item_off id = mf_toggle
  else
    SetGlobalFlag flag = MANUAL_FLOAT_FLAG
    toggle_menu_item_on id = mf_toggle
  endif
endscript
