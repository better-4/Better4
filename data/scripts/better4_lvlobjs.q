lvlobj_options = [
  { text = "Off" value = 0 }
  { text = "On" value = 1 }
]

better4_lvlobj_proset1_value = 0
better4_lvlobj_proset1 = {
  id = better4_lvlobj_proset1_id
  params = toggle_proset1_params
  bit = 0
  value_name = better4_lvlobj_proset1_value
  text = "ProSet1"
  #"default" = 0
}

better4_lvlobj_proset2_value = 0
better4_lvlobj_proset2 = {
  id = better4_lvlobj_proset2_id
  params = toggle_proset2_params
  bit = 1
  value_name = better4_lvlobj_proset2_value
  text = "ProSet2"
  #"default" = 0
}

better4_lvlobj_proset3_value = 0
better4_lvlobj_proset3 = {
  id = better4_lvlobj_proset3_id
  params = toggle_proset3_params
  bit = 2
  value_name = better4_lvlobj_proset3_value
  text = "ProSet3"
  #"default" = 0
}

better4_lvlobj_proset4_value = 0
better4_lvlobj_proset4 = {
  id = better4_lvlobj_proset4_id
  params = toggle_proset4_params
  bit = 3
  value_name = better4_lvlobj_proset4_value
  text = "ProSet4"
  #"default" = 0
}

better4_lvlobj_proset5_value = 0
better4_lvlobj_proset5 = {
  id = better4_lvlobj_proset5_id
  params = toggle_proset5_params
  bit = 4
  value_name = better4_lvlobj_proset5_value
  text = "ProSet5"
  #"default" = 0
}

better4_lvlobj_proset6_value = 0
better4_lvlobj_proset6 = {
  id = better4_lvlobj_proset6_id
  params = toggle_proset6_params
  bit = 5
  value_name = better4_lvlobj_proset6_value
  text = "ProSet6"
  #"default" = 0
}

better4_lvlobj_proset7_value = 0
better4_lvlobj_proset7 = {
  id = better4_lvlobj_proset7_id
  params = toggle_proset7_params
  bit = 6
  value_name = better4_lvlobj_proset7_value
  text = "ProSet7"
  #"default" = 0
}

better4_lvlobj_compgeo_value = 0
better4_lvlobj_compgeo = {
  id = better4_lvlobj_compgeo_id
  params = toggle_comp_geo_params
  bit = 7
  value_name = better4_lvlobj_compgeo_value
  text = "Competition Geo"
  #"default" = 0
}

script better4_lvlobj_handle_changed
  <value> = <value_name>
  AddParams <params>
  LogInfo "better4_lvlobj_handle_changed: new_value=%v value=%w" v = <new_value> w = <value>
  switch <value>
  case 0
    LogInfo "better4_lvlobj_handle_changed: disabling object"
    LogInfo "Killing prefixes geo=%g trg=%t" g = <geo_prefix> t = <trg_prefix>
    Kill prefix = <geo_prefix>
    Kill prefix = <trg_prefix>
    LogInfo "Creating prefixes geo=%g trg=%t" g = <geo_not_prefix> t = <trg_not_prefix>
    Create prefix = <geo_not_prefix>
    Create prefix = <trg_not_prefix>
    UnSetFlag flag = <flag>
  case 1
    LogInfo "better4_lvlobj_handle_changed: enabling object"
    LogInfo "Killing prefixes geo=%g trg=%t" g = <geo_not_prefix> t = <trg_not_prefix>
    Kill prefix = <geo_not_prefix>
    Kill prefix = <trg_not_prefix>
    LogInfo "Creating prefixes geo=%g trg=%t" g = <geo_prefix> t = <trg_prefix>
    Create prefix = <geo_prefix>
    Create prefix = <trg_prefix>
    SetFlag flag = <flag>
  endswitch
endscript

script better4_lvlobj_change
  CastToInteger new_value
  ChangeGlobal Name = <value_name> value = <new_value>
  if IsHost
    ChangeLevelObject bit = <bit> value = <new_value>
  endif
  better4_lvlobj_handle_changed <...>
endscript

script better4_lvlobj_cycle
  <value> = <value_name>
  <new_value> = ( <value> + <delta> )
  GetArraySize lvlobj_options
  if ( <new_value> < 0 )
    <new_value> = ( <new_value> + <array_size> )
  else
    if not ( <array_size> > <new_value> )
      <new_value> = ( <new_value> - <array_size> )
    endif
  endif
  better4_lvlobj_change <...>
endscript

script better4_lvlobj_init
  <value> = <default>
  CastToInteger value
  ChangeGlobal Name = <value_name> value = <value>
  LogInfo "Initializing lvlobj %t to %v" t = <text> v = <value>
  better4_lvlobj_handle_changed <...>
endscript

script better4_lvlobjs_init
  better4_lvlobj_init better4_lvlobj_proset1
  better4_lvlobj_init better4_lvlobj_proset2
  better4_lvlobj_init better4_lvlobj_proset3
  better4_lvlobj_init better4_lvlobj_proset4
  better4_lvlobj_init better4_lvlobj_proset5
  better4_lvlobj_init better4_lvlobj_proset6
  better4_lvlobj_init better4_lvlobj_proset7
  better4_lvlobj_init better4_lvlobj_compgeo
endscript

script better4_lvlobj_reset
  <value> = <default>
  CastToInteger value
  ChangeGlobal Name = <value_name> value = <value>
  LogInfo "Resetting lvlobj %t to %v" t = <text> v = <value>
  UnSetFlag flag = ( ( <params> ).flag )
endscript

script better4_lvlobjs_reset
  better4_lvlobj_reset better4_lvlobj_compgeo
  better4_lvlobj_reset better4_lvlobj_proset1
  better4_lvlobj_reset better4_lvlobj_proset2
  better4_lvlobj_reset better4_lvlobj_proset3
  better4_lvlobj_reset better4_lvlobj_proset4
  better4_lvlobj_reset better4_lvlobj_proset5
  better4_lvlobj_reset better4_lvlobj_proset6
  better4_lvlobj_reset better4_lvlobj_proset7
  ResetLevelObjects
endscript

script better4_lvlobj_set
  switch <bit>
  case 0
    <lvlobj> = better4_lvlobj_proset1
  case 1
    <lvlobj> = better4_lvlobj_proset2
  case 2
    <lvlobj> = better4_lvlobj_proset3
  case 3
    <lvlobj> = better4_lvlobj_proset4
  case 4
    <lvlobj> = better4_lvlobj_proset5
  case 5
    <lvlobj> = better4_lvlobj_proset6
  case 6
    <lvlobj> = better4_lvlobj_proset7
  case 7
    <lvlobj> = better4_lvlobj_compgeo
  endswitch

  AddParams <lvlobj>

  <old_value> = <value_name>
  <new_value> = <value>
  CastToInteger new_value

  if not ( <new_value> = <old_value> )
    ChangeGlobal Name = <value_name> value = <new_value>

    if ( <new_value> = 0 )
      FormatText TextName = message "\c2Host turned off level object '%t'" t = <text>
    else
      FormatText TextName = message "\c4Host turned on level object '%t'" t = <text>
    endif

    create_console_message text = <message>
    better4_lvlobj_handle_changed <...>
  endif
endscript

script better4_create_menu_lvlobj {
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
    focus_script = better4_menu_focus_lvlobj
    unfocus_script = better4_menu_unfocus_lvlobj
    pad_choose_script = item_chosen
}
  if not NodeExists ( ( <params> ).node )
    return
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = <id>
    dims = <dims>
    event_handlers = [
      { focus <focus_script> params = <...> }
      { unfocus <unfocus_script> params = <...> }
      { pad_left better4_menu_cycle_lvlobj_left params = <...> }
      { pad_right better4_menu_cycle_lvlobj_right params = <...> }
      { pad_choose better4_menu_cycle_lvlobj_right params = <...> }
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
  <value_text> = ( ( lvlobj_options [ <index> ] ).text )
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

script better4_menu_focus_lvlobj
  better4_menu_item_focus <...>
  <camera> = ( ( <params> ).camera )
  PlaySkaterCamAnim skater = 0 name = <camera> skippable = 1 play_hold
  SetSkaterCamAnimShouldPause name = <camera> 0
endscript

script better4_menu_unfocus_lvlobj
  better4_menu_item_unfocus <...>
  kill_proset_cams
endscript

script better4_menu_cycle_lvlobj
  better4_lvlobj_cycle <...>
  <index> = <value_name>
  CastToInteger index
  <value_text> = ( ( lvlobj_options [ <index> ] ).text )
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

script better4_menu_cycle_lvlobj_right
  better4_menu_cycle_lvlobj <...> delta = 1
endscript

script better4_menu_cycle_lvlobj_left
  better4_menu_cycle_lvlobj <...> delta = -1
endscript

script better4_create_lvlobjs_menu
  <close_script> = better4_exit_lvlobjs_menu
  better4_create_menu menu_title = "LEVEL OBJECTS" icon = PA_PRO slow_close <...>
  better4_menu_spacer
  better4_create_menu_lvlobj better4_lvlobj_compgeo
  better4_create_menu_lvlobj better4_lvlobj_proset1
  better4_create_menu_lvlobj better4_lvlobj_proset2
  better4_create_menu_lvlobj better4_lvlobj_proset3
  better4_create_menu_lvlobj better4_lvlobj_proset4
  better4_create_menu_lvlobj better4_lvlobj_proset5
  better4_create_menu_lvlobj better4_lvlobj_proset6
  better4_create_menu_lvlobj better4_lvlobj_proset7
  better4_menu_spacer
  better4_create_menu_item text = "Back" id = back_option pad_choose_script = skateshop_transition pad_choose_params = { new_menu_script = <close_script> }
endscript

script better4_exit_lvlobjs_menu
  kill_proset_cams
  if InNetGame
    if ObjectExists id = current_menu_anchor
      DestroyScreenElement id = current_menu_anchor
    endif
    create_network_host_options_menu
  else
    create_options_menu
  endif
endscript
