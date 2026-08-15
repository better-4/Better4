off = 0
on = 1
script SkateInOrBail moveleft = 1 moveright = -1 movey = -5
  GetTags
  StopBalanceTrick
  KillExtraTricks
  SetExtraTricks NoTricks
  OnGroundExceptions_NoEndRun
  ClearException GroundGone
  OnExceptionRun SkateInOrBail_Out
  SetQueueTricks NoTricks
  ClearManualTrick
  if GotParam FallingRight
    if SkateInAble Right
      Printf "SkateInable RIGHT >>>>>>>>>>>>>>>>>>>>>>>>"
      SetLandedFromVert
      SetState ground
      Move y = -5
      Move X = -1
      OrientToNormal
      Rotate y = -30 Duration = 0.2 seconds
      OnGroundExceptions_NoEndRun
      ClearException GroundGone
      SetQueueTricks NoTricks
      SetManualTricks NoTricks
      SetExtraTricks tricks = better4_control_revert_value Duration = 20
      if GotParam OutAnim
        PlayAnim Anim = <OutAnim> Blendperiod = 0.3
      else
        PlayAnim Anim = <initanim> backwards Blendperiod = 0.3
      endif
      waitanimwhilstchecking
      Goto SkateInLand
    else
      Move y = <movey>
      Move X = <moveright>
      if GotParam GrindBail
        Goto <GrindBail>
      else
        Goto FiftyFiftyFall
      endif
    endif
  endif
  if GotParam FallingLeft
    if SkateInAble Left
      SetLandedFromVert
      Printf "SkateInable LEFT >>>>>>>>>>>>>>>>>>>>>>>>"
      SetState ground
      Move X = 1
      Move y = -5
      OrientToNormal
      Rotate y = 30 Duration = 0.2 seconds
      SetState ground
      OnGroundExceptions_NoEndRun
      ClearException GroundGone
      SetQueueTricks NoTricks
      SetManualTricks NoTricks
      SetExtraTricks tricks = better4_control_revert_value Duration = 20
      if GotParam OutAnim
        PlayAnim Anim = <OutAnim> Blendperiod = 0.3
      else
        PlayAnim Anim = <initanim> backwards Blendperiod = 0.3
      endif
      waitanimwhilstchecking
      Goto SkateInLand
    else
      Move y = <movey>
      Move X = <moveleft>
      if GotParam GrindBail
        Goto <GrindBail>
      else
        Goto FiftyFiftyFall
      endif
    endif
  endif
  Printf "Missing a FallingLeft or FallingRight ?"
  if GotParam GrindBail
    Goto <GrindBail>
  else
    Goto FiftyFiftyFall
  endif
endscript
script SkateInLand
  OnExceptionRun SkateInLandOut
  NollieOff
  Vibrate Actuator = 1 Percent = 80 Duration = 0.1
  if Crouched
    PlayAnim Anim = CrouchedLand Blendperiod = 0.1
  else
    PlayAnim Anim = Land Blendperiod = 0.1
  endif
  ClearTrickQueue
  OnExceptionRun SkateInLandOut
  CheckGapTricks
  ClearGapTricks
  OnGroundExceptions_NoEndRun
  WaitAnim 10 Percent
  ClearPanel_Landed
  OnGroundExceptions
  CheckforNetBrake
  AllowRailTricks
  waitanimwhilstchecking AndManuals
  Goto OnGroundAI
endscript
script SkateInLandOut
  AllowRailTricks
  ClearPanel_Landed
endscript
script SkateInOrBail_Out
  ClearPanel_Landed
endscript
Extra_FS_Grinds =
[
  { Trigger = { InOrder Triangle Triangle 300 } Scr = Trick_5050_FS Params = { name = 'FS 50-50' IsExtra = yes } }
  { Trigger = { InOrder Triangle square 300 } Scr = Trick_NoseSlide_FS Params = { name = 'FS Noseslide' IsExtra = yes } }
  { Trigger = { InOrder Triangle Circle 300 } Scr = Trick_Nosegrind_FS Params = { name = 'FS Nosegrind' IsExtra = yes } }
  { Trigger = { InOrder Circle Circle 300 } Scr = Trick_Crooked_FS Params = { name = 'FS Crooked' IsExtra = yes } }
  { Trigger = { InOrder Circle square 300 } Scr = Trick_Bluntslide_FS Params = { name = 'FS Bluntslide' IsExtra = yes } }
  { Trigger = { InOrder Circle Triangle 300 } Scr = Trick_NoseBluntSlide_FS Params = { name = 'FS Nosebluntslide' IsExtra = yes } }
  { Trigger = { InOrder square square 300 } Scr = Trick_Smith_FS Params = { name = 'FS Smith' IsExtra = yes } }
  { Trigger = { InOrder square Circle 300 } Scr = Trick_5_0_FS Params = { name = 'FS 5-0' IsExtra = yes } }
  { Trigger = { InOrder square Triangle 300 } Scr = Trick_Tailslide_FS Params = { name = 'FS Tailslide' IsExtra = yes } }
]
Extra_BS_Grinds =
[
  { Trigger = { InOrder Triangle Triangle 300 } Scr = Trick_5050_BS Params = { name = 'BS 50-50' IsExtra = yes } }
  { Trigger = { InOrder Triangle square 300 } Scr = Trick_NoseSlide_BS Params = { name = 'BS Noseslide' IsExtra = yes } }
  { Trigger = { InOrder Triangle Circle 300 } Scr = Trick_Nosegrind_BS Params = { 'BS Nosegrind' IsExtra = yes } }
  { Trigger = { InOrder Circle Circle 300 } Scr = Trick_Crooked_BS Params = { name = 'BS Crooked' IsExtra = yes } }
  { Trigger = { InOrder Circle square 300 } Scr = Trick_Bluntslide_BS Params = { name = 'BS Bluntslide' IsExtra = yes } }
  { Trigger = { InOrder Circle Triangle 300 } Scr = Trick_NoseBluntSlide_BS Params = { name = 'BS Nosebluntslide' IsExtra = yes } }
  { Trigger = { InOrder square Triangle 300 } Scr = Trick_Tailslide_BS Params = { name = 'BS Tailslide' IsExtra = yes } }
  { Trigger = { InOrder square square 300 } Scr = Trick_Smith_BS Params = { name = 'BS Smith' IsExtra = yes } }
  { Trigger = { InOrder square Circle 300 } Scr = Trick_5_0_BS Params = { name = 'BS 5-0' IsExtra = yes } }
]
Extra_5050_FS = Extra_FS_Grinds
Extra_5050_BS = Extra_BS_Grinds
Extra_Trick_Crooked_FS = Extra_FS_Grinds
Extra_NoseGrinds_FS = Extra_FS_Grinds
Extra_NoseGrinds_BS = Extra_BS_Grinds
Extra_TailGrinds_FS = Extra_FS_Grinds
Extra_TailGrinds_BS = Extra_BS_Grinds
script Grind GrindTweak = 7 boardscuff = 0
  if ( better4_control_railspin_value = off )
    RotateDisplay Y duration = 0.01 seconds StartAngle = 0.0 EndAngle = 0.0 SinePower = 0 RotationOffset = (0, 30, 0)
  endif
  KillExtraTricks
  SetTags state = skater_onrail OutAnim = <OutAnim> initanim = <initanim> Anim = <Anim>
  SetTrickName ""
  SetTrickScore 0
  Display Blockspin
  if BailIsOn
    SetState Air
    Goto DoingTrickBail
  endif
  BailOff
  Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
  Obj_ClearFlag FLAG_SKATER_REVERTCHEESE
  if GotParam SpecialItem_details
    TurnOnSpecialItem SpecialItem_details = <SpecialItem_details>
  endif
  if GotParam SpecialSounds
    Obj_SpawnScript <SpecialSounds>
  endif
  if GotParam Stream
    Obj_PlayStream <Stream>
  endif
  Vibrate Actuator = 1 Percent = 50 Duration = 0.25
  Vibrate Actuator = 0 Percent = 50
  if IsGrind <type>
    SparksOn
    if GotParam Nollie
      SetTags Nosegrind = 1
    else
      SetTags Nosegrind = 0
    endif
  else
    GetBoardScuff
     <boardscuff> = ( <boardscuff> + 1 )
    SetTags boardscuff = <boardscuff>
    DoBoardScuff boardscuff = <boardscuff>
    SparksOff
  endif
  ClearExceptions
  if GotParam Nollie
    SetException Ex = Ollied Scr = NollieNoDisplay
    NollieOn
  else
    if GotParam OutAnimOnOllie
      SetException Ex = Ollied Scr = Ollie Params = { <...> }
    else
      SetException Ex = Ollied Scr = Ollie
    endif
    NollieOff
  endif
  SetException Ex = OffRail Scr = OffRail Params = { initanim = <initanim> OutAnim = <OutAnim> BoardRotate = <BoardRotate> }
  SetException Ex = Landed Scr = Land
  SetException Ex = OffMeterTop Scr = SkateInOrBail Params = { <...> FallingLeft }
  SetException Ex = OffMeterBottom Scr = SkateInOrBail Params = { <...> FallingRight }
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetException Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called CallInsteadofGoto
  SetTrickScore 50
  SetTrickName "Kissed the Rail"
  OnExceptionRun Grind_Kissed
  ClearTrickQueue
  ClearManualTrick
  ClearExtraGrindTrick
  SetQueueTricks NoTricks
  SetManualTricks NoTricks
  SetRailSound <type>
  if GotParam IsSpecial
    SetGrindTweak 36
  else
    SetGrindTweak <GrindTweak>
  endif
  if GotParam IsExtra
    LaunchExtraMessage
    AdjustBalance SpeedMult = 1.25
  endif
  if GotParam Profile
    if ProfileEquals is_named = <Profile>
      SwitchOnAtomic special_item
      SwitchOffAtomic special_item_2
    endif
  endif
  if GotParam NoBlend
    PlayAnim Anim = <initanim> Blendperiod = 0.0
  else
    PlayAnim Anim = <initanim> Blendperiod = 0.3
  endif
  DoBalanceTrick ButtonA = Right ButtonB = Left type = <type> DoFlipCheck
  Wait 10 frames
  SetExtraTricks better4_control_dropdown_value
  if GotParam IsSpecial
    LaunchSpecialMessage text = "Special Grind"
  endif
  OnExceptionRun Normal_Grind
  SetTrickName <name>
  SetTrickScore <score>
  Display Blockspin
  waitanimfinished
  if GotParam FlipAfterInit
    Flip
    PlayBonkSound
    BoardRotate
    BlendPeriodOut 0
  endif
  if GotParam Idle
    PlayAnim Anim = <Anim> Cycle NoRestart
  else
    PlayAnim Anim = <Anim> Wobble wobbleparams = grindwobble_params
  endif
  if AnimEquals [ FiftyFifty_Range NoseGrind_Range TailGrind_Range ]
    Wait 0.25 seconds
  endif
  if GotParam Extratricks
    SetExtraTricks <Extratricks> ignore = <name> better4_control_dropdown_value
  else
    SetExtraTricks better4_control_dropdown_value
  endif
  if GotParam ScreenShake
    Grind_ScreenShake ScreenShake = <ScreenShake>
  endif
endscript
script GetBoardScuff ManualName = 'none'
  GetTags
  return boardscuff = <boardscuff>
endscript
script Grind_ScreenShake frame = 60
  if AnimEquals [ ElbowSmash_Idle FlipKickDad ]
    begin
      if FrameIs <ScreenShake>
        BloodSplat
        PlaySound bitchslap2 vol = 200 pitch = randomrange(40, 60)
        ShakeCamera {
          Duration = 0.5
          vert_amp = 9.0
          horiz_amp = 3.0
          vert_vel = 10.27
          horiz_vel = 5.92
        }
      endif
      Wait 1 frame
    repeat
  endif
endscript
grindwobble_params = {
  WobbleAmpA = { (0.1, 0.1) STATS_RAILBALANCE }
  WobbleAmpB = { (0.04, 0.04) STATS_RAILBALANCE }
  WobbleK1 = { (0.0022, 0.0022) STATS_RAILBALANCE }
  WobbleK2 = { (0.0017, 0.0017) STATS_RAILBALANCE }
  SpazFactor = { (1.5, 1.5) STATS_RAILBALANCE }
}
script Grind_Kissed
  if GotParam MadeOtherSkaterBail
  else
    KillExtraTricks
  endif
  if ExceptionTriggered OffRail
    Display Blockspin
  endif
endscript
script Normal_Grind
  if GotParam MadeOtherSkaterBail
  else
    KillExtraTricks
  endif
  if ProfileEquals is_named = maul
  else
    SwitchOffAtomic special_item
    SwitchOnAtomic special_item_2
  endif
endscript
script OffRail
  KillExtraTricks
  Vibrate Actuator = 0 Percent = 0
  SetState Air
  SetException Ex = Landed Scr = Land
  SetException Ex = WallRideLeft Scr = WallRide Params = { Left }
  SetException Ex = WallRideRight Scr = WallRide Params = { Right }
  DoNextTrick
  if GotParam EarlyOut
    PlayAnim Anim = <EarlyOut> Blendperiod = 0.1 backwards
  else
    if GotParam OutAnim
      if GotParam OutAnimBackwards
        PlayAnim Anim = <OutAnim> backwards Blendperiod = 0.1
      else
        PlayAnim Anim = <OutAnim> Blendperiod = 0.1
      endif
    else
      PlayAnim Anim = <initanim> Blendperiod = 0.1 backwards
    endif
  endif
  if GotParam BoardRotate
    BlendPeriodOut 0
    BoardRotateAfter
  endif
  if GotParam FlipAfter
    Printf "flipping.................."
    FlipAfter
  endif
  waitanimfinished
  Goto Airborne
endscript
script Trick_5050_BS name = 'BS 50-50'
  Grind { name = <name> score = 100 initanim = Init_FiftyFifty Anim = FiftyFifty_Range type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_5050_BS IsExtra = <IsExtra> }
endscript
script Trick_5050_FS name = 'FS 50-50'
  Grind { name = <name> score = 100 initanim = Init_FiftyFifty Anim = FiftyFifty_Range type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_5050_FS IsExtra = <IsExtra> }
endscript
script Trick_5050_BS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_5050_BS Params = { NoBlend = yes }
endscript
script Trick_5050_FS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_5050_FS Params = { NoBlend = yes }
endscript
script Trick_Boardslide_FS name = 'FS Boardslide'
  Rotate
  Grind { name = <name> score = 200 GrindTweak = 14 initanim = Init_FSBoardslide Anim = FSBoardslide_range OutAnim = FSBoardslide_Out type = Slide NoBlend = yes
    GrindBail = Nutter Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> }
endscript
script Trick_Boardslide_BS name = 'BS Boardslide'
  Grind { name = <name> score = 200 GrindTweak = 14 initanim = Init_BSBoardslide Anim = BSBoardslide_range OutAnim = BSBoardslide_Out type = Slide NoBlend = yes
    GrindBail = Nutter Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> }
endscript
script Trick_Lipslide_FS name = 'FS Lipslide'
  Grind { name = <name> score = 200 GrindTweak = 14 initanim = Init_FSLipslide Anim = BSBoardslide_range OutAnim = BSBoardslide_Out type = Slide NoBlend = yes
    GrindBail = Nutter Extratricks = Extra_FS_Grinds IsExtra = <IsExtra> }
endscript
script Trick_Lipslide_BS name = 'BS Lipslide'
  Rotate
  Grind { name = <name> score = 200 GrindTweak = 14 initanim = Init_BSLipslide Anim = FSBoardslide_range OutAnim = FSBoardslide_Out type = Slide NoBlend = yes
    GrindBail = Nutter Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> }
endscript
script Trick_Tailslide_FS
  if BadLedge
    Goto Trick_NoseSlide_BS_ok Params = { IsExtra = <IsExtra> }
  else
    Goto Trick_Tailslide_FS_ok Params = { IsExtra = <IsExtra> }
  endif
endscript
script Trick_Tailslide_FS_ok name = 'FS Tailslide'
  Grind { name = <name> score = 150 GrindTweak = 11 initanim = Init_FSTailslide Anim = FSTailslide_range OutAnim = FSTailslide_Out type = Slide NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_TailGrinds_FS IsExtra = <IsExtra> }
endscript
script Trick_Tailslide_BS
  if BadLedge
    Goto Trick_NoseSlide_FS_ok Params = { IsExtra = <IsExtra> }
  else
    Goto Trick_Tailslide_BS_ok Params = { IsExtra = <IsExtra> }
  endif
endscript
script Trick_Tailslide_BS_ok name = 'BS Tailslide'
  Grind { name = <name> score = 150 GrindTweak = 11 initanim = Init_Tailslide Anim = Tailslide_range OutAnim = BSTailslide_Out type = Slide NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails Extratricks = Extra_TailGrinds_BS IsExtra = <IsExtra> }
endscript
script Trick_Tailslide_FS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_Tailslide_BS Params = { NoBlend = yes }
endscript
script Trick_Tailslide_BS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_Tailslide_FS Params = { NoBlend = yes }
endscript
script Trick_NoseSlide_FS
  if BadLedge
    Goto Trick_Tailslide_BS_ok Params = { IsExtra = <IsExtra> }
  else
    Goto Trick_NoseSlide_FS_ok Params = { IsExtra = <IsExtra> }
  endif
endscript
script Trick_NoseSlide_FS_ok name = 'FS Noseslide'
  Grind { name = <name> score = 150 GrindTweak = 11 initanim = Init_FSNoseslide Anim = FSNoseslide_range type = Slide Nollie = yes OutAnim = FSNoseSlide_Out NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails Extratricks = Extra_NoseGrinds_FS IsExtra = <IsExtra> }
endscript
script Trick_NoseSlide_BS
  if BadLedge
    Goto Trick_Tailslide_FS_ok Params = { IsExtra = <IsExtra> }
  else
    Goto Trick_NoseSlide_BS_ok Params = { IsExtra = <IsExtra> }
  endif
endscript
script Trick_NoseSlide_BS_ok name = 'BS Noseslide'
  Grind { name = <name> score = 150 GrindTweak = 11 initanim = Init_Noseslide Anim = Noseslide_range OutAnim = BSNoseslide_Out type = Slide Nollie = yes NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_NoseGrinds_BS IsExtra = <IsExtra> }
endscript
script Trick_Noseslide_FS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_NoseSlide_BS Params = { NoBlend = yes }
endscript
script Trick_Noseslide_BS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_NoseSlide_FS Params = { NoBlend = yes }
endscript
script Trick_Nosegrind_FS name = 'FS Nosegrind'
  Grind { name = <name> score = 100 initanim = Init_Nosegrind Anim = NoseGrind_Range type = Grind Nollie = yes NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_NoseGrinds_FS IsExtra = <IsExtra> }
endscript
script Trick_Nosegrind_BS name = 'BS Nosegrind'
  Grind { name = <name> score = 100 initanim = Init_Nosegrind Anim = NoseGrind_Range type = Grind Nollie = yes NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_NoseGrinds_BS IsExtra = <IsExtra> }
endscript
script Trick_NoseGrind_BS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_5_0_FS Params = { NoBlend = yes }
endscript
script Trick_NoseGrind_FS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_5_0_BS Params = { NoBlend = yes }
endscript
script Trick_5_0_FS name = 'FS 5-0'
  Grind { name = <name> score = 100 initanim = Init_Tailgrind Anim = TailGrind_Range type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_TailGrinds_FS IsExtra = <IsExtra> }
endscript
script Trick_5_0_BS name = 'BS 5-0'
  Grind { name = <name> score = 100 initanim = Init_Tailgrind Anim = TailGrind_Range type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_TailGrinds_BS IsExtra = <IsExtra> }
endscript
script Trick_5_0_FS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_Nosegrind_BS Params = { NoBlend = yes }
endscript
script Trick_5_0_BS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_Nosegrind_BS Params = { NoBlend = yes }
endscript
script Trick_Crooked_FS name = 'FS Crooked'
  Grind { name = <name> score = 125 GrindTweak = 9 initanim = Init_FSCrooked Anim = FSCrooked_range type = Grind Nollie = yes NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_NoseGrinds_FS IsExtra = <IsExtra> }
endscript
script Trick_Crooked_FS_rot
  Rotate
  Goto Trick_Crooked_FS
endscript
script Trick_Crooked_BS name = 'BS Crooked'
  Grind { name = <name> score = 125 GrindTweak = 9 initanim = Init_BSCrooked Anim = BSCrooked_range type = Grind Nollie = yes NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_NoseGrinds_BS IsExtra = <IsExtra> }
endscript
script Trick_Crooked_FS_180
  if backwards
    Printf "I'm backwards............"
  endif
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_Crooked_BS Params = { NoBlend = yes }
endscript
script Trick_Crooked_BS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_Crooked_FS Params = { NoBlend = yes }
endscript
script Trick_NGCRook_FS_rot
  Rotate
  Printf "fixed it bitches................................"
  Goto Trick_NGCRook_FS
endscript
script Trick_NGCRook_FS name = 'FS Overcrook'
  Grind { name = <name> score = 125 GrindTweak = 9 initanim = Init_FSOvercrook Anim = FSOvercrook_range type = Grind Nollie = yes NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_NoseGrinds_FS IsExtra = <IsExtra> }
endscript
script Trick_NGCrook_BS name = 'BS Overcrook'
  Grind { name = <name> score = 125 GrindTweak = 9 initanim = Init_BSOvercrook Anim = BSOvercrook_range type = Grind Nollie = yes NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_NoseGrinds_BS IsExtra = <IsExtra> }
endscript
script Trick_NGCRook_FS_180
  FlipAndRotate
  Goto Trick_NGCrook_BS Params = { NoBlend = yes }
endscript
script Trick_NGCrook_BS_180
  FlipAndRotate
  Goto Trick_NGCRook_FS Params = { NoBlend = yes }
endscript
script Trick_Smith_FS name = 'FS Smith'
  Grind { name = <name> score = 125 GrindTweak = 9 initanim = Init_FSSmith Anim = FSSmith_range type = Grind NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = Extra_TailGrinds_FS IsExtra = <IsExtra> }
endscript
script Trick_Smith_FS_rot
  Rotate
  Goto Trick_Smith_FS
endscript
script Trick_Smith_BS name = 'BS Smith'
  Grind { name = <name> score = 125 GrindTweak = 9 initanim = Init_BSSmith Anim = BSSmith_range type = Grind NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = Extra_TailGrinds_BS IsExtra = <IsExtra> }
endscript
script Trick_Smith_FS_180
  FlipAndRotate
  Goto Trick_Smith_BS Params = { NoBlend = yes }
endscript
script Trick_Smith_BS_180
  FlipAndRotate
  Goto Trick_Smith_FS Params = { NoBlend = yes }
endscript
script Trick_Feeble_FS name = 'FS Feeble'
  Grind { name = <name> score = 125 GrindTweak = 9 initanim = Init_FSFeeble Anim = FSFeeble_range type = Grind NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = Extra_TailGrinds_FS IsExtra = <IsExtra> }
endscript
script Trick_Feeble_FS_rot
  Rotate
  Goto Trick_Feeble_FS
endscript
script Trick_Feeble_BS name = 'BS Feeble'
  Grind { name = <name> score = 125 GrindTweak = 9 initanim = Init_BSFeeble Anim = BSFeeble_range type = Grind NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = Extra_TailGrinds_BS IsExtra = <IsExtra> }
endscript
script Trick_Feeble_FS_180
  FlipAndRotate
  Goto Trick_Feeble_BS Params = { NoBlend = yes }
endscript
script Trick_Feeble_BS_180
  FlipAndRotate
  Goto Trick_Feeble_FS Params = { NoBlend = yes }
endscript
script Trick_Bluntslide_BS name = 'BS Bluntslide'
  Grind { name = <name> score = 250 GrindTweak = 18 initanim = Init_BSBluntSlide Anim = BSBluntSlide_range type = Slide NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_TailGrinds_BS IsExtra = <IsExtra> }
endscript
script Trick_Bluntslide_FS name = 'FS Bluntslide'
  Grind { name = <name> score = 250 GrindTweak = 18 initanim = Init_FSBluntSlide Anim = FSBluntSlide_range type = Slide NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails Extratricks = Extra_TailGrinds_FS IsExtra = <IsExtra> }
endscript
script Trick_NoseBluntSlide_BS name = 'BS Nosebluntslide'
  Grind { name = <name> score = 250 GrindTweak = 18 initanim = Init_BSNoseblunt Anim = BSNoseblunt_range type = Slide NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails Extratricks = Extra_NoseGrinds_BS IsExtra = <IsExtra> Nollie = yes }
endscript
script Trick_NoseBluntSlide_FS name = 'FS Nosebluntslide'
  Grind { name = <name> score = 250 GrindTweak = 18 initanim = Init_FSNoseblunt Anim = FSNoseblunt_range type = Slide NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Nollie = yes IsExtra = <IsExtra> Extratricks = Extra_NoseGrinds_FS }
endscript
script Trick_Bluntslide_BS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_Bluntslide_BS Params = { NoBlend = yes }
endscript
script Trick_Bluntslide_FS_180
  Rotate
  BoardRotateAfter
  Goto Trick_Bluntslide_FS Params = { NoBlend = yes }
endscript
script Trick_Nosebluntslide_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_NoseBluntSlide_BS Params = { NoBlend = yes }
endscript
script Trick_Nosebluntslide_FS_180
  Rotate
  BoardRotateAfter
  Goto Trick_NoseBluntSlide_FS Params = { NoBlend = yes }
endscript
script Trick_Hurricane_BS
  Grind { name = 'BS Hurricane' score = 400 initanim = BSHurricaneGrind_Init Anim = BSHurricaneGrind_Range OutAnim = BSHurricaneGrind_Out type = Grind NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails Nollie = yes IsSpecial OutAnimOnOllie }
endscript
script Trick_Hurricane_FS
  Grind { name = 'FS Hurricane' score = 400 initanim = FSHurricaneGrind_Init Anim = FSHurricaneGrind_Range OutAnim = FSHurricaneGrind_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie }
endscript
script Trick_Hurricane_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_Hurricane_BS Params = { NoBlend = yes }
endscript
script Trick_Hurricane_FS_180
  Rotate
  BoardRotateAfter
  Goto Trick_Hurricane_FS Params = { NoBlend = yes }
endscript
script Trick_Darkslide_BS
  Grind { name = 'BS Darkslide' score = 400 initanim = Darkslide_Init Anim = Darkslide_Range OutAnim = Darkslide_Out type = Slide NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie BoardRotate = yes }
endscript
script Trick_Darkslide_FS
  Grind { name = 'FS Darkslide' score = 400 initanim = Darkslide_Init Anim = Darkslide_Range OutAnim = Darkslide_Out type = Slide NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie BoardRotate = yes }
endscript
script Trick_Darkslide_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_Darkslide_BS Params = { NoBlend = yes }
endscript
script Trick_Darkslide_FS_180
  Rotate
  BoardRotateAfter
  Goto Trick_Darkslide_FS Params = { NoBlend = yes }
endscript
script Trick_Coffin_BS
  Grind { name = 'BS Coffin' score = 500 initanim = CoffinGrind_Init Anim = CoffinGrind_Range OutAnim = CoffinGrind_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie }
endscript
script Trick_Coffin_FS
  Grind { name = 'FS Coffin' score = 500 initanim = CoffinGrind_Init Anim = CoffinGrind_Range OutAnim = CoffinGrind_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie }
endscript
script Trick_Coffin_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_Coffin_BS Params = { NoBlend = yes }
endscript
script Trick_Coffin_FS_180
  Rotate
  BoardRotateAfter
  Goto Trick_Coffin_FS Params = { NoBlend = yes }
endscript
script Trick_fandangle_BS
  Grind { name = 'BS Fandangle' score = 500 initanim = fandangle_Init Anim = fandangle_Range OutAnim = Fandangle_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_NoseGrinds_BS OutAnimOnOllie BoardRotate = yes }
endscript
script Trick_fandangle_FS
  Grind { name = 'FS Fandangle' score = 500 initanim = fandangle_Init Anim = fandangle_Range OutAnim = Fandangle_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_NoseGrinds_FS OutAnimOnOllie BoardRotate = yes }
endscript
script Trick_fandangle_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_fandangle_BS Params = { NoBlend = yes }
endscript
script Trick_fandangle_FS_180
  Rotate
  BoardRotateAfter
  Goto Trick_fandangle_FS Params = { NoBlend = yes }
endscript
script Trick_CrailSlide_BS
  Grind { name = 'BS Crail Slide' score = 500 initanim = CrailSlide_Init Anim = CrailSlide_Range OutAnim = CrailSlide_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_TailGrinds_BS OutAnimOnOllie }
endscript
script Trick_CrailSlide_FS
  Grind { name = 'FS Crail Slide' score = 500 initanim = CrailSlide_Init Anim = CrailSlide_Range OutAnim = CrailSlide_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_TailGrinds_FS OutAnimOnOllie }
endscript
script Trick_CrailSlide_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_CrailSlide_BS Params = { NoBlend = yes }
endscript
script Trick_CrailSlide_FS_180
  Rotate
  BoardRotateAfter
  Goto Trick_CrailSlide_FS Params = { NoBlend = yes }
endscript
script Trick_GrindOverturn_BS
  Grind { name = 'BS 5-0 Overturn' score = 500 initanim = GrindOverturn_Init Anim = GrindOverturn_Range OutAnim = GrindOverturn_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_TailGrinds_BS OutAnimOnOllie }
endscript
script Trick_GrindOverturn_FS
  Grind { name = 'FS 5-0 Overturn' score = 500 initanim = GrindOverturn_Init Anim = GrindOverturn_Range OutAnim = GrindOverturn_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_TailGrinds_FS OutAnimOnOllie }
endscript
script Trick_GrindOverturn_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_GrindOverturn_BS Params = { NoBlend = yes }
endscript
script Trick_GrindOverturn_FS_180
  Rotate
  BoardRotateAfter
  Goto Trick_GrindOverturn_FS Params = { NoBlend = yes }
endscript
script Trick_HangTenNoseGrind_BS
  Grind { name = 'Hang Ten Nosegrind' score = 500 initanim = HangTenNoseGrind_Init Anim = HangTenNoseGrind_Range OutAnim = HangTenNoseGrind_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_NoseGrinds_BS IsSpecial Nollie }
endscript
script Trick_HangTenNoseGrind_FS
  Grind { name = 'Hang Ten Nosegrind' score = 500 initanim = HangTenNoseGrind_Init Anim = HangTenNoseGrind_Range OutAnim = HangTenNoseGrind_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_NoseGrinds_FS IsSpecial Nollie }
endscript
script Trick_HangTenNoseGrind_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_HangTenNoseGrind_BS Params = { NoBlend = yes }
endscript
script Trick_HangTenNoseGrind_FS_180
  Rotate
  BoardRotateAfter
  Goto Trick_HangTenNoseGrind_FS Params = { NoBlend = yes }
endscript
script Trick_Handstand5050_BS
  Grind { name = 'Handstand 50-50' score = 500 initanim = Handstand5050Grind_Init Anim = Handstand5050Grind_Range OutAnim = Handstand5050Grind_out type = Grind NoBlend = <NoBlend>
    GrindBail = NoseManualBail2 IsSpecial OutAnimOnOllie }
endscript
script Trick_Handstand5050_FS
  Goto Trick_Handstand5050_BS
endscript
script Trick_Handstand5050_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_Handstand5050_BS Params = { NoBlend = yes }
endscript
script Trick_Handstand5050_FS_180
  Goto Trick_Handstand5050_BS_180
endscript
script Trick_RowleyDarkSlide_BS
  Grind { name = 'Rowley Darkslide' score = 500 initanim = RowleyDarkSlide_Init Anim = RowleyDarkSlide_Range OutAnim = RowleyDarkSlide_out type = Slide NoBlend = <NoBlend>
    GrindBail = Nutter IsSpecial OutAnimOnOllie BoardRotate = yes }
endscript
script Trick_RowleyDarkSlide_FS
  Goto Trick_RowleyDarkSlide_BS
endscript
script Trick_RowleyDarkSlide_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_RowleyDarkSlide_BS Params = { NoBlend = yes }
endscript
script Trick_RowleyDarkSlide_FS_180
  Goto Trick_RowleyDarkSlide_BS_180
endscript
script Trick_BigHitter_BS Extratricks = Extra_TailGrinds_BS
  Grind { name = 'Big Hitter II' score = 500 initanim = BigHitter_Init Anim = BigHitter_Range OutAnim = BigHitter_out type = Slide NoBlend = <NoBlend>
    GrindBail = Nutter IsSpecial Extratricks = <Extratricks> OutAnimOnOllie }
endscript
script Trick_BigHitter_FS
  Goto Trick_BigHitter_BS Params = { Extratricks = Extra_TailGrinds_FS }
endscript
script Trick_BigHitter_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_BigHitter_BS Params = { NoBlend = yes }
endscript
script Trick_BigHitter_FS_180
  Goto Trick_BigHitter_BS_180
endscript
script Trick_NosegrindPivot_BS Extratricks = Extra_TailGrinds_FS
  Grind { name = 'Nosegrind to Pivot' score = 500 initanim = NosegrindPivot_Init Anim = NosegrindPivot_Range OutAnim = NosegrindPivot_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial BoardRotate = yes FlipAfter = 50 Extratricks = <Extratricks> EarlyOut = Init_Tailgrind OutAnimOnOllie }
endscript
script Trick_NosegrindPivot_FS
  Goto Trick_NosegrindPivot_BS
endscript
script Trick_NosegrindPivot_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_NosegrindPivot_BS Params = { NoBlend = yes }
endscript
script Trick_NosegrindPivot_FS_180
  Goto Trick_NosegrindPivot_BS_180
endscript
script Trick_LaidBack_BS Extratricks = Extra_TailGrinds_BS
  Grind { name = 'Layback BS Smith' score = 500 initanim = FSFeebleLayback_Init Anim = FSFeebleLayback_Range OutAnim = FSFeebleLayback_Out type = Grind NoBlend = <NoBlend>
    GrindBail = Nutter IsSpecial Extratricks = <Extratricks> OutAnimOnOllie Profile = Thomas }
endscript
script Trick_LaidBack_FS Extratricks = Extra_TailGrinds_FS
  Grind { name = 'Layback FS Feeble' score = 500 initanim = FSFeebleLayback_Init Anim = FSFeebleLayback_Range OutAnim = FSFeebleLayback_Out type = Grind NoBlend = <NoBlend>
    GrindBail = Nutter IsSpecial Extratricks = <Extratricks> OutAnimOnOllie Profile = Thomas }
endscript
script Trick_LaidBack_BS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_LaidBack_FS Params = { NoBlend = yes }
endscript
script Trick_LaidBack_FS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_LaidBack_BS Params = { NoBlend = yes }
endscript
script Trick_TailblockSlide_BS Extratricks = Extra_TailGrinds_BS
  Grind { name = 'Tailblock Slide' score = 500 initanim = TailblockSlide_Init Anim = TailblockSlide_Range OutAnim = TailblockSlide_Init type = Slide NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = <Extratricks> IsSpecial }
endscript
script Trick_TailblockSlide_FS
  Goto Trick_TailblockSlide_BS Params = { Extratricks = Extra_TailGrinds_FS }
endscript
script Trick_TailblockSlide_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_TailblockSlide_BS Params = { NoBlend = yes }
endscript
script Trick_TailblockSlide_FS_180
  Goto Trick_TailblockSlide_BS_180
endscript
script Trick_HumanDart_BS
  Grind { name = 'The Human Dart' score = 500 initanim = HumanDart_Init Anim = HumanDart_Range OutAnim = HumanDart_Out type = Grind NoBlend = <NoBlend>
    GrindBail = Nutter IsSpecial OutAnimOnOllie }
endscript
script Trick_HumanDart_FS
  Goto Trick_HumanDart_BS
endscript
script Trick_HumanDart_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_HumanDart_BS Params = { NoBlend = yes }
endscript
script Trick_HumanDart_FS_180
  Goto Trick_HumanDart_BS_180
endscript
script Trick_DrunkGrind_BS
  Grind { name = 'S.U.I Grind' score = 500 initanim = DrunkGrind_Init Anim = DrunkGrind_Idle type = Grind NoBlend = <NoBlend> GrindBail = Nutter IsSpecial OutAnimOnOllie }
endscript
script Trick_DrunkGrind_FS
  Goto Trick_DrunkGrind_BS
endscript
script Trick_DrunkGrind_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_DrunkGrind_BS Params = { NoBlend = yes }
endscript
script Trick_DrunkGrind_FS_180
  Goto Trick_DrunkGrind_BS_180
endscript
script Trick_MaulRollGrind_BS
  Grind { name = 'Dark Jedi Grind' score = 500 initanim = MaulRollGrind_Init Anim = MaulRollGrind_Idle Idle type = Grind NoBlend = <NoBlend> GrindBail = Nutter IsSpecial }
endscript
script Trick_MaulRollGrind_FS
  Goto Trick_MaulRollGrind_BS
endscript
script Trick_MaulRollGrind_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_MaulRollGrind_BS Params = { NoBlend = yes }
endscript
script Trick_MaulRollGrind_FS_180
  Goto Trick_MaulRollGrind_BS_180
endscript
script Trick_PaddleGrind_BS
  Grind { name = 'Paddle Out Grind' score = 500 initanim = PaddleGrind_Init Anim = PaddleGrind_Idle Idle type = Grind NoBlend = <NoBlend> GrindBail = Nutter IsSpecial }
endscript
script Trick_PaddleGrind_FS
  Goto Trick_PaddleGrind_BS
endscript
script Trick_PaddleGrind_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_PaddleGrind_BS Params = { NoBlend = yes }
endscript
script Trick_PaddleGrind_FS_180
  Goto Trick_PaddleGrind_BS_180
endscript
script Trick_Sobriety_BS
  Grind { name = 'Sobriety Grind' score = 500 initanim = Sobriety_Init Anim = Sobriety_Range type = Grind NoBlend = <NoBlend> GrindBail = FiftyFiftyFall IsSpecial }
endscript
script Trick_Sobriety_FS
  Goto Trick_Sobriety_BS
endscript
script Trick_Sobriety_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_Sobriety_BS Params = { NoBlend = yes }
endscript
script Trick_Sobriety_FS_180
  Goto Trick_Sobriety_BS_180
endscript
script Trick_Salad_FS name = 'FS Salad'
  Grind { name = <name> score = 125 GrindTweak = 9 initanim = FSSaladGrind_Init Anim = FSSaladGrind_range type = Grind NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = Extra_TailGrinds_FS IsSpecial IsExtra = <IsExtra> }
endscript
script Trick_Salad_BS name = 'BS Salad'
  Grind { name = <name> score = 125 GrindTweak = 9 initanim = BSSaladGrind_Init Anim = BSSaladGrind_range type = Grind NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = Extra_TailGrinds_BS IsSpecial IsExtra = <IsExtra> }
endscript
script Trick_Salad_FS_180
  FlipAndRotate
  Goto Trick_Salad_BS Params = { NoBlend = yes }
endscript
script Trick_Salad_BS_180
  FlipAndRotate
  Goto Trick_Salad_FS Params = { NoBlend = yes }
endscript
script Trick_NoseSlideLipSlide_FS
  if BadLedge
    Goto Trick_NoseSlideLipSlide_BS_ok
  else
    Goto Trick_NoseSlideLipSlide_FS_ok
  endif
endscript
script Trick_NoseSlideLipSlide_FS_ok name = 'FS Noseslide LipSlide'
  Grind { name = <name> score = 500 initanim = FSNoseSlideLipSlide Anim = BSBoardslide_range type = Slide Nollie = yes NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = Extra_NoseGrinds_FS IsSpecial IsExtra = <IsExtra> }
endscript
script Trick_NoseSlideLipSlide_BS
  if BadLedge
    Goto Trick_NoseSlideLipSlide_FS_ok
  else
    Goto Trick_NoseSlideLipSlide_BS_ok
  endif
endscript
script Trick_NoseSlideLipSlide_BS_ok name = 'BS NoseSlide LipSlide'
  Grind { name = <name> score = 500 initanim = BSNoseSlideLipSlide Anim = FSBoardslide_range type = Slide Nollie = yes NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall Extratricks = Extra_NoseGrinds_BS IsSpecial IsExtra = <IsExtra> }
endscript
script Trick_NoseSlideLipSlide_FS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_NoseSlideLipSlide_BS Params = { NoBlend = yes }
endscript
script Trick_NoseSlideLipSlide_BS_180
  FlipAndRotate
  BoardRotateAfter
  Goto Trick_NoseSlideLipSlide_FS Params = { NoBlend = yes }
endscript
script Trick_BoomBox_BS
  Grind { name = 'Ghetto Blastin' score = 500 initanim = BoomBox_Init Anim = BoomBox_Idle type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Stream = GhettoBlastin SpecialItem_details = boombox_details }
endscript
script Trick_BoomBox_FS
  Goto Trick_BoomBox_BS
endscript
script Trick_BoomBox_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_BoomBox_BS Params = { NoBlend = yes }
endscript
script Trick_BoomBox_FS_180
  Goto Trick_BoomBox_BS_180
endscript
script Trick_CrookedBigSpin_BS
  Grind { name = 'Crook BigSpinFlip Switch FS Crook' score = 500 special_item initanim = CrookBigSpinFlipCrook Anim = FSCrooked_range OutAnim = Init_FSCrooked OutAnimBackwards type = Grind NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails IsSpecial FlipAfterInit }
endscript
script Trick_CrookedBigSpin_FS
  Goto Trick_CrookedBigSpin_BS Params = { NoBlend = yes name = 'Overcrook BigSpinFlip Overcrook' }
endscript
script Trick_CrookedBigSpin_BS_180
  Rotate
  BoardRotateAfter
  Goto Trick_CrookedBigSpin_BS Params = { NoBlend = yes }
endscript
script Trick_CrookedBigSpin_FS_180
  Goto Trick_CrookedBigSpin_BS_180
endscript
script Trick_FlipKickDad2
  Grind { name = 'Flip Kick Dad' score = 500 initanim = FlipKickDad_Init Anim = FlipKickDad Stream = FlipKickD type = Grind NoBlend = <NoBlend> Idle
    GrindBail = FiftyFiftyFall ScreenShake = 45 IsSpecial }
endscript
script Trick_FlipKickDad2_180
  Rotate
  BoardRotateAfter
  Goto Trick_FlipKickDad2 Params = { NoBlend = yes }
endscript
script Trick_FalconSlide2
  Grind { name = 'Falcon Slide' score = 500 initanim = FalconSlide_Init Anim = FalconSlide_Idle Idle OutAnim = FalconSlide_out type = Slide
    GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie Extratricks = Extra_FS_Grinds }
endscript
script Trick_FalconSlide2_180
  BackwardsGrind Grind = Trick_FalconSlide2
endscript
script Trick_50Fingerflip2
  Grind { name = '5-0 Fingerflip Nosegrind' score = 500 initanim = TailGrindFingerFlip Anim = NoseGrind_Range type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_TailGrinds_BS }
endscript
script Trick_50Fingerflip2_180
  BackwardsGrind Grind = Trick_50Fingerflip2
endscript
script Trick_FroggyGrind2
  Grind { name = 'Froggy Grind' score = 500 initanim = FroggyGrind_Init Anim = FroggyGrind_Idle Idle OutAnim = FroggyGrind_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_5050_FS OutAnimOnOllie }
endscript
script Trick_FroggyGrind2_180
  BackwardsGrind Grind = Trick_FroggyGrind2
endscript
script Trick_CartWheelto50502
  Grind { name = 'Cartwheel 50-50' score = 500 initanim = CartwheelTo5050 Anim = FiftyFifty_Range type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_5050_FS }
endscript
script Trick_CartWheelto50502_180
  BackwardsGrind Grind = Trick_CartWheelto50502
endscript
script Trick_MPCGrind2
  Grind { name = 'Muska Beatz' score = 500 initanim = MPCGrind_Init Anim = MPCGrind_Idle Idle type = Slide NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails Extratricks = Extra_TailGrinds_FS Stream = MuskaBeatz SpecialItem_details = MPC_Details IsSpecial }
endscript
script Trick_MPCGrind2_180
  BackwardsGrind Grind = Trick_MPCGrind2
endscript
script Trick_SprayPaintGrind2
  Grind { name = 'Ghetto Tag Grind' score = 500 initanim = SprayPaint_Init Anim = SprayPaint_Range OutAnim = SprayPaint_Out type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_TailGrinds_FS OutAnimOnOllie Stream = GhettoTagGrind SpecialItem_details = SprayCan_Details }
endscript
script Trick_SprayPaintGrind2_180
  BackwardsGrind Grind = Trick_SprayPaintGrind2
endscript
script Trick_DaffyBrokenGrind2
  Grind { name = 'Daffy Grind' score = 500 initanim = DaffyBroken_Init Anim = DaffyBroken_Range type = Grind NoBlend = <NoBlend>
    GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_TailGrinds_FS SpecialItem_details = bustedboard_details }
endscript
script Trick_DaffyBrokenGrind2_180
  BackwardsGrind Grind = Trick_DaffyBrokenGrind2
endscript
script Trick_RocketTailslide_FS name = 'FS Rocket Tailslide'
  Grind { name = <name> score = 500 initanim = RocketFS_Init Anim = RocketFS_Range type = Slide NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = Extra_TailGrinds_FS IsSpecial IsExtra = <IsExtra> }
endscript
script Trick_RocketTailslide_BS name = 'BS Rocket Tailslide'
  Grind { name = <name> score = 500 initanim = Rocket_Init Anim = Rocket_Range type = Slide NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = Extra_TailGrinds_BS IsSpecial IsExtra = <IsExtra> }
endscript
script Trick_RocketTailslide_FS_180
  FlipAndRotate
  Goto Trick_RocketTailslide_BS Params = { NoBlend = yes }
endscript
script Trick_RocketTailslide_BS_180
  FlipAndRotate
  Goto Trick_RocketTailslide_FS Params = { NoBlend = yes }
endscript
script Trick_GuitarSlide2
  Grind { name = 'Faction Guitar Slide' score = 500 initanim = Guitar_Init Anim = Guitar_Idle Idle type = Slide NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails Extratricks = Extra_TailGrinds_FS Stream = GuitarSlide SpecialItem_details = Guitar_Details IsSpecial }
endscript
script Trick_GuitarSlide2_180
  BackwardsGrind Grind = Trick_GuitarSlide2
endscript
script Trick_AmericanHero2
  Grind { name = 'American Tribute' score = 500 initanim = AmericanHeroGrind_Init Anim = AmericanHeroGrind_Idle OutAnim = AmericanHeroGrind_out Idle type = Grind NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails Extratricks = Extra_TailGrinds_FS IsSpecial SpecialItem_details = flag_Details SpecialSounds = Jamie_HeroSounds }
endscript
script Trick_AmericanHero2_180
  BackwardsGrind Grind = Trick_AmericanHero2
endscript
script Trick_FerretFight2
  Grind { name = 'Ferret Fight' score = 500 initanim = Ferret_Init Anim = Ferret_Idle Idle type = Grind NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails OutAnimOnOllie Extratricks = Extra_TailGrinds_FS IsSpecial Stream = FerretFight SpecialItem_details = Ferret_details }
endscript
script Trick_BballSlide2
  Grind { name = 'B-Ballin Slide' score = 500 initanim = BasketballSlide_Init Anim = BasketballSlide_Idle OutAnim = BasketballSlide_out OutAnimOnOllie Idle type = Slide NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails Extratricks = Extra_TailGrinds_FS IsSpecial Stream = BballinSlide SpecialItem_details = basketball_details }
endscript
script Trick_BballSlide2_180
  BackwardsGrind Grind = Trick_BballSlide2
endscript
script Trick_DoubleBluntSlide2
  Grind { name = 'Double Blunt Slide' score = 500 initanim = DoubleBlunt_Init Anim = DoubleBlunt_Idle Idle type = Slide NoBlend = <NoBlend>
    GrindBail = BackwardsGrindBails Extratricks = Extra_TailGrinds_FS IsSpecial }
endscript
script Trick_DoubleBluntSlide2_180
  BackwardsGrind Grind = Trick_DoubleBluntSlide2
endscript
script Trick_ElbowSmash2
  Grind { name = 'Elbow Smash' score = 500 initanim = ElbowSmash_Init Anim = ElbowSmash_Idle Idle OutAnim = Elbowsmash_out OutAnimOnOllie type = Slide NoBlend = <NoBlend> Idle
    GrindBail = FiftyFiftyFall ScreenShake = 60 IsSpecial }
endscript
script Trick_ElbowSmash2_180
  Rotate
  BoardRotateAfter
  Goto Trick_ElbowSmash2 Params = { NoBlend = yes }
endscript
script Trick_QuickDraw2
  Grind { name = 'Quick Draw' score = 500 initanim = JangoQuickDraw_Init Anim = JangoQuickDraw_Idle Idle OutAnim = JangoQuickDraw_out OutAnimOnOllie type = Grind NoBlend = <NoBlend> Idle
    GrindBail = FiftyFiftyFall ScreenShake IsSpecial SpecialItem_details = pistol_details }
endscript
script Trick_QuickDraw2_180
  Rotate
  BoardRotateAfter
  Goto Trick_QuickDraw2 Params = { NoBlend = yes }
endscript
script Trick_HulaHoop2
  Grind { name = 'Hula Hoopin' score = 500 initanim = HulaHoopGrind_Init Anim = HulaHoopGrind_Idle Idle OutAnim = HulaHoopGrind_out type = Grind NoBlend = <NoBlend> Idle OutAnimOnOllie
    GrindBail = FiftyFiftyFall IsSpecial SpecialItem_details = Hulahoop_details }
endscript
script Trick_HulaHoop2_180
  Rotate
  BoardRotateAfter
  Goto Trick_HulaHoop2 Params = { NoBlend = yes }
endscript
script Trick_RockOutGrind2
  Grind { name = 'Headbangers Unite!' score = 500 initanim = RockOutGrind_Init Anim = RockOutGrind_Idle Idle type = Grind NoBlend = <NoBlend> Idle
    GrindBail = BackwardsGrindBails Stream = EddieGuitar IsSpecial }
endscript
script Trick_RockOutGrind2_180
  Rotate
  BoardRotateAfter
  Goto Trick_RockOutGrind2 Params = { NoBlend = yes }
endscript
script Trick_OneFootSmith_FS name = 'FS One Foot Smith'
  Grind { name = <name> score = 500 initanim = SmithFS_Init Anim = SmithFS_Range type = Slide NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = Extra_TailGrinds_FS IsSpecial IsExtra = <IsExtra> }
endscript
script Trick_OneFootSmith_BS name = 'BS One Foot Smith'
  Grind { name = <name> score = 500 initanim = Smith_Init Anim = Smith_Range type = Grind NoBlend = <NoBlend>
    GrindBail = Nutter Extratricks = Extra_TailGrinds_BS IsSpecial IsExtra = <IsExtra> }
endscript
script Trick_OneFootSmith_FS_180
  FlipAndRotate
  Goto Trick_OneFootSmith_BS Params = { NoBlend = yes }
endscript
script Trick_OneFootSmith_BS_180
  FlipAndRotate
  Goto Trick_OneFootSmith_FS Params = { NoBlend = yes }
endscript
script BackwardsGrind
  Rotate
  BoardRotateAfter
  Goto <Grind> Params = { NoBlend = yes }
endscript
