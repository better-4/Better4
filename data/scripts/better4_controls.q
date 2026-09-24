off = 0
on = 1

better4_controls_ini_section = "Controls"

// In Air

better4_control_spinkeys_index = 0
better4_control_spinkeys = {
  id = better4_control_spinkeys_id
  index_name = better4_control_spinkeys_index
  text = "Spin Keys"
  ini_key = "SpinKeys"
  help = "Change control bindings for in-air spins."
  options = [
    { text = "\be/\bf" } // L1/R1
    { text = "\bg/\bh" } // L2/R2
    { text = "\bf/\bh" } // R1/R2
    { text = "\be/\bg" } // L1/L2
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
  help = "Change control bindings for spine transfers."
  options = [
    { text = "\bg/\bh" } // L2/R2
    { text = "\bh" } // R2
    { text = "\bg" } // L2
    { text = "\bg+\bh" } // L2+R2
    { text = "\be/\bf" } // L1/R1
    { text = "\bf" } // R1
    { text = "\be" } // L1
    { text = "\be+\bf" } // L1+R1
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
  help = "Change control bindings for reverts."
  options = [
    { text = "\bh/\bg" value = RevertVanilla } // R2/L2
    { text = "\bh" value = RevertOnlyR2 } // R2
    { text = "\bg" value = RevertOnlyL2 } // L2
    { text = "\bh+\bg" value = RevertR2andL2 } // R2+L2
    { text = "\bf/\be" value = RevertR1orL1 } // R1/L1
    { text = "\bf" value = RevertOnlyR1 } // R1
    { text = "\be" value = RevertOnlyL1 } // L1
    { text = "\bf+\be" value = RevertR1andL1 } // R1+L1
  ]
}

// On Ground

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
  text = "Quickturn"
  ini_key = "Powerslide"
  help = "Change control bindings for quickturns."
  options = [
    { text = "\b4+\bf+\be" value = PowerslideVanilla } // Down+R1+L1
    { text = "\b4+\bh+\bg" value = PowerslideDownR2L2 } // Down+R2+L2
    { text = "\b4+\bh" value = PowerslideDownR2 } // Down+R2
    { text = "\b4+\bf" value = PowerslideDownR1 } // Down+R1
    { text = "\bh" value = PowerslideR2 } // R2
    { text = "\bg" value = PowerslideL2 } // L2
    { text = "\bf" value = PowerslideR1 } // R1
    { text = "\be" value = PowerslideL1 } // L1
  ]
}

StanceChangeL2 = [ { Trigger = { Press L2 20 } Scr = ToggleNollieRegular  Params = { Toggle } } ]
StanceChangeL1 = [ { Trigger = { Press L1 20 } Scr = ToggleNollieRegular  Params = { Toggle } } ]
StanceChangeL1Held = [
 { Trigger = { Press L1 20 } Scr = ToggleNollieRegular }
 { Trigger = { Release L1 20 } Scr = ToggleNollieRegular Params = { Released } } 
]
StanceChangeL2Held = [ 
{ Trigger = { Press L2 20 } Scr = ToggleNollieRegular }
{ Trigger = { Release L2 20 } Scr = ToggleNollieRegular Params = { Released } }
]

better4_control_stancechange_index = 0
better4_control_stancechange_value = StanceChangeL2
better4_control_stancechange = {
  id = better4_control_stancechange_id
  index_name = better4_control_stancechange_index
  value_name = better4_control_stancechange_value
  text = "Stance Change"
  ini_key = "StanceChange"
  help = "Change control bindings for stance change. 'H&R' = Hold and Release."
  options = [
    { text = "\bg" value = StanceChangeL2 } // L2
    { text = "Off" value = NoTricks }
    { text = "\be" value = StanceChangeL1 } // L1
    { text = "\bg (H&R)" value = StanceChangeL2Held }
    { text = "\be (H&R)" value = StanceChangeL1Held }
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
better4_control_manualspin_value = 0
better4_control_manualspin = {
  id = better4_control_manualspin_id
  index_name = better4_control_manualspin_index
  value_name = better4_control_manualspin_value
  text = "Manual Spin"
  ini_key = "ManualSpin"
  help = "Change control bindings for manual spins. 'R2' is backside-only."
  options = [
    { text = "\bh" value = 0 } // R2
    { text = "\bh/\bg" value = 1 } // R2/L2
    { text = "\bf/\be" value = 2 } // R1/L1
  ]
}

better4_control_wallpush_index = 0
better4_control_wallpush_value = off
better4_control_wallpush = {
  id = better4_control_wallpush_id
  index_name = better4_control_wallpush_index
  value_name = better4_control_wallpush_value
  text = "Wallpush"
  ini_key = "Wallpush"
  help = "Toggle wallpush (\b0) on or off."
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
  change_script = better4_control_wallpush_change
}

script better4_control_wallpush_change
  SetWallpushEnabled enabled = better4_control_wallpush_value
endscript

flatland_branches_spacewalk_on = [
  { Trigger = { inorder Square Circle 300 } Trick_AntiCasper }
  { Trigger = { inorder Square Triangle 300 } Trick_Casper }
  { Trigger = { inorder Circle Circle 300 } Trick_Handstand }
  { Trigger = { inorder Circle Square 300 } Trick_ToRail }
  { Trigger = { inorder Circle Triangle 300 } Trick_OneFootManual }
  { Trigger = { inorder Circle Triangle 300 } Trick_OneFootNosemanual }
  { Trigger = { TripleInOrder , Left , Right , Square , 500 } Trick_Spacewalk }
  { Trigger = { inorder Triangle Triangle 300 } Trick_Pogo }
  { Trigger = { inorder Triangle Circle 300 } Trick_SwitchFootPogo }
  { Trigger = { inorder Triangle Square 300 } Trick_Truckstand }
]
flatland_branches_spacewalk_off = [
  { Trigger = { inorder Square Circle 300 } Trick_AntiCasper }
  { Trigger = { inorder Square Triangle 300 } Trick_Casper }
  { Trigger = { inorder Circle Circle 300 } Trick_Handstand }
  { Trigger = { inorder Circle Square 300 } Trick_ToRail }
  { Trigger = { inorder Circle Triangle 300 } Trick_OneFootManual }
  { Trigger = { inorder Circle Triangle 300 } Trick_OneFootNosemanual }
  { Trigger = { inorder Triangle Triangle 300 } Trick_Pogo }
  { Trigger = { inorder Triangle Circle 300 } Trick_SwitchFootPogo }
  { Trigger = { inorder Triangle Square 300 } Trick_Truckstand }
]

better4_control_spacewalk_index = 0
better4_control_spacewalk_value = off
better4_control_spacewalk = {
  id = better4_control_spacewalk_id
  index_name = better4_control_spacewalk_index
  value_name = better4_control_spacewalk_value
  text = "Spacewalk"
  ini_key = "Spacewalk"
  help = "Toggle spacewalk (\b6 \b5 \b1) on or off."
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
  change_script = better4_control_spacewalk_change
}

script better4_control_spacewalk_change
  switch better4_control_spacewalk_value
  case off
    Change FlatLandBranches = flatland_branches_spacewalk_off
  case on
    Change FlatLandBranches = flatland_branches_spacewalk_on
  endswitch
endscript

better4_control_manualfloat_index = 0
better4_control_manualfloat_value = off
better4_control_manualfloat = {
  id = better4_control_manualfloat_id
  index_name = better4_control_manualfloat_index
  value_name = better4_control_manualfloat_value
  text = "Manual Float"
  ini_key = "ManualFloat"
  help = "Toggle PS2-exclusive manual float glitches on or off."
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
  help = "Toggle whether a second revert is required after dropping down into a revert."
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}

better4_control_revertrecovery_index = 0
better4_control_revertrecovery_value = off
better4_control_revertrecovery = {
  id = better4_control_revertrecovery_id
  index_name = better4_control_revertrecovery_index
  value_name = better4_control_revertrecovery_value
  text = "Revert Recovery"
  ini_key = "RevertRecovery"
  help = "Change the speed at which the skater is actionable after finishing a revert in the air."
  options = [
    { text = "Vanilla" value = off }
    { text = "Fast" value = on }
  ]
}

// On Rails

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
  help = "Change control bindings for dropdowns."
  options = [
    { text = "\bh/\bg" value = DropdownVanilla } // R2/L2
    { text = "\bh" value = DropdownOnlyR2 } // R2
    { text = "\bg" value = DropdownOnlyL2 } // L2
    { text = "\bh+\bg" value = DropdownR2andL2 } // R2+L2
    { text = "\bf/\be" value = DropdownR1orL1 } // R1/L1
    { text = "\bf" value = DropdownOnlyR1 } // R1
    { text = "\be" value = DropdownOnlyL1 } // L1
    { text = "\bf+\be" value = DropdownR1andL1 } // R1+L1
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
  help = "Toggle lip tricks on or off."
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
  help = "Toggle whether manual spins carry into a grind."
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}

better4_control_pressure_index = 0
better4_control_pressure_value = off
better4_control_pressure = {
  id = better4_control_pressure_id
  index_name = better4_control_pressure_index
  value_name = better4_control_pressure_value
  text = "Pressure Stance"
  ini_key = "PressureStance"
  help = "Toggle pressure flips on or off."
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}

// Wallrides

WallieplantTricks = [ { Trigger = { TapTwiceRelease Up X 500 } Scr = Trick_WallPlant } ]
WallieplantTricks_Single = [ { Trigger = { TapOnceRelease Up X 500 } Scr = Trick_WallPlant } ]

better4_control_wallieplant_index = 0
better4_control_wallieplant_value = WallieplantTricks
better4_control_wallieplant = {
  id = better4_control_wallieplant_id
  index_name = better4_control_wallieplant_index
  value_name = better4_control_wallieplant_value
  text = "WalliePlant"
  ini_key = "Wallieplant"
  help = "Change control bindings for WalliePlants."
  options = [
    { text = "\b7+\b7+\b3" value = WallieplantTricks } // Up+Up+X
    { text = "\b7+\b3" value = WallieplantTricks_Single } // Up+X
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
  help = "Toggle whether manual spins carry into a wallride."
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
  help = "Toggle whether doing a trick into a wallride causes the skater to bail. 'Off' enables THUG1-style boostplants."
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}

// MISC

better4_control_boardscuff_index = 1
better4_control_boardscuff_value = on
better4_control_boardscuff = {
  id = better4_control_boardscuff_id
  index_name = better4_control_boardscuff_index
  value_name = better4_control_boardscuff_value
  text = "Board Scuff"
  ini_key = "BoardScuff"
  help = "Toggle board scuff on or off."
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}

better4_control_pauseonunfocus_index = 0
better4_control_pauseonunfocus = {
  id = better4_control_pauseonunfocus_id
  index_name = better4_control_pauseonunfocus_index
  text = "Pause On Unfocus"
  ini_key = "PauseOnUnfocus"
  help = "Toggle whether the game pauses when the window is unfocused."
  options = [
    { text = "Off" }
    { text = "On" }
  ]
  change_script = better4_control_pauseonunfocus_change
}

script better4_control_pauseonunfocus_change
  SetPauseOnUnfocus index = better4_control_pauseonunfocus_index
endscript

ButtonsFontPC = "better4/ButtonsPC"
ButtonsFontPS2 = "better4/ButtonsPS2"
ButtonsFontXbox = "better4/ButtonsXbox"
// ButtonsFontNGC = "ButtonsNGC"

better4_control_buttonsfont_index = 0
better4_control_buttonsfont_value = ButtonsFontPC
better4_control_buttonsfont = {
  id = better4_control_buttonsfont_id
  index_name = better4_control_buttonsfont_index
  value_name = better4_control_buttonsfont_value
  text = "Buttons Font"
  ini_key = "ButtonsFont"
  help = "Change which button glyphs are displayed."
  options = [
    { text = "PC" value = ButtonsFontPC }
    { text = "PS2" value = ButtonsFontPS2 }
    { text = "Xbox" value = ButtonsFontXbox }
    // { text = "NGC" value = ButtonsFontNGC }
  ]
  change_script = better4_control_buttonsfont_change
}

prev_buttonsfont = better4_control_buttonsfont_value
script better4_control_buttonsfont_change
  Printf "Changing buttonfont from %p to %n" p = prev_buttonsfont n = better4_control_buttonsfont_value
  UnloadFont prev_buttonsfont
  LoadFont better4_control_buttonsfont_value buttons_font
  Change prev_buttonsfont = better4_control_buttonsfont_value
endscript

better4_control_fov_index = 28
better4_control_fov_value = 90
better4_control_fov = {
  id = better4_control_fov_id
  index_name = better4_control_fov_index
  value_name = better4_control_fov_value
  text = "FOV"
  ini_key = "FOV"
  help = "Change the field of view."
  options = [
    { text = "60" value = 60 }
    { text = "61" value = 61 }
    { text = "62" value = 62 }
    { text = "63" value = 63 }
    { text = "64" value = 64 }
    { text = "65" value = 65 }
    { text = "66" value = 66 }
    { text = "67" value = 67 }
    { text = "68" value = 68 }
    { text = "69" value = 69 }
    { text = "70" value = 70 }
    { text = "71" value = 71 }
    { text = "72" value = 72 }
    { text = "73" value = 73 }
    { text = "74" value = 74 }
    { text = "75" value = 75 }
    { text = "76" value = 76 }
    { text = "77" value = 77 }
    { text = "78" value = 78 }
    { text = "79" value = 79 }
    { text = "80" value = 80 }
    { text = "81" value = 81 }
    { text = "82" value = 82 }
    { text = "83" value = 83 }
    { text = "84" value = 84 }
    { text = "85" value = 85 }
    { text = "86" value = 86 }
    { text = "87" value = 87 }
    { text = "88" value = 88 }
    { text = "89" value = 89 }
    { text = "90" value = 90 }
    { text = "91" value = 91 }
    { text = "92" value = 92 }
    { text = "93" value = 93 }
    { text = "94" value = 94 }
    { text = "95" value = 95 }
    { text = "96" value = 96 }
    { text = "97" value = 97 }
    { text = "98" value = 98 }
    { text = "99" value = 99 }
    { text = "100" value = 100 }
    { text = "101" value = 101 }
    { text = "102" value = 102 }
    { text = "103" value = 103 }
    { text = "104" value = 104 }
    { text = "105" value = 105 }
    { text = "106" value = 106 }
    { text = "107" value = 107 }
    { text = "108" value = 108 }
    { text = "109" value = 109 }
    { text = "110" value = 110 }
    { text = "111" value = 111 }
    { text = "112" value = 112 }
    { text = "113" value = 113 }
    { text = "114" value = 114 }
    { text = "115" value = 115 }
    { text = "116" value = 116 }
    { text = "117" value = 117 }
    { text = "118" value = 118 }
    { text = "119" value = 119 }
    { text = "120" value = 120 }
  ]
  change_script = better4_change_fov
}

script better4_change_fov
  SetScreen Angle = better4_control_fov_value
endscript

better4_control_aspect_ratio_index = 0
better4_control_aspect_ratio_value = 0
better4_control_aspect_ratio = {
  id = better4_control_aspect_ratio_id
  index_name = better4_control_aspect_ratio_index
  value_name = better4_control_aspect_ratio_value
  text = "Aspect Ratio"
  ini_key = "AspectRatio"
  help = "Change the aspect ratio. 'Auto' calculates the optimal aspect ratio from the window resolution."
  options = [
    { text = "Auto" value = 0 } // Doesn't use value
    { text = "16:9" value = 1.77778 }
    { text = "16:10" value = 1.6 }
    { text = "4:3" value = 1.33333 }
  ]
  change_script = better4_change_aspect_ratio
}

script better4_change_aspect_ratio
  if (better4_control_aspect_ratio_value = 0)
    AutoAspectRatio
  else
    SetScreen Aspect = better4_control_aspect_ratio_value
  endif
endscript

better4_control_extratrick_sound_index = 0
better4_control_extratrick_sound_value = THPS4
better4_control_extratrick_sound = {
  id = better4_control_extratrick_sound_id
  index_name = better4_control_extratrick_sound_index
  value_name = better4_control_extratrick_sound_value
  text = "Extra Trick Sound"
  ini_key = "ExtraTrickSound"
  help = "Change which sound is played when performing extra tricks (e.g. double-tap tricks)."
  options = [
    { text = "THPS4" value = THPS4 }
    { text = "THUG" value = THUG }
    { text = "Off" value = off }	
  ]
}

better4_control_chat_size_index = 2
better4_control_chat_size_value = 2
better4_control_chat_size = {
  id = better4_control_chat_size_id
  index_name = better4_control_chat_size_index
  value_name = better4_control_chat_size_value
  text = "Chat Size"
  ini_key = "ChatSize"
  help = "Change the size of the player chat window."
  options = [
    { text = "Extra Small" value = 0 }
    { text = "Small" value = 1 }
    { text = "Default" value = 2 }
    { text = "Big" value = 3 }
    { text = "Extra Big" value = 4 }
  ]
  change_script = better4_change_chat_size
}

script better4_change_chat_size
  switch better4_control_chat_size_value
  case 0
    console_destroy
	  change better4_padding = 0.25
    change better4_chat_scale = 0.3
	  printf "ex. small"
  case 1
    console_destroy
    change better4_padding = 0.45
    change better4_chat_scale = 0.5
	  printf "small"
  case 2
    console_destroy
	  change better4_padding = 0.65
    change better4_chat_scale = 0.7
	  printf "default"
  case 3
    console_destroy
	  change better4_padding = 0.85
    change better4_chat_scale = 1.0
	  printf "big"
  case 4
    console_destroy
	  change better4_padding = 1.0
    change better4_chat_scale = 1.2
	  printf "ex. big"
  endswitch
endscript

better4_control_chat_duration_index = 5
better4_control_chat_duration_value = 30
better4_control_chat_duration = {
  id = better4_control_chat_duration_id
  index_name = better4_control_chat_duration_index
  value_name = better4_control_chat_duration_value
  text = "Chat Duration"
  ini_key = "ChatDuration"
  help = "Change the duration player chat messages stay on screen."
  options = [
    { text = "5 Seconds" value = 5 }
    { text = "10 Seconds" value = 10 }
    { text = "15 Seconds" value = 15 }
    { text = "20 Seconds" value = 20 }
    { text = "25 Seconds" value = 25 }
    { text = "30 Seconds" value = 30 }
  ]
}

better4_control_trickstring_index = 3
better4_control_trickstring_value = 1.0
better4_control_trickstring = {
  id = better4_control_trickstring_id
  index_name = better4_control_trickstring_index
  value_name = better4_control_trickstring_value
  text = "Trick String"
  ini_key = "TrickString"
  help = "Change the size of the trick string."
  options = [
    { text = "Off" value = off }
    { text = "Small" value = 0.33 }
    { text = "Medium" value = 0.67 }
    { text = "Large" value = 1.0 }
  ]
  change_script = better4_change_trickstring
}

better4_trickstring_shadow_offs_small = (0.33, 0.33)
better4_trickstring_shadow_offs_medium = (0.67, 0.67)
better4_trickstring_shadow_offs_large = (1, 1)

better4_trickstring_shadow_offs = better4_trickstring_shadow_offs_large
better4_trickstring_internal_scale = 0.7

script better4_change_trickstring
  switch better4_control_trickstring_index
  case 0
    Change better4_trickstring_shadow_offs = better4_trickstring_shadow_offs_large
    Change better4_trickstring_internal_scale = 0.7
  case 1
    Change better4_trickstring_shadow_offs = better4_trickstring_shadow_offs_small
    Change better4_trickstring_internal_scale = 0.23331 // 0.7 * 0.3333
  case 2
    Change better4_trickstring_shadow_offs = better4_trickstring_shadow_offs_medium
    Change better4_trickstring_internal_scale = 0.46669 // 0.7 * 0.6667
  case 3
    Change better4_trickstring_shadow_offs = better4_trickstring_shadow_offs_large
    Change better4_trickstring_internal_scale = 0.7
  endswitch
  // Player 1
  if ScreenElementExists id = the_trick_text
    SetScreenElementProps {
      id = the_trick_text
      internal_scale = better4_trickstring_internal_scale
      shadow_offs = better4_trickstring_shadow_offs
    }
  endif
  // Player 2
  if ScreenElementExists id = ( the_trick_text + 1 )
    SetScreenElementProps {
      id = ( the_trick_text + 1 )
      internal_scale = better4_trickstring_internal_scale
      shadow_offs = better4_trickstring_shadow_offs
    }
  endif
endscript

better4_control_scorepot_index = 3
better4_control_scorepot_value = 1.0
better4_control_scorepot = {
  id = better4_control_scorepot_id
  index_name = better4_control_scorepot_index
  value_name = better4_control_scorepot_value
  text = "Score Pot"
  ini_key = "ScorePot"
  help = "Change the size of the score pot (directly above the trick string)."
  options = [
    { text = "Off" value = off }
    { text = "Small" value = 0.33 }
    { text = "Medium" value = 0.67 }
    { text = "Large" value = 1.0 }
  ]
  change_script = better4_change_scorepot
}

better4_scorepot_pos_small = (287, -2)
better4_scorepot_pos_medium = (287, 0)
better4_scorepot_pos_large = (287, 2)
better4_scorepot_pos = better4_scorepot_pos_large

script better4_change_scorepot
  switch better4_control_trickstring_index
  case 0
    Change better4_scorepot_pos = better4_scorepot_pos_large
  case 1
    Change better4_scorepot_pos = better4_scorepot_pos_small
  case 2
    Change better4_scorepot_pos = better4_scorepot_pos_medium
  case 3
    Change better4_scorepot_pos = better4_scorepot_pos_large
  endswitch
  // Player 1
  if ScreenElementExists id = the_score_pot_text
    DoScreenElementMorph {
      id = the_score_pot_text
      scale = better4_control_scorepot_value
      pos = better4_scorepot_pos
    }
  endif
  // Player 2
  if ScreenElementExists id = ( the_score_pot_text + 1 )
    DoScreenElementMorph {
      id = ( the_score_pot_text + 1 )
      scale = better4_control_scorepot_value
      pos = better4_scorepot_pos
    }
  endif
endscript

better4_control_specialmeter_index = 3
better4_control_specialmeter_value = 1.0
better4_control_specialmeter = {
  id = better4_control_specialmeter_id
  index_name = better4_control_specialmeter_index
  value_name = better4_control_specialmeter_value
  text = "Special Meter"
  ini_key = "SpecialMeter"
  help = "Change the size of the special meter and total score."
  options = [
    { text = "Off" value = off }
    { text = "Small" value = 0.33 }
    { text = "Medium" value = 0.67 }
    { text = "Large" value = 1.0 }
  ]
  change_script = better4_change_specialmeter
}

script better4_change_specialmeter
  // Player 1
  if ScreenElementExists id = the_score
    DoScreenElementMorph {
      id = the_score
      scale = better4_control_specialmeter_value
    }
  endif
  // Player 2
  if ScreenElementExists id = ( the_score + 1 )
    DoScreenElementMorph {
      id = ( the_score + 1 )
      scale = better4_control_specialmeter_value
    }
  endif
endscript

better4_control_perfectlanding_index = 3
better4_control_perfectlanding_value = 1.0
better4_control_perfectlanding = {
  id = better4_control_perfectlanding_id
  index_name = better4_control_perfectlanding_index
  value_name = better4_control_perfectlanding_value
  text = "Perfect Landing"
  ini_key = "PerfectLanding"
  help = "Change the size of perfect/sloppy landing messages."
  options = [
    { text = "Off" value = off }
    { text = "Small" value = 0.33 }
    { text = "Medium" value = 0.67 }
    { text = "Large" value = 1.0 }
  ]
  change_script = better4_change_perfectlanding
}

better4_perfectlanding_pos_small = (110, 350)
better4_perfectlanding_pos_medium = (110, 355)
better4_perfectlanding_pos_large = (110, 360)
better4_perfectlanding_pos = better4_perfectlanding_pos_large

script better4_change_perfectlanding
  // Scale is set by `perfect_style` and `sloppy_style` scripts; only need to set pos
  switch better4_control_perfectlanding_index
  case 0
    Change better4_perfectlanding_pos = better4_perfectlanding_pos_large
  case 1
    Change better4_perfectlanding_pos = better4_perfectlanding_pos_small
  case 2
    Change better4_perfectlanding_pos = better4_perfectlanding_pos_medium
  case 3
    Change better4_perfectlanding_pos = better4_perfectlanding_pos_large
  endswitch
  // perfect2 is the second line, we move it up to account for smaller text
  if ScreenElementExists id = perfect2
    DoScreenElementMorph {
      id = perfect2
      pos = better4_perfectlanding_pos
    }
  endif
endscript

better4_control_menudemo_index = 1
better4_control_menudemo_value = on
better4_control_menudemo = {
  id = better4_control_menudemo_id
  index_name = better4_control_menudemo_index
  value_name = better4_control_menudemo_value
  text = "Menu Demo"
  ini_key = "MenuDemo"
  help = "Toggle the main menu demo on or off."
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}

better4_control_respawn_on_newrun_index = 1
better4_control_respawn_on_newrun_value = on
better4_control_respawn_on_newrun = {
  id = better4_control_respawn_on_newrun_id
  index_name = better4_control_respawn_on_newrun_index
  value_name = better4_control_respawn_on_newrun_value
  text = "Respawn On New Run"
  ini_key = "RespawnOnNewRun"
  help = "Toggle whether you respawn upon game start/end."
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}

better4_control_updatedcollision_index = 1
better4_control_updatedcollision = {
  id = better4_control_updatedcollision_id
  index_name = better4_control_updatedcollision_index
  text = "Updated Collision"
  ini_key = "Updated Collision"
  help = "Toggle whether to use updated collision for THPS4 levels. Takes effect on next level change."
  options = [
    { text = "Off" }
    { text = "On" }
  ]
  change_script = better4_control_updatedcollision_change
}

script better4_control_updatedcollision_change
  SetUpdatedCollision index = better4_control_updatedcollision_index
endscript

better4_control_boostplant_index = 1
better4_control_boostplant_value = on
better4_control_boostplant = {
  id = better4_control_boostplant_id
  index_name = better4_control_boostplant_index
  value_name = better4_control_boostplant_value
  text = "Boostplant"
  ini_key = "Boostplant"
  help = "Toggle whether boostplants are enabled or disabled."
  options = [
    { text = "Off" value = off }
    { text = "On" value = on }
  ]
}

script better4_controls_init
  // TODO (ellie): Figure out why ForEachIn doesn't work with array of names
  better4_control_init better4_control_spinkeys
  better4_control_init better4_control_spinetransfer
  better4_control_init better4_control_revert
  better4_control_init better4_control_powerslide
  better4_control_init better4_control_stancechange
  better4_control_init better4_control_jumptrick
  better4_control_init better4_control_manualspin
  better4_control_init better4_control_wallpush
  better4_control_init better4_control_spacewalk
  better4_control_init better4_control_manualfloat
  better4_control_init better4_control_doublerevert
  better4_control_init better4_control_dropdown
  better4_control_init better4_control_liptricks
  better4_control_init better4_control_railspin
  better4_control_init better4_control_wallieplant
  better4_control_init better4_control_wallspin
  better4_control_init better4_control_wallridebail
  better4_control_init better4_control_revertrecovery
  better4_control_init better4_control_boardscuff
  better4_control_init better4_control_pauseonunfocus
  better4_control_init better4_control_buttonsfont
  better4_control_init better4_control_fov
  better4_control_init better4_control_aspect_ratio
  better4_control_init better4_control_chat_size
  better4_control_init better4_control_chat_duration
  better4_control_init better4_control_pressure
  better4_control_init better4_control_extratrick_sound
  better4_control_init better4_control_trickstring
  better4_control_init better4_control_scorepot
  better4_control_init better4_control_specialmeter
  better4_control_init better4_control_perfectlanding
  better4_control_init better4_control_menudemo
  better4_control_init better4_control_respawn_on_newrun
  better4_control_init better4_control_updatedcollision
  better4_control_init better4_control_boostplant
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
    if GotParam ini_key
      Printf "Wrapping around %k to %i" k = <ini_key> i = <new_index>
    endif
  else
    if not ( <array_size> > <new_index> )
      <new_index> = ( <new_index> - <array_size> )
      if GotParam ini_key
        Printf "Wrapping around %k to %i" k = <ini_key> i = <new_index>
      endif
    endif
  endif
  better4_control_change needs_write <...>
endscript

script better4_control_change
  CastToInteger new_index
  if GotParam ini_key
    Printf "Setting control %k=%i (%t)" k = <ini_key> i = <new_index> t = ( ( <options> [ <new_index> ] ).text )
    if GotParam needs_write
      SetIniInteger section = better4_controls_ini_section key = <ini_key> value = <new_index>
    endif
  endif
  ChangeGlobal Name = <index_name> value = <new_index>
  if GotParam value_name
    ChangeGlobal Name = <value_name> value = ( ( <options> [ <new_index> ] ).value )
  endif
  if GotParam change_script
    <change_script>
  endif
endscript
