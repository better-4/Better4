ToggleNollieL2 =
[
  { Trigger = { Press L2 20 } Scr = ToggleNollieRegular }
]

ToggleNollieKeyTable =
[
  {key = 0 table = ToggleNollieL2}
  {key = 1 table = NoTricks}
]

script get_nollie_key
  get_key key = "NollieKey" max = 1
  return nollie_key = <key_value>
endscript