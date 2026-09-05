off = 0
on = 1
script WallRide
  if ( better4_control_wallspin_value = off )
    RotateDisplay Y duration = 0.01 seconds StartAngle = 0.0 EndAngle = 0.0 SinePower = 0 RotationOffset = (0, 30, 0)
  endif
  ClearExceptions
  SetException Ex = Landed Scr = WallrideLand params = { NoBlend }
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
    if ( better4_control_wallridebail_value = on )
      SetState Air
      Goto DoingTrickBail
    endif
  endif
  BailOff
  SetQueueTricks better4_control_wallieplant_value
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
script WallrideLand
  SetSkaterCamLerpReductionTimer time = 0
  if AbsolutePitchGreaterThan 60
    if PitchGreaterThan 60
      Goto PitchBail
    endif
  endif
  if SpeedGreaterThan 500
    if YawBetween (60, 120)
      Goto YawBail
    endif
  endif
  if RollGreaterThan 50
    Goto DoingTrickBail
  endif
  if GotParam NoBlend
    BlendPeriodOut 0
  endif
  if GotParam ReturnBacktoLipLand
  else
    if GotParam IgnoreAirTime
      Goto Land2
    else
      if AirTimeLessThan 0.2 seconds
        Goto Land2 Params = { LittleAir }
      else
        GotoPreserveParams Land2
      endif
    endif
  endif
endscript
script WallrideEnd
  BlendPeriodOut 0
  SetException Ex = Landed Scr = WallrideLand
  ClearExceptions
  if InAir
    Goto Airborne
  endif
endscript
script WallRideBail
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
  SetTrickName "WalliePlant"
  SetTrickScore 500
  Display
  #"Jump" BonelessHeight
  WaitAnimWhilstChecking
  Goto Airborne StretchTime = 10 BlendPeriod = 0
endscript

Wall_Bounce_Dont_Slow_Angle = 30
Physics_Disallow_Rewallpush_Duration = 800
Physics_Wallpush_Speed_Loss = 200
Physics_Wallpush_Min_Exit_Speed = 100
Physics_Wallpush_Vertical_Exit_Speed = 400

script LandSkaterTricks
	if currentscorepotgreaterthan 1500
		SpawnScript LandPointsSound
	endif
	CheckGapTricks
	ClearGapTricks NotInSameFrame
	ClearPanel_Landed
	ClearManualTrick
	OverrideCancelGround Off
	ResetSpin
	Obj_ClearFlag FLAG_SKATER_REVERTCHEESE
endscript

script WaitWhilstChecking
  GetStartTime
  begin
    DoNextTrick
    if GotParam AndManuals
      DoNextManualTrick
    endif
    Wait 1 GameFrame
    GetElapsedTime StartTime = <StartTime>
    if (<ElapsedTime> > <Duration>)
      break
    endif
  repeat
endscript

script Ground_Wallpush
  Printf "@@ GROUND_WALLPUSH"
  Init_Wallpush

  if Crouched
    PlayAnim Anim = Wallpush_Crouched BlendPeriod = 0
  else
    PlayAnim Anim = Wallpush_Standing BlendPeriod = 0
  endif

  BlendPeriodOut 0
  BoardRotateAfter
  FlipAfter

  SetTrickName 'Wallpush'
  SetTrickScore 10
  Display BlockSpin

  WaitWhilstChecking AndManuals Duration = Physics_Disallow_Rewallpush_Duration

  LandSkaterTricks
  WaitAnimWhilstChecking AndManuals

  if AnimEquals Wallpush_Standing
    if Crouched
      PlayAnim Anim = Idle
      DoNextTrick
      DoNextManualTrick
      Wait 1 GameFrame
    endif
  endif

  Goto OnGroundAi
endscript

script Manual_CancelWallpushEvent
  CancelWallpush
endscript

Wallpush_Trick = { Name = "Wallpush" Score = 10 NoBlend FlipAfter Anim = Wallpush_NoseManual BalanceAnim = Manual_Range BalanceAnim2 = Manual_Range2 OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks2 = ManualBranches ExtraTricks = FlatlandBranches AllowWallpush }
NoseWallpush_Trick = { Name = "Wallpush" Score = 10 NoBlend FlipAfter Anim = Wallpush_Manual BalanceAnim = NoseManual_Range BalanceAnim2 = NoseManual_Range2 Nollie OffMeterTop = ManualLand OffMeterBottom = NoseManualBail ExtraTricks2 = NoseManualBranches ExtraTricks = FlatlandBranches AllowWallpush }

script Manual_Wallpush
  Printf "@@ MANUAL_WALLPUSH"
  Init_Wallpush
  BlendPeriodOut 0
  if GotParam ToNoseManual
    Goto ManualLink Params = { NoseWallpush_Trick }
  else
    Goto ManualLink Params = { Wallpush_Trick }
  endif
endscript

script Init_Wallpush
  // BroadcastEvent Type = SkaterWallpush
  Vibrate Actuator = 1 Percent = 50 Duration = 0.15
endscript
