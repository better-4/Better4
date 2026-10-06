select_shift = 0
memcard_screenshots = 0

view_mode = 0

script UserSelectSelect
  LogInfo "UserSelectSelect"
  switch view_mode
  case 0
    Change view_mode = 1
    LogInfo "Changing to view mode 1"
  case 1
    Change view_mode = 0
    LogInfo "Changing to view mode 0"
  // case 2
  //   Change view_mode = 0
  //   LogInfo "Changing to view mode 0"
  endswitch
  SetViewMode view_mode
  // ToggleViewMode
  // ToggleSkaterCamMode skater = 0
endscript

script UserSelectSelect2
  if not IsNGC
    ToggleSkaterCamMode skater = 1
  endif
endscript

script UserSelectTriangle
  LogInfo "UserSelectTriangle"
  if NotCD
    ToggleRenderMode
  endif
endscript

script UserSelectSquare
  LogInfo "UserSelectSquare"
  ScreenShot
endscript

script UserSelectCircle
  LogInfo "UserSelectCircle"
  if NotCD
    ReLoadNodeArray
    Retry
  endif
endscript

script UserSelectStart
  LogInfo "UserSelectStart"
endscript

script UserSelectX
  LogInfo "UserSelectX"
  ToggleViewMode
endscript
