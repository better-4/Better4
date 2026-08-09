script better4_menu_options {
    close_script = nullscript
  }
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
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
      { pad_back skateshop_transition Params = { new_menu_script = <close_script> } }
    ]
  }
  set_sub_bg pos = (326, 65)
  create_icon pos = (176, 65) id = better4_icon texture = PA_options
  draw_menu_box delta_pos = (92, -20) middle_repeat = 13 box_right_scale = (0.8, 1)
  make_text_sub_menu_item text = "" not_focusable
  make_text_sub_menu_item text = "In Air" scale = 0.85 id = inair_option pad_choose_script = better4_inair_menu pad_choose_params = { close_script = <close_script> }
  make_text_sub_menu_item text = "On Ground" scale = 0.85 id = onground_option pad_choose_script = better4_onground_menu pad_choose_params = { close_script = <close_script> }
  make_text_sub_menu_item text = "On Rail" scale = 0.85 id = onrail_option pad_choose_script = better4_onrail_menu pad_choose_params = { close_script = <close_script> }
  make_text_sub_menu_item text = "Wallrides" scale = 0.85 id = wallride_option pad_choose_script = better4_wallride_menu pad_choose_params = { close_script = <close_script> }
  make_text_sub_menu_item text = "Misc" scale = 0.85 id = misc_option pad_choose_script = better4_misc_menu pad_choose_params = { close_script = <close_script> }
  make_text_sub_menu_item text = "Close" scale = 0.85 id = close_option pad_choose_script = skateshop_transition pad_choose_params = { new_menu_script = <close_script> }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script better4_onground_menu {
    close_script = nullscript
  }
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  pulse_blur
  make_new_menu {
    menu_id = better4_onground_menu_id
    vmenu_id = better4_onground_vmenu
    menu_title = "ON GROUND"
    helper_text = generic_helper_text_better4
    pos = (223, 59)
  }
  SetScreenElementProps { id = better4_onground_vmenu event_handlers = [
      { pad_back better4_onground_back Params = { close_script = <close_script> } }
    ]
  }
  set_sub_bg pos = (326, 65)
  create_icon pos = (176, 65) id = better4_icon texture = PA_options
  draw_menu_box delta_pos = (92, -20) middle_repeat = 13 box_right_scale = (0.8, 1)
  make_text_sub_menu_item text = "" not_focusable
  better4_control_menu_item better4_control_revert
  better4_control_menu_item better4_control_powerslide
  better4_control_menu_item better4_control_stancechange
  better4_control_menu_item better4_control_jumptrick
  better4_control_menu_item better4_control_manualspin
  better4_control_menu_item better4_control_manualfloat
  better4_control_menu_item better4_control_doublerevert
  make_text_sub_menu_item text = "Back" scale = 0.85 id = onground_back_option pad_choose_script = better4_onground_back pad_choose_params = { close_script = <close_script> }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script better4_onground_back {
    close_script = nullscript
  }
  DestroyScreenElement id = current_menu_anchor
  better4_menu_options close_script = <close_script>
endscript
script better4_inair_menu {
    close_script = nullscript
  }
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  pulse_blur
  make_new_menu {
    menu_id = better4_inair_menu_id
    vmenu_id = better4_inair_vmenu
    menu_title = "IN AIR"
    helper_text = generic_helper_text_better4
    pos = (223, 59)
  }
  SetScreenElementProps { id = better4_inair_vmenu event_handlers = [
      { pad_back better4_inair_back Params = { close_script = <close_script> } }
    ]
  }
  set_sub_bg pos = (326, 65)
  create_icon pos = (176, 65) id = better4_icon texture = PA_options
  draw_menu_box delta_pos = (92, -20) middle_repeat = 13 box_right_scale = (0.8, 1)
  make_text_sub_menu_item text = "" not_focusable
  better4_control_menu_item better4_control_spinkeys
  better4_control_menu_item better4_control_spinetransfer
  make_text_sub_menu_item text = "Back" scale = 0.85 id = inair_back_option pad_choose_script = better4_inair_back pad_choose_params = { close_script = <close_script> }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script better4_inair_back {
    close_script = nullscript
  }
  DestroyScreenElement id = current_menu_anchor
  better4_menu_options close_script = <close_script>
endscript
script better4_onrail_menu {
    close_script = nullscript
  }
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  pulse_blur
  make_new_menu {
    menu_id = better4_onrail_menu_id
    vmenu_id = better4_onrail_vmenu
    menu_title = "ON RAIL"
    helper_text = generic_helper_text_better4
    pos = (223, 59)
  }
  SetScreenElementProps { id = better4_onrail_vmenu event_handlers = [
      { pad_back better4_onrail_back Params = { close_script = <close_script> } }
    ]
  }
  set_sub_bg pos = (326, 65)
  create_icon pos = (176, 65) id = better4_icon texture = PA_options
  draw_menu_box delta_pos = (92, -20) middle_repeat = 13 box_right_scale = (0.8, 1)
  make_text_sub_menu_item text = "" not_focusable
  better4_control_menu_item better4_control_dropdown
  better4_control_menu_item better4_control_liptricks
  better4_control_menu_item better4_control_railspin
  make_text_sub_menu_item text = "Back" scale = 0.85 id = onrail_back_option pad_choose_script = better4_onrail_back pad_choose_params = { close_script = <close_script> }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script better4_onrail_back {
    close_script = nullscript
  }
  DestroyScreenElement id = current_menu_anchor
  better4_menu_options close_script = <close_script>
endscript
script better4_wallride_menu {
    close_script = nullscript
  }
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  pulse_blur
  make_new_menu {
    menu_id = better4_wallride_menu_id
    vmenu_id = better4_wallride_vmenu
    menu_title = "WALLRIDES"
    helper_text = generic_helper_text_better4
    pos = (223, 59)
  }
  SetScreenElementProps { id = better4_wallride_vmenu event_handlers = [
      { pad_back better4_wallride_back Params = { close_script = <close_script> } }
    ]
  }
  set_sub_bg pos = (326, 65)
  create_icon pos = (176, 65) id = better4_icon texture = PA_options
  draw_menu_box delta_pos = (92, -20) middle_repeat = 13 box_right_scale = (0.8, 1)
  make_text_sub_menu_item text = "" not_focusable
  better4_control_menu_item better4_control_wallieplant
  better4_control_menu_item better4_control_wallspin
  better4_control_menu_item better4_control_wallridebail
  make_text_sub_menu_item text = "Back" scale = 0.85 id = wallride_back_option pad_choose_script = better4_wallride_back pad_choose_params = { close_script = <close_script> }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script better4_wallride_back {
    close_script = nullscript
  }
  DestroyScreenElement id = current_menu_anchor
  better4_menu_options close_script = <close_script>
endscript
script better4_misc_menu {
    close_script = nullscript
  }
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  pulse_blur
  make_new_menu {
    menu_id = better4_misc_menu_id
    vmenu_id = better4_misc_vmenu
    menu_title = "MISC"
    helper_text = generic_helper_text_better4
    pos = (223, 59)
  }
  SetScreenElementProps { id = better4_misc_vmenu event_handlers = [
      { pad_back better4_misc_back Params = { close_script = <close_script> } }
    ]
  }
  set_sub_bg pos = (326, 65)
  create_icon pos = (176, 65) id = better4_icon texture = PA_options
  draw_menu_box delta_pos = (92, -20) middle_repeat = 13 box_right_scale = (0.8, 1)
  make_text_sub_menu_item text = "" not_focusable
  better4_control_menu_item better4_misc_boardscuff
  make_text_sub_menu_item text = "Back" scale = 0.85 id = misc_back_option pad_choose_script = better4_misc_back pad_choose_params = { close_script = <close_script> }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script better4_misc_back {
    close_script = nullscript
  }
  DestroyScreenElement id = current_menu_anchor
  better4_menu_options close_script = <close_script>
endscript
script better4_main_menu_watermark
  better4_controls_init
  FormatText TextName = better4_watermark "Better4 %s" s = better4_version
  CreateScreenElement {
    parent = current_menu_anchor
    Type = TextElement
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
