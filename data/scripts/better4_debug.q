// Script side of the Better4 developer console. See src/debug.c.
script better4_debug_print text = ""
  Better4DebugPrint text = <text>
endscript

better4_console_pos = (8, 8)
better4_console_scale = (156, 58)
better4_console_rgba = [ 0 0 0 110 ]
better4_console_text_scale = 0.55
better4_console_rows_pos = (16, 12)
better4_console_input_pos = (16, 220)
better4_console_divider_pos = (14, 216)
better4_console_divider_scale = (152, 0.4)

script better4_console_open_now
  root_window:GetTags
  if ChecksumEquals a = <menu_state> b = on
    if not InNetGame
      UnPauseGame
    endif
    exit_pause_menu
  endif
  better4_console_create
endscript

script better4_console_create
  if ObjectExists id = better4_console_anchor
    return
  endif
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = better4_console_anchor
    pos = (0, 0)
    just = [ left top ]
    not_focusable
    z_priority = 100
  }
  CreateScreenElement {
    type = SpriteElement
    parent = better4_console_anchor
    texture = black
    pos = (better4_console_pos)
    scale = (better4_console_scale)
    rgba = (better4_console_rgba)
    just = [ left top ]
    not_focusable
    z_priority = 100
  }
  CreateScreenElement {
    type = SpriteElement
    parent = better4_console_anchor
    texture = black
    pos = (better4_console_divider_pos)
    scale = (better4_console_divider_scale)
    rgba = [ 127 102 0 85 ]
    just = [ left top ]
    not_focusable
    z_priority = 102
  }
  // Rows are stacked by the VMenu, so C never positions them, it appends to the
  // bottom and trims from the top, the way consolemessage.q does.
  CreateScreenElement {
    type = VMenu
    parent = better4_console_anchor
    id = better4_console_rows
    font = small
    pos = (better4_console_rows_pos)
    just = [ left top ]
    internal_just = [ left top ]
    not_focusable
    z_priority = 103
  }
  CreateScreenElement {
    type = TextElement
    parent = better4_console_anchor
    id = better4_console_input
    font = small
    text = ">"
    pos = (better4_console_input_pos)
    scale = (better4_console_text_scale)
    just = [ left top ]
    rgba = [ 128 128 128 110 ]
    not_focusable
    z_priority = 103
  }
endscript

script better4_console_destroy
  if ObjectExists id = better4_console_anchor
    DestroyScreenElement id = better4_console_anchor
  endif
endscript

script better4_console_add_row text = ""
  if not ObjectExists id = better4_console_rows
    return
  endif
  SetScreenElementLock id = better4_console_rows off
  CreateScreenElement {
    type = ContainerElement
    parent = better4_console_rows
    dims = (1000, 14)
    not_focusable
  }
  CreateScreenElement {
    type = TextElement
    parent = <id>
    font = small
    text = <text>
    scale = 0.55
    pos = (0, 0)
    just = [ left top ]
    rgba = [ 128 128 128 100 ]
    not_focusable
    z_priority = 103
  }
endscript

script better4_console_trim_rows
  if ScreenElementExists id = { better4_console_rows child = 0 }
    DestroyScreenElement id = { better4_console_rows child = 0 }
  endif
endscript

script better4_console_clear_rows
  if ObjectExists id = better4_console_rows
    DestroyScreenElement id = better4_console_rows preserve_parent
  endif
endscript

script better4_console_set_input text = ">"
  if ObjectExists id = better4_console_input
    SetScreenElementProps id = better4_console_input text = <text>
  endif
endscript

script better4_debug_run_script
  if not GotParam scriptname
    return
  endif
  if ScriptExists <scriptname>
    <scriptname> <...>
  else
    better4_debug_print text = "\c2no such script"
  endif
endscript

// `anim_play <name>`. PlayAnim is a skater member function, not a CFunc, so it
// has to run in the skater's context, hence MakeSkaterGoto.
script better4_debug_anim_play animspeed = 1.0
  if not GotParam animname
    return
  endif
  MakeSkaterGoto better4_debug_anim_trigger params = { animname = <animname> animspeed = <animspeed> }
endscript

script better4_debug_anim_trigger
  SetRollingFriction 100
  PlayAnim Anim = <animname> speed = <animspeed> cycle
endscript

// `pause` -- a plain PauseGame toggle.
script better4_debug_set_pause paused = 0
  if ( <paused> = 1 )
    PauseGame
  else
    UnPauseGame
  endif
endscript
