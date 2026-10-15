
ALC_GUARD_PISSED = 1
ALC_GUARD_NOTPISSED = 2
ALC_GAPS3_GOTLIPREVERT = 3
ALC_GOALFLAG01 = 4
ALC_MANUALMINIGAME = 5
ALC_RESTARTOK = 6
ALC_RESETSPEEDOK = 7
ALC_FLAG01 = 1
ALC_FLAG02 = 2
ALC_FLAG03 = 3
ALC_HITWATER = 4
ALC_BOUNCED = 5
ALC_GOALDONE = 6
script ALC_Goals
  if InMultiplayerGame
    add_multiplayer_mode_goals
  endif
  if not InSplitScreenGame
    if not GameModeEquals is_singlesession
      Alc_AddGoal_HighScore
      Alc_AddGoal_Combo
      Alc_AddGoal_Skate
      Alc_AddGoal_Race2
      Alc_AddGoal_Gaps3
      Alc_AddGoal_Counter2
      Alc_AddGoal_Race3
      Alc_AddGoal_Special
      Alc_AddGoal_Counter
      Alc_AddGoal_Competition
      Alc_AddGoal_ProScore
      Alc_AddGoal_Trickspot
      Alc_AddGoal_Gaps1
      Alc_AddGoal_Counter4
      Alc_AddGoal_Tetris
      Alc_AddGoal_Gaps6
      Alc_AddGoal_SickScore
      Alc_AddGoal_ProCombo
      Alc_AddGoal_Race
      Alc_AddGoal_Gaps2
      Alc_AddGoal_Tetris2
      Alc_AddGoal_Gaps4
      Alc_AddGoal_Trickspot2
      Alc_AddGoal_Gaps5
      if IsCareerMode
        AddMinigame_Height
        Alc_AddMinigame_TimedCombo
        Alc_AddMinigame_Baseball
      endif
    endif
  endif
endscript
script alc_Setup
  Create name = ant_gap5_IntoWaterTowerCont
  if IsCareerMode
    Create name = TRG_MG_BaseBall_Voice
  endif
  if IsCareerMode
    if GoalManager_HasWonGoal name = alc_goal_counter
      Kill prefix = "ac_LockCellblock"
    else
      Create prefix = "ac_LockCellblock"
    endif
    if GoalManager_HasWonGoal name = alc_goal_race2
      Kill name = tev_G_Race2_Tram4Looks
      if GoalManager_HasWonGoal name = alc_goal_gaps
        Create name = ttv_G_Gap_Tram4Looks
      else
        Kill name = ttv_G_Gap_Tram4Looks
      endif
    else
      Create name = tev_G_Race2_Tram4Looks
      Kill name = ttv_G_Gap_Tram4Looks
    endif
    Create name = teo_IntroOb
  else
    Kill prefix = "ac_LockCellblock"
    Kill name = tev_G_Race2_Tram4Looks
    Kill name = ttv_G_Gap_Tram4Looks
  endif
  UnSetFlag flag = ALC_MANUALMINIGAME
endscript
script alc_IntroOb
  if IsCareerMode
    MakeSkaterGoto StartSkating1
  endif
endscript
script ALC_Startup
  LoadSound "Shared\Water\BigSplash" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\Breakshingles2" vol = 50 dropoff = 50
  LoadSound "Shared\Hits\Breakshingles" vol = 50 dropoff = 50
  LoadSound "Alc\ColumnCrumble" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\SmashWall" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\BustValve" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\SmashWoodQP" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\HitGlassPane2x" vol = 100 dropoff = 50
  LoadSound "Shared\Water\FallWater" vol = 100 dropoff = 50
  LoadSound "Shared\Water\Flush2_11" vol = 30 dropoff = 50
  LoadSound "Shared\Hits\SmashCake" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\HitFlimsyWood_11" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\BonkBush" vol = 100 dropoff = 50
  LoadSound "Shared\Goals\GoalDone" vol = 100 dropoff = 50
  LoadSound "Shared\Auto\carhorn_11" vol = 100 dropoff = 150
  LoadSound "Shared\Auto\CarBrakeSqueal" vol = 60 dropoff = 150 PosUpdate
  LoadSound "Shared\Auto\LA_Skid_11" vol = 100 dropoff = 150
  LoadSound "Shared\Auto\TramEngineLoop" vol = 50 dropoff = 150 PosUpdateWithDoppler
  LoadSound "Jnk\dieselgenerator" vol = 50 dropoff = 150 PosUpdateWithDoppler
  LoadSound "Shared\Hits\HitMetalCan_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "Alc\ShoppingCartBail" vol = 100 dropoff = 50
  LoadSound "Alc\ShoppingCartLand" vol = 100 dropoff = 50
  LoadSound "Alc\ShoppingCartLoop" vol = 50 dropoff = 150 PosUpdate
  LoadSound "Alc\ShoppingCartOllie" vol = 100 dropoff = 50
  LoadSound "Alc\baseballcrack" vol = 100 dropoff = 50
  LoadSound "Shared\Animal\HitSeagulls" vol = 100 dropoff = 50
  LoadSound "Skater\bitchslap2"
  LoadSound "Skater\ArmWhoosh01"
endscript
script alc_HeightMinigameStart
  if GoalManager_GoalIsActive name = alc_goal_gaps
    if GoalManager_GoalExists name = alc_Goal_minigame_height
      GoalManager_ActivateGoal name = alc_Goal_minigame_height
      begin
        if GoalManager_GoalExists name = alc_Goal_minigame_height
          if skater:OnGround
            GoalManager_DeactivateGoal name = alc_Goal_minigame_height
          endif
        else
          break
        endif
        Wait 1 gameframe
      repeat
    endif
  endif
endscript
script Alc_AddMinigame_TimedCombo
  AddMinigame_TimedCombo {
    Trigger_Obj_ID = TRG_MG_RiverCombo
    minigame_text = "Switchback Manual Combo"
    cancelSkitch
  }
endscript
script alc_SwitchbackManualTimer
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    if GoalManager_GoalExists name = Alc_Goal_Minigame_TimedCombo
      if CurrentScorePotGreaterThan 1
        if not skater:Skitching
          if not skater:AnimEquals SkitchInit
            if skater:OnGround
              if GoalManager_GoalExists name = alc_goal_gaps
                if not GoalManager_GoalIsActive name = alc_goal_gaps
                  GoalManager_ActivateGoal name = Alc_Goal_Minigame_TimedCombo
                  SetFlag flag = ALC_MANUALMINIGAME
                endif
              else
                GoalManager_ActivateGoal name = Alc_Goal_Minigame_TimedCombo
                SetFlag flag = ALC_MANUALMINIGAME
              endif
            endif
          endif
        endif
      endif
    endif
  endif
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    if GoalManager_GoalExists name = Alc_Goal_Minigame_TimedCombo
      UnSetFlag flag = ALC_MANUALMINIGAME
      Wait 2 gameframes
      if not GetFlag flag = ALC_MANUALMINIGAME
        GoalManager_DeactivateGoal name = Alc_Goal_Minigame_TimedCombo
      else
      endif
    endif
  endif
endscript
script Alc_AddMinigame_Baseball
  AddMinigame_Generic3 {
    career_only
    activate_script = alc_baseball_activate
    deactivate_script = alc_baseball_deactivate
  }
endscript
script alc_baseball_activate
  UnPauseSkaters
  MakeSkaterGoto MG_Baseball_Skater
  Kill prefix = "TRG_MG_BaseBall_Ball"
  Kill prefix = "TRG_MG_BaseBall_Pitcher"
  Create prefix = "TRG_MG_BaseBall_Pitcher"
endscript
script alc_baseball_deactivate
  create_panel_block id = current_goal text = " " style = panel_message_goal
  Kill prefix = "TRG_MG_BaseBall_Ball"
  Kill prefix = "TRG_MG_BaseBall_Pitcher"
  PlaySkaterCamAnim skater = 0 stop
  UnPauseSkaters
  speech_box_exit
  MakeSkaterGoto SkaterInit
  skater:SetRollingFriction 1
  skater:EnablePlayerInput
endscript
script MG_Baseball
  setup_ped_speech {
    ped_id = TRG_MG_BaseBall_Voice
    display_name = "Mysterious Voices"
    speed = 200
    inner_radius = 20
    text = [ "Mysterious Voices:\n Would you care to hit a few?!?!\n"
      "Press \b3 to Accept\nPress \m1 to Decline"
    ]
    pad_choose_script = MG_BaseBall_Yes
    pad_back_script = MG_BaseBall_No
  }
endscript
script MG_BaseBall_Yes
  speech_box_exit
  if GoalManager_HasActiveGoals
    GoalManager_DeactivateAllGoals
  endif
  Wait 1 frame
  GoalManager_ActivateGoal name = alc_goal_minigame_generic3
endscript
script MG_BaseBall_No
  speech_box_exit
  UnPauseSkaters
  MakeSkaterGoto SkaterInit
endscript
OBJFLAG_PITCHCENTER = 1
OBJFLAG_PITCHINSIDE = 2
OBJFLAG_PITCHOUTSIDE = 3
OBJFLAG_PITCHLOW = 4
OBJFLAG_PITCHHIGH = 5
script MG_Baseball_Pitcher
  Obj_PlayAnim Anim = Ped_M_Idle1 Cycle
endscript
script MG_Baseball_Pitcher2
  Obj_ClearExceptions
  begin
    Obj_PlayAnim Anim = Ped_M_Idle1
    Obj_WaitAnimFinished
    Obj_PlayAnim Anim = Ped_M_Punch
    Wait 15 frames
    Kill prefix = "TRG_MG_BaseBall_Ball"
    Create prefix = "TRG_MG_BaseBall_Ball"
    if IsAlive name = TRG_MG_BaseBall_Ball
      random( @
      SendFlag name = TRG_MG_BaseBall_Ball OBJFLAG_PITCHCENTER
      @SendFlag name = TRG_MG_BaseBall_Ball OBJFLAG_PITCHINSIDE
      @SendFlag name = TRG_MG_BaseBall_Ball OBJFLAG_PITCHOUTSIDE
      @SendFlag name = TRG_MG_BaseBall_Ball OBJFLAG_PITCHLOW
      @SendFlag name = TRG_MG_BaseBall_Ball OBJFLAG_PITCHHIGH
       ) 
    endif
    Obj_WaitAnimFinished
  repeat 10
  create_panel_message id = goal_complete_line2 text = "Done Pitching!" style = panel_message_goalcompleteline2
  GoalManager_DeactivateGoal name = alc_goal_minigame_generic3
endscript
script MG_Baseball_Ball
  Wait 2 frames
  Obj_MoveToNode name = TRG_MG_BaseBall_Inside speed = randomrange(30, 50)
  Obj_WaitMove
  skater:GetTags
  Printf <BB_direction>
  Printf <swing>
  switch <swing>
  case Hit
    PlaySound baseballcrack
    GoalManager_AwardMinigameCash name = alc_goal_minigame_generic3 25
    PlayStream random( @stadiumcheers @stadiumcheers2  ) vol = random( @50 @60 @70  ) dropoff = 400
    Obj_MoveToNode name = random( @TRG_MG_BaseBall_Hit @TRG_MG_BaseBall_Hit01 @TRG_MG_BaseBall_Hit02 @TRG_MG_BaseBall_Hit03 @TRG_MG_BaseBall_Hit04  ) speed = 100
    Obj_WaitMove
  case foul
    PlaySound baseballcrack pitch = randomrange(80, 90)
    random( @
    Obj_MoveToRelPos (0, 500, -100) speed = 50
    @Obj_MoveToRelPos (300, 400, -400) speed = 100
    @Obj_MoveToRelPos (300, 10, -400) speed = 100
     ) 
    Obj_WaitMove
  endswitch
  Obj_MoveToRelPos (0, 0, 500) speed = 20
  Obj_WaitMove
  Die
endscript
script ALC_MG_EndGame
  GoalManager_DeactivateGoal name = alc_goal_minigame_generic3
endscript
script MG_Baseball_Skater
  ClearExceptions
  SkaterInit ReturnControl
  DisablePlayerInput
  Obj_MoveToNode name = TRG_MG_BaseBall_Batter orient
  PlaySkaterCamAnim name = MG_Baseball play_hold allow_pause = 1
  create_speech_box {
    text = [
      "Baseball:\n"
      "Use \b3 to Swing\n"
      "Make sure to time your swings correctly!"
    ]
    style = speech_box_style
    pad_choose_script = MG_Baseball_StartPitching
  }
  create_panel_block id = current_goal text = "\n\n\nPress \m1 to Quit" style = panel_message_goal
  EnablePlayerInput
  Goto Baseball_start
endscript
script MG_Baseball_StartPitching
  speech_box_exit
  RunScriptOnObject id = TRG_MG_BaseBall_Pitcher MG_Baseball_Pitcher2
endscript
script MG_Baseball_Skater2
  MakeSkaterGoto Baseball_start
  Wait 1 frame
  begin
    if IsXBOX
      if Held Circle
        SpawnScript ALC_MG_EndGame
        MakeSkaterGoto SkaterInit
        break
      endif
    else
      if IsNGC
        if Held square
          SpawnScript ALC_MG_EndGame
          MakeSkaterGoto SkaterInit
          break
        endif
      else
        if Held triangle
          Printf "in here"
          SpawnScript ALC_MG_EndGame
          MakeSkaterGoto SkaterInit
          break
        endif
      endif
    endif
    Wait 1 frame
    Printf "minigame going"
  repeat
endscript
script Alc_AddGoal_HighScore
  AddGoal_HighScore {
    goal_text = alc_highscore_text
    view_goals_text = alc_highscore_text
    goal_description = alc_HighScore_Desc
    score = alc_highscore_score
    pro = "Elissa"
    full_name = "Elissa Steamer"
    reward_goal = alc_Goal_ProScore
    record_type = score
  }
endscript
script Alc_AddGoal_Combo
  AddGoal_Combo {
    goal_text = "Collect C-O-M-B-O!"
    view_goals_text = "Collect the C-O-M-B-O letters"
    goal_description = alc_Combo_Desc
    pro = "Warden"
    full_name = "The Warden"
    record_type = score
  }
endscript
script Alc_AddGoal_Gaps3
  AddGoal_Gaps3 {
    goal_text = "Revert Madness!"
    view_goals_text = "Revert Madness"
    goal_description = alc_Gaps3_Desc
    time = 60
    goal_flags = [ got_1
      got_2
      got_3
    ]
    pro = "photoguy"
    full_name = "Atiba Jefferson"
    goal_start_script = alc_RevertGoal_Start
    goal_deactivate_script = alc_RevertGoal_End
    record_type = time
  }
endscript
script alc_RevertGoal_Start
  UnSetFlag flag = ALC_GAPS3_GOTLIPREVERT
  SpawnScript alc_RevertGoal_DelayedStart id = DelayedStart
  Kill prefix = "tep_DockPed"
endscript
script alc_RevertGoal_DelayedStart
  Wait 2 seconds
  if GoalManager_GoalIsActive name = alc_goal_gaps3
    PlayStream photoguy_alc_goal_gaps3_midsuccess01
    if IsPS2
      create_panel_block id = current_goal text = "Try a Revert\n(\bg or \bh as you\nland on a vert)" style = panel_message_goal
    else
      create_panel_block id = current_goal text = "Try a Revert\n(\be or \bf as you\nland on a vert)" style = panel_message_goal
    endif
  endif
endscript
script alc_RevertGoal_End
  Kill prefix = "tep_DockPed"
  Create prefix = "tep_DockPed"
  Kill tpo_RevertManualChecker
  KillSpawnedScript id = DelayedStart
  UnSetFlag flag = ALC_GAPS3_GOTLIPREVERT
endscript
script alc_CheckManual
  if not GoalManager_GoalFlagSet name = alc_goal_gaps3 flag = got_1
    Obj_SetException ex = SkaterBailed scr = alc_RevertBailed02
    Obj_SetException ex = SkaterLanded scr = alc_RevertLanded01
    Wait 1 second
    if GoalManager_GoalIsActive name = alc_goal_gaps3
      StopStream
      PlayStream photoguy_alc_goal_gaps3_midsuccess04
      create_panel_block id = current_goal text = "Great! Now land it!" style = panel_message_goal
      begin
        Wait 1 gameframe
      repeat
    endif
  endif
  if not GoalManager_GoalFlagSet name = alc_goal_gaps3 flag = got_2
    Obj_SetException ex = SkaterBailed scr = alc_RevertBailed02
    Obj_SetException ex = SkaterLanded scr = alc_RevertBailed
    begin
      if not skater:AnimEquals [ revertbs revertfs ]
        if skater:OnGround
          if skater:DoingTrick
            Obj_SetException ex = SkaterBailed scr = alc_RevertBailed02
            Obj_SetException ex = SkaterLanded scr = alc_RevertLanded02
            Wait 1 second
            if GoalManager_GoalIsActive name = alc_goal_gaps3
              StopStream
              PlayStream photoguy_alc_goal_gaps3_midsuccess04
              create_panel_block id = current_goal text = "Great! Now land it!" style = panel_message_goal
              break
            endif
          endif
        endif
      endif
      Wait 1 gameframe
    repeat
    begin
      Wait 1 gameframe
    repeat
  endif
  if not GoalManager_GoalFlagSet name = alc_goal_gaps3 flag = got_3
    Obj_SetException ex = SkaterBailed scr = alc_RevertBailed
    Obj_SetException ex = SkaterLanded scr = alc_RevertBailed02
    begin
      if not skater:AnimEquals [ revertbs revertfs ]
        if skater:OnGround
          if skater:DoingTrick
            if GetFlag flag = ALC_GAPS3_GOTLIPREVERT
              Obj_SetException ex = SkaterBailed scr = alc_RevertBailed02
              Obj_SetException ex = SkaterLanded scr = alc_RevertLanded03
              Wait 1 second
              if GoalManager_GoalIsActive name = alc_goal_gaps3
                StopStream
                PlayStream photoguy_alc_goal_gaps3_midsuccess04
                create_panel_block id = current_goal text = "Great! Now land it!" style = panel_message_goal
                break
              endif
            endif
          endif
        endif
      endif
      Wait 1 gameframe
    repeat
    begin
      Wait 1 gameframe
    repeat
  endif
endscript
script alc_LipToRevertStart
  StartGap GapID = LipToRevert01 flags = PURE_LIP
  EndGap GapID = LipToRevert01 gapscript = alc_LipToRevertEnd
endscript
script alc_LipToRevertEnd
  StartGap GapID = LipToRevert02 flags = [ CANCEL_GROUND ]
endscript
script alc_RevertBailed
  UnSetFlag flag = ALC_GAPS3_GOTLIPREVERT
  Die
endscript
script alc_RevertBailed02
  if GoalManager_GoalIsActive name = alc_goal_gaps3
    if GoalManager_GoalFlagSet name = alc_goal_gaps3 flag = got_1
      if GoalManager_GoalFlagSet name = alc_goal_gaps3 flag = got_2
        create_panel_block id = current_goal text = "Whoops. Almost. Try again.\nLip trick and then\nrevert into a manual!" style = panel_message_goal
        UnSetFlag flag = ALC_GAPS3_GOTLIPREVERT
      else
        if IsPS2
          create_panel_block id = current_goal text = "Whoops. Almost. Try again.\nRevert into\na manual!\n(\bg or \bh, then\n\b4+\b7 or \b7+\b4)" style = panel_message_goal
        else
          create_panel_block id = current_goal text = "Whoops. Almost. Try again.\nRevert into\na manual!\n(\be or \bf, then\n\b4+\b7 or \b7+\b4)" style = panel_message_goal
        endif
        UnSetFlag flag = ALC_GAPS3_GOTLIPREVERT
      endif
    else
      if IsPS2
        create_panel_block id = current_goal text = "Whoops. Almost. Try again.\nRevert:\n(\bg or \bh as you\nland on a vert)" style = panel_message_goal
      else
        create_panel_block id = current_goal text = "Whoops. Almost. Try again.\nRevert:\n(\be or \bf as you\nland on a vert)" style = panel_message_goal
      endif
    endif
  endif
  Die
endscript
script alc_RevertLanded01
  StopStream
  if GoalManager_GoalIsActive name = alc_goal_gaps3
    PlayStream photoguy_alc_goal_gaps3_midsuccess02
    if IsPS2
      create_panel_block id = current_goal text = "Now try to revert\ninto a manual!\n(\bg or \bh, then\n\b4+\b7 or \b7+\b4)" style = panel_message_goal
    else
      create_panel_block id = current_goal text = "Now try to revert\ninto a manual!\n(\be or \bf, then\n\b4+\b7 or \b7+\b4)" style = panel_message_goal
    endif
    GoalManager_SetGoalFlag name = alc_goal_gaps3 got_1 1
    UnSetFlag flag = ALC_GAPS3_GOTLIPREVERT
  endif
  Die
endscript
script alc_RevertLanded02
  StopStream
  if GoalManager_GoalIsActive name = alc_goal_gaps3
    PlayStream photoguy_alc_goal_gaps3_midsuccess03
    create_panel_block id = current_goal text = "Now try a lip trick\nand THEN revert\ninto a manual!" style = panel_message_goal
    GoalManager_SetGoalFlag name = alc_goal_gaps3 got_2 1
    UnSetFlag flag = ALC_GAPS3_GOTLIPREVERT
  endif
  Die
endscript
script alc_RevertLanded03
  GoalManager_SetGoalFlag name = alc_goal_gaps3 got_3 1
  UnSetFlag flag = ALC_GAPS3_GOTLIPREVERT
  Die
endscript
script alc_RevertBombedVert
  if GoalManager_GoalIsActive name = alc_goal_gaps3
    if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
      begin
        if skater:AnimEquals [ revertbs revertfs ]
          EndGap GapID = LipToRevert02 gapscript = alc_SetLipFlag
          Kill name = tpo_RevertManualChecker
          Create name = tpo_RevertManualChecker
          break
        endif
        Wait 10 gameframe
      repeat 12
    endif
  endif
endscript
script Alc_AddGoal_Race2
  AddGoal_Race2 {
    career_only
    view_goals_text = "Take the Alcatraz Tour"
    goal_text = "Take the Alcatraz Tour!"
    goal_description = alc_Race2_Desc
    goal_flags = [
      got_01
      got_02
      got_03
    ]
    time = 60
    use_hud_counter
    race_waypoints = [
      { id = TRG_G_RACE2_RaceNav01 scr = alc_race2_waypoint_01 flag = got_01 time = 60 }
      { id = TRG_G_RACE2_RaceNav02 scr = alc_race2_waypoint_02 flag = got_02 time = 0 }
      { id = TRG_G_RACE2_RaceNav03 scr = alc_race2_waypoint_03 flag = got_03 time = 0 }
    ]
    pro = "Ranger"
    full_name = "Ranger Ron"
    reward_goal = alc_goal_gaps
    goal_start_script = Alc_Goal_Race2_Start
    goal_outro_script = Alc_Goal_Race2_Outro
    goal_deactivate_script = Alc_Goal_Race2_Deactivate
    record_type = time
  }
endscript
script Alc_Goal_Race2_Start
  Kill prefix = "proset3"
  UnSetFlag flag = FLAG_PROSET3_GEO_ON
  Kill name = tev_G_Race2_Tram4Looks
  Kill name = ttv_G_Gap_Tram4Looks
  Kill prefix = "tev_Tram"
  Kill prefix = "tep_DockPed"
  Kill name = tev_G_Race2_Tram4Looks
  Kill name = TRG_G_Race2_Tram01
  Create name = TRG_G_Race2_Tram01
  Kill name = tpo_Race2_SeagullCounter
  Create name = tpo_Race2_SeagullCounter
  Kill name = tpo_Race2_BottleCounter
  Create name = tpo_Race2_BottleCounter
  Create prefix = "ab_Race2"
  Create prefix = "ttp_RangerBob"
  Create name = TRG_G_Race2_ProAlt
  TRG_G_Race2_Pro:Obj_MoveToNode name = TRG_G_Race2_ProNav
endscript
script Alc_Tram_ManicDriver
  Obj_LockToObject ObjectName = <myTram> (12, 0, 50)
  begin
    random( @
    Obj_CycleAnim Anim = Ped_Ranger_DriveManic3
    @Obj_CycleAnim Anim = Ped_Ranger_DriveManic4
    @Obj_CycleAnim Anim = Ped_Ranger_DriveManic5
    @Obj_CycleAnim Anim = Ped_Ranger_DriveManic6
     ) 
  repeat
endscript
script Alc_Goal_Race2_Outro
  Kill name = tev_G_Race2_Tram4Looks
endscript
script Alc_Goal_Race2_Deactivate
  if ObjectExists id = TRG_G_Race2_Tram01
    DestroyScreenElement id = TRG_G_Race2_Tram01
  endif
  MakeSkaterGoto SkaterInit
  Kill prefix = "tev_Tram"
  Create prefix = "tev_Tram"
  Kill prefix = "tep_DockPed"
  Create prefix = "tep_DockPed"
  KillSpawnedScript name = alc_race2_waypoint_02
  KillSpawnedScript name = alc_race2_waypoint_03
  Kill name = TRG_G_Race2_Tram01
  Kill name = tpo_Race2_SeagullCounter
  Kill name = tpo_Race2_BottleCounter
  KillSpawnedScript name = alc_Race2_SkitchChecker
  Kill prefix = "ab_Race2"
  Kill prefix = "ttp_RangerBob"
  TRG_G_Race2_Pro:Obj_MoveToNode name = TRG_G_Race2_Pro
  Kill name = TRG_G_Race2_ProAlt
  SpawnScript Alc_Goal_Race2_DeactivateSpawn
endscript
script Alc_Goal_Race2_DeactivateSpawn
  Wait 1 gameframe
  Kill name = tev_G_Race2_Tram4Looks
  Kill name = ttv_G_Gap_Tram4Looks
  if GoalManager_GoalExists name = alc_goal_race2
    if not GoalManager_GoalIsActive name = alc_goal_race2
      if GoalManager_HasWonGoal name = alc_goal_race2
        Create name = ttv_G_Gap_Tram4Looks
      else
        Create name = tev_G_Race2_Tram4Looks
      endif
    endif
  endif
endscript
script alc_race2_waypoint_01
  alc_MakeSkaterStand
  create_panel_block id = current_goal text = "Hold up (\b7) to skitch on Ranger Ron's car!" style = panel_message_goal
  StopStream
  random( @
  PlayStream ranger_alc_goal_race2_skitchreq01 vol = 200
  @PlayStream ranger_alc_goal_race2_skitchreq02 vol = 200
  @PlayStream ranger_alc_goal_race2_skitchreq03 vol = 200
   ) 
  Alc_Race2_PointArrowToTram
  SpawnScript alc_Race2_SkitchChecker
  TRG_G_Race2_Tram01:AddGoalArrowAlc
endscript
script alc_Race2_ArrivedA01
  if GoalManager_GoalIsActive name = alc_goal_race2
    if not GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_01
      KillSpawnedScript name = alc_Race2_SkitchChecker
      create_panel_block id = current_goal text = "Get those birds off of that awning! Make it quick." style = panel_message_goal
      StopStream
      PlayStream ranger_alc_goal_race2_legA04 vol = 200
      KillTheArrow id = TRG_G_Race2_Tram01
      Obj_SpawnScript alc_Race2TourStop
      begin
        if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_01
          alc_Race2TourFast
          break
        endif
        Wait 1 gameframe
      repeat
    endif
  endif
endscript
script alc_Race2_ArrivedA02
  Obj_SpawnScript alc_Race2TourStop
  begin
    if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_01
      break
    endif
    begin
      if QueryFlag FLAG_CAR_SKITCH name = TRG_G_Race2_Tram01
        create_panel_block id = current_goal text = "What are you doing? Get those birds!!!" style = panel_message_goal
        break
      endif
      if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_01
        break
      endif
      Wait 1 gameframe
    repeat
    begin
      if not QueryFlag FLAG_CAR_SKITCH name = TRG_G_Race2_Tram01
        break
      endif
      if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_01
        break
      endif
      Wait 1 gameframe
    repeat
    Wait 1 gameframe
  repeat
  alc_Race2TourFast
endscript
script alc_SeagullCounter
  begin
    if Obj_FlagSet ALC_FLAG01
      if Obj_FlagSet ALC_FLAG02
        if Obj_FlagSet ALC_FLAG03
          GoalManager_SetGoalFlag name = alc_goal_race2 got_01 1
          GoalManager_NextRaceWaypoint name = alc_goal_race2
          PlaySound goaldone
          break
        endif
      endif
    endif
    Wait 1 gameframe
  repeat
  Die
endscript
script alc_race2_waypoint_02
  create_panel_block id = current_goal text = "Good work! Now skitch my cart again. I'll show you the Parade Grounds." style = panel_message_goal
  Alc_Race2_PointArrowToTram
  StopStream
  PlayStream ranger_alc_goal_race2_legA_success vol = 200
  begin
    if QueryFlag FLAG_CAR_SKITCH name = TRG_G_Race2_Tram01
      SpawnScript alc_Race2_SkitchChecker
      break
    endif
    Wait 1 gameframe
  repeat
endscript
script alc_Race2_ArrivedB01
  if not GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_02
    KillSpawnedScript name = alc_Race2_SkitchChecker
    create_panel_block id = current_goal text = "Empty kegs on that ledge!?! Knock those down for me." style = panel_message_goal
    KillTheArrow id = TRG_G_Race2_Tram01
    Obj_SpawnScript alc_Race2TourStop
    StopStream
    PlayStream ranger_alc_goal_race2_legB04 vol = 200
    begin
      if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_02
        alc_Race2TourFast
        break
      endif
      Wait 1 gameframe
    repeat
  endif
endscript
script alc_Race2_ArrivedB02
  Obj_SpawnScript alc_Race2TourStop
  begin
    if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_02
      break
    endif
    begin
      if QueryFlag FLAG_CAR_SKITCH name = TRG_G_Race2_Tram01
        create_panel_block id = current_goal text = "What are you doing? Get those kegs!!!" style = panel_message_goal
        break
      endif
      if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_02
        break
      endif
      Wait 1 gameframe
    repeat
    begin
      if not QueryFlag FLAG_CAR_SKITCH name = TRG_G_Race2_Tram01
        break
      endif
      if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_02
        break
      endif
      Wait 1 gameframe
    repeat
    Wait 1 gameframe
  repeat
  alc_Race2TourFast
endscript
script alc_Race2_ArrivedC01
  if not GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_03
    KillSpawnedScript name = alc_Race2_SkitchChecker
    create_panel_block id = current_goal text = "Stop Ranger Bob's Evil Plot!! Knock him off that ledge!" style = panel_message_goal
    KillTheArrow id = TRG_G_Race2_Tram01
    Obj_SpawnScript alc_Race2TourStop
    StopStream
    PlayStream ranger_alc_goal_race2_legC04 vol = 200
    begin
      if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_03
        alc_Race2TourFast
        break
      endif
      Wait 1 gameframe
    repeat
  endif
endscript
script alc_Race2_ArrivedC02
  Obj_SpawnScript alc_Race2TourStop
  begin
    if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_03
      break
    endif
    begin
      if QueryFlag FLAG_CAR_SKITCH name = TRG_G_Race2_Tram01
        create_panel_block id = current_goal text = "What are you doing? Stop Ranger Bob's Evil Plot!!" style = panel_message_goal
        break
      endif
      if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_03
        break
      endif
      Wait 1 gameframe
    repeat
    begin
      if not QueryFlag FLAG_CAR_SKITCH name = TRG_G_Race2_Tram01
        break
      endif
      if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_03
        break
      endif
      Wait 1 gameframe
    repeat
    Wait 1 gameframe
  repeat
  alc_Race2TourFast
endscript
script alc_BottleCounter
  begin
    if Obj_FlagSet ALC_FLAG01
      if Obj_FlagSet ALC_FLAG02
        if Obj_FlagSet ALC_FLAG03
          if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_01
            GoalManager_SetGoalFlag name = alc_goal_race2 got_02 1
            GoalManager_NextRaceWaypoint name = alc_goal_race2
            PlaySound goaldone
            break
          else
            alc_Race2_Fail
          endif
        endif
      endif
    endif
    Wait 1 gameframe
  repeat
  Die
endscript
script alc_Race2_HitBottle
  if GotParam myFlag
    if GoalManager_GoalIsActive name = alc_goal_race2
      if IsAlive name = tpo_Race2_BottleCounter
        tpo_Race2_BottleCounter:Obj_SetFlag <myFlag>
      endif
    endif
  endif
endscript
script alc_race2_waypoint_03
  create_panel_block id = current_goal text = "Excellent! Grab on. Now to the last stop: The Cellblock!" style = panel_message_goal
  Alc_Race2_PointArrowToTram
  StopStream
  PlayStream ranger_alc_goal_race2_legB_success vol = 200
  begin
    if QueryFlag FLAG_CAR_SKITCH name = TRG_G_Race2_Tram01
      SpawnScript alc_Race2_SkitchChecker
      break
    endif
    Wait 1 gameframe
  repeat
endscript
script alc_Race2_SkitchTram
  Obj_ClearExceptions
  Obj_SetOuterRadius 200
  Obj_SetException ex = SkaterOutOfRadius scr = alc_Race2_Fail
  Car_Generic01 DefaultSpeed = 0 SkitchSpeed = 60 TurnDist = 20 allowSlow carloopSFX = TramEngineLoop
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathAcceleration 20 mphps
  Obj_SetPathDeceleration 30 mphps
  begin
    Wait 10 seconds
  repeat
endscript
script alc_Race2_Fail
  Obj_ClearExceptions
  create_panel_message id = alc_gaps_message text = "Hey! Stay with the tour!" Pos = (320, 200) RGBA = [ 128 , 0 , 0 , 128 ]
  Wait 2 seconds
  SpawnScript alc_Race2_FailSpawn
endscript
script alc_Race2_FailSpawn
  if GoalManager_GoalIsActive name = alc_goal_race2
    GoalManager_LoseGoal name = alc_goal_race2
  endif
endscript
script alc_Tram4Looks
  Obj_AllowSkitching off
endscript
script alc_StopTram
  Obj_StopAlongPath
endscript
script alc_Race2TourStop
  begin
    Obj_SetPathVelocity 0
    Wait 1 gameframe
  repeat
endscript
script alc_Race2TourFast
  KillSpawnedScript name = alc_Race2TourStop
endscript
script alc_Race2_SkitchChecker
  begin
    if QueryFlag FLAG_CAR_SKITCH name = TRG_G_Race2_Tram01
      create_panel_block id = current_goal text = "Good work! Now hold on..." style = panel_message_goal
      Alc_Race2_PointArrowToNav
      StopStream
      if not GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_01
        PlayStream ranger_alc_goal_race2_legAFull vol = 200
      else
        if not GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_02
          PlayStream ranger_alc_goal_race2_legBFull vol = 200
        else
          if not GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_03
            PlayStream ranger_alc_goal_race2_legCFull vol = 200
          endif
        endif
      endif
      break
    endif
    Wait 1 gameframe
  repeat
  begin
    begin
      if not QueryFlag FLAG_CAR_SKITCH name = TRG_G_Race2_Tram01
        create_panel_block id = current_goal text = "You let go! Hold up (\b7) to skitch" style = panel_message_goal
        Alc_Race2_PointArrowToTram
        StopStream
        random( @
        PlayStream ranger_alc_goal_race2_skitchagain01 vol = 200
        @PlayStream ranger_alc_goal_race2_skitchagain02 vol = 200
        @PlayStream ranger_alc_goal_race2_skitchagain03 vol = 200
         ) 
        break
      endif
      Wait 1 gameframe
    repeat
    begin
      if QueryFlag FLAG_CAR_SKITCH name = TRG_G_Race2_Tram01
        create_panel_block id = current_goal text = "Good work! Now hold on..." style = panel_message_goal
        Alc_Race2_PointArrowToNav
        StopStream
        random( @
        PlayStream ranger_alc_goal_race2_skitch01 vol = 200
        @PlayStream ranger_alc_goal_race2_skitch02 vol = 200
        @PlayStream ranger_alc_goal_race2_skitch03 vol = 200
         ) 
        break
      endif
      Wait 1 gameframe
    repeat
    Wait 1 gameframe
  repeat
endscript
script Alc_Race2_PointArrowToNav
  if not GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_01
    alc_PointArrow node = TRG_G_RACE2_RaceNav01
  else
    if not GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_02
      alc_PointArrow node = TRG_G_RACE2_RaceNav02
    else
      if not GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_03
        alc_PointArrow node = TRG_G_RACE2_RaceNav03
      endif
    endif
  endif
endscript
script Alc_Race2_PointArrowToTram
  alc_PointArrow name = TRG_G_Race2_Tram01
endscript
script Alc_Bird
  Obj_ShadowOff
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = Alc_Bird_Fly params = <...>
  Obj_SetInnerRadius 10
  Wait random( @5 frames @15 frames @30 frames @45 frames ) 
  begin
    Obj_CycleAnim Anim = Idle numcycles = random( @1 @2 @3 ) 
  repeat
endscript
script Alc_Bird_Fly
  Obj_SpawnScript Alc_BirdCallSpawn
  if GotParam myFlag
    if GoalManager_GoalIsActive name = alc_goal_race2
      if IsAlive name = tpo_Race2_SeagullCounter
        tpo_Race2_SeagullCounter:Obj_SetFlag <myFlag>
      endif
    endif
  endif
   <birdMove> = ( randomrange(-150, 150) * (1, 0, 0) + randomrange(150, 250) * (0, 1, 0) + randomrange(200, 400) * (0, 0, 1) )
  Obj_ClearExceptions
  Obj_PlayAnim Anim = FlyFromIdle
  Obj_MoveToRelPos <birdMove> speed = 16 acceleration = 4
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Fly Cycle
  Obj_WaitMove
  Obj_PlayAnim Anim = Glide Cycle
  Obj_SetException ex = SkaterOutOfRadius scr = Alc_Bird_Return params = <...>
  Obj_SetOuterRadius 50
  begin
    Wait 10 seconds
  repeat
endscript
script Alc_BirdCallSpawn
  waittime = ( randomrange(1, 50) / 10.0 )
  Wait waittime seconds
  Obj_PlaySound hitseagulls pitch = randomrange(80, 120)
endscript
script Alc_Bird_Return
  Obj_ClearExceptions
  Obj_PlayAnim Anim = Glide Cycle
  Obj_MoveToNode name = <myNode> speed = 8
  Obj_WaitMove
  Obj_CycleAnim Anim = GlideToIdle
  Goto Alc_Bird params = <...>
endscript
script alc_Race2_EvilRanger
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = alc_Race2_EvilRanger_Fall params = <...>
  Obj_SetInnerRadius 10
  begin
    random( @
    Obj_CycleAnim Anim = Ped_M_UpYours
    @Obj_CycleAnim Anim = Ped_M_Wave
    @Obj_CycleAnim Anim = Ped_M_Talk_TheyWereThisBig
    @Obj_CycleAnim Anim = Ped_M_Talk_ShagAir
    @Obj_CycleAnim Anim = Ped_M_ShakeFist
    @Obj_CycleAnim Anim = Ped_M_PlayerWave
    @Obj_CycleAnim Anim = Ped_M_Disgust
    @Obj_CycleAnim Anim = Ped_M_Cheering
    @Obj_CycleAnim Anim = Ped_M_LookAndPoint
    @Obj_CycleAnim Anim = Ped_M_FallFromIdle
    Obj_CycleAnim Anim = Ped_M_Fall
    Obj_PlayAnim Anim = Ped_M_FallFromIdle from = 28 to = 1
    Obj_WaitAnimFinished
    @Obj_CycleAnim Anim = BoardPump
    @Obj_CycleAnim Anim = StandFist
     ) 
  repeat
endscript
script alc_Race2_EvilRanger_Fall
  Obj_PlaySound bitchslap2
  Obj_ClearExceptions
  Obj_PlayAnim Anim = Ped_M_FalldownB
  alc_Race2_BeatEvilRanger
endscript
script alc_Race2_BeatEvilRanger
  Wait 0.5 seconds
  if GoalManager_GoalIsActive name = alc_goal_race2
    GoalManager_PauseGoal name = alc_goal_race2
  endif
  if not skater:OnGround
    begin
      if skater:OnGround
        break
      endif
      Wait 1 gameframe
    repeat
  endif
  Wait 1 second
  if GoalManager_GoalFlagSet name = alc_goal_race2 flag = got_02
    SpawnScript alc_Race2_WinGoal
  else
    alc_Race2_Fail
  endif
endscript
script alc_Race2_EvilRanger_GetUp
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = alc_Race2_EvilRanger_Fall params = <...>
  Obj_SetInnerRadius 10
  Obj_CycleAnim Anim = Ped_M_GetUpB
  alc_Race2_EvilRanger
endscript
script alc_Race2_EvilRangerWorshiper
  begin
    Obj_PlayAnim Anim = Ped_M_FalldownE from = 135 to = 44
    Obj_WaitAnimFinished
    Obj_PlayAnim Anim = Ped_M_FalldownE from = 44 to = 135
    Obj_WaitAnimFinished
  repeat
endscript
script alc_Race2_WinGoal
  Wait 1 second
  if GoalManager_GoalIsActive name = alc_goal_race2
    GoalManager_SetGoalFlag name = alc_goal_race2 got_03 1
  endif
endscript
script Alc_AddGoal_Counter2
  AddGoal_Counter2 {
    career_only
    goal_text = "Dunk 30 Tourists!"
    view_goals_text = "Dunk 30 Tourists"
    goal_description = alc_Counter2_Desc
    number = 30
    use_hud_counter
    time = 30
    pro = "Bam"
    full_name = "Bam Margera"
    reward_goal = Alc_Goal_Gaps6
    record_type = time
  }
endscript
script Alc_DockPed
  Obj_StickToGround off
  Obj_ClearExceptions
  Obj_SetInnerRadius 6
  Obj_SetException ex = SkaterInRadius scr = Alc_DockPedClocked params = { <...> }
  Obj_MoveToNode name = <me>
  Obj_ShadowOn
  random( @
  Obj_Rotate absolute = (0, 0, 0) FLAG_MAX_COORDS
  @Obj_Rotate absolute = (0, 0, 45) FLAG_MAX_COORDS
  @Obj_Rotate absolute = (0, 0, 90) FLAG_MAX_COORDS
  @Obj_Rotate absolute = (0, 0, 135) FLAG_MAX_COORDS
  @Obj_Rotate absolute = (0, 0, 180) FLAG_MAX_COORDS
  @Obj_Rotate absolute = (0, 0, -135) FLAG_MAX_COORDS
  @Obj_Rotate absolute = (0, 0, -90) FLAG_MAX_COORDS
  @Obj_Rotate absolute = (0, 0, -45) FLAG_MAX_COORDS
   ) 
  random( @
  
  Obj_CycleAnim Anim = Ped_Guide_Idle1
  Obj_CycleAnim Anim = Ped_M_Idle1 numcycles = randomrange(1, 2)
  Obj_CycleAnim Anim = Ped_Guide_Idle2
  Obj_CycleAnim Anim = Ped_M_Idle1 numcycles = randomrange(1, 2)
  Obj_CycleAnim Anim = Ped_M_LookAround
  @
  Obj_CycleAnim Anim = Ped_Guide_Idle2
  Obj_CycleAnim Anim = Ped_M_Idle1 numcycles = randomrange(1, 2)
  Obj_CycleAnim Anim = Ped_Guide_Idle2
  Obj_CycleAnim Anim = Ped_M_Idle1
   ) 
  Goto Alc_DockPedWalking params = { <...> }
endscript
script Alc_DockPedWalking
  Obj_ClearExceptions
  Obj_SetInnerRadius 6
  Obj_SetException ex = SkaterInRadius scr = Alc_DockPedClocked params = { <...> }
  begin
    random( @
    
    Obj_CycleAnim Anim = Ped_Guide_Idle1
    Obj_CycleAnim Anim = Ped_M_Idle1
    Obj_CycleAnim Anim = Ped_Guide_Idle1
    Obj_CycleAnim Anim = Ped_M_Idle1 numcycles = randomrange(1, 2)
    @
    Obj_CycleAnim Anim = Ped_M_LookAround
    Obj_CycleAnim Anim = Ped_M_Idle1
    @
    Obj_CycleAnim Anim = Ped_Guide_Idle2
    Obj_CycleAnim Anim = Ped_M_Idle1 numcycles = randomrange(1, 2)
    @
    Obj_CycleAnim Anim = Ped_Guide_Idle1
    Obj_CycleAnim Anim = Ped_M_Idle1
    Obj_CycleAnim Anim = Ped_M_LookLeftDown
    Obj_CycleAnim Anim = Ped_M_Idle1
    @
    Obj_CycleAnim Anim = Ped_Guide_Idle1
    Obj_CycleAnim Anim = Ped_M_Idle1
    Obj_CycleAnim Anim = Ped_M_LookRight
    Obj_CycleAnim Anim = Ped_M_Idle1 numcycles = randomrange(1, 2)
    Obj_CycleAnim Anim = Ped_Guide_Idle2
    @
    Obj_CycleAnim Anim = Ped_Guide_Idle2
    Obj_CycleAnim Anim = Ped_M_Idle1
    Obj_CycleAnim Anim = Ped_M_ScratchChin
    Obj_CycleAnim Anim = Ped_M_Idle1
     ) 
  repeat
endscript
script Alc_DockPedClocked
  Obj_ClearExceptions
  Obj_SetOuterRadius 100
  Obj_SetException ex = SkaterOutOfRadius scr = Alc_DockPed params = { <...> }
  if GoalManager_GoalExists name = alc_Goal_Counter2
    if GoalManager_GoalIsActive name = alc_Goal_Counter2
      GoalManager_GotCounterObject name = alc_Goal_Counter2
      PlaySound gapsound
    endif
  endif
  SendFlag name = TRG_MG_TouristCounter ONCE_AROUND
  Obj_StopAlongPath
  Obj_SetBoundingSphere 10000
  Alc_DockPedJumpAnim <...>
  Wait 0.3 seconds
  Obj_PlaySound FallWater pitch = randomrange(80, 120) vol = 100
  Obj_WaitAnimFinished
  Obj_RestoreBoundingSphere
endscript
script Alc_DockPedJumpAnim
  Obj_ShadowOff
  random( @
  Obj_PlayJumpAnimReg Anim = Ped_Guide_Dive1 <...>
  @Obj_PlayJumpAnimReg Anim = Ped_Guide_Dive2 <...>
  @Obj_PlayJumpAnimReg Anim = Ped_Guide_Dive3 <...>
   ) 
endscript
script Obj_PlayJumpAnimReg
  if GotParam west
    Obj_Rotate absolute = (0, 0, -90) FLAG_MAX_COORDS
    Wait 1 gameframe
    Obj_PlayAnim <...>
  else
    Obj_Rotate absolute = (0, 0, 90) FLAG_MAX_COORDS
    Wait 1 gameframe
    Obj_PlayAnim <...>
  endif
endscript
script Obj_PlayJumpAnim180
  if GotParam west
    Obj_Rotate absolute = (0, 0, 90) FLAG_MAX_COORDS
    Wait 1 gameframe
    Obj_PlayAnim <...>
    Obj_MoveToRelPos (100, 0, 0) time = 0.5 FLAG_MAX_COORDS
    Obj_Rotate time = 0.5 absolute = (0, -90, 0) FLAG_MAX_COORDS
  else
    Obj_Rotate absolute = (0, 0, -90) FLAG_MAX_COORDS
    Wait 1 gameframe
    Obj_PlayAnim <...>
    Obj_MoveToRelPos (-100, 0, 0) time = 0.5 FLAG_MAX_COORDS
    Obj_Rotate time = 0.5 absolute = (0, 90, 0) FLAG_MAX_COORDS
  endif
endscript
script TouristCounter
  if GoalManager_GoalExists name = alc_Goal_Counter2
    begin
      Wait 10 frames
      if GoalManager_GoalExists name = alc_Goal_Counter2
        if GoalManager_HasWonGoal name = alc_Goal_Counter2
          if not SkaterCurrentScorePotGreaterThan 0
            Obj_VarSet var = 0 value = 0
            Obj_ClearFlag ONCE_AROUND
          else
            if Obj_FlagSet ONCE_AROUND
              Obj_ClearFlag ONCE_AROUND
              Obj_VarInc var = 0
              Obj_VarGet var = 0 name = counter
              FormatText TextName = Foo "%q" q = <counter>
              if Obj_VarLT var = 0 value = 10
                PlaySound hud_jumpgap vol = 70
                create_panel_message id = MiniGame1 text = <Foo> style = panel_message_MG_1_Low
              else
                PlaySound cash vol = 130
                create_panel_message id = MiniGame1 text = <Foo> style = panel_message_MG_1_High
              endif
              if Obj_VarEQ var = 0 value = 1
                create_panel_message id = MiniGame2 text = "Tourist" style = panel_message_MG_2
              else
                create_panel_message id = MiniGame2 text = "Tourists" style = panel_message_MG_2
              endif
              create_panel_message id = MiniGame3 text = "Combo" style = panel_message_MG_3
              create_panel_message id = MiniGame4 text = "Dunked" style = panel_message_MG_4
            endif
          endif
        endif
      endif
    repeat
  endif
endscript
script Alc_AddGoal_Race3
  AddGoal_Race3 {
    career_only
    goal_text = "Distract the Guards!"
    view_goals_text = "Distract the Guards"
    goal_description = alc_Race3_Desc
    goal_flags = [ got_01
      got_02
      got_03
      got_04
      got_06
      got_07
      got_08
      got_09
      got_10
      got_11
      got_12
      got_13
    ]
    use_hud_counter
    Intro_Node = TRG_G_Race3_IntroNode
    race_waypoints = [ { id = TRG_G_Race3_Nav01 scr = alc_Race3_waypoint_01 flag = got_01 time = 20 }
      { id = TRG_G_Race3_Nav02 scr = alc_Race3_waypoint_02 flag = got_02 time = 3 }
      { id = TRG_G_Race3_Nav03 scr = alc_Race3_waypoint_03 flag = got_03 time = 3 }
      { id = TRG_G_Race3_Nav04 scr = alc_Race3_waypoint_04 flag = got_04 time = 3 }
      { id = TRG_G_Race3_Nav06 scr = alc_Race3_waypoint_06 flag = got_06 time = 3 }
      { id = TRG_G_Race3_Nav07 scr = alc_Race3_waypoint_07 flag = got_07 time = 3 }
      { id = TRG_G_Race3_Nav08 scr = alc_Race3_waypoint_08 flag = got_08 time = 3 }
      { id = TRG_G_Race3_Nav09 scr = alc_Race3_waypoint_09 flag = got_09 time = 3 }
      { id = TRG_G_Race3_Nav10 scr = alc_Race3_waypoint_10 flag = got_10 time = 3 }
      { id = TRG_G_Race3_Nav11 scr = alc_Race3_waypoint_11 flag = got_11 time = 3 }
      { id = TRG_G_Race3_Nav12 scr = alc_Race3_waypoint_12 flag = got_12 time = 3 }
      { id = TRG_G_Race3_Nav13 scr = alc_Race3_waypoint_13 flag = got_13 time = 3 }
    ]
    start_cam_anim = G_Race3_CameraStart
    success_cam_anim = G_Race3_CameraSuccess
    pro = "PrisonerInSewer"
    full_name = "Prisoner"
    reward_goal = alc_Goal_Counter4
    goal_intro_script = Alc_Goal_Race3_Intro
    goal_start_script = Alc_Goal_Race3_Start
    goal_deactivate_script = Alc_Goal_Race3_Deactivate
    goal_outro_script = alc_Goal_Race3_Outro
    goal_success_script = alc_Goal_Race3_Success
    record_type = time
  }
endscript
script Alc_Goal_Race3_Intro
  Create prefix = "TRG_G_Race3_Nav"
  Kill prefix = "TRG_G_Race3_Distraction"
  Create prefix = "TRG_G_Race3_Distraction"
endscript
script Alc_Goal_Race3_Start
endscript
script alc_Goal_Race3_Outro
  SpawnScript alc_Goal_Race3_OutroSpawn
endscript
script alc_Goal_Race3_OutroSpawn
  Printf "--- Running OutroSpawn Script"
  Kill name = TRG_G_Race3_SuccessPrisoner
  Create name = TRG_G_Race3_SuccessPrisoner
endscript
script Alc_Goal_Race3_Deactivate
  Kill prefix = "TRG_G_Race3_Distraction"
  Wait 1 frame
  Create prefix = "TRG_G_Race3_Distraction"
  Kill prefix = "TRG_G_Race3_Nav"
  Kill prefix = "TRG_G_Race3_Arrow"
  SpawnScript Alc_Goal_Race3_DeactivateSpawn
endscript
script alc_Goal_Race3_Success
  Kill name = TRG_G_Race3_SuccessPrisoner
endscript
script alc_Race3_SuccessPrisoner
  Printf "--- Outro Prisoner Created"
  Obj_PlayAnim Anim = Ped_M_Run Cycle
  Obj_SetPathVelocity 15 mph
  Obj_SetPathAcceleration 20 mphps
  Obj_SetPathDeceleration 10 mphps
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Wait 0.7 second
  Obj_CycleAnim Anim = Ped_M_RunToIdle
  begin
    random( @
    Obj_PlayAnim Anim = Ped_M_Cheering
    @Obj_PlayAnim Anim = Ped_M_ThumbUp
    @Obj_PlayAnim Anim = Ped_M_Clap
    Printf "--- Spawning Ped_M_Clap_Sounds"
    Ped_M_Clap_Sounds
    @Obj_PlayAnim Anim = Ped_M_Cheer1
    @Obj_PlayAnim Anim = Ped_M_Cheer2
    @Obj_PlayAnim Anim = Ped_M_Cheer3
    @Obj_PlayAnim Anim = Ped_M_Cheer4
    Printf "--- Spawning Ped_M_Cheer4_Sounds"
    Ped_M_Cheer4_Sounds
    @Obj_PlayAnim Anim = Ped_M_Cheer5
    Printf "--- Spawning Ped_M_Cheer5_Sounds"
    Ped_M_Cheer5_Sounds
    @Obj_PlayAnim Anim = Ped_M_Cheer6
    Printf "--- Spawning Ped_M_Cheer6_Sounds"
    Ped_M_Cheer6_Sounds
    @Obj_PlayAnim Anim = Ped_M_Cheer7
    Printf "--- Spawning Ped_M_Cheer7_Sounds"
    Ped_M_Cheer7_Sounds
     ) 
    Obj_WaitAnimFinished
  repeat
  Die
endscript
script alc_Race3_waypoint_01
  create_panel_block id = current_goal text = "Distract the Guards!\nMake Some Noise!" style = panel_message_goal
  Kill prefix = "TRG_G_Race3_Arrow"
  Wait 1 frame
  Create name = TRG_G_Race3_Arrow01
endscript
script alc_Race3_waypoint_02
  alc_race3_waypointCheck prevFlag = got_01 myArrow = TRG_G_Race3_Arrow02
endscript
script alc_Race3_waypoint_03
  alc_race3_waypointCheck prevFlag = got_02 myArrow = TRG_G_Race3_Arrow03
endscript
script alc_Race3_waypoint_04
  alc_race3_waypointCheck prevFlag = got_03 myArrow = TRG_G_Race3_Arrow04
endscript
script alc_Race3_waypoint_06
  alc_race3_waypointCheck prevFlag = got_04 myArrow = TRG_G_Race3_Arrow06
endscript
script alc_Race3_waypoint_07
  alc_race3_waypointCheck prevFlag = got_06 myArrow = TRG_G_Race3_Arrow07
endscript
script alc_Race3_waypoint_08
  alc_race3_waypointCheck prevFlag = got_07 myArrow = TRG_G_Race3_Arrow08
endscript
script alc_Race3_waypoint_09
  alc_race3_waypointCheck prevFlag = got_08 myArrow = TRG_G_Race3_Arrow09
endscript
script alc_Race3_waypoint_10
  alc_race3_waypointCheck prevFlag = got_09 myArrow = TRG_G_Race3_Arrow10
endscript
script alc_Race3_waypoint_11
  alc_race3_waypointCheck prevFlag = got_10 myArrow = TRG_G_Race3_Arrow11
endscript
script alc_Race3_waypoint_12
  alc_race3_waypointCheck prevFlag = got_11 myArrow = TRG_G_Race3_Arrow12
endscript
script alc_Race3_waypoint_13
  alc_race3_waypointCheck prevFlag = got_12 myArrow = TRG_G_Race3_Arrow13
endscript
script alc_race3_waypointCheck
  Kill prefix = "TRG_G_Race3_Arrow"
  Wait 1 frame
  Create name = <myArrow>
endscript
script Alc_DistractorItemHit race_flag = got_01
  if IsAlive name = tbp_AlcGuard01
    SendException ALC_GUARD_PISSED prefix = "tbp_AlcGuard"
  endif
  Obj_PlaySound HitMetalCan_11
  switch <race_flag>
  case got_01
    myGuard = tbp_AlcGuard01
    guardVO = guard_getangry01
    can1 = TRG_G_Race3_Distraction_Can_01
    can2 = TRG_G_Race3_Distraction_Can_02
  case got_02
    prevFlag = got_01
    myGuard = tbp_AlcGuard02
    guardVO = guard_getangry02
    can1 = TRG_G_Race3_Distraction_Can_03
    can2 = TRG_G_Race3_Distraction_Can_04
  case got_03
    prevFlag = got_02
    myGuard = tbp_AlcGuard02
    guardVO = guard_getangry03
    can1 = TRG_G_Race3_Distraction_Can_05
    can2 = TRG_G_Race3_Distraction_Can_06
  case got_04
    prevFlag = got_03
    myGuard = tbp_AlcGuard03
    guardVO = guard_getangry04
    can1 = TRG_G_Race3_Distraction_Can_07
    can2 = TRG_G_Race3_Distraction_Can_08
  case got_06
    prevFlag = got_04
    myGuard = tbp_AlcGuard04
    guardVO = guard_getangry05
    can1 = TRG_G_Race3_Distraction_Can_09
    can2 = TRG_G_Race3_Distraction_Can_10
  case got_07
    prevFlag = got_06
    myGuard = tbp_AlcGuard04
    guardVO = guard_getangry06
    can1 = TRG_G_Race3_Distraction_Can_11
    can2 = TRG_G_Race3_Distraction_Can_12
  case got_08
    prevFlag = got_07
    myGuard = tbp_AlcGuard05
    guardVO = guard_getangry01
    can1 = TRG_G_Race3_Distraction_Can_13
    can2 = TRG_G_Race3_Distraction_Can_14
  case got_09
    prevFlag = got_08
    myGuard = tbp_AlcGuard06
    guardVO = guard_getangry02
    can1 = TRG_G_Race3_Distraction_Can_15
    can2 = TRG_G_Race3_Distraction_Can_16
  case got_10
    prevFlag = got_09
    myGuard = tbp_AlcGuard07
    guardVO = guard_getangry03
    can1 = TRG_G_Race3_Distraction_Can_17
    can2 = TRG_G_Race3_Distraction_Can_18
  case got_11
    prevFlag = got_10
    myGuard = tbp_AlcGuard08
    guardVO = guard_getangry04
    can1 = TRG_G_Race3_Distraction_Can_19
    can2 = TRG_G_Race3_Distraction_Can_20
  case got_12
    prevFlag = got_11
    myGuard = tbp_AlcGuard09
    guardVO = guard_getangry05
    can1 = TRG_G_Race3_Distraction_Can_21
    can2 = TRG_G_Race3_Distraction_Can_22
  case got_13
    prevFlag = got_12
  endswitch
  if GotParam myGuard
    if IsAlive name = <myGuard>
      Printf "--- Playing %s from %g" g = <myGuard> s = <guardVO>
       <myGuard>:Obj_PlayStream <guardVO> vol = 250
    endif
  endif
  if GoalManager_GoalIsActive name = Alc_Goal_Race3
    shouldSetFlag = 1
    if GotParam prevFlag
      if not GoalManager_GoalFlagSet name = Alc_Goal_Race3 flag = <prevFlag>
        shouldSetFlag = 0
      endif
    endif
    if ( <shouldSetFlag> = 1 )
      if not GoalManager_GoalFlagSet name = Alc_Goal_Race3 flag = <race_flag>
        GoalManager_SetGoalFlag name = Alc_Goal_Race3 <race_flag> 1
        GoalManager_NextRaceWaypoint name = Alc_Goal_Race3
        SpawnScript Alc_DistractorItemHitSpawn
      endif
    else
      create_panel_block id = current_goal text = "Whoops! Need to hit the barrels in order!!" style = panel_message_goal
      SpawnScript alc_Race3_LoseGoal
    endif
  endif
  alc_CheckCan <...>
endscript
script Alc_DistractorItemHitSpawn
  Wait 0.5 seconds
  if GoalManager_GoalIsActive name = Alc_Goal_Race3
    PlaySound goaldone
    create_panel_block id = current_goal text = "+3 more seconds!!" style = panel_message_goal
  endif
endscript
script alc_CheckCan
  Printf "--- Running CheckCan"
  Wait 8 gameframe
  PrintStruct
  if IsAlive name = <can1>
    if not QueryFlag ALC_BOUNCED name = <can1>
      Printf "--- Can1 not bounced, bouncing..."
       <can1>:BouncyObj_Go (20, 370, 20)
    endif
  endif
  if IsAlive name = <can2>
    if not QueryFlag ALC_BOUNCED name = <can2>
      Printf "--- Can2 not bounced, bouncing..."
       <can2>:BouncyObj_Go (-20, 370, -20)
    endif
  endif
endscript
script alc_CanBounced
  Obj_SetFlag ALC_BOUNCED
endscript
script alc_Race3_LoseGoal
  Wait 3 seconds
  if GoalManager_GoalIsActive name = Alc_Goal_Race3
    GoalManager_LoseGoal name = Alc_Goal_Race3
  endif
endscript
script alc_FoghornGap
  StartGap GapID = foghorn flags = PURE_RAIL
  EndGap GapID = foghorn score = 50 text = "Foghorn" gapscript = alc_PlayFoghorn
endscript
script alc_PlayFoghorn
  StopStream
  Wait 1 frame
  PlayStream foghorn
  Printf "--- Playing Foghorn steam..."
  if GoalManager_GoalIsActive name = Alc_Goal_Race3
    if not GoalManager_GoalFlagSet name = Alc_Goal_Race3 flag = got_13
      PlaySound goaldone
      GoalManager_PauseGoal name = Alc_Goal_Race3
      Wait 1.5 seconds
      if GoalManager_GoalIsActive name = Alc_Goal_Race3
        GoalManager_SetGoalFlag name = Alc_Goal_Race3 got_13 1
        GoalManager_NextRaceWaypoint name = Alc_Goal_Race3
      endif
    endif
  endif
endscript
script alc_Guard
  s1 = ( randomrange(9, 13) / 10.0 )
  Obj_ApplyScaling {
    x = <s1>
    y = ( randomrange(9, 11) / 10.0 )
    z = <s1> }
  GotoPreserveParams alc_GuardNotMad
endscript
script alc_GuardNotMad
  Obj_ClearExceptions
  Obj_PlayAnim Anim = Ped_SEC_Pace Cycle
  Obj_SetPathVelocity 2.3
  Obj_SetPathAcceleration 5
  Obj_FollowPathLinked
  Obj_SetException ex = ALC_GUARD_PISSED scr = alc_GuardGettingMad <...>
  begin
    Wait randomrange(3, 6) seconds
    alc_Guard_Idle <...>
  repeat
endscript
script alc_Guard_Idle
  Obj_ClearFlag ALC_FLAG01
  Obj_SetAnimCycleMode off
  Obj_WaitAnimFinished
  Obj_StopAlongPath
  Obj_CycleAnim Anim = Ped_SEC_PaceToIdle
  Obj_CycleAnim Anim = Ped_SEC_Idle
  Obj_StartAlongPath
  Obj_CycleAnim Anim = Ped_SEC_PaceFromIdle
  Obj_PlayAnim Anim = Ped_SEC_Pace Cycle
endscript
script alc_GuardGettingMad
  Obj_SpawnScript alc_GuardMadTimer
  alc_GuardMad
endscript
script alc_GuardMadTimer
  Obj_SetFlag ALC_FLAG01
  Wait 10 seconds
  Obj_ClearFlag ALC_FLAG01
endscript
script alc_GuardMad
  Obj_ClearExceptions
  Obj_SetException ex = ALC_GUARD_PISSED scr = alc_GuardGettingMad <...>
  Obj_PlayAnim Anim = Ped_SEC_Pace Cycle
  Obj_FollowPathLinked
  Obj_SetPathVelocity 2.3
  Obj_SetPathAcceleration 5
  Obj_SetInnerRadius 50
  Obj_SetException ex = SkaterInRadius scr = alc_Guard_TryHitSkater
  begin
    if Obj_FlagSet ALC_FLAG01
      Wait randomrange(3, 6) seconds
    else
      break
    endif
    alc_Guard_IdleMad
  repeat
  alc_GuardNotMad
endscript
script alc_Guard_IdleMad
  Obj_SetAnimCycleMode off
  Obj_WaitAnimFinished
  Obj_StopAlongPath
  Obj_CycleAnim Anim = Ped_SEC_PaceToIdle
  Obj_CycleAnim Anim = Ped_SEC_Idle
  Obj_StartAlongPath
  Obj_CycleAnim Anim = Ped_SEC_PaceFromIdle
  Obj_PlayAnim Anim = Ped_SEC_Pace Cycle
endscript
script alc_Guard_TryHitSkater
  Obj_ClearException SkaterInRadius
  if Obj_FlagSet ALC_FLAG01
    Obj_StopAlongPath
    Obj_LookAtObject type = skater time = 0.01
    Obj_CycleAnim Anim = Ped_M_Punch
    Obj_PlaySound armwhoosh01
    if Obj_ObjectInRect dist = 7 width = 4 height = 10 type = skater offset = (0, 0, 0)
      skater:bloodsplat
      MakeSkaterGoto PedKnockDown
      PlaySound bitchslap2
    endif
    Obj_CycleAnim Anim = Ped_M_Punch
    GotoPreserveParams alc_GuardMad
  else
    alc_GuardNotMad
  endif
endscript
script Alc_AddGoal_Special
  AddGoal_Special {
    career_only
    special_gap
    goal_text = "Semi Flip the Bulldozer"
    view_goals_text = "Semi Flip the Bulldozer"
    goal_description = alc_Special_Desc
    time = 45
    pro = "rodney"
    full_name = "Rodney Mullen"
    trick_name = Trick_SemiFlip
    trick_type = air
    reward_goal = Alc_Goal_Trickspot
    record_type = time
    goal_start_script = alc_Special_Start
    goal_outro_script = alc_Special_Outro
  }
endscript
script alc_Special_Start
  SpawnScript alc_Special_StartSpawn
endscript
script alc_Special_Outro
  Printf "--- Killing Skater to Restart..."
  skater:KillSkater node = TRG_G_Special_RestartEnd
endscript
script alc_Special_StartSpawn
  Wait 1 second
  if GoalManager_GoalIsActive name = Alc_Goal_Special
    GetKeyComboArrayFromTrickArray tricks = [ Trick_SemiFlip ]
     <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
    FormatText TextName = myText "Get SPECIAL then\nSemi Flip\n%a\nthe Bulldozer!" a = <combo_1>
    create_panel_block id = current_goal text = <myText> style = panel_message_goal
  endif
endscript
script alc_DozerGapStart
  StartGap GapID = DozerGap01 flags = PURE_AIR tricktext = "Semi Flip" trickscript = alc_SpecialTrickSuccess
endscript
script alc_DozerGapEnd
  EndGap GapID = DozerGap01 text = "Over the Dozer!" score = 250
  StartGap GapID = DozerGap02 flags = PURE_AIR tricktext = "Semi Flip" trickscript = alc_SpecialTrickSuccess
endscript
script EndDozerGapGround
  EndGap GapID = DozerGap02
endscript
script alc_SpecialTrickSuccess
  Wait 1 frame
  Printf "trickscript fired"
  if GoalManager_GoalExists name = Alc_Goal_Special
    if GoalManager_GoalIsActive name = Alc_Goal_Special
      GoalManager_WinGoal name = Alc_Goal_Special
    endif
  endif
endscript
script alc_Dozer
  Obj_PlaySound dieselgenerator
  begin
    Obj_Rotate absolute = (0, 0, 90) time = 1.6 FLAG_MAX_COORDS
    Obj_WaitRotate
    Obj_MoveToRelPos (500, 0, 0) acceleration = 0.1 deceleration = 0.1 speed = 8 FLAG_MAX_COORDS
    Obj_AdjustSound dieselgenerator volumePercent = 100 volumeStep = 0.7 pitchPercent = 100 pitchStep = 0.7
    Obj_WaitMove
    Obj_AdjustSound dieselgenerator volumePercent = 50 volumeStep = 1.5 pitchPercent = 30 pitchStep = 1.5
    Wait 2 seconds
    Obj_MoveToRelPos (-1000, 0, 0) acceleration = 0.1 deceleration = 0.1 speed = 8 FLAG_MAX_COORDS
    Obj_AdjustSound dieselgenerator volumePercent = 100 volumeStep = 0.7 pitchPercent = 100 pitchStep = 0.7
    Obj_WaitMove
    Obj_AdjustSound dieselgenerator volumePercent = 50 volumeStep = 1.5 pitchPercent = 30 pitchStep = 1.5
    Wait 2 seconds
    Obj_MoveToRelPos (500, 0, 0) acceleration = 0.1 deceleration = 0.1 speed = 8 FLAG_MAX_COORDS
    Obj_AdjustSound dieselgenerator volumePercent = 100 volumeStep = 0.7 pitchPercent = 100 pitchStep = 0.7
    Obj_WaitMove
    Obj_AdjustSound dieselgenerator volumePercent = 50 volumeStep = 1.5 pitchPercent = 30 pitchStep = 1.5
    Wait 2 seconds
    Obj_Rotate absolute = (0, 0, 0) time = 1.6 FLAG_MAX_COORDS
    Obj_WaitRotate
    Obj_MoveToRelPos (0, 500, 0) acceleration = 0.1 deceleration = 0.1 speed = 8 FLAG_MAX_COORDS
    Obj_AdjustSound dieselgenerator volumePercent = 100 volumeStep = 0.7 pitchPercent = 100 pitchStep = 0.7
    Obj_WaitMove
    Obj_AdjustSound dieselgenerator volumePercent = 50 volumeStep = 1.5 pitchPercent = 30 pitchStep = 1.5
    Wait 2 seconds
    Obj_MoveToRelPos (0, -1000, 0) acceleration = 0.1 deceleration = 0.1 speed = 8 FLAG_MAX_COORDS
    Obj_AdjustSound dieselgenerator volumePercent = 100 volumeStep = 0.7 pitchPercent = 100 pitchStep = 0.7
    Obj_WaitMove
    Obj_AdjustSound dieselgenerator volumePercent = 50 volumeStep = 1.5 pitchPercent = 30 pitchStep = 1.5
    Wait 2 seconds
    Obj_MoveToRelPos (0, 500, 0) acceleration = 0.1 deceleration = 0.1 speed = 8 FLAG_MAX_COORDS
    Obj_AdjustSound dieselgenerator volumePercent = 100 volumeStep = 0.7 pitchPercent = 100 pitchStep = 0.7
    Obj_WaitMove
    Obj_AdjustSound dieselgenerator volumePercent = 50 volumeStep = 1.5 pitchPercent = 30 pitchStep = 1.5
  repeat
endscript
script alc_DozerCab
  Obj_LockToObject ObjectName = tsv_Dozer (2.04, 53.856, 2.976) NoRotation
  begin
    random( @
    Obj_RotZ speed = -20 acceleraction = -10 FLAG_MAX_COORDS
    @Obj_RotZ speed = -20 acceleraction = -10 FLAG_MAX_COORDS
    @Obj_RotZ speed = 10 acceleraction = 10 FLAG_MAX_COORDS
    @Obj_RotZ speed = 20 acceleraction = 10 FLAG_MAX_COORDS
     ) 
    Wait randomrange(3, 10) seconds
    Obj_RotZ speed = 0 deceleration = 10 FLAG_MAX_COORDS
    Wait 4 seconds
    random( @
    Obj_RotZ speed = -20 acceleraction = -10 FLAG_MAX_COORDS
    @Obj_RotZ speed = -20 acceleraction = -10 FLAG_MAX_COORDS
    @Obj_RotZ speed = 10 acceleraction = 10 FLAG_MAX_COORDS
    @Obj_RotZ speed = 20 acceleraction = 10 FLAG_MAX_COORDS
     ) 
    Wait randomrange(3, 10) seconds
    Obj_RotZ speed = 0 deceleration = 10 FLAG_MAX_COORDS
    Wait 4 seconds
  repeat
  Obj_PathHeading off
  Obj_SetPathTurnDist 2 feet
  Obj_SetPathAcceleration 0.25
  Obj_SetPathDeceleration 0.25
  Obj_FollowPathLinked
  begin
    Obj_SetPathVelocity randomrange(1, 2)
    Obj_RotZ speed = randomrange(20, 30) deceleration = 30 FLAG_MAX_COORDS
    Wait randomrange(3, 10) seconds
    Obj_SetPathVelocity randomrange(3, 4)
    Obj_RotZ speed = randomrange(100, 120) acceleration = 30 FLAG_MAX_COORDS
    Wait randomrange(3, 10) seconds
  repeat
endscript
script alc_DozerArmBase
  Obj_LockToObject ObjectName = tsv_DozerCab (-42.36, 36.024, 16.764)
endscript
script alc_DozerArm
  Die
endscript
script Alc_AddGoal_Counter
  AddGoal_Counter {
    goal_text = "Find the Guard's Keys!"
    view_goals_text = "Find the Guard's Keys"
    goal_description = alc_Counter_Desc
    time = 60
    number = 16
    use_hud_counter
    Geo_Prefix = "TRG_G_COUNTER_Key"
    success_cam_anim = G_Counter_CameraSuccess
    pro = "Guard"
    full_name = "Security Guard"
    reward_goal = Alc_Goal_Tetris
    goal_outro_script = alc_Goal_Collect_Outro
    record_type = time
  }
endscript
script alc_Goal_Collect_Outro
  SpawnScript alc_Goal_Collect_OutroSpawn
endscript
script alc_Goal_Collect_OutroSpawn
  Kill prefix = "ac_Lock"
  Kill prefix = "aco_CellblockDoors"
  Create prefix = "aco_CellblockDoors"
endscript
script alc_CellblockDoorsA
  Obj_MoveToRelPos (-100, 0, 0) acceleration = 0.1 deceleration = 0.1 speed = 8 FLAG_MAX_COORDS
endscript
script alc_CellblockDoorsB
  Obj_MoveToRelPos (100, 0, 0) acceleration = 0.1 deceleration = 0.1 speed = 8 FLAG_MAX_COORDS
endscript
script alc_Counter_Key
  Obj_SetException ex = SkaterInRadius scr = alc_Counter_KeyGot
  Obj_SetInnerRadius 10
  Obj_RotZ speed = random( @50 @-150 @200 @-250  ) FLAG_MAX_COORDS
  Obj_Hover Amp = random( @5 @10 @15  ) Freq = random( @0.5 @1 @2 ) 
endscript
script alc_Counter_KeyGot
  PlaySound gapsound vol = 100
  GoalManager_GotCounterObject name = alc_goal_counter
  Die
endscript
script Alc_AddGoal_ProScore
  AddGoal_ProScore {
    goal_text = alc_proscore_text
    goal_description = alc_ProScore_Desc
    view_goals_text = alc_proscore_text
    score = alc_proscore_score
    pro = "Elissa"
    full_name = "Elissa Steamer"
    unlocked_by_another
    record_type = score
  }
endscript
script Alc_AddGoal_Competition
  AddGoal_Competition {
    career_only
    goal_text = "Medal in the Competition!"
    view_goals_text = "Medal in the Competition"
    goal_description = alc_Competition_Desc
    success_cam_anim = G_COMP_CameraSuccess
    pro = "Warden"
    full_name = "The Warden"
    gold = 95
    silver = 85
    bronze = 70
    time = 30
    gold_score = alc_comp_gold
    silver_score = alc_comp_silver
    bronze_score = alc_comp_bronze
    bail = 1
    goal_start_script = alc_Comp_Start
    goal_deactivate_script = alc_Comp_Deactivate
  }
endscript
script alc_Comp_Start
  Kill prefix = "tsv_Dozer"
endscript
script alc_Comp_Deactivate
  Kill prefix = "tsv_Dozer"
  Create prefix = "tsv_Dozer"
endscript
script Alc_AddGoal_Skate
  AddGoal_Skate {
    goal_text = "Collect S-K-A-T-E!"
    view_goals_text = "Collect the S-K-A-T-E letters"
    goal_description = alc_Skate_Desc
    pro = "Buddy2"
    full_name = "Tourist"
    record_type = time
  }
endscript
script Alc_AddGoal_Gaps1
  AddGoal_Gaps {
    career_only
    distance_record_object = TRG_Minigame_DistanceStart
    goal_text = "Ranger Ron's Skitch Launch"
    view_goals_text = "Ranger Ron's Skitch Launch"
    goal_description = alc_Gaps_Desc
    goal_flags = [ got_01
      got_02
    ]
    use_hud_counter
    time = 60
    proset_prefix = "ProSet3_"
    pro = "Ranger2"
    full_name = "Ranger Ron"
    unlocked_by_another
    goal_intro_script = Alc_Goal_Gaps_Intro
    goal_start_script = alc_Goal_Gaps_Start
    goal_deactivate_script = Alc_Goal_Gaps_Deactivate
    goal_outro_script = alc_Goal_Gaps_Outro
    record_type = score
  }
endscript
script Alc_Goal_Gaps_Intro
  Kill name = ttv_G_Gap_Tram4Looks
endscript
script alc_Goal_Gaps_Start
  Kill name = ttv_G_Gap_Tram4Looks
  Kill prefix = "tev_Tram"
  Kill name = TRG_G_Gaps_Tram02
  Create name = TRG_G_Gaps_Tram02
  Printf "------------- Gaps Start Script called, Creating Tram02..."
  Create prefix = "Proset4"
  SetFlag flag = FLAG_PROSET4_GEO_ON
  Create prefix = "agt_Gaps_OutOfBounds"
  Create name = TRG_G_Gap_ProAlt
  UnSetFlag flag = ALC_RESTARTOK
  alc_MakeSkaterStand
  SpawnScript alc_Goal_Gaps_StartSpawn
endscript
script alc_Goal_Gaps_StartSpawn
  Wait 2 second
  if GoalManager_GoalIsActive name = alc_goal_gaps
    create_panel_block id = current_goal text = "Skitch launch for\nHeight (150')\nand Distance (350')\nPress \b4 before the tram stops. Hit downslope for best results." style = panel_message_goal
  endif
endscript
script Alc_Goal_Gaps_Deactivate
  Kill name = TRG_G_Gap_ProAlt
  Printf "--- Deactivating Goal, killing Tram"
  Kill name = TRG_G_Gaps_Tram02
  Kill prefix = "agt_Gaps_OutOfBounds"
  Kill prefix = "tev_Tram"
  Create prefix = "tev_Tram"
  skater:OverrideLimits max = 10000 friction = 0 time = 0
  SpawnScript Alc_Goal_Gaps_DeactivateSpawn
  KillSpawnedScript name = alc_goal_gaps_distance_checker
  if ScreenElementExists id = alc_goal_gaps_message
    DestroyScreenElement id = alc_goal_gaps_message
  endif
  if ScreenElementExists id = alc_goal_gaps_record
    DestroyScreenElement id = alc_goal_gaps_record
  endif
endscript
script Alc_Goal_Gaps_DeactivateSpawn
  Wait 1 gameframe
  if GoalManager_GoalExists name = alc_goal_gaps
    if not GoalManager_GoalIsActive name = alc_goal_gaps
      Kill name = ttv_G_Gap_Tram4Looks
      if not GoalManager_HasWonGoal name = alc_goal_gaps
        Create name = ttv_G_Gap_Tram4Looks
        Kill prefix = "Proset4"
        Kill name = ttv_G_Gap_Tram4Looks
        UnSetFlag flag = FLAG_PROSET4_GEO_ON
      endif
    endif
  endif
endscript
script alc_Goal_Gaps_Outro
  Kill name = TRG_G_Gaps_Tram02
endscript
script DistanceMinigameStart
  if GoalManager_GoalIsActive name = alc_goal_gaps
    if ScreenElementExists id = alc_goal_gaps_message
      DestroyScreenElement id = alc_goal_gaps_message
    endif
    if ScreenElementExists id = alc_goal_gaps_record
      DestroyScreenElement id = alc_goal_gaps_record
    endif
    SpawnScript alc_goal_gaps_distance_checker
  endif
endscript
script DistanceMinigameEnd
  KillSpawnedScript name = alc_goal_gaps_distance_checker
  if ScreenElementExists id = alc_goal_gaps_message
    DestroyScreenElement id = alc_goal_gaps_message
  endif
  if ScreenElementExists id = alc_goal_gaps_record
    DestroyScreenElement id = alc_goal_gaps_record
  endif
endscript
script alc_goal_gaps_distance_checker
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    type = TextBlockElement
    parent = root_window
    id = alc_goal_gaps_message
    font = small
    dims = (100, 0)
    allow_expansion
    Pos = (50, 240)
    just = [ Left top ]
  }
  CreateScreenElement {
    type = TextBlockElement
    parent = root_window
    id = alc_goal_gaps_record
    font = small
    dims = (200, 0)
    allow_expansion
    Pos = (20, 160)
    scale = 0.9
    just = [ Left top ]
  }
  begin
    if GoalManager_CheckDistanceRecord name = alc_goal_gaps
      GoalManager_GetGoalParams name = alc_goal_gaps
      FormatText TextName = distance_message "New Distance Record: %f'%i''\n" f = <record_feet> i = <record_inches>
      SetScreenElementProps {
        RGBA = [ 128 128 32 128 ]
        id = alc_goal_gaps_record
        text = <distance_message>
      }
    endif
    GoalManager_GetGoalParams name = alc_goal_gaps
    FormatText TextName = distance_message "%f'%i''" f = <current_distance_feet> i = <current_distance_inches>
    SetScreenElementProps {
      id = alc_goal_gaps_message
      RGBA = [ 115 26 26 95 ]
      text = <distance_message>
    }
    Wait 2 gameframe
  repeat
endscript
script alc_GapGoal_SkitchTram
  begin
    begin
      Wait 1 gameframe
      if skater:Skitching
        Car_Generic01 DefaultSpeed = 0 SkitchSpeed = 82 carloopSFX = TramEngineLoop allowSlow
        Obj_SetPathAcceleration 40 mphps
        break
      endif
    repeat
    begin
      Wait 1 gameframe
      if not skater:Skitching
        if skater:SpeedLessThan 500
          alc_Gaps_Respawn fromTram reason = "Not enough speed!!"
        endif
      endif
    repeat
    Wait 1 gameframe
  repeat
endscript
script alc_MakeSkaterStand
  MakeSkaterGoto SkaterInit
  Wait 1 gameframe
  MakeSkaterGoto HandBrake
endscript
script alc_Gaps_LaunchBail
  Printf "--- Goto NoseManualBail...."
  Wait 0.1 seconds
  begin
    if skater:Skitching
      MakeSkaterGoto NoseManualBail
      alc_Gaps_Respawn
      break
    endif
    Wait 1 gameframe
  repeat
endscript
script alc_Gaps_HeightSuccess
  if GoalManager_GoalIsActive name = alc_goal_gaps
    if not GoalManager_GoalFlagSet name = alc_goal_gaps flag = got_01
      if not GoalManager_GoalFlagSet name = alc_goal_gaps flag = got_02
        create_panel_block id = current_goal text = "You reached 150'!!\n\nSkitch the other side\nof the tram to go\nfor distance (350')." style = panel_message_goal
        GoalManager_SetGoalFlag name = alc_goal_gaps got_01 1
        PlaySound goaldone
        alc_Gaps_Respawn
      else
        create_panel_block id = current_goal text = "You reached 150'!!" style = panel_message_goal
        PlaySound goaldone
        GoalManager_PauseGoal name = alc_goal_gaps
        begin
          if skater:OnGround
            Wait 1 second
            if GoalManager_GoalIsActive name = alc_goal_gaps
              GoalManager_SetGoalFlag name = alc_goal_gaps got_01 1
            endif
            break
          endif
          Wait 1 gameframe
        repeat
      endif
    endif
  endif
endscript
script alc_Gaps_DistanceSuccess
  if GoalManager_GoalIsActive name = alc_goal_gaps
    if not GoalManager_GoalFlagSet name = alc_goal_gaps flag = got_02
      if not GoalManager_GoalFlagSet name = alc_goal_gaps flag = got_01
        create_panel_block id = current_goal text = "You reached 350'!!\n\nSkitch the other\nside of the tram\nand go for height!" style = panel_message_goal
        GoalManager_SetGoalFlag name = alc_goal_gaps got_02 1
        PlaySound goaldone
        alc_Gaps_Respawn
      else
        create_panel_block id = current_goal text = "You reached 350'!!" style = panel_message_goal
        PlaySound goaldone
        GoalManager_PauseGoal name = alc_goal_gaps
        begin
          if skater:OnGround
            GoalManager_SetGoalFlag name = alc_goal_gaps got_02 1
            break
          endif
          Wait 1 gameframe
        repeat
      endif
    endif
  endif
endscript
script alc_Gaps_Respawn
  SetFlag flag = ALC_RESTARTOK
  if GotParam reason
    create_panel_message id = alc_gaps_message text = <reason> Pos = (320, 75) RGBA = [ 117 25 15 , 100 ]
  endif
  begin
    if skater:OnGround
      break
    endif
    Wait 1 gameframe
  repeat 60
  Wait 2 seconds
  if GetFlag flag = ALC_RESTARTOK
    UnSetFlag flag = ALC_RESTARTOK
    DistanceMinigameEnd
    if GoalManager_GoalIsActive name = alc_goal_gaps
      Printf "--- alc_Gaps_Respawn: Respawning Skater & recreating Tram"
      SpawnScript alc_Gaps_RecreateTram
      skater:KillSkater node = TRG_G_GAP_RestartNode
    endif
  endif
endscript
script alc_Gaps_RecreateTram
  Kill name = TRG_G_Gaps_Tram02
  Printf "------------- RecreateTram called, Creating Tram02..."
  if GoalManager_GoalIsActive name = alc_goal_gaps
    Create name = TRG_G_Gaps_Tram02
  endif
endscript
script alc_RestroomsGapStart
  StartGap GapID = RestroomGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL CANCEL_RAIL ]
endscript
script alc_Gaps_OutOfBounds
  if GotParam missed
    alc_Gaps_Respawn reason = "Need more height!!"
  else
    alc_Gaps_Respawn reason = "Out of Bounds!"
  endif
endscript
script Alc_AddGoal_Gaps6
  AddGoal_Gaps6 {
    goal_text = "Total 400 points in 10 tries!"
    view_goals_text = "Bullseye Launch"
    goal_description = alc_Gaps6_Desc
    goal_flags = [
      got_01
      got_02
      got_03
      got_04
      got_05
      got_06
      got_07
      got_08
      got_09
      got_10
    ]
    time = 90
    use_hud_counter
    hud_counter_caption = "Jumps\n0 pts"
    proset_prefix = "ProSet2_"
    pro = "Bam"
    full_name = "Bam Margera"
    unlocked_by_another
    goal_deactivate_script = alc_Gaps6_Deactivate
    unlimited_time
    record_type = score
    custom_score_record = 0
    current_score = 0
  }
endscript
script alc_Gaps6_Deactivate
  create_panel_message id = bullseyescore text = " " Pos = (320, 170) RGBA = [ 118 , 110 , 14 , 128 ]
  GoalManager_EditGoal name = Alc_Goal_Gaps6 params = { current_score = 0 hud_counter_caption = "Jumps\n0 pts" }
endscript
script alc_HitTarget10
  alc_HitTarget score = 10
endscript
script alc_HitTarget20
  alc_HitTarget score = 20
endscript
script alc_HitTarget50
  alc_HitTarget score = 50
endscript
script alc_HitTarget100
  alc_HitTarget score = 100
endscript
script alc_HitTarget score = 10
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps6
    GoalManager_GetGoalParams name = Alc_Goal_Gaps6
     <current_score> = ( <current_score> + <score> )
    GoalManager_EditGoal name = Alc_Goal_Gaps6 params = { current_score = <current_score> }
    if ( <current_score> > <custom_score_record> )
      GoalManager_EditGoal name = Alc_Goal_Gaps6 params = { custom_score_record = <current_score> }
    endif
    FormatText TextName = score_text "You got %a Points!! Total: %s" a = <score> s = <current_score>
    create_panel_message id = bullseyescore text = <score_text> style = goal_collect_text
    FormatText TextName = hud_counter_caption "Jumps\n%i pts" i = <current_score>
    GoalManager_EditGoal name = Alc_Goal_Gaps6 params = { hud_counter_caption = <hud_counter_caption> }
    if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps6 flag = got_01
      GoalManager_SetGoalFlag name = Alc_Goal_Gaps6 got_01 1
      try = 1
    else
      if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps6 flag = got_02
        GoalManager_SetGoalFlag name = Alc_Goal_Gaps6 got_02 1
        try = 2
      else
        if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps6 flag = got_03
          GoalManager_SetGoalFlag name = Alc_Goal_Gaps6 got_03 1
          try = 3
        else
          if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps6 flag = got_04
            GoalManager_SetGoalFlag name = Alc_Goal_Gaps6 got_04 1
            try = 4
          else
            if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps6 flag = got_05
              GoalManager_SetGoalFlag name = Alc_Goal_Gaps6 got_05 1
              try = 5
            else
              if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps6 flag = got_06
                GoalManager_SetGoalFlag name = Alc_Goal_Gaps6 got_06 1
                try = 6
              else
                if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps6 flag = got_07
                  GoalManager_SetGoalFlag name = Alc_Goal_Gaps6 got_07 1
                  try = 7
                else
                  if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps6 flag = got_08
                    GoalManager_SetGoalFlag name = Alc_Goal_Gaps6 got_08 1
                    try = 8
                  else
                    if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps6 flag = got_09
                      GoalManager_SetGoalFlag name = Alc_Goal_Gaps6 got_09 1
                      try = 9
                    else
                      if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps6 flag = got_10
                        try = 10
                      endif
                    endif
                  endif
                endif
              endif
            endif
          endif
        endif
      endif
    endif
    if ( <try> = 10 )
      SK3_KillSkater nodename = TRG_G_Gap6_FailedNode NoMessage
      if ( <current_score> > 399 )
        GoalManager_SetGoalFlag name = Alc_Goal_Gaps6 got_10 1
      else
        GoalManager_LoseGoal name = Alc_Goal_Gaps6
      endif
    else
      if ( <score> = 0 )
        alc_KillSkater2 nodename = TRG_G_Gap6_RestartNode bail <...>
      else
        SK3_KillSkater nodename = TRG_G_Gap6_RestartNode NoMessage
      endif
  endif
    if ( <current_score> > 399 )
      Create_Panel_Block ID = Skip_Goal_reminder Text = "Goal Cleared!\nEnd goal early in the pause menu." Style = panel_message_kongoal
    endif
  else
    FormatText TextName = score_text "You got %a Points!!" a = <score>
    create_panel_message id = bullseyescore text = <score_text> Pos = (320, 170) RGBA = [ 118 , 110 , 14 , 128 ]
    if ( <score> = 0 )
      alc_KillSkater2 nodename = TRG_G_Gap6_RestartNode bail <...>
    else
      SK3_KillSkater nodename = TRG_G_Gap6_RestartNode NoMessage
    endif
  endif
endscript
script Alc_Goal_Gaps6_End_Early // Menu selection to finish Bullseye Launch when you have the required score, will force fail goal if under required score
  IF ObjectExists id = current_menu_anchor
    exit_pause_menu 
  ENDIF
  GoalManager_GetGoalParams name = Alc_Goal_Gaps6
  if ( <current_score> > 399 )
        GoalManager_WinGoal name = Alc_Goal_Gaps6
      else
        GoalManager_LoseGoal name = Alc_Goal_Gaps6
      endif
endscript
script alc_HitTargetWater
  ALC_KillWater
endscript
script Alc_AddGoal_Counter4
  AddGoal_Counter4 {
    goal_text = "Escape from Alcatraz!"
    view_goals_text = "Escape from Alcatraz"
    goal_description = alc_Counter4_Desc
    number = 33
    use_hud_counter
    time = 60
    Geo_Prefix = "TRG_G_COUNTER4_Item"
    pro = "PrisonerOnRoof"
    full_name = "Prisoner"
    unlocked_by_another
    record_type = time
  }
endscript
script alc_Counter4_Item
  Obj_SetException ex = SkaterInRadius scr = alc_Counter4_Got
  Obj_SetInnerRadius 10
  Obj_RotZ speed = random( @50 @-150 @200 @-250  ) FLAG_MAX_COORDS
  Obj_Hover Amp = random( @5 @10 @15  ) Freq = random( @0.5 @1 @2 ) 
endscript
script alc_Counter4_Got
  PlaySound gapsound vol = 100
  GoalManager_GotCounterObject name = alc_Goal_Counter4
  Die
endscript
script Alc_AddGoal_Trickspot
  AddGoal_Trickspot {
    goal_text = "Mullen's Tech Trick"
    key_combo_text = "\t1\n\k1\nManual Across Roof\n\b7+\b4\n\t2\n\k2"
    view_goals_text = "Pull off Mullen's Tech Trick"
    goal_description = alc_Trickspot_Desc
    goal_flags = [
      got_1
      got_2
      got_3
    ]
    pro = "rodney"
    full_name = "Rodney Mullen"
    proset_prefix = "ProSet1_"
    key_combos = [ Air_SquareU Air_SquareL ]
    unlocked_by_another
    record_type = time
  }
endscript
script alc_TinRoofManualStart
  StartGap GapID = TinRoofManual flags = [ CANCEL_GROUND CANCEL_WALL CANCEL_RAIL ] trickscript = alc_goal_trickspot_got_Gap2
endscript
script alc_TinRoofManualEnd
  EndGap GapID = TinRoofManual score = 250 text = "Tin Roof Manual"
endscript
script alc_Trickspot_Impossible
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = TrickspotImpossible flags = [ CANCEL_GROUND CANCEL_MANUAL ] KeyCombo = Air_SquareU trickscript = alc_goal_trickspot_got_Gap0
  endif
endscript
script alc_Trickspot_ManualKickflip
  if TriggerType TRIGGER_LAND_ON
    EndGap GapID = TrickspotImpossible continue = { GapID = TrickspotManual flags = [ CANCEL_GROUND CANCEL_WALL CANCEL_RAIL ] }
  endif
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    EndGap GapID = TrickspotManual continue = { GapID = TrickspotKickflip flags = [ CANCEL_GROUND ] KeyCombo = Air_SquareL trickscript = alc_goal_trickspot_got_Gap1 }
  endif
endscript
script alc_TrickspotEndGaps
  if TriggerType TRIGGER_LAND_ON
    EndGap GapID = TrickspotKickflip
  endif
endscript
script alc_goal_trickspot_got_Gap0
  if GoalManager_GoalExists name = Alc_Goal_Trickspot
    if GoalManager_GoalIsActive name = Alc_Goal_Trickspot
      if GoalManager_SetGoalFlag name = Alc_Goal_Trickspot got_3 1
      endif
    endif
  endif
endscript
script alc_goal_trickspot_got_Gap1
  if GoalManager_GoalExists name = Alc_Goal_Trickspot
    if GoalManager_GoalIsActive name = Alc_Goal_Trickspot
      if GoalManager_SetGoalFlag name = Alc_Goal_Trickspot got_1 1
      endif
    endif
  endif
endscript
script alc_goal_trickspot_got_Gap2
  if GoalManager_GoalExists name = Alc_Goal_Trickspot
    if GoalManager_GoalIsActive name = Alc_Goal_Trickspot
      if GoalManager_SetGoalFlag name = Alc_Goal_Trickspot got_2 1
      endif
    endif
  endif
endscript
script Alc_AddGoal_Tetris
  AddGoal_Tetris {
    goal_text = "Nail the tricks the ghosts call out!"
    view_goals_text = "Nail the tricks they yell out"
    goal_description = alc_Tetris_Desc
    time = 60
    pro = "Guard"
    full_name = "Security Guard"
    unlocked_by_another
    goal_tetris_key_combos = [
      Air_CircleU
      Air_CircleD
      Air_CircleL
      Air_CircleR
      Air_SquareU
      Air_SquareD
      Air_SquareL
      Air_SquareR
      Air_CircleUL
      Air_CircleUR
      Air_CircleDL
      Air_CircleDR
      Air_SquareUL
      Air_SquareUR
      Air_SquareDL
      Air_SquareDR
    ]
    acceleration_interval = 5
    acceleration_percent = 0.05
    goal_start_script = alc_Tetris_Start
    goal_deactivate_script = alc_Tetris_Deactivate
    time_to_stop_adding_tricks = 13
    kill_radius = 300
    record_type = score
  }
endscript
script alc_Tetris_Start
  Kill prefix = "tep_DockPed"
  Create prefix = "tip_Tetris_Ghost"
endscript
script alc_Tetris_Deactivate
  Kill prefix = "tip_Tetris_Ghost"
  Create prefix = "tep_DockPed"
endscript
script alc_Tetris_GhostPed
  begin
    random( @
    Obj_PlayAnim Anim = Ped_M_Cheering
    @Obj_PlayAnim Anim = Ped_M_ThumbUp
    @Obj_PlayAnim Anim = Ped_M_Clap
    @Obj_PlayAnim Anim = Ped_M_Cheer1
    @Obj_PlayAnim Anim = Ped_M_Cheer2
    @Obj_PlayAnim Anim = Ped_M_Cheer3
    @Obj_PlayAnim Anim = Ped_M_Cheer4
    @Obj_PlayAnim Anim = Ped_M_Cheer5
    @Obj_PlayAnim Anim = Ped_M_Cheer6
    @Obj_PlayAnim Anim = Ped_M_Cheer7
     ) 
    Obj_LookAtObject type = skater time = 0.3
    Obj_WaitAnimFinished
  repeat
endscript
script alc_Tetris_OutOfBounds
  if GoalManager_GoalIsActive name = Alc_Goal_Tetris
    create_panel_block id = current_goal text = "Out of Bounds!" style = panel_message_goal
    Wait 2 seconds
    if GoalManager_GoalIsActive name = Alc_Goal_Tetris
      GoalManager_LoseGoal name = Alc_Goal_Tetris
    endif
  endif
endscript
script Alc_AddGoal_SickScore
  AddGoal_SickScore {
    goal_text = alc_sickscore_text
    view_goals_text = alc_sickscore_text
    goal_description = alc_SickScore_Desc
    score = alc_sickscore_score
    pro = "Elissa"
    full_name = "Elissa Steamer"
    pro_goal
    record_type = score
  }
endscript
script Alc_AddGoal_ProCombo
  AddGoal_ProCombo {
    goal_text = "Collect Pro C-O-M-B-O!"
    view_goals_text = "Collect Pro C-O-M-B-O"
    goal_description = alc_ProCombo_Desc
    pro = "Warden"
    full_name = "The Warden"
    pro_goal
    record_type = score
  }
endscript
script Alc_AddGoal_Race
  AddGoal_Race {
    career_only
    goal_text = "Pose for 6 Pictures!"
    view_goals_text = "Pose for 6 Pictures"
    goal_description = alc_Race_Desc
    goal_flags = [
      got_1
      got_2
      got_3
      got_4
      got_5
      got_6
    ]
    use_hud_counter
    key_combos = [ Air_CircleU Lip_TriangleU Air_SquareD Air_SquareR Lip_TriangleD ]
    race_waypoints = [
      { id = TRG_G_RACE_RaceNav01 scr = alc_Race_waypoint_1 flag = got_1 time = 40 }
      { id = TRG_G_RACE_RaceNav02 scr = alc_Race_waypoint_2 flag = got_2 time = 20 }
      { id = TRG_G_RACE_RaceNav03 scr = alc_Race_waypoint_3 flag = got_3 time = 20 }
      { id = TRG_G_RACE_RaceNav04 scr = alc_Race_waypoint_4 flag = got_4 time = 20 }
      { id = TRG_G_Race_RaceNav05 scr = alc_Race_waypoint_5 flag = got_5 time = 20 }
      { id = TRG_G_Race_RaceNav06 scr = alc_Race_waypoint_6 flag = got_6 time = 20 }
    ]
    pro_goal
    pro = "photoguy"
    full_name = "Atiba Jefferson"
    goal_intro_script = alc_Goal_Race_Intro
    goal_deactivate_script = alc_Goal_Race_Deactivate
    record_type = time
  }
endscript
script alc_Goal_Race_Intro
  Wait 1 frame
  Create prefix = "TRG_G_race_RaceNav"
endscript
script alc_Goal_Race_Deactivate
  Kill prefix = "TRG_G_race_RaceNav"
  Kill prefix = "TRG_G_race_RaceArrow"
endscript
script alc_Race_waypoint_1
  GoalManager_ReplaceTrickText name = alc_goal_race text = "\t1 (\k1) over the Crumbled Wall"
  create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
  Kill prefix = "TRG_G_Race_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_Race_RaceArrow01
endscript
script alc_Race_waypoint_2
  GoalManager_ReplaceTrickText name = alc_goal_race text = "\t2 (\k2) Lip Trick on the Red Power Railing"
  create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
  Kill prefix = "TRG_G_race_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_race_RaceArrow02
endscript
script alc_Race_waypoint_3
  GoalManager_ReplaceTrickText name = alc_goal_race text = "\t3 (\k3) over the Eroded Parade Ground Walkway"
  create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
  Kill prefix = "TRG_G_race_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_race_RaceArrow03
endscript
script alc_Race_waypoint_4
  GoalManager_ReplaceTrickText name = alc_goal_race text = "\t4 (\k4) over the Busted Exercise Yard Wall"
  create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
  Kill prefix = "TRG_G_race_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_race_RaceArrow04
endscript
script alc_Race_waypoint_5
  GoalManager_ReplaceTrickText name = alc_goal_race text = "\t5 (\k5) on a Flag Pole"
  create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
  Kill prefix = "TRG_G_race_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_race_RaceArrow05
endscript
script alc_Race_waypoint_6
  GoalManager_ReplaceTrickText name = alc_goal_race text = "Bluntslide (\b4\b4+\b0) on the Watertower/Smokestack Highwire"
  create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
  Kill prefix = "TRG_G_race_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_race_RaceArrow06
endscript
script alc_Race_Enter myGapID = mush gapNum = 1 myFlags = CANCEL_GROUND winScript = alc_TouristPhoto_Got01
  if GoalManager_GoalExists name = alc_goal_race
    if GotParam myTrickText
      StartGap GapID = <myGapID> flags = <myFlags> tricktext = <myTrickText> trickscript = <winScript>
    else
      switch <gapNum>
      case 1
        tag = "\t1"
      case 2
        tag = "\t2"
      case 3
        tag = "\t3"
      case 4
        tag = "\t4"
      case 5
        tag = "\t5"
      case 6
        tag = "\t6"
      endswitch
      GoalManager_ReplaceTrickText name = alc_goal_race text = <tag>
      StartGap GapID = <myGapID> flags = <myFlags> tricktext = <tricktext> trickscript = <winScript>
    endif
  endif
endscript
script alc_Race_Exit myGapID = mush score = 0
  if GotParam text
    EndGap GapID = <myGapID> score = <score> text = <text>
  else
    EndGap GapID = <myGapID>
  endif
endscript
script alc_TouristPhoto_Got01
  if GoalManager_GoalIsActive name = alc_goal_race
    if not GoalManager_GoalFlagSet name = alc_goal_race flag = got_1
      alc_TouristPhoto_GotRaceNav race_flag = got_1
    endif
  endif
endscript
script alc_TouristPhoto_Got02
  if GoalManager_GoalIsActive name = alc_goal_race
    if not GoalManager_GoalFlagSet name = alc_goal_race flag = got_2
      if GoalManager_GoalFlagSet name = alc_goal_race flag = got_1
        alc_TouristPhoto_GotRaceNav race_flag = got_2
      endif
    endif
  endif
endscript
script alc_TouristPhoto_Got03
  if GoalManager_GoalIsActive name = alc_goal_race
    if not GoalManager_GoalFlagSet name = alc_goal_race flag = got_3
      if GoalManager_GoalFlagSet name = alc_goal_race flag = got_2
        alc_TouristPhoto_GotRaceNav race_flag = got_3
      endif
    endif
  endif
endscript
script alc_TouristPhoto_Got04
  if GoalManager_GoalIsActive name = alc_goal_race
    if not GoalManager_GoalFlagSet name = alc_goal_race flag = got_4
      if GoalManager_GoalFlagSet name = alc_goal_race flag = got_3
        alc_TouristPhoto_GotRaceNav race_flag = got_4
      endif
    endif
  endif
endscript
script alc_TouristPhoto_Got05
  if GoalManager_GoalIsActive name = alc_goal_race
    if not GoalManager_GoalFlagSet name = alc_goal_race flag = got_5
      if GoalManager_GoalFlagSet name = alc_goal_race flag = got_4
        alc_TouristPhoto_GotRaceNav race_flag = got_5
      endif
    endif
  endif
endscript
script alc_TouristPhoto_Got06
  if GoalManager_GoalIsActive name = alc_goal_race
    if not GoalManager_GoalFlagSet name = alc_goal_race flag = got_6
      if GoalManager_GoalFlagSet name = alc_goal_race flag = got_5
        alc_TouristPhoto_GotRaceNav race_flag = got_6
      endif
    endif
  endif
endscript
script alc_TouristPhoto_GotRaceNav race_flag = got_1
  GoalManager_SetGoalFlag name = alc_goal_race <race_flag> 1
  GoalManager_NextRaceWaypoint name = alc_goal_race
  PlaySound goaldone
endscript
script Alc_AddGoal_Gaps2
  AddGoal_Gaps2 {
    goal_text = "Manual the Switchbacks!"
    view_goals_text = "Manual the Switchbacks"
    goal_description = alc_Gaps2_Desc
    time = 10
    goal_flags = [ got_1
    ]
    pro = "rodney"
    full_name = "Rodney Mullen"
    pro_goal
    record_type = score
  }
endscript
script alc_ManualSwitchbacksStart
  StartGap GapID = SwitchbacksManual00 flags = [ PURE_MANUAL ]
  Wait 1 gameframe
  EndGap GapID = SwitchbacksManual00 gapscript = alc_goal_gaps2_gotgap00 continue = { GapID = SwitchbacksManual01 flags = [ PURE_MANUAL ] }
endscript
script alc_ManualSwitchbacksCont01
  if not skater:Skitching
    EndGap GapID = SwitchbacksManual01 score = 500 text = "Switchback 1st Leg" gapscript = alc_goal_gaps2_gotgap01 continue = { GapID = SwitchbacksManual02 flags = [ PURE_MANUAL ] }
  endif
endscript
script alc_ManualSwitchbacksCont02
  if not skater:Skitching
    EndGap GapID = SwitchbacksManual02 score = 1000 text = "Switchback 2nd Leg!!" gapscript = alc_goal_gaps2_gotgap02 continue = { GapID = SwitchbacksManual03 flags = [ PURE_MANUAL ] trickscript = alc_goal_gaps2_gotgap03 }
  endif
endscript
script alc_ManualSwitchbacksEnd
  if not skater:Skitching
    EndGap GapID = SwitchbacksManual03 score = 5000 text = "MANUALED THE WHOLE THING!!!" gapscript = alc_goal_gaps2_gotgap02a
  endif
endscript
script alc_goal_gaps2_gotgap00
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps2
    if skater:Skitching
      alc_Goal_Gaps2_Cheating
    else
      create_panel_block id = current_goal text = "Manualling the Switchbacks\nHere we go!" style = panel_message_goal
    endif
  endif
endscript
script alc_goal_gaps2_gotgap01
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps2
    Printf "--- TimeAdd=-5"
    skater:AdjustBalance TimeAdd = -5
    if skater:Skitching
      alc_Goal_Gaps2_Cheating
    else
      create_panel_block id = current_goal text = "Around the first bend!" style = panel_message_goal
    endif
  endif
endscript
script alc_goal_gaps2_gotgap02
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps2
    Printf "--- TimeAdd=-5"
    skater:AdjustBalance TimeAdd = -5
    if skater:Skitching
      alc_Goal_Gaps2_Cheating
    else
      create_panel_block id = current_goal text = "Around the SECOND bend!!!" style = panel_message_goal
    endif
  endif
endscript
script alc_goal_gaps2_gotgap02a
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps2
    if skater:Skitching
      alc_Goal_Gaps2_Cheating
    else
      create_panel_block id = current_goal text = "THAT'S IT!!\nNOW LAND IT!!!" style = panel_message_goal
    endif
  endif
endscript
script alc_goal_gaps2_gotgap03
  if GoalManager_SetGoalFlag name = Alc_Goal_Gaps2 got_1 1
    create_panel_block id = current_goal text = "YOU DID IT!!!!\nHOLY CRAP!!!" style = panel_message_goal
  endif
endscript
script alc_Goal_Gaps2_Cheating
  create_panel_block id = current_goal text = "No Cheating!" style = panel_message_goal
  Wait 2 seconds
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps2
    GoalManager_LoseGoal name = Alc_Goal_Gaps2
  endif
endscript
script Alc_AddGoal_Tetris2
  AddGoal_Tetris2 {
    goal_text = "Mega-Combos (All Tricks in One Combo)!"
    view_goals_text = "Nail the Mega-Combos they yell out"
    goal_description = alc_Tetris2_Desc
    time = 60
    pro = "Guard2"
    full_name = "Security Guard"
    pro_goal
    single_combo
    combo_size = 8
    goal_tetris_key_combos = [
      Air_CircleU
      Air_CircleD
      Air_CircleL
      Air_CircleR
      Air_SquareU
      Air_SquareD
      Air_SquareL
      Air_SquareR
      Air_CircleUL
      Air_CircleUR
      Air_CircleDL
      Air_CircleDR
      Air_SquareUL
      Air_SquareUR
      Air_SquareDL
      Air_SquareDR
    ]
    acceleration_interval = 5
    acceleration_percent = 0.05
    kill_radius = 300
    record_type = time
  }
endscript
script alc_Tetris2_OutOfBounds
  if GoalManager_GoalIsActive name = Alc_Goal_Tetris2
    create_panel_block id = current_goal text = "Out of Bounds!" style = panel_message_goal
    Wait 2 seconds
    if GoalManager_GoalIsActive name = Alc_Goal_Tetris2
      GoalManager_LoseGoal name = Alc_Goal_Tetris2
    endif
  endif
endscript
script Alc_AddGoal_Gaps4
  AddGoal_Gaps4 {
    career_only
    pro_specific_challenge
    unlocked_by_another
    pro_challenge_title = "Shopping Cart Slam"
    pro_challenge_text = "Whether it's on the big screen or in his homebrew CKY movies, Bam's one seriously messed up dude. Fat suits, tree smashing, jumping off buildings, medievel jousting, - it's all in a day's twisted work for Bam."
    pro_challenge_tag_line = "Ready to be a jackass?"
    pro_challenge_pro_name = "Bam"
    goal_text = "Bam's Pro Specific Challenge"
    view_goals_text = "Bam's Pro Specific Challenge"
    pro = "photoguy"
    full_name = "Atiba Jefferson"
    goal_description = alc_Gaps4_Desc
    time = 240
    goal_start_script = alc_CartRaceStart
    goal_deactivate_script = alc_CartRaceDeactivate
    use_hud_counter
    goal_flags = [ got_01
      got_02
      got_03
    ]
    record_type = time
  }
endscript
script alc_CartRaceStart
  Kill prefix = "proset3"
  UnSetFlag flag = FLAG_PROSET3_GEO_ON
  Kill prefix = "proset1"
  UnSetFlag flag = FLAG_PROSET3_GEO_ON
  Kill prefix = "tbp_AlcGuard"
  Kill prefix = "tev_Tram"
  Kill name = TRG_G_CartRace_Controller
  Create name = TRG_G_CartRace_Controller
  Create name = ae_CartRaceLaunch
  Create prefix = "abt_CartRacePlane"
  alc_PointArrow node = TRG_G_CartRace_Nav01
  GoalManager_SetEndRunType name = Alc_Goal_Gaps4 none
  SpawnScript alc_Goal_CartRace_StartSpawn
  SpawnScript id = speeder alc_CartRaceSpeedChecker
endscript
script alc_Goal_CartRace_StartSpawn
  Wait 2 second
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps4
    create_panel_block id = current_goal text = "Race to the Finish!\nDon't bail!!" style = panel_message_goal
  endif
endscript
script alc_CartRaceDeactivate
  Kill prefix = "tev_Tram"
  Create prefix = "tev_Tram"
  Kill name = ae_CartRaceLaunch
  Kill name = TRG_G_CartRace_Controller
  Kill prefix = "ab_CartRaceBarrier"
  Kill prefix = "abc_CartRaceBarrier"
  Kill prefix = "abt_CartRacePlane"
  Kill prefix = "tbp_AlcGuard"
  Create prefix = "tbp_AlcGuard"
  KillSpawnedScript id = speeder
  if ObjectExists id = race_arrow
    DestroyScreenElement id = race_arrow
  endif
  MakeSkaterGoto SkaterInit
endscript
script alc_BamProChallengeRestartNode
  if IsAlive name = TRG_G_CartRace_Controller
    TRG_G_CartRace_Controller:Obj_ClearFlag ALC_FLAG01
    TRG_G_CartRace_Controller:Obj_ClearFlag ALC_FLAG02
    TRG_G_CartRace_Controller:Obj_ClearFlag ALC_FLAG03
  else
  endif
  create_panel_block id = current_goal text = "Race to the Finish!\nDon't bail!!" style = panel_message_goal
  MakeSkaterGoto ShoppingCart_Start params = { racemode = shoppingcart startspeed = 200 }
endscript
script alc_BamProChallengeRestartNodeAlt
  if IsAlive name = TRG_G_CartRace_Controller
    TRG_G_CartRace_Controller:Obj_ClearFlag ALC_FLAG01
    TRG_G_CartRace_Controller:Obj_ClearFlag ALC_FLAG02
    TRG_G_CartRace_Controller:Obj_ClearFlag ALC_FLAG03
  else
  endif
  alc_PointArrow node = TRG_G_CartRace_Nav01
  if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps4 flag = got_01
    create_panel_block id = current_goal text = "Race to the Finish!\nDon't bail!!" style = panel_message_goal
  else
    if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps4 flag = got_02
      create_panel_block id = current_goal text = "Cart Hop each hurdle" style = panel_message_goal
    else
      create_panel_block id = current_goal text = "Navigate the slalom course" style = panel_message_goal
    endif
  endif
  MakeSkaterGoto ShoppingCart_Start params = { racemode = shoppingcart startspeed = 200 }
endscript
script alc_CartRaceSpeedChecker
  begin
    begin
      if not skater:SpeedLessThan 175
        SetFlag flag = ALC_RESETSPEEDOK
        Printf "--- Low-Speed Reset okay..."
        Printf "--- Over 175.."
        break
      endif
      if not GetFlag flag = ALC_RESETSPEEDOK
        SetFlag flag = ALC_RESETSPEEDOK
        break
      endif
      Wait 1 gameframe
    repeat
    Wait 2 seconds
    begin
      if skater:SpeedLessThan 150
        if GetFlag flag = ALC_RESETSPEEDOK
          Printf "--- Under 150, calling Respawn.."
          SpawnScript alc_CartRaceRespawn
        else
          SetFlag flag = ALC_RESETSPEEDOK
          Printf "--- Low-Speed Reset skipped, but now okay..."
        endif
        break
      endif
      Wait 1 gameframe
    repeat
    Wait 1 gameframe
  repeat
  Printf "--- Broken all the way out..."
endscript
script alc_CartRaceController
endscript
script alc_CartRaceRespawn
  if IsAlive name = TRG_G_CartRace_Controller
    if GotParam respawnText
      create_panel_block id = current_goal text = <respawnText> style = panel_message_goal
    endif
    SetFlag flag = ALC_RESTARTOK
    Wait 1 second
    if IsAlive name = TRG_G_CartRace_Controller
      if GetFlag flag = ALC_RESTARTOK
        if GoalManager_GoalIsActive name = Alc_Goal_Gaps4
          pulse_blur start = 255 speed = 5
          Printf "--- Low-Speed Reset NOT okay..."
          skater:KillSkater node = TRG_G_Gap4_RestartNodeAlt
        endif
      else
        UnSetFlag flag = ALC_RESTARTOK
      endif
    endif
  endif
endscript
script alc_CartRaceTurnA01
  alc_PointArrow node = TRG_G_CartRace_Nav02
  if IsAlive name = TRG_G_CartRace_Controller
    TRG_G_CartRace_Controller:Obj_SetFlag ALC_FLAG01
  endif
endscript
script alc_CartRaceTurnA02
  create_panel_block id = current_goal text = "Around the first bend!" style = panel_message_goal
endscript
script alc_CartRaceTurnB01
  if IsAlive name = TRG_G_CartRace_Controller
    if TRG_G_CartRace_Controller:Obj_FlagSet ALC_FLAG01
      alc_PointArrow node = TRG_G_CartRace_Nav03
      TRG_G_CartRace_Controller:Obj_SetFlag ALC_FLAG02
    else
      alc_CartRaceCheater
    endif
  endif
endscript
script alc_CartRaceTurnB02
  if IsAlive name = TRG_G_CartRace_Controller
    if TRG_G_CartRace_Controller:Obj_FlagSet ALC_FLAG02
      create_panel_block id = current_goal text = "Around the second bend!\nGaining speed!" style = panel_message_goal
    else
      alc_CartRaceCheater
    endif
  endif
endscript
script alc_CartRaceTurnC01
  if IsAlive name = TRG_G_CartRace_Controller
    if TRG_G_CartRace_Controller:Obj_FlagSet ALC_FLAG02
      alc_PointArrow node = TRG_G_CartRace_Nav04
      TRG_G_CartRace_Controller:Obj_SetFlag ALC_FLAG03
    else
      alc_CartRaceCheater
    endif
  endif
endscript
script alc_CartRaceTurnC02
  if IsAlive name = TRG_G_CartRace_Controller
    if TRG_G_CartRace_Controller:Obj_FlagSet ALC_FLAG03
      create_panel_block id = current_goal text = "Past the Powerhouse\nHeading down the final stretch!" style = panel_message_goal
    else
      alc_CartRaceCheater
    endif
  endif
endscript
script alc_CartRaceTurnEnd
  if IsAlive name = TRG_G_CartRace_Controller
    if TRG_G_CartRace_Controller:Obj_FlagSet ALC_FLAG03
      if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps4 flag = got_01
        GoalManager_SetGoalFlag name = Alc_Goal_Gaps4 got_01 1
        PlaySound goaldone
        Create prefix = "ab_CartRaceBarrierA"
        Create prefix = "abc_CartRaceBarrierA"
      else
        if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps4 flag = got_02
          GoalManager_SetGoalFlag name = Alc_Goal_Gaps4 got_02 1
          PlaySound goaldone
          Kill prefix = "ab_CartRaceBarrierA"
          Kill prefix = "abc_CartRaceBarrierA"
          Create prefix = "ab_CartRaceBarrierB"
          Create prefix = "abc_CartRaceBarrierB"
        else
          if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps4 flag = got_03
            PlaySound goaldone
            GoalManager_SetGoalFlag name = Alc_Goal_Gaps4 got_03 1
            Kill prefix = "ab_CartRaceBarrierB"
            Kill prefix = "abc_CartRaceBarrierB"
          endif
        endif
      endif
    else
      alc_CartRaceCheater
    endif
  endif
endscript
script alc_CartRaceCheater
  alc_CartRaceRespawn respawnText = "NO CHEATING!!"
endscript
script alc_CartRaceOutOfBounds
  alc_CartRaceRespawn respawnText = "OUT OF BOUNDS!!"
endscript
script alc_PointArrow
  if ObjectExists id = race_arrow
    DestroyScreenElement id = race_arrow
  endif
  if GotParam node
    Create3dArrowPointer {
      id = race_arrow
      node = <node>
      model = "HUD_arrow"
      Pos = (320, 70)
      scale = 0.025
      Tilt = 7
    }
  else
    if GotParam name
      Create3dArrowPointer {
        id = race_arrow
        name = <name>
        model = "HUD_arrow"
        Pos = (320, 70)
        scale = 0.025
        Tilt = 7
      }
    else
    endif
  endif
endscript
script Alc_AddGoal_Trickspot2
  AddGoal_Trickspot2 {
    career_only
    pro_specific_challenge
    pro_challenge_title = "Elissa's Super Gaps"
    pro_challenge_text = "Elissa's goal is simple - skate longer handrails, bigger stairs, and more massive gaps than anyone else. Not content to be known as the best female street skater in the world - she wants to be a great skater, period."
    pro_challenge_tag_line = "Can you hang with the big boys?"
    pro_challenge_pro_name = "Elissa"
    goal_text = "Elissa's Pro Specific Challenge"
    view_goals_text = "Elissa's Pro Specific Challenge"
    goal_description = alc_Trickspot2_Desc
    time = 180
    pro = "PhotoGuy"
    full_name = "Atiba Jefferson"
    proset_prefix = "ProSet5_"
    record_type = time
    goal_start_script = alc_Trickspot2_Start
    goal_deactivate_script = alc_Trickspot2_Deactivate
    required_tricks = [ Trick_Impossible Trick_JudoMadonna Trick_Heelflip Trick_Kickflip ]
    goal_flags = [
      got_01
      got_02
      got_03
      got_04
      got_05
      got_06
      got_07
      got_08
      got_09
    ]
    key_combos = [
      Air_CircleD
      Air_CircleDL
      Air_SquareD
    ]
    start_cam_anim = G_Trickspot2_CameraStart
  }
endscript
script alc_Trickspot2_Start
  UnSetFlag flag = ALC_RESTARTOK
  Kill name = agt_Trickspot2_Boundry02
  Kill name = agt_Trickspot2_Boundry03
  Create name = agt_Trickspot2_Boundry01
  SpawnScript alc_Trickspot2_StartSpawn
endscript
script alc_Trickspot2_StartSpawn
  Wait 2 second
  if GoalManager_GoalIsActive name = Alc_Goal_Trickspot2
    create_panel_block id = current_goal text = "Gap from the Guard's Walk Ramp to the Planks on the Yard Stairs" style = panel_message_goal
  endif
endscript
script alc_Trickspot2_Deactivate
  Kill name = agt_Trickspot2_Boundry01
  Kill name = agt_Trickspot2_Boundry02
  Kill name = agt_Trickspot2_Boundry03
endscript
script alc_Trickspot2_Boundry
  if GoalManager_GoalIsActive name = Alc_Goal_Trickspot2
    create_panel_message text = "Wrong Way!" Pos = (320, 200) RGBA = [ 128 , 0 , 0 , 128 ]
    Kill name = ago_OutLandChecker
    Create name = ago_OutLandChecker
  endif
endscript
script alc_LandChecker
  if GoalManager_GoalIsActive name = Alc_Goal_Trickspot2
    SetFlag flag = ALC_RESTARTOK
    begin
      if not skater:OnGround
        break
      endif
      Wait 1 gameframe
    repeat 60
    begin
      if skater:OnGround
        break
      endif
      Wait 1 gameframe
    repeat
    alc_Trickspot2_Restart
  endif
endscript
script alc_OutLandChecker
  if GoalManager_GoalIsActive name = Alc_Goal_Trickspot2
    SetFlag flag = ALC_RESTARTOK
    begin
      if not skater:OnGround
        break
      endif
      Wait 1 gameframe
    repeat 60
    begin
      if not skater:InAir
        break
      endif
      Wait 1 gameframe
    repeat
    alc_Trickspot2_Restart out
  endif
endscript
script alc_Trickspot2_Restart
  Wait 1 seconds
  if GetFlag flag = ALC_RESTARTOK
    UnSetFlag flag = ALC_RESTARTOK
    if GoalManager_GoalIsActive name = Alc_Goal_Trickspot2
      if not GoalManager_GoalFlagSet name = Alc_Goal_Trickspot2 flag = got_03
        if GotParam out
        else
        endif
        skater:KillSkater node = TRG_G_TS2_RestartNode
      else
        if not GoalManager_GoalFlagSet name = Alc_Goal_Trickspot2 flag = got_06
          skater:KillSkater node = TRG_G_TS2_RestartNode02
        else
          skater:KillSkater node = TRG_G_TS2_RestartNode03
        endif
      endif
      if GotParam out
        if IsAlive name = ago_LandChecker
          Kill name = ago_LandChecker
        endif
      else
        if IsAlive name = ago_OutLandChecker
          Kill name = ago_OutLandChecker
        endif
      endif
    endif
  endif
  Die
endscript
script alc_Trickspot2_StartGapA
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = OverYardWall flags = PURE_AIR
    alc_Trickspot2_Enter myFlag = got_01
    alc_Trickspot2_Enter myFlag = got_02
    alc_Trickspot2_Enter myFlag = got_03
  endif
endscript
script alc_Trickspot2_EndGapA
  EndGap GapID = OverYardWall score = 300 text = "Guards Walk 2 Step Planks"
  alc_Trickspot2_Exit myGapID = trickspot2_A01
  alc_Trickspot2_Exit myGapID = trickspot2_A02
  alc_Trickspot2_Exit myGapID = trickspot2_A03
endscript
script alc_Trickspot2_StartGapB
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = CrumblingStairs flags = PURE_AIR
    alc_Trickspot2_Enter myFlag = got_04
    alc_Trickspot2_Enter myFlag = got_05
    alc_Trickspot2_Enter myFlag = got_06
  endif
endscript
script alc_Trickspot2_EndGapB
  EndGap GapID = CrumblingStairs score = 600 text = "Massive Crumbling Stairset"
  alc_Trickspot2_Exit myGapID = trickspot2_B01 winScript = alc_Trickspot2_GotB01
  alc_Trickspot2_Exit myGapID = trickspot2_B02_1
  alc_Trickspot2_Exit myGapID = trickspot2_B02_2
  alc_Trickspot2_Exit myGapID = trickspot2_B03
endscript
script alc_Trickspot2_StartGapC
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = Lighthouse2Sewer flags = PURE_AIR
    alc_Trickspot2_Enter myFlag = got_07
    alc_Trickspot2_Enter myFlag = got_08
    alc_Trickspot2_Enter myFlag = got_09
  endif
endscript
script alc_Trickspot2_EndGapC
  EndGap GapID = Lighthouse2Sewer score = 1000 text = "Elissa's Switchback 2 Sewer Pipe"
  alc_Trickspot2_Exit myGapID = trickspot2_C01
  alc_Trickspot2_Exit myGapID = trickspot2_C02_1
  alc_Trickspot2_Exit myGapID = trickspot2_C02_2
  alc_Trickspot2_Exit myGapID = trickspot2_C03_1
  alc_Trickspot2_Exit myGapID = trickspot2_C03_2
endscript
script alc_Trickspot2_Enter gapFlags = [ PURE_AIR ]
  switch <myFlag>
  case got_01
    myGapIDA = trickspot2_A01
    winScript = alc_Trickspot2_GotA01
  case got_02
    myTrickText = "Triple Impossible"
    myGapIDA = trickspot2_A02
    prevFlag = got_01
    winScript = alc_Trickspot2_GotA02
  case got_03
    myTrickText = "Judo Madonna"
    myGapIDA = trickspot2_A03
    prevFlag = got_02
    winScript = alc_Trickspot2_GotA03
  case got_04
    prevFlag = got_03
    myGapIDA = trickspot2_B01
    winScript = alc_Trickspot2_GotB01
  case got_05
    tagA = "\t1"
    myGapIDA = trickspot2_B02_1
    myTrickText2 = "Double Heelflip"
    myGapIDB = trickspot2_B02_2
    prevFlag = got_04
    winScript = alc_Trickspot2_GotB02
  case got_06
    myTrickText = "Judo Madonna"
    myGapIDA = trickspot2_B03
    winScript = alc_Trickspot2_GotB03
    prevFlag = got_05
  case got_07
    prevFlag = got_06
    myGapIDA = trickspot2_C01
    winScript = alc_Trickspot2_GotC01
  case got_08
    tagA = "\t2"
    myGapIDA = trickspot2_C02_1
    tagB = "\t3"
    myGapIDB = trickspot2_C02_2
    prevFlag = got_07
    winScript = alc_Trickspot2_GotC02
  case got_09
    myTrickText = "Judo Madonna"
    myGapIDA = trickspot2_C03_1
    myTrickText2 = "Triple Kickflip"
    myGapIDB = trickspot2_C03_2
    prevFlag = got_08
    winScript = alc_Trickspot2_GotC03
  endswitch
  if GoalManager_GoalIsActive name = Alc_Goal_Trickspot2
    shouldStartGap = 1
    if GotParam prevFlag
      if not GoalManager_GoalFlagSet name = Alc_Goal_Trickspot2 flag = <prevFlag>
        shouldStartGap = 0
      endif
    endif
    if GoalManager_GoalFlagSet name = Alc_Goal_Trickspot2 flag = <myFlag>
      shouldStartGap = 0
    endif
    if ( <shouldStartGap> = 1 )
      if ( ( GotParam tagA ) or ( GotParam myTrickText ) )
        if GotParam myTrickText
          StartGap GapID = <myGapIDA> flags = <gapFlags> tricktext = <myTrickText> trickscript = <winScript>
        else
          GoalManager_ReplaceTrickText name = Alc_Goal_Trickspot2 text = <tagA>
          StartGap GapID = <myGapIDA> flags = <gapFlags> tricktext = <tricktext> trickscript = <winScript>
        endif
        if ( ( GotParam tagB ) or ( GotParam myTrickText2 ) )
          UnSetFlag flag = ALC_GOALFLAG01
          if GotParam myTrickText2
            StartGap GapID = <myGapIDB> flags = <gapFlags> tricktext = <myTrickText2> trickscript = <winScript>
          else
            GoalManager_ReplaceTrickText name = Alc_Goal_Trickspot2 text = <tagB>
            StartGap GapID = <myGapIDB> flags = <gapFlags> tricktext = <tricktext> trickscript = <winScript>
          endif
        endif
      else
        StartGap GapID = <myGapIDA> flags = <gapFlags> trickscript = <winScript>
      endif
      Kill name = ago_LandChecker
      Create name = ago_LandChecker
    endif
  endif
endscript
script alc_Trickspot2_Exit myGapID = mush score = 0
  if GotParam winScript
    EndGap GapID = <myGapID> gapscript = <winScript>
  else
    EndGap GapID = <myGapID>
  endif
endscript
script alc_Trickspot2_GotA01
  alc_Trickspot2_CheckSuccess myFlag = got_01
endscript
script alc_Trickspot2_GotA02
  alc_Trickspot2_CheckSuccess myFlag = got_02
endscript
script alc_Trickspot2_GotA03
  alc_Trickspot2_CheckSuccess myFlag = got_03
endscript
script alc_Trickspot2_GotB01
  alc_Trickspot2_CheckSuccess myFlag = got_04
endscript
script alc_Trickspot2_GotB02
  alc_Trickspot2_CheckSuccess myFlag = got_05
endscript
script alc_Trickspot2_GotB03
  alc_Trickspot2_CheckSuccess myFlag = got_06
endscript
script alc_Trickspot2_GotC01
  alc_Trickspot2_CheckSuccess myFlag = got_07
endscript
script alc_Trickspot2_GotC02
  alc_Trickspot2_CheckSuccess myFlag = got_08
endscript
script alc_Trickspot2_GotC03
  alc_Trickspot2_CheckSuccess myFlag = got_09
endscript
script alc_Trickspot2_CheckSuccess
  if GoalManager_GoalIsActive name = Alc_Goal_Trickspot2
    switch <myFlag>
    case got_01
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Impossible ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = nextText "Hey, great!\nNow do that gap again, only do this:\nTriple Impossible\n%a+\b1+\b1" a = <combo_1>
    case got_02
      GetKeyComboArrayFromTrickArray tricks = [ Trick_JudoMadonna ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = nextText "Nice! Now try a\nspecial air trick:\nJudo Madonna\n%a" a = <combo_1>
    case got_03
      nextText = "Now gap down this massive stairset from the lighthouse walkway to the parade grounds."
      boundryBox = agt_Trickspot2_Boundry02
    case got_04
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Heelflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = nextText "Now do this!:\n\t1 (\k1) to\nDouble Heelflip\n%a+\b1" a = <combo_1>
    case got_05
      doubleTrick = 1
      GetKeyComboArrayFromTrickArray tricks = [ Trick_JudoMadonna ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = nextText "Alright, now try your\nspecial air trick again:\nJudo Madonna\n%a" a = <combo_1>
    case got_06
      nextText = "Gap from the switchbacks down to the drainage pipe!"
      boundryBox = agt_Trickspot2_Boundry03
    case got_07
      nextText = "Now do this!:\n\t2 (\k2) to\n\t3 (\k3)"
    case got_08
      doubleTrick = 1
      GetKeyComboArrayFromTrickArray tricks = [ Trick_JudoMadonna Trick_Kickflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
       <combo_2> = ( ( goal_tetris_trick_text.( <keycombos> [ 1 ] ) ) )
      FormatText TextName = nextText "Okay, last one:\nTriple Kickflip\n%b+\b1+\b1\nto a late\nJudo Madonna\n%a" a = <combo_1> b = <combo_2>
    case got_09
      doubleTrick = 1
    endswitch
    if GotParam doubleTrick
      if GetFlag flag = ALC_GOALFLAG01
        GoalManager_SetGoalFlag name = Alc_Goal_Trickspot2 <myFlag> 1
        alc_Trickspot2_CheckSuccess2 <...>
      else
        SetFlag flag = ALC_GOALFLAG01
      endif
    else
      GoalManager_SetGoalFlag name = Alc_Goal_Trickspot2 <myFlag> 1
      alc_Trickspot2_CheckSuccess2 <...>
    endif
  endif
endscript
script alc_Trickspot2_CheckSuccess2
  if GotParam boundryBox
    Kill name = agt_Trickspot2_Boundry01
    Kill name = agt_Trickspot2_Boundry02
    Kill name = agt_Trickspot2_Boundry03
    Create name = <boundryBox>
  endif
  if GotParam nextText
    GoalManager_ReplaceTrickText name = Alc_Goal_Trickspot2 text = <nextText>
    create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
  endif
endscript
script Alc_AddGoal_Gaps5
  AddGoal_Gaps5 {
    career_only
    unlocked_by_another
    pro_specific_challenge
    pro_challenge_title = "Rune's Pool Party"
    pro_challenge_text = "While most skaters avoid  pool skating, Rune seems to thrive on it. Perhaps it's because he honed his skills in the concrete parks of Copenhagen, Denmark. For proof, see the latest Flip video - the rougher the pool, the harder Rune pushes it."
    pro_challenge_tag_line = "Now everyone in the pool..."
    pro_challenge_pro_name = "Rune"
    goal_text = "Rune's Pool Party"
    view_goals_text = "Rune's Pro Specific Challenge"
    pro = "photoguy"
    full_name = "Atiba Jefferson"
    goal_description = alc_Gaps5_Desc
    time = 300
    goal_start_script = alc_Gap5_Start
    goal_deactivate_script = alc_Gap5_Deactivate
    use_hud_counter
    key_combos = [
      Lip_TriangleDL
      Air_CircleL
      Lip_TriangleU
      Air_SquareD
    ]
    required_tricks = [ Trick_HeelFlipHandflip Trick_BackFootNosegrab Trick_OneFootBlunt ]
    goal_flags = [
      got_01
      got_02
      got_03
      got_04
      got_05
      got_06
      got_07
      got_08
    ]
    record_type = time
  }
endscript
script alc_Gap5_Start
  Kill prefix = "tep_DockPed"
  Kill prefix = "tnp_Gap5_GlifGrommet"
  Create prefix = "tnp_Gap5_GlifGrommet"
  Kill name = an_PillPoolWater01
  Kill name = an_PoolValve02
  Kill name = ant_BustValve02
  Kill name = tnp_Gap5_PlankGrommet01
  Kill name = on_PillPoolBar01
  Create name = an_PillPoolBar02
  Create name = ant_gap5_OutOfBounds
  SpawnScript alc_Gap5_StartSpawn
endscript
script alc_Gap5_StartSpawn
  Wait 1 seconds
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
    GetKeyComboArrayFromTrickArray tricks = [ Trick_HeelFlipHandflip ]
     <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
    FormatText TextName = tricks "Spine transfer in the pool while doing your special trick:\nHeelflip Handflip\n%a" a = <combo_1>
    create_panel_block id = current_goal text = <tricks> style = panel_message_goal
  endif
endscript
script alc_Gap5_Deactivate
  Kill prefix = "tnp_Gap5_GlifGrommet"
  Kill name = ant_gap5_OutOfBounds
  Kill name = tnp_Gap5_PlankGrommet01
  Kill name = an_gap5_plank
  Kill name = ant_gap5_OutOfWTBounds
  Kill name = ant_gap5_ReturnToWTBounds
  Kill name = on_gap5_CheckScore
  Kill prefix = "tnr_gap5_GrommetLip"
  Kill name = "tnp_gap5_LipGrommet"
  Kill prefix = "tep_DockPed"
  Create prefix = "tep_DockPed"
endscript
script alc_gap5_OutOfBounds
  SpawnScript alc_gap5_OutOfBounds2 id = RespawnWait
endscript
script alc_gap5_OutOfBoundsWT
  SpawnScript alc_gap5_OutOfBounds2 id = RespawnWait WT
endscript
script alc_gap5_OutOfBounds2
  create_panel_message text = "Out of Bounds!" Pos = (320, 200) RGBA = [ 128 , 0 , 0 , 128 ]
  begin
    if skater:OnGround
      break
    endif
    Wait 1 frame
  repeat 120
  Wait 1 seconds
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
    if GotParam WT
      skater:KillSkater node = TRG_G_Gap5_RestartNodeWT
    else
      skater:KillSkater node = TRG_G_Gap5_RestartNode
    endif
  endif
endscript
script alc_GlifGrommet
  begin
    random( @
    Obj_PlayAnim Anim = Ped_M_Cheering
    @Obj_PlayAnim Anim = Ped_M_ThumbUp
    @Obj_PlayAnim Anim = Ped_M_Clap
    @Obj_PlayAnim Anim = Ped_M_Cheer1
    @Obj_PlayAnim Anim = Ped_M_Cheer2
    @Obj_PlayAnim Anim = Ped_M_Cheer3
    @Obj_PlayAnim Anim = Ped_M_Cheer4
    @Obj_PlayAnim Anim = Ped_M_Cheer5
    @Obj_PlayAnim Anim = Ped_M_Cheer6
    @Obj_PlayAnim Anim = Ped_M_Cheer7
     ) 
    Obj_LookAtObject type = skater time = 0.3
    Obj_WaitAnimFinished
  repeat
endscript
script alc_gap5_spinetransferA
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
    if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_01
      StartGap GapID = gap5_spineTransferA flags = PURE_AIR tricktext = "Heelflip Handflip" trickscript = alc_gaps5_GotTrick01
      EndGap GapID = gap5_spineTransferB
    endif
  endif
  StartGap GapID = poolspine flags = PURE_AIR
endscript
script alc_gap5_spinetransferB
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
    if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_01
      StartGap GapID = gap5_spineTransferB flags = PURE_AIR tricktext = "Heelflip Handflip" trickscript = alc_gaps5_GotTrick01
      EndGap GapID = gap5_spineTransferA
    endif
  endif
  EndGap GapID = poolspine score = 50 text = "Pool Change"
endscript
script alc_gaps5_GotTrick01
  GoalManager_SetGoalFlag name = Alc_Goal_Gaps5 got_01 1
  GoalManager_ReplaceTrickText name = Alc_Goal_Gaps5 text = "Great! Now try a liptrick on the watertower railing and do this:\n\t1(\k1)"
  create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
endscript
script alc_gap5_WTLipTrick
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
    if GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_01
      if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_02
        GoalManager_ReplaceTrickText name = Alc_Goal_Gaps5 text = "\t1"
        PrintStruct <...>
        StartGap GapID = gap5_WTRailLip flags = PURE_LIP tricktext = <tricktext> trickscript = alc_gaps5_GotTrick02
        EndGap GapID = gap5_WTRailLip
      endif
    endif
  endif
  if TriggerType [ TRIGGER_LIP_ON ]
    StartGap GapID = wired flags = PURE_LIP
    EndGap GapID = wired score = 25 text = "Watertower Lip"
  endif
endscript
script alc_gap_WTLipTrickHigh
  if TriggerType [ TRIGGER_LIP_ON ]
    StartGap GapID = wired flags = PURE_LIP
    EndGap GapID = wired score = 50 text = "Watertower Roof Lip"
  endif
endscript
script alc_gaps5_GotTrick02
  GoalManager_SetGoalFlag name = Alc_Goal_Gaps5 got_02 1
  GoalManager_ReplaceTrickText name = Alc_Goal_Gaps5 text = "Sweet. Vert over that plank those kids are pushing out over the pool with this:\n\t2(\k2)"
  create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
  Create name = tnp_Gap5_PlankGrommet01
  Create name = an_gap5_plank
endscript
script alc_gap5_plankA
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
    GoalManager_ReplaceTrickText name = Alc_Goal_Gaps5 text = "\t2"
    StartGap GapID = gap5_plankA flags = PURE_AIR tricktext = <tricktext> trickscript = alc_gaps5_GotTrick03
    alc_gap5_plankEnd GapID = gap5_plankB
  endif
endscript
script alc_gap5_plankB
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
    GoalManager_ReplaceTrickText name = Alc_Goal_Gaps5 text = "\t2"
    StartGap GapID = gap5_plankB flags = PURE_AIR tricktext = <tricktext> trickscript = alc_gaps5_GotTrick03
    EndGap GapID = alc_gap5_plankEnd
  endif
endscript
script alc_gap5_plankEnd
  EndGap GapID = <GapID> score = 200 text = "Rune's Plank Gap"
endscript
script alc_gaps5_GotTrick03
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
    if GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_02
      if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_03
        GoalManager_SetGoalFlag name = Alc_Goal_Gaps5 got_03 1
        GoalManager_ReplaceTrickText name = Alc_Goal_Gaps5 text = "That's some serious height! Can you liptrick on the cellblock rooftop?:\n\t3(\k3)"
        create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
      endif
    endif
  endif
endscript
script alc_gap5_RoofLipTrick
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
    if GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_03
      if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_04
        GoalManager_ReplaceTrickText name = Alc_Goal_Gaps5 text = "\t3"
        StartGap GapID = gap5_RoofLip flags = PURE_LIP tricktext = <tricktext> trickscript = alc_gaps5_GotTrick04
        EndGap GapID = gap5_RoofLip
      endif
    endif
  endif
  if TriggerType [ TRIGGER_LIP_ON ]
    StartGap GapID = wired flags = PURE_LIP
    EndGap GapID = wired score = 50 text = "How'd you get up THERE?"
  endif
endscript
script alc_gaps5_GotTrick04
  GoalManager_SetGoalFlag name = Alc_Goal_Gaps5 got_04 1
  GoalManager_ReplaceTrickText name = Alc_Goal_Gaps5 text = "There's a bowl in this watertower! Spine from the pools into the watertower OVER the wooden planks around the top!"
  create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
endscript
script alc_gap5_IntoWaterTowerStart
  StartGap GapID = gap5_IntoWaterTowerA flags = PURE_AIR
endscript
script alc_gap5_IntoWaterTowerCont
  EndGap GapID = gap5_IntoWaterTowerA continue continue = { GapID = gap5_IntoWaterTowerB flags = PURE_AIR }
endscript
script alc_gap5_IntoWaterTowerEnd
  EndGap GapID = gap5_IntoWaterTowerB gapscript = alc_gaps5_GotTrick05 score = 100 text = "Super-high Watertower Spine"
endscript
script alc_gaps5_GotTrick05
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
    if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_05
      if GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_04
        GoalManager_SetGoalFlag name = Alc_Goal_Gaps5 got_05 1
        GoalManager_ReplaceTrickText name = Alc_Goal_Gaps5 text = "Now try a 50,000 point combo inside the watertower!"
        create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
        Create name = ant_gap5_OutOfWTBounds
        Create name = on_gap5_CheckScore
      endif
    endif
  endif
endscript
script alc_gap5_CheckScore
  Obj_ClearExceptions
  begin
    if SkaterCurrentScorePotGreaterThan 50000
      break
    endif
    Wait 1 gameframe
  repeat
  Obj_SetException ex = SkaterBailed scr = alc_gap5_CheckScore
  Obj_SetException ex = SkaterLanded scr = alc_gaps5_GotTrick06
endscript
script alc_gap5_OutOfWTBounds
  SetScoreAccumulation 0 freeze_score
  create_panel_message text = "Out of Bounds!" Pos = (320, 200) RGBA = [ 128 , 0 , 0 , 128 ]
  Create name = ant_gap5_ReturnToWTBounds
endscript
script alc_gap5_ReturnToWTBounds
  SetScoreAccumulation 1
  Kill name = ant_gap5_ReturnToWTBounds
endscript
script alc_gaps5_GotTrick06
  Kill name = ant_gap5_OutOfWTBounds
  GoalManager_SetGoalFlag name = Alc_Goal_Gaps5 got_06 1
  GetKeyComboArrayFromTrickArray tricks = [ Trick_BackFootNosegrab ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
  FormatText TextName = tricks "Now tranfer from the watertower to the pools with a special trick!:\nBackfoot Flip Nosegrab\n%a" a = <combo_1>
  create_panel_block id = current_goal text = <tricks> style = panel_message_goal
  Die
endscript
script alc_gap5_OutOfWTSpecialStart
  if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
    if GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_06
      if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_07
        StartGap GapID = gap5_OutOfWTSpecial flags = PURE_AIR tricktext = "Backfoot Flip Nosegrab" trickscript = alc_gaps5_GotTrick07
      endif
    endif
  endif
endscript
script alc_gap5_OutOfWTSpecialEnd
  EndGap GapID = gap5_OutOfWTSpecial
endscript
script alc_gaps5_GotTrick07
  GoalManager_SetGoalFlag name = Alc_Goal_Gaps5 got_07 1
  GetKeyComboArrayFromTrickArray tricks = [ Trick_OneFootBlunt ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
  FormatText TextName = tricks "Okay, big finale! Do a special lip trick on that grommet on top of the watertower:\nOne Foot Blunt\n%a" a = <combo_1>
  create_panel_block id = current_goal text = <tricks> style = panel_message_goal
  Create prefix = "tnr_gap5_GrommetLip"
  Create name = "tnp_gap5_LipGrommet"
  Kill name = an_WTBeamA01
  Kill prefix = "an_WTRoof1A"
  Kill prefix = "an_WTRoof4A"
  Create name = an_WTBeamB01
  Create prefix = "an_WTRoof1B"
  Create prefix = "an_WTRoof4B"
endscript
script alc_gap5_GrommetLipTrick
  if TriggerType [ TRIGGER_LIP_ON ]
    if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
      if GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_07
        if not GoalManager_GoalFlagSet name = Alc_Goal_Gaps5 flag = got_08
          GoalManager_ReplaceTrickText name = Alc_Goal_Gaps5 text = "One Foot Blunt"
          PrintStruct <...>
          StartGap GapID = gap5_GrommetLip flags = PURE_LIP tricktext = "One Foot Blunt" trickscript = alc_gaps5_GotTrick08
        endif
      endif
    endif
  endif
  if TriggerType [ TRIGGER_LIP_OFF TRIGGER_LIP_JUMP ]
    EndGap GapID = gap5_GrommetLip score = 200 text = "Rune's Grommet Gap"
  endif
endscript
script alc_gap5_LipGrommet
  Obj_PlayAnim Anim = Stand2Hands from = 83 to = 84
endscript
script alc_gaps5_GotTrick08
  Kill prefix = "tnr_gap5_GrommetLip"
  Kill name = "tnp_gap5_LipGrommet"
  GoalManager_SetGoalFlag name = Alc_Goal_Gaps5 got_08 1
endscript
script ALC_MoveBar
  Obj_PathHeading off
  Obj_SetPathTurnDist 2 feet
  Obj_SetPathAcceleration 0.25
  Obj_SetPathDeceleration 0.25
  Obj_FollowPathLinked
  begin
    Obj_SetPathVelocity randomrange(1, 2)
    Obj_RotZ speed = randomrange(20, 30) deceleration = 30 FLAG_MAX_COORDS
    Wait randomrange(3, 10) seconds
    Obj_SetPathVelocity randomrange(3, 4)
    Obj_RotZ speed = randomrange(100, 120) acceleration = 30 FLAG_MAX_COORDS
    Wait randomrange(3, 10) seconds
  repeat
endscript
script alc_BarRipple
  Obj_LockToObject ObjectName = on_PillPoolBar01 (0, 0, 0)
endscript
script alc_Tram
  Car_Generic01 PathNum = "tew_Tram" DefaultSpeed = 20 carloopSFX = TramEngineLoop Bus
  Obj_StickToGround on distAbove = 6 distBelow = 6
  Obj_AllowSkitching off
endscript
script alc_TramDriver
  Obj_LockToObject ObjectName = <myTram> (12, 0, 50)
  begin
    begin
      random( @
      Obj_CycleAnim Anim = Ped_Ranger_DriveEasy1
      @Obj_CycleAnim Anim = Ped_Ranger_DriveEasy2
       ) 
      if <myTram>:Obj_FlagSet FLAG_CAR_SOUND_FRANTICSTOP
        break
      endif
    repeat
    begin
      random( @
      Obj_CycleAnim Anim = Ped_Ranger_DriveManic3
      @Obj_CycleAnim Anim = Ped_Ranger_DriveManic4
      @Obj_CycleAnim Anim = Ped_Ranger_DriveManic5
      @Obj_CycleAnim Anim = Ped_Ranger_DriveManic6
       ) 
      if not <myTram>:Obj_FlagSet FLAG_CAR_SOUND_FRANTICSTOP
        Obj_CycleAnim Anim = Ped_Ranger_DriveEasyFromDriveManic
        break
      endif
    repeat
  repeat
endscript
script alc_TramDriverManic
  Obj_LockToObject ObjectName = <myTram> (13, 0, 22)
  begin
    random( @
    Obj_CycleAnim Anim = Ped_Ranger_DriveManic3
    @Obj_CycleAnim Anim = Ped_Ranger_DriveManic4
    @Obj_CycleAnim Anim = Ped_Ranger_DriveManic5
    @Obj_CycleAnim Anim = Ped_Ranger_DriveManic6
     ) 
  repeat
endscript
script alc_TramTrailer
  Obj_FollowLeader name = <leader> Distance = 90 OrientY
endscript
script Alc_Sign
endscript
script alc_SeaCaptain
  begin
    random( @
    Obj_PlayAnim Anim = Ped_M_Idle1
    @Obj_PlayAnim Anim = Ped_M_Idle1
    @Obj_PlayAnim Anim = Ped_M_Idle1
    @Obj_PlayAnim Anim = Ped_M_ThumbUp
     ) 
    Obj_LookAtObject type = skater time = 0.3
    Obj_WaitAnimFinished
  repeat
endscript
script ALC_BustBarracksQP
  PlaySound SmashWoodQP
  Create name = aev_BustableGrottoVert
  ShatterAndDie name = <me> area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
endscript
script ALC_BustColumn
  random( @
  PlaySound columncrumble range = randomrange(90, 150) volume = 50
  @PlaySound columncrumble range = randomrange(90, 150) volume = 50
   ) 
  ShatterAndDie name = <me> area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
endscript
script ALC_BulbBurst
  Kill links
  ALC_BreakGlass me = <me> range = randomrange(120, 170) volume = 50
endscript
script ALC_BreakPoolValvePlane
  PlaySound bustvalve
  PlayStream emptypool
  Kill name = an_PillPoolWater01
  Kill name = an_PoolValve02
  Kill name = on_PillPoolBar01
  Create name = an_PillPoolBar02
  Create name = on_PillPoolWater
  Kill name = <me>
endscript
script ALC_BustWTDoor
  PlaySound smashwall
  Kill prefix = <old>
  Create prefix = <new>
  ShatterAndDie name = <bust> area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
endscript
script ALC_BustWTRoof
  PlaySound breakshingles2 pitch = randomrange(90, 150)
  Kill prefix = <old>
  Kill name = an_WTBeamA01
  Create prefix = <new>
  Create name = an_WTBeamB01
  ShatterAndDie name = <bust> area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
endscript
script ALC_SmashWindow
  switch <windowA>
  case "ai_LowerWindow1A"
    ShatterAndDie name = ai_LowerWindow1A_01 area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
    ShatterAndDie name = ai_LowerWindow1A_02 area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
  case "ai_LowerWindow2A"
    ShatterAndDie name = ai_LowerWindow2A_01 area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
    ShatterAndDie name = ai_LowerWindow2A_02 area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
  case "ai_UpperWindow1A"
    ShatterAndDie name = ai_UpperWindow1A_01 area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
    ShatterAndDie name = ai_UpperWindow1A_02 area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
  case "ai_UpperWindow2A"
    ShatterAndDie name = ai_UpperWindow2A_01 area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
    ShatterAndDie name = ai_UpperWindow2A_02 area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
  endswitch
  PlaySound SmashWoodQP
  Create prefix = <windowB>
  Kill name = <me>
endscript
script ALC_BreakGlass
  if GotParam range
    pitch = <range>
  else
    pitch = randomrange(90, 120)
  endif
  if GotParam volume
    vol = <volume>
  else
    vol = 100
  endif
  if GotParam sound
    PlaySound <sound> <...>
  else
    random( @ ) 
    PlaySound HitGlassPane2x pitch = randomrange(80, 100) <...>
    
  endif
  ShatterAndDie name = <me> area = 1000 variance = 4 vel_x = 30 vel_y = 30 vel_z = 30 spread = 1
endscript
script ALC_BreakGlassRustyRoof
  ALC_BreakGlass me = <me>
  Create prefix = "tpr_RustyRoofWindowA"
endscript
script ALC_BreakSkylight
  ALC_BreakGlass me = <me>
endscript
script ALC_KillWater
  ALC_KillSkater Water <...>
endscript
script ALC_KillSkater
  if GotParam Water
    PlaySound bigsplash pitch = randomrange(80, 200) vol = 50
  endif
  if GoalManager_GoalIsActive name = alc_goal_gaps
    DistanceMinigameEnd
    Kill name = TRG_G_Gaps_Tram02
    Printf "------------- KillSkater called, Creating Tram02..."
    Create name = TRG_G_Gaps_Tram02
    UnSetFlag flag = ALC_RESTARTOK
    alc_KillSkater2 bail <...> nodename = TRG_G_GAP_RestartNode
  else
    if GoalManager_GoalIsActive name = Alc_Goal_Gaps4
      UnSetFlag flag = ALC_RESTARTOK
      Printf "--- KillWater Restarting Skater"
      Printf "--- Low-Speed Reset NOT okay..."
      alc_KillSkater2 bail <...> nodename = TRG_G_Gap4_RestartNodeAlt
    else
      if GoalManager_GoalIsActive name = alc_goal_gaps3
        if GotParam gaps3Teleport
          alc_KillSkater2 bail nodename = TRG_G_Gap3_RestartNode <...>
        else
          alc_KillSkater2 bail <...>
        endif
      else
        if GoalManager_GoalIsActive name = Alc_Goal_Trickspot2
          UnSetFlag flag = ALC_RESTARTOK
          Kill name = ago_LandChecker
          Kill name = ago_OutLandChecker
          if not GoalManager_GoalFlagSet name = Alc_Goal_Trickspot2 flag = got_03
            Printf "--- Water Respawn to TRG_G_TS2_RestartNode"
            alc_KillSkater2 bail nodename = TRG_G_TS2_RestartNode <...>
          else
            if not GoalManager_GoalFlagSet name = Alc_Goal_Trickspot2 flag = got_06
              alc_KillSkater2 bail nodename = TRG_G_TS2_RestartNode02 <...>
            else
              alc_KillSkater2 bail nodename = TRG_G_TS2_RestartNode03 <...>
            endif
          endif
        else
          if GoalManager_GoalIsActive name = Alc_Goal_Gaps5
            alc_KillSkater2 bail nodename = TRG_G_Gap5_RestartNode <...>
            KillSpawnedScript id = RespawnWait
          else
            if GoalManager_GoalIsActive name = Alc_Goal_Gaps6
              alc_HitTarget score = 0 <...>
            else
              alc_KillSkater2 bail <...>
            endif
          endif
        endif
      endif
    endif
  endif
endscript
script alc_KillSkater2
  if GotParam Water
    Printf "--- Killing via water..."
    SK3_KillSkater_Water <...>
  else
    Printf "--- Killing via land..."
    SK3_KillSkater <...>
  endif
endscript
script alc_LongFall
  if not GoalManager_GoalIsActive name = Alc_Goal_Gaps6
    if not GoalManager_GoalIsActive name = alc_goal_gaps
      MakeSkaterGoto FlailingFall
    else
      skater:OverrideLimits max = 10000 friction = 0 time = 1000
    endif
  endif
endscript
script ALC_Televator { text = "You forgot text=<place>!" }
  Kill prefix = "ag_TeleporterSign"
  Create prefix = "ag_TeleporterSign"
  if GoalManager_GoalExists name = Alc_Goal_Race3
    if not GoalManager_GoalIsActive name = Alc_Goal_Race3
      Kill prefix = "TRG_G_Race3_Distraction"
      Create prefix = "TRG_G_Race3_Distraction"
    endif
  else
    Kill prefix = "TRG_G_Race3_Distraction"
    Create prefix = "TRG_G_Race3_Distraction"
  endif
  if not GotParam cut
    if not InSplitScreenGame
      create_panel_message id = leaving_message text = <text> Pos = (320, 300) RGBA = [ 118 , 110 , 14 , 128 ]
      pulse_blur start = 255 speed = 5
    endif
  else
    alc_Gap_DownHatchEnd
  endif
  if GotParam sound
    PlaySound <sound>
  endif
  if GotParam node
    Sk3_TeleportToNode nodename = <node>
  else
    create_panel_message id = death_message text = "You forgot node=<nodename>!!" Pos = (320, 200)
  endif
endscript
script alc_OceanSounds
  GetNodeName
  switch <nodename>
  case tes_OceanWaves01
    Wait 15 seconds
  case tes_OceanWaves02
    Wait 30 seconds
  case tes_OceanWaves03
    Wait 45 seconds
  endswitch
  begin
    Printf "----- %n: playing ocean sound" n = <nodename>
    Obj_PlayStream dockside vol = 70 dropoff = 600
    Wait 57 seconds
  repeat
endscript
script alc_RoofHide
endscript
script alc_RoofShow
endscript
script alc_CellInteriorHide
endscript
script alc_CellInteriorShow
endscript
script alc_CompHide
endscript
script alc_CompShow
endscript
script alc_LightRayShow
  Create prefix = "ai_LightRay"
endscript
script alc_LightRayHide
  Kill prefix = "ai_LightRay"
endscript
script alc_DockRestart
  alc_RoofHide
  alc_CellInteriorHide
  alc_CompHide
  alc_LightRayShow
endscript
script alc_YardRestart
  alc_RoofHide
  alc_CellInteriorHide
  alc_CompShow
  alc_LightRayShow
endscript
script alc_PowerhouseRestart
  alc_RoofHide
  alc_CellInteriorHide
  alc_CompHide
  alc_LightRayShow
endscript
script alc_CompRestart
  MakeSkaterGoto DropIn
  if GoalManager_GoalExists name = alc_goal_comp
    goal_comp_enter_area goal_id = alc_goal_comp
  endif
  alc_RoofHide
  alc_CellInteriorShow
  alc_CompShow
  alc_LightRayShow
endscript
script alc_RoofJump
  alc_RoofShow
  alc_CellInteriorShow
  alc_CompShow
  alc_LightRayHide
endscript
script alc_NorthSwitchbackJump
  alc_RoofHide
  alc_CellInteriorHide
  alc_CompShow
  alc_LightRayShow
endscript
script alc_SouthSwitchbackJump
  alc_RoofHide
  alc_CellInteriorHide
  alc_CompShow
  alc_LightRayShow
endscript
script alc_LighthouseJump
  alc_RoofHide
  alc_CellInteriorShow
  alc_CompShow
  alc_LightRayShow
endscript
script alc_LighthouseLookoutJump
  alc_RoofShow
  alc_CellInteriorShow
  alc_CompShow
  alc_LightRayHide
endscript
script alc_SetLipFlag
  SetFlag flag = ALC_GAPS3_GOTLIPREVERT
endscript
script alc_Gap_FerryPier
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = <GapID> flags = PURE_AIR
  endif
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    switch <GapID>
    case gap01
      alc_Gap_FerryPierEnd GapID = gap02
    case gap02
      alc_Gap_FerryPierEnd GapID = gap01
    endswitch
  endif
endscript
script alc_Gap_FerryPierEnd
  EndGap GapID = <GapID> score = 50 text = "Ferry Transfer"
endscript
script alc_Gap_GutterStart
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = gut flags = PURE_AIR
  endif
endscript
script alc_Gap_GutterEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = gut score = 50 text = "Gutter Punk"
  endif
endscript
script alc_Gap_NewStory
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = gut flags = PURE_AIR
  endif
endscript
script alc_Gap_NewStoryEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = gut score = 50 text = "Rising from the Gutter"
  endif
endscript
script alc_Gap_SwampGap
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = swamp flags = PURE_AIR
  endif
endscript
script alc_Gap_SwampGapEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = swamp score = 50 text = "Swamp Gap"
  endif
endscript
script alc_Gap_BombDrop2BustedStack
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = bombdrop flags = PURE_AIR
  endif
endscript
script alc_Gap_BombDrop2BustedStackEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = bombdrop score = 100 text = "Bomb Drop Professional"
  endif
endscript
script alc_Gap_Wired
  if TriggerType [ TRIGGER_LAND_ON ]
    StartGap GapID = wired flags = PURE_RAIL
    EndGap GapID = wired score = 25 text = "Wired"
  endif
endscript
script alc_Gap_BathroomBreak
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = <GapID> flags = PURE_AIR
  endif
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    switch <GapID>
    case gap01
      alc_Gap_BathroomBreakEnd GapID = gap02
    case gap02
      alc_Gap_BathroomBreakEnd GapID = gap01
    endswitch
  endif
endscript
script alc_Gap_BathroomBreakEnd
  EndGap GapID = <GapID> score = 50 text = "Bathroom Break"
endscript
script alc_Gap_FerryPrincessStart
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = ferryprincess flags = PURE_AIR
  endif
endscript
script alc_Gap_FerryPrincessEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = ferryprincess score = 50 text = "Ferry Princess"
  endif
endscript
script alc_Gap_Attic
  StartGap GapID = attic flags = CANCEL_GROUND
endscript
script alc_Gap_AtticEnd
  EndGap GapID = attic score = 50 text = "Skate Attic"
endscript
script alc_Gap_UpToLip
  if TriggerType [ TRIGGER_LIP_ON ]
    StartGap GapID = wired flags = PURE_LIP
    EndGap GapID = wired score = 25 text = "Lip Extension"
  endif
endscript
script alc_Gap_Ledge
  alc_Gap_Ledge2Ledge <...>
  alc_Gap_Rail2LedgeEnd
  alc_Gap_Ledge2RailStart
  alc_Gap_Ledge2Pipe
  alc_Gap_Pipe2LedgeEnd
endscript
script alc_Gap_Rail
  alc_Gap_Rail2Rail <...>
  alc_Gap_Ledge2RailEnd
  alc_Gap_Rail2LedgeStart
  alc_Gap_Roof2RailEnd
endscript
script alc_Gap_PipeMadness
  alc_Gap_Ledge2PipeEnd
  alc_Gap_Pipe2Ledge
  alc_Gap_PipeMadnessAlt <...>
endscript
script alc_Gap_Roof2RailStart
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = roof2rail flags = PURE_AIR
  endif
endscript
script alc_Gap_Roof2RailEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = roof2rail score = 50 text = "Roof-2-Rail"
  endif
endscript
script alc_Gap_Ledge2RailStart
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = Ledge2rail flags = PURE_AIR
  endif
endscript
script alc_Gap_Ledge2RailEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = Ledge2rail score = 50 text = "Ledge-2-Rail"
  endif
endscript
script alc_Gap_Rail2LedgeStart
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = rail2Ledge flags = PURE_AIR
  endif
endscript
script alc_Gap_Rail2LedgeEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = rail2Ledge score = 50 text = "Rail-2-Ledge"
  endif
endscript
script alc_Gap_Rooftopper
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = <GapID> flags = PURE_AIR
  endif
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    switch <GapID>
    case gap01
      alc_Gap_RooftopperEnd GapID = gap02
    case gap02
      alc_Gap_RooftopperEnd GapID = gap01
    endswitch
  endif
endscript
script alc_Gap_RooftopperEnd
  EndGap GapID = <GapID> score = 50 text = "Rooftop Hero"
endscript
script alc_Gap_LedgePop
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = <GapID> flags = PURE_AIR
  endif
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    switch <GapID>
    case gap01
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap02
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap03
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap04
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap05
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap06
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap07
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap08
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap09
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap10
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap11
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap12
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap14
    case gap13
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap01
      alc_Gap_LedgePopEnd GapID = gap14
    case gap14
      alc_Gap_LedgePopEnd GapID = gap02
      alc_Gap_LedgePopEnd GapID = gap03
      alc_Gap_LedgePopEnd GapID = gap04
      alc_Gap_LedgePopEnd GapID = gap05
      alc_Gap_LedgePopEnd GapID = gap06
      alc_Gap_LedgePopEnd GapID = gap07
      alc_Gap_LedgePopEnd GapID = gap08
      alc_Gap_LedgePopEnd GapID = gap09
      alc_Gap_LedgePopEnd GapID = gap10
      alc_Gap_LedgePopEnd GapID = gap11
      alc_Gap_LedgePopEnd GapID = gap12
      alc_Gap_LedgePopEnd GapID = gap13
      alc_Gap_LedgePopEnd GapID = gap01
    endswitch
  endif
endscript
script alc_Gap_LedgePopEnd
  EndGap GapID = <GapID> score = 50 text = "Switchback Shuffle"
endscript
script alc_Gap_OverTunnel
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = <GapID> flags = PURE_AIR
  endif
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    switch <GapID>
    case gap01
      alc_Gap_OverTunnelEnd GapID = gap02
    case gap02
      alc_Gap_OverTunnelEnd GapID = gap01
    endswitch
  endif
endscript
script alc_Gap_OverTunnelEnd
  EndGap GapID = <GapID> score = 50 text = "Tunnel Clearance"
endscript
script alc_Gap_Rail2Rail
  if GotParam GapID
    if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
      StartGap GapID = <GapID> flags = PURE_AIR
    endif
    if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
      switch <GapID>
      case gap01
        alc_Gap_Rail2RailEnd GapID = gap02
        alc_Gap_Rail2RailEnd GapID = gap03
      case gap02
        alc_Gap_Rail2RailEnd GapID = gap01
        alc_Gap_Rail2RailEnd GapID = gap03
      case gap03
        alc_Gap_Rail2RailEnd GapID = gap01
        alc_Gap_Rail2RailEnd GapID = gap02
      endswitch
    endif
  endif
endscript
script alc_Gap_Rail2RailEnd
  EndGap GapID = <GapID> score = 50 text = "Rail-2-Rail"
endscript
script alc_Gap_Ledge2Ledge
  if GotParam GapID
    if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
      switch <GapID>
      case gap01
        GapID = Ledge01
      case gap02
        GapID = ledge02
      case gap03
        GapID = ledge03
      case gap04
        GapID = ledge04
      endswitch
      StartGap GapID = <GapID> flags = PURE_AIR
    endif
    if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
      switch <GapID>
      case gap01
        alc_Gap_Ledge2LedgeEnd GapID = ledge02
        alc_Gap_Ledge2LedgeEnd GapID = ledge03
        alc_Gap_Ledge2LedgeEnd GapID = ledge04
      case gap02
        alc_Gap_Ledge2LedgeEnd GapID = Ledge01
        alc_Gap_Ledge2LedgeEnd GapID = ledge03
        alc_Gap_Ledge2LedgeEnd GapID = ledge04
      case gap03
        alc_Gap_Ledge2LedgeEnd GapID = Ledge01
        alc_Gap_Ledge2LedgeEnd GapID = ledge02
        alc_Gap_Ledge2LedgeEnd GapID = ledge04
      case gap04
        alc_Gap_Ledge2LedgeEnd GapID = Ledge01
        alc_Gap_Ledge2LedgeEnd GapID = ledge02
        alc_Gap_Ledge2LedgeEnd GapID = ledge03
      endswitch
    endif
  endif
endscript
script alc_Gap_Ledge2LedgeEnd
  EndGap GapID = <GapID> score = 50 text = "Ledge-2-Ledge"
endscript
script alc_Gap_BrokenWalk
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = <GapID> flags = PURE_AIR
  endif
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    switch <GapID>
    case walk01
      alc_Gap_BrokenWalkEnd GapID = walk02
    case walk02
      alc_Gap_BrokenWalkEnd GapID = walk01
    endswitch
  endif
endscript
script alc_Gap_BrokenWalkEnd
  EndGap GapID = <GapID> score = 50 text = "Broken Walk"
endscript
script alc_Gap_CellblockVert
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = <GapID> flags = PURE_AIR
  endif
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    switch <GapID>
    case cellvert01
      alc_Gap_CellblockVertEnd GapID = cellvert02
    case cellvert02
      alc_Gap_CellblockVertEnd GapID = cellvert01
    endswitch
  endif
endscript
script alc_Gap_CellblockVertEnd
  EndGap GapID = <GapID> score = 50 text = "Cellblock Transfer"
endscript
script alc_Gap_FlagPole
  if TriggerType TRIGGER_LIP_ON
    alc_Race_Enter myGapID = salute01 myFlags = PURE_LIP gapNum = 5 winScript = alc_TouristPhoto_Got05
    alc_Race_Exit myGapID = salute01 score = 50 text = "Salute!"
  endif
endscript
script alc_Gap_Pipe2Pipe
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = <GapID> flags = PURE_AIR
  endif
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    switch <GapID>
    case pipe01
      alc_Gap_Pipe2PipeEnd GapID = pipe02
      alc_Gap_Pipe2PipeEnd GapID = pipe03
    case pipe02
      alc_Gap_Pipe2PipeEnd GapID = pipe01
      alc_Gap_Pipe2PipeEnd GapID = pipe03
    case pipe03
      alc_Gap_Pipe2PipeEnd GapID = pipe01
      alc_Gap_Pipe2PipeEnd GapID = pipe02
    endswitch
  endif
endscript
script alc_Gap_Pipe2PipeEnd
  EndGap GapID = <GapID> score = 50 text = "Pipe-2-Pipe"
endscript
script alc_Gap_Skylight2Skylight
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = <GapID> flags = PURE_AIR
  endif
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    switch <GapID>
    case sky01
      alc_Gap_Skylight2SkylightEnd GapID = sky02
      alc_Gap_Skylight2SkylightEnd GapID = sky03
      alc_Gap_Skylight2SkylightEnd GapID = sky04
    case sky02
      alc_Gap_Skylight2SkylightEnd GapID = sky01
      alc_Gap_Skylight2SkylightEnd GapID = sky03
      alc_Gap_Skylight2SkylightEnd GapID = sky04
    case sky03
      alc_Gap_Skylight2SkylightEnd GapID = sky01
      alc_Gap_Skylight2SkylightEnd GapID = sky02
      alc_Gap_Skylight2SkylightEnd GapID = sky04
    case sky04
      alc_Gap_Skylight2SkylightEnd GapID = sky01
      alc_Gap_Skylight2SkylightEnd GapID = sky02
      alc_Gap_Skylight2SkylightEnd GapID = sky03
    endswitch
  endif
endscript
script alc_Gap_Skylight2SkylightEnd
  EndGap GapID = <GapID> score = 50 text = "Skylight-2-Skylight"
endscript
script alc_Gap_RoofToWall
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = roof2wall flags = PURE_AIR
  endif
endscript
script alc_Gap_RoofToWallEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = roof2wall score = 50 text = "Cellblock Roof 2 Excercise Yard Wall"
  endif
endscript
script alc_Gap_Bleachers
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = <GapID> flags = PURE_AIR
  endif
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    switch <GapID>
    case bleacher01
      alc_Gap_BleachersEnd GapID = bleacher02
    case bleacher02
      alc_Gap_BleachersEnd GapID = bleacher01
    endswitch
  endif
endscript
script alc_Gap_BleachersEnd
  EndGap GapID = <GapID> score = 50 text = "Bleacher Hop"
endscript
script alc_Gap_Bleacher2Pipe
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = bleachers2pipe flags = PURE_AIR
  endif
endscript
script alc_Gap_Bleacher2PipeEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = bleachers2pipe score = 50 text = "Bleacher-2-Pipe"
  endif
endscript
script alc_Gap_Ledge2Pipe
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = ledge2pipe flags = PURE_AIR
  endif
endscript
script alc_Gap_Ledge2PipeEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = ledge2pipe score = 50 text = "Ledge-2-Pipe"
  endif
endscript
script alc_Gap_Pipe2Ledge
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = pipe2ledge flags = PURE_AIR
  endif
endscript
script alc_Gap_Pipe2LedgeEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = pipe2ledge score = 50 text = "Pipe-2-Ledge"
  endif
endscript
script alc_Gap_PipeMadnessAlt
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = <GapID> flags = PURE_AIR
  endif
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    switch <GapID>
    case pipe01
      alc_Gap_PipeMadnessEnd GapID = pipe02
      alc_Gap_PipeMadnessEnd GapID = pipe03
      alc_Gap_PipeMadnessEnd GapID = pipe04
      alc_Gap_PipeMadnessEnd GapID = pipe05
      alc_Gap_PipeMadnessEnd GapID = pipe06
      alc_Gap_PipeMadnessEnd GapID = pipe07
    case pipe02
      alc_Gap_PipeMadnessEnd GapID = pipe01
      alc_Gap_PipeMadnessEnd GapID = pipe03
      alc_Gap_PipeMadnessEnd GapID = pipe04
      alc_Gap_PipeMadnessEnd GapID = pipe05
      alc_Gap_PipeMadnessEnd GapID = pipe06
      alc_Gap_PipeMadnessEnd GapID = pipe07
    case pipe03
      alc_Gap_PipeMadnessEnd GapID = pipe01
      alc_Gap_PipeMadnessEnd GapID = pipe02
      alc_Gap_PipeMadnessEnd GapID = pipe04
      alc_Gap_PipeMadnessEnd GapID = pipe05
      alc_Gap_PipeMadnessEnd GapID = pipe06
      alc_Gap_PipeMadnessEnd GapID = pipe07
    case pipe04
      alc_Gap_PipeMadnessEnd GapID = pipe02
      alc_Gap_PipeMadnessEnd GapID = pipe03
      alc_Gap_PipeMadnessEnd GapID = pipe01
      alc_Gap_PipeMadnessEnd GapID = pipe05
      alc_Gap_PipeMadnessEnd GapID = pipe06
      alc_Gap_PipeMadnessEnd GapID = pipe07
    case pipe05
      alc_Gap_PipeMadnessEnd GapID = pipe02
      alc_Gap_PipeMadnessEnd GapID = pipe03
      alc_Gap_PipeMadnessEnd GapID = pipe04
      alc_Gap_PipeMadnessEnd GapID = pipe01
      alc_Gap_PipeMadnessEnd GapID = pipe06
      alc_Gap_PipeMadnessEnd GapID = pipe07
    case pipe06
      alc_Gap_PipeMadnessEnd GapID = pipe02
      alc_Gap_PipeMadnessEnd GapID = pipe03
      alc_Gap_PipeMadnessEnd GapID = pipe04
      alc_Gap_PipeMadnessEnd GapID = pipe05
      alc_Gap_PipeMadnessEnd GapID = pipe01
      alc_Gap_PipeMadnessEnd GapID = pipe07
    case pipe07
      alc_Gap_PipeMadnessEnd GapID = pipe02
      alc_Gap_PipeMadnessEnd GapID = pipe03
      alc_Gap_PipeMadnessEnd GapID = pipe04
      alc_Gap_PipeMadnessEnd GapID = pipe05
      alc_Gap_PipeMadnessEnd GapID = pipe06
      alc_Gap_PipeMadnessEnd GapID = pipe01
    endswitch
  endif
endscript
script alc_Gap_PipeMadnessEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = <GapID> score = 50 text = "Pipe Smoker"
  endif
endscript
script alc_Gap_Roof2PoolsStart
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = roof2pool flags = PURE_AIR
  endif
endscript
script alc_Gap_Roof2PoolsEnd
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    EndGap GapID = roof2pool score = 200 text = "Sludge Bomb"
  endif
endscript
script alc_Gap_TunnelCurbStart
  Printf "--- Starting Tunnel Manual"
  StartGap GapID = tunnelmanual flags = CANCEL_GROUND
endscript
script alc_Gap_TunnelCurbEnd
  Printf "--- Ending Tunnel Manual"
  EndGap GapID = tunnelmanual score = 50 text = "Tunnel Manual"
endscript
script alc_Gap_OverTheBathroomStart
  StartGap GapID = bathroomspine flags = PURE_AIR
endscript
script alc_Gap_OverTheBathroomEnd
  EndGap GapID = bathroomspine score = 50 text = "Who Bombed the Bathroom? Spine"
endscript
script alc_Gap_LedgeManualStart
  StartGap GapID = sik flags = PURE_MANUAL
endscript
script alc_Gap_LedgeManualEnd
  EndGap GapID = sik score = 50 text = "Sik Sewer Ledge Manual"
endscript
script alc_Gap_OverDockStairsStart
  StartGap GapID = overdockstairs flags = PURE_AIR
endscript
script alc_Gap_OverDockStairsEnd
  EndGap GapID = overdockstairs score = 50 text = "Over Dock Stairs"
endscript
script alc_Gap_DownHatchStart
  StartGap GapID = DownHatch flags = PURE_AIR
endscript
script alc_Gap_DownHatchEnd
  EndGap GapID = DownHatch score = 50 text = "Down The Hatch"
endscript
