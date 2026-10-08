better4_in_freecam = 0

script better4_camera_toggle
  switch better4_control_cameratoggle_index
  case 0
    ToggleSkaterCamMode skater = 0
  case 1
    better4_toggle_freecam
  endswitch
endscript

script better4_toggle_freecam
  switch better4_in_freecam
  case 0
    Change better4_in_freecam = 1
    better4_enter_freecam
  case 1
    Change better4_in_freecam = 0
    better4_exit_freecam
  endswitch
endscript

script better4_freecam_reset_defaults
  Change better4_freecam_hidehud = 0
  better4_freecam_apply_hidehud
  Change better4_freecam_hidenames = 0
  better4_freecam_apply_hidenames
  Change better4_freecam_move_speed = 1.0
  better4_freecam_apply_move_speed
  Change better4_freecam_look_speed = 1.0
  better4_freecam_apply_look_speed
  Change better4_freecam_fov = 0.0
  better4_freecam_apply_fov
endscript

script better4_enter_freecam
  if ShouldEndRun
    LogInfo "better4_enter_freecam: preventing freecam in end of run"
    return
  endif

  if IsBetterObserving
    destroy_observer_ui
  endif

  EnableActuators 0
  PauseMusicAndStreams
  SetViewMode 1
  hide_panel_stuff

  make_new_menu {
    menu_id = better4_freecam_menu
    vmenu_id = better4_freecam_vmenu
    menu_title = "FREECAM"
    pos = (461, 59)
  }
  set_sub_bg pos = (536, 65) scale = (0.9, 1.1)
  create_icon pos = (415, 65) id = better4_icon texture = PA_trick
  draw_menu_box {
    delta_pos = (308, -20)
    // middle_repeat = 16
    middle_repeat = 13
    // box_right_scale = (0.8, 1.175)
    box_right_scale = (0.8, 1.0)
    scale = (0.8, 1.0)
    box_bottom_scale = (0.77, 1.0)
    box_right_offset = (-21, 0)
  }

  better4_menu_spacer
  switch better4_control_freecamcontrols_index
  case 0
    add_freecam_help text = "LS = Move"
    add_freecam_help text = "RS = Look"
    add_freecam_help text = "\bf/\be = Roll"
    add_freecam_help text = "\bh/\bg = Rise"
    add_freecam_help text = "\b7/\b4 = Move Speed"
    add_freecam_help text = "\b6/\b5 = Look Speed"
    add_freecam_help text = "\b3/\b2 = FOV"
    add_freecam_help text = "\b1 = Toggle HUD"
    add_freecam_help text = "\b0 = Toggle Names"
  case 1
    add_freecam_help text = "RS = Move"
    add_freecam_help text = "\b7/\b4/\b6/\b5 = Look"
    add_freecam_help text = "\bf/\bh = Roll"
    add_freecam_help text = "\be/\bg = Rise"
    add_freecam_help text = "\b3/\b2 = Speed"
    add_freecam_help text = "\b1 = Toggle HUD"
    add_freecam_help text = "\b0 = Toggle Names"
  endswitch
endscript

script add_freecam_help {
    parent = current_menu
    font = small
    text_just = [ left top ]
    text_pos = (-5, -15)
    dims = (120, 20)
    scale = 0.6
}
  CreateScreenElement {
    type = TextElement
    parent = <parent>
    dims = <dims>
    font = <font>
    text = <text>
    scale = <scale>
    pos = <text_pos>
    just = <text_just>
    rgba = [ 88 105 112 128 ]
    not_focusable
  }
endscript

script better4_exit_freecam
  LogInfo "exiting freecam"
  EnableActuators
  UnPauseMusicAndStreams
  SetViewMode 0
  show_panel_stuff
  SetScreen Angle = better4_control_fov_value

  create_helper_text_no_bg {
    helper_text_elements = []
    parent = root_window
  }

  if ObjectExists id = better4_freecam_menu
    DestroyScreenElement id = better4_freecam_menu
  endif

  better4_freecam_reset_defaults

  if not GotParam dont_observe
    if IsBetterObserving
      create_observer_ui
    endif
  endif
endscript

better4_freecam_hidehud = 0

script better4_freecam_toggle_hidehud
  if ( better4_freecam_hidehud = 0 )
    Change better4_freecam_hidehud = 1
  else
    Change better4_freecam_hidehud = 0
  endif
  better4_freecam_apply_hidehud
endscript

script better4_freecam_apply_hidehud
  if ( better4_freecam_hidehud = 1 )
    hide_root_window
  else
    unhide_root_window
  endif
endscript

better4_freecam_hidenames = 0

script better4_freecam_toggle_hidenames
  if ( better4_freecam_hidenames = 0 )
    Change better4_freecam_hidenames = 1
  else
    Change better4_freecam_hidenames = 0
  endif
  better4_freecam_apply_hidenames
endscript

script better4_freecam_apply_hidenames
  GetTags
  GetPreferenceString pref_type = network show_names
  if ( better4_freecam_hidenames = 1 )
    text = "Off"
    set_preferences_from_ui prefs = network field = "show_names" checksum = boolean_false string = "Off"
    destroy_all_player_names
  else
    text = "On"
    set_preferences_from_ui prefs = network field = "show_names" checksum = boolean_true string = "On"
  endif
endscript

better4_freecam_move_speed = 1.0

script better4_freecam_increase_move_speed
  LogDebug "better4_freecam_increase_move_speed"
  <new_move_speed> = ( better4_freecam_move_speed + 0.2 )
  Change better4_freecam_move_speed = <new_move_speed>
  better4_notify_move_speed_changed
endscript

script better4_freecam_decrease_move_speed
  <new_move_speed> = ( better4_freecam_move_speed - 0.2 )
  if ( <new_move_speed> > 0 )
    Change better4_freecam_move_speed = <new_move_speed>
    better4_notify_move_speed_changed
  endif
endscript

script better4_notify_move_speed_changed
  switch better4_control_freecamcontrols_index
  case 0
    FormatText TextName = panel_text "Move Speed: %f" f = better4_freecam_move_speed
  case 1
    FormatText TextName = panel_text "Speed: %f" f = better4_freecam_move_speed
  endswitch
  Create_Panel_Message text = <panel_text> id = freecam_speed rgba = better4_orange pos = (320, 380) style = better4_freecam_speed_style
  better4_freecam_apply_move_speed
endscript

script better4_freecam_apply_move_speed
  SetFreecamMoveSpeed value = better4_freecam_move_speed
endscript

better4_freecam_look_speed = 1.0

script better4_freecam_increase_look_speed
  <new_look_speed> = ( better4_freecam_look_speed + 0.2 )
  Change better4_freecam_look_speed = <new_look_speed>
  better4_notify_look_speed_changed
endscript

script better4_freecam_decrease_look_speed
  <new_look_speed> = ( better4_freecam_look_speed - 0.2 )
  if ( <new_look_speed> > 0 )
    Change better4_freecam_look_speed = <new_look_speed>
    better4_notify_look_speed_changed
  endif
endscript

script better4_notify_look_speed_changed
  switch better4_control_freecamcontrols_index
  case 0
    FormatText TextName = panel_text "Look Speed: %f" f = better4_freecam_look_speed
  case 1
    FormatText TextName = panel_text "Speed: %f" f = better4_freecam_look_speed
  endswitch
  Create_Panel_Message text = <panel_text> id = freecam_speed rgba = better4_orange pos = (320, 380) style = better4_freecam_speed_style
  better4_freecam_apply_look_speed
endscript

script better4_freecam_apply_look_speed
  SetFreecamLookSpeed value = better4_freecam_look_speed
endscript

script better4_freecam_speed_style
  DoMorph time = 0 scale = 0
  DoMorph time = 0.1 scale = 0.8
  DoMorph time = 0.1 scale = 0.7
  DoMorph time = 0.1 scale = 0.6
  DoMorph time = 0.6 alpha = 1
  DoMorph time = 1.2 alpha = 0
  Die
endscript

better4_freecam_fov = 0

script better4_freecam_increase_fov
  LogDebug "better4_freecam_increase_fov"
  <new_fov> = ( better4_freecam_fov + 2 )
  Change better4_freecam_fov = <new_fov>
  better4_notify_fov_changed
endscript

script better4_freecam_decrease_fov
  <new_fov> = ( better4_freecam_fov - 2 )
  Change better4_freecam_fov = <new_fov>
  better4_notify_fov_changed
endscript

script better4_notify_fov_changed
  if ( better4_freecam_fov < 0 )
    FormatText TextName = panel_text "FOV: %f" f = better4_freecam_fov
  else
    FormatText TextName = panel_text "FOV: +%f" f = better4_freecam_fov
  endif
  Create_Panel_Message text = <panel_text> id = freecam_speed rgba = better4_orange pos = (320, 380) style = better4_freecam_speed_style
  better4_freecam_apply_fov
endscript

script better4_freecam_apply_fov
  SetScreen Angle = ( better4_control_fov_value + better4_freecam_fov )
endscript

script better4_freecam_check_end_run
  if ShouldEndRun
    LogDebug "better4_freecam_check_end_run: ending run since freecam is on"
    better4_exit_freecam
    ForceEndOfRun
  endif
endscript
