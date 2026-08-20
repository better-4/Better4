balance_meter_info = {
  bar_positions = [
    (320, 165)
    (250, 224)
  ]
  bar_positions_mp_h = [
    (320, 70)
    (250, 130)
  ]
  bar_positions_mp_v = [
    (140, 130)
    (80, 224)
  ]
  arrow_positions = [
    (0, -17)
    (10, -17)
    (20, -15)
    (30, -11)
    (40, -6)
    (50, 1)
    (60, 12)
  ]
}
special_bar_colors = [
  [ 128 128 255 128 ]
  [ 255 128 128 128 ]
  [ 255 255 128 128 ]
]
special_bar_iterpolator_rate = 0.1
script load_permanent_textures
  LoadTexture "PanelSprites/balancemeter"
  LoadTexture "PanelSprites/balancearrow_glow"
  LoadTexture "PanelSprites/score_small"
  LoadTexture "PanelSprites/specialbar"
  LoadTexture "PanelSprites/fakie_icon"
  LoadTexture "PanelSprites/switch_icon"
  LoadTexture "PanelSprites/nollie_icon"
  LoadTexture "PanelSprites/cash_goal"
  LoadTexture "PanelSprites/options_bg"
  LoadTexture "PanelSprites/black"
  LoadTexture "PanelSprites/white"
  LoadTexture "PanelSprites/white2"
  LoadTexture "PanelSprites/special"
  LoadTexture "PanelSprites/PA_prompt"
  LoadTexture "PanelSprites/PA_network"
  LoadTexture "PanelSprites/dialog_frame"
  LoadTexture "PanelSprites/dialog_frame_b"
  LoadTexture "PanelSprites/dialog_middle"
  LoadTexture "goalsprites/GO_done"
  LoadTexture "goalsprites/GO_fail"
  LoadTexture "goalsprites/GO_new"
  LoadTexture "PanelSprites/SkateSprites/highlight_bar"
  LoadTexture "PanelSprites/mini_score_HUD"
  LoadTexture "PanelSprites/MemcardSprites/mem_frame_piece"
  LoadTexture "PanelSprites/MemcardSprites/mem_bg_piece"
endscript
script hide_panel_stuff
  Printf "*************** HIDING PANEL STUFF *********************"
  if ObjectExists id = player1_panel_container
    Printf "*************** HIDING PANEL STUFF 2 *********************"
    DoScreenElementMorph {
      id = player1_panel_container
      alpha = 0
    }
  endif
endscript
script show_panel_stuff
  Printf "*************** SHOWING PANEL STUFF *********************"
  if ObjectExists id = player1_panel_container
    Printf "*************** HIDING PANEL STUFF 2 *********************"
    DoScreenElementMorph {
      id = player1_panel_container
      alpha = 1
    }
  endif
endscript
script destroy_panel_stuff
  if ObjectExists id = player1_panel_container
    DestroyScreenElement id = player1_panel_container
  endif
  if ObjectExists id = player2_panel_container
    DestroyScreenElement id = player2_panel_container
  endif
  if ObjectExists id = the_time
    DestroyScreenElement id = the_time
  endif
  if ObjectExists id = current_goal
    DestroyScreenElement id = current_goal
  endif
  if ObjectExists id = cash_goal_sprite
    DestroyScreenElement id = cash_goal_sprite
  endif
  if ObjectExists id = cash_text
    DestroyScreenElement id = cash_text
  endif
  if ObjectExists id = goal_points_text
    DestroyScreenElement id = goal_points_text
  endif
  if ObjectExists id = minigame_timer
    DestroyScreenElement id = minigame_timer
  endif
  if ObjectExists id = minigame_timer
    DestroyScreenElement id = minigame_timer
  endif
  if ObjectExists id = net_score_menu
    DestroyScreenElement id = net_score_menu
  endif
endscript
script create_panel_stuff
  if InSplitScreenGame
    ScriptGetScreenMode
    switch <screen_mode>
    case horse1
    case horse2
    case split_vertical
    case one_camera
      timer_pos = (285, 30)
      timer_scale = 1.0
      if GameModeEquals is_horse
        trick_text_dims = (575, 70)
        trick_text_pos = (287, 2)
        player1_panel_dims = (640, 448)
        player1_panel_pos = (0, 0)
        player2_panel_dims = (640, 448)
        player2_panel_pos = (0, 0)
      else
        trick_text_dims = (240, 70)
        trick_text_pos = (120, 2)
        player1_panel_dims = (320, 448)
        player1_panel_pos = (0, 0)
        player2_panel_dims = (320, 448)
        player2_panel_pos = (320, 0)
      endif
      CreateScreenElement {
        id = player1_panel_container
        type = ContainerElement
        parent = root_window
        scale = 1.0
        dims = (320, 448)
        pos = (0, 0)
        just = [ top left ]
      }
      CreateScreenElement {
        id = player2_panel_container
        type = ContainerElement
        parent = root_window
        scale = 1.0
        dims = <player2_panel_dims>
        pos = <player2_panel_pos>
        just = [ top left ]
      }
    case split_horizontal
      trick_text_dims = (575, 30)
      trick_text_pos = (287, 2)
      timer_pos = (300, 25)
      timer_scale = 1.0
      CreateScreenElement {
        id = player1_panel_container
        type = ContainerElement
        parent = root_window
        scale = 1.0
        dims = <player1_panel_dims>
        pos = <player1_panel_pos>
        just = [ top left ]
      }
      CreateScreenElement {
        id = player2_panel_container
        type = ContainerElement
        parent = root_window
        scale = 1.0
        dims = (640, 224)
        pos = (0, 224)
        just = [ top left ]
      }
    endswitch
  else
    trick_text_dims = (575, 70)
    trick_text_pos = (287, 2)
    timer_pos = (300, 37)
    timer_scale = 1.3
    CreateScreenElement {
      id = player1_panel_container
      type = ContainerElement
      parent = root_window
      scale = 1.0
      dims = (640, 448)
      pos = (0, 0)
      just = [ top left ]
    }
  endif
  CreateScreenElement {
    id = the_time
    type = textelement
    parent = root_window
    font = newtimerfont
    text = ""
    scale = <timer_scale>
    pos = <timer_pos>
    just = [ center top ]
    rgba = [ 26 51 83 100 ]
    z_priority = -1
  }
  CreateScreenElement {
    id = current_goal
    type = TextBlockElement
    parent = root_window
    font = small
    internal_scale = 0.8
    text = " "
    pos = (620, 10)
    just = [ right top ]
    internal_just = [ center top ]
    dims = (250, 100)
    rgba = [ 128 128 128 110 ]
    shadow
    shadow_offs = (0.5, 0.5)
    shadow_rgba = [ 30 30 30 100 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = root_window
    id = cash_goal_sprite
    texture = cash_goal
    scale = 1
    just = [ left top ]
    pos = (464, 28)
    alpha = 0
    rgba = [ 128 128 128 128 ]
    z_priority = -10
  }
  CreateScreenElement {
    type = textelement
    parent = root_window
    id = cash_text
    font = small
    text = " "
    scale = 0.75
    pos = (546, 28)
    just = [ left top ]
    rgba = [ 51 72 105 128 ]
  }
  CreateScreenElement {
    type = textelement
    parent = root_window
    id = goal_points_text
    font = small
    pos = (562, 43)
    just = [ left top ]
    scale = 0.75
    rgba = [ 127 102 0 128 ]
    text = " "
  }
  CreateScreenElement {
    type = textelement
    parent = root_window
    id = minigame_timer
    font = small
    pos = (19, 180)
    just = [ left , top ]
    scale = 0.8
    rgba = [ 26 51 83 128 ]
  }
  CreateScreenElement {
    id = the_score
    type = textelement
    parent = player1_panel_container
    font = small
    text = "0"
    scale = 1.0
    pos = (126, 27)
    just = [ left top ]
    rgba = [ 120 100 19 128 ]
  }
  CreateScreenElement {
    id = the_score_sprite
    type = SpriteElement
    parent = the_score
    texture = score_small
    scale = 1
    pos = (-30, 16)
    rgba = [ 128 128 128 128 ]
  }
  CreateScreenElement {
    id = the_special_bar_special
    type = SpriteElement
    parent = the_score_sprite
    texture = special
    scale = (1.73, 0.87)
    pos = (5, 20)
    just = [ left top ]
    rgba = [ 128 128 128 60 ]
    z_priority = 5000
  }
  CreateScreenElement {
    id = the_special_bar_sprite
    type = SpriteElement
    parent = the_score_sprite
    texture = specialbar
    scale = (1, 1.1)
    pos = (4, 21)
    just = [ left top ]
    rgba = [ 128 128 128 80 ]
  }
  CreateScreenElement {
    id = the_boardstance_sprite
    type = SpriteElement
    parent = the_score_sprite
    texture = nollie_icon
    scale = (1.1, 1)
    just = [ left top ]
    pos = (-14, 2)
    rgba = [ 128 128 128 128 ]
  }
  CreateScreenElement {
    id = trick_text_container
    type = ContainerElement
    parent = player1_panel_container
    scale = 1.0
    dims = <trick_text_dims>
    just = [ center center ]
    alpha = 0.0
  }
  CreateScreenElement {
    id = the_trick_text
    type = TextBlockElement
    parent = trick_text_container
    scale = 1.0
    pos = { (0.5, 0) proportional }
    dims = <trick_text_dims>
    just = [ center top ]
    internal_just = [ center top ]
    font = newtrickfont
    text = " "
    internal_scale = 0.7
    alpha = 1.0
    tags = { tag_state = inactive }
    shadow
    shadow_offs = (1, 1)
    shadow_rgba = [ 30 30 30 75 ]
    z_priority = 0
  }
  CreateScreenElement {
    id = the_score_pot_text
    type = textelement
    parent = trick_text_container
    scale = 1.0
    pos = { (0.5, 0) proportional }
    just = [ center bottom ]
    font = small
    text = " "
    alpha = 1.0
    z_priority = 0
  }
  reset_trick_text_appearance the_score_pot_text_id = the_score_pot_text the_trick_text_id = the_trick_text trick_text_container_id = trick_text_container
  CreateScreenElement {
    id = the_balance_meter
    type = SpriteElement
    parent = player1_panel_container
    texture = balancemeter
    scale = 1.0
    just = [ center center ]
    rgba = [ 128 128 128 0 ]
    tags = { tag_turned_on = 0 tag_mode = balance }
  }
  CreateScreenElement {
    type = SpriteElement
    parent = the_balance_meter
    texture = balancearrow_glow
    scale = 1.0
    pos = (0, 0)
    just = [ center center ]
    rgba = [ 128 128 128 0 ]
  }
  if InSplitScreenGame
    CreateScreenElement {
      id = ( the_score + 1 )
      type = textelement
      parent = player2_panel_container
      font = small
      text = "0"
      scale = 1.0
      pos = (126, 27)
      just = [ left top ]
      rgba = [ 120 100 19 128 ]
    }
    CreateScreenElement {
      id = ( the_score_sprite + 1 )
      type = SpriteElement
      parent = ( the_score + 1 )
      texture = score_small
      scale = 1
      pos = (-30, 16)
      rgba = [ 128 128 128 128 ]
    }
    CreateScreenElement {
      id = ( the_special_bar_special + 1 )
      type = SpriteElement
      parent = ( the_score_sprite + 1 )
      texture = special
      scale = (1.73, 0.87)
      pos = (5, 20)
      just = [ left top ]
      rgba = [ 128 128 128 60 ]
      z_priority = 5000
    }
    CreateScreenElement {
      id = ( the_special_bar_sprite + 1 )
      type = SpriteElement
      parent = ( the_score_sprite + 1 )
      texture = specialbar
      scale = (1, 1.1)
      pos = (4, 21)
      just = [ left top ]
      rgba = [ 128 128 128 80 ]
    }
    CreateScreenElement {
      id = ( the_boardstance_sprite + 1 )
      type = SpriteElement
      parent = ( the_score_sprite + 1 )
      texture = nollie_icon
      scale = (1.1, 1)
      just = [ left top ]
      pos = (-14, 2)
      rgba = [ 128 128 128 128 ]
    }
    CreateScreenElement {
      id = ( trick_text_container + 1 )
      type = ContainerElement
      parent = player2_panel_container
      scale = 1.0
      dims = <trick_text_dims>
      just = [ center center ]
      alpha = 0.0
    }
    CreateScreenElement {
      id = ( the_trick_text + 1 )
      type = TextBlockElement
      parent = ( trick_text_container + 1 )
      scale = 1.0
      pos = { (0.5, 0) proportional }
      dims = <trick_text_dims>
      just = [ center top ]
      internal_just = [ center top ]
      font = newtrickfont
      text = " "
      internal_scale = 0.7
      alpha = 1.0
      tags = { tag_state = inactive }
      shadow
      shadow_offs = (1, 1)
      shadow_rgba = [ 30 30 30 75 ]
      z_priority = 0
    }
    CreateScreenElement {
      id = ( the_score_pot_text + 1 )
      type = textelement
      parent = ( trick_text_container + 1 )
      scale = 1.0
      pos = <trick_text_pos>
      just = [ center bottom ]
      font = small
      text = " "
      alpha = 1.0
      z_priority = 0
    }
    reset_trick_text_appearance the_score_pot_text_id = ( the_score_pot_text + 1 ) the_trick_text_id = ( the_trick_text + 1 ) trick_text_container_id = ( trick_text_container + 1 )
    CreateScreenElement {
      id = ( the_balance_meter + 1 )
      type = SpriteElement
      parent = player2_panel_container
      texture = balancemeter
      scale = 1.0
      just = [ center center ]
      rgba = [ 128 128 128 0 ]
      tags = { tag_turned_on = 0 tag_mode = balance }
    }
    CreateScreenElement {
      type = SpriteElement
      parent = ( the_balance_meter + 1 )
      texture = balancearrow_glow
      scale = 1.0
      pos = (0, 0)
      just = [ center center ]
      rgba = [ 128 128 128 0 ]
    }
  endif
  if InNetGame
    if IsObserving
      hide_panel_stuff
    endif
    create_score_menu
  endif
endscript
newtrickfont_colors = [
  [ 0 128 230 60 ]
  [ 200 90 11 60 ]
  [ 0 128 0 60 ]
  [ 128 0 0 60 ]
]
script pause_trick_text
  DoScreenElementMorph id = the_trick_text alpha = 0.0 remember_alpha
  SetScreenElementProps id = the_trick_text override_encoded_rgba remember_override_rgba_state
  DoScreenElementMorph id = the_score_pot_text alpha = 0.0 remember_alpha
  if InSplitScreenGame
    if ScreenElementExists id = ( the_trick_text + 1 )
      DoScreenElementMorph id = ( the_trick_text + 1 ) alpha = 0.0 remember_alpha
      SetScreenElementProps id = ( the_trick_text + 1 ) override_encoded_rgba remember_override_rgba_state
    endif
    if ScreenElementExists id = ( the_score_pot_text + 1 )
      DoScreenElementMorph id = ( the_score_pot_text + 1 ) alpha = 0.0 remember_alpha
    endif
  endif
endscript
script unpause_trick_text
  DoScreenElementMorph id = the_trick_text restore_alpha
  DoScreenElementMorph id = the_score_pot_text restore_alpha
  SetScreenElementProps id = the_trick_text restore_override_rgba_state
  if InSplitScreenGame
    if ScreenElementExists id = ( the_trick_text + 1 )
      DoScreenElementMorph id = ( the_trick_text + 1 ) restore_alpha
    endif
    if ScreenElementExists id = ( the_score_pot_text + 1 )
      DoScreenElementMorph id = ( the_score_pot_text + 1 ) restore_alpha
    endif
  endif
endscript
script trick_text_pulse
  TerminateObjectsScripts id = <trick_text_container_id>
  TerminateObjectsScripts id = <the_trick_text_id>
  TerminateObjectsScripts id = <the_score_pot_text_id> script_name = do_score_pot_text_landed
  RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_pulse params = { <...> }
endscript
script do_trick_text_pulse
  reset_trick_text_appearance <...>
  if InSplitScreenGame
    ScriptGetScreenMode
    if ( <screen_mode> = split_vertical )
      DoMorph scale = 1.0 time = 0.2
      DoMorph scale = 0.6 time = 0.3
      DoMorph scale = 0.95 time = 0.4
    else
      DoMorph scale = 1.2 time = 0.2
      DoMorph scale = 0.9 time = 0.3
      DoMorph scale = 1.0 time = 0.4
    endif
  else
    DoMorph scale = 1.2 time = 0.2
    DoMorph scale = 0.9 time = 0.3
    DoMorph scale = 1.0 time = 0.4
  endif
endscript
script trick_text_landed
  TerminateObjectsScripts id = <trick_text_container_id>
  TerminateObjectsScripts id = <the_trick_text_id>
  TerminateObjectsScripts id = <the_score_pot_text_id>
  RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_landed params = { <...> }
  RunScriptOnScreenElement id = <the_score_pot_text_id> do_score_pot_text_landed params = { <...> }
endscript
script do_trick_text_landed
  reset_trick_text_appearance <...>
  if InSplitScreenGame
    ScriptGetScreenMode
    if ( <screen_mode> = split_vertical )
      DoMorph scale = 0 time = 0
      DoMorph scale = 0.8 time = 0.2
      DoMorph scale = 0.5 time = 0.08
      DoMorph scale = 1.0 time = 0.05
      DoMorph scale = 0.8 time = 0.04
      DoMorph scale = 0.95 time = 0.04
    else
      DoMorph scale = 0 time = 0
      DoMorph scale = 1.4 time = 0.2
      DoMorph scale = 0.8 time = 0.08
      DoMorph scale = 1.2 time = 0.05
      DoMorph scale = 0.9 time = 0.04
      DoMorph scale = 1.0 time = 0.04
    endif
  else
    DoMorph scale = 0 time = 0
    DoMorph scale = 1.4 time = 0.2
    DoMorph scale = 0.8 time = 0.08
    DoMorph scale = 1.2 time = 0.05
    DoMorph scale = 0.9 time = 0.04
    DoMorph scale = 1.0 time = 0.04
  endif
endscript
script do_score_pot_text_landed
  SetScreenElementProps id = <the_score_pot_text_id> rgba = [ 42 80 128 120 ]
  SetScreenElementProps id = <the_score_pot_text_id> override_encoded_rgba
  if InSplitScreenGame
    ScriptGetScreenMode
    if ( <screen_mode> = split_vertical )
      DoMorph scale = 0 time = 0
      DoMorph scale = 0.8 time = 0.2
      DoMorph scale = 0.5 time = 0.08
      DoMorph scale = 1.0 time = 0.05
      DoMorph scale = 0.8 time = 0.04
      DoMorph scale = 0.95 time = 0.04
    else
      DoMorph scale = 0 time = 0.05
      DoMorph scale = 1.8 time = 0.12
      DoMorph scale = 0.8 time = 0.1
      DoMorph scale = 1.5 time = 0.07
      DoMorph scale = 0.9 time = 0.07
      DoMorph scale = 1.3 time = 0.05
      DoMorph scale = 1.0 time = 0.05
      DoMorph scale = 1.25 time = 0.04
      DoMorph scale = 1.1 time = 0.03
      DoMorph scale = 1.2 time = 0.02
    endif
  else
    DoMorph scale = 0 time = 0.05
    DoMorph scale = 1.8 time = 0.12
    DoMorph scale = 0.8 time = 0.1
    DoMorph scale = 1.5 time = 0.07
    DoMorph scale = 0.9 time = 0.07
    DoMorph scale = 1.3 time = 0.05
    DoMorph scale = 1.0 time = 0.05
    DoMorph scale = 1.25 time = 0.04
    DoMorph scale = 1.1 time = 0.03
    DoMorph scale = 1.2 time = 0.02
  endif
endscript
script trick_text_countdown
  TerminateObjectsScripts id = <trick_text_container_id>
  TerminateObjectsScripts id = <the_trick_text_id>
  RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_countdown params = { <...> }
endscript
script do_trick_text_countdown
  reset_just_trick_text_appearance <...>
  DoMorph scale = 0.0 time = 0.5
  DoMorph alpha = 0.0
endscript
script trick_text_bail
  TerminateObjectsScripts id = <trick_text_container_id>
  TerminateObjectsScripts id = <the_trick_text_id>
  RunScriptOnScreenElement id = <trick_text_container_id> do_trick_text_bail params = { <...> }
endscript
script do_trick_text_bail
  reset_trick_text_appearance <...>
  SetScreenElementProps id = <the_trick_text_id> rgba = [ 128 32 32 80 ]
  SetScreenElementProps id = <the_trick_text_id> override_encoded_rgba
  SetScreenElementProps id = <the_score_pot_text_id> rgba = [ 128 32 32 80 ]
  Wait 0.05 seconds
  if InSplitScreenGame
    ScriptGetScreenMode
    if ( <screen_mode> = split_vertical )
      DoMorph alpha = 0 scale = 0 time = 0
      DoMorph pos = { (0, 25) relative } scale = (0.4, 0.7) alpha = 1 time = 0.05
      DoMorph pos = { (0, -25) relative } scale = 0.4 time = 0.1
      DoMorph pos = { (0, 20) relative } scale = 0.8 time = 0.06
      DoMorph pos = { (0, -20) relative } scale = 0.6 time = 0.06
      DoMorph pos = { (0, 10) relative } scale = 0.8 time = 0.05
    else
      DoMorph alpha = 0 scale = 0 time = 0
      DoMorph pos = { (0, 25) relative } scale = (0.7, 1.8) alpha = 1 time = 0.05
      DoMorph pos = { (0, -25) relative } scale = 0.9 time = 0.1
      DoMorph pos = { (0, 20) relative } scale = 1.15 time = 0.06
      DoMorph pos = { (0, -20) relative } scale = 1.12 time = 0.06
      DoMorph pos = { (0, 10) relative } scale = 1.1 time = 0.05
    endif
  else
    DoMorph alpha = 0 scale = 0 time = 0
    DoMorph pos = { (0, 25) relative } scale = (0.7, 1.8) alpha = 1 time = 0.05
    DoMorph pos = { (0, -25) relative } scale = 0.9 time = 0.1
    DoMorph pos = { (0, 20) relative } scale = 1.15 time = 0.06
    DoMorph pos = { (0, -20) relative } scale = 1.12 time = 0.06
    DoMorph pos = { (0, 10) relative } scale = 1.1 time = 0.05
  endif
  DoMorph pos = { (0, -10) relative } time = 0.05
  DoMorph pos = { (0, 5) relative } time = 0.04
  DoMorph pos = { (0, -5) relative } time = 0.04
  Wait 1.3 seconds
  DoMorph pos = { (-2, 4) relative } time = 0.05
  DoMorph pos = { (-3, 6) relative } time = 0.05
  DoMorph pos = { (5, 1) relative } time = 0.05
  DoMorph pos = { (-3, -4) relative } time = 0.05
  DoMorph pos = { (2, -5) relative } time = 0.05
  DoMorph pos = { (4, -1) relative } time = 0.05
  DoMorph pos = { (-3, 2) relative } time = 0.05
  DoMorph pos = { (4, -5) relative } time = 0.05
  DoMorph pos = { (-1, 2) relative } time = 0.05
  DoMorph pos = { (-3, -4) relative } time = 0.05
  DoMorph pos = { (2, -4) relative } time = 0.05
  DoMorph pos = { (3, -6) relative } time = 0.05
  DoMorph pos = { (-5, -1) relative } time = 0.05
  DoMorph pos = { (3, 4) relative } time = 0.05
  DoMorph pos = { (-2, 5) relative } time = 0.05
  DoMorph pos = { (-4, 1) relative } time = 0.05
  DoMorph pos = { (3, -2) relative } time = 0.05
  DoMorph pos = { (-4, 5) relative } time = 0.05
  DoMorph pos = { (1, -2) relative } time = 0.05
  DoMorph pos = { (3, 4) relative } time = 0.05
  random( @runtwoscripts script_text = bail1 script_score = bail1 <...>
  @runtwoscripts script_text = bail1 script_score = bail1 <...>
  @runtwoscripts script_text = bail2 script_score = bail3 <...>
  @runtwoscripts script_text = bail4 script_score = bail5 <...>
  @runtwoscripts script_text = bail5 script_score = bail4 <...>
  @runtwoscripts script_text = bail1 script_score = bail6 <...>
  @runtwoscripts script_text = bail6 script_score = bail6 <...>
  @runtwoscripts script_text = bail4 script_score = bail4 <...>
  @runtwoscripts script_text = bail5 script_score = bail5 <...>
  @runtwoscripts script_text = bail2 script_score = bail1 <...>
   ) 
endscript
script runtwoscripts
  RunScriptOnScreenElement id = <the_trick_text_id> <script_text>
  RunScriptOnScreenElement id = <the_score_pot_text_id> <script_score>
endscript
script bail1
  DoMorph pos = { (0, 0) relative } time = 0.3 scale = 2.0 alpha = 0 fast_in
  DoMorph pos = { (0, 0) relative } scale = 1.0 alpha = 0 fast_in
endscript
script bail2
  DoMorph pos = { (0, -5) relative } time = 0.2
  DoMorph pos = { (0, 448) relative } time = 0.7 fast_in
  DoMorph alpha = 0.0
  DoMorph pos = { (0, -443) relative } scale = 1.0 alpha = 0 fast_in
endscript
script bail3
  Wait 0.1 second
  DoMorph pos = { (0, -5) relative } time = 0.2
  DoMorph pos = { (3, 0) relative } time = 0.05
  DoMorph pos = { (-3, 0) relative } time = 0.05
  DoMorph pos = { (4, 0) relative } time = 0.05
  DoMorph pos = { (-4, 0) relative } time = 0.05
  DoMorph pos = { (0, 448) relative } time = 0.5 fast_in
  DoMorph alpha = 0.0
  DoMorph pos = { (0, -443) relative } scale = 1.0 alpha = 0 fast_in
endscript
script bail4
  DoMorph pos = { (-15, 0) relative } time = 0.1
  DoMorph pos = { (0, 4) relative } time = 0.02
  DoMorph pos = { (0, -4) relative } time = 0.02
  DoMorph pos = { (0, 2) relative } time = 0.02
  DoMorph pos = { (0, -2) relative } time = 0.02
  DoMorph pos = { (150, 0) relative } time = 0.06 alpha = 0.7
  DoMorph pos = { (200, 0) relative } scale = (2, 0.1) time = 0.06 alpha = 0 fast_in
  DoMorph pos = { (200, 0) relative } time = 0
  DoMorph pos = { (-535, 0) relative } scale = 1.0 alpha = 0 fast_in
endscript
script bail5
  DoMorph pos = { (15, 0) relative } time = 0.1
  DoMorph pos = { (0, 4) relative } time = 0.02
  DoMorph pos = { (0, -4) relative } time = 0.02
  DoMorph pos = { (0, 2) relative } time = 0.02
  DoMorph pos = { (0, -2) relative } time = 0.02
  DoMorph pos = { (-150, 0) relative } time = 0.06 alpha = 0.7
  DoMorph pos = { (-200, 0) relative } scale = (2, 0.1) time = 0.06 alpha = 0 fast_in
  DoMorph pos = { (-200, 0) relative } time = 0
  DoMorph pos = { (535, 0) relative } scale = 1.0 alpha = 0 fast_in
endscript
script bail6
  DoMorph pos = { (0, 0) relative } time = 0.3 scale = 0 alpha = 0 fast_in
  DoMorph pos = { (0, 0) relative } scale = 1.0 alpha = 0 fast_in
endscript
script reset_just_trick_text_appearance
  if InSplitScreenGame
    if GameModeEquals is_horse
      trick_text_pos = (320, 410)
      text_scale = 1.0
    else
      ScriptGetScreenMode
      switch <screen_mode>
      case split_vertical
      case one_camera
        trick_text_pos = (142, 410)
        text_scale = 0.95
      case split_horizontal
        trick_text_pos = (320, 200)
        text_scale = 1.0
      endswitch
    endif
    DoScreenElementMorph {
      id = <trick_text_container_id>
      alpha = 1.0
      pos = <trick_text_pos>
      just = [ center top ]
      scale = <text_scale>
    }
    DoScreenElementMorph {
      id = <the_trick_text_id>
      scale = <text_scale>
      pos = { (0.5, 0) proportional }
      just = [ center top ]
      internal_just = [ center top ]
      internal_scale = 0.7
      alpha = 1.0
    }
    SetScreenElementProps id = <the_trick_text_id> dont_override_encoded_rgba
    SetScreenElementProps id = <the_trick_text_id> rgba = [ 128 128 128 80 ]
  else
    DoScreenElementMorph {
      id = <trick_text_container_id>
      alpha = 1.0
      pos = (320, 410)
      scale = 1.0
    }
    DoScreenElementMorph {
      id = <the_trick_text_id>
      scale = 1.0
      pos = { (0.5, 0) proportional }
      just = [ center top ]
      internal_just = [ center top ]
      internal_scale = 0.7
      alpha = 1.0
    }
    SetScreenElementProps id = <the_trick_text_id> dont_override_encoded_rgba
    SetScreenElementProps id = <the_trick_text_id> rgba = [ 128 128 128 80 ]
  endif
endscript
script reset_trick_text_appearance
  TerminateObjectsScripts id = <the_trick_text_id> script_name = bail1
  TerminateObjectsScripts id = <the_trick_text_id> script_name = bail2
  TerminateObjectsScripts id = <the_trick_text_id> script_name = bail3
  TerminateObjectsScripts id = <the_trick_text_id> script_name = bail4
  TerminateObjectsScripts id = <the_trick_text_id> script_name = bail5
  TerminateObjectsScripts id = <the_trick_text_id> script_name = bail6
  TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail1
  TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail2
  TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail3
  TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail4
  TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail5
  TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail6
  reset_just_trick_text_appearance <...>
  SetScreenElementProps id = <the_score_pot_text_id> rgba = [ 127 102 0 85 ]
  SetScreenElementProps id = <the_score_pot_text_id> dont_override_encoded_rgba
  if InSplitScreenGame
    if GameModeEquals is_horse
      DoScreenElementMorph {
        id = <the_score_pot_text_id>
        scale = 1.0
        pos = (287, 2)
        just = [ center bottom ]
        alpha = 1.0
      }
    else
      ScriptGetScreenMode
      switch <screen_mode>
      case split_vertical
      case one_camera
        DoScreenElementMorph {
          id = <the_score_pot_text_id>
          scale = 1.0
          pos = (120, 2)
          just = [ center bottom ]
          alpha = 1.0
        }
      case split_horizontal
        DoScreenElementMorph {
          id = <the_score_pot_text_id>
          scale = 1.0
          pos = (287, 2)
          just = [ center bottom ]
          alpha = 1.0
        }
      endswitch
    endif
  else
    DoScreenElementMorph {
      id = <the_score_pot_text_id>
      scale = 1.0
      pos = (287, 2)
      just = [ center bottom ]
      alpha = 1.0
    }
  endif
endscript
script hide_clock
  KillSpawnedScript name = clock_morph
  DoScreenElementMorph { id = the_time alpha = 0 }
endscript
script show_clock
  DoScreenElementMorph { id = the_time alpha = 1 }
endscript
script hide_balance_meter
  SetScreenElementProps id = <id> tags = { tag_turned_on = 0 }
  RunScriptOnScreenElement id = <id> do_hide_balance_meter params = { id = <id> }
endscript
script pause_balance_meter
  RunScriptOnScreenElement id = the_balance_meter do_hide_balance_meter params = { id = the_balance_meter }
  if InSplitScreenGame
    RunScriptOnScreenElement id = ( the_balance_meter + 1 ) do_hide_balance_meter params = { id = ( the_balance_meter + 1 ) }
  endif
endscript
script do_hide_balance_meter
  SetScreenElementProps id = <id> rgba = [ 128 128 128 0 ]
  SetScreenElementProps id = { <id> child = 0 } rgba = [ 128 128 128 0 ]
endscript
script show_balance_meter
  SetScreenElementProps id = <id> tags = { tag_turned_on = 1 }
  RunScriptOnScreenElement id = <id> do_show_balance_meter params = { id = <id> }
endscript
script unpause_balance_meter
  RunScriptOnScreenElement id = the_balance_meter do_show_balance_meter params = { id = the_balance_meter }
  if InSplitScreenGame
    RunScriptOnScreenElement id = ( the_balance_meter + 1 ) do_show_balance_meter params = { id = ( the_balance_meter + 1 ) }
  endif
endscript
script do_show_balance_meter
  GetTags
  if IntegerEquals a = <tag_turned_on> b = 1
    SetScreenElementProps id = <id> rgba = [ 95 95 95 106 ]
    SetScreenElementProps id = { <id> child = 0 } rgba = [ 128 128 128 100 ]
  endif
endscript
