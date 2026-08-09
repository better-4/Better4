off = 0
on = 1
better4_controls_ini_section = "Controls"
better4_control_spinkeys_index = 0
better4_control_spinkeys = {
  id = better4_control_spinkeys_id
  index_name = better4_control_spinkeys_index
  text = "Spin Keys"
  ini_key = "SpinKeys"
  options = [
    { text = "L1/R1" }
    { text = "L2/R2" }
    { text = "R1/R2" }
    { text = "L1/L2" }
  ]
  change_script = better4_control_spinkeys_change
}
script better4_control_spinkeys_change
  SetSpinKeysControl index = better4_control_spinkeys_index
endscript
better4_control_spinetransfer_index = 0
better4_control_spinetransfer = {
  id = better4_control_spinetransfer_id
  index_name = better4_control_spinetransfer_index
  text = "Spine Transfer"
  ini_key = "SpineTransfer"
  options = [
    { text = "L2/R2" }
    { text = "R2" }
    { text = "L2" }
    { text = "L2+R2" }
    { text = "L1/R1" }
    { text = "R1" }
    { text = "L1" }
    { text = "L1+R1" }
  ]
  change_script = better4_control_spinetransfer_change
}
script better4_control_spinetransfer_change
  SetSpineTransferControl index = better4_control_spinetransfer_index
endscript
RevertVanilla = [
  { Trigger = { Press R2 200 } TrickSlot = ExtraSlot1 }
  { Trigger = { Press L2 200 } TrickSlot = ExtraSlot2 }
]
RevertOnlyR2 = [ { Trigger = { Press R2 200 } TrickSlot = ExtraSlot1 } ]
RevertOnlyL2 = [ { Trigger = { Press L2 200 } TrickSlot = ExtraSlot2 } ]
RevertR2andL2 = [ { Trigger = { HoldThree L2 R2 L2 } TrickSlot = ExtraSlot1 } ]
RevertOnlyR1 = [ { Trigger = { Press R1 200 } TrickSlot = ExtraSlot1 } ]
RevertOnlyL1 = [ { Trigger = { Press L1 200 } TrickSlot = ExtraSlot2 } ]
RevertR1andL1 = [ { Trigger = { HoldThree L1 R1 L1 } TrickSlot = ExtraSlot1 } ]
RevertR1orL1 = [
  { Trigger = { Press R1 200 } TrickSlot = ExtraSlot1 }
  { Trigger = { Press L1 200 } TrickSlot = ExtraSlot2 }
]
better4_control_revert_index = 0
better4_control_revert_value = RevertVanilla
better4_control_revert = {
  id = better4_control_revert_id
  index_name = better4_control_revert_index
  value_name = better4_control_revert_value
  text = "Revert"
  ini_key = "Revert"
  options = [
    { text = "R2/L2" value = RevertVanilla }
    { text = "R2" value = RevertOnlyR2 }
    { text = "L2" value = RevertOnlyL2 }
    { text = "R2+L2" value = RevertR2andL2 }
    { text = "R1/L1" value = RevertOnlyR1 }
    { text = "R1" value = RevertOnlyL1 }
    { text = "L1" value = RevertR1andL1 }
    { text = "R1+L1" value = RevertR1orL1 }
  ]
}
PowerslideVanilla = [ { Trigger = { HoldThree R1 L1 Down } Scr = ToggleSwitchRegular params = { PowerSlide } } ]
PowerslideDownR2L2 = [ { Trigger = { HoldThree R2 L2 Down } Scr = ToggleSwitchRegular params = { PowerSlide } } ]
PowerslideDownR2 = [ { Trigger = { HoldThree Down R2 R2 } Scr = ToggleSwitchRegular params = { PowerSlide } } ]
PowerslideDownR1 = [ { Trigger = { HoldThree Down R1 R1 } Scr = ToggleSwitchRegular params = { PowerSlide } } ]
PowerslideR2 = [ { Trigger = { HoldThree R2 R2 R2 } Scr = ToggleSwitchRegular params = { PowerSlide } } ]
PowerslideL2 = [ { Trigger = { HoldThree L2 L2 L2 } Scr = ToggleSwitchRegular params = { PowerSlide } } ]
PowerslideR1 = [ { Trigger = { HoldThree R1 R1 R1 } Scr = ToggleSwitchRegular params = { PowerSlide } } ]
PowerslideL1 = [ { Trigger = { HoldThree L1 L1 L1 } Scr = ToggleSwitchRegular params = { PowerSlide } } ]
better4_control_powerslide_index = 0
better4_control_powerslide_value = PowerslideVanilla
better4_control_powerslide = {
  id = better4_control_powerslide_id
  index_name = better4_control_powerslide_index
  value_name = better4_control_powerslide_value
  text = "Powerslide"
  ini_key = "Powerslide"
  options = [
    { text = "D+R1+L1" value = PowerslideVanilla }
    { text = "D+R2+L2" value = PowerslideDownR2L2 }
    { text = "D+R2" value = PowerslideDownR2 }
    { text = "D+R1" value = PowerslideDownR1 }
    { text = "R2" value = PowerslideR2 }
    { text = "L2" value = PowerslideL2 }
    { text = "R1" value = PowerslideR1 }
    { text = "L1" value = PowerslideL1 }
  ]
}
NollieL2 = [ { Trigger = { Press L2 20 } Scr = ToggleNollieRegular } ]
better4_control_stancechange_index = 0
better4_control_stancechange_value = NollieL2
better4_control_stancechange = {
  id = better4_control_stancechange_id
  index_name = better4_control_stancechange_index
  value_name = better4_control_stancechange_value
  text = "Stance Change"
  ini_key = "StanceChange"
  options = [
    { text = "L2" value = NollieL2 }
    { text = "Off" value = NoTricks }
  ]
}
JumptrickBoneless = [ { Trigger = { TapTwiceRelease Up X 500 } Scr = Boneless params = { Name = 'Boneless' Anim = Boneless Score = 250 } } ]
JumptrickFastplant = [ { Trigger = { TapTwiceRelease Up X 500 } Scr = Boneless params = { Name = 'Fastplant' Anim = Fastplant Score = 250 } } ]
JumptrickBeanplant = [ { Trigger = { TapTwiceRelease Up X 500 } Scr = Boneless params = { Name = 'Beanplant' Anim = Beanplant Score = 250 } } ]
JumptrickMikeVBoneless = [ { Trigger = { TapTwiceRelease Up X 500 } Scr = Boneless params = { Name = "MikeV Boneless" Anim = _540Boneless Score = 300 Speed = 1.25 } } ]
better4_control_jumptrick_index = 0
better4_control_jumptrick_value = JumptrickBoneless
better4_control_jumptrick = {
  id = better4_control_jumptrick_id
  index_name = better4_control_jumptrick_index
  value_name = better4_control_jumptrick_value
  text = "Jump Trick"
  ini_key = "Jumptrick"
  options = [
    { text = "Boneless" value = JumptrickBoneless }
    { text = "Beanplant" value = JumptrickBeanplant }
    { text = "Fastplant" value = JumptrickFastplant }
    { text = "MikeV" value = JumptrickMikeVBoneless }
  ]
}
better4_control_manualspin_index = 0
better4_control_manualspin_value = off
better4_control_manualspin = {
  id = better4_control_manualspin_id
  index_name = better4_control_manualspin_index
  value_name = better4_control_manualspin_value
  text = "Manual Spin"
  ini_key = "ManualSpin"
  options = [
    { text = "R2" value = off }
    { text = "R2/L2" value = on }
  ]
}
better4_control_manualfloat_index = 0
better4_control_manualfloat_value = off
better4_control_manualfloat = {
  id = better4_control_manualfloat_id
  index_name = better4_control_manualfloat_index
  value_name = better4_control_manualfloat_value
  text = "Manual Float"
  ini_key = "ManualFloat"
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}
better4_control_doublerevert_index = 1
better4_control_doublerevert_value = on
better4_control_doublerevert = {
  id = better4_control_doublerevert_id
  index_name = better4_control_doublerevert_index
  value_name = better4_control_doublerevert_value
  text = "Double Revert"
  ini_key = "DoubleRevert"
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}
DropdownVanilla = [
  { Trigger = { Press L2 100 } Scr = SkateInOrBail params = { FallingLeft GrindBail = Airborne moveleft = 5 movey = 5 } }
  { Trigger = { Press R2 100 } Scr = SkateInOrBail params = { FallingRight GrindBail = Airborne moveright = -5 movey = 5 } }
]
DropdownOnlyR2 = [ { Trigger = { Press R2 100 } Scr = SkateInOrBail params = { FallingRight GrindBail = Airborne moveright = -5 movey = 5 } } ]
DropdownOnlyL2 = [ { Trigger = { Press L2 100 } Scr = SkateInOrBail params = { FallingLeft GrindBail = Airborne moveleft = 5 movey = 5 } } ]
DropdownR2andL2 = [ { Trigger = { HoldThree L2 R2 L2 } Scr = SkateInOrBail params = { FallingLeft GrindBail = Airborne moveright = -5 movey = 5 } } ]
DropdownOnlyR1 = [ { Trigger = { Press R1 100 } Scr = SkateInOrBail params = { FallingRight GrindBail = Airborne moveright = -5 movey = 5 } } ]
DropdownOnlyL1 = [ { Trigger = { Press L1 100 } Scr = SkateInOrBail params = { FallingLeft GrindBail = Airborne moveleft = 5 movey = 5 } } ]
DropdownR1andL1 = [ { Trigger = { HoldThree L1 R1 L1 } Scr = SkateInOrBail params = { FallingLeft GrindBail = Airborne moveright = -5 movey = 5 } } ]
DropdownR1orL1 = [
  { Trigger = { Press L1 100 } Scr = SkateInOrBail params = { FallingLeft GrindBail = Airborne moveleft = 5 movey = 5 } }
  { Trigger = { Press R1 100 } Scr = SkateInOrBail params = { FallingRight GrindBail = Airborne moveright = -5 movey = 5 } }
]
better4_control_dropdown_index = 1
better4_control_dropdown_value = DropdownOnlyR2
better4_control_dropdown = {
  id = better4_control_dropdown_id
  index_name = better4_control_dropdown_index
  value_name = better4_control_dropdown_value
  text = "Dropdown"
  ini_key = "Dropdown"
  options = [
    { text = "R2/L2" value = DropdownVanilla }
    { text = "R2" value = DropdownOnlyR2 }
    { text = "L2" value = DropdownOnlyL2 }
    { text = "R2+L2" value = DropdownR2andL2 }
    { text = "R1/L1" value = DropdownR1orL1 }
    { text = "R1" value = DropdownOnlyR1 }
    { text = "L1" value = DropdownOnlyL1 }
    { text = "R1+L1" value = DropdownR1andL1 }
  ]
}
better4_control_liptricks_index = 1
better4_control_liptricks_value = on
better4_control_liptricks = {
  id = better4_control_liptricks_id
  index_name = better4_control_liptricks_index
  value_name = better4_control_liptricks_value
  text = "Lip Tricks"
  ini_key = "LipTricks"
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
  change_script = better4_control_liptricks_change
}
script better4_control_liptricks_change
  switch better4_control_liptricks_value
  case off
    Change LipAllowAngle = 360
    Change LipAllowAngle_Override = 360
  case on
    Change LipAllowAngle = 15
    Change LipAllowAngle_Override = 60
  endswitch
endscript
better4_control_railspin_index = 1
better4_control_railspin_value = on
better4_control_railspin = {
  id = better4_control_railspin_id
  index_name = better4_control_railspin_index
  value_name = better4_control_railspin_value
  text = "Rail Spin"
  ini_key = "RailSpin"
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}
WallieplantTricks = [ { Trigger = { TapTwiceRelease Up X 500 } Scr = Trick_WallPlant } ]
WallieplantTricks_Single = [ { Trigger = { TapOnceRelease Up X 500 } Scr = Trick_WallPlant } ]
better4_control_wallieplant_index = 0
better4_control_wallieplant_value = WallieplantTricks
better4_control_wallieplant = {
  id = better4_control_wallieplant_id
  index_name = better4_control_wallieplant_index
  value_name = better4_control_wallieplant_value
  text = "Wallieplant"
  ini_key = "Wallieplant"
  options = [
    { text = "U+U+X" value = WallieplantTricks }
    { text = "U+X" value = WallieplantTricks_Single }
  ]
}
better4_control_wallspin_index = 1
better4_control_wallspin_value = on
better4_control_wallspin = {
  id = better4_control_wallspin_id
  index_name = better4_control_wallspin_index
  value_name = better4_control_wallspin_value
  text = "Wall Spin"
  ini_key = "WallSpin"
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}
better4_control_wallridebail_index = 1
better4_control_wallridebail_value = on
better4_control_wallridebail = {
  id = better4_control_wallridebail_id
  index_name = better4_control_wallridebail_index
  value_name = better4_control_wallridebail_value
  text = "Wallride Bail"
  ini_key = "WallrideBail"
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}
script better4_controls_init
  Printf "Initializing Better4 Controls"
  better4_control_init better4_control_spinkeys
  better4_control_init better4_control_spinetransfer
  better4_control_init better4_control_revert
  better4_control_init better4_control_powerslide
  better4_control_init better4_control_stancechange
  better4_control_init better4_control_jumptrick
  better4_control_init better4_control_manualspin
  better4_control_init better4_control_manualfloat
  better4_control_init better4_control_doublerevert
  better4_control_init better4_control_dropdown
  better4_control_init better4_control_liptricks
  better4_control_init better4_control_railspin
  better4_control_init better4_control_wallieplant
  better4_control_init better4_control_wallspin
  better4_control_init better4_control_wallridebail
endscript
script better4_control_init
   <index> = <index_name>
  GetIniInteger {
    section = better4_controls_ini_section
    key = <ini_key>
    fallback = <index>
    ValueName = new_index
  }
  GetArraySize <options>
  if ( <new_index> < 0 )
    Printf "Clamping %k=%i to %n" k = <ini_key> i = <index> n = <new_index>
     <new_index> = 0
  else
    if not ( <array_size> > <new_index> )
       <new_index> = ( <array_size> - 1 )
      Printf "Clamping %k=%i to %n" k = <ini_key> i = <index> n = <new_index>
    endif
  endif
  if not IntegerEquals a = <index> b = <new_index>
    better4_control_change needs_write <...>
  else
    better4_control_change <...>
  endif
endscript
script better4_control_cycle
   <index> = <index_name>
   <new_index> = ( <index> + <delta> )
  GetArraySize <options>
  if ( <new_index> < 0 )
     <new_index> = ( <new_index> + <array_size> )
    Printf "Wrapping around %k to %i" k = <ini_key> i = <new_index>
  else
    if not ( <array_size> > <new_index> )
       <new_index> = ( <new_index> - <array_size> )
      Printf "Wrapping around %k to %i" k = <ini_key> i = <new_index>
    endif
  endif
  better4_control_change needs_write <...>
endscript
script better4_control_change
  CastToInteger new_index
  Printf "Setting control %k=%i (%t)" k = <ini_key> i = <new_index> t = ( ( <options> [ <new_index> ] ).text )
  if GotParam needs_write
    SetIniInteger section = better4_controls_ini_section key = <ini_key> value = <new_index>
  endif
  ChangeGlobal Name = <index_name> value = <new_index>
  if GotParam value_name
    ChangeGlobal Name = <value_name> value = ( ( <options> [ <new_index> ] ).value )
  endif
  if GotParam change_script
    SpawnScript <change_script>
  endif
endscript
script better4_control_menu_item {
    font = small
    child_pos = { (210, 0) relative }
    rgba = [ 88 105 112 128 ]
    child_rgba = [ 88 105 112 128 ]
    just = [ Right top ]
    child_just = [ left top ]
    scale = 0.85
    child_scale = 0.85
    focus_script = do_scale_up
    unfocus_script = do_scale_down
    pad_choose_script = item_chosen
  }
   <index> = <index_name>
  CreateScreenElement {
    Type = TextElement
    parent = current_menu
    id = <id>
    font = <font>
    pos = <pos>
    rgba = <rgba>
    just = <just>
    text = <text>
    scale = <scale>
    event_handlers = [
      { focus <focus_script> params = <focus_params> }
      { unfocus <unfocus_script> params = <unfocus_params> }
      { pad_left better4_control_menu_cycle_left params = <...> }
      { pad_right better4_control_menu_cycle_right params = <...> }
    ]
  }
  CastToInteger index
   <value_text> = ( ( <options> [ <index> ] ).text )
  CreateScreenElement {
    Type = TextElement
    parent = <id>
    font = <font>
    pos = <child_pos>
    rgba = <child_rgba>
    just = <child_just>
    text = <value_text>
    scale = <child_scale>
  }
endscript
script better4_control_menu_cycle
  better4_control_cycle <...>
  CastToInteger index
   <value_text> = ( ( <options> [ <index> ] ).text )
  SetScreenElementProps {
    id = { <id> child = 0 }
    text = <value_text>
  }
endscript
script better4_control_menu_cycle_right
  better4_control_menu_cycle <...> delta = 1
endscript
script better4_control_menu_cycle_left
  better4_control_menu_cycle <...> delta = -1
endscript
