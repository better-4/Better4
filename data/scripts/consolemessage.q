number_of_console_lines = 6
better4_chat_scale = 0
better4_padding = 0
script create_console
  if not ObjectExists id = console_message_vmenu
    SetScreenElementLock id = root_window off
    if LevelIs load_skateshop
      pos = (60, 265)
    else
      pos = (20, 265)
    endif
    CreateScreenElement {
      type = VMenu
      parent = root_window
      id = console_message_vmenu
      padding_scale = (better4_padding)
      font = small
      just = [ left top ]
      internal_just = [ left center ]
      pos = <pos>
      z_priority = 0
    }
  endif
endscript
script create_console_message text = "Default console message" rgba = [ 113 121 127 80 ]
  if not ObjectExists id = console_message_vmenu
    create_console
  endif
  SetScreenElementLock id = console_message_vmenu off
  if ScreenElementExists id = { console_message_vmenu child = ( number_of_console_lines - 1 ) }
    DestroyScreenElement id = { console_message_vmenu child = 0 }
  endif
  if LevelIs load_skateshop
    dims = (470, 10)
    pos = (60, 263)
    Change number_of_console_lines = 8
    max_chat_height = 128
  else
    dims = (860, 10)
    pos = (20, 265)
    Change number_of_console_lines = 6
    max_chat_height = 96
  endif
  SetScreenElementProps id = console_message_vmenu pos = <pos>
  CreateScreenElement {
    type = TextBlockElement
    parent = console_message_vmenu
    font = small
    text = <text>
    internal_just = [ left top ]
    rgba = <rgba>
    scale = (better4_chat_scale)
    not_focusable
    dims = <dims>
    allow_expansion
    z_priority = 5
  }
  begin
    total_height = 0
    index = number_of_console_lines
    begin
      if ScreenElementExists id = { console_message_vmenu child = ( number_of_console_lines - <index> ) }
        GetScreenElementDims id = { console_message_vmenu child = ( number_of_console_lines - <index> ) }
         <total_height> = ( <total_height> + <height> )
         <index> = ( <index> - 1 )
      else
        break
      endif
    repeat
    if ( <total_height> > <max_chat_height> )
      DestroyScreenElement id = { console_message_vmenu child = 0 }
    else
      break
    endif
  repeat
  if not LevelIs load_skateshop
    RunScriptOnScreenElement id = <id> console_message_wait_and_die
  endif
endscript
script console_left_justify
  if ObjectExists id = console_message_vmenu
    SetScreenElementLock id = console_message_vmenu off
    SetScreenElementProps {
      id = console_message_vmenu
      just = [ left top ]
      internal_just = [ left center ]
    }
    SetScreenElementProps {
      id = console_message_vmenu
      pos = (20, 265)
    }
  endif
endscript
script console_right_justify
  if ObjectExists id = console_message_vmenu
    SetScreenElementLock id = console_message_vmenu off
    SetScreenElementProps {
      id = console_message_vmenu
      just = [ right top ]
      internal_just = [ right center ]
    }
    SetScreenElementProps {
      id = console_message_vmenu
      pos = (620, 265)
    }
  endif
endscript
script console_hide
  if ObjectExists id = console_message_vmenu
    RunScriptOnScreenElement id = console_message_vmenu console_hide2
  endif
endscript
script console_hide2
  DoMorph scale = 0
endscript
script console_unhide
  if ObjectExists id = console_message_vmenu
    RunScriptOnScreenElement id = console_message_vmenu console_unhide2
  endif
endscript
script console_unhide2
  DoMorph scale = 1
endscript
script console_clear
  if ScreenElementExists id = console_message_vmenu
    DestroyScreenElement id = console_message_vmenu preserve_parent
  endif
endscript
script console_destroy
  if ObjectExists id = console_message_vmenu
    DestroyScreenElement id = console_message_vmenu
  endif
endscript
script console_message_wait_and_die
  Wait better4_control_chat_duration_value seconds
  DoMorph time = 0.5 alpha = 0
  Die
endscript
