off = 0
on = 1
select_shift = 0
memcard_screenshots = 0
script UserSelectSelect
 if ( better4_misc_cambtn_behavior = on )
     ToggleSkaterCamMode skater = 0
      printf "free cam off"
 else
     ToggleViewMode
	 printf "free cam on"
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
