previous = -1
next = 1
off = 0
on = 1
better4_onground_items = [
  { text = "Modern Manuals" id = mm_toggle key = "ModernManuals" fallback = off}
  { text = "Manual Floats" id = mf_toggle key = "ManualFloats" fallback = off}
  { text = "Double Revert" id = double_revert_toggle key = "DoubleRevert" fallback = on}
]
better4_onrail_items = [
  { text = "Lip Tricks" id = lip_toggle key = "LipTricks" fallback = on set_script = better4_lip_on unset_script = better4_lip_off}
  { text = "Rail Spin" id = rail_spin_toggle key = "RailSpin" fallback = on}
]
better4_wallride_items = [
  { text = "1-Tap Boostplant" id = wallplant_toggle key = "1TapBoostplant" fallback = off}
  { text = "Wall Spin" id = wall_spin_toggle key = "WallSpin" fallback = on}
]
dropdown_menu_text =
[
  { text = "Dropdown R2/L2" }
  { text = "Dropdown R2" }
  { text = "Dropdown L2" }
  { text = "Dropdown R2+L2" }
  { text = "Dropdown R1/L1" }
  { text = "Dropdown R1" }
  { text = "Dropdown L1" }
  { text = "Dropdown R1+L1" }
]
revert_menu_text =
[
  { text = "Revert R2/L2" }
  { text = "Revert R2" }
  { text = "Revert L2" }
  { text = "Revert R2+L2" }
  { text = "Revert R1/L1" }
  { text = "Revert R1" }
  { text = "Revert L1" }
  { text = "Revert R1+L1" }
]
powerslide_menu_text =
[
  { text = "Powerslide D+R1+L1" }
  { text = "Powerslide D+R2+L2" }
  { text = "Powerslide D+R2" }
  { text = "Powerslide D+R1" }
  { text = "Powerslide R2" }
  { text = "Powerslide L2" }
  { text = "Powerslide R1" }
  { text = "Powerslide L1" }
]
jumptricks_menu_text =
[
  { text = "Jumptrick Boneless" }
  { text = "Jumptrick Beanplant" }
  { text = "Jumptrick Fastplant" }
  { text = "Jumptrick MikeV" }
]
nollie_menu_text =
[
  { text = "Nollie Stance L2" }
  { text = "Nollie Stance Off" }
]
spine_menu_text =
[
  { text = "Spine Transfer R2/L2" }
  { text = "Spine Transfer R2" }
  { text = "Spine Transfer L2" }
  { text = "Spine Transfer R2+L2" }
  { text = "Spine Transfer R1/L1" }
  { text = "Spine Transfer R1" }
  { text = "Spine Transfer L1" }
  { text = "Spine Transfer R1+L1" }
]
spin_menu_text =
[
  { text = "Spin Keys L1/R1" }
  { text = "Spin Keys L2/R2" }
  { text = "Spin Keys R1/R2" }
  { text = "Spin Keys L1/L2" }
]

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
      { pad_back skateshop_transition params = { new_menu_script = <close_script> } }
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
  make_text_sub_menu_item text = "Close" scale = 0.85 id = close_option pad_choose_script = skateshop_transition pad_choose_params = { new_menu_script = <close_script> }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script better4_menu_item {
    text = ""
    scale = 0.85
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
script view_dropdown_binds
  get_key key = "DropdownKey" max = 7
  <combo_text> = ( ( dropdown_menu_text [ <key_value> ] ).text )
  make_text_sub_menu_item text = <combo_text> scale = 0.85 id = dropdown_button pad_choose_script = NULL
  SetScreenElementProps { id = dropdown_button event_handlers = [
      { pad_left cycle_dropdown_binds params = { mode = previous } }
      { pad_right cycle_dropdown_binds params = { mode = next } }
    ]
  }
endscript
script cycle_dropdown_binds
  get_key_cycle key = "DropdownKey" max = 7 mode = <mode>
  SetIniInteger section = "In Game Controls" key = "DropdownKey" value = <key_value>
  <combo_text> = ( ( dropdown_menu_text [ <key_value> ] ).text )
  SetScreenElementProps id = dropdown_button text = <combo_text>
endscript
script view_spine_binds
  get_key key = "SpineKey" max = 7
  <combo_text> = ( ( spine_menu_text [ <key_value> ] ).text )
  make_text_sub_menu_item text = <combo_text> scale = 0.85 id = spine_button pad_choose_script = NULL
  SetScreenElementProps { id = spine_button event_handlers = [
      { pad_left cycle_spine_binds params = { mode = previous } }
      { pad_right cycle_spine_binds params = { mode = next } }
    ]
  }
endscript
script cycle_spine_binds
  get_key_cycle key = "SpineKey" max = 7 mode = <mode>
  SetIniInteger section = "In Game Controls" key = "SpineKey" value = <key_value>
  <combo_text> = ( ( spine_menu_text [ <key_value> ] ).text )
  SetScreenElementProps id = spine_button text = <combo_text>
endscript
script view_spin_binds
  get_key key = "SpinKey" max = 3
  <combo_text> = ( ( spin_menu_text [ <key_value> ] ).text )
  make_text_sub_menu_item text = <combo_text> scale = 0.85 id = spin_button pad_choose_script = NULL
  SetScreenElementProps { id = spin_button event_handlers = [
      { pad_left cycle_spin_binds params = { mode = previous } }
      { pad_right cycle_spin_binds params = { mode = next } }
    ]
  }
endscript
script cycle_spin_binds
  get_key_cycle key = "SpinKey" max = 3 mode = <mode>
  SetIniInteger section = "In Game Controls" key = "SpinKey" value = <key_value>
  <combo_text> = ( ( spin_menu_text [ <key_value> ] ).text )
  SetScreenElementProps id = spin_button text = <combo_text>
endscript
script view_revert_binds
  get_key key = "RevertKey" max = 7
  <combo_text> = ( ( revert_menu_text [ <key_value> ] ).text )
  make_text_sub_menu_item text = <combo_text> scale = 0.85 id = revert_button pad_choose_script = NULL
  SetScreenElementProps { id = revert_button event_handlers = [
      { pad_left cycle_revert_binds params = { mode = previous } }
      { pad_right cycle_revert_binds params = { mode = next } }
    ]
  }
endscript
script cycle_revert_binds
  get_key_cycle key = "RevertKey" max = 7 mode = <mode>
  SetIniInteger section = "In Game Controls" key = "RevertKey" value = <key_value>
  <combo_text> = ( ( revert_menu_text [ <key_value> ] ).text )
  SetScreenElementProps id = revert_button text = <combo_text>
endscript
script view_powerslide_binds
  get_key key = "PowerSlideKey" max = 7
  <combo_text> = ( ( powerslide_menu_text [ <key_value> ] ).text )
  make_text_sub_menu_item text = <combo_text> scale = 0.85 id = powerslide_button pad_choose_script = NULL
  SetScreenElementProps { id = powerslide_button event_handlers = [
      { pad_left cycle_powerslide_binds params = { mode = previous } }
      { pad_right cycle_powerslide_binds params = { mode = next } }
    ]
  }
endscript
script cycle_powerslide_binds
  get_key_cycle key = "PowerSlideKey" max = 7 mode = <mode>
  SetIniInteger section = "In Game Controls" key = "PowerSlideKey" value = <key_value>
  <combo_text> = ( ( powerslide_menu_text [ <key_value> ] ).text )
  SetScreenElementProps id = powerslide_button text = <combo_text>
endscript
script view_jumptrick
  get_key key = "Jumptrick" max = 3
  <combo_text> = ( ( jumptricks_menu_text [ <key_value> ] ).text )
  make_text_sub_menu_item text = <combo_text> scale = 0.85 id = jumptrick_button pad_choose_script = NULL
  SetScreenElementProps { id = jumptrick_button event_handlers = [
      { pad_left cycle_jumptrick params = { mode = previous } }
      { pad_right cycle_jumptrick params = { mode = next } }
    ]
  }
endscript
script cycle_jumptrick
  get_key_cycle key = "Jumptrick" max = 3 mode = <mode>
  SetIniInteger section = "In Game Controls" key = "Jumptrick" value = <key_value>
  <combo_text> = ( ( jumptricks_menu_text [ <key_value> ] ).text )
  SetScreenElementProps id = jumptrick_button text = <combo_text>
endscript
script view_nollie_binds
  get_key key = "NollieKey" max = 1
  <combo_text> = ( ( nollie_menu_text [ <key_value> ] ).text )
  make_text_sub_menu_item text = <combo_text> scale = 0.85 id = nollie_button pad_choose_script = NULL
  SetScreenElementProps { id = nollie_button event_handlers = [
      { pad_left cycle_nollie_binds params = { mode = previous } }
      { pad_right cycle_nollie_binds params = { mode = next } }
    ]
  }
endscript
script cycle_nollie_binds
  get_key_cycle key = "NollieKey" max = 1 mode = <mode>
  SetIniInteger section = "In Game Controls" key = "NollieKey" value = <key_value>
  <combo_text> = ( ( nollie_menu_text [ <key_value> ] ).text )
  SetScreenElementProps id = nollie_button text = <combo_text>
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
    helper_text = generic_helper_text
    pos = (223, 59)
  }
  SetScreenElementProps { id = better4_onground_vmenu event_handlers = [
      { pad_back better4_onground_back params = { close_script = <close_script> } }
    ]
  }
  set_sub_bg pos = (326, 65)
  create_icon pos = (176, 65) id = better4_icon texture = PA_options
  draw_menu_box delta_pos = (92, -20) middle_repeat = 13 box_right_scale = (0.8, 1)
  make_text_sub_menu_item text = "" not_focusable
  view_revert_binds
  view_powerslide_binds
  view_nollie_binds
  view_jumptrick
  ForEachIn better4_onground_items do = better4_menu_item params = <...>
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
    helper_text = generic_helper_text
    pos = (223, 59)
  }
  SetScreenElementProps { id = better4_inair_vmenu event_handlers = [
      { pad_back better4_inair_back params = { close_script = <close_script> } }
    ]
  }
  set_sub_bg pos = (326, 65)
  create_icon pos = (176, 65) id = better4_icon texture = PA_options
  draw_menu_box delta_pos = (92, -20) middle_repeat = 13 box_right_scale = (0.8, 1)
  make_text_sub_menu_item text = "" not_focusable
  view_spin_binds
  view_spine_binds
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
    helper_text = generic_helper_text
    pos = (223, 59)
  }
  SetScreenElementProps { id = better4_onrail_vmenu event_handlers = [
      { pad_back better4_onrail_back params = { close_script = <close_script> } }
    ]
  }
  set_sub_bg pos = (326, 65)
  create_icon pos = (176, 65) id = better4_icon texture = PA_options
  draw_menu_box delta_pos = (92, -20) middle_repeat = 13 box_right_scale = (0.8, 1)
  make_text_sub_menu_item text = "" not_focusable
  view_dropdown_binds
  ForEachIn better4_onrail_items do = better4_menu_item params = <...>
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
    helper_text = generic_helper_text
    pos = (223, 59)
  }
  SetScreenElementProps { id = better4_wallride_vmenu event_handlers = [
      { pad_back better4_wallride_back params = { close_script = <close_script> } }
    ]
  }
  set_sub_bg pos = (326, 65)
  create_icon pos = (176, 65) id = better4_icon texture = PA_options
  draw_menu_box delta_pos = (92, -20) middle_repeat = 13 box_right_scale = (0.8, 1)
  make_text_sub_menu_item text = "" not_focusable
  ForEachIn better4_wallride_items do = better4_menu_item params = <...>
  make_text_sub_menu_item text = "Back" scale = 0.85 id = wallride_back_option pad_choose_script = better4_wallride_back pad_choose_params = { close_script = <close_script> }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script better4_wallride_back {
    close_script = nullscript
  }
  DestroyScreenElement id = current_menu_anchor
  better4_menu_options close_script = <close_script>
endscript
script better4_toggle_item
  get_toggle key = <key> fallback = <fallback>
  if ( <key_value> > 0)
    <key_value> = 0
    toggle_menu_item_off id = <id>
    if GotParam unset_script
       <unset_script>
    endif
  else
    <key_value> = 1
    toggle_menu_item_on id = <id>
    if GotParam set_script
       <set_script>
    endif
  endif
  SetIniInteger section = "In Game Toggles" key = <key> value = <key_value>
endscript
script better4_check_item {
    set_script = nullscript
    unset_script = nullscript
  }
  get_toggle key = <key> fallback = <fallback>
  if ( <key_value> > 0)
    toggle_menu_item_on id = <id>
  else
    toggle_menu_item_off id = <id>
  endif
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
script better4_lip_on
  Change LipAllowAngle = 15
  Change LipAllowAngle_Override = 60
endscript
script better4_lip_off
  Change LipAllowAngle = 360
  Change LipAllowAngle_Override = 360
endscript
