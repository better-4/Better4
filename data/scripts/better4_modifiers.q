modifier_options = [
  { text = "Off" value = 0 }
  { text = "On" value = 1 }
]

better4_modifier_disablerevert_value = 0
better4_modifier_disablerevert = {
  id = better4_modifier_disablerevert_id
  flag = 0
  value_name = better4_modifier_disablerevert_value
  text = "Disable Revert"
  help = "Toggle whether players can perform reverts."
  #"default" = 0
}

better4_modifier_disablemanual_value = 0
better4_modifier_disablemanual = {
  id = better4_modifier_disablemanual_id
  flag = 1
  value_name = better4_modifier_disablemanual_value
  text = "Disable Manual"
  help = "Toggle whether players can perform manuals."
  #"default" = 0
}

better4_modifier_disableboostplant_value = 0
better4_modifier_disableboostplant = {
  id = better4_modifier_disableboostplant_id
  flag = 2
  value_name = better4_modifier_disableboostplant_value
  text = "Disable Boostplant"
  help = "Toggle whether players can perform boostplants."
  #"default" = 0
}

better4_modifier_disablewallpush_value = 0
better4_modifier_disablewallpush = {
  id = better4_modifier_disablewallpush_id
  flag = 3
  value_name = better4_modifier_disablewallpush_value
  text = "Disable Wallpush"
  help = "Toggle whether players can perform wallpushes."
  change_script = better4_modifier_disablewallpush_change
  #"default" = 0
}

script better4_modifier_disablewallpush_change
  switch better4_modifier_disablewallpush_value
  case off
    better4_control_wallpush_change
  case on
    SetWallpushEnabled enabled = off
  endswitch
endscript

better4_modifier_disablespacewalk_value = 0
better4_modifier_disablespacewalk = {
  id = better4_modifier_disablespacewalk_id
  flag = 4
  value_name = better4_modifier_disablespacewalk_value
  text = "Disable Spacewalk"
  help = "Toggle whether players can perform spacewalks."
  change_script = better4_modifier_disablespacewalk_change
  #"default" = 0
}

script better4_modifier_disablespacewalk_change
  switch better4_modifier_disablespacewalk_value
  case off
    better4_control_spacewalk_change
  case on
    Change FlatLandBranches = flatland_branches_spacewalk_off
  endswitch
endscript

better4_modifier_alwaysspecial_value = 0
better4_modifier_alwaysspecial = {
  id = better4_modifier_alwaysspecial_id
  flag = 5
  value_name = better4_modifier_alwaysspecial_value
  text = "Always Special"
  help = "Toggle whether players always have their special meter filled."
  change_script = better4_modifier_alwaysspecial_change
  #"default" = 0
}

script better4_modifier_alwaysspecial_change
  switch better4_modifier_alwaysspecial_value
  case off
    UnSetGlobalFlag flag = CHEAT_ALWAYS_SPECIAL
  case on
    SetGlobalFlag flag = CHEAT_ALWAYS_SPECIAL
  endswitch
endscript

better4_modifier_perfectrail_value = 0
better4_modifier_perfectrail = {
  id = better4_modifier_perfectrail_id
  flag = 6
  value_name = better4_modifier_perfectrail_value
  text = "Perfect Rail"
  help = "Toggle whether players always have perfect rail balance."
  change_script = better4_modifier_perfectrail_change
  #"default" = 0
}

script better4_modifier_perfectrail_change
  switch better4_modifier_perfectrail_value
  case off
    UnSetGlobalFlag flag = CHEAT_PERFECT_RAIL
  case on
    SetGlobalFlag flag = CHEAT_PERFECT_RAIL
  endswitch
endscript

better4_modifier_perfectmanual_value = 0
better4_modifier_perfectmanual = {
  id = better4_modifier_perfectmanual_id
  flag = 7
  value_name = better4_modifier_perfectmanual_value
  text = "Perfect Manual"
  help = "Toggle whether players always have perfect manual balance."
  change_script = better4_modifier_perfectmanual_change
  #"default" = 0
}

script better4_modifier_perfectmanual_change
  switch better4_modifier_perfectmanual_value
  case off
    UnSetGlobalFlag flag = CHEAT_PERFECT_MANUAL
  case on
    SetGlobalFlag flag = CHEAT_PERFECT_MANUAL
  endswitch
endscript

better4_modifier_perfectskitch_value = 0
better4_modifier_perfectskitch = {
  id = better4_modifier_perfectskitch_id
  flag = 8
  value_name = better4_modifier_perfectskitch_value
  text = "Perfect Skitch"
  help = "Toggle whether players always have perfect skitch balance."
  change_script = better4_modifier_perfectskitch_change
  #"default" = 0
}

script better4_modifier_perfectskitch_change
  switch better4_modifier_perfectskitch_value
  case off
    UnSetGlobalFlag flag = CHEAT_PERFECT_SKITCH
  case on
    SetGlobalFlag flag = CHEAT_PERFECT_SKITCH
  endswitch
endscript

better4_modifier_disabletrickboost_value = 0
better4_modifier_disabletrickboost = {
  id = better4_modifier_disabletrickboost_id
  flag = 9
  value_name = better4_modifier_disabletrickboost_value
  text = "Disable Trick Boost"
  help = "Toggle whether players receive a boost from using tricks like Jango Jump Jet."
  #"default" = 0
}

script better4_modifier_cycle
  <value> = <value_name>
  <new_value> = ( <value> + <delta> )
  GetArraySize modifier_options
  if ( <new_value> < 0 )
    <new_value> = ( <new_value> + <array_size> )
  else
    if not ( <array_size> > <new_value> )
      <new_value> = ( <new_value> - <array_size> )
    endif
  endif
  better4_modifier_change <...>
endscript

script better4_modifier_change
  CastToInteger new_value
  ChangeGlobal Name = <value_name> value = <new_value>
  if IsHost
    ChangeGameModifier flag = <flag> value = <new_value>
  endif
  if GotParam change_script
    <change_script> <...>
  endif
endscript

script better4_modifier_init
  <value> = <default>
  CastToInteger value
  ChangeGlobal Name = <value_name> value = <value>
  LogInfo "Initializing modifier %t to %v" t = <text> v = <value>
  if IsHost
    ChangeGameModifier flag = <flag> value = <value>
  endif
  if GotParam change_script
    <change_script> <...>
  endif
endscript

script better4_modifiers_init
  better4_modifier_init better4_modifier_disablerevert
  better4_modifier_init better4_modifier_disablemanual
  better4_modifier_init better4_modifier_disableboostplant
  better4_modifier_init better4_modifier_disablewallpush
  better4_modifier_init better4_modifier_disablespacewalk
  better4_modifier_init better4_modifier_alwaysspecial
  better4_modifier_init better4_modifier_perfectrail
  better4_modifier_init better4_modifier_perfectmanual
  better4_modifier_init better4_modifier_perfectskitch
  better4_modifier_init better4_modifier_disabletrickboost
endscript

script better4_modifier_set
  switch <flag>
  case 0
    <mod> = better4_modifier_disablerevert
  case 1
    <mod> = better4_modifier_disablemanual
  case 2
    <mod> = better4_modifier_disableboostplant
  case 3
    <mod> = better4_modifier_disablewallpush
  case 4
    <mod> = better4_modifier_disablespacewalk
  case 5
    <mod> = better4_modifier_alwaysspecial
  case 6
    <mod> = better4_modifier_perfectrail
  case 7
    <mod> = better4_modifier_perfectmanual
  case 8
    <mod> = better4_modifier_perfectskitch
  case 9
    <mod> = better4_modifier_disabletrickboost
  endswitch

  AddParams <mod>

  <old_value> = <value_name>
  <new_value> = <value>
  CastToInteger new_value

  if not ( <new_value> = <old_value> )
    ChangeGlobal Name = <value_name> value = <new_value>

    if ( <new_value> = 0 )
      FormatText TextName = message "\c2Host turned off modifier '%t'" t = <text>
    else
      FormatText TextName = message "\c4Host turned on modifier '%t'" t = <text>
    endif

    create_console_message text = <message>
    if GotParam change_script
      <change_script> <...>
    endif
  endif
endscript

script better4_create_menu_modifier {
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
      { focus <focus_script> params = <...> }
      { unfocus <unfocus_script> params = <...> }
      { pad_left better4_menu_cycle_modifier_left params = <...> }
      { pad_right better4_menu_cycle_modifier_right params = <...> }
      { pad_choose better4_menu_cycle_modifier_right params = <...> }
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

  <index> = <value_name>
  CastToInteger index
  <value_text> = ( ( modifier_options [ <index> ] ).text )
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

script better4_menu_cycle_modifier
  better4_modifier_cycle <...>
  <index> = <value_name>
  CastToInteger index
  <value_text> = ( ( modifier_options [ <index> ] ).text )
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

script better4_menu_cycle_modifier_right
  better4_menu_cycle_modifier <...> delta = 1
endscript

script better4_menu_cycle_modifier_left
  better4_menu_cycle_modifier <...> delta = -1
endscript

script better4_create_game_modifiers_menu
  <close_script> = better4_exit_game_modifiers_menu
  better4_create_menu menu_title = "GAME MODIFIERS" icon = PA_nuke slow_close <...>
  better4_menu_spacer
  better4_create_menu_modifier better4_modifier_disablerevert
  better4_create_menu_modifier better4_modifier_disablemanual
  better4_create_menu_modifier better4_modifier_disableboostplant
  better4_create_menu_modifier better4_modifier_disablewallpush
  better4_create_menu_modifier better4_modifier_disablespacewalk
  better4_create_menu_modifier better4_modifier_alwaysspecial
  better4_create_menu_modifier better4_modifier_perfectrail
  better4_create_menu_modifier better4_modifier_perfectmanual
  // better4_create_menu_modifier better4_modifier_perfectskitch
  better4_create_menu_modifier better4_modifier_disabletrickboost
  better4_menu_spacer
  better4_create_menu_item text = "Back" id = back_option pad_choose_script = skateshop_transition pad_choose_params = { new_menu_script = <close_script> }
endscript

script better4_exit_game_modifiers_menu
  if InNetGame
    if ObjectExists id = current_menu_anchor
      DestroyScreenElement id = current_menu_anchor
    endif
    create_network_host_options_menu
  else
    create_options_menu
  endif
endscript
