off = 0
on = 1
script DoingTrickBail
  if backwards
    GotoRandomScript [ BackwardFaceSlam Shoulders ]
  else
    if SpeedLessThan 550
      if AirTimeLessThan 1 second
        Goto Runout
      endif
    endif
    if LandedFromVert
      GotoRandomScript [ Kneeslide Faceplant LandPartiallyOnBoard Facesmash NoseManualBail ManualBail Hipper Spasmodic TailslideOut ]
    else
      GotoRandomScript [ Faceplant LandPartiallyOnBoard Facesmash NoseManualBail ManualBail Hipper Spasmodic TailslideOut ]
    endif
  endif
endscript
script YawBail
  if YawingLeft
    if Flipped
      GotoRandomScript [ Splits Rolling AnkleBust1 AnkleBust2 Facesmash NoseManualBail Hipper Spasmodic Faceplant ]
    else
      GotoRandomScript [ Fallback Shoulders ]
    endif
  else
    if Flipped
      GotoRandomScript [ Fallback Shoulders ]
    else
      GotoRandomScript [ Splits Rolling AnkleBust1 AnkleBust2 Facesmash NoseManualBail Hipper Spasmodic Faceplant TailslideOut ]
    endif
  endif
endscript
script PitchBail
  GotoRandomScript [ HeadFirstSplat Neckbreaker ]
endscript
script FiftyFiftyFall
  GotoRandomScript [ Rolling FiftyFiftyFallForward FiftyFiftyFallBackward Hipper Spasmodic TailslideOut MissBackFoot ]
endscript
script Nutter
  if Ledge
    Goto FiftyFiftyFall
  else
    GotoRandomScript [ NutterForward NutterBackward MissBackFoot ]
  endif
endscript
script BackwardsGrindBails
  GotoRandomScript [ Shoulders ]
endscript
BAILSCRIPT = Kneeslide
script Kneeslide
  GeneralBail { Anim1 = Kneeslide BoardOffFrame = 1 Anim2 = Kneeslide_resume IntoAirFrame = 1 Friction = 24 SmackAnim = SmackWallFeet
    Sound = bail_knee1 FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script Faceplant
  GeneralBail { Anim1 = Faceplant BoardOffFrame = 10 Anim2 = Kneeslide_resume IntoAirFrame = 1 Bloodframe = 14 SmackAnim = SmackWallFeet
    Sound = bail_knee1 FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script MissBackFoot
  GeneralBail { Anim1 = NSMissBackFoot BoardOffFrame = 95 Anim2 = NSMissBackFoot_Resume IntoAirFrame = 1 SmackAnim = SmackWallFeet
    Sound = bail_knee1 FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script AnkleBust1
  GeneralBail { Anim1 = AnkleBust1 BoardOffFrame = 1 Anim2 = GetUpBackwards IntoAirFrame = 1 Friction = 15 SmackAnim = SmackWallFeet
    Sound = bail_knee1 FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script AnkleBust2
  GeneralBail { Anim1 = AnkleBust2 BoardOffFrame = 36 Anim2 = GetUpTailslideOut IntoAirFrame = 1 Friction = 17 SmackAnim = SmackWallFeet
    Sound = bail_knee1 FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script Splits
  GeneralBail { Anim1 = Splits BoardOffFrame = 1 Anim2 = Kneeslide_resume IntoAirFrame = 1 Friction = 24 SmackAnim = SmackWallFeet
    Sound = bail_knee1 FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script Rolling
  GeneralBail { Anim1 = Rolling BoardOffFrame = 16 IntoAirFrame = 1 Friction = 15 SmackAnim = SmackWallFeet
    Sound = bail_knee1 FoleySound NoBlending BoardEarlyOn
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script Shoulders
  GeneralBail { Anim1 = Shoulders BoardOffFrame = 19 Anim2 = GetUpForwards IntoAirFrame = 20 Friction = 15 SmackAnim = Smackwallupright
    Sound = BoardBail01 FoleySound Bloodframe = 20
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script Hipper
  GeneralBail { Anim1 = Hips BoardOffFrame = 14 Anim2 = GetUpHips IntoAirFrame = 20 Friction = 11 SmackAnim = SmackWallFeet
    Sound = Bail04 NoBlending FoleySound NoBlending Friction2 = 17
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script Spasmodic
  GeneralBail { Anim1 = Spasmodic BoardOffFrame = 17 Anim2 = GetUpSpasmodic IntoAirFrame = 20 Friction = 14 SmackAnim = SmackWallFeet
    Sound = Bail04 FoleySound NoBlending Friction2 = 14 Bloodframe = 48
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script TailslideOut
  GeneralBail { Anim1 = TailslideOut Anim2 = GetUpTailslideOut BoardOffFrame = 16 IntoAirFrame = 30 Bloodframe = 40 SmackAnim = SmackWall Sound = Bail04
    FoleySound BonkSound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script HeadFirstSplat
  GeneralBail { Anim1 = HeadFirstSplat BoardOffFrame = 60 Anim2 = GetUpBackwards IntoAirFrame = 1 Friction = 15 SmackAnim = SmackWallFeet
    Sound = Bail04 FoleySound NoBlending
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script Neckbreaker
  GeneralBail { Anim1 = Neckbreaker BoardOffFrame = 1 Anim2 = GetUpFacing IntoAirFrame = 1 Friction = 15 SmackAnim = SmackWallFeet
    Sound = Bail04 FoleySound NoBlending
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script NoseManualBail2
  GeneralBail { Anim1 = SlipForwards BoardOffFrame = 10 Anim2 = GetUpForwards IntoAirFrame = 20 Friction = 15 SmackAnim = Smackwallupright
    Sound = BoardBail01 FoleySound Bloodframe = 20
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script Trolley_BailB
  GeneralBail { Anim1 = Trolley_BailB BoardOffFrame = 11 Anim2 = GetUpForwards IntoAirFrame = 20 Friction = 15 SmackAnim = Smackwallupright
    Sound = BoardBail01 FoleySound Bloodframe = 20
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script MaulBail
  GeneralBail { Anim1 = SlipBackwards BoardOffFrame = 10 Anim2 = GetUpDarthMaul IntoAirFrame = 20 Friction = 18 SmackAnim = SmackWallFeet
    Sound = bodysmackA FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFallBack AnimFall2 = BigDrop AnimFall3 = GetUpFacing }
endscript
script LandPartiallyOnBoard
  GeneralBail { Anim1 = LandPartiallyOnBoard BoardOffFrame = 20 Anim2 = GetUpForwards IntoAirFrame = 1 Friction = 15 SmackAnim = SmackWallFeet
    Sound = bail_knee1 FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script Runout
  if SpeedLessThan 400
    GeneralBail { Anim1 = RunOutQuick IntoAirFrame = 1 Friction = 11 BoardAlwaysOn BashOff NoBlood
      Sound = Bailrunoutflip NoScuff
      GroundGoneBail = GroundGoneBail AnimFall1 = RunOutDropIdle AnimFall2 = RunOutDrop }
  else
    GeneralBail { Anim1 = Runout IntoAirFrame = 1 SmackAnim = Smackwallupright Friction = 13 BoardAlwaysOn BashOff NoBlood
      Sound = Bailrunoutflip NoScuff
      GroundGoneBail = GroundGoneBail AnimFall1 = RunOutDropIdle AnimFall2 = RunOutDrop }
  endif
endscript
script BackwardFaceSlam
  Flip
  GeneralBail { Anim1 = BackwardFaceSlam Anim2 = GetUpFacing IntoAirFrame = 50 Bloodframe = 25 SmackAnim = SmackWallFeet
    Sound = bail_backward1 FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = FeetFirstFallFront AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script BackwardsFall
  GeneralBail { Anim1 = BackwardsTest Anim2 = GetUpBackwards IntoAirFrame = 62 Bloodframe = 50 SmackAnim = SmackWallFeet
    Sound = boardbail02 HitBody FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = FeetFirstFallFront AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script Fallback
  GeneralBail { Anim1 = Fallback Anim2 = Fallback_resume IntoAirFrame = 20 Bloodframe = 35
    Sound = Bail04 FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = Fallback AnimFall2 = BigDrop AnimFall3 = GetUpFacing }
endscript
script FiftyFiftyFallForward
  GeneralBail { Anim1 = FiftyFiftyFallForward Anim2 = GetUpFacing IntoAirFrame = 40 Bloodframe = 50 SmackAnim = SmackWall Sound = Bail04
    FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script FiftyFiftyFallBackward
  GeneralBail { Anim1 = FiftyFiftyFallBackward Anim2 = GetUpForwards IntoAirFrame = 50 Bloodframe = 50 SmackAnim = SmackWallFeet Sound = Bail04
    FoleySound
    GroundGoneBail = GroundGoneBail AnimFall1 = FeetFirstFallFront AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script NutterForward
  GeneralBail { Anim1 = NutterFallForward Anim2 = GetUpForwards IntoAirFrame = 30 Bloodframe = 50 SmackAnim = SmackWall Sound = Bail04
    FoleySound BonkSound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script NutterBackward
  GeneralBail { Anim1 = NutterFallBackward Anim2 = FaceSmash_resume IntoAirFrame = 30 SmackAnim = SmackWallFeet Sound = Bail04
    FoleySound BonkSound
    GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
endscript
script GeneralBail Friction = 18 Friction2 = 20 HeavyFriction = 100
  KillSpecial
  SpawnClothingLandScript
  if not GotParam NoScuff
    PlaySkaterStream type = "bail"
  endif
  SetSkaterCamLerpReductionTimer time = 0
  InBail
  SetTags state = skater_inbail
  SetExtraPush radius = 48 speed = 100 Rotate = 6
  TurnToFaceVelocity
  SparksOff
  VibrateOff
  ClearGapTricks
  ClearExceptions
  DisablePlayerInput AllowCameraControl
  ClearPanel_Bailed
  StopBalanceTrick
  SetException Ex = CarBail Scr = CarBail
  if GotParam GroundGoneBail
    SetException Ex = GroundGone Scr = <GroundGoneBail> params = { <...> }
  endif
  if GotParam SmackAnim
    SetException Ex = FlailHitWall Scr = BailSmack params = { SmackAnim = <SmackAnim> }
    SetException Ex = FlailLeft Scr = BailSmack params = { SmackAnim = <SmackAnim> }
    SetException Ex = FlailRight Scr = BailSmack params = { SmackAnim = <SmackAnim> }
  endif
  if InSlapGame
    SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  endif
  if GotParam Sound
    PlaySound <Sound>
  else
    PlayBonkSound
  endif
  if GotParam NoBlending
    PlayAnim Anim = <Anim1> NoRestart Blendperiod = 0.0
  else
    PlayAnim Anim = <Anim1> NoRestart Blendperiod = 0.3
  endif
  if GotParam BashOff
  else
    BashOn
  endif
  if GotParam BoardAlwaysOn
  else
    Obj_SpawnScript BailBoardControl params = { BoardOffFrame = <BoardOffFrame> }
  endif
  if OnRail
    WaitAnim frame <IntoAirFrame>
    Move y = 2.0
    SetState Air
    Vibrate Actuator = 1 Percent = 100 Duration = 0.2
    Rotate y = randomrange(1, 20)
    Move x = 5
    if GotParam BonkSound
      PlayBonkSound
    endif
  endif
  WaitOnGround
  if not GotParam NoScuff
    if not GetGlobalFlag flag = BLOOD_OFF
      Scuff_skater
    endif
  endif
  if not GetGlobalFlag flag = BLOOD_OFF
    if GotParam Bloodframe
      WaitAnim frame <Bloodframe>
      Obj_SpawnScript BloodSmall
      PlaySound random( @hitblood01 @hitblood02 @hitblood04 @hitblood05 ) 
    endif
  endif
  Vibrate Actuator = 1 Percent = 100 Duration = 0.2
  SetRollingFriction <HeavyFriction>
  if GotParam HitBody
    SpawnScript HitBody params = { <...> }
  endif
  Wait 3 frames
  SetRollingFriction <Friction>
  WaitAnim 30 Percent
  SpeedCheckStop
  SetRollingFriction <Friction2>
  WaitAnim 50 Percent
  SpeedCheckStop
  BashOn
  if GotParam BoardEarlyOn
    BoardRotate normal
    SwitchOnBoard
  endif
  WaitAnim 75 Percent
  SpeedCheckStop
  if GotParam FoleySound
    PlaySound Foleymove01 vol = 50
  endif
  WaitAnimFinished
  SpeedCheckStop
  if GotParam Bloodframe
    Obj_SpawnScript BloodPool
  endif
  if GotParam Anim2
    PlayAnim Anim = <Anim2> Blendperiod = 0.0
  endif
  SetRollingFriction 20
  SpeedCheckStop
  VibrateOff
  WaitAnim 20 frames fromend
  SwitchOnBoard
  if GotParam BoardAlwaysOn
  else
    BoardRotate normal
  endif
  WaitAnimFinished
  Goto Baildone
endscript
script Scuff_skater
   <scuffspot> = randomrange(0, 4)
  if ( <scuffspot> > 3 )
  else
    if ( <scuffspot> = 3 )
      Scuff_DoReplacement src = "CS_NH_scar_armR.png" scuffspot = <scuffspot>
    else
      if ( <scuffspot> = 2 )
        Scuff_DoReplacement src = "CS_NH_scar_armL.png" scuffspot = <scuffspot>
      else
        if ( <scuffspot> = 1 )
          Scuff_DoReplacement src = "CS_NH_scar_legR.png" src2 = "CS_NH_scuff_legR.png" scuffspot = <scuffspot>
        else
          Scuff_DoReplacement src = "CS_NH_scar_legL.png" src2 = "CS_NH_scuff_legL.png" scuffspot = <scuffspot>
        endif
      endif
    endif
  endif
endscript
script Scuff_DoReplacement
  Obj_VarInc var = <scuffspot>
  Obj_VarGet var = <scuffspot> name = bailcount
  if GetGlobalFlag flag = CHEAT_SUPER_BLOOD
    bailcount = ( <bailcount> + 5 )
  endif
  if GotParam src2
    if ( <bailcount> > 9 )
      Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_06"
    else
      if ( <bailcount> > 7 )
        Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_05"
      else
        if ( <bailcount> > 6 )
          Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_04"
          Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_05"
        else
          if ( <bailcount> > 5 )
            Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_03"
          else
            if ( <bailcount> > 4 )
              Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scar_02"
            else
              if ( <bailcount> > 3 )
                Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_04"
                Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_01"
              else
                if ( <bailcount> > 2 )
                  Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_03"
                else
                  if ( <bailcount> > 1 )
                    Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_02"
                  else
                    Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_01"
                  endif
                endif
              endif
            endif
          endif
        endif
      endif
    endif
  else
    if ( <bailcount> > 9 )
      Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_06"
    else
      if ( <bailcount> > 7 )
        Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_05"
      else
        if ( <bailcount> > 5 )
          Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_04"
        else
          if ( <bailcount> > 3 )
            Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_03"
          else
            if ( <bailcount> > 1 )
              Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_02"
            else
              Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_01"
            endif
          endif
        endif
      endif
    endif
  endif
endscript
script CleanUp_Scuffs
  Obj_ReplaceTexture src = "CS_NH_scar_armR.png" dest = "textures/scuffs/CS_NH_scar_armR"
  Obj_ReplaceTexture src = "CS_NH_scar_armL.png" dest = "textures/scuffs/CS_NH_scar_armL"
  Obj_ReplaceTexture src = "CS_NH_scar_legR.png" dest = "textures/scuffs/CS_NH_scar_legR"
  Obj_ReplaceTexture src = "CS_NH_scar_legL.png" dest = "textures/scuffs/CS_NH_scar_legL"
  Obj_ReplaceTexture src = "CS_NH_scuff_legR.png" dest = "textures/scuffs/CS_NH_scuff_legR"
  Obj_ReplaceTexture src = "CS_NH_scuff_legL.png" dest = "textures/scuffs/CS_NH_scuff_legL"
  Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_board_trans01"
endscript
script CleanUp_Deck
  Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_board_trans01"
endscript
script DoBoardScuff
 if ( better4_misc_boardscuff_value = on )
     switch <boardscuff>
          case 10
             Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_01"
          case 20
             Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_02"
          case 30
             Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_03"
          case 40
             Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_04"
          default
     endswitch
	 Printf "Ready to scuff >>>>>>>>>>>>>>>>>>>>>>>>"
  else
     Printf "i cant get scuffed"
 endif
endscript
script BailBoardControl BoardOffFrame = 5
  Wait <BoardOffFrame> frames
  SwitchOffBoard
endscript
script SpeedCheckStop
  if SpeedLessThan 300
    SetRollingFriction 100
  endif
endscript
script HitBody hitbodyframe = 15
  Wait <hitbodyframe> frames
  PlaySound random( @Hitbody03 @HitBody04 ) 
endscript
script BailSmack SmackAnim = SmackWall
  if InSlapGame
    SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  endif
  TurnToFaceVelocity
  SwitchOffBoard
  SetRollingFriction 15
  PlayAnim Anim = <SmackAnim> Blendperiod = 0.1
  Obj_SpawnScript BloodTiny
  Vibrate Actuator = 1 Percent = 100 Duration = 0.2
  PlaySound bodysmackA
  WaitAnimFinished
  if AnimEquals SmackWall
    PlayAnim Anim = GetUpFacesmash Blendperiod = 0.1
  else
    if AnimEquals Smackwallupright
      PlayAnim Anim = GetUpBackwards Blendperiod = 0.1
    else
      PlayAnim Anim = GetUpFacing Blendperiod = 0.1
    endif
  endif
  SetRollingFriction 15
  WaitAnim 80 Percent
  SwitchOnBoard
  BoardRotate normal
  WaitAnimFinished
  Goto Baildone
endscript
script Facesmash
  SetSkaterCamLerpReductionTimer time = 0
  InBail
  SetExtraPush radius = 48 speed = 100 Rotate = 6
  TurnToFaceVelocity
  SwitchOffBoard
  VibrateOff
  ClearGapTricks
  ClearPanel_Bailed
  DisablePlayerInput AllowCameraControl
  ClearExceptions
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = FlailHitWall Scr = BailSmack params = { SmackAnim = Smackwallupright }
  SetException Ex = FlailLeft Scr = BailSmack params = { SmackAnim = Smackwallupright }
  SetException Ex = FlailRight Scr = BailSmack params = { SmackAnim = Smackwallupright }
  SetException Ex = GroundGone Scr = GroundGoneBail params = { AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
  if InSlapGame
    SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  endif
  PlaySound Bail04
  PlayAnim Anim = FaceFall NoRestart Blendperiod = 0.3
  BashOn
  Wait 20 frames
  begin
    if OnGround
      break
    else
      WaitOneGameFrame
    endif
  repeat
  SetRollingFriction 15
  Vibrate Actuator = 1 Percent = 100 Duration = 0.2
  if not GetGlobalFlag flag = BLOOD_OFF
    Obj_SpawnScript BloodSmall
  endif
  PlaySound bodysmackA
  WaitAnim 50 Percent fromend
  SetException Ex = FlailHitWall Scr = BailSmack params = { SmackAnim = SmackWall }
  SetException Ex = FlailLeft Scr = BailSmack params = { SmackAnim = SmackWall }
  SetException Ex = FlailRight Scr = BailSmack params = { SmackAnim = SmackWall }
  WaitAnimFinished
  if SpeedGreaterThan 300
    PlayAnim Anim = FaceFallBigHit NoRestart Blendperiod = 0.1
    Vibrate Actuator = 1 Percent = 100 Duration = 0.2
    PlaySound headsmackB
  else
    PlayAnim Anim = FaceFallSmallHit NoRestart Blendperiod = 0.1
    Vibrate Actuator = 1 Percent = 100 Duration = 0.2
    PlaySound headsmackB vol = 75
  endif
  WaitAnimFinished
  ClearExceptions
  if InSlapGame
    SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  endif
  PlayAnim Anim = GetUpFacesmash Blendperiod = 0.1
  WaitAnim 70 Percent
  SwitchOnBoard
  BoardRotate normal
  WaitAnimFinished
  Goto Baildone
endscript
script GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat
  InBail
  ClearExceptions
  if InSlapGame
    SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  endif
  DisablePlayerInput AllowCameraControl
  SetExtraPush radius = 48 speed = 100 Rotate = 6
  SwitchOffBoard
  SetRollingFriction 20
  PlayAnim Anim = <AnimFall1> NoRestart Blendperiod = 0.3
  begin
    if AnimFinished
      PlayAnim Anim = <AnimFall1> PingPong From = End To = 20 speed = 0.5 Blendperiod = 0.1
    endif
    if OnGround
      break
    endif
    WaitOneGameFrame
  repeat
  PlaySound bodysmackA
  Vibrate Actuator = 1 Percent = 100 Duration = 0.2
  if GotParam NoBlood
  else
    Obj_SpawnScript BloodTiny
  endif
  SetRollingFriction 100
  PlayAnim Anim = <AnimFall2> NoRestart Blendperiod = 0.1
  BashOn
  if GotParam AnimFall3
    WaitAnimFinished
    PlayAnim Anim = <AnimFall3> NoRestart Blendperiod = 0.1
  endif
  WaitAnim 20 frames fromend
  BoardRotate normal
  SwitchOnBoard
  WaitAnimFinished
  Goto Baildone
endscript
script NoseManualBail
  KillSpecial
  SetSkaterCamLerpReductionTimer time = 0
  InBail
  CleanUpSpecialItems
  SetExtraPush radius = 48 speed = 100 Rotate = 6
  TurnToFaceVelocity
  VibrateOff
  ClearGapTricks
  ClearPanel_Bailed
  StopBalanceTrick
  DisablePlayerInput AllowCameraControl
  ClearExceptions
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = FlailHitWall Scr = BailSmack params = { SmackAnim = Smackwallupright }
  SetException Ex = FlailLeft Scr = BailSmack params = { SmackAnim = Smackwallupright }
  SetException Ex = FlailRight Scr = BailSmack params = { SmackAnim = Smackwallupright }
  SetException Ex = GroundGone Scr = GroundGoneBail params = { AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards }
  if InSlapGame
    SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  endif
  PlaySound random( @BoardBail01 @boardbail02 ) 
  PlayAnim Anim = SlipForwards NoRestart Blendperiod = 0.3
  BashOn
  Wait 10 frames
  SwitchOffBoard
  Wait 10 frame
  PlaySound random( @Hitbody03 @HitBody04 ) 
  Wait 10 frames
  SetRollingFriction 18
  Vibrate Actuator = 1 Percent = 100 Duration = 0.2
  if not GetGlobalFlag flag = BLOOD_OFF
    Obj_SpawnScript BloodSmall
  endif
  WaitAnim 25 Percent fromend
  SetException Ex = FlailHitWall Scr = BailSmack params = { SmackAnim = Smackwallupright }
  SetException Ex = FlailLeft Scr = BailSmack params = { SmackAnim = Smackwallupright }
  SetException Ex = FlailRight Scr = BailSmack params = { SmackAnim = Smackwallupright }
  PlaySound Foleymove01 vol = 50
  WaitAnimFinished
  Obj_SpawnScript BloodPool
  ClearExceptions
  if InSlapGame
    SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  endif
  PlayAnim Anim = GetUpForwards Blendperiod = 0.1
  SetRollingFriction 20
  Wait 50 frames
  SwitchOnBoard
  BoardRotate normal
  WaitAnimFinished
  SetRollingFriction #"default"
  Goto Baildone
endscript
script ManualBail
  KillSpecial
  InBail
  SetExtraPush radius = 48 speed = 100 Rotate = 6
  VibrateOff
  ClearGapTricks
  ClearPanel_Bailed
  DisablePlayerInput AllowCameraControl
  ClearExceptions
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = FlailHitWall Scr = BailSmack params = { SmackAnim = SmackWallFeet }
  SetException Ex = FlailLeft Scr = BailSmack params = { SmackAnim = SmackWallFeet }
  SetException Ex = FlailRight Scr = BailSmack params = { SmackAnim = SmackWallFeet }
  SetException Ex = GroundGone Scr = GroundGoneBail params = { AnimFall1 = HeadFirstFallBack AnimFall2 = BigDrop AnimFall3 = GetUpFacing }
  if InSlapGame
    SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  endif
  PlaySound Bail04 pitch = 80
  PlayAnim Anim = SlipBackwards NoRestart Blendperiod = 0.3 From = 10
  BashOn
  Wait 15 frames
  SetRollingFriction 18
  Vibrate Actuator = 1 Percent = 100 Duration = 0.2
  PlaySound bodysmackA
  SwitchOffBoard
  WaitAnimFinished
  ClearExceptions
  if InSlapGame
    SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  endif
  PlayAnim Anim = GetUpBackwards Blendperiod = 0.1
  SetRollingFriction 20
  Wait 55 frames
  SwitchOnBoard
  BoardRotate normal
  WaitAnimFinished
  Goto Baildone
endscript
script Baildone
  ClearLipCombos
  NotifyBailDone
  SetExtraPush radius = 0
  SetRollingFriction #"default"
  ClearTrickQueue
  ClearEventBuffer
  ClearManualTrick
  BashOff
  EnablePlayerInput
  NotInBail
  ClearGapTricks
  KillExtraTricks
  SetSkaterCamLerpReductionTimer time = 0
  ClearSkaterFlags
  LockVelocityDirection Off
  RestoreAutokick
  CanBrakeOn
  Goto OnGroundAI
endscript
script BloodOn size = 1 radius = 1 bone = head name = "blood_01"
  TextureSplat radius = randomrange(1, 40) size = <size> bone = head name = <name> lifetime = 20
endscript
script BloodOn_Down size = 1 radius = 1 bone = head name = "blood_01"
  TextureSplat radius = randomrange(10, 300) size = <size> bone = head name = <name> dropdown_length = 100 dropdown_vertical lifetime = 20
endscript
script BloodBig bone = "head"
  BloodOn <...> size = 10.0 freq = 2.0 rnd_radius = 12
  Wait 2 frames
  BloodOff <...>
  BloodOn <...> size = 7.0 freq = 2.0 rnd_radius = 12
  Wait 4 frames
  BloodOff <...>
  BloodOn <...> size = 3.0 freq = 0.8 rnd_radius = 12
  Wait 3 frames
  BloodOff <...>
endscript
script BloodCar bone = "head"
  Wait 30 frames
  Printf "MAKING SOME BIG BLOOD..............."
  TextureSplat radius = 2 size = 20 bone = head name = "blood_01" lifetime = 20
endscript
script BloodJackAss bone = "head"
  if not GetGlobalFlag flag = BLOOD_OFF
    Wait 30 frames
    Printf "MAKING SOME BIG BLOOD..............."
    BloodOn_Down size = randomrange(8, 15)
    BloodOn_Down size = randomrange(8, 15)
    Wait randomrange(1, 8) frames
    BloodOn_Down <...> size = randomrange(6, 12)
    BloodOn_Down <...> size = randomrange(6, 12)
    Wait randomrange(1, 8) frames
    BloodOn_Down <...> size = randomrange(4, 8)
    BloodOn_Down <...> size = randomrange(4, 8)
    Wait randomrange(1, 8) frames
    BloodOn_Down size = randomrange(2, 6)
  endif
endscript
script BloodSmall bone = "head"
  if not GetGlobalFlag flag = BLOOD_OFF
    if not GetGlobalFlag flag = CHEAT_SUPER_BLOOD
      if OnGround
        Obj_SpawnScript BloodSplat
      endif
      Wait 14 frames
      BloodOn <...> size = randomrange(8, 12) freq = 2.0 rnd_radius = 36
      Wait randomrange(1, 3) frames
      BloodOn <...> size = randomrange(6, 10) freq = 2.0 rnd_radius = 36
      Wait randomrange(1, 3) frames
      BloodOn <...> size = randomrange(4, 8) freq = 0.8 rnd_radius = 36
      Wait randomrange(1, 3) frames
      BloodOn size = randomrange(2, 6)
    else
      Obj_SpawnScript BloodSplat
      Wait 14 frames
      Obj_SpawnScript BloodSplat
      TextureSplat radius = randomrange(20, 40) size = randomrange(30, 40) bone = head name = "blood_01" lifetime = 20
      Wait 5 frame
      BloodOn <...> size = randomrange(15, 20)
      Wait 4 frame
      BloodOn <...> size = randomrange(10, 15)
      Wait 4 frame
      BloodOn <...> size = randomrange(10, 15)
      Wait 3 frames
      BloodOn size = randomrange(6, 10)
      Wait 2 frame
      BloodOn size = randomrange(6, 10)
      Wait 1 frame
      BloodOn size = randomrange(6, 10)
    endif
  endif
endscript
script BloodTiny bone = "head"
  if not GetGlobalFlag flag = BLOOD_OFF
    Obj_SpawnScript BloodSplat
    BloodOn <...> size = 5.0 freq = 2.0 rnd_radius = 12
    Wait 4 frames
    BloodOff <...>
    BloodOn <...> size = 2.0 freq = 0.8 rnd_radius = 12
    Wait 3 frames
    BloodOff <...>
  endif
endscript
script BloodSuperTiny bone = "head"
  Obj_SpawnScript BloodSplat
  BloodOn <...> size = 1.0 freq = 2.0 rnd_radius = 12
  Wait 4 frames
  BloodOff <...>
  BloodOn <...> size = 0.5 freq = 0.8 rnd_radius = 12
  Wait 3 frames
  BloodOff <...>
endscript
script BloodPool bone = "head"
endscript
script BloodSplat
  if not GetGlobalFlag flag = BLOOD_OFF
    BloodParticlesOn name = "blood_1.png" start_col = -16777046 end_col = 570425514 num = 10 emit_w = 2.0 emit_h = 2.0 angle = 10 size = 2.0 bone = head growth = 1.5 time = 0.3 speed = 250 grav = -900 life = 0.3
  endif
endscript
script SwitchOnBoard
  if not GetGlobalFlag flag = CHEAT_INLINE
    SwitchOnAtomic board
  else
    SwitchOffBoard
  endif
endscript
script SwitchOffBoard
  SwitchOffAtomic board
endscript
script CleanUpSpecialItems
  if ProfileEquals is_named = demoness
    SwitchOffAtomic special_item
    SwitchOnAtomic skin
    SwitchOnBoard
  else
    if ProfileEquals is_named = maul
    else
      SwitchOffAtomic special_item
      SwitchOnAtomic special_item_2
    endif
  endif
endscript
script SkaterCollideBall
  if InAir
    InAirExceptions
    Obj_SpawnScript CarSparks
    PlayAnim Anim = Boneless Blendperiod = 0.3
    SetTrickName "Scratchin the Ball!"
    SetTrickScore 400
    Display
    WaitAnimWhilstChecking AndManuals
    Goto Airborne
  else
    InBail
    Obj_SpawnScript BloodCar
    PlaySound bodysmackA
    Goto NoseManualBail
    LaunchPanelMessage "Ball Busted!"
  endif
endscript
script skater_play_bail_stream
  Obj_PlayStream <stream_checksum> vol = 500
endscript
