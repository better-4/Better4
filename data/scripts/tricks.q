
ExcludeFromSkaterDebug =
[
  waitonegameframe
  waitanimfinished
  waitanimwhilstchecking
  just_coasting
  DoCrouch_slope
  SetClothesInactive
  SetClothesActive
  ShutDownWindyBone
  PlayLeftRightTennisAnim
  PlayBrakeAnim
  CessBrake
]
script SkaterInit
  Obj_StopStream
  Unhide
  UnPausePhysics
  NotInBail
  BashOff
  NotifyBailDone
  Obj_KillSpawnedScript name = BailBoardControl
  SwitchOnBoard
  SetSkaterCamLerpReductionTimer time = 0
  ClearLipCombos
  AllowRailTricks
  Obj_KillSpawnedScript name = SetUpLipCombo
  ClearTrickQueues
  ResetLandedFromVert
  BlendPeriodOut 0
  Obj_AttachFrame bone = "head"
  SetTags state = skater_none racemode = none
  if LevelIs Load_Alc
    Obj_StopSound ShoppingCartLoop
  endif
  if not GotParam NoEndRun
    SetException Ex = RunHasEnded Scr = EndOfRun
    SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
  endif
  StopBalanceTrick
  if Skitching
    StopSkitch
    SetState ground
  endif
  VibrateOff
  ClearSkaterFlags
  Printf "Clearing skaters flags =============="
  SetExceptionThatPreservesBalanceTrick MadeOtherSkaterBail
  Obj_KillSpawnedScript name = WindyClothes
  Obj_SpawnScript WindyClothes
  SetBoneTransActive bone = breast_cloth_zz 0
  if not GotParam NoAnims
    PlayAnim Anim = Idle
  endif
  SetBalanceTrickParams ManualParams
  Obj_KillSpawnedScript name = BloodSmall
  Obj_KillSpawnedScript name = BloodSplat
  Obj_KillSpawnedScript name = SkaterBloodOn
  ResetSkaterParticleSystems
  LockVelocityDirection Off
  CanBrakeOn
  RestoreAutokick
  OverrideLimits max = 1000 friction = 0 time = 0
  CleanUpExtraProps
  SetSlomo 1
  kill_blur
  KillExtraTricks
  EnableSkaterRotation
  if SkaterIsNamed jenna
    SwitchOffAtomic shoes
  endif
  SetSkaterCamOverride heading = 0 tilt = 0 time = 0.000001 zoom = 1
  Wait 1 game frame
  ClearSkaterCamOverride
  ClearPanel_Landed
  if IsBetterObserving
    create_observer_ui
    skater:PausePhysics
    skater:NetDisablePlayerInput
  endif
  if not GotParam ReturnControl
    Goto OnGroundAI
  endif
endscript
script CleanUpExtraProps
  if GameModeEquals is_career
    if LevelIs Load_Alc
      Kill prefix = "ago_ShoppingCart"
    endif
  endif
endscript
script ClientSkaterInit
  SwitchOffAtomic special_item
endscript
script SkaterRetryScript
  SkaterInit
endscript
Exceptions =
[
  GoalHasEnded
  RunHasEnded
  SkaterCollideBail
  MadeOtherSkaterBail
  Ollied
  GroundGone
  Landed
  OntoRail
  OffRail
  FlailHitWall
  FlailLeft
  FlailRight
  OffMeterTop
  OffMeterBottom
  WallRideLeft
  WallRideRight
  WallRideBail
  CarBail
  CarPlant
  WonGame
  LostGame
  Skitched
]
script OnGroundExceptions
  if GotParam NoClear
  else
    ClearExceptions
  endif
  if GotParam NoEndRun
  else
    SetException Ex = RunHasEnded Scr = EndOfRun
    SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
  endif
  SetException Ex = GroundGone Scr = GroundGone
  SetException Ex = Ollied Scr = Ollie
  SetException Ex = FlailHitWall Scr = FlailHitWall
  SetException Ex = FlailLeft Scr = FlailLeft
  SetException Ex = FlailRight Scr = FlailRight
  SetException Ex = CarPlant Scr = CarPlant
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetException Ex = Skitched Scr = Skitch
  SetException Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail
  SetQueueTricks better4_control_powerslide_value better4_control_jumptrick_value GroundTricks better4_control_stancechange_value
  SetExtraGrindTricks special = SpecialGrindTricks GrindTricks
  SetManualTricks special = SpecialManualTricks GroundManualTricks
  SetTags state = skater_onground
  VibrateOff
  SwitchOnBoard
  EnablePlayerInput
  BailOff
  BashOff
  SetRollingFriction #"default"
  CanSpin
  AllowRailTricks
  SetSkaterCamLerpReductionTimer time = 0
  Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
  BloodParticlesOff
  if GotParam NoEndRun
  else
    ResetLandedFromVert
  endif
endscript
script OnGroundExceptions_NoClear
  OnGroundExceptions NoClear
endscript
script OnGroundExceptions_NoEndRun
  OnGroundExceptions NoEndRun
endscript
script InAirExceptions
  ClearExceptions
  SetException Ex = Landed Scr = Land
  SetException Ex = WallRideLeft Scr = WallRide params = { Left }
  SetException Ex = WallRideRight Scr = WallRide params = { Right }
  SetException Ex = WallRideBail Scr = WallRideBail
  SetException Ex = CarPlant Scr = CarPlant CallInsteadofGoto
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetException Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBailAir CallInsteadofGoto
  SetQueueTricks special = SpecialTricks AirTricks
  SetExtraGrindTricks special = SpecialGrindTricks GrindTricks
  SetManualTricks special = SpecialManualTricks ManualTricks
  SetTags state = skater_inair
  VibrateOff
  EnablePlayerInput
  BailOff
  BashOff
  SetRollingFriction #"default"
  SetState Air
  CanSpin
  OverrideCancelGround Off
endscript
script ClearTrickQueues
  ClearTrickQueue
  ClearManualTrick
  ClearExtraGrindTrick
endscript
script OnGroundAI Coasting = 0 Pushes = 0
  if not OnGround
    SetState ground
  endif
  OnGroundExceptions
  SetRollingFriction #"default"
  EnablePlayerInput
  NollieOff
  begin
    GetSlope
    if LeftPressed
      if Crouched
        if Flipped
          if AnimEquals CrouchTurnRightIdle
          else
            PlayAnim Anim = CrouchTurnRight NoRestart
            if AnimFinished
              PlayAnim Anim = CrouchTurnRightIdle Cycle NoRestart
            endif
          endif
        else
          if AnimEquals CrouchTurnLeftIdle
          else
            PlayAnim Anim = CrouchTurnLeft NoRestart
            if AnimFinished
              PlayAnim Anim = CrouchTurnLeftIdle Cycle NoRestart
            endif
          endif
        endif
      else
        if Flipped
          if AnimEquals TurnRightIdle
          else
            PlayAnim Anim = TurnRight NoRestart
            if AnimFinished
              PlayAnim Anim = TurnRightIdle Cycle NoRestart
            endif
          endif
        else
          if AnimEquals TurnLeftIdle
          else
            PlayAnim Anim = TurnLeft NoRestart
            if AnimFinished
              PlayAnim Anim = TurnLeftIdle Cycle NoRestart
            endif
          endif
        endif
      endif
    else
      if RightPressed
        if Crouched
          if Flipped
            if AnimEquals CrouchTurnLeftIdle
            else
              PlayAnim Anim = CrouchTurnLeft NoRestart
              if AnimFinished
                PlayAnim Anim = CrouchTurnLeftIdle Cycle NoRestart
              endif
            endif
          else
            if AnimEquals CrouchTurnRightIdle
            else
              PlayAnim Anim = CrouchTurnRight NoRestart
              if AnimFinished
                PlayAnim Anim = CrouchTurnRightIdle Cycle NoRestart
              endif
            endif
          endif
        else
          if Flipped
            if AnimEquals TurnLeftIdle
            else
              PlayAnim Anim = TurnLeft NoRestart
              if AnimFinished
                PlayAnim Anim = TurnLeftIdle Cycle NoRestart
              endif
            endif
          else
            if AnimEquals TurnRightIdle
            else
              PlayAnim Anim = TurnRight NoRestart
              if AnimFinished
                PlayAnim Anim = TurnRightIdle Cycle NoRestart
              endif
            endif
          endif
        endif
      else
        if Crouched
          DoCrouch_slope Slope = <Slope> ChangeInSlope = <ChangeInSlope>
        else
          if Braking
            if SpeedLessThan 1
              PlayBrakeAnim
              if HeldLongerThan Button = down 2 second
                Goto HandBrake
              endif
            else
              if HeldLongerThan Button = down 0.2 second
                CessBrake
              else
                PlayBrakeAnim
              endif
            endif
          else
            if ( <Slope> > PUSH_IF_SLOPE )
              if AutoKickIsOff
                if ShouldMongo
                  PlayAnim Anim = MongoPush NoRestart
                  waitanimfinished
                  PlayAnim Anim = MongoPushCycle NoRestart
                  waitanimfinished
                  PlayAnim Anim = Idle Cycle NoRestart
                else
                  PlayAnim random( @Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5  ) NoRestart
                  waitanimfinished
                  PlayAnim Anim = Idle Cycle NoRestart
                endif
              else
                if ShouldMongo
                  if AnimEquals MongoPushCycle
                    PlayAnim Anim = MongoPushCycle Cycle NoRestart
                  else
                    PlayAnim Anim = MongoPush NoRestart
                    waitanimfinished
                    PlayAnim Anim = MongoPushCycle Cycle NoRestart
                  endif
                else
                  just_coasting
                endif
              endif
            else
              if AutoKickIsOff
                if Held square
                  if ShouldMongo
                    PlayAnim Anim = MongoPushCycle Cycle NoRestart
                  else
                    PlayAnim random( @Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5  ) NoRestart
                    waitanimfinished
                    PlayAnim Anim = Idle Cycle NoRestart
                  endif
                else
                  if AnimEquals [ PushCycle MongoPushCycle MongoPush ]
                  else
                    PlayAnim Anim = Idle Cycle NoRestart
                  endif
                endif
              else
                just_coasting
              endif
            endif
          endif
        endif
      endif
    endif
    DoNextTrick
    DoNextManualTrick
    waitonegameframe
    if InNetGame
      CheckforNetBrake
    endif
  repeat
endscript
crouch_wobble_params = {
  WobbleAmpA = { (10.1, 10.1) STATS_RAILBALANCE }
  WobbleAmpB = { (10.1, 10.1) STATS_RAILBALANCE }
  WobbleK1 = { (20, 20) STATS_RAILBALANCE }
  WobbleK2 = { (10, 10) STATS_RAILBALANCE }
  SpazFactor = { (1, 1) STATS_RAILBALANCE }
}
script DoCrouch_slope
  if ( ( <ChangeInSlope> > 5 ) or ( <ChangeInSlope> < -5 ) )
    if AnimEquals [ CrouchBumpUp CrouchBumpDown ]
      if AnimFinished
        if ( <ChangeInSlope> > 5 )
          PlayAnim Anim = CrouchBumpUp Blendperiod = 0.3
        else
          PlayAnim Anim = CrouchBumpDown Blendperiod = 0.3
        endif
      endif
    else
      if ( <ChangeInSlope> > 5 )
        PlayAnim Anim = CrouchBumpUp Blendperiod = 0.3
      else
        PlayAnim Anim = CrouchBumpDown Blendperiod = 0.3
      endif
    endif
  else
    if not AnimEquals [ CrouchIdle CrouchIdle2 CrouchIdle3 CrouchBumpUp CrouchBumpDown ]
      CrouchFrameFrom = randomrange(1, 40)
      CrouchFrameTo = <CrouchFrameFrom>
      CrouchFrameFrom = ( <CrouchFrameFrom> -8 )
      if ( <CrouchFrameFrom> < 1 )
        CrouchFrameFrom = 1
      endif
      CrouchFrameTo = ( <CrouchFrameTo> + 8 )
      if ( <CrouchFrameTo> > 40 )
        CrouchFrameTo = 40
      endif
      PlayAnim random( @Anim = CrouchIdle @Anim = CrouchIdle2 @Anim = CrouchIdle3  ) Cycle Blendperiod = 0.3
    else
      if AnimFinished
        PlayAnim Anim = CrouchIdle
      endif
    endif
  endif
endscript
SLOPE_CUTOFF = 40
script DoCrouch_Slope_old
  if not GotParam Slope
    Slope = 0
  endif
  if ( <Slope> > SLOPE_CUTOFF )
     <Slope> = SLOPE_CUTOFF
  endif
  if ( <Slope> < ( 0 - SLOPE_CUTOFF ) )
     <Slope> = ( 0 - SLOPE_CUTOFF )
  endif
  CrouchFrame = ( 1 + ( SLOPE_CUTOFF -1 ) * ( ( SLOPE_CUTOFF - <Slope> ) / ( 2 * SLOPE_CUTOFF ) ) )
  if not GotParam CrouchFrame
  endif
  Printf "CrouchFrame=%g" g = <CrouchFrame>
  PlayAnim Anim = CrouchLean_Range From = <CrouchFrame> To = ( <CrouchFrame> + 1 )
endscript
PUSH_IF_SLOPE = 2
script just_coasting
  GetSlope
  if ( <Slope> > PUSH_IF_SLOPE )
    if AnimEquals [ PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5 ]
      if AnimFinished
        DoAPush
      endif
    else
      PlayAnim Anim = Idle NoRestart
    endif
  else
    if AnimEquals [ PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5 MongoPushCycle ]
      if AnimFinished
        RandomPush = randomrange(1, 2)
        if ( <RandomPush> < 2 )
          DoAPush
        else
          PlayAnim Anim = Idle NoRestart
        endif
      endif
    else
      if AnimEquals Idle
        if AnimFinished
          RandomPush = randomrange(1, 3)
          if ( <RandomPush> < 2 )
            DoAPush
          else
            PlayAnim Anim = Idle
          endif
        endif
      else
        PlayAnim Anim = Idle NoRestart
      endif
    endif
  endif
endscript
script DoAPush
  if AnimEquals [ PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5 MongoPushCycle ]
    if AnimFinished
      if not ShouldMongo
        PlayAnim random( @Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5  ) NoRestart
      else
        PlayAnim Anim = MongoPushCycle NoRestart
      endif
    endif
  else
    if not ShouldMongo
      PlayAnim random( @Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5  ) NoRestart
    else
      PlayAnim Anim = MongoPushCycle NoRestart
    endif
  endif
endscript
script CheckforNetBrake
  if InNetGame
    GetPreferenceChecksum pref_type = network auto_brake
    if ( <checksum> = boolean_true )
      if ScreenElementExists id = current_menu_anchor
        Goto NetBrake
      endif
      if ScreenElementExists id = dialog_box_anchor
        Goto NetBrake
      endif
      if ScreenElementExists id = controller_unplugged_dialog_anchor
        Goto NetBrake
      endif
    endif
  endif
endscript
script PlayBrakeAnim
  if ShouldMongo
    PlayAnim Anim = SlowDownBrake_Mongo NoRestart
  else
    PlayAnim Anim = SlowDownBrake NoRestart
  endif
endscript
script CessBrake
  ClearEventBuffer
  if SpeedGreaterThan 300
    PlayAnim Anim = CessSlide180_FS From = Start To = 28 Speed = 1.2
    WaitAnim frame 5
    PlayCessSound
    WaitAnim frame 25
    PlayAnim Anim = CessSlide180_FS From = 27 To = Start Speed = 1.2
    waitanimfinished
  endif
  PlayBrakeAnim
endscript
script SlalomBrake
  BigBrake
endscript
script BigBrake
  ClearExceptions
  DisablePlayerInput
  WaitOnGround
  SetRollingFriction 20
  StopSkitch
  StopBalanceTrick
  CessBrake
  Wait 1 second
  Goto SkaterInit
endscript
script NetBrake
  if InBail
    if not IsBetterObserving
      SkaterInit ReturnControl NoAnims
    endif
  endif
  StopBalanceTrick
  SetRollingFriction 20
  OnExceptionRun NetBrake_out
  CessBrake
  begin
    if SpeedLessThan 5
      HandBrake
      if ShouldMongo
        PlayAnim Anim = MongoBrakeIdle Cycle NoRestart
      else
        PlayAnim Anim = BrakeIdle Cycle NoRestart
      endif
    endif
    if ObjectExists id = current_menu_anchor
      waitonegameframe
    else
      if ObjectExists id = dialog_box_anchor
        waitonegameframe
      else
        if ObjectExists id = controller_unplugged_dialog_anchor
          waitonegameframe
        else
          break
        endif
      endif
    endif
  repeat
  SetRollingFriction #"default"
  if SpeedLessThan 5
    Goto HandBrake
  else
    if InNollie
      Goto OnGroundNollieAI
    else
      Goto OnGroundAI
    endif
  endif
endscript
script NetBrake_out
  SetRollingFriction #"default"
endscript
script HandBrake
  ClearEventBuffer
  OnExceptionRun BrakeDone
  SetRollingFriction 100
  if ShouldMongo
    PlayAnim Anim = NewBrake_Mongo
  else
    PlayAnim Anim = NewBrake
  endif
  begin
    DoNextTrick
    if AnimFinished
      break
    endif
    if Crouched
      break
    endif
    Wait 1 game frame
  repeat
  if ShouldMongo
    Flip
    BlendPeriodOut 0
  endif
  begin
    if AutoKickIsOff
      if Held square
        waitonegameframe
        break
      endif
    else
      if Held up
        break
      endif
      if Crouched
        break
      endif
    endif
    if RightPressed
      if Flipped
        PlayAnim Anim = NewBrakeTurnLeft Cycle NoRestart
      else
        PlayAnim Anim = NewBrakeTurnRight Cycle NoRestart
      endif
    else
      if LeftPressed
        if Flipped
          PlayAnim Anim = NewBrakeTurnRight Cycle NoRestart
        else
          PlayAnim Anim = NewBrakeTurnLeft Cycle NoRestart
        endif
      else
        if AnimEquals [ NewBrakeIdle NewBrakeIdle2 NewBrakeIdle3 NewBrakeIdle4 NewBrakeIdle5 NewBrakeIdle6 NewBrakeIdle7 NewBrakeIdle8 ]
          if AnimFinished
            PlayBrakeIdle
          endif
        else
          PlayBrakeIdle
        endif
      endif
    endif
    waitonegameframe
    DoNextTrick
    DoNextManualTrick
  repeat
  PlayAnim Anim = NewBrakeIdleToIdle
  Wait 0.25 seconds
  SetRollingFriction #"default"
  waitanimwhilstchecking
  if InNollie
    Goto OnGroundNollieAI
  else
    Goto OnGroundAI
  endif
endscript
script PlayBrakeIdle
  PlayAnim randomnorepeat( @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle2
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle3
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle4
  @Anim = NewBrakeIdle5
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle6
  @Anim = NewBrakeIdle7
  @Anim = NewBrakeIdle8
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle ) 
endscript
script BrakeDone
  SetRollingFriction #"default"
endscript
script OnGroundNollieAI
  SetState ground
  EnablePlayerInput
  ClearExceptions
  OnGroundExceptions
  SetException Ex = Ollied Scr = Nollie
  SetQueueTricks better4_control_powerslide_value better4_control_jumptrick_value GroundTricks better4_control_stancechange_value
  SetManualTricks special = SpecialManualTricks GroundManualTricks
  NollieOn
  begin
    if LeftPressed
      if Crouched
        if Flipped
          PlayAnim Anim = NollieCrouchTurnRight NoRestart
        else
          PlayAnim Anim = NollieCrouchTurnLeft NoRestart
        endif
      else
        if Flipped
          PlayAnim Anim = NollieSkatingTurnRight NoRestart
        else
          PlayAnim Anim = NollieSkatingTurnLeft NoRestart
        endif
      endif
    else
      if RightPressed
        if Crouched
          if Flipped
            PlayAnim Anim = NollieCrouchTurnLeft NoRestart
          else
            PlayAnim Anim = NollieCrouchTurnRight NoRestart
          endif
        else
          if Flipped
            PlayAnim Anim = NollieSkatingTurnLeft NoRestart
          else
            PlayAnim Anim = NollieSkatingTurnRight NoRestart
          endif
        endif
      else
        if Crouched
          PlayAnim Anim = NollieCrouchIdle Cycle NoRestart
        else
          if Braking
            if SpeedLessThan 1
              PlayAnim Anim = NollieSkatingIdle NoRestart
              if HeldLongerThan Button = down 2 second
                Goto HandBrake
              endif
            else
              if HeldLongerThan Button = down 0.2 second
                CessBrake
              else
                PlayBrakeAnim
              endif
            endif
          else
            if CanKick
              if AutoKickIsOff
                if ShouldMongo
                  if AnimEquals MongoPushCycle
                    PlayAnim Anim = MongoPushCycle NoRestart
                  else
                    PlayAnim Anim = MongoPush NoRestart
                    waitanimfinished
                    PlayAnim Anim = MongoPushCycle NoRestart
                  endif
                else
                  PlayAnim Anim = PushCycle NoRestart
                endif
              else
                if ShouldMongo
                  if AnimEquals MongoPushCycle
                    PlayAnim Anim = MongoPushCycle Cycle NoRestart
                  else
                    PlayAnim Anim = MongoPush NoRestart
                    waitanimfinished
                    PlayAnim Anim = MongoPushCycle Cycle NoRestart
                  endif
                else
                  PlayAnim Anim = PushCycle Cycle NoRestart
                endif
              endif
            else
              if AnimFinished
                PlayAnim Anim = NollieSkatingIdle Cycle NoRestart
              endif
            endif
          endif
        endif
      endif
    endif
    DoNextTrick
    DoNextManualTrick
    CheckforNetBrake
    waitonegameframe
  repeat
endscript
script FlailExceptions
  NollieOff
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetException Ex = RunHasEnded Scr = EndOfRun
  SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
  ClearTrickQueue
  ClearManualTrick
  ClearEventBuffer
  CheckGapTricks
  ClearGapTricks
  ClearPanel_Landed
  SpawnClothingLandScript
endscript
script FlailHitWall
  Goto FlailLeft
endscript
script FlailLeft
  FlailExceptions
  FlailVibrate
  if Crouched
    if SpeedGreaterThan 400
      PlayAnim random( @Anim = FlaiLleftCrouched @Anim = FlailLeftCrouched2  ) Blendperiod = 0.03
    else
      PlayAnim Anim = FlailLeftCrouched_small Blendperiod = 0.03
    endif
  else
    PlayAnim random( @Anim = FlailLeft @Anim = FlailLeft2  ) Blendperiod = 0.03
  endif
  waitanimfinished
  Goto OnGroundAI
endscript
script FlailRight
  FlailExceptions
  FlailVibrate
  if Crouched
    if SpeedGreaterThan 400
      PlayAnim random( @Anim = FlailRightCrouched @Anim = FlailLeftCrouched2  ) Blendperiod = 0.03
    else
      PlayAnim Anim = FlailRightCrouched_small Blendperiod = 0.03
    endif
  else
    PlayAnim random( @Anim = FlailRight @Anim = FlailRight2  ) Blendperiod = 0.03
  endif
  waitanimfinished
  Goto OnGroundAI
endscript
script FlailVibrate
  if SpeedGreaterThan 600
    Vibrate Actuator = 1 Percent = 80 Duration = 0.25
  else
    Vibrate Actuator = 1 Percent = 50 Duration = 0.15
  endif
endscript
script GroundGone
  InAirExceptions
  SetException Ex = Ollied Scr = Ollie
  ClearTricksFrom better4_control_powerslide_value GroundTricks better4_control_stancechange_value
  if GotParam NoBoneless
    SetQueueTricks special = SpecialTricks AirTricks
  else
    SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0
  endif
  if Crouched
    PlayAnim Anim = Crouch2InAir
  else
    PlayAnim Anim = Idle2InAir
  endif
  begin
    if AirTimeGreaterThan Skater_Late_Jump_Slop
      ClearException Ollied
      SetQueueTricks special = SpecialTricks AirTricks
    endif
    DoNextTrick
    if GotParam AndManuals
      DoNextManualTrick
    endif
    if AnimFinished
      break
    endif
    waitonegameframe
  repeat
  Goto Airborne
endscript
AirAnimParams = { Hold Blendperiod = 0.3 NoRestart }
script Airborne stretchtime = 1 Blendperiod = 0.3
  if Obj_FlagSet FLAG_SKATER_INLOOP
    Goto LoopGapStart
  endif
  InAirExceptions
  begin
    DoNextTrick
    GetAirTimeLeft
    if ( <AirTimeLeft> < 0.2 )
      PlayAnim Anim = StretchLegsInit Blendperiod = <Blendperiod> NoRestart
      break
    else
      if LeftPressed
        if Flipped
          PlayAnim Anim = AirTurnRight AirAnimParams
        else
          PlayAnim Anim = AirTurnLeft AirAnimParams
        endif
      else
        if RightPressed
          if Flipped
            PlayAnim Anim = AirTurnLeft AirAnimParams
          else
            PlayAnim Anim = AirTurnRight AirAnimParams
          endif
        else
          if Held R2
            PlayAnim Anim = SpineTransfer Blendperiod = 0.3 NoRestart
          else
            if Held L2
              PlayAnim Anim = SpineTransfer Blendperiod = 0.3 NoRestart
            else
              PlayAnim Anim = AirIdle Cycle Blendperiod = <Blendperiod> NoRestart
            endif
          endif
        endif
      endif
    endif
    waitonegameframe
  repeat
  waitanimwhilstchecking
  begin
    DoNextTrick
    waitonegameframe
  repeat
endscript
script Land
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
  if DoingTrick
    Printf "DOING A TRICK"
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
        Goto Land2 params = { LittleAir }
      else
        GotoPreserveParams Land2
      endif
    endif
  endif
endscript
script Land2 RevertTime = 5
  DoPerfectCheck
  AllowRailTricks
  NollieOff
  ClearLipCombos
  if LandedFromVert
    OverrideCancelGround
    Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
    SetExtraTricks tricks = better4_control_revert_value Duration = 5
  else
    if backwards
      FlipAndRotate
    endif
    DoNextManualTrick FromAir
  endif
  Vibrate Actuator = 1 Percent = 80 Duration = 0.1
  GetAirTime
  SpawnClothingLandScript
  if Crouched
    if GotParam LittleAir
      PlayAnim Anim = CrouchBumpDown
    else
      if backwards
        FlipAndRotate
        PlayAnim randomnorepeat( @Anim = CrouchedLandTurn @Anim = CrouchedLandTurn2 @Anim = CrouchedLandTurn3 @Anim = StretchLegsLand  ) Blendperiod = 0
        BoardRotate
      else
        if YawBetween (45, 60)
          if AirTimeGreaterThan 0.75 second
            PlayAnim random( @Anim = SketchyCrouchLand @Anim = SketchyLand1  ) Blendperiod = 0.1
            if InSplitScreenGame
            else
              LaunchPanelMessage "&C1Sketchy" properties = panelcombo
            endif
          else
            PlayLandAnim
          endif
        else
          PlayLandAnim
        endif
      endif
    endif
  else
    if GotParam LittleAir
      PlayAnim Anim = IdleBump
    else
      if backwards
        FlipAndRotate
        PlayAnim random( @Anim = CrouchedLandTurn @Anim = CrouchedLandTurn2 @Anim = CrouchedLandTurn3  ) Blendperiod = 0
        BoardRotate
      else
        if YawBetween (45, 60)
          if AirTimeGreaterThan 0.5 second
            PlayAnim random( @Anim = SketchyLand @Anim = SketchyLand1  ) Blendperiod = 0.1
            if InSplitScreenGame
            else
              LaunchPanelMessage "&C1Sketchy" properties = panelcombo
            endif
          else
            PlayLandAnim
          endif
        else
          PlayLandAnim
        endif
      endif
    endif
  endif
  ClearTrickQueue
  ClearEventBuffer buttons = [ X ]
  SetManualTricks special = SpecialManualTricks ManualTricks
  OnGroundExceptions_NoEndRun
  OnExceptionRun Landout
  if GotParam NoReverts
  else
    if LandedFromVert
      ResetLandedFromVert
      begin
        Wait 1
      repeat <RevertTime>
    else
      begin
        DoNextManualTrick FromAir
        Wait 1
      repeat 10
    endif
  endif
  CheckGapTricks
  ClearGapTricks
  ClearPanel_Landed
  OverrideCancelGround Off
  ResetSpin
  ClearManualTrick
  Obj_ClearFlag FLAG_SKATER_REVERTCHEESE
  OnGroundExceptions
  CheckforNetBrake
  waitanimwhilstchecking AndManuals
  Goto OnGroundAI
endscript
script PlayLandAnim
  if AirTimeLessThan 0.5 seconds
    PlayAnim Anim = CrouchBumpDown
  else
    if AirTimeLessThan 0.75 seconds
      PlayAnim randomnorepeat( @Anim = CrouchedLand1_small @Anim = CrouchedLand2_small @Anim = CrouchedLand3_small  ) Blendperiod = 0.1
    else
      PlayAnim randomnorepeat( @Anim = CrouchedLand @Anim = CrouchedLand1 @Anim = CrouchedLand2 @Anim = CrouchedLand3 @Anim = StretchLegsLand  ) Blendperiod = 0.1
    endif
  endif
endscript
script Landout
  if ExceptionTriggered RunHasEnded
    SetSpeed 0
    SetState ground
    ClearExceptions
    SetException Ex = RunHasEnded Scr = EndOfRun
  else
    if ExceptionTriggered GoalHasEnded
      ClearExceptions
      SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
    else
      OnGroundExceptions_NoClear
    endif
  endif
  CheckGapTricks
  ClearGapTricks NotInSameFrame
  ClearPanel_Landed
  ClearManualTrick
  OverrideCancelGround Off
endscript
script DoPerfectCheck
  if SkaterCurrentScorePotGreaterThan 1
    if YawBetween (0, 5)
      AwardPerfect
    endif
    if YawBetween (175, 180)
      AwardPerfect
    endif
    if YawBetween (45, 60)
      AwardSloppy
    endif
    if YawBetween (120, 135)
      AwardSloppy
    endif
  endif
endscript
script AwardPerfect
  GetSpin
  if ( <spin> > 359.0 )
    if not InSplitScreenGame
      Create_Panel_Message text = "Perfect Landing!" id = perfect rgba = [ 50 150 50 128 ] pos = (110, 340) style = perfect_style
      Create_Panel_Message text = "+1000 Points" id = perfect2 rgba = [ 40 140 40 100 ] pos = (110, 360) style = perfect_style
    else
      PerfectSloppy_2p text = "Perfect!" rgb = [ 50 150 50 128 ]
    endif
    SetTrickName ''
    SetTrickScore 1000
    Display Blockspin NoDegrade
    Obj_SpawnScript PlayPerfectSound params = { sound = ExtraTrick Wait = 0.2 pitch = 80 }
  endif
endscript
script AwardSloppy
  if CurrentScorePotGreaterThan 750
    GetSpin
    if ( <spin> > 359.0 )
      if not InSplitScreenGame
        Create_Panel_Message text = "Sloppy Landing" id = perfect rgba = [ 200 50 50 128 ] pos = (110, 340) style = sloppy_style
        Create_Panel_Message text = "-500 Points" id = perfect2 rgba = [ 107 51 27 100 ] pos = (110, 360) style = sloppy_style
      else
        PerfectSloppy_2p text = "Sloppy!" rgb = [ 200 50 50 128 ]
      endif
      SetTrickName ''
      SetTrickScore -500
      Display Blockspin NoDegrade
      Obj_SpawnScript PlayPerfectSound params = { sound = HUDtrickslopC pitch = 150 Wait = 0.12 }
    endif
  endif
endscript
script PlayPerfectSound
  Wait <Wait> seconds
  PlaySound <sound> pitch = <pitch>
endscript
script PerfectSloppy_2p
  ScriptGetScreenMode
  GetSkaterNumber
  switch <screen_mode>
  case split_vertical
    switch <skaternumber>
    case 0
      Create_Panel_Message text = <text> id = perfect rgba = <rgb> pos = (70, 340) style = perfect_style
    case 1
      Create_Panel_Message text = <text> id = perfect_p2 rgba = <rgb> pos = (370, 340) style = perfect_style
    endswitch
  case split_horizontal
    switch <skaternumber>
    case 0
      Create_Panel_Message text = <text> id = perfect rgba = <rgb> pos = (70, 154) style = perfect_style
    case 1
      Create_Panel_Message text = <text> id = perfect_p2 rgba = <rgb> pos = (70, 375) style = perfect_style
    endswitch
  endswitch
endscript
script perfect_style
  DoMorph time = 0 scale = (0, 0)
  DoMorph time = 0.1 scale = (0.95, 0.95)
  DoMorph time = 0.1 scale = (0.75, 0.75)
  DoMorph time = 0.1 scale = (0.8, 0.8)
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 1.2 alpha = 0
  Die
endscript
script sloppy_style
  DoMorph time = 0 scale = (0, 0)
  DoMorph time = 0.1 scale = (0.8, 0.8)
  DoMorph time = 0.02 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.03 alpha = 1
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.04 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.02 alpha = 1
  DoMorph time = 1 alpha = 0
  Die
endscript
script WaitOnGround
  begin
    if OnGround
      break
    endif
    waitonegameframe
  repeat
endscript
script VibrateOff
  Vibrate Off
endscript
script EndOfRun
  EndOfRunStarted
  Printf "EndOfRun called"
  SetState ground
  CleanUpSpecialItems
  StopBalanceTrick
  CheckGapTricks
  ClearGapTricks
  ClearPanel_Landed
  ClearExceptions
  ClearTrickQueues
  ClearEventBuffer
  SetTags state = skater_endofrun
  if not GotParam NoBrake
    DisablePlayerInput AllowCameraControl
    SetException Ex = SkaterCollideBail Scr = EndBail
    SetException Ex = LostGame Scr = LostGame
    WaitOnGround
    SetRollingFriction 19
    Wait 10 frames
    WaitOnGround
    if SpeedGreaterThan 400
      PlayCessSound
      PlayAnim Anim = CessSlide180_FS
      WaitAnim 50 Percent
      PlayAnim Anim = CessSlide180_FS From = Current To = 0
      waitanimfinished
    else
      PlayAnim Anim = brake
      waitanimfinished
    endif
    PlayAnim Anim = BrakeIdle Blendperiod = 0.3 Cycle
    begin
      if SpeedLessThan 40
        if OnGround
          break
        endif
      endif
      waitonegameframe
    repeat
    if InNetGame
      SetException Ex = WonGame Scr = WonGame
      SetException Ex = LostGame Scr = LostGame
    endif
    Wait 1 seconds
    if not GotParam FromTaxiGuy
      if IsCareerMode
      endif
    endif
  endif
  FireEvent type = EndOfRunDone
  if not GotParam FromTaxiGuy
    EndOfRunDone
  endif
  Wait 1 seconds
  if InNetGame
    if GameIsOver
    else
      if GameModeEquals is_king
      else
        if not GotParam FromTaxiGuy
          if not GameModeEquals is_goal_attack
            if not IsBetterObserving
              if not ObjectExists id = dialog_box_anchor
                create_net_panel_message text = "Press \b3 to observe" style = generic_net_panel_message
                set_observe_prompt_event
              endif
            endif
          endif
        endif
      endif
    endif
  endif
endscript
script Goal_EndOfRun
  Goal_EndOfRunStarted
  Printf "Goal_EndOfRun called"
  SetState ground
  CleanUpSpecialItems
  StopBalanceTrick
  CheckGapTricks
  ClearGapTricks
  ClearPanel_Landed
  ClearExceptions
  ClearTrickQueues
  ClearEventBuffer
  FireEvent type = EndOfRunDone
  if not GotParam FromTaxiGuy
    Goal_EndOfRunDone
  endif
  if InNetGame
    if GameIsOver
    else
      if GameModeEquals is_king
      else
        if not GotParam FromTaxiGuy
          if not GameModeEquals is_goal_attack
          Create_Panel_Message id = goal_message text = "Waiting for other players to finish their runs..." style = panel_message_generic_loss
          endif
        endif
      endif
    endif
  endif
  Goto OnGroundAI
endscript
script ForceEndOfRun
  VibrateOff
  MakeSkaterGoto EndOfRun
endscript
script SkaterCollide_AtEndRun
endscript
script WonGame
  PlayAnim random( @Anim = Prop @Anim = Cheer1  ) Blendperiod = 0.3
  EndOfRunDone
  waitanimfinished
  if ShouldMongo
    PlayAnim Anim = MongoBrakeIdle Cycle
  else
    PlayAnim Anim = BrakeIdle Cycle
  endif
endscript
script LostGame
  PlayAnim Anim = BrakeDefeat
  waitanimfinished
  EndOfRunDone
  if ShouldMongo
    PlayAnim Anim = MongoBrakeIdle Cycle
  else
    PlayAnim Anim = BrakeIdle Cycle
  endif
  waitanimfinished
endscript
script EndBail
  EndOfRunDone
  ClearExceptions
  InBail
  TurnToFaceVelocity
  VibrateOff
  PlaySound random( @BoardBail01 @BoardBail02 ) 
  PlayAnim Anim = SlipForwards NoRestart Blendperiod = 0.3
  Wait 10 frames
  SwitchOffBoard
  Wait 10 frame
  PlaySound random( @HitBody03 @HitBody04 ) 
  Wait 10 frames
  SetRollingFriction 18
  Vibrate Actuator = 1 Percent = 100 Duration = 0.2
  if not GetGlobalFlag flag = BLOOD_OFF
    Obj_SpawnScript BloodSmall
  endif
  WaitAnim 25 Percent fromend
  PlaySound FoleyMove01 vol = 50
  waitanimfinished
  Obj_SpawnScript BloodPool
  PlayAnim Anim = GetUpForwards Blendperiod = 0.1
  SetRollingFriction 20
  Wait 50 frames
  SwitchOnBoard
  BoardRotate normal
  waitanimfinished
  NotifyBailDone
  NotInBail
  Goto EndOfRun
endscript
script EndOfRunTimeOut
  EndOfRunDone
endscript
script CarPlant
  ClearExceptions
  InAirExceptions
  ClearException CarPlant
  PlaySound GrindMetalOn random( @pitch = 80 @pitch = 90 @pitch = 85 ) 
  Obj_SpawnScript CarSparks
  DoCarPlantBoost
  SetTrickName "Car Plant"
  SetTrickScore 400
  Display
  if DoingTrick
  else
    PlayAnim Anim = Beanplant Blendperiod = 0.3
    waitanimwhilstchecking
    Goto Airborne
  endif
endscript
script CarSparks
  SparksOn
  Wait 0.333 seconds
  SetException Ex = CarPlant Scr = CarPlant
  Wait 3 seconds
  SparksOff
endscript
script FreezeSkater
  SwitchOnBoard
  ClearExceptions
  SetQueueTricks NoTricks
  DisablePlayerInput
  SetRollingFriction 10000
  PlayAnim Anim = StandIdle Cycle
endscript
script CarBail
  InBail
  Obj_SpawnScript BloodCar
  PlaySound HitDumpsterX
  PlaySound HitVehicle3
  Goto NoseManualBail
endscript
script FlailingFall
  InBail
  ClearExceptions
  SetQueueTricks NoTricks
  DisablePlayerInput AllowCameraControl
  PlayAnim Anim = StretchtoFlailingFall Blendperiod = 0.3
  ClearGapTricks
  ClearPanel_Bailed
  WaitAnim 90 Percent
  SwitchOffBoard
  waitanimfinished
  PlayAnim Anim = FlailingFall Cycle
endscript
script DropIn DropInAnim = DropIn
  if GameModeEquals is_horse
    ResetLookAround
    GetCurrentSkaterID
    if not IsCurrentHorseSkater <ObjId>
      return
    endif
  endif
  SetTags state = skater_dropin
  ResetSkaterParticleSystems
  PausePhysics
  RestartSkaterExceptions
  SetSkaterCamOverride heading = 0 tilt = -0.75 time = 0.000001 zoom = 5
  SetRollingFriction 10000
  DisablePlayerInput
  PlayAnim Anim = <DropInAnim> Blendperiod = 0.0
  WaitAnim 60 Percent
  ClearSkaterCamOverride
  WaitAnim 85 Percent
  UnPausePhysics
  SetState ground
  SetTags state = skater_onground
  SetRollingFriction 0
  waitanimfinished
  EnablePlayerInput
  OnGroundExceptions
  waitonegameframe
  SetLandedFromVert
  Goto Land
endscript
script ZoomIn
  skater:SetSkaterCamOverride heading = 0 time = 0.00001 zoom = 1.04
endscript
script ZoomOut
  skater:ClearSkaterCamOverride
endscript
script StartSkating1
  RestartSkaterExceptions
  SetRollingFriction #"default"
  DisablePlayerInput AllowCameraControl
  if ProfileEquals is_named = mullen
    SetRollingFriction 10000
    PlayAnim Anim = MullenStart Blendperiod = 0.0
    WaitAnim 40 Percent
    PlaySound boneless09 pitch = 110
    PlayBonkSound
    BlendPeriodOut 0
    WaitAnim 60 Percent
    SetRollingFriction #"default"
  else
    if not Flipped
      Flip
    endif
    if AutoKickIsOff
      if ShouldMongo
        PlayAnim Anim = MongoBrakeIdle
      else
        PlayAnim Anim = BrakeIdle
      endif
    else
      PlayAnim Anim = StartSkating1 Blendperiod = 0.0
      WaitAnim 75 Percent
    endif
  endif
  ClearSkaterCamOverride
  EnablePlayerInput
  OnGroundExceptions
  waitanimfinished
  Goto OnGroundAI
endscript
script PedProps name = "Ped Props" score = 500
  if InSplitScreenGame
  else
    LaunchPanelMessage "Spectator Bonus" properties = Panelcombo2
  endif
  PlaySound PedProps vol = 500
  SetTrickName <name>
  SetTrickScore <score>
  Display Blockspin
  waitonegameframe
  if OnGround
    if DoingTrick
    else
      CheckGapTricks
      ClearGapTricks
      ClearPanel_Landed
    endif
  endif
endscript
script RestartSkaterExceptions
  AllowRailTricks
  BoardRotate normal
  ClearExceptions
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  ClearTrickQueue
  SetQueueTricks NoTricks
  ClearManualTrick
  ClearEventBuffer
  SwitchOnBoard
  Obj_AttachFrame bone = "head"
endscript
script LaunchSpecialMessage text = "Special Trick" vol = 100 pitch = 100
  if InMultiplayerGame
    PlaySound HUD_specialtrickAA vol = <vol> pitch = <pitch>
  else
    if ( GetGlobalFlag flag = CHEAT_COOL_SPECIAL_TRICKS )
      if GotParam Cool
        SetSlomo 0.6
        pulse_blur Start = 0 end = 150 Speed = 10
        PlaySound HUD_specialtrickAA vol = 200 pitch = 75
        OnExceptionRun KillSpecial
      else
        PlaySound HUD_specialtrickAA vol = <vol> pitch = <pitch>
      endif
    else
      PlaySound HUD_specialtrickAA vol = <vol> pitch = <pitch>
    endif
  endif
endscript
script EndSpecial
  if ( GetGlobalFlag flag = CHEAT_COOL_SPECIAL_TRICKS )
    pulse_blur Start = 150 end = 0 time = 10
    SetSlomo 1
  endif
endscript
script KillSpecial
  kill_blur
  SetSlomo 1
endscript
script LaunchExtraMessage text = "Hidden Combo!"
  switch better4_control_extratrick_sound_value
  case THPS4
     PlaySound ExtraTrick vol = 100
  case THUG
     PlaySound extratrick_thug vol = 100
  case Off
  endswitch
endscript
script PedKnockDown
  if ObjectExists id = speech_box_anchor
    DestroyScreenElement id = speech_box_anchor
  endif
  if ObjectExists id = goal_start_dialog
    DestroyScreenElement id = goal_start_dialog
  endif
  Obj_SpawnScript BloodSmall
  SetRollingFriction 0
  StopBalanceTrick
  if OnLip
    StopBalanceTrick
    SetState Air
    Move z = 1
    Move y = 1
  endif
  if GotParam #"Jump"
    SetSpeed -150
    Wait 1 game frame
    #"Jump"
    FlipAndRotate
    GotoRandomScript [ Faceplant Facesmash NoseManualBail ManualBail Hipper TailslideOut ]
  endif
  if backwards
    GotoRandomScript [ BackwardFaceSlam Shoulders ]
  else
    if OnRail
      Goto FiftyFiftyFall
    else
      GotoRandomScript [ Faceplant LandPartiallyOnBoard Facesmash NoseManualBail ManualBail Hipper Spasmodic TailslideOut ]
    endif
  endif
endscript
script SkaterPushPed
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  FlailVibrate
  NollieOff
  StopBalanceTrick
  PlaySound bitchslap2
  if AnimEquals [ CrouchIdle SkateIdle Land MongoPushCycle PushCycle ]
    Goto FlailHitWall
  endif
  if AnimEquals [ runout runoutquick Smackwallupright ]
    Goto Bailsmack params = { SmackAnim = Smackwallupright }
  endif
  if InAir
    Goto Airborne
  else
    if IsInBail
      if AnimEquals [ Smackwallfeet NutterFallBackward FiftyFiftyFallBackward BackwardsTest BackwardFaceSlam Smackwallfeet SlipBackwards ]
        Goto Bailsmack params = { SmackAnim = Smackwallfeet }
      else
        Goto Bailsmack params = { <...> }
      endif
    endif
    Goto OnGroundAI
  endif
endscript
script SkaterAvoidGoalPed
  if GotParam heading
    Rotate y = <heading>
  endif
  if not SpeedGreaterThan 100
    SetSpeed <Speed>
  endif
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  FlailVibrate
  NollieOff
  StopBalanceTrick
  PlaySound bitchslap2
  Goto FlailHitWall
endscript
script SkaterBreakGlass
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  FlailVibrate
  NollieOff
  StopBalanceTrick
  if AnimEquals [ CrouchIdle SkateIdle Land MongoPushCycle PushCycle ]
    Goto FlailHitWall
  endif
  if AnimEquals [ runout runoutquick Smackwallupright ]
    Goto Bailsmack params = { SmackAnim = Smackwallupright }
  endif
  if InAir
    Goto Airborne
  else
    if IsInBail
      if AnimEquals [ Smackwallfeet NutterFallBackward FiftyFiftyFallBackward BackwardsTest BackwardFaceSlam Smackwallfeet SlipBackwards ]
        Goto Bailsmack params = { SmackAnim = Smackwallfeet }
      else
        Goto Bailsmack params = { <...> }
      endif
    endif
    Goto OnGroundAI
  endif
endscript
TRANSFER_POINTS = 250
script SkaterAwardTransfer
  SetTrickName 'Spine Transfer'
  SetTrickScore TRANSFER_POINTS
  Display NoDegrade
  if not DoingTrick
    GetTags
    if ( <racemode> = none )
      SetState Air
      InAirExceptions
      PlayAnim Anim = SpineTransfer Blendperiod = 0.3
    endif
  endif
endscript
script PlayAnim_InLoop
  if AnimEquals <Anim>
    if not AnimFinished <Anim>
      PlayAnim Anim = <Anim> NoRestart
    else
      PlayAnim Anim = <Cycle> Cycle NoRestart
    endif
  else
    PlayAnim Anim = <Cycle> Cycle NoRestart
  endif
endscript
script MakeSkaterFly
  MakeSkaterGoto FlyAi
endscript
script FlyAi Move = 8
  ClearExceptions
  SetQueueTricks NoTricks
  SetSpeed 0
  SetState Air
  SetRollingFriction 1000
  NoRailTricks
  begin
    if Held R2
      #"Jump"
      Wait 8 frames
    endif
    if Held L1
      break
    endif
    if Held L2
      if Held square
        Move X = 18
      endif
      if Held Circle
        Move X = -18
      endif
      if Held Triangle
        Move z = 18
      endif
      if Held X
        Move z = -18
      endif
    else
      if Held square
        Move X = 6
      endif
      if Held Circle
        Move X = -6
      endif
      if Held Triangle
        Move z = 8
      endif
      if Held X
        Move z = -8
      endif
    endif
    waitonegameframe
  repeat
  AllowRailTricks
  MakeSkaterGoto OnGroundAI
endscript
