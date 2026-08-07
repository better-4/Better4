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
  get_key key = "DropdownKey" max = 7
  SetExtraTricks ( ( GrindReleaseKeyTable [ <key_value> ] ).table )
endscript

script dropdown_key_check_extra_tricks
  get_key key = "DropdownKey" max = 7
  if GotParam Extratricks
    SetExtraTricks <Extratricks> ignore = <Name> ( ( GrindReleaseKeyTable [ <key_value> ] ).table )
  else
    SetExtraTricks ( ( GrindReleaseKeyTable [ <key_value> ] ).table )
  endif
endscript
