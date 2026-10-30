keyboard_text_block_width = 360

script better4_create_onscreen_keyboard {
  keyboard_title = "KEYBOARD"
  keyboard_cancel_script = keyboard_cancel
  pos = (320, 240)
  max_length = 20
}
  destroy_onscreen_keyboard
  AddTextureToVram "generic_key"
  AddTextureToVram "key_left"
  AddTextureToVram "key_middle"
  AddTextureToVram "key_right"
  AddTextureToVram "PA_fonts"
  AddTextureToVram "goal_right"
  AddTextureToVram "goal_left"
  AddTextureToVram "right_arrow"
  AddTextureToVram "left_arrow"
  SetScreenElementLock id = root_window off

  if GotParam no_buttons
    CreateScreenElement {
      type = ContainerElement
      parent = root_window
      id = keyboard_anchor
      pos = <pos>
      dims = (640, 480)
    }
  else
    CreateScreenElement {
      type = ContainerElement
      parent = root_window
      id = keyboard_anchor
      focusable_child = keyboard_vmenu
      pos = <pos>
      dims = (640, 480)
    }
  endif
  AssignAlias id = keyboard_anchor alias = current_menu_anchor
  keyboard_anchor:SetTags better4
  if GotParam password
    keyboard_anchor:SetTags password
  endif
  if not GotParam no_buttons
    if GotParam allow_cancel
      create_helper_text { helper_text_elements = [ { text = "\b7/\b4/\b6/\b5=Select" }
          { text = "\m1=Back" }
          { text = "\m0=Accept" }
          { text = "\mf/\mg=Character Set" }
        ]
        helper_pos = <helper_pos>
      }
    else
      create_helper_text { helper_text_elements = [ { text = "\b7/\b4/\b6/\b5=Select" }
          { text = "\m0=Accept" }
          { text = "\mf/\mg=Character Set" }
        ]
        helper_pos = <helper_pos>
      }
    endif
  endif
  if GotParam no_buttons
    keyboard_anchor:SetTags no_buttons
    SetScreenElementProps {
      id = keyboard_anchor
      event_handlers = [ { pad_choose keyboard_done params = <...> }
        { pad_back <keyboard_cancel_script> params = <keyboard_cancel_params> }
      ]
    }

    if GotParam text_block
      CreateScreenElement {
        type = TextBlockElement
        parent = keyboard_anchor
        id = keyboard_display_string
        allow_expansion
        font = dialog
        just = [ center top ]
        text = <display_text>
        internal_just = [ center center ]
        not_focusable
        pos = (320, 85)
        dims = ( (1, 0) * keyboard_text_block_width + (0, 10) )
      }
    else
      CreateScreenElement {
        type = TextElement
        parent = keyboard_anchor
        id = keyboard_display_string
        font = dialog
        just = [ center top ]
        text = <display_text>
        not_focusable
        pos = (320, 85)
      }
    endif
    if GotParam password
      GetTextElementLength id = keyboard_display_string
      SetScreenElementProps id = keyboard_display_string text = ""
      if ( <length> > 0 )
        begin
          TextElementConcatenate id = keyboard_display_string "*"
        repeat <length>
      endif
    endif
    CreateScreenElement {
      type = TextElement
      parent = keyboard_anchor
      id = keyboard_current_string
      font = dialog
      just = [ center top ]
      text = <text>
      not_focusable
      pos = (320, 85)
      scale = 0
    }
    if GotParam allowed_characters
      keyboard_current_string:SetTags allowed_characters = <allowed_characters>
    endif
    if GotParam max_length
      if ( <max_length> < 1 )
        script_assert "create_onscreen_keyboard called with bad max_length"
      endif
      begin
        GetTextElementLength id = keyboard_current_string
        if ( <length> > <max_length> )
          TextElementBackspace id = keyboard_current_string
          // TextElementBackspace id = keyboard_display_string
        else
          break
        endif
      repeat
    endif
    CreateScreenElement {
      type = SpriteElement
      parent = keyboard_anchor
      id = keyboard_icon
      texture = PA_fonts
      scale = 0.95
      SetProps rgba = [ 127 102 0 128 ]
      just = [ center center ]
      pos = (159, 66)
    }
    CreateScreenElement {
      type = TextElement
      parent = keyboard_anchor
      font = testtitle
      text = <keyboard_title>
      scale = 1.35
      not_focusable
      just = [ left center ]
      pos = (190, 67)
      rgba = [ 128 128 128 98 ]
    }
    FireEvent type = focus target = keyboard_anchor
  else
    CreateScreenElement {
      type = SpriteElement
      parent = keyboard_anchor
      id = keyboard_bg
      texture = black
      scale = (82, 51.5)
      rgba = [ 0 0 0 90 ]
      just = [ center center ]
      pos = (320, 213)
    }
    CreateScreenElement {
      type = SpriteElement
      parent = keyboard_anchor
      id = keyboard_icon
      texture = PA_fonts
      scale = 0.95
      SetProps rgba = [ 127 102 0 128 ]
      just = [ center center ]
      pos = (159, 66)
    }
    CreateScreenElement {
      type = SpriteElement
      parent = keyboard_anchor
      id = keyboard_bg_support
      texture = goal_right
      scale = (1, 0.81)
      rgba = [ 128 128 128 108 ]
      just = [ center center ]
      pos = (482, 213)
    }
    CreateScreenElement {
      type = SpriteElement
      parent = keyboard_anchor
      id = keyboard_bg_blackbar
      texture = black
      scale = (75, 1.2)
      rgba = [ 0 0 0 88 ]
      just = [ center center ]
      pos = (320, 314)
    }
    CreateScreenElement {
      type = SpriteElement
      parent = keyboard_anchor
      id = keyboard_bg_support_left
      texture = goal_left
      scale = (1, 0.81)
      rgba = [ 128 128 128 108 ]
      just = [ center center ]
      pos = (159, 213)
    }
    CreateScreenElement {
      type = SpriteElement
      parent = keyboard_anchor
      id = keyboard_bg_support_detail
      texture = dialog_frame_b
      scale = (1.25, 1.3)
      rgba = [ 128 128 128 58 ]
      just = [ center center ]
      pos = (320, 96)
    }
    CreateScreenElement {
      type = SpriteElement
      parent = keyboard_anchor
      id = keyboard_bg_top
      texture = black
      scale = (82.2, 8.2)
      rgba = [ 0 0 0 115 ]
      just = [ center center ]
      pos = (320, 92)
    }
    CreateScreenElement {
      type = VMenu
      parent = keyboard_anchor
      id = keyboard_vmenu
      pos = (320, 192)
      internal_just = [ center top ]
      regular_space_amount = 30
      event_handlers = [ { pad_L2 keyboard_handle_L2 params = { max_length = <max_length> } }
        { pad_R2 keyboard_handle_R2 params = { max_length = <max_length> } }
        { pad_up keyboard_change_key_sound }
        { pad_down keyboard_change_key_sound }
      ]
    }
    SetScreenElementProps { id = keyboard_vmenu
      event_handlers = [ { pad_backspace keyboard_handle_backspace }
        { pad_space keyboard_handle_space params = { max_length = <max_length> } }
      ]
    }
    CreateScreenElement {
      type = TextElement
      parent = keyboard_anchor
      font = testtitle
      text = <keyboard_title>
      scale = 1.35
      not_focusable
      just = [ left center ]
      pos = (184, 65)
      rgba = [ 128 128 128 98 ]
    }
    CreateScreenElement {
      type = ContainerElement
      parent = keyboard_vmenu
      id = keyboard_display_string_container
      dims = (10, 20)
      not_focusable
    }
    CreateScreenElement {
      type = TextElement
      parent = <id>
      id = keyboard_display_string
      pos = (-139, 7)
      font = small
      just = [ left top ]
      text = <text>
      scale = 0.85
      not_focusable
    }
    if GotParam password
      GetTextElementLength id = keyboard_display_string
      SetScreenElementProps id = keyboard_display_string text = ""
      if ( <length> > 0 )
        begin
          TextElementConcatenate id = keyboard_display_string "*"
        repeat <length>
      endif
    endif
    CreateScreenElement {
      type = TextElement
      parent = keyboard_anchor
      id = keyboard_current_string
      font = dialog
      just = [ center top ]
      text = <text>
      not_focusable
      pos = (320, 85)
      scale = 0
    }
    if GotParam allowed_characters
      keyboard_current_string:SetTags allowed_characters = <allowed_characters>
    endif
    if GotParam max_length
      if ( <max_length> < 1 )
        script_assert "create_onscreen_keyboard called with bad max_length"
      endif
      begin
        GetTextElementLength id = keyboard_current_string
        if ( <length> > <max_length> )
          TextElementBackspace id = keyboard_current_string
          // TextElementBackspace id = keyboard_display_string
        else
          break
        endif
      repeat
    endif
    CreateScreenElement {
      type = SpriteElement
      parent = keyboard_anchor
      id = keyboard_options_bg
      texture = options_bg
      scale = (1, 1)
      rgba = [ 128 128 128 108 ]
      just = [ center center ]
      pos = (267, 80)
    }
    keyboard_character_set_guide
    keyboard_create_key_sprites <...>
    keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length>
    Change keyboard_current_charset = alphanumeric_lower
    FireEvent type = focus target = keyboard_vmenu
    RunScriptOnScreenElement id = current_menu_anchor animate_in
  endif
  StartKeyboardHandler max_length = <max_length>
endscript

script better4_keyboard_handle_backspace
  PlaySound menu03 vol = 60 pitch = 55
  TextElementBackspace id = keyboard_current_string
  GetTextElementString id = keyboard_current_string
  SetScreenElementProps {
    id = keyboard_display_string
    text = <string>
  }
endscript

script better4_keyboard_button_pressed
  if ( <text> = "\\\\" )
     <text> = "\\"
  endif
  if GotParam max_length
    GetTextElementLength id = keyboard_current_string
    if ( <length> > ( <max_length> - 1 ) )
      PlaySound GUI_Buzzer01
      return
    endif
  endif
  keyboard_current_string:GetTags
  if ( <text> = "\\" )
     <text> = "\\\\"
  endif

  if TextElementConcatenate id = keyboard_current_string <text>
    keyboard_anchor:GetTags
    GetScreenElementDims id = keyboard_display_string
    GetTextElementString id = keyboard_current_string
    SetScreenElementProps {
      id = keyboard_display_string
      text = <string>
    }
    if GotParam no_buttons
      max_string_width = 550
    else
      max_string_width = 300
    endif
    if ( <width> > <max_string_width> )
      TextElementBackspace id = keyboard_current_string
      Printf "string reached end of keyboard!"
      SetScreenElementProps {
        id = keyboard_display_string
        text = <string>
      }
    endif
    switch keyboard_current_charset
    case alphanumeric_lower
      if IsTrue keyboard_caps_lock
        keyboard_change_charset charset = alphanumeric_charset_upper max_length = <max_length>
        Change keyboard_current_charset = alphanumeric_upper
      endif
    case alphanumeric_upper
      if not IsTrue keyboard_caps_lock
        keyboard_change_charset charset = alphanumeric_charset_lower max_length = <max_length>
        Change keyboard_current_charset = alphanumeric_lower
      endif
    endswitch

    if GotParam allowed_characters
      if ArrayContains array = <allowed_characters> contains = <text>
        PlaySound GUI_click06
      else
        PlaySound GUI_Buzzer01
        return
      endif
    else
      PlaySound GUI_click06
    endif
  else
    Printf "string too long!"
    PlaySound GUI_Buzzer01
  endif
endscript
