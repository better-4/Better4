PowerSlideVanilla =
[
  { Trigger = { HoldThree R1 L1 Down } Scr = ToggleSwitchRegular Params = { PowerSlide } }
]
PowerSlideDownR2L2 =
[
  { Trigger = { HoldThree R2 L2 Down } Scr = ToggleSwitchRegular Params = { PowerSlide } }
]
PowerSlideDownR2 =
[
  { Trigger = { HoldThree Down R2 R2 } Scr = ToggleSwitchRegular Params = { PowerSlide } }
]
PowerSlideDownR1 =
[
  { Trigger = { HoldThree Down R1 R1 } Scr = ToggleSwitchRegular Params = { PowerSlide } }
]
PowerSlideR2 =
[
  { Trigger = { HoldThree R2 R2 R2 } Scr = ToggleSwitchRegular Params = { PowerSlide } }
]
PowerSlideL2 =
[
  { Trigger = { HoldThree L2 L2 L2 } Scr = ToggleSwitchRegular Params = { PowerSlide } }
]
PowerSlideR1 =
[
  { Trigger = { HoldThree R1 R1 R1 } Scr = ToggleSwitchRegular Params = { PowerSlide } }
]
PowerSlideL1 =
[
  { Trigger = { HoldThree L1 L1 L1 } Scr = ToggleSwitchRegular Params = { PowerSlide } }
]

PowerSlideKeyTable =
[
  { key = 0 table = PowerSlideVanilla }
  { key = 1 table = PowerSlideDownR2L2 }
  { key = 2 table = PowerSlideDownR2 }
  { key = 3 table = PowerSlideDownR1 }
  { key = 4 table = PowerSlideR2 }
  { key = 5 table = PowerSlideL2 }
  { key = 6 table = PowerSlideR1 }
  { key = 7 table = PowerSlideL1 }
]

script get_powerslide_key
  GetIniInteger section = "In Game Controls" key = "PowerSlideKey" ValueName = powerslide_key
  if ( <powerslide_key> > 7 )
    SetIniInteger section = "In Game Controls" key = "PowerSlideKey" value = 0
    Printf "Invalid powerslide binding! Reset to vanilla (0)"
  endif
  if ( <powerslide_key> < 0 )
   SetIniInteger section = "In Game Controls" key = "PowerSlideKey" value = 0
   Printf "Invalid powerslide binding! Reset to vanilla (0)"
  endif
  return powerslide_key = <powerslide_key>
endscript

