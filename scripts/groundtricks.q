off = 0
on = 1
TRICK_PRELOAD_TIME = 160
Jumptricks0 =
[ { Trigger = { TapOnceRelease Up X 300 } Scr = NoComply Params = { Name = 'No Comply' Score = 100 } } ]
Jumptricks =
[ { Trigger = { TapTwiceRelease Up X 500 } TrickSlot = JumpSlot } ]
Trick_Boneless = { Scr = Boneless Params = { Name = 'Boneless' Anim = Boneless Score = 250 } }
Trick_Fastplant = { Scr = Boneless Params = { Name = 'Fastplant' Anim = Fastplant Score = 250 } }
Trick_Beanplant = { Scr = Boneless Params = { Name = 'Beanplant' Anim = Beanplant Score = 250 } }
GroundTricks =
[
  { Trigger = { Press R2 20 } Scr = ToggleSwitchRegular }
  { Trigger = { TapOnceRelease Up X 300 } Scr = NoComply Params = { Name = 'No Comply' Score = 100 } }
  { Trigger = { HoldTwoAndPress R1 L1 Triangle 500 } Scr = Props Params = { string_id = props_string } }
  { Trigger = { HoldTwoAndPress R1 L1 Square 500 } Scr = Taunt Params = { Anim = Taunt1 string_id = your_daddy_string } }
  { Trigger = { HoldTwoAndPress R1 L1 Circle 500 } Scr = Taunt Params = { Anim = Taunt2 string_id = no_way_string } }
  { Trigger = { HoldTwoAndPress R1 L1 X 500 } Scr = Taunt Params = { Anim = Taunt3 string_id = get_some_string } }
]
NoTricks =
[
]
script Revert FSName = 'FS Revert' BSName = 'BS Revert' FSAnim = RevertFS BSAnim = RevertBS
  ClearLipCombos
  KillExtraTricks
  SetTrickScore 100
  OnGroundExceptions_NoEndRun
  if not GetGlobalFlag flag = CHEAT_HOVERBOARD
    Obj_SpawnScript CessTrail Params = { repeat_times = 10 }
    PlayCessSound
    Vibrate Actuator = 0 Percent = 80 Duration = 0.5
    Vibrate Actuator = 1 Percent = 80 Duration = 0.1
  endif
  ClearException Ollied
  SetSpecialFriction [ 0 10 15 20 30 50 ]
  SetQueueTricks NoTricks
  SetManualTricks Special = SpecialManualTricks ManualTricks
  NollieOff
  if Obj_FlagSet FLAG_SKATER_REVERTFS
    Obj_ClearFlag FLAG_SKATER_REVERTFS
    PlayAnim Anim = <FSAnim>
    SetTrickName <FSName>
  else
    if Obj_FlagSet FLAG_SKATER_REVERTBS
      Obj_ClearFlag FLAG_SKATER_REVERTBS
      PlayAnim Anim = <BSAnim>
      SetTrickName <BSName>
    else
      if LastSpinWas Frontside
        PlayAnim Anim = <FSAnim>
        SetTrickName <FSName>
      else
        PlayAnim Anim = <BSAnim>
        SetTrickName <BSName>
      endif
    endif
  endif
  Display Blockspin
  FlipAfter
  BoardRotateAfter
  BlendPeriodOut 0.0
  Wait 0.1 seconds
  SetException Ex = Ollied Scr = Ollie
  if ( better4_control_doublerevert_value = off )
    ResetLandedFromVert
  endif
  WaitAnimFinished
  SetRollingFriction #"default"
  DoNextManualTrick FromAir
  OnGroundExceptions
  CheckGapTricks
  ClearPanel_Landed
  OverrideCancelGround off
  ClearEventBuffer
  ClearManualTrick
  if ( better4_control_revertrecovery_value = off )
     PlayAnim Anim = CrouchIdle BlendPeriod = 0.3
  else 
     PlayAnim Anim = CrouchIdle BlendPeriod = 0.3 speed = 1.9
 endif
  WaitAnimWhilstChecking AndManuals
  Goto OnGroundAI
endscript
script RevertCheeseTimer
  Obj_SetFlag FLAG_SKATER_REVERTCHEESE
  Wait 25 seconds
  SetTags RevertCheese = 0
  Obj_ClearFlag FLAG_SKATER_REVERTCHEESE
endscript
script RevertCheeseIncrement
  GetTags
   <RevertCheese> = ( <RevertCheese> + 1 )
  SetTags RevertCheese = <RevertCheese>
  return RevertCheese = <RevertCheese>
endscript
script ToggleSwitchRegular
  OnGroundExceptions
  SetQueueTricks NoTricks
  ClearTrickQueues
  SetException Ex = Ollied Scr = Ollie Params = { NoDoNextTrick }
  NollieOff
  if not GetGlobalFlag flag = CHEAT_HOVERBOARD
    Obj_SpawnScript CessTrail Params = { delay = 3 }
    Vibrate Actuator = 0 Percent = 80 Duration = 0.5
    Vibrate Actuator = 1 Percent = 80 Duration = 0.1
  endif
  if GotParam PowerSlide
    Rotate y = 180 Duration = 0.3 seconds
    if LeftPressed
      if Flipped
        PlayAnim Anim = FSPowerslide
      else
        PlayAnim Anim = BSPowerslide
      endif
    else
      if RightPressed
        if Flipped
          PlayAnim Anim = BSPowerslide
        else
          PlayAnim Anim = FSPowerslide
        endif
      else
        PlayAnim Anim = FSPowerslide
      endif
    endif
  else
    if LeftPressed
      if Flipped
        PlayAnim Anim = CessSlide180_FS
      else
        PlayAnim Anim = CessSlide180_BS
      endif
    else
      if RightPressed
        if Flipped
          PlayAnim Anim = CessSlide180_BS
        else
          PlayAnim Anim = CessSlide180_FS
        endif
      else
        PlayAnim Anim = CessSlide180_FS
      endif
    endif
  endif
  WaitAnim 30 Percent
  if not GetGlobalFlag flag = CHEAT_HOVERBOARD
    PlayCessSound
  endif
  WaitAnim 65 Percent
  SetQueueTricks better4_control_powerslide_value better4_control_jumptrick_value GroundTricks better4_control_stancechange_value
  FlipAfter
  BoardRotateAfter
  BlendPeriodOut 0.0
  WaitAnimWhilstChecking AndManuals
  if not GotParam PowerSlide
    if CanKick
      if ShouldMongo
      else
        PlayAnim Anim = PushCycle Cycle BlendPeriod = 0.0
      endif
    else
      if AnimFinished
        PlayAnim Anim = Idle Cycle BlendPeriod = 0.0
      endif
    endif
  else
    PlayAnim Anim = CrouchIdle Cycle BlendPeriod = 0.0
  endif
  ClearTrickQueue
  Goto OnGroundAI
endscript
script CessTrail repeat_times = 20
  if SpeedGreaterThan 400
    if GotParam delay
      Wait <delay> frames
    endif
    begin
      if not OnGround
        break
      else
        if IsXBOX
          TextureSplat size = 6 radius = 0 bone = burnq_back_wheel Name = "skidtrail" trail lifetime = 15
          TextureSplat size = 6 radius = 0 bone = burnq_front_wheel Name = "skidtrail" trail lifetime = 15
        else
          TextureSplat size = 6 radius = 0 bone = burnq_back_wheel Name = "skidtrail_ps2" trail lifetime = 15
          TextureSplat size = 6 radius = 0 bone = burnq_front_wheel Name = "skidtrail_ps2" trail lifetime = 15
        endif
      endif
      Wait 1 game frame
    repeat <repeat_times>
  endif
endscript
script ToggleNollieRegular
  OnGroundExceptions
  SetException Ex = Ollied Scr = Nollie Params = { NoDoNextTrick }
  ClearTrickQueues
  SetQueueTricks better4_control_powerslide_value GroundTricks better4_control_stancechange_value
  if InNollie
    Printf "in Nollie mode ---------------------------"
    NollieOff
    if Crouched
      PlayAnim Anim = CrouchToNollie BlendPeriod = 0.1 backwards
    else
      PlayAnim Anim = SkatingToNollie BlendPeriod = 0.1 backwards
    endif
  else
    NollieOn
    if Crouched
      PlayAnim Anim = CrouchToNollie BlendPeriod = 0.1
    else
      PlayAnim Anim = SkatingToNollie BlendPeriod = 0.1
    endif
  endif
  WaitAnimWhilstChecking AndManuals
  if InNollie
    Goto OnGroundNollieAI
  else
    Goto OnGroundAI
  endif
endscript
script Nollie
  if GotParam NoDoNextTrick
  else
    DoNextTrick
  endif
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump"
  InAirExceptions
  Vibrate Actuator = 1 Percent = 50 Duration = 0.05
  NollieOn
  PlayAnim Anim = Nollie BlendPeriod = 0.1
  if ProfileEquals stance = regular
    if Flipped
      SetTrickName 'Nollie'
      SetTrickScore 200
    else
      SetTrickName 'Fakie Ollie'
      SetTrickScore 200
    endif
  else
    if Flipped
      SetTrickName 'Fakie Ollie'
      SetTrickScore 200
    else
      SetTrickName 'Nollie'
      SetTrickScore 200
    endif
  endif
  Display
  BailOff
  WaitAnimWhilstChecking
  Goto Airborne
endscript
script NollieNoDisplay OutSpeed = 1
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  SetTrickName 'Nollie'
  SetTrickScore 100
  Display Deferred
  #"Jump"
  InAirExceptions
  Vibrate Actuator = 1 Percent = 80 Duration = 0.05
  NollieOn
  if GotParam OutAnim
    PlayAnim Anim = <OutAnim> BlendPeriod = 0.3 Speed = <OutSpeed>
  else
    PlayAnim Anim = Nollie BlendPeriod = 0.1
  endif
  if GotParam BoardRotate
    BlendPeriodOut 0
    BoardRotateAfter
  endif
  BailOff
  WaitAnimWhilstChecking
  Goto Airborne
endscript
Dpad = [ Up Down Left Right Upright UpLeft DownRight DownLeft ]
script Ollie OutSpeed = 1
  StopSkitch
  if GotParam NoDoNextTrick
  else
    DoNextTrick
  endif
  SetTrickName 'Ollie'
  SetTrickScore 100
  Display Deferred
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump"
  InAirExceptions
  Vibrate Actuator = 1 Percent = 50 Duration = 0.05
  if GotParam FromLip
    Printf "came from lip=================="
    PlayAnim Anim = <OutAnim> BlendPeriod = 0.0
    BlendPeriodOut 0
  else
    if GotParam OutAnim
      PlayAnim Anim = <OutAnim> BlendPeriod = 0.3 Speed = <OutSpeed>
    else
      PlayAnim Anim = Ollie BlendPeriod = 0.0 NoRestart
    endif
  endif
  if GotParam BoardRotate
    BlendPeriodOut 0
    BoardRotateAfter
  endif
  if GotParam RotateAfter
    RotateAfter
  endif
  if GotParam FlipAfter
    Printf "=========flipping the skater in Ollie"
    FlipAfter
  endif
  if GotParam NoBlend
    BlendPeriodOut 0
  endif
  if GotParam WaitOnOlliePercent
    BailOn
    WaitAnim <WaitOnOlliePercent> Percent
  endif
  BailOff
  WaitAnimWhilstChecking
  Goto Airborne
endscript
script NoComply
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump"
  InAirExceptions
  Vibrate Actuator = 1 Percent = 80 Duration = 0.05
  SetTrickName <Name>
  SetTrickScore <Score>
  Display
  BailOff
  PlayAnim Anim = NoComply BlendPeriod = 0.2
  WaitAnimWhilstChecking
  Goto Airborne
endscript
script Beanplant
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump" BonelessHeight
  InAirExceptions
  Vibrate Actuator = 1 Percent = 80 Duration = 0.1
  PlaySound boneless09 pitch = 85
  SetTrickName <Name>
  SetTrickScore <Score>
  Display
  PlayAnim Anim = Beanplant BlendPeriod = 0.2
  WaitAnimWhilstChecking
  Goto Airborne
endscript
script Fastplant
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump" BonelessHeight
  InAirExceptions
  Vibrate Actuator = 1 Percent = 80 Duration = 0.1
  SetTrickName <Name>
  SetTrickScore <Score>
  Display
  PlayAnim Anim = Fastplant BlendPeriod = 0.2
  BailOff
  WaitAnimWhilstChecking
  Goto Airborne
endscript
script Boneless Anim = Boneless Name = 'Boneless' Score = 250
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump" BonelessHeight
  InAirExceptions
  Vibrate Actuator = 1 Percent = 80 Duration = 0.1
  PlaySound boneless09 pitch = 85
  SetTrickName <Name>
  SetTrickScore <Score>
  if SkaterIsNamed vallely
    PlayAnim Anim = _540Boneless BlendPeriod = 0.1 Speed = 1.25 from = 10
    SetTrickScore 300
    SetTrickName "MikeV Boneless"
    FlipAfter
    BlendPeriodOut 0
  else
  if ( better4_control_jumptrick_index = 3 )
    PlayAnim Anim = _540Boneless BlendPeriod = 0.1 Speed = 1.25 from = 10
    SetTrickScore 300
    SetTrickName "MikeV Boneless"
    FlipAfter
    BlendPeriodOut 0
  else
  if ( better4_control_jumptrick_index = 2 )
    PlayAnim Anim = Fastplant BlendPeriod = 0.2
    SetTrickName "Fastplant"
  else
  if ( better4_control_jumptrick_index = 1 )
    PlayAnim Anim = Beanplant BlendPeriod = 0.2
    SetTrickName "Beanplant"
  else
    PlayAnim Anim = <Anim> BlendPeriod = 0.2
  endif
  endif
  endif
  endif
  Display
  BailOff
  WaitAnimWhilstChecking
  Goto Airborne
endscript
script BonelessWaitAnimWhilstChecking
  begin
    DoNextTrick
    if GotParam AndManuals
      DoNextManualTrick
    endif
    if AnimFinished
      break
    endif
    WaitOneGameFrame
    if OnGround
      Goto Land
    endif
  repeat
endscript
script Taunt
  ClearException Ollied
  PlayAnim Anim = <Anim> BlendPeriod = 0.3
  GetPreferenceString pref_type = Taunt <string_id>
  if InNetGame
    SendChatMessage string = <ui_string>
  endif
  Wait 10 game frame
  OnGroundExceptions
  if SpeedLessThan 1
    SetRollingFriction 100
    WaitAnimWhilstChecking AndManuals
    Goto Handbrake
  else
    WaitAnimWhilstChecking AndManuals
    Goto OnGroundAI
  endif
endscript
script Props
  OnGroundExceptions
  PlayAnim random( @Anim = Prop @Anim = Cheer1  ) BlendPeriod = 0.3
  GetPreferenceString pref_type = Taunt <string_id>
  if InNetGame
    SendChatMessage string = <ui_string>
  endif
  if SpeedLessThan 1
    SetRollingFriction 100
    WaitAnimWhilstChecking AndManuals
    Goto Handbrake
  else
    WaitAnimWhilstChecking AndManuals
    Goto OnGroundAI
  endif
endscript
script BitchSlap
  OnGroundExceptions
  PlayAnim Anim = Slapright NoRestart BlendPeriod = 0.3
  WaitAnimWhilstChecking AndManuals
  Goto OnGroundAI
endscript
script Skitch
  ClearExceptions
  ResetLandedFromVert
  KillExtraTricks
  SetException Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called CallInsteadOfGoto
  SetException Ex = Ollied Scr = Ollie Params = { <...> }
  SetException Ex = OffMeterTop Scr = SkitchOut
  SetException Ex = OffMeterBottom Scr = SkitchOut
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetTags state = skater_skitching
  ClearTrickQueue
  SetQueueTricks NoTricks
  ClearManualTrick
  SetManualTricks NoTricks
  StartSkitch
  StartBalanceTrick
  PlayAnim Anim = SkitchInit
  WaitAnimFinished
  PlaySound Hud_jumpgap
  SetTrickName "\c2Skitchin\C0"
  SetTrickScore 500
  Display
  DoBalanceTrick ButtonA = Right ButtonB = Left Type = Skitch Tweak = 5
  PlayAnim Anim = SkitchRange wobble
  begin
    OverrideLimits max = 10000 friction = 0 time = 5 gravity = 0
    if Held Down
      Obj_SpawnScript NoBrake_Timer
      Goto SkitchOut
    endif
    WaitOneGameFrame
  repeat
endscript
script SkitchOut
  StopSkitch
  StopBalanceTrick
  PlayAnim Anim = SkitchInit backwards
  OnGroundExceptions
  ClearException Skitched
  ClearPanel_Landed
  WaitAnimFinished
  Goto OnGroundAI
endscript
script NoBrake_Timer
  CanBrakeOff
  Wait 0.5 seconds
  CanBrakeOn
endscript
