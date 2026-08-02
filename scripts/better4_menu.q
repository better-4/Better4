better4_menu_items = [
  { text = "1-Tap Boostplant" id = wallplant_toggle flag = WALLPLANT_INPUT_FLAG }
  { text = "Lip Tricks" id = lip_toggle flag = LIP_TRICK_FLAG set_script = better4_toggle_lip_set unset_script = better4_toggle_lip_unset }
  { text = "Modern Manuals" id = mm_toggle flag = MODERN_MANUAL_FLAG }
  { text = "Manual Floats" id = mf_toggle flag = MANUAL_FLOAT_FLAG }
  { text = "Nollie 360 Flip" id = nollie_360_toggle flag = NOLLIE_360_FLAG }
]

script better4_menu_options {
  close_script = nullscript
}
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif

  if not GetGlobalFlag flag = MOD_INI_FLAG
    SetGlobalFlag flag = MOD_INI_FLAG
    SetGlobalFlag flag = LIP_TRICK_FLAG
  endif

  pulse_blur

  make_new_menu {
    menu_id = better4_menu
    vmenu_id = better4_vmenu
    menu_title = "BETTER4 OPTIONS"
    helper_text = generic_helper_text
    pos = (223, 59)
  }

  kill_start_key_binding
  SetScreenElementProps { id = better4_vmenu event_handlers = [
      { pad_back skateshop_transition params = { new_menu_script = <close_script> } }
    ]
  }

  set_sub_bg pos = (326, 65)
  create_icon pos = (176, 65) id = better4_icon texture = PA_options

  draw_menu_box delta_pos = (92, -20) middle_repeat = 13 box_right_scale = (0.8, 1)

  make_text_sub_menu_item text = "" not_focusable
  ForEachIn better4_menu_items do = better4_menu_item params = <...>
  make_text_sub_menu_item text = "Close" scale = 0.8 id = close_option pad_choose_script = skateshop_transition pad_choose_params = { new_menu_script = <close_script> }

  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript

script better4_menu_item { // requires: <id>, <text>, <flag>
  text = ""
  scale = 0.8
  set_script = nullscript
  unset_script = nullscript
}
  Printf "making menu item %s" s = <text>
  make_toggle_menu_item id = <id> text = <text> scale = <scale> pad_choose_script = better4_toggle_item pad_choose_params = <...>

  SetScreenElementProps { id = <id> event_handlers = [
      { pad_left better4_toggle_item params = <...> }
      { pad_right better4_toggle_item params = <...> }
    ]
  }
  RunScriptOnScreenElement id = <id> better4_check_item params = <...>
endscript

script better4_toggle_item // requires: <id>, <flag>
  if GetGlobalFlag flag = <flag>
    UnSetGlobalFlag flag = <flag>
    toggle_menu_item_off id = <id>
  else
    SetGlobalFlag flag = <flag>
    toggle_menu_item_on id = <id>
  endif
endscript

script better4_check_item { // requires: <id>, <flag>
  set_script = nullscript
  unset_script = nullscript
}
  if GetGlobalFlag flag = <flag>
    toggle_menu_item_on id = <id>
    if GotParam set_script
      <set_script>
    endif
  else
    toggle_menu_item_off id = <id>
    if GotParam unset_script
      <unset_script>
    endif
  endif
endscript

script better4_toggle_lip_set
  Change LipAllowAngle = 15
  Change LipAllowAngle_Override = 60
endscript

script better4_toggle_lip_unset
  Change LipAllowAngle = 360
  Change LipAllowAngle_Override = 360
endscript

script better4_main_menu_watermark
  FormatText TextName = better4_watermark "Better4 %s" s = better4_version
  CreateScreenElement {
    parent = current_menu_anchor
    type = TextElement
    text = <better4_watermark>
    font = newtrickfont
    pos = (320, 380)
    rgba = better4_orange
    scale = 0.5
    just = [ center center ]
    z_priority = 9999
    not_focusable
  }
endscript
