script get_key
  GetIniInteger section = "In Game Controls" key = <key> ValueName = key_value fallback = 0
  if ( <key_value> > <max> )
    SetIniInteger section = "In Game Controls" key = <key> value = 0
    <key_value> = 0
  endif
  if ( <key_value> < 0 )
   SetIniInteger section = "In Game Controls" key = <key> value = 0
   <key_value> = 0
  endif
  return key_value = <key_value>
endscript

script get_key_cycle
  GetIniInteger section = "In Game Controls" key = <key> ValueName = key_value fallback = 0
  <key_value> = ( <key_value> + <mode> )
  if ( <key_value> > <max> )
    SetIniInteger section = "In Game Controls" key = <key> value = 0
    <key_value> = 0
  endif
  if ( <key_value> < 0 )
   SetIniInteger section = "In Game Controls" key = <key> value = 0
   <key_value> = <max>
  endif
  return key_value = <key_value>
endscript

script get_toggle
  GetIniInteger section = "In Game Toggles" key = <key> ValueName = key_value fallback = <fallback>
  if ( <key_value> > 1 )
    SetIniInteger section = "In Game Toggles" key = <key> value = 1
    <key_value> = 1
  endif
  if ( <key_value> < 0 )
   SetIniInteger section = "In Game Toggles" key = <key> value = 1
   <key_value> = 1
  endif
  return key_value = <key_value>
endscript