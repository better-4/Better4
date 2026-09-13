better4_options_text = 'Better4 Options'
better4_orange = [ 164 95 26 100 ]

script better4_main_menu_watermark
  Better4Version
  FormatText TextName = better4_watermark "Better4 %s" s = <version>
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

script better4_menu_spacer
  make_text_sub_menu_item text = "" not_focusable dims = (0, 10)
endscript

script better4_create_menu {
    close_script = nullscript
    menu_title = ""
    icon = PA_options
}
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif

  pulse_blur
  make_new_menu {
    menu_id = better4_menu
    vmenu_id = better4_vmenu
    menu_title = <menu_title>
    helper_text = generic_helper_text
    pos = (198, 59)
  }
  kill_start_key_binding

  if GotParam slow_close
    SetScreenElementProps { id = better4_vmenu event_handlers = [
        { pad_back skateshop_transition params = { new_menu_script = <close_script> new_menu_params = <close_params> } }
      ]
    }
  else
    SetScreenElementProps { id = better4_vmenu event_handlers = [
        { pad_back <close_script> params = <close_params> }
      ]
    }
  endif

  set_sub_bg pos = (316, 65) scale = (1.32, 1.1)
  create_icon pos = (151, 65) id = better4_icon texture = <icon>
  draw_menu_box {
    delta_pos = (92, -20)
    middle_repeat = 16
    box_right_scale = (0.8, 1.175)
    scale = (1.2, 1.0)
    box_bottom_scale = (1.16, 1.0)
    box_right_offset = (-21, 0)
  }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
  better4_menu_spacer
endscript

script better4_menu_item_focus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = [ 128 128 128 50 ]
  }
endscript

script better4_menu_item_unfocus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = [ 128 128 128 0 ]
  }
endscript

script better4_create_menu_item {
    parent = current_menu
    font = small
    highlight_bar_scale = (1.12, 1.3)
    highlight_bar_pos = (124, -7)
    text_just = [ left top ]
    focus_script = better4_menu_item_focus
    unfocus_script = better4_menu_item_unfocus
    text_pos = (-5, -15)
    dims = (200, 20)
    scale = 0.8
    pad_choose_script = nullscript
}
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = <id>
    dims = <dims>
    event_handlers = [
      { focus <focus_script> params = <focus_params> }
      { unfocus <unfocus_script> params = <unfocus_params> }
      { pad_choose generic_menu_pad_choose_sound }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
    ]
    replace_handlers
  }
  <anchor_id> = <id>
  CreateScreenElement {
    type = TextElement
    parent = <anchor_id>
    font = <font>
    text = <text>
    scale = <scale>
    pos = <text_pos>
    just = <text_just>
    rgba = [ 88 105 112 128 ]
  }

  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = highlight_bar
    pos = <highlight_bar_pos>
    scale = <highlight_bar_scale>
    just = [ center center ]
    rgba = [ 128 128 128 0 ]
    z_priority = 3
  }
endscript

script better4_create_menu_control {
    parent = current_menu
    font = small
    highlight_bar_scale = (1.12, 1.3)
    highlight_bar_pos = (124, -7)
    text_pos = (-5, -15)
    child_pos = (255, -16)
    rgba = [ 88 105 112 128 ]
    child_rgba = [ 88 105 112 128 ]
    just = [ left top ]
    child_just = [ right top ]
    scale = 0.8
    dims = (200, 20)
    focus_script = better4_menu_item_focus
    unfocus_script = better4_menu_item_unfocus
    pad_choose_script = item_chosen
}
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = <id>
    dims = <dims>
    event_handlers = [
      { focus <focus_script> params = <focus_params> }
      { unfocus <unfocus_script> params = <unfocus_params> }
      { pad_left better4_menu_cycle_control_left params = <...> }
      { pad_right better4_menu_cycle_control_right params = <...> }
      { pad_choose better4_menu_cycle_control_right params = <...> }
    ]
    replace_handlers
  }

  <anchor_id> = <id>
  CreateScreenElement {
    Type = TextElement
    parent = <anchor_id>
    font = <font>
    pos = <text_pos>
    rgba = <rgba>
    just = <just>
    text = <text>
    scale = <scale>
  }

  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = highlight_bar
    pos = <highlight_bar_pos>
    scale = <highlight_bar_scale>
    just = [ center center ]
    rgba = [ 128 128 128 0 ]
    z_priority = 3
  }

  <index> = <index_name>
  CastToInteger index
  <value_text> = ( ( <options> [ <index> ] ).text )
  CreateScreenElement {
    Type = TextElement
    parent = <anchor_id>
    font = <font>
    pos = <child_pos>
    rgba = <child_rgba>
    just = <child_just>
    text = <value_text>
    scale = <scale>
  }
endscript

script better4_menu_cycle_control
  better4_control_cycle <...>
  <index> = <index_name>
  CastToInteger index
  <value_text> = ( ( <options> [ <index> ] ).text )
  PrintStruct <...>
  SetScreenElementProps {
    id = { <id> child = 2 }
    text = <value_text>
  }
  switch delta
  case 1
    generic_menu_up_or_down_sound Up
  case -1
    generic_menu_up_or_down_sound Down
  endswitch
endscript

script better4_menu_cycle_control_right
  better4_menu_cycle_control <...> delta = 1
endscript

script better4_menu_cycle_control_left
  better4_menu_cycle_control <...> delta = -1
endscript

script better4_options_menu
  better4_create_menu menu_title = "BETTER4 OPTIONS" icon = PA_nuke slow_close <...>
  better4_menu_spacer
  better4_create_menu_item text = "Control Options" id = control_option pad_choose_script = better4_options_controls pad_choose_params = <...>
  better4_create_menu_item text = "HUD Options" id = hud_option pad_choose_script = better4_hud_menu pad_choose_params = <...>
  better4_create_menu_item text = "Camera Options" id = camera_option pad_choose_script = better4_camera_menu pad_choose_params = <...>
  better4_create_menu_item text = "Chat Options" id = chat_option pad_choose_script = better4_chat_menu pad_choose_params = <...>
  better4_create_menu_item text = "Misc" id = misc_option pad_choose_script = better4_misc_menu pad_choose_params = <...>
  better4_menu_spacer
  better4_create_menu_item text = "Close" id = close_option pad_choose_script = skateshop_transition pad_choose_params = { new_menu_script = <close_script> }
endscript

script better4_options_controls
  better4_create_menu menu_title = "CONTROL OPTIONS" icon = PA_flip close_script = better4_options_menu close_params = <...>
  better4_menu_spacer
  better4_create_menu_item text = "In Air" id = inair_option pad_choose_script = better4_inair_menu pad_choose_params = <...>
  better4_create_menu_item text = "In Manual" id = inmanual_option pad_choose_script = better4_inmanual_menu pad_choose_params = <...> 
  better4_create_menu_item text = "On Ground" id = onground_option pad_choose_script = better4_onground_menu pad_choose_params = <...>
  better4_create_menu_item text = "On Rail" id = onrail_option pad_choose_script = better4_onrail_menu pad_choose_params = <...>
  better4_create_menu_item text = "On Wall" id = onwall_option pad_choose_script = better4_onwall_menu pad_choose_params = <...>
  better4_menu_spacer
  better4_create_menu_item text = "Back" pad_choose_script = better4_options_menu pad_choose_params = <...>
endscript

script better4_onground_menu
  better4_create_menu menu_title = "ON GROUND" icon = PA_save close_script = better4_options_controls close_params = <...>
  better4_menu_spacer
  better4_create_menu_control better4_control_revert
  better4_create_menu_control better4_control_powerslide
  better4_create_menu_control better4_control_stancechange
  better4_create_menu_control better4_control_pressure
  better4_create_menu_control better4_control_doublerevert
  better4_create_menu_control better4_control_revertrecovery
  better4_menu_spacer
  better4_create_menu_item text = "Back" pad_choose_script = better4_options_controls pad_choose_params = <...>
endscript

script better4_inair_menu
  better4_create_menu menu_title = "IN AIR" icon = PA_load close_script = better4_options_controls close_params = <...>
  better4_menu_spacer
  better4_create_menu_control better4_control_spinkeys
  better4_create_menu_control better4_control_spinetransfer
  better4_menu_spacer
  better4_create_menu_item text = "Back" pad_choose_script = better4_options_controls pad_choose_params = <...>
endscript

script better4_onrail_menu
  better4_create_menu menu_title = "ON RAIL" icon = PA_lip close_script = better4_options_controls close_params = <...>
  better4_menu_spacer
  better4_create_menu_control better4_control_dropdown
  better4_create_menu_control better4_control_liptricks
  better4_create_menu_control better4_control_railspin
  better4_menu_spacer
  better4_create_menu_item text = "Back" pad_choose_script = better4_options_controls pad_choose_params = <...>
endscript

script better4_onwall_menu
  better4_create_menu menu_title = "ON WALL" icon = PA_connection close_script = better4_options_controls close_params = <...>
  better4_menu_spacer
  better4_create_menu_control better4_control_wallpush
  better4_create_menu_control better4_control_wallspin
  better4_create_menu_control better4_control_wallridebail
  better4_create_menu_control better4_control_wallieplant
  better4_menu_spacer
  better4_create_menu_item text = "Back" pad_choose_script = better4_options_controls pad_choose_params = <...>
endscript

script better4_inmanual_menu
  better4_create_menu menu_title = "IN MANUAL" icon = PA_trick close_script = better4_options_controls close_params = <...>
  better4_menu_spacer
  better4_create_menu_control better4_control_manualspin
  better4_create_menu_control better4_control_manualfloat
  better4_create_menu_control better4_control_spacewalk
  better4_menu_spacer
  better4_create_menu_item text = "Back" pad_choose_script = better4_options_controls pad_choose_params = <...>
endscript

script better4_hud_menu
  better4_create_menu menu_title = "HUD OPTIONS" icon = PA_trick close_script = better4_options_menu close_params = <...>
  better4_menu_spacer
  better4_create_menu_item text = "Adjust Gamma" pad_choose_script = create_gamma_menu pad_choose_params = <...>
  better4_create_menu_control better4_control_buttonsfont
  better4_menu_spacer
  better4_create_menu_item text = "Back" pad_choose_script = better4_options_menu pad_choose_params = <...>
endscript

script better4_jumptrick_menu
  better4_create_menu menu_title = "JUMPTRICK" icon = PA_trick close_script = create_edit_tricks_menu close_params = <...>
  better4_menu_spacer
  better4_create_menu_control better4_control_jumptrick
  better4_menu_spacer
  better4_create_menu_item text = "Back" pad_choose_script = create_edit_tricks_menu pad_choose_params = <...>
endscript

script better4_camera_menu
  better4_create_menu menu_title = "CAMERA OPTIONS" icon = PA_trick close_script = better4_options_menu close_params = <...>
  better4_menu_spacer
  better4_create_menu_control better4_control_aspect_ratio
  better4_create_menu_control better4_control_fov
  better4_menu_spacer
  better4_create_menu_item text = "Back" pad_choose_script = better4_display_menu pad_choose_params = <...>
endscript

script better4_chat_menu
  better4_create_menu menu_title = "CHAT OPTIONS" icon = PA_trick close_script = better4_options_menu close_params = <...>
  better4_menu_spacer
  better4_create_menu_control better4_control_chat_size
  better4_create_menu_control better4_control_chat_duration
  better4_menu_spacer
  better4_create_menu_item text = "Back" pad_choose_script = better4_display_menu pad_choose_params = <...>
endscript

script better4_misc_menu
  better4_create_menu menu_title = "MISC" icon = PA_trick close_script = better4_options_menu close_params = <...>
  better4_menu_spacer
  better4_create_menu_control better4_control_boardscuff
  better4_create_menu_control better4_control_pauseonunfocus
  // better4_create_menu_control better4_trick_string
  // better4_create_menu_control better4_control_special_meter
  better4_create_menu_control better4_control_extratrick_sound
  if not IsBetterObserving
    if not IsObserving
      better4_create_menu_item text = "Change CAS" pad_choose_script = pre_cas_menu_exit pad_choose_params = { new_menu_script = launch_load_cas_sequence }
    else
      better4_create_menu_item text = "Change CAS" not_focusable pad_choose_script = pre_cas_menu_exit pad_choose_params = { new_menu_script = launch_load_cas_sequence }
    endif
  else
    better4_create_menu_item text = "Change CAS" not_focusable pad_choose_script = pre_cas_menu_exit pad_choose_params = { new_menu_script = launch_load_cas_sequence }
  endif
  better4_menu_spacer
  better4_create_menu_item text = "Back" pad_choose_script = better4_options_menu pad_choose_params = <...>
endscript
