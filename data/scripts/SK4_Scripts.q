
script ScottKills
  sk3_killskater deathsound = boneless09 message1 = "poopoo" message2 = "waaaaa" message3 = "yowsers" message4 = "Cheesy Peasey likes ass" r = 0 g = 255 b = 0
endscript
script sk3_killskater
  if Obj_FlagNotSet FLAG_SKATER_KILLING
    Obj_SetFlag FLAG_SKATER_KILLING
    InBail
    if GotParam deathsound
      PlaySound <deathsound>
    else
      PlaySound hitbody02 pitch = 90 vol = 150
      PlaySound bail_knee1 pitch = 90 vol = 50
    endif
    if not GotParam NoMessage
      if not InSplitScreenGame
        if GotParam message1
          Create_Panel_Message style = panel_message_death id = death_message text = random( @
           <message1>
          @<message2>
          @<message3>
          @<message4> ) 
        else
          Create_Panel_Message style = panel_message_death id = death_message text = random( @
          "You suck!"
          @"Dont do drugs!"
          @"Nice one!"
          @"Good one!"
          @"Hmm..."
          @"Loser!"
          @"Out of bounds!" ) 
        endif
      endif
    endif
    SK3_Killskater_Finish <...>
  endif
endscript
script SK3_KillSkater_Water
  if Obj_FlagNotSet FLAG_SKATER_KILLING
    Obj_SetFlag FLAG_SKATER_KILLING
    PlaySound FallWater
    if not InSplitScreenGame
      Create_Panel_Message style = panel_message_death id = death_message text = random( @
      "All wet"
      @"You big drip!"
      @"WATER...BAAAD!"
      @"No swimming"
      @"I'm drowning!"
      @"You're hosed!" ) 
    endif
    SK3_Killskater_Finish water r = 100 g = 100 b = 200 <...>
  endif
endscript
script SK3_KillSkater_Pungee
  if Obj_FlagNotSet FLAG_SKATER_KILLING
    Obj_SetFlag FLAG_SKATER_KILLING
    PlaySound FallPungee_11
    if not InSplitScreenGame
      Create_Panel_Message style = panel_message_death id = death_message text = random( @
      "You got shafted"
      @"Who built that?!"
      @"Serve, set, spike!"
      @"Shish kabob?"
      @"Don't build this at home!" ) 
    endif
    SK3_Killskater_Finish r = 150 g = 50 b = 50 <...>
  endif
endscript
script SK4_Hide_Death_Message
  if ObjectExists id = death_message
    SetScreenElementProps id = death_message rgba = [ 0 0 0 0 ]
  endif
endscript
script SK3_Killskater_Finish r = 255 g = 255 b = 255
  PrintStruct
  ClearExceptions
  DisablePlayerInput
  if GotParam Bail
    MakeSkaterGoto Killskater_Bail
  endif
  pulse_blur start = 0 end = 255 speed = 4
  if GotParam water
    SkaterSplashOn
    PausePhysics
    Hide
    Wait 0.1 seconds
  else
    Wait 0.25 seconds
  endif
  ClearTrickQueues
  Wait 1 gameframe
  BlendPeriodOut 0
  if GotParam Nodename
    KillSkater node = <Nodename>
  else
    KillSkater
  endif
  speech_box_exit
  ClearGapTricks
  ClearEventBuffer
  ClearPanel_Bailed
  pulse_blur start = 255 end = 0 speed = 4
  Wait 0.75 seconds
  NotInBail
  Obj_ClearFlag FLAG_SKATER_KILLING
  if GoalManager_HasActiveGoals
    if GoalManager_GetActiveGoalId
      GoalManager_GetGoalParams name = <goal_id>
      if GotParam horse
        GoalManager_LoseGoal name = <goal_id>
      endif
    endif
  endif
endscript
script panel_message_death
  DoMorph pos = (320, 100) alpha = 0
  DoMorph alpha = 1 time = 0.25
  Wait 2 seconds
  DoMorph alpha = 0 time = 0.25
  Die
endscript
script Killskater_Bail
  PlayAnim Anim = SlipForwards BlendPeriod = 0.3
endscript
script SK3_TeleportToNode
  TeleportSkaterToNode <...>
endscript
script TeleportSkaterToNode r = 255 g = 255 b = 255
  if ( better4_modifier_disableteleports_value = on )
    // sk3_killskater_water <...>
    if RandomRestartNode
      sk3_killskater Nodename = <node>
    endif
  else
    if GotParam message1
      LaunchPanelMessage properties = panel_message_death <message1>
    else
      LaunchPanelMessage properties = panel_message_death "On the Move!"
    endif
    if GotParam Nodename
      Printf "Got the nodename ...................."
      if OnRail
        StopBalanceTrick
        MakeSkaterGoto GroundGone
      endif
      Obj_MoveToNode name = <Nodename> Orient NoReset
    else
      LaunchPanelMessage properties = panel_message_death "ERROR! Please pass in nodename="
    endif
    Wait 0.25 seconds
  endif
endscript
script PrepareSkaterForMove
  if OnRail
    StopBalanceTrick
    MakeSkaterGoto GroundGone
  endif
endscript
script TeleportSkaterUp dist = 2000
  Skater:SparksOff
  Skater:Move y = <dist>
endscript
script TeleportSkaterDown dist = -2000
  Skater:SparksOff
  Skater:Move y = <dist>
endscript
script MoveSkaterZ dist = 0
  if ProfileEquals is_named = demoness
    BloodParticlesOff bone = "left_wrist"
    BloodParticlesOff bone = "right_wrist"
    Printf "Particles turning off..........................................."
  endif
  SparksOff
  Move y = <dist>
endscript
FLAG_TRAFFICLIGHT_GREEN = 0
FLAG_TRAFFICLIGHT_YELLOW = 1
FLAG_TRAFFICLIGHT_RED = 2
FLAG_CAR_GENERIC_STOPPED = 3
FLAG_CAR_GENERIC_NOSOUND = 4
FLAG_CAR_SOUND_FRANTICSTOP = 5
FLAG_CAR_SKITCH = 7
FLAG_CAR_TYPE_BUS = 30
script SK4_TrafficLight01
  Obj_SetFlag FLAG_TRAFFICLIGHT_GREEN
  Create name = <Green>
  Wait randomrange(5000, 12000)
  begin
    Obj_SetFlag FLAG_TRAFFICLIGHT_YELLOW
    Obj_ClearFlag FLAG_TRAFFICLIGHT_GREEN
    Kill name = <Green>
    Create name = <Yellow>
    Wait 3000
    Obj_SetFlag FLAG_TRAFFICLIGHT_RED
    Obj_ClearFlag FLAG_TRAFFICLIGHT_YELLOW
    Kill name = <Yellow>
    Create name = <Red>
    Wait randomrange(9000, 15000)
    Obj_SetFlag FLAG_TRAFFICLIGHT_GREEN
    Obj_ClearFlag FLAG_TRAFFICLIGHT_RED
    Kill name = <Red>
    Create name = <Green>
    Wait randomrange(7000, 12000)
  repeat
endscript
script Car_Generic01 TurnDist = 20 DefaultSpeed = 40 ForwardOffset = 5 SkitchSpeed = 60 CarLoopSFX = CarLoop
  SetTags DefaultSpeed = <DefaultSpeed> Tag_TurnDist = <TurnDist> CarLoopSFX = <CarLoopSFX>
  GetTags
  Obj_SetGroundOffset 0.1
  Obj_SetPathTurnDist <Tag_TurnDist>
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 10 mphps
  Obj_SetPathDeceleration 10 mphps
  Obj_SetPathMinStopVel 5
  Obj_SetPathVelocity <DefaultSpeed> mph
  if not GotParam AllowSlow
    if ( <DefaultSpeed> < 20 )
      Printf "### CAR SPEED TOO SLOW! CHANGING TO 20mph ###"
      PrintStruct <DefaultSpeed>
       <DefaultSpeed> = 20
      PrintStruct <DefaultSpeed>
    endif
  endif
  if GotParam Bus
    Obj_SetFlag FLAG_CAR_TYPE_BUS
  endif
  if GotParam SkaterDebugBox
     <SkaterDebugBox> = debug
  endif
  if GotParam CarDebugBox
     <CarDebugBox> = debug
  endif
  if GotParam NoSound
    Obj_SetFlag FLAG_CAR_GENERIC_NOSOUND
  else
    Obj_PlaySound <CarLoopSFX>
  endif
  if GotParam NoSkater
  else
    Obj_SpawnScript Car_CheckForSkater01 params = <...>
  endif
  Obj_SpawnScript Car_CheckForOtherCar01 params = <...>
endscript
Car_CheckForSkater_Pause = 1
script Car_CheckForSkater01
  p1 = { dist = ( <DefaultSpeed> * 1.5 ) width = 15 height = 25 type = Skater offset = (0, 0, 5) <SkaterDebugBox> }
  p2 = { dist = ( <DefaultSpeed> * 1.5 ) width = 15 height = 20 type = Skater offset = (0, 0, 5) <SkaterDebugBox> }
  Change Car_CheckForSkater_Pause = ( Car_CheckForSkater_Pause + 1 )
  if ( Car_CheckForSkater_Pause > 10 )
    Change Car_CheckForSkater_Pause = 1
  endif
  Wait Car_CheckForSkater_Pause gameframes
  begin
    Wait 10 gameframes
    if LocalSkaterExists
      if Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED
        if Obj_ObjectInRect <p1>
          Obj_AdjustSound <CarLoopSFX> volumePercent = 50 volumeStep = 1.5 pitchPercent = 30 pitchStep = 1.5
          Car_Sound_FranticStop01
          Obj_StopAlongPath 8
          begin
            Wait 90 gameframes
            if Obj_ObjectInRect <p2>
              Wait 60 gameframes
              Car_Sound_RandomHonk01
            else
              Obj_AdjustSound <CarLoopSFX> volumePercent = 100 volumeStep = 0.7 pitchPercent = 100 pitchStep = 0.7
              Obj_StartAlongPath
              break
            endif
          repeat
        else
          if Skater:Skitching
            Obj_GetSpeed
            if Obj_FlagNotSet FLAG_CAR_SKITCH
              Obj_SetFlag FLAG_CAR_SKITCH
              if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
                Obj_PlaySound LA_Skid_11
              endif
              Obj_SetPathVelocity <SkitchSpeed> mph
            endif
          else
            if Obj_FlagSet FLAG_CAR_SKITCH
              Obj_ClearFlag FLAG_CAR_SKITCH
              if not GotParam NoSkitchStop
                Obj_SetFlag FLAG_CAR_GENERIC_STOPPED
                Obj_StopAlongPath 15 feet
                Wait 1 second
                Obj_ClearFlag FLAG_CAR_GENERIC_STOPPED
                Obj_StartAlongPath
              endif
              Obj_SetPathVelocity <DefaultSpeed> mph
            endif
          endif
        endif
      endif
    endif
  repeat
endscript
Car_CheckForOtherCar_Pause = 1
script Car_CheckForOtherCar01
  p1 = { dist = ( <DefaultSpeed> * 1.5 ) width = 20 height = 20 offset = (0, 0, 5) <CarDebugBox> }
  p2 = { dist = <DefaultSpeed> width = 20 height = 20 offset = (0, 0, 5) <CarDebugBox> }
  Change Car_CheckForOtherCar_Pause = ( Car_CheckForOtherCar_Pause + 1 )
  if ( Car_CheckForOtherCar_Pause > 10 )
    Change Car_CheckForOtherCar_Pause = 1
  endif
  Wait Car_CheckForOtherCar_Pause gameframes
  begin
    Wait 10 gameframes
    if Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED
      Obj_GetNextObjOnPath Range = 45
      if GotParam Ob
        Obj_SpawnScript Car_DecelForOtherCar01 params = <...>
        if IsAlive name = <Ob>
          if QueryFlag name = <Ob> FLAG_CAR_TYPE_BUS
            Printf "### Stopping for Bus! ###"
            Car_StopForOtherCar01 <...>
            Obj_GetNextObjOnPath Range = 41
          else
            Obj_GetNextObjOnPath Range = 32
          endif
        else
          Obj_GetNextObjOnPath Range = 32
          Printf "### cars would've crashed here! ###"
        endif
        if GotParam Ob
          Car_StopForOtherCar01 <...>
        endif
      endif
    endif
  repeat
endscript
script Car_Sound_Accel01
  GetTags
  if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
    Obj_AdjustSound <CarLoopSFX> volumePercent = 100 volumeStep = 0.7 pitchPercent = 100 pitchStep = 0.7
  endif
endscript
script Car_Sound_Decel01
  GetTags
  if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
    Obj_AdjustSound <CarLoopSFX> volumePercent = 80 volumeStep = 2 pitchPercent = 50 pitchStep = 1
    Obj_PlaySound CarBrakeSqueal vol = randomrange(5, 20) pitch = randomrange(60, 80)
  endif
endscript
script Car_Sound_Stop01
  GetTags
  if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
    Obj_AdjustSound <CarLoopSFX> volumePercent = 50 volumeStep = 1.5 pitchPercent = 30 pitchStep = 1.5
    Obj_PlaySound CarBrakeSqueal vol = randomrange(50, 70) pitch = 80
  endif
endscript
script Car_Sound_FranticStop01
  GetTags
  if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
    if Obj_FlagNotSet FLAG_CAR_SOUND_FRANTICSTOP
      Obj_PlaySound LA_Skid_11 vol = randomrange(30, 60)
      random( @@@
      Obj_PlaySound CarHorn_11 vol = randomrange(30, 70) pitch = randomrange(80, 100) ) 
    endif
  endif
  Obj_SpawnScript Car_Counter_FranticStop01
endscript
script Car_Counter_FranticStop01
  Obj_SetFlag FLAG_CAR_SOUND_FRANTICSTOP
  Wait 120 gameframes
  Obj_ClearFlag FLAG_CAR_SOUND_FRANTICSTOP
endscript
script Car_Sound_RandomHonk01
  if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
    random( @@@@@@@@@@@@@@@@@@@@@@@
    @Obj_PlaySound CarHorn_11 vol = randomrange(30, 70) pitch = randomrange(80, 100) ) 
  endif
endscript
script Car_PickRandomPath
  Obj_FollowPath name = random( @<Path1> @<Path2> ) 
endscript
script Car_Accel01
  if Obj_FlagSet FLAG_CAR_SKITCH
  else
    GetTags
    GetRandomValue name = AccelSpeed a = ( <DefaultSpeed> * 0.9 ) b = ( <DefaultSpeed> * 1.2 )
    Obj_SetPathVelocity <AccelSpeed> mph
    Car_Sound_Accel01
    if GotParam PrintStruct
      Printf "##### ACCEL #####"
      PrintStruct <...>
    endif
  endif
  if GotParam StickToGround
    Obj_StickToGround on DistAbove = 2 DistBelow = 2
  else
    if GotParam NoStickToGround
      Obj_StickToGround off
    endif
  endif
endscript
script Car_AccelAfterDecelForCar01
  if Obj_FlagSet FLAG_CAR_SKITCH
  else
    GetTags
    GetRandomValue name = AccelSpeed a = ( <DefaultSpeed> * 0.9 ) b = ( <DefaultSpeed> * 1.2 )
    Obj_SetPathVelocity <AccelSpeed> mph
    Car_Sound_Accel01
  endif
endscript
script Car_Decel01
  if Obj_FlagSet FLAG_CAR_SKITCH
  else
    GetTags
    GetRandomValue name = DecelSpeed a = ( <DefaultSpeed> * 0.6 ) b = ( <DefaultSpeed> * 0.7 )
    Obj_SetPathVelocity <DecelSpeed> mph
    if GotParam PrintStruct
      Printf "##### DECEL #####"
      PrintStruct <...>
    endif
  endif
endscript
script Car_DecelForTurn01
  if Obj_FlagSet FLAG_CAR_SKITCH
  else
    SetTags Tag_TurnDist = <TurnDist>
    GetTags
    GetRandomValue name = DecelSpeed a = ( <DefaultSpeed> * 0.6 ) b = ( <DefaultSpeed> * 0.7 )
    if ( <DecelSpeed> < 20 )
       <DecelSpeed> = 20
    endif
    Obj_SetPathVelocity <DecelSpeed> mph
    Obj_SetPathTurnDist <Tag_TurnDist>
    Car_Sound_Decel01
    if GotParam PrintStruct
      Printf "##### DECEL FOR TURN #####"
      PrintStruct <...>
    endif
  endif
endscript
script Car_DecelTrafficLight01
  if Obj_ObjectNotInRect dist = 50 type = [ Skater , car ]
    if QueryFlag name = <LightNode> FLAG_TRAFFICLIGHT_GREEN
      Goto Car_DecelForTurn01 params = <...>
    endif
    if QueryFlag name = <LightNode> FLAG_TRAFFICLIGHT_YELLOW
      random( @
      Goto Car_BlowYellow01 params = <...>
      @Goto Car_BlowYellow01 params = <...>
      @Goto Car_BlowYellow01 params = <...>
      @Goto Car_Stop01 params = <...> ) 
    endif
    if QueryFlag name = <LightNode> FLAG_TRAFFICLIGHT_RED
      Goto Car_Stop01 params = <...>
    endif
  else
  endif
endscript
script Car_DecelForOtherCar01
  Car_Decel01 <...>
  Wait 120 gameframes
  Car_AccelAfterDecelForCar01 <...>
endscript
script Car_Start01
  Wait randomrange(800, 1200)
  Obj_ClearFlag FLAG_CAR_GENERIC_STOPPED
  Obj_StartAlongPath
  Car_Sound_Accel01
endscript
script Car_StartForOtherCar01
  Obj_ClearFlag FLAG_CAR_GENERIC_STOPPED
  Obj_SetPathVelocity 30 mph
  Obj_StartAlongPath
  Car_Sound_Accel01
endscript
script Car_Stop01
  Obj_StopAlongPath randomrange(25, 30) feet
  Obj_SetFlag FLAG_CAR_GENERIC_STOPPED
  Car_Sound_Stop01
  begin
    Wait 20 gameframes
    if QueryFlag name = <LightNode> FLAG_TRAFFICLIGHT_GREEN
      Car_Start01
      break
    endif
  repeat
endscript
script Car_StopForOtherCar01
  Obj_SetFlag FLAG_CAR_GENERIC_STOPPED
  Obj_StopAlongPath 7
  Car_Sound_Stop01
  begin
    if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
      Car_Sound_RandomHonk01
    endif
    if IsAlive name = <Ob>
      if QueryFlag name = <Ob> FLAG_CAR_TYPE_BUS
        Obj_GetNextObjOnPath Range = 41
      else
        Obj_GetNextObjOnPath Range = 32
      endif
    else
      Obj_GetNextObjOnPath Range = 32
      Printf "### cars would've crashed here! ###"
    endif
    if not GotParam Ob
      Car_StartForOtherCar01 <...>
      break
    endif
    Wait 60 gameframes
  repeat
endscript
script Car_BlowYellow01
  GetTags
  Obj_SetPathVelocity 50 mph
  if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
    Obj_AdjustSound <CarLoopSFX> volumePercent = 130 volumeStep = 4 pitchPercent = 130 pitchStep = 4
    Obj_PlaySound LA_Skid_11 vol = 100
  endif
endscript
script Car_InchUpAfterStop
  if Obj_ObjectNotInRect dist = 35 width = 50 height = 40 type = [ car , Skater ] offset = (0, 0, 0)
    Obj_StartAlongPath
    Wait 1 gameframes
    Obj_StopAlongPath 20
    if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
      Obj_PlaySound CarBrakeSqueal vol = 10 pitch = 80
    endif
  endif
endscript
script Ped_Generic01
  Obj_FollowPathLinked
  Obj_RandomPathMode on
  Obj_SetPathAcceleration 10
  Obj_SetPathDeceleration 10
endscript
script Ped_StopAtNode01
  Obj_SetAnimCycleMode off
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = WalkToIdle
  Wait 2 gameframes
  Obj_StopAlongPath
  Obj_WaitAnimFinished
endscript
script Ped_BackOnPath01
  Printf "backonpath"
  Obj_StartAlongPath
  Obj_FollowPathStored
endscript
script Ped_WalkToNextNode01
  random( @
  Obj_SetPathVelocity 4
  Obj_StartAlongPath
  Obj_CycleAnim Anim = IdleToWalk
  Obj_PlayAnim Anim = Walk1 cycle
  @Obj_SetPathVelocity 4
  Obj_StartAlongPath
  Obj_CycleAnim Anim = IdleToWalk
  Obj_PlayAnim Anim = Walk2 cycle ) 
endscript
script Ped_Crosswalk01
  Ped_StopAtNode01
  begin
    if QueryFlag name = <LightNode> FLAG_TRAFFICLIGHT_YELLOW
      Obj_PlayAnim Anim = Idle cycle
      begin
        if QueryFlag name = <LightNode> FLAG_TRAFFICLIGHT_RED
          Obj_SetAnimCycleMode off
          Obj_WaitAnimFinished
          Wait randomrange(0, 300)
          Goto Ped_WalkToNextNode01
        endif
        Wait 30 gameframes
      repeat
    else
      Ped_Idle01
    endif
  repeat
endscript
script Ped_RandomWaitAtNode01
  Ped_StopAtNode01
  Obj_CycleAnim Anim = Idle
  begin
    random( @
    Ped_Idle01
    @Goto Ped_WalkToNextNode01 ) 
  repeat
endscript
script Ped_Idle01
  random( @
  Obj_CycleAnim Anim = ScratchChin
  @Obj_CycleAnim Anim = LookAtWatch
  @Obj_CycleAnim Anim = LookLeftRight
  @Obj_CycleAnim Anim = LookRight
  @Obj_CycleAnim Anim = LookLeftDown
  @Obj_CycleAnim Anim = Talk
  @Obj_CycleAnim Anim = Talk2
  @Obj_CycleAnim Anim = Idle
  @Obj_CycleAnim Anim = Idle
  @Obj_CycleAnim Anim = Idle
  @Obj_CycleAnim Anim = Idle
  @Obj_CycleAnim Anim = IdleToIdle2
  Obj_CycleAnim Anim = Idle2
  Obj_CycleAnim Anim = Idle2ToIdle
  @Obj_CycleAnim Anim = IdleToIdle3
  Obj_CycleAnim Anim = Idle3
  Obj_CycleAnim Anim = Idle3ToIdle ) 
endscript
script Team_Flag
  Obj_SetInnerRadius 10
  if GameModeEquals is_lobby
    Obj_SetException ex = SkaterInRadius scr = Team_Flag_Trigger params = { <...> }
  else
    if GameModeEquals is_ctf
      if OnServer
        Obj_SetException ex = AnySkaterInRadius scr = CTF_Team_Flag_Trigger params = { <...> }
      endif
    endif
  endif
endscript
script Team_Flag_Trigger
  GetNumTeams
  if GotParam blue
    JoinTeam blue
    Kill name = TRG_Flag_Red
    Kill name = TRG_Flag_Green
    Kill name = TRG_Flag_Yellow
    Create name = TRG_Flag_Red
    switch <num_teams>
    case 3
      Create name = TRG_Flag_Green
    case 4
      Create name = TRG_Flag_Green
      Create name = TRG_Flag_Yellow
    endswitch
    Die
  endif
  if GotParam Red
    JoinTeam Red
    Kill name = TRG_Flag_Blue
    Kill name = TRG_Flag_Green
    Kill name = TRG_Flag_Yellow
    Create name = TRG_Flag_Blue
    switch <num_teams>
    case 3
      Create name = TRG_Flag_Green
    case 4
      Create name = TRG_Flag_Green
      Create name = TRG_Flag_Yellow
    endswitch
    Die
  endif
  if GotParam Green
    JoinTeam Green
    Kill name = TRG_Flag_Blue
    Kill name = TRG_Flag_Red
    Kill name = TRG_Flag_Yellow
    Create name = TRG_Flag_Blue
    Create name = TRG_Flag_Red
    switch <num_teams>
    case 4
      Create name = TRG_Flag_Yellow
    endswitch
    Die
  endif
  if GotParam Yellow
    JoinTeam Yellow
    Kill name = TRG_Flag_Blue
    Kill name = TRG_Flag_Red
    Kill name = TRG_Flag_Green
    Create name = TRG_Flag_Blue
    Create name = TRG_Flag_Red
    Create name = TRG_Flag_Green
    Die
  endif
endscript
script CTF_Team_Flag_Trigger
  if GotParam Red
    Obj_GetCollidingPlayerAndTeam exclude_team = 0 radius = 10
    if ( <player> = -1 )
    else
      if ( <team> = 0 )
        PlayerCapturedFlag flag_team = 0 <...>
      else
        PlayerTookFlag flag_team = 0 <...>
        Obj_ClearExceptions
      endif
    endif
  endif
  if GotParam blue
    Obj_GetCollidingPlayerAndTeam exclude_team = 1 radius = 10
    if ( <player> = -1 )
    else
      if ( <team> = 1 )
        PlayerCapturedFlag flag_team = 1 <...>
      else
        PlayerTookFlag flag_team = 1 <...>
        Obj_ClearExceptions
      endif
    endif
  endif
  if GotParam Green
    Obj_GetCollidingPlayerAndTeam exclude_team = 2 radius = 10
    if ( <player> = -1 )
    else
      if ( <team> = 2 )
        PlayerCapturedFlag flag_team = 2 <...>
      else
        PlayerTookFlag flag_team = 2 <...>
        Obj_ClearExceptions
      endif
    endif
  endif
  if GotParam Yellow
    Obj_GetCollidingPlayerAndTeam exclude_team = 3 radius = 10
    if ( <player> = -1 )
    else
      if ( <team> = 3 )
        PlayerCapturedFlag flag_team = 3 <...>
      else
        PlayerTookFlag flag_team = 3 <...>
        Obj_ClearExceptions
      endif
    endif
  endif
endscript
script Kill_Team_Flags
  if NodeExists TRG_Flag_Red
    Kill name = TRG_Flag_Red
  endif
  if NodeExists TRG_Flag_Blue
    Kill name = TRG_Flag_Blue
  endif
  if NodeExists TRG_Flag_Green
    Kill name = TRG_Flag_Green
  endif
  if NodeExists TRG_Flag_Yellow
    Kill name = TRG_Flag_Yellow
  endif
  if NodeExists TRG_CTF_Red
    Kill name = TRG_CTF_Red
  endif
  if NodeExists TRG_CTF_Red_Base
    Kill name = TRG_CTF_Red_Base
  endif
  if NodeExists TRG_CTF_Blue
    Kill name = TRG_CTF_Blue
  endif
  if NodeExists TRG_CTF_Blue_Base
    Kill name = TRG_CTF_Blue_Base
  endif
  if NodeExists TRG_CTF_Green
    Kill name = TRG_CTF_Green
  endif
  if NodeExists TRG_CTF_Green_Base
    Kill name = TRG_CTF_Green_Base
  endif
  if NodeExists TRG_CTF_Yellow
    Kill name = TRG_CTF_Yellow
  endif
  if NodeExists TRG_CTF_Yellow_Base
    Kill name = TRG_CTF_Yellow_Base
  endif
endscript
script Create_Team_Flags
  if GameModeEquals is_lobby
    switch <num_teams>
    case 1
      if NodeExists TRG_Flag_Red
        Create name = TRG_Flag_Red
      endif
    case 2
      if NodeExists TRG_Flag_Red
        Create name = TRG_Flag_Red
      endif
      if NodeExists TRG_Flag_Blue
        Create name = TRG_Flag_Blue
      endif
    case 3
      if NodeExists TRG_Flag_Red
        Create name = TRG_Flag_Red
      endif
      if NodeExists TRG_Flag_Blue
        Create name = TRG_Flag_Blue
      endif
      if NodeExists TRG_Flag_Green
        Create name = TRG_Flag_Green
      endif
    case 4
      if NodeExists TRG_Flag_Red
        Create name = TRG_Flag_Red
      endif
      if NodeExists TRG_Flag_Blue
        Create name = TRG_Flag_Blue
      endif
      if NodeExists TRG_Flag_Green
        Create name = TRG_Flag_Green
      endif
      if NodeExists TRG_Flag_Yellow
        Create name = TRG_Flag_Yellow
      endif
    endswitch
  else
    GetNumPlayersOnTeam team = 0
    if ( <num_members> = 0 )
    else
      if NodeExists TRG_CTF_Red
        Create name = TRG_CTF_Red
      endif
      if NodeExists TRG_CTF_Red_Base
        Create name = TRG_CTF_Red_Base
      endif
    endif
    GetNumPlayersOnTeam team = 1
    if ( <num_members> = 0 )
    else
      if NodeExists TRG_CTF_Blue
        Create name = TRG_CTF_Blue
      endif
      if NodeExists TRG_CTF_Blue_Base
        Create name = TRG_CTF_Blue_Base
      endif
    endif
    GetNumPlayersOnTeam team = 2
    if ( <num_members> = 0 )
    else
      if NodeExists TRG_CTF_Green
        Create name = TRG_CTF_Green
      endif
      if NodeExists TRG_CTF_Green_Base
        Create name = TRG_CTF_Green_Base
      endif
    endif
    GetNumPlayersOnTeam team = 3
    if ( <num_members> = 0 )
    else
      if NodeExists TRG_CTF_Yellow
        Create name = TRG_CTF_Yellow
      endif
      if NodeExists TRG_CTF_Yellow_Base
        Create name = TRG_CTF_Yellow_Base
      endif
    endif
  endif
endscript
script Team_Flag_Base
endscript
script BouncyShadow_Kill
  Kill name = <Shadow>
endscript
script Pigeon_Generic
  Obj_ShadowOff
  Pigeon_Generic_Idle
endscript
script Pigeon_Generic_Idle
  Obj_ClearExceptions
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Pigeon_Generic_SkaterNear
  begin
    Obj_PlaySound Pigeon
    Obj_CycleAnim Anim = Idle NumCycles = randomrange(1, 3)
    Obj_CycleAnim Anim = peckfromidle
    begin
      Obj_RotY speed = 25
      Obj_CycleAnim Anim = peck
      Obj_StopRotating
    repeat NumCycles randomrange(1, 5)
    Obj_CycleAnim Anim = pecktoidle
    Obj_CycleAnim Anim = Idle
    Obj_CycleAnim Anim = preen
  repeat
endscript
script Pigeon_Generic_SkaterNear
  Obj_ClearExceptions
  Obj_GetRandomLink
  Obj_MoveToLink speed = 8 LinkNum = <link>
  Obj_LookAtNodeLinked time = 0.2 LinkNum = <link>
  Obj_SetInnerRadius 5
  Obj_SetException ex = SkaterInRadius scr = Pigeon_Generic_SkaterReallyNear
  Obj_PlayAnim Anim = run cycle
  Obj_WaitMove
  Obj_SetAnimCycleMode off
  Obj_WaitAnimFinished
  Obj_CycleAnim Anim = runtoidle
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Pigeon_Generic_SkaterNear
  Goto Pigeon_Generic_Idle
endscript
script Pigeon_Generic_SkaterReallyNear
  Obj_ClearExceptions
  Obj_PlaySound PigeonFly
  Obj_CycleAnim Anim = FlyHop
  Obj_WaitMove
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Pigeon_Generic_SkaterNear
  Goto Pigeon_Generic_Idle
endscript
script Mdl_NoDynLighting
  Obj_CreateModelLights
  Obj_EnableAmbientLight
  Obj_EnableDiffuseLight index = 0
  Obj_EnableDiffuseLight index = 1
  Obj_SetLightAmbientColor r = 128 g = 128 b = 128
  Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 b = 0
  Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 b = 0
endscript
script COMBO_Letter
endscript
script SKATE_Letter
endscript
