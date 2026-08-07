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
  get_key key = "Jumptrick" max = 3
  return jumptrick = <key_value>
endscript

