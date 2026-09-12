// from thug's `pressuretricks.qb'
// seems like there are some unused test pressure flips (uses 360 flip animation)

in_pressure = 0
PressureTricks2 = [ 
	{ Trigger = { AirTrickLogic , Square , Up , 300 } Trick_BS360PressureFlip } 
	{ Trigger = { AirTrickLogic , Square , Down , 300 } Trick_FS360PressureFlip } 
	{ Trigger = { AirTrickLogic , Square , Right , 300 } Trick_BS180PressureFlip } 
	{ Trigger = { AirTrickLogic , Square , Left , 300 } Trick_BSToeFlip } 
] 
Trick_PressureFlip  = { Scr = FlipTrick Params = { Name = "Pressure Flip" Ollie Speed = 1.5 Score = 100 Anim = _360Flip } } 
Trick_PressureFlip2 = { Scr = FlipTrick Params = { Name = "Pressure Flip" Speed = 1.5 Score = 100 Anim = _360Flip } } 
Trick_BS180PressureFlip = { Scr = FlipTrick Params = { Name = "BS 180 Flip" Score = 100 Anim = BS180PressureFlip BoardRotate FlipAfter } } 
Trick_BSToeFlip         = { Scr = FlipTrick Params = { Name = "BS Toe Flip " Score = 100 Anim = BSToeFlip BoardRotate } } 
Trick_BS360PressureFlip = { Scr = FlipTrick Params = { Name = "BS 360 Flip" Score = 200 Anim = BS360PressureFlip } } 
Trick_FS360PressureFlip = { Scr = FlipTrick Params = { Name = "FS 360 Flip" Score = 200 Anim = FS360PressureFlip } }

// pressure scripts from various thug qbs
script PressureOn
  Change in_pressure = 1
endscript

script PressureOff
  Change in_pressure = 0
endscript

script ApplyStanceToggle 
  if GotParam Toggle
    if InNollie 
      PressureOff 
      NollieOff 
    else 
      if ( in_pressure = 1 ) 
        PressureOff 
        NollieOn 
      else
        if ( better4_control_pressure_value = on ) 
          PressureOn
          NollieOff
        else
          PressureOff
          NollieOn
        endif
      endif 
    endif
  else // cycle logic for held l2/l1
    if GotParam Released
      if skater:InNollie
        PressureOff 
        NollieOff
      else
        PressureOff 
        NollieOn
      endif
    else
      if skater:InNollie
        PressureOff 
        NollieOn
        return DontDoAnimation = 1
      else
        if ( better4_control_pressure_value = on ) 
          PressureOn
          NollieOff
        else
          return DontDoAnimation = 1
        endif
      endif
    endif
  endif
endscript

script Toggle_Nollie_Pressure_States 
	if InNollie 
		NollieOff 
		PressureOn 
		SetException Ex = Ollied Scr = Ollie Params = { <...> } 
	else 
		if ( in_pressure = 1 ) 
			PressureOff 
			if GotParam Nollie 
				NollieOn 
				SetException Ex = Ollied Scr = NollieNoDisplay Params = { <...> } 
			else 
				NollieOff 
			endif 
		else 
			PressureOn 
		endif 
	endif 
endscript

script WaitWhilstChecking_ForPressure 
  if ( better4_control_pressure_value = on )
    if not ( better4_control_stancechange_index = 1 ) // not off
      switch better4_control_stancechange_index
        case 0 
          Button = L2 
        case 2
          Button = L1 
        case 3
          Button = L2
          ToggleOnRelease = 1
        case 4
          Button = L1
          ToggleOnRelease = 1
      endswitch
      begin 
        if held <Button> 
          if GotParam Nollie 
            Toggle_Nollie_Pressure_States Nollie 
          else 
            Toggle_Nollie_Pressure_States 
          endif 
          begin 
            if released <Button> 
              if ( <ToggleOnRelease> = 1 )
                if GotParam Nollie 
                  Toggle_Nollie_Pressure_States Nollie 
                else 
                  Toggle_Nollie_Pressure_States 
                endif
              endif
              break 
            endif 
            Wait 1 game frame 
          repeat 
        endif 
        Wait 1 game frame 
      repeat
    endif
  endif
endscript

script SetSkaterAirTricks // modified from thug (doesn't need wallplant or off board branches)
  if GotParam set_jumptricks
    if ( in_pressure = 1 ) 
      SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks Jumptricks JumpTricks0
    else 
      SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0
    endif
  else
    if ( in_pressure = 1 ) 
      SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks 
    else 
      SetQueueTricks special = SpecialTricks AirTricks 
    endif
  endif
endscript