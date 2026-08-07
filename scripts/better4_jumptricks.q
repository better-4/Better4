JumptricksBoneless =
[ 
  { Trigger = { TapTwiceRelease Up X 500 } Scr = Boneless Params = { Name = 'Boneless' Anim = Boneless Score = 250 } } 
]
JumptricksFastplant =
[ 
  { Trigger = { TapTwiceRelease Up X 500 } Scr = Boneless Params = { Name = 'Fastplant' Anim = Fastplant Score = 250 } } 
]
JumptricksBeanplant =
[ 
  { Trigger = { TapTwiceRelease Up X 500 } Scr = Boneless Params = { Name = 'Beanplant' Anim = Beanplant Score = 250 } } 
]
JumptricksMikeVBoneless =
[
  { Trigger = { TapTwiceRelease Up X 500 } Scr = Boneless Params = { Name = "MikeV Boneless" Anim = _540Boneless Score = 300 } }
]
JumptricksTable =
[
  { key = 0 table = JumptricksBoneless }
  { key = 1 table = JumptricksBeanplant }
  { key = 2 table = JumptricksFastplant }
  { key = 3 table = JumptricksMikeVBoneless }
]

script get_jumptricks
  GetIniInteger section = "In Game Controls" key = "Jumptrick" ValueName = jumptrick
  if ( <jumptrick> > 3 )
    SetIniInteger section = "In Game Controls" key = "Jumptrick" value = 0
    Printf "Invalid jumptrick! Reset to vanilla (0)"
  endif
  if ( <jumptrick> < 0 )
   SetIniInteger section = "In Game Controls" key = "Jumptrick" value = 0
   Printf "Invalid jumptrick! Reset to vanilla (0)"
  endif
  return jumptrick = <jumptrick>
endscript

