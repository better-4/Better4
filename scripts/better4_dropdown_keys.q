GrindReleaseVanilla =
[
  { Trigger = { Press L2 100 } Scr = SkateInOrBail Params = { FallingLeft GrindBail = Airborne moveleft = 5 movey = 5 } }
  { Trigger = { Press R2 100 } Scr = SkateInOrBail Params = { FallingRight GrindBail = Airborne moveright = -5 movey = 5 } }
]
GrindReleaseOnlyR2 =
[
  { Trigger = { Press R2 100 } Scr = SkateInOrBail Params = { FallingRight GrindBail = Airborne moveright = -5 movey = 5 } }
]
GrindReleaseOnlyL2 =
[
  { Trigger = { Press L2 100 } Scr = SkateInOrBail Params = { FallingLeft GrindBail = Airborne moveleft = 5 movey = 5 } }
]
GrindReleaseR2andL2 =
[
  { Trigger = { HoldThree L2 R2 L2 } Scr = SkateInOrBail Params = { FallingLeft GrindBail = Airborne moveright = -5 movey = 5 } }
]
GrindReleaseOnlyR1 =
[
  { Trigger = { Press R1 100 } Scr = SkateInOrBail Params = { FallingRight GrindBail = Airborne moveright = -5 movey = 5 } }
]
GrindReleaseOnlyL1 =
[
  { Trigger = { Press L1 100 } Scr = SkateInOrBail Params = { FallingLeft GrindBail = Airborne moveleft = 5 movey = 5 } }
]
GrindReleaseR1andL1 =
[
  { Trigger = { HoldThree L1 R1 L1 } Scr = SkateInOrBail Params = { FallingLeft GrindBail = Airborne moveright = -5 movey = 5 } }
]
GrindReleaseR1orL1 =
[
  { Trigger = { Press L1 100 } Scr = SkateInOrBail Params = { FallingLeft GrindBail = Airborne moveleft = 5 movey = 5 } }
  { Trigger = { Press R1 100 } Scr = SkateInOrBail Params = { FallingRight GrindBail = Airborne moveright = -5 movey = 5 } }
]

GrindReleaseKeyTable =
[
  { key = 0 table = GrindReleaseVanilla }
  { key = 1 table = GrindReleaseOnlyR2 }
  { key = 2 table = GrindReleaseOnlyL2 }
  { key = 3 table = GrindReleaseR2andL2 }
  { key = 4 table = GrindReleaseR1orL1 }
  { key = 5 table = GrindReleaseOnlyR1 }
  { key = 6 table = GrindReleaseOnlyL1 }
  { key = 7 table = GrindReleaseR1andL1 }
]

script dropdown_key_check
  verify_dropdown_key 
  SetExtraTricks ( ( GrindReleaseKeyTable [ <dropdown_key> ] ).table )
endscript

script dropdown_key_check_extra_tricks
  verify_dropdown_key 
  if GotParam Extratricks
    SetExtraTricks <Extratricks> ignore = <Name> ( ( GrindReleaseKeyTable [ <dropdown_key> ] ).table )
  else
    SetExtraTricks ( ( GrindReleaseKeyTable [ <dropdown_key> ] ).table )
  endif
endscript

script verify_dropdown_key
  GetIniInteger section = "In Game Controls" key = "DropdownKey" ValueName = dropdown_key
  if ( <dropdown_key> > 7 )
    SetIniInteger section = "In Game Controls" key = "DropdownKey" value = 0
    Printf "Invalid dd binding! Reset to vanilla (0)"
  endif
  if ( <dropdown_key> < 0 )
   SetIniInteger section = "In Game Controls" key = "DropdownKey" value = 0
   Printf "Invalid dd binding! Reset to vanilla (0)"
  endif
  return dropdown_key = <dropdown_key>
endscript