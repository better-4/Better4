RevertsVanilla =
[
  { Trigger = { Press R2 200 } TrickSlot = ExtraSlot1 }
  { Trigger = { Press L2 200 } TrickSlot = ExtraSlot2 }
]
RevertsOnlyR2 =
[
  { Trigger = { Press R2 200 } TrickSlot = ExtraSlot1 }
]
RevertsOnlyL2 =
[
  { Trigger = { Press L2 200 } TrickSlot = ExtraSlot2 }
]
RevertsR2andL2 =
[
  { Trigger = { HoldThree L2 R2 L2 } TrickSlot = ExtraSlot1 }
]
RevertsOnlyR1 =
[
  { Trigger = { Press R1 200 } TrickSlot = ExtraSlot1 }
]
RevertsOnlyL1 =
[
  { Trigger = { Press L1 200 } TrickSlot = ExtraSlot2 }
]
RevertsR1andL1 =
[
  { Trigger = { HoldThree L1 R1 L1 } TrickSlot = ExtraSlot1 }
]
RevertsR1orL1 =
[
  { Trigger = { Press R1 200 } TrickSlot = ExtraSlot1 }
  { Trigger = { Press L1 200 } TrickSlot = ExtraSlot2 }
]

RevertKeyTable =
[
  { key = 0 table = RevertsVanilla }
  { key = 1 table = RevertsOnlyR2 }
  { key = 2 table = RevertsOnlyL2 }
  { key = 3 table = RevertsR2andL2 }
  { key = 4 table = RevertsOnlyR1 }
  { key = 5 table = RevertsOnlyL1 }
  { key = 6 table = RevertsR1andL1 }
  { key = 7 table = RevertsR1orL1 }
]

script revert_key_check_air
  get_key key = "RevertKey" max = 7
  SetExtraTricks tricks = ( ( RevertKeyTable [ <key_value> ] ).table ) Duration = 5
endscript

script revert_key_check_misc
  get_key key = "RevertKey" max = 7
  SetExtraTricks tricks = ( ( RevertKeyTable [ <key_value> ] ).table ) Duration = 20
endscript


