select_shift = 0
memcard_screenshots = 0
script UserSelectSelect
  if not IsNGC
    ToggleSkaterCamMode skater = 0
  endif
endscript
script UserSelectSelect2
  if not IsNGC
    ToggleSkaterCamMode skater = 1
  endif
endscript
script UserSelectTriangle
  if NotCD
    ToggleRenderMode
  endif
endscript
script UserSelectSquare
  ScreenShot
endscript
script UserSelectCircle
  if NotCD
    ReLoadNodeArray
    Retry
  endif
endscript
script UserSelectStart
endscript
script UserSelectX
  ToggleViewMode
endscript
