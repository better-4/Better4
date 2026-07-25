
script WallRide
  ClearExceptions
  SetException Ex = Landed Scr = Land params = { NoBlend }
  SetException Ex = Ollied Scr = Wallie
  SetException Ex = GroundGone Scr = WallrideEnd
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  Vibrate actuator = 1 percent = 40
  Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
  if GotParam left
    move X = 36
  else
    move X = -36
  endif
  if BailIsOn
    SetState air
    goto DoingTrickBail
  endif
  BailOff
  if GetGlobalFlag flag = WALLPLANT_INPUT_FLAG
    SetQueueTricks WallRideTricks_Single
  else
    SetQueueTricks WallRideTricks
  endif
  NollieOff
  SetTrickScore 200
  PlayCessSound
  if GotParam left
    if Flipped
      SetTrickName 'BS Wallride'
      PlayAnim Anim = WallRideBackTrans BlendPeriod = 0.0
      WaitAnimFinished
      PlayAnim Anim = WallRideBackLoop BlendPeriod = 0.1 Cycle
    else
      SetTrickName 'FS Wallride'
      PlayAnim Anim = WallRideFrontTrans BlendPeriod = 0.0
      WaitAnimFinished
      PlayAnim Anim = WallRideFrontLoop BlendPeriod = 0.1 Cycle
    endif
  else
    if Flipped
      SetTrickName 'FS Wallride'
      PlayAnim Anim = WallRideFrontTrans BlendPeriod = 0.0
      WaitAnimFinished
      PlayAnim Anim = WallRideFrontLoop BlendPeriod = 0.1 Cycle
    else
      SetTrickName 'BS Wallride'
      PlayAnim Anim = WallRideBackTrans BlendPeriod = 0.0
      WaitAnimFinished
      PlayAnim Anim = WallRideBackLoop BlendPeriod = 0.1 Cycle
    endif
  endif
  display
endscript
script WallrideEnd
  BlendPeriodOut 0
  SetException Ex = Landed Scr = Land
  ClearExceptions
  if Inair
    goto Airborne
  endif
endscript
script Wallie
  DoNextTrick
  Vibrate actuator = 1 percent = 50 Duration = 0.1
  PlayAnim Anim = ollie BlendPeriod = 0.0
  SetTrickName "Wallie"
  SetTrickScore 250
  InAirExceptions
  display
  #"Jump"
  WaitAnimWhilstChecking
  goto Airborne StretchTime = 10 BlendPeriod = 0
endscript
WallRideTricks =
[ { Trigger = { TapTwiceRelease up X 500 } Scr = Trick_WallPlant } ]
WallRideTricks_Single =
[ { Trigger = { TapOnceRelease up X 500 } Scr = Trick_WallPlant } ]
script Trick_WallPlant
  InAirExceptions
  Vibrate actuator = 1 percent = 50 Duration = 0.1
  PlayAnim Anim = Boneless BlendPeriod = 0.0
  SetTrickName "Wallplant"
  SetTrickScore 500
  display
  #"Jump" BonelessHeight
  WaitAnimWhilstChecking
  goto Airborne StretchTime = 10 BlendPeriod = 0
endscript
script WallRideBail
endscript
