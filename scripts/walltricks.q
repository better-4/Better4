off = 0
on = 1
script WallRide
  get_toggle key = "WallSpin" fallback = on
  if ( <key_value> = off )
    RotateDisplay Y duration = 0.01 seconds StartAngle = 0.0 EndAngle = 0.0 SinePower = 0 RotationOffset = (0, 30, 0)
  endif
  ClearExceptions
  SetException Ex = Landed Scr = Land params = { NoBlend }
  SetException Ex = Ollied Scr = Wallie
  SetException Ex = GroundGone Scr = WallrideEnd
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  Vibrate actuator = 1 percent = 40
  Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
  if GotParam left
    Move X = 36
  else
    Move X = -36
  endif
  if BailIsOn
    SetState air
    Goto DoingTrickBail
  endif
  BailOff
  get_toggle key = "1TapBoostplant" fallback = off
  if ( <key_value> = on )
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
      PlayAnim Anim = WallRideBackLoop BlendPeriod = 0.1 cycle
    else
      SetTrickName 'FS Wallride'
      PlayAnim Anim = WallRideFrontTrans BlendPeriod = 0.0
      WaitAnimFinished
      PlayAnim Anim = WallRideFrontLoop BlendPeriod = 0.1 cycle
    endif
  else
    if Flipped
      SetTrickName 'FS Wallride'
      PlayAnim Anim = WallRideFrontTrans BlendPeriod = 0.0
      WaitAnimFinished
      PlayAnim Anim = WallRideFrontLoop BlendPeriod = 0.1 cycle
    else
      SetTrickName 'BS Wallride'
      PlayAnim Anim = WallRideBackTrans BlendPeriod = 0.0
      WaitAnimFinished
      PlayAnim Anim = WallRideBackLoop BlendPeriod = 0.1 cycle
    endif
  endif
  Display
endscript
script WallrideEnd
  BlendPeriodOut 0
  SetException Ex = Landed Scr = Land
  ClearExceptions
  if InAir
    Goto Airborne
  endif
endscript
script Wallie
  DoNextTrick
  Vibrate actuator = 1 percent = 50 duration = 0.1
  PlayAnim Anim = Ollie BlendPeriod = 0.0
  SetTrickName "Wallie"
  SetTrickScore 250
  InAirExceptions
  Display
  #"Jump"
  WaitAnimWhilstChecking
  Goto Airborne StretchTime = 10 BlendPeriod = 0
endscript
WallRideTricks =
[ { Trigger = { TapTwiceRelease Up X 500 } Scr = Trick_WallPlant } ]
WallRideTricks_Single =
[ { Trigger = { TapOnceRelease Up X 500 } Scr = Trick_WallPlant } ]
script Trick_WallPlant
  InAirExceptions
  Vibrate actuator = 1 percent = 50 duration = 0.1
  PlayAnim Anim = Boneless BlendPeriod = 0.0
  SetTrickName "Wallplant"
  SetTrickScore 500
  Display
  #"Jump" BonelessHeight
  WaitAnimWhilstChecking
  Goto Airborne StretchTime = 10 BlendPeriod = 0
endscript
script WallRideBail
endscript
