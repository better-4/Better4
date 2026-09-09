
script TwoWayLoopCheck
  if not InAir
    if Obj_FlagSet FLAG_SKATER_INLOOP
      Printf "In the loop and so making you land"
      Obj_ClearFlag FLAG_SKATER_INLOOP
      SetRollingFriction #"default"
      LockVelocityDirection Off
      if DoingTrick
        SetSlomo 1
        kill_blur
        MakeSkaterGoto Facesmash
      else
        SetLandedFromVert
        SetSlomo 1
        kill_blur
        MakeSkaterGoto Land
      endif
    else
      Obj_SetFlag FLAG_SKATER_INLOOP
      MakeSkaterGoto LoopGapStart
    endif
  endif
endscript
script LoopGapStart
  OnGroundExceptions
  SetException Ex = Ollied Scr = LoopGapOllie
  SetException Ex = Landed Scr = Land
  OnExceptionRun LoopGapOut
  LockVelocityDirection On
  SetSkaterAirTricks
  SetExtraGrindTricks special = SpecialGrindTricks GrindTricks
  SetManualTricks special = SpecialManualTricks ManualTricks
  PlayAnim Anim = AirIdle Cycle NoRestart
  begin
    DoNextTrick
    Obj_GetSpeed
    if ( <speed> < 25 )
      SetState air
      LockVelocityDirection Off
      create_panel_message text = "Going too slow!!!" pos = (320, 200)
      Obj_ClearFlag FLAG_SKATER_INLOOP
      if not DoingTrick
        Goto Airborne
      endif
    endif
    Wait 1 game frame
  repeat
endscript
script LoopGapOllie
  PlayJumpSound
  PlayAnim Anim = Ollie
  Goto LoopGapStart
endscript
script LoopGapOut
  LockVelocityDirection Off
endscript
script Loop Name = 'Loop Balance' Score = 1000 InitAnim = CrouchIdle FromAirAnim = ManualFromAir BalanceAnim = CrouchIdle OffMeterTop = ManualBail OffMeterBottom = ManualBail
  ClearExceptions
  if InAir
    Goto LoopOllie
  endif
  Obj_SetFlag FLAG_SKATER_INLOOP
  OnExceptionRun LoopException
  SetException Ex = Ollied Scr = LoopOllie
  ClearLipCombos
  SetException Ex = GroundGone Scr = LoopOllie
  SetException Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called
  SetException Ex = OffMeterTop Scr = NoseManualBail
  SetException Ex = OffMeterBottom Scr = ManualBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetQueueTricks NoTricks
  SetManualTricks NoTricks
  StartBalanceTrick
  Vibrate Actuator = 1 Percent = 25
  SetRollingFriction 2
  PlayAnim Anim = Loop_Range wobble
  SetTrickName <Name>
  SetTrickScore 5000
  Display Blockspin
  begin
    if SpeedLessThan 400
      Obj_ClearFlag FLAG_SKATER_INLOOP
      if InSplitScreenGame
      else
        LaunchPanelMessage "&C1Not Enough Speed" properties = panelcombo
      endif
      LoopOllie
    endif
    WaitOneGameFrame
  repeat
endscript
script LoopException
  Obj_ClearFlag FLAG_SKATER_INLOOP
endscript
script LoopOllie
  ClearExceptions
  Obj_ClearFlag FLAG_SKATER_INLOOP
  if AbsolutePitchGreaterThan 80
    Move y = 13
    SetSpeed 0
  endif
  SetState air
  InBail
  ClearExceptions
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetException Ex = Landed Scr = BackwardFaceSlam
  SetQueueTricks NoTricks
  DisablePlayerInput AllowCameraControl
  PlayAnim Anim = StretchtoFlailingFall BlendPeriod = 0.3
  ClearGapTricks
  ClearPanel_Bailed
  if AbsolutePitchGreaterThan 40
    SetSpeed 1
  endif
  WaitAnim 90 Percent
  SwitchOffBoard
  WaitAnimFinished
  PlayAnim Anim = FlailingFall Cycle
endscript
script LoopLand
  if Obj_FlagSet FLAG_SKATER_INLOOP
    StopBalanceTrick
    if InSplitScreenGame
    else
      LaunchPanelMessage "Loop Bonus!" properties = panelcombo
    endif
    PlaySound HUD_specialtrickAA Vol = 500
    SetLandedFromVert
    Goto Land Params = { RevertTime = 30 }
  else
    Goto LoopOllie
  endif
endscript
