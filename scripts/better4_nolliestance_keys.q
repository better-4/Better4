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
  GetIniInteger section = "In Game Controls" key = "NollieKey" ValueName = nollie_key
  if ( <nollie_key> > 1 )
    SetIniInteger section = "In Game Controls" key = "NollieKey" value = 0
    Printf "Invalid nollie key! Reset to vanilla (0)"
  endif
  if ( <nollie_key> < 0 )
   SetIniInteger section = "In Game Controls" key = "NollieKey" value = 0
   Printf "Invalid nollie key! Reset to vanilla (0)"
  endif
  return nollie_key = <nollie_key>
endscript