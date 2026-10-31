CNV_BigCoaster_Time_To_Change_Speed = 1
script Cnv_Setup
  if IsCareerMode
    if GoalManager_HasWonGoal name = cnv_goal_gaps2
      if not IsAlive name = TRG_BannerSuccess
        Create name = TRG_BannerSuccess
      endif
      if not IsAlive name = Pig_Still01
        Create name = TRG_Ped_Deliverance
        Create Prefix = "Pig_"
      endif
    endif
  endif
endscript
FLAG_AJC_PIG_CAN_JIG = 1
FLAG_AJC_STOCKADE_LIPPED_LONG_ENOUGH = 1
EX_STOCKADE_QUIT_LIPPING = 1
EX_PIG_WAS_CAUGHT = 2
EX_PIG_RESET = 3
EX_COW_SMACK = 4
cnv_goal_comp_winner_name = "Billy Bob"
script Cnv_startup
  LoadSound "Shared\Hits\HitGlassPane2x" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\BonkBush" vol = 100 dropoff = 50
  LoadSound "skater\bitchslap2" vol = 100 dropoff = 50
  LoadSound "skater\bail_knee1" vol = 100 dropoff = 50
  LoadSound "skater\hitblood03" vol = 100 dropoff = 50
  LoadSound "Shared\Animal\HorseWhinny" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\HitFlimsyWood_11" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\HitMetalCan_11" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\Hitwoodplanks" vol = 50 dropoff = 50
  LoadSound "Shared\Misc\Ricco2_11" vol = 100 dropoff = 50
  LoadSound "cnv\teacuploop" vol = 200 dropoff = 150 PosUpdate
  LoadSound "cnv\gravitron_loop" vol = 100 dropoff = 150 PosUpdate
  LoadSound "cnv\alligatorsteps" vol = 100 dropoff = 100 PosUpdate
  LoadSound "Shared\Water\FallWater" vol = 100 dropoff = 50
  LoadSound "Shared\animal\hitpig01" vol = 150 dropoff = 50
  LoadSound "Shared\animal\hitpig02" vol = 150 dropoff = 50
  LoadSound "Shared\animal\hitpig03" vol = 150 dropoff = 50
  LoadSound "Shared\animal\hitcow1" vol = 150 dropoff = 50
  LoadSound "Shared\animal\hitcow2" vol = 150 dropoff = 50
  LoadSound "Shared\animal\hitcow3" vol = 150 dropoff = 50
  LoadSound "Shared\animal\hitcow4" vol = 150 dropoff = 50
  LoadSound "Shared\animal\goat1" vol = 150 dropoff = 50
  LoadSound "Shared\animal\goat2" vol = 150 dropoff = 50
  LoadSound "Shared\animal\goat3" vol = 150 dropoff = 50
  LoadSound "Shared\animal\hitchicken3" vol = 150 dropoff = 50
  LoadSound "cnv\DragonRideloop" vol = 75 dropoff = 300 PosUpdate
endscript
script CNV_Goals
  if InMultiplayerGame
    add_multiplayer_mode_goals
  endif
  if not InSplitScreenGame
    if not GameModeEquals is_singlesession
      CNV_AddMinigame_Sawing
      CNV_AddMinigame_Shooting
      AddGoal_HighScore {
        goal_text = cnv_highscore_text
        view_goals_text = cnv_highscore_text
        score = cnv_highscore_score
        pro = "Grommet"
        proset_prefix = "ProSet2_"
        start_cam_anim = G_HS_CameraStart
        success_cam_anim = G_HS_CameraSuccess
        reward_goal = Cnv_Goal_SickScore
        reward_cash = 100
        goal_description = cnv_highscore_desc
      }
      AddGoal_Skate {
        goal_text = "Collect S-K-A-T-E"
        start_cam_anim = G_SKATE_CameraStart
        success_cam_anim = G_SKATE_CameraSuccess
        pro = "Carnie"
        goal_description = cnv_skate_desc
      }
      AddGoal_Combo {
        goal_text = "Collect C-O-M-B-O in one combo"
        start_cam_anim = G_COMBO_CameraStart
        pro = "DrunkHick"
        full_name = "Drunk Hick"
        success_cam_anim = G_COMBO_CameraSuccess
        reward_goal = Cnv_Goal_ProCombo
        goal_description = cnv_combo_desc
      }
      AddGoal_Tetris {
        career_only
        time = 60
        trick_flag = 0
        goal_text = "Hit the tricks and ring the bell!"
        view_goals_text = "Hit the tricks and ring the bell!"
        start_cam_anim = G_TETRIS_CameraStart
        success_cam_anim = G_TETRIS_CameraSuccess
        trigger_wait_script = CNV_HawkerWaiting
        next_trigger_script = CNV_HawkerWaiting
        pro = "Hawker"
        proset_prefix = "Proset4_"
        goal_description = cnv_tetris_desc
        goal_tetris_key_combos = [
          Air_CircleU
          Air_CircleD
          Air_CircleL
          Air_CircleR
          Air_SquareU
          Air_SquareD
          Air_SquareL
          Air_SquareR
        ]
        acceleration_interval = 5
        acceleration_percent = 0.05
        time_to_stop_adding_tricks = 15
      }
      AddGoal_Gaps {
        goal_text = "Grind the 6 Souvenir Photo spots "
        use_hud_counter
        hud_counter_caption = "Photos"
        goal_flags = [ got_1
          got_2
          got_3
          got_4
          got_5
          got_6
        ]
        start_cam_anim = G_GAP_CameraStart
        pro = "Roadie"
        reward_goal = Cnv_Goal_Collect
        goal_outro_script = Cnv_goal_gaps_outro
        goal_deactivate_script = Cnv_goal_gaps_Deactivate
        goal_description = cnv_gaps_desc
        view_goals_text = "Collect 6 souvenir photos"
        record_type = time
      }
      AddGoal_HighCombo {
        goal_text = cnv_highcombo_text
        score = cnv_highcombo_score
        start_cam_anim = G_HighCombo_CameraStart
        success_cam_anim = G_HighCombo_CameraSuccess
        reward_goal = Cnv_Goal_Comp
        view_goals_text = "Do a 500,000 point combo"
        pro = "Photoguy"
        record_type = time
        full_name = "Atiba Jefferson"
        goal_description = cnv_highcombo_desc
      }
      AddGoal_Race {
        career_only
        goal_text = "Tour the carnival..."
        goal_flags = [
          got_1
          got_2
          got_3
          got_4
          got_5
          got_6
          got_7
        ]
        race_waypoints = [
          { id = TRG_G_RACE_RaceNav_01 scr = cnv_race_waypoint_1 flag = got_1 time = 7 }
          { id = TRG_G_RACE_RaceNav_02 scr = cnv_race_waypoint_2 flag = got_2 time = 7 }
          { id = TRG_G_RACE_RaceNav_03 scr = cnv_race_waypoint_3 flag = got_3 time = 8 }
          { id = TRG_G_RACE_RaceNav_04 scr = cnv_race_waypoint_4 flag = got_4 time = 4 }
          { id = TRG_G_RACE_RaceNav_05 scr = cnv_race_waypoint_5 flag = got_5 time = 7 }
          { id = TRG_G_RACE_RaceNav_06 scr = cnv_race_waypoint_6 flag = got_6 time = 10 }
          { id = TRG_G_RACE_RaceNav_07 scr = cnv_race_waypoint_7 flag = got_7 time = 5 }
        ]
        start_cam_anim = G_RACE_CameraStart
        success_cam_anim = G_RACE_CameraSuccess
        pro = "Teenager"
        reward_goal = Cnv_Goal_Trickspot2
        goal_description = cnv_race_desc
        view_goals_text = "Try not to boot"
        goal_intro_script = Cnv_Goal_Race_Intro
        goal_start_script = Cnv_Goal_Race_Start
        record_type = time
        goal_deactivate_script = Cnv_Goal_Race_Deactivate
        goal_outro_script = CNV_Goal_Race_Outro
      }
      AddGoal_Competition {
        career_only
        goal_text = "Medal the Vert Competition"
        start_cam_anim = G_COMP_CameraStart
        success_cam_anim = G_COMP_CameraSuccess
        pro = "BillyBob"
        full_name = "Billy Bob"
        unlocked_by_another
        reward_goal = [ cnv_goal_gaps2
          Cnv_Goal_Special
        ]
        goal_intro_script = Cnv_Goal_Comp_Intro
        goal_deactivate_script = Cnv_Goal_Comp_Deactivate
        goal_description = cnv_comp_desc
        gold = 95
        silver = 85
        bronze = 70
        time = 30
        gold_score = cnv_comp_gold
        silver_score = cnv_comp_silver
        bronze_score = cnv_comp_bronze
        bail = 7
      }
      AddGoal_SickScore {
        goal_text = cnv_sickscore_text
        score = cnv_sickscore_score
        pro = "Grommet"
        proset_prefix = "ProSet1_"
        start_cam_anim = G_SS_CameraStart
        success_cam_anim = G_SS_CameraSuccess
        unlocked_by_another
        view_goals_text = cnv_sickscore_text
        goal_description = cnv_sickscore_desc
      }
      AddGoal_ProCombo {
        goal_text = "Collect C-O-M-B-O in one combo"
        start_cam_anim = G_PROLINE_CameraStart
        success_cam_anim = G_PROLINE_CameraSuccess
        pro = "DrunkHick"
        full_name = "Drunk Hick"
        unlocked_by_another
        goal_description = cnv_procombo_desc
      }
      AddGoal_Gaps2 {
        career_only
        use_hud_counter
        hud_counter_caption = "Banners"
        goal_text = "Tear Down the 4 Stockade Banners with a Lip Trick"
        goal_flags = [ got_1
          got_2
          got_3
          got_4
        ]
        unlocked_by_another
        start_cam_anim = G_GAP2_CameraStart
        pro = "Carnie"
        goal_intro_script = Cnv_Goal_Comp_Intro
        goal_deactivate_script = CNV_Gaps2_Deactivate
        goal_outro_script = CNV_Gaps2_Outro
        goal_description = cnv_gaps2_desc
        view_goals_text = "Help tear down the competition"
        record_type = time
      }
      AddGoal_Trickspot2 {
        goal_text = "Grind all the way around the coaster."
        goal_flags = [ got_1
        ]
        start_cam_anim = G_TS2_CameraStart
        success_cam_anim = G_TS2_CameraSuccess
        pro = "Teenager"
        unlocked_by_another
        goal_description = cnv_trickspot2_desc
        time = 60
        view_goals_text = "Grind the whole coaster"
        record_type = none
      }
      AddGoal_Special {
        career_only
        special_gap
        goal_text = "Do a 900 on the Rocket ride"
        key_combo_text = "\nThe 900\n\k1"
        start_cam_anim = G_SPECIAL_CameraStart
        success_cam_anim = G_SPECIAL_CameraSuccess
        pro = "BillyBob"
        full_name = "Billy Bob"
        trick_name = Trick_the900
        trick_type = air
        time = 60
        goal_description = cnv_special_desc
        unlocked_by_another
        view_goals_text = "Nail a 900 on the Rocket ride"
        record_type = time
      }
      AddGoal_Collect {
        use_hud_counter
        hud_counter_caption = "Tickets"
        goal_text = "Collect 10 ride tickets"
        view_goals_text = "Collect 10 ride tickets"
        goal_intro_script = CNV_Goal_Collect_Intro
        goal_outro_script = CNV_Goal_Collect_Outro
        goal_deactivate_script = CNV_Goal_Collect_Deactivate
        proset_prefix = "ProSet5_"
        pro = "Roadie"
        time = 30
        record_type = time
        unlocked_by_another
        goal_flags = [ got_1
          got_2
          got_3
          got_4
          got_5
          got_6
          got_7
          got_8
          got_9
          got_10
        ]
        start_cam_anim = G_COLLECT_CameraStart
        success_cam_anim = G_COLLECT_CameraSuccess
        goal_description = cnv_collect_desc
        collect_type = "tickets"
      }
    endif
  endif
endscript
script cnv_race_waypoint_1
  create_panel_block id = current_goal text = "First grab a nice greasy chili dog and fries" style = panel_message_goal
endscript
script cnv_race_waypoint_2
  create_panel_block id = current_goal text = "Now head over and slurp up a sugary soda, for color" style = panel_message_goal
endscript
script cnv_race_waypoint_3
  create_panel_block id = current_goal text = "Now for the rides... first stop... Rock'n Rock'itz!" style = panel_message_goal
endscript
script cnv_race_waypoint_4
  create_panel_block id = current_goal text = "Now hop onto the coaster track in the station" style = panel_message_goal
endscript
script cnv_race_waypoint_5
  create_panel_block id = current_goal text = "Then we spin it up nice to get you dizzy in the Abductor!" style = panel_message_goal
endscript
script cnv_race_waypoint_6
  create_panel_block id = current_goal text = "Now get yourself on top of the Ferris wheel and see if it all comes back up!" style = panel_message_goal
endscript
script cnv_race_waypoint_7
  create_panel_block id = current_goal text = "...And finally... get over to the Thunder Cups!" style = panel_message_goal
endscript
script Cnv_Goal_Race_Intro
  Kill Prefix = "TRG_G_RACE_RaceNav_"
  Wait 1 frame
  Create Prefix = "TRG_G_RACE_RaceNav_"
endscript
script Cnv_Goal_Race_Start
endscript
script Cnv_Goal_Race_Deactivate
  if IsAlive name = TRG_G_RACE_RaceNav_01
    KillTheArrow id = TRG_G_RACE_RaceNav_01
  endif
  if IsAlive name = TRG_G_RACE_RaceNav_02
    KillTheArrow id = TRG_G_RACE_RaceNav_02
  endif
  if IsAlive name = TRG_G_RACE_RaceNav_03
    KillTheArrow id = TRG_G_RACE_RaceNav_03
  endif
  if IsAlive name = TRG_G_RACE_RaceNav_04
    KillTheArrow id = TRG_G_RACE_RaceNav_04
  endif
  if IsAlive name = TRG_G_RACE_RaceNav_05
    KillTheArrow id = TRG_G_RACE_RaceNav_05
  endif
  if IsAlive name = TRG_G_RACE_RaceNav_06
    KillTheArrow id = TRG_G_RACE_RaceNav_06
  endif
  if IsAlive name = TRG_G_RACE_RaceNav_07
    KillTheArrow id = TRG_G_RACE_RaceNav_07
  endif
  Kill Prefix = "TRG_G_RACE_RaceNav_"
endscript
script CNV_Goal_Race_Outro
endscript
script CNV_Skater_Race_Teleport
  TeleportSkaterToNode nodename = TRG_Restart_RaceFinish orient
  MakeSkaterGoto SkaterInit
endscript
script CNV_AddGoalArrow
  GetNodeName
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    parent = root_window
    type = Element3D
    model = "GoalArrow"
    id = <nodename>
    HoverParams = { Amp = 10 Freq = 2 }
    AngVelY = 0.16
    ParentParams = { name = <nodename> (0, 100, 0) IgnoreParentsYRotation }
  }
endscript
script Cnv_goal_comp_restart
  if IsAlive name = PROSET3NOT_JudgeStand01
    MakeSkaterGoto Dropin
  else
    skater:Obj_Rotate absolute = (0, 90, 0)
  endif
endscript
script Cnv_Goal_Comp_Intro
  if not IsAlive name = PROSET3NOT_dt_QP01
    Create Prefix = "PROSET3NOT_"
    Create Prefix = "TRG_PROSET3NOT_"
    Kill Prefix = "PROSET3_"
    Kill Prefix = "TRG_PROSET3_"
  endif
endscript
script CNV_CounterGap_Bowl_Odd
endscript
script CNV_CounterGap_Bowl_Even
endscript
script Cnv_GotFloatGap
  GoalManager_GotCounterObject name = Cnv_Goal_Counter
endscript
script CNV_KillSkater
  Sk3_Killskater message1 = "Stay off the Grass!" message2 = "Show us your ta-tas!" message3 = "Go ride the Black Shaft!" message4 = "Fair's INSIDE the fence!" r = 0 g = 128 b = 0
endscript
script CNV_GlassPane
  PlaySound HitGlassPane2x
  Kill name = <self>
endscript
script CNV_CutoutCam
  if GoalManager_GoalIsActive name = cnv_goal_gaps
    if GoalManager_GoalFlagSet name = cnv_goal_gaps flag = <flagtosend>
    else
      if not InNetGame
        MakeSkaterGoto CNV_Skater_Standing
        PauseClock
        PauseSkaters
        PlaySkaterCamAnim skater = 0 name = <cam>
        PlaySound HUD_jumpgap
        TeleportSkaterToNode nodename = <picnode> orient
        begin
          if SkaterCamAnimFinished name = <cam>
            UnPauseSkaters
            UnPauseClock
            TeleportSkaterToNode nodename = <outnode> orient
            break
          endif
          Wait 2 frames
        repeat
      endif
      if GoalManager_SetGoalFlag name = cnv_goal_gaps <flagtosend> 1
      endif
    endif
  endif
endscript
script CNV_Skater_Standing
  PlayAnim Anim = Ped_Pic_StandLow BlendPeriod = 0 Cycle
endscript
script CNV_Ped_MidwayWorker
  begin
    Obj_CycleAnim Anim = random( @ComeOver @Wave ) 
    Obj_CycleAnim Anim = Wave numcycles = random( @1 @2 @3 ) 
  repeat
endscript
script Cnv_goal_gaps_Deactivate
  MakeSkaterGoto SkaterInit
endscript
script Cnv_goal_gaps_outro
  MakeSkaterGoto SkaterInit
endscript
script Cnv_gaps_teleport
  TeleportSkaterToNode nodename = TRG_G_GAP_RestartNode orient
  MakeSkaterGoto SkaterInit
endscript
script CNV_Ped_Deliverance
  Obj_ClearExceptions
  setup_ped_speech { ped_id = TRG_Ped_Deliverance
    display_name = "Pig Lover"
    activation_script = CNV_Pig_Start
    outer_radius_script = CNV_Pig_Reset
    pad_choose_script = CNV_Pig_Run
    text = [ "Pig Lover:\n That pig over there sure has a purty mouth! "
      "See if you can catch him before my cousins do!"
    ]
  }
  Obj_PlayAnim Anim = Ped_M_Idle1 Cycle
endscript
script CNV_HauntedHouseEnter
  StopStream
  PlayStream HauntedHouse vol = 150
  TeleportSkaterToNode nodename = TRG_RestartHauntedHouseInside orient
endscript
script CNV_HauntedHouseExit
  StopStream HauntedHouse
  TeleportSkaterToNode nodename = TRG_RestartHauntedHouseReturn orient
endscript
script CNV_Chicken
  Obj_ClearExceptions
  Obj_SetInnerRadius 3
  Obj_SetException ex = SkaterInRadius scr = CNV_Chicken_Hit
   <scalingFactor> = random( @1.0 @0.9 @1.1 ) 
  Obj_ApplyScaling x = <scalingFactor> y = <scalingFactor> z = <scalingFactor>
  begin
    Obj_CycleAnim Anim = Idle numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim Anim = EatFromIdle
    Obj_CycleAnim Anim = Eat numcycles = random( @2 @3 @4 ) 
    Obj_CycleAnim Anim = EatToIdle
  repeat
endscript
script CNV_Chicken_NoScale
  Obj_ClearExceptions
  Obj_SetInnerRadius 3
  Obj_SetException ex = SkaterInRadius scr = CNV_Chicken_Hit
  begin
    Obj_CycleAnim Anim = Idle numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim Anim = EatFromIdle
    Obj_CycleAnim Anim = Eat numcycles = random( @2 @3 @4 ) 
    Obj_CycleAnim Anim = EatToIdle
  repeat
endscript
script CNV_Chicken_Hit
  Obj_ClearExceptions
  Obj_SetOuterRadius 10
  Obj_SetException ex = SkaterOutOfRadius scr = CNV_Chicken_NoScale
  Obj_PlaySound hitchicken3 pitch = random( @95 @105 @115 ) 
  begin
    Obj_CycleAnim Anim = Idle numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim Anim = EatFromIdle
    Obj_CycleAnim Anim = Eat numcycles = random( @2 @3 @4 ) 
    Obj_CycleAnim Anim = EatToIdle
  repeat
endscript
script CNV_Goat_Lover
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = CNV_Goat_Lover_Fall
  Obj_SetInnerRadius 4
  Obj_CycleAnim Anim = Ped_M_GetUpA
  begin
    Obj_CycleAnim Anim = Ped_M_Idle1
    Obj_CycleAnim Anim = Ped_M_ScratchChin numcycles = random( @1 @2 ) 
    Obj_CycleAnim Anim = Ped_M_Idle1
    Obj_CycleAnim Anim = Ped_M_LookLeftRight numcycles = random( @1 @2 ) 
  repeat
endscript
script CNV_Goat_Lover_Fall
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = CNV_Goat_Lover
  Obj_SetOuterRadius 7
  Obj_PlayAnim Anim = Ped_M_FalldownA
  PlaySound bail04
endscript
script CNV_Goat
  begin
    Obj_CycleAnim Anim = random( @Idle @Idle2  ) numcycles = random( @1 @2 ) 
    Obj_PlaySound random( @goat1 @goat2 @goat3  ) pitch = random( @95 @105 @115 ) 
  repeat
endscript
script Cnv_Goat_Walk
  Obj_SetPathVelocity 2 mph
  Obj_SetPathTurnDist 1
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 1 mphps
  Obj_SetPathDeceleration 1 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim Anim = Walk Cycle
  begin
    Wait random( @3 seconds @5 seconds @7 seconds ) 
    Obj_PlaySound random( @goat1 @goat2 @goat3  ) pitch = random( @95 @105 @115 ) 
  repeat
endscript
script CNV_Penned_Pig_Big
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = CNV_Penned_Pig_Big_Fall
  Obj_SetInnerRadius 3
   <scalingFactor> = random( @1.8 @2.2 @2.0 ) 
  Obj_ApplyScaling x = <scalingFactor> y = <scalingFactor> z = <scalingFactor>
  Wait random( @5 frames @10 frames @15 frames @20 frames ) 
  Obj_PlayAnim Anim = Idle Cycle
endscript
script CNV_Penned_Pig_Big_NoScale
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = CNV_Penned_Pig_Big_Fall
  Obj_SetInnerRadius 3
  Obj_PlayAnim Anim = Idle Cycle
endscript
script CNV_Penned_Pig_Big_Fall
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = CNV_Penned_Pig_Big_NoScale
  Obj_SetOuterRadius 15
  Obj_PlaySound random( @hitpig01 @hitpig02 @hitpig03 ) 
  Obj_CycleAnim Anim = RunFromIdle speed = 1.5
  Obj_CycleAnim Anim = RunToCaught speed = 1.5
  Obj_PlayAnim Anim = Caught Cycle
endscript
script CNV_Penned_Pig_Small
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = CNV_Penned_Pig_Small_Fall
  Obj_SetInnerRadius 2
   <scalingFactor> = random( @0.6 @0.75 @0.85 ) 
  Obj_ApplyScaling x = <scalingFactor> y = <scalingFactor> z = <scalingFactor>
  Wait random( @5 frames @10 frames @15 frames @20 frames ) 
  Obj_PlayAnim Anim = Idle Cycle
endscript
script CNV_Penned_Pig_Small_NoScale
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = CNV_Penned_Pig_Small_Fall
  Obj_SetInnerRadius 2
  Obj_PlayAnim Anim = Idle Cycle
endscript
script CNV_Penned_Pig_Small_Fall
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = CNV_Penned_Pig_Small_NoScale
  Obj_SetOuterRadius 15
  Obj_PlaySound random( @hitpig01 @hitpig02 @hitpig03 ) 
  Obj_CycleAnim Anim = RunFromIdle speed = 1.5
  Obj_CycleAnim Anim = RunToCaught speed = 1.5
  Obj_PlayAnim Anim = Caught Cycle
endscript
script CNV_Pig_Start
  if not IsAlive name = PROSET3_WoodenQP19
    Create Prefix = "PROSET3_"
    Create Prefix = "TRG_PROSET3_"
    Kill Prefix = "PROSET3NOT_"
    Create prfix = "TRG_PROSET3NOT_"
  endif
  Kill Prefix = "Piggy_"
endscript
script CNV_Pig_Reset
endscript
script CNV_Pig_Run
  UnPauseSkaters
  Kill Prefix = "Pig_"
  Create Prefix = "Piggy_"
  speech_box_exit
  MakeSkaterGoto SkaterInit
endscript
script CNV_RunningPiggy
  Obj_SetPathTurnDist 2.5 feet
  Obj_StickToGround off
  Obj_SetConstantHeight
  Obj_PathHeading On
  Obj_SetPathVelocity 15 fps
  Obj_PlayAnim Anim = run Cycle
  Obj_ClearExceptions
  Obj_SetException ex = EX_PIG_WAS_CAUGHT scr = CNV_RunningPiggy_WasCaught
  GotoPreserveParams CNV_RunningPiggy_RunNorth
endscript
script CNV_RunningPiggy_RunNorth
  Obj_ClearFlag FLAG_AJC_PIG_CAN_JIG
  Obj_SpawnScript CNV_RunningPiggy_WakeMeUpLater
  Obj_MoveToNode speed = 18 fps name = random( @TRG_PiggyRunToNodeNorth01 @TRG_PiggyRunToNodeNorth02 @TRG_PiggyRunToNodeNorth03 @TRG_PiggyRunToNodeNorth04 @TRG_PiggyRunToNodeNorth05 ) 
  Obj_LookAtNode name = TRG_PiggyRunToNodeNorth01 time = 0.5
  begin
    Wait 2 frames
    if Obj_ObjectInRadius type = skater radius = 2
      create_panel_message id = PIG text = "You caught the pig!" style = panel_message_goal time = 1
      SendException EX_PIG_WAS_CAUGHT Prefix = "Piggy_"
      GotoPreserveParams CNV_RunningPiggy_WasCaught
    endif
    if Obj_FlagSet FLAG_AJC_PIG_CAN_JIG
      if Obj_ObjectInRadius type = ped radius = 6
        Obj_ClearFlag FLAG_AJC_PIG_CAN_JIG
        GotoPreserveParams CNV_RunningPiggy_RunWest
      endif
      if Obj_ObjectInRadius type = skater radius = 12
        Obj_ClearFlag FLAG_AJC_PIG_CAN_JIG
        Obj_PlaySound random( @hitpig01 @hitpig02 @hitpig03 ) 
        GotoPreserveParams CNV_RunningPiggy_RunWest
      endif
    endif
    if Obj_IsMoving
    else
      GotoPreserveParams CNV_RunningPiggy_RunEast
    endif
  repeat
endscript
script CNV_RunningPiggy_RunSouth
  Obj_ClearFlag FLAG_AJC_PIG_CAN_JIG
  Obj_SpawnScript CNV_RunningPiggy_WakeMeUpLater
  Obj_MoveToNode speed = 18 fps name = random( @TRG_PiggyRunToNodeSouth01 @TRG_PiggyRunToNodeSouth02 @TRG_PiggyRunToNodeSouth03 @TRG_PiggyRunToNodeSouth04 @TRG_PiggyRunToNodeSouth05 ) 
  Obj_LookAtNode name = TRG_PiggyRunToNodeSouth01 time = 0.5
  begin
    Wait 2 frames
    if Obj_ObjectInRadius type = skater radius = 2
      create_panel_message id = PIG text = "You caught the pig!" style = panel_message_goal time = 1
      SendException EX_PIG_WAS_CAUGHT Prefix = "Piggy_"
      GotoPreserveParams CNV_RunningPiggy_WasCaught
    endif
    if Obj_FlagSet FLAG_AJC_PIG_CAN_JIG
      if Obj_ObjectInRadius type = ped radius = 6
        Obj_ClearFlag FLAG_AJC_PIG_CAN_JIG
        GotoPreserveParams CNV_RunningPiggy_RunEast
      endif
      if Obj_ObjectInRadius type = skater radius = 12
        Obj_ClearFlag FLAG_AJC_PIG_CAN_JIG
        Obj_PlaySound random( @hitpig01 @hitpig02 @hitpig03 ) 
        GotoPreserveParams CNV_RunningPiggy_RunEast
      endif
    endif
    if Obj_IsMoving
    else
      GotoPreserveParams CNV_RunningPiggy_RunNorth
    endif
  repeat
endscript
script CNV_RunningPiggy_RunWest
  Obj_MoveToNode speed = 18 fps name = random( @TRG_PiggyRunToNodeWest01 @TRG_PiggyRunToNodeWest02 @TRG_PiggyRunToNodeWest03 @TRG_PiggyRunToNodeWest04 @TRG_PiggyRunToNodeWest05 ) 
  Obj_LookAtNode name = TRG_PiggyRunToNodeWest01 time = 0.5
  Obj_ClearFlag FLAG_AJC_PIG_CAN_JIG
  Obj_SpawnScript CNV_RunningPiggy_WakeMeUpLater
  begin
    Wait 2 frames
    if Obj_ObjectInRadius type = skater radius = 2
      create_panel_message id = PIG text = "You caught the pig!" style = panel_message_goal time = 1
      SendException EX_PIG_WAS_CAUGHT Prefix = "Piggy_"
      GotoPreserveParams CNV_RunningPiggy_WasCaught
    endif
    if Obj_FlagSet FLAG_AJC_PIG_CAN_JIG
      if Obj_ObjectInRadius type = ped radius = 6
        Obj_ClearFlag FLAG_AJC_PIG_CAN_JIG
        GotoPreserveParams CNV_RunningPiggy_RunNorth
      endif
      if Obj_ObjectInRadius type = skater radius = 12
        Obj_ClearFlag FLAG_AJC_PIG_CAN_JIG
        Obj_PlaySound random( @hitpig01 @hitpig02 @hitpig03 ) 
        GotoPreserveParams CNV_RunningPiggy_RunNorth
      endif
    endif
    if Obj_IsMoving
    else
      GotoPreserveParams CNV_RunningPiggy_RunSouth
    endif
  repeat
endscript
script CNV_RunningPiggy_RunEast
  Obj_SpawnScript CNV_RunningPiggy_WakeMeUpLater
  Obj_MoveToNode speed = 18 fps name = random( @TRG_PiggyRunToNodeEast01 @TRG_PiggyRunToNodeEast02 @TRG_PiggyRunToNodeEast03 @TRG_PiggyRunToNodeEast04 @TRG_PiggyRunToNodeEast05 ) 
  Obj_LookAtNode name = TRG_PiggyRunToNodeEast01 time = 0.5
  begin
    Wait 2 frames
    if Obj_ObjectInRadius type = skater radius = 2
      create_panel_message id = PIG text = "You caught the pig!" style = panel_message_goal time = 1
      SendException EX_PIG_WAS_CAUGHT Prefix = "Piggy_"
      GotoPreserveParams CNV_RunningPiggy_WasCaught
    endif
    if Obj_FlagSet FLAG_AJC_PIG_CAN_JIG
      if Obj_ObjectInRadius type = ped radius = 6
        Obj_ClearFlag FLAG_AJC_PIG_CAN_JIG
        GotoPreserveParams CNV_RunningPiggy_RunSouth
      endif
      if Obj_ObjectInRadius type = skater radius = 12
        Obj_ClearFlag FLAG_AJC_PIG_CAN_JIG
        Obj_PlaySound random( @hitpig01 @hitpig02 @hitpig03 ) 
        GotoPreserveParams CNV_RunningPiggy_RunSouth
      endif
    endif
    if Obj_IsMoving
    else
      GotoPreserveParams CNV_RunningPiggy_RunWest
    endif
  repeat
endscript
script CNV_RunningPiggy_WakeMeUpLater
  Wait 2 seconds
  Obj_SetFlag FLAG_AJC_PIG_CAN_JIG
endscript
script CNV_RunningPiggy_WasCaught
  Obj_PlaySound random( @hitpig01 @hitpig02 @hitpig03 ) 
  Obj_StopMoving
  Obj_StopRotating
  Obj_PathHeading off
  Obj_PlayAnim Anim = Caught Cycle
  Wait 2 seconds
  if ObjectExists id = PIG
    RunScriptOnScreenElement id = PIG kill_panel_message
  endif
  Obj_PlayAnim Anim = Walk Cycle
  Obj_MoveToNode speed = 5 fps name = TRG_Piggy_ResetNode
  Obj_LookAtNode name = TRG_Piggy_ResetNode time = 1.0
  Obj_WaitMove
  SendException EX_PIG_RESET Prefix = "Piggy_"
  if not IsAlive name = Pig_Still01
    Create name = Pig_Still01
    Die
  endif
endscript
script CNV_PiggyChaser
  Obj_ClearExceptions
  Obj_SetException ex = EX_PIG_WAS_CAUGHT scr = CNV_PiggyChaserLost params = <...>
  Obj_SetPathTurnDist 2.5 feet
  Obj_StickToGround off
  Obj_SetConstantHeight
  Obj_SetPathVelocity 18 fps
  GotoPreserveParams CNV_PiggyChaser_Chase
endscript
script CNV_PiggyChaser_Chase
  Obj_PlayAnim Anim = Ped_PC_RunForPig Cycle
  begin
    Obj_LookAtObject name = Piggy_01
    Obj_MoveForward dist = random( @40 @42 @44 @46 @48 @50  ) time = 0.25
    Wait 5 frames
    if Obj_ObjectInRadius name = Piggy_01 radius = 1
      if Obj_ObjectInRadius type = skater radius = 120
        create_panel_message id = PIG text = "Someone else caught the pig!" style = panel_message_goal time = 1
      endif
      SendException EX_PIG_WAS_CAUGHT Prefix = "Piggy_"
      Obj_CycleAnim Anim = Ped_PC_StandPig
    endif
    if Obj_ObjectInRadius name = Piggy_01 radius = 8
      GotoPreserveParams CNV_PiggyChaser_Dive
    endif
    if Obj_ObjectInRadius type = ped radius = 2
      PlaySound bitchslap2
      GotoPreserveParams CNV_PiggyChaser_Fall
    endif
    if Obj_ObjectInRadius type = skater radius = 4
      PlaySound bail_knee1
      GotoPreserveParams CNV_PiggyChaser_Fall
    endif
  repeat
endscript
script CNV_PiggyChaser_Fall
  Obj_SetAnimCycleMode off
  Obj_PlayAnim Anim = Ped_M_FalldownA
  Obj_MoveForward dist = 120 time = 1
  PlaySound hitblood03
  Obj_WaitAnimFinished
  Wait random( @1 @2 @3 @4 @5  ) seconds
  Obj_PlayAnim Anim = Ped_PC_GetUp
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_PC_RunForPig
  Obj_WaitAnimFinished
  GotoPreserveParams CNV_PiggyChaser_Chase
endscript
script CNV_PiggyChaser_Dive
  Obj_SetAnimCycleMode off
  Obj_PlayAnim Anim = Ped_PC_Dive
  Obj_MoveForward dist = 210 time = 1
  begin
    if Obj_ObjectInRadius name = Piggy_01 radius = 1
      if Obj_ObjectInRadius type = skater radius = 120
        create_panel_message id = PIG text = "Someone else caught the pig!" style = panel_message_goal time = 1
      endif
      SendException EX_PIG_WAS_CAUGHT Prefix = "Piggy_"
      Obj_CycleAnim Anim = Ped_PC_StandPig
    endif
    if Obj_ObjectInRadius type = skater radius = 4
      MakeSkaterGoto PedKnockDown
      Wait 30 frames
    endif
    if Obj_AnimComplete
      break
    endif
    Wait 2 frames
  repeat
  random( @
  
  begin
    Obj_CycleAnim Anim = Ped_PC_LayMud numcycles = random( @1 @2 ) 
  repeat 1
  @
  begin
    Obj_CycleAnim Anim = Ped_PC_GetUpFall
  repeat 1
  @
  begin
  repeat 1
  
  Obj_PlayAnim Anim = Ped_PC_GetUp
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_PC_RunForPig
  Obj_WaitAnimFinished
  GotoPreserveParams CNV_PiggyChaser_Chase
endscript
script CNV_PiggyChaserWon
endscript
script CNV_PiggyChaserLost
  Obj_ClearExceptions
  Obj_PlayAnim Anim = Ped_M_Walk1 Cycle
  Obj_LookAtNode name = <resetnode> time = 0.5
  Obj_MoveToNode name = <resetnode> speed = 3
  Obj_WaitMove
  Obj_LookAtNode name = Piggy_01 time = 0.5
  if not IsAlive name = <statnode>
    Create name = <statnode>
  endif
  Die
endscript
script CNV_PiggyWatcher
  begin
    Obj_PlayAnim Anim = random( @Ped_M_LookAndPoint @Ped_M_LookLeftRight @Ped_M_Lookright @Ped_M_Talk_Shrug @Ped_M_Talk_WhoKnows @Ped_M_Talk_ISupposeSo @Ped_M_Talk_TheyWereThisBig @Ped_M_Talk_ShagAir @Ped_M_Talk1 @Ped_M_Talk2 ) 
    Obj_WaitAnimFinished
  repeat
endscript
script CNV_PennedPiggy
  Obj_StickToGround off
  Obj_SetConstantHeight
  begin
    Obj_CycleAnim Anim = Idle numcycles = random( @2 @3 @4 @5 @6 ) 
    Obj_CycleAnim Anim = IdleToEat numcycles = 1
    Obj_CycleAnim Anim = Eat numcycles = random( @1 @2 @3 @4 ) 
    Obj_CycleAnim Anim = IdleToEat numcycles = 1 backwards
  repeat
endscript
script CNV_PennedMeerkat
  Obj_StickToGround off
  Obj_SetConstantHeight
  begin
    Obj_CycleAnim Anim = DownIdle numcycles = random( @2 @3 @4 @5 @6 @7 ) 
    Obj_CycleAnim Anim = DownToUp numcycles = 1
    Obj_CycleAnim Anim = UpIdle numcycles = random( @1 @2 @3 @4 @5 @6 @7 @8 ) 
    Obj_CycleAnim Anim = UpToDown numcycles = 1
  repeat
endscript
script CNV_Stockade_CollectPro
  begin
    Obj_PlayAnim Anim = random( @Ped_M_LookAndPoint @Ped_M_LookLeftRight @Ped_M_Lookright @Ped_M_Talk_Shrug @Ped_M_Talk_WhoKnows @Ped_M_Talk_ISupposeSo @Ped_M_Talk_TheyWereThisBig @Ped_M_Talk_ShagAir @Ped_M_Talk1 @Ped_M_Talk2 ) 
    Obj_WaitAnimFinished
  repeat
endscript
script CNV_Ped_BeadChick
endscript
script CNV_Goal_Stockade_StartCounting
  if GoalManager_GoalIsActive name = cnv_goal_gaps2
    Obj_ClearExceptions
    Obj_SetException ex = EX_STOCKADE_QUIT_LIPPING scr = <QuitScript>
    Wait 5 seconds
    Obj_SetFlag FLAG_AJC_STOCKADE_LIPPED_LONG_ENOUGH
    create_panel_message id = STOCKADE_LIP1 text = "Ok, that's long enough..." style = panel_message_goal time = 1
    Wait 1 second
    create_panel_message id = STOCKADE_LIP1 text = "Look out - it's going to fall!" style = panel_message_goal time = 1
    Wait 1 second
    create_panel_message id = STOCKADE_LIP1 text = "AGGGH!  THERE IT GOES!!!" style = panel_message_goal time = 1
    Wait 1 second
    Printf "--- AJC --- AJC --- FORCE BAILING player"
    MakeSkaterGoto OnGroundAI
    Wait 1 seconds
    GotoPreserveParams <QuitScript>
  else
    Die
  endif
endscript
script CNV_Goal_Stockade_StopCounting
  if IsAlive name = <Manager>
    SendException EX_STOCKADE_QUIT_LIPPING name = <Manager>
  endif
endscript
script CNV_Goal_Stockade_QuitLipping1
  if GoalManager_GoalIsActive name = cnv_goal_gaps2
    if Obj_FlagSet FLAG_AJC_STOCKADE_LIPPED_LONG_ENOUGH
      if ObjectExists id = STOCKADE_LIP1
        RunScriptOnScreenElement id = STOCKADE_LIP1 kill_panel_message
      endif
      Kill Prefix = "PROSET3NOT_Bunting1_"
      PlaySound Hitwoodplanks pitch = random( @75 @85 @95 ) 
      Obj_KillSpawnedScript name = CNV_Goal_Stockade_StartCounting
      begin
        GetSkaterState
        if ( <state> = skater_OnGround )
          if GoalManager_SetGoalFlag name = cnv_goal_gaps2 got_1 1
            break
          endif
          break
        endif
        Wait 3 frames
      repeat
    else
      create_panel_message id = STOCKADE_LIP1 text = "No!  You have to stay up there LONGER!" style = panel_message_goal time = 2
      Wait 1 second
      RunScriptOnScreenElement id = STOCKADE_LIP1 kill_panel_message
    endif
  endif
  Die
endscript
script CNV_Goal_Stockade_QuitLipping2
  if GoalManager_GoalIsActive name = cnv_goal_gaps2
    if Obj_FlagSet FLAG_AJC_STOCKADE_LIPPED_LONG_ENOUGH
      if ObjectExists id = STOCKADE_LIP1
        RunScriptOnScreenElement id = STOCKADE_LIP1 kill_panel_message
      endif
      Kill Prefix = "PROSET3NOT_Bunting2_"
      PlaySound Hitwoodplanks pitch = random( @75 @85 @95 ) 
      Obj_KillSpawnedScript name = CNV_Goal_Stockade_StartCounting
      begin
        GetSkaterState
        if ( <state> = skater_OnGround )
          if GoalManager_SetGoalFlag name = cnv_goal_gaps2 got_2 1
            break
          endif
          break
        endif
        Wait 3 frames
      repeat
    else
      create_panel_message id = STOCKADE_LIP1 text = "Well THATS certainly not gonna cut it!" style = panel_message_goal time = 2
      Wait 1 second
      RunScriptOnScreenElement id = STOCKADE_LIP1 kill_panel_message
    endif
  endif
  Die
endscript
script CNV_Goal_Stockade_QuitLipping3
  if GoalManager_GoalIsActive name = cnv_goal_gaps2
    if Obj_FlagSet FLAG_AJC_STOCKADE_LIPPED_LONG_ENOUGH
      if ObjectExists id = STOCKADE_LIP1
        RunScriptOnScreenElement id = STOCKADE_LIP1 kill_panel_message
      endif
      Kill Prefix = "PROSET3NOT_Bunting3_"
      PlaySound Hitwoodplanks pitch = random( @75 @85 @95 ) 
      Obj_KillSpawnedScript name = CNV_Goal_Stockade_StartCounting
      begin
        GetSkaterState
        if ( <state> = skater_OnGround )
          if GoalManager_SetGoalFlag name = cnv_goal_gaps2 got_3 1
            break
          endif
          break
        endif
        Wait 3 frames
      repeat
    else
      create_panel_message id = STOCKADE_LIP1 text = "No, no!  Really LEAN on it!" style = panel_message_goal time = 2
      Wait 1 second
      RunScriptOnScreenElement id = STOCKADE_LIP1 kill_panel_message
    endif
  endif
  Die
endscript
script CNV_Goal_Stockade_QuitLipping4
  if GoalManager_GoalIsActive name = cnv_goal_gaps2
    if Obj_FlagSet FLAG_AJC_STOCKADE_LIPPED_LONG_ENOUGH
      if ObjectExists id = STOCKADE_LIP1
        RunScriptOnScreenElement id = STOCKADE_LIP1 kill_panel_message
      endif
      Kill Prefix = "PROSET3NOT_Bunting4_"
      PlaySound Hitwoodplanks pitch = random( @75 @85 @95 ) 
      Obj_KillSpawnedScript name = CNV_Goal_Stockade_StartCounting
      begin
        GetSkaterState
        if ( <state> = skater_OnGround )
          if GoalManager_SetGoalFlag name = cnv_goal_gaps2 got_4 1
            break
          endif
          break
        endif
        Wait 3 frames
      repeat
    else
      create_panel_message id = STOCKADE_LIP1 text = "Come on - stay on longer than THAT!!! " style = panel_message_goal time = 2
      Wait 1 second
      RunScriptOnScreenElement id = STOCKADE_LIP1 kill_panel_message
    endif
  endif
  Die
endscript
script cnv_goal_trickspot_got_gap1
  Printf "Hey Hey Dammit"
  if GoalManager_SetGoalFlag name = cnv_goal_trickspot got_1 1
  endif
endscript
script CNV_goal_special_StartGap
  EndGap GapID = BusRide
  Wait 3 frames
  if GoalManager_GoalIsActive name = Cnv_Goal_Special
    StartGap GapID = BusRide flags = [ PURE_AIR ] Tricktext = "The 900" trickscript = cnv_goal_special_got_gap1
  endif
endscript
script CNV_goal_trickspot_StartGap
  if GoalManager_GoalIsActive name = cnv_goal_trickspot
    Printf "Hello Biatch!!!"
    StartGap flags = [ CANCEL_GROUND ] Tricktext = "The 900" trickscript = cnv_goal_trickspot_got_gap1
  else
    StartGap flags = [ CANCEL_GROUND ]
  endif
endscript
script CNV_goal_trickspot_EndGap
  EndGap text = "Roof Dragon Gap" score = 1000
endscript
script cnv_coaster_startgap
  if GoalManager_GoalIsActive name = Cnv_Goal_Trickspot2
    StartGap GapID = CoasterGap flags = [ pure_rail ] trickscript = cnv_goal_trickspot2_got_gap1
  else
    StartGap GapID = CoasterGap flags = [ pure_rail ]
  endif
endscript
script cnv_goal_trickspot2_got_gap1
  if GoalManager_SetGoalFlag name = Cnv_Goal_Trickspot2 got_1 1
  endif
endscript
script cnv_bell_startgaps
  StartGap GapID = BellGap flags = [ CANCEL_GROUND , CANCEL_RAIL ]
  StartGap GapID = BellGap_Prize flags = [ CANCEL_GROUND , CANCEL_RAIL ]
endscript
script cnv_goal_special_got_gap1
  GoalManager_WinGoal name = Cnv_Goal_Special
endscript
script CNV_Gap_Bell_End09
  EndGap GapID = BellGap text = "I've TRIPPED higher than that!" score = 50
endscript
script CNV_Gap_Bell_End08
  EndGap GapID = BellGap text = "Congrats on your first ollie" score = 100
endscript
script CNV_Gap_Bell_End06
  EndGap GapID = BellGap text = "Limp Noodle" score = 200
endscript
script CNV_Gap_Bell_End05
  EndGap GapID = BellGap text = "You call that air?" score = 250
endscript
script CNV_Gap_Bell_End04
  EndGap GapID = BellGap text = "Shoulda skipped that chili dog" score = 300
endscript
script CNV_Gap_Bell_End03
  EndGap GapID = BellGap text = "Nice view, but its no penthouse" score = 350
endscript
script CNV_Gap_Bell_End01
  EndGap GapID = BellGap text = "Almost Never Soft" score = 450
endscript
script CNV_Gap_Bell_EndTop
  EndGap GapID = BellGap_Prize text = "Win a Prize" score = 500 Gapscript = CNV_RingBell
endscript
script Cnv_Gap_CoasterGrind
  EndGap GapID = CoasterGap text = "WHAT A TRIP!" score = 1000
endscript
script Cnv_Gap_HauntedTeacup
  StartGap GapID = HauntedTeacup flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_HauntedTeacup_End
  EndGap GapID = HauntedTeacup text = "Haunted Teacup Gap" score = 100
endscript
script Cnv_Gap_BarnHop
  StartGap GapID = BarnHop flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_BarnHop_End
  EndGap GapID = BarnHop text = "Barn Hop" score = 100
endscript
script Cnv_Gap_AngryWindow
  StartGap GapID = AngryWindow flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_AngryWindow_End
  EndGap GapID = AngryWindow text = "Angry Window" score = 100
endscript
script CNV_Gap_NiceView
  StartGap GapID = NiceView flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_NiceViewEnd
  EndGap GapID = NiceView text = "Nice View up here" score = 1000
endscript
script CNV_Gap_BarnRoof
  StartGap flags = [ CANCEL_GROUND ]
  EndGap text = "Over the Barn Door" score = 50
endscript
script CNV_Gap_Midway
  StartGap GapID = Midway flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_Midway_End
  EndGap GapID = Midway text = "Midway Transfer" score = 100
endscript
script CNV_Gap_Shine12
  StartGap GapID = Shine1 flags = [ CANCEL_GROUND ]
  EndGap GapID = Shine2 text = "'Shine Bowl Transfer" score = 50
endscript
script CNV_Gap_Shine21
  StartGap GapID = Shine2 flags = [ CANCEL_GROUND ]
  EndGap GapID = Shine1 text = "'Shine Bowl Transfer" score = 50
endscript
script CNV_Gap_Abductor
  StartGap GapID = Abductor flags = [ CANCEL_GROUND , CANCEL_RAIL ]
endscript
script CNV_Gap_AbductorEnd
  EndGap GapID = Abductor text = "Ride and Puke" score = 50
endscript
script CNV_Gap_BackPorch
  StartGap GapID = BackPorch flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_BackPorchEnd
  if TriggerType [ TRIGGER_LIP_ON ]
    EndGap GapID = BackPorch text = "Back Porch Lip Gap" score = 50
  endif
endscript
script CNV_Gap_LightString
  StartGap GapID = LightString flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
endscript
script CNV_Gap_LightStringEnd
  EndGap GapID = LightString text = "Grind the Shiny Lights" score = 50
endscript
script CNV_Gap_RimRock
  StartGap GapID = RimRock flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_RimRockEnd
  if TriggerType [ TRIGGER_LIP_ON ]
    EndGap GapID = RimRock text = "Rim Rockin'" score = 50
  endif
endscript
script CNV_Gap_Gummy
  StartGap GapID = Gummy flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_GummyEnd
  EndGap GapID = Gummy text = "Gummy the Gator Gap" score = 100
endscript
script CNV_Gap_SwampEscape
  StartGap GapID = SwampEscape flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_SwampEscapeEnd
  EndGap GapID = SwampEscape text = "Swamp Escape" score = 100
endscript
script CNV_Gap_PigSlop
  StartGap flags = [ CANCEL_GROUND , CANCEL_RAIL ]
  EndGap text = "Pig Slop Manual" score = 50
endscript
script CNV_Gap_ChickenShit
  StartGap flags = [ CANCEL_GROUND , CANCEL_RAIL ]
  EndGap text = "Chicken Sh.. Manual" score = 50
endscript
script CNV_Gap_BillyGoat
  StartGap flags = [ PURE_AIR ]
  EndGap text = "Billy Goat Gap" score = 50
endscript
script CNV_Gap_Downtown12
  StartGap GapID = Downtown1 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Downtown2 text = "From Downtown" score = 300
endscript
script CNV_Gap_Downtown21
  StartGap GapID = Downtown2 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Downtown1 text = "From Downtown" score = 300
endscript
script CNV_Gap_Paint12
  StartGap GapID = Paint1 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Paint2 text = "Foot on the line" score = 200
endscript
script CNV_Gap_Paint21
  StartGap GapID = Paint2 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Paint1 text = "Foot on the line" score = 200
endscript
script CNV_Gap_Paint34
  StartGap GapID = Paint3 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Paint4 text = "Foot on the line" score = 200
endscript
script CNV_Gap_Paint43
  StartGap GapID = Paint4 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Paint3 text = "Foot on the line" score = 200
endscript
script CNV_Gap_Charity12
  StartGap GapID = Charity1 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Charity2 text = "From the Charity Stripe" score = 100
endscript
script CNV_Gap_Charity21
  StartGap GapID = Charity2 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Charity1 text = "From the Charity Stripe" score = 100
endscript
script CNV_Gap_Charity23
  StartGap GapID = Charity2 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Charity3 text = "From the Charity Stripe" score = 100
endscript
script CNV_Gap_Charity32
  StartGap GapID = Charity3 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Charity2 text = "From the Charity Stripe" score = 100
endscript
script CNV_Gap_Charity34
  StartGap GapID = Charity3 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Charity4 text = "From the Charity Stripe" score = 100
endscript
script CNV_Gap_Charity43
  StartGap GapID = Charity4 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Charity3 text = "From the Charity Stripe" score = 100
endscript
script CNV_Gap_BarnHole
  StartGap flags = [ CANCEL_GROUND , CANCEL_RAIL ]
  EndGap text = "Barn Hole Manual" score = 100
endscript
script CNV_Gap_3Cows
  StartGap flags = [ CANCEL_GROUND , CANCEL_RAIL ]
  EndGap text = "3 Cow Manual" score = 100
endscript
script CNV_Gap_ThrillRide
  StartGap GapID = ThrillRide flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
endscript
script CNV_Gap_ThrillRide_End
  EndGap GapID = ThrillRide text = "Thrill Ride" score = 100
endscript
script CNV_Gap_Log
  StartGap GapID = Log flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
endscript
script CNV_Gap_Log_End
  EndGap GapID = Log text = "Log" score = 25
endscript
script CNV_Gap_Cock
  StartGap GapID = Cock flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_CockEnd
  EndGap GapID = Cock text = "Cock To Ledge" score = 50
endscript
script CNV_Gap_AbductorManual
  StartGap flags = [ CANCEL_GROUND , CANCEL_RAIL ]
  EndGap text = "Abductor Lip Manual" score = 500
endscript
script CNV_Gap_MidwayManual
  StartGap flags = [ CANCEL_GROUND , CANCEL_RAIL ]
  EndGap text = "Midway Manual" score = 100
endscript
script CNV_Gap_BannerUp
  StartGap GapID = BannerUp flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_BannerUp_End
  EndGap GapID = BannerUp text = "Banner Up!" score = 100
endscript
script CNV_Gap_HighWire1
  StartGap GapID = HighWire1 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
endscript
script CNV_Gap_HighWire1_End
  EndGap GapID = HighWire1 text = "High Wire Act" score = 100
endscript
script CNV_Gap_HighWire2
  StartGap GapID = HighWire2 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
endscript
script CNV_Gap_HighWire2_End
  EndGap GapID = HighWire2 text = "High Wire Act" score = 100
endscript
script CNV_Gap_Counter
  StartGap GapID = Counter1 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Counter2 text = "Counter Grind" score = 50
endscript
script CNV_GAP_Counter_End
  StartGap GapID = Counter2 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Counter1 text = "Counter Grind" score = 50
endscript
script CNV_Gap_PureAir
  StartGap flags = [ PURE_AIR ]
endscript
script CNV_Gap_StairHopEnd
  EndGap text = "Stair Hop" score = 25
endscript
script CNV_Gap_Rail2Rail12
  StartGap GapID = Rail2Rail1 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Rail2Rail2 text = "Rail 2 Rail" score = 25
endscript
script CNV_Gap_Rail2Rail21
  StartGap GapID = Rail2Rail2 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = Rail2Rail1 text = "Rail 2 Rail" score = 25
endscript
script CNV_Gap_PlanterPop12
  StartGap GapID = PlanterPop1 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = PlanterPop2 text = "Planter Pop" score = 25
endscript
script CNV_Gap_PlanterPop21
  StartGap GapID = PlanterPop2 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = PlanterPop1 text = "Planter Pop" score = 25
endscript
script CNV_Gap_LedgeHop12
  StartGap GapID = LedgeHop1 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = LedgeHop2 text = "Ledge Hop" score = 25
endscript
script CNV_Gap_LedgeHop21
  StartGap GapID = LedgeHop2 flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap GapID = LedgeHop1 text = "Ledge Hop" score = 25
endscript
script CNV_Gap_LowLip
  StartGap GapID = LowLip flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_HighLip
  StartGap GapID = HighLip flags = [ CANCEL_GROUND ]
endscript
script CNV_Gap_LowLipEnd
  if TriggerType [ TRIGGER_LIP_ON ]
    EndGap GapID = LowLip text = "Low Lip Gap" score = 50
  endif
endscript
script CNV_Gap_HighLipEnd
  if TriggerType [ TRIGGER_LIP_ON ]
    EndGap GapID = HighLip text = "High Lip Gap" score = 100
  endif
endscript
script Cnv_Bus_Sync
  Printf "--- AJC --- AJC --- syncing bus"
endscript
script Cnv_Bus
  Printf "--- AJC --- AJC --- creating bus"
  if InNetGame
  else
    Obj_SetPathTurnDist 2.5 feet
    Obj_StickToGround off
    Obj_PathHeading off
    Obj_SetPathVelocity 16.76 fps
    Obj_SetPathAcceleration 35 fpsps
    Obj_SetPathDeceleration 35 fpsps
    Obj_FollowPathLinked
  endif
endscript
script Cnv_Teacup
  if InNetGame
  else
    Obj_SetPathTurnDist 2.5 feet
    Obj_StickToGround off
    Obj_PathHeading off
    Obj_SetPathVelocity 12 fps
    Obj_SetPathAcceleration 35 fpsps
    Obj_SetPathDeceleration 35 fpsps
    Obj_FollowPathLinked
    begin
      Obj_RotY speed = random( @-30 @-40 @-50 @-60 @-70 @-80 @80 @70 @60 @50 @40 @30 ) 
      Wait random( @2 @3 @4 @5 @6 @7 @8 @9 @10  ) seconds
    repeat
  endif
endscript
script Cnv_Teacup_Rider
  Obj_LockToObject ObjectName = <locknode> (0, 15, -35)
  begin
    Obj_CycleAnim Anim = random( @Ped_Judge_SatIdle1 @Ped_Judge_SatIdle2 @Ped_Judge_SatIdle3 @Ped_Judge_SatIdle4  ) numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim Anim = random( @Ped_Judge_SatLookLeft @Ped_Judge_SatLookRight ) 
  repeat
endscript
script Cnv_Teacup_gorilla
  Obj_LockToObject ObjectName = <locknode> (0, 35, -20)
  Obj_ApplyScaling x = 0.5 y = 0.5 z = 0.5
  begin
    Obj_CycleAnim Anim = Sit numcycles = random( @3 @5 @7 ) 
    Obj_CycleAnim Anim = SittingScratch
  repeat
endscript
script Cnv_GoatCollision
  Obj_LockToObject ObjectName = TRG_Goat_Walking (0, 0, -15)
endscript
script Cnv_Ferris_Rider
  if ( <switchflag> = 0 )
    Obj_LockToObject ObjectName = <locknode> (-70, -135, -35) NoRotation
  else
    Obj_LockToObject ObjectName = <locknode> (-70, -135, 35) NoRotation
  endif
  begin
    Obj_CycleAnim Anim = random( @Ped_Judge_SatIdle1 @Ped_Judge_SatIdle2 @Ped_Judge_SatIdle3 @Ped_Judge_SatIdle4  ) numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim Anim = random( @Ped_Judge_SatLookLeft @Ped_Judge_SatLookRight ) 
  repeat
endscript
script CNV_Coaster_Prop
  Obj_FollowLeader name = <locknode> distance = 50 OrientY
  Obj_RotY speed = 100
endscript
script Cnv_Clown
  Obj_ClearExceptions
  Obj_SetInnerRadius 5
  Obj_SetException ex = SkaterInRadius scr = Cnv_Clown_Fall
  Obj_PlayAnim Anim = Ped_ZM_Idle Cycle
  begin
    Obj_LookAtObject type = skater time = 0.5
    Wait 2 seconds
  repeat
endscript
script Cnv_Clown_Fall
  Obj_ClearExceptions
  if skater:InAir
    skater:GetGap score = 200 text = "Clown Plant!"
  endif
  Obj_SetException ex = SkaterOutOfRadius scr = Cnv_Clown
  Obj_SetOuterRadius 15
  Obj_PlayAnim Anim = Ped_M_FalldownA
  PlaySound bail04
endscript
script Cnv_SmCoasterPiece
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathTurnDist 2.5 feet
  Obj_StickToGround off
  Obj_PathHeading On
  Obj_SetPathVelocity 12 fps
  Obj_SetPathAcceleration 35 fpsps
  Obj_SetPathDeceleration 35 fpsps
  Obj_FollowPath name = TRG_SmallCoaster_CarTrack17
endscript
script Cnv_MiniCoaster_Sync
endscript
script Cnv_MiniCoaster_Cleanup
endscript
script Cnv_BigCoasterPiece
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathTurnDist 2.5 feet
  Obj_StickToGround off
  Obj_PathHeading On
  Obj_SetPathVelocity 40 fps
  Obj_SetPathAcceleration 0 fpsps
  Obj_SetPathDeceleration 0 fpsps
  Obj_FollowPath name = <tracknode>
endscript
script CNV_BigCoasterSection
  Obj_ClearExceptions
  Mdl_NoDynLighting
  Obj_FollowLeader name = <leader> distance = <distance> OrientY
  Obj_SetException ex = SkaterInRadius scr = CNV_BigCoaster_Smack params = <...>
  Obj_SetInnerRadius 3
endscript
script CNV_BigCoaster_Smack
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = CNV_BigCoaster_Wait params = <...>
  Obj_SetOuterRadius 5
  GetSkaterState
  if ( <state> = skater_InBail )
  else
    MakeSkaterGoto PedKnockDown
  endif
endscript
script CNV_BigCoaster_Wait
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = CNV_BigCoaster_Smack params = <...>
  Obj_SetInnerRadius 3
endscript
script Cnv_BigCoaster_Sync
  if IsAlive name = TRG_BigCoaster_SyncTimer
    Printf "--- AJC --- AJC --- NOT syncing big coaster"
  else
    Printf "--- AJC --- AJC --- syncing big coaster"
  endif
endscript
script Cnv_BigCoaster_Start
  Create name = TRG_BigCoaster_Head
  Create Prefix = "TRG_BigCoaster_Body"
  Printf "--- AJC --- AJC --- STARTING coaster"
endscript
script Cnv_BigCoaster_Cleanup
  Printf "--- AJC --- AJC --- CLEANING UP coaster"
  if IsAlive name = TRG_BigCoaster_Head
    Kill name = TRG_BigCoaster_Head
    Kill Prefix = "TRG_BigCoaster_Body"
  endif
endscript
script Cnv_BigCoaster_TriggerSpeedChange
  if IsAlive name = <SpeedChangeTimer>
    Printf "--- AJC --- AJC --- skipping speed change - a body piece went by"
  else
    Printf "--- AJC --- AJC --- PERFORMING SPEED CHANGE"
    Obj_SetPathAcceleration <newaccel> fpsps
    Obj_SetPathDeceleration <newdecel> fpsps
    Obj_SetPathVelocity <newspeed> fps
  endif
endscript
script CNV_Gravitron_Rotate
  if InNetGame
  else
    Obj_RotY speed = 105
  endif
endscript
script CNV_Swirly_Rotate
  if InNetGame
  else
    Obj_RotZ speed = 50
  endif
endscript
script CNV_Collect_Item
  Obj_SetException ex = SkaterInRadius scr = CNV_Collect_Got params = <...>
  Obj_SetInnerRadius 10
  Obj_RotZ speed = random( @50 @-150 @200 @-250  ) FLAG_MAX_COORDS
  Obj_Hover Amp = random( @5 @10 @15  ) Freq = random( @0.5 @1 @2 ) 
endscript
script CNV_Collect_Got
  if GoalManager_SetGoalFlag name = Cnv_Goal_Collect <flag> 1
    PlaySound GapSound vol = 100
    GoalManager_GetGoalParams name = Cnv_Goal_Collect
    if not GoalManager_AllFlagsSet name = Cnv_Goal_Collect
      FormatText TextName = collect_text "%c of %n %t" c = <num_flags_set> t = <collect_type> n = <num_flags>
      create_panel_message text = <collect_text> style = goal_collect_text
    endif
  endif
  Die
endscript
script CNV_HawkerWaiting
  begin
    Obj_CycleAnim Anim = ComeOver
    Obj_CycleAnim Anim = Wave numcycles = random( @1 @2 ) 
  repeat
endscript
script CNV_HawkerCheering
  begin
    Obj_PlayAnim Anim = Cheer Cycle
  repeat
endscript
script CNV_RingBell
  PlaySound GrindMetalOn pitch = 75
  if GoalManager_GoalIsActive name = cnv_goal_tetris
    GoalManager_EditGoal name = cnv_goal_tetris params = { trick_flag = 1 }
  endif
endscript
script CNV_scalingScript
   <scalingFactor> = 1.0
   <scalingIncrement> = 0.1
  begin
    Obj_ApplyScaling x = <scalingFactor> y = <scalingFactor> z = <scalingFactor>
    Wait 60 frames
     <scalingFactor> = ( <scalingFactor> + <scalingIncrement> )
  repeat
endscript
script Hick_goal_wait
  begin
    if InNetGame
      Obj_LookAtObject type = skater
      Obj_CycleAnim Anim = random( @Ped_M_Idle1 @Ped_M_LookAtWatch @Ped_M_LookAtWatch2 @Ped_M_Lookright ) 
    else
      Obj_LookAtObject type = skater
      Obj_CycleAnim Anim = random( @Ped_Frat_Drink @Ped_Frat_DrunkenIdle @Ped_Frat_DrunkenIdle @Ped_Frat_DrunkenIdle ) 
      Obj_CycleAnim Anim = random( @Ped_Frat_Drink @Ped_Frat_DrunkenIdle @Ped_Frat_DrunkenIdle @Ped_Frat_DrunkenIdle ) 
    endif
  repeat
endscript
script CNV_TriggerTrapDoor
  Kill name = TrapDoorStop
  Create name = TrapDoorMove
endscript
script CNV_TrapDoor
  Obj_RotX angle = 75 speed = 120
  Obj_WaitRotate
  Obj_RotX angle = -75 speed = 30
  Obj_WaitRotate
  Create name = TrapDoorStop
  Die
endscript
script CNV_Ped_Baby_Idle
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = CNV_Ped_Baby_Trip
  Obj_SetInnerRadius 5
  begin
    Obj_CycleAnim Anim = Ped_Baby_Idle numcycles = random( @1 @2 ) 
    Obj_CycleAnim Anim = Ped_Baby_Idle2 numcycles = random( @1 @2 ) 
    Obj_CycleAnim Anim = Ped_Baby_Idle3 numcycles = random( @1 @2 ) 
    Obj_CycleAnim Anim = Ped_Baby_Idle4 numcycles = random( @1 @2 ) 
  repeat
endscript
script CNV_Ped_Baby_Trip
  Obj_ClearExceptions
  MakeSkaterGoto PedKnockDown
  Obj_LookAtObject type = skater time = 0.5
  Obj_CycleAnim Anim = Ped_Baby_Trip
  Obj_CycleAnim Anim = Ped_Baby_Idle2
  Goto CNV_Ped_Baby_Idle
endscript
script CNV_Teacup_Noises
  Obj_PlaySound teacuploop
  begin
    Wait random( @9 seconds @11 seconds @13 seconds ) 
    Obj_PlayStream random( @Thunderclap01 @Thunderclap02 @Thunderclap03 @Thunderclap04  ) vol = 300
  repeat
endscript
script CNV_Gravitron_Noises
  Obj_PlaySound gravitron_loop
  begin
    Wait 10 seconds
  repeat
endscript
script CNV_Goal_Collect_Intro
  Kill Prefix = "TRG_G_COLLECT_Ticket"
  Create Prefix = "TRG_G_COLLECT_Ticket"
endscript
script CNV_Goal_Collect_Outro
  Kill Prefix = "TRG_G_COLLECT_Ticket"
endscript
script CNV_Goal_Collect_Deactivate
  Kill Prefix = "TRG_G_COLLECT_Ticket"
endscript
script CNV_Objects_Init
endscript
script CNV_Dizzy
  if GoalManager_GoalIsActive name = cnv_goal_race
    create_panel_block id = current_goal text = "Whoa, Dizzy!" style = panel_message_goal
  endif
endscript
script CNV_DontPuke
  if GoalManager_GoalIsActive name = cnv_goal_race
    create_panel_block id = current_goal text = "Hold on to your stomach...Almost at the top!" style = panel_message_goal
    Kill name = TRGP_DontPuke01
  endif
endscript
script CNV_Gaps2_Deactivate
  Kill Prefix = "TRG_Manage_Lip"
  if IsAlive name = TRG_BannerSuccess
    Kill name = TRG_BannerSuccess
  else
    if not IsAlive name = PROSET3NOT_Bunting1_01
      Create Prefix = "PROSET3NOT_Bunting1_"
    endif
    if not IsAlive name = PROSET3NOT_Bunting2_01
      Create Prefix = "PROSET3NOT_Bunting2_"
    endif
    if not IsAlive name = PROSET3NOT_Bunting3_01
      Create Prefix = "PROSET3NOT_Bunting3_"
    endif
    if not IsAlive name = PROSET3NOT_Bunting4_01
      Create Prefix = "PROSET3NOT_Bunting4_"
    endif
  endif
  if ObjectExists id = STOCKADE_LIP1
    RunScriptOnScreenElement id = STOCKADE_LIP1 kill_panel_message
  endif
  if GoalManager_HasWonGoal name = cnv_goal_gaps2
    Cnv_KnockDownComp
  endif
endscript
script CNV_Gaps2_Outro
  SetFlag flag = FLAG_PROSET3_GEO_ON
  MakeSkaterGoto CNV_Skater_Teleport
  Printf "Knock it down bitch"
  Cnv_KnockDownComp
endscript
script Cnv_Goal_Comp_Deactivate
  if GoalManager_HasWonGoal name = cnv_goal_gaps2
    Cnv_KnockDownComp
  endif
endscript
script Cnv_KnockDownComp
  Printf "Well..."
  Kill Prefix = "PROSET3NOT_"
  Kill Prefix = "TRG_PROSET3NOT_"
  if not IsAlive name = PROSET3_BarnDoor05
    Create Prefix = "PROSET3_"
    Create Prefix = "TRG_PROSET3_"
  endif
  if not IsAlive name = TRG_BannerSuccess
    Create name = TRG_BannerSuccess
  endif
  if not IsAlive name = Pig_Still01
    Create name = TRG_Ped_Deliverance
    Create Prefix = "Pig_"
  endif
endscript
script CNV_MoveToGAP2NODE
  Obj_MoveToNode name = TRG_Restart_Gap2Finish orient
endscript
script CNV_Skater_Teleport
  TeleportSkaterToNode nodename = TRG_Restart_Gap2Finish orient
  MakeSkaterGoto SkaterInit
endscript
script CNV_Gaps2_Finish
  ClearExceptions
  ClearTrickQueue
  ClearEventBuffer
  SetRollingFriction 1000
  Obj_MoveToNode name = TRG_Restart_Gap2Finish orient
  SetRollingFriction 1
endscript
script CNV_Cow
  Obj_ClearExceptions
  Obj_SetException ex = EX_COW_SMACK scr = CNV_Cow_Smack
  begin
    Obj_PlayAnim Anim = random( @EatIdle @ChewIdle @MooIdle @LookIdle ) 
    if Obj_AnimEquals MooIdle
      Obj_PlaySound random( @hitcow3 @hitcow4  ) pitch = random( @95 @105 @115 ) 
    endif
    Obj_WaitAnimFinished
    Obj_CycleAnim Anim = random( @EatIdle @ChewIdle @LookIdle ) 
  repeat
endscript
script CNV_Cow_Smack
  Obj_ClearExceptions
  Obj_PlayAnim Anim = Hit
  Obj_PlaySound random( @hitcow1 @hitcow2  ) pitch = random( @95 @105 @115 ) 
  Obj_WaitAnimFinished
  Goto CNV_Cow
endscript
script CNV_Gator
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = CNV_GatorDeath
  Obj_SetInnerRadius 5
  Kill name = TRG_GatorSounds
  Obj_PlayAnim Anim = run Cycle
  Create name = TRG_GatorSounds
  begin
    Obj_LookAtObject type = skater
    if not Obj_GetCollision height = 0.5 length = 7
      Obj_PlayAnim Anim = run Cycle NoRestart
      Obj_MoveForward dist = 10 time = 0.03
      Obj_WaitMove
    else
      Obj_PlayStream random( @AlligatorIdle @AlligatorIdle2 ) 
      Obj_PlayAnim Anim = Idle Cycle NoRestart
      Wait 10 frames
    endif
  repeat
endscript
script CNV_GatorSounds
  Obj_LockToObject ObjectName = TRG_Gator01 (0, 0, 0)
  begin
    Printf "GatorSounds"
    if IsAlive name = TRG_Gator01
      if TRG_Gator01:Obj_AnimEquals run
        Printf "Gator Moving"
        Obj_PlaySound alligatorsteps
        Wait 1.35 seconds
      else
        Printf "Gator Stopped"
        Obj_StopSound alligatorsteps
        Wait 1.35 seconds
      endif
    else
      Die
    endif
  repeat
endscript
script CNV_Screams
  begin
    Obj_PlayStream random( @FemaleShriek01 @FemaleShriek02 @FemaleShriek03 @FemaleShriek04 ) 
    Wait random( @7 seconds @9 seconds @11 seconds ) 
  repeat
endscript
script CNV_FrogSounds
  begin
    Obj_PlayStream random( @Frog01 @Frog02 @Frog03 @Frog04 @Frog05 @Frog06 ) 
    Wait random( @5 seconds @7 seconds @9 seconds ) 
  repeat
endscript
script CNV_PigSounds
  begin
    Obj_PlayStream random( @pig01 @pig02 @pig03 @pig04 @pig05 ) 
    Wait 21 seconds
  repeat
endscript
script CNV_RocketKnockerDummy
  Obj_ClearExceptions
  Kill name = TRGP_RocketKnocker
  Obj_SetException ex = SkaterInRadius scr = CNV_RocketKnockerDummyClose
  Obj_SetInnerRadius 8
endscript
script CNV_RocketKnockerDummyClose
  Obj_ClearExceptions
  if not IsAlive name = TRGP_RocketKnocker
    Create name = TRGP_RocketKnocker
  endif
  Obj_SetException ex = SkaterOutOfRadius scr = CNV_RocketKnockerDummy
  Obj_SetOuterRadius 11
endscript
script CNV_RocketKnocker
  MakeSkaterGoto PedKnockDown
endscript
script CNV_GatorDeath
  Obj_ClearExceptions
  MakeSkaterGoto PedKnockDown
  Create name = GatorKillGround
  Kill name = GatorSpawnGround
  Obj_PlayStream AlligatorEatSkater
  Obj_CycleAnim Anim = Chomp
  Die
endscript
script CNV_GatorKillGround
  Sk3_Killskater bail
  Wait 5 frames
  Create name = GatorSpawnGround
  Wait 1 frame
  Kill name = GatorKillGround
endscript
script CNV_Ducky
  Obj_SetPathTurnDist 2.5 feet
  Obj_StickToGround off
  Obj_PathHeading off
  Obj_SetPathVelocity 1
  Obj_SetPathAcceleration 2
  Obj_SetPathDeceleration 2
  Obj_FollowPathLinked
  begin
    Obj_RotY speed = random( @-20 @-15 @15 @20 ) 
    Wait random( @9 seconds @15 seconds @20 seconds ) 
  repeat
endscript
script Cnv_MG_Sawing
  if IsCareerMode
    setup_ped_speech {
      ped_id = TRG_MG_Sawing
      display_name = "Lumberjack"
      speed = 100
      inner_radius = 10
      text = [
        "Lumberjack:\n"
        "Hey! Skater-Person!\n"
        "Wanna join the Wood Warriors invitational?\n"
        "Press \b3 to Accept\nPress \m1 to Decline"
      ]
      pad_choose_script = CNV_MG_SawingClose
      pad_back_script = CNV_MG_SawingDecline
    }
  endif
endscript
script CNV_AddMinigame_Sawing
  AddMinigame_Generic {
    career_only
    activate_script = cnv_sawing_activate
    deactivate_script = cnv_sawing_deactivate
  }
endscript
script CNV_MG_SawingClose
  speech_box_exit
  if GoalManager_HasActiveGoals
    GoalManager_DeactivateAllGoals
  endif
  Wait 1 frame
  GoalManager_ActivateGoal name = cnv_goal_minigame_generic
endscript
script CNV_MG_EndGame
  GoalManager_DeactivateGoal name = cnv_goal_minigame_generic
endscript
script CNV_MG_SawingDecline
  UnPauseSkaters
  speech_box_exit
  MakeSkaterGoto SkaterInit
endscript
script cnv_sawing_activate
  MakeSkaterGoto CNV_SawingOnGround
endscript
script cnv_sawing_deactivate
  UnPauseSkaters
  speech_box_exit
  MakeSkaterGoto SkaterInit
  Wait 3 frame
  PlaySkaterCamAnim skater = 0 stop
  skater:SetRollingFriction 1
  skater:EnablePlayerInput
endscript
EXCEPTION_SAW_LEFT = 1
EXCEPTION_SAW_RIGHT = 2
FLAG_CUT_DONE = 23
FLAG_YOU_LOSE = 24
script CNV_SawLeft
  Obj_ClearExceptions
  Obj_MoveToNode name = TRG_SawNav02 speed = 3
  Obj_PlayStream WoodSawPull
  Obj_WaitMove
  SetFlag flag = FLAG_CUT_DONE
  Obj_ClearExceptions
  Obj_SetException ex = EXCEPTION_SAW_RIGHT scr = CNV_SawRight
endscript
script CNV_SawRight
  Obj_ClearExceptions
  Obj_MoveToNode name = TRG_SawNav01 speed = 3
  Obj_PlayStream WoodSawPush
  Obj_WaitMove
  SetFlag flag = FLAG_CUT_DONE
  Obj_ClearExceptions
  Obj_SetException ex = EXCEPTION_SAW_LEFT scr = CNV_SawLeft
endscript
script CNV_Sawing
  if IsCareerMode
    Obj_SetException ex = SkaterInRadius scr = CNV_SawingClose
    Obj_SetInnerRadius 10
    Obj_SetOuterRadius 0
  endif
endscript
script CNV_SawingClose
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = CNV_Sawing
  Obj_SetOuterRadius 10
  Obj_SetInnerRadius 0
  begin
    if not GoalManager_GetActiveGoalId
      if SkaterSpeedLessThan 1
        MakeSkaterGoto CNV_SawingOnGround
        break
      endif
    endif
    Wait 3 frames
  repeat
endscript
script CNV_SawingOnGround
  UnPauseSkaters
  PlaySkaterCamAnim name = CAM_MG_Sawing play_hold allow_pause = 1
  create_speech_box { text = [ "\b6 and \b5 to Saw,"
      "\n\b3 to replace log"
      "\nand to start the game,\n\m1 to Quit" ]
    style = speech_box_style
    pad_choose_script = Sawing_OnGround_Pad_Choose
    pad_back_script = Sawing_OnGround_Pad_Square
  }
  ClearExceptions
  ClearTrickQueue
  ClearEventBuffer
  SetRollingFriction 1000
  Obj_MoveToNode name = TRG_MG_SawNav01 orient
  if not IsAlive name = MG_Log
    Create name = MG_Log
  endif
  Kill Prefix = "TRG_NotSawing"
  Kill Prefix = "TRG_Sawing"
  Create Prefix = "TRG_SawIdle"
  PlayAnim Anim = Ped_Saw_PushIdle
  DisablePlayerInput
  if skater:Flipped
    skater:Flip
  endif
  skater:CreateSpecialItem index = 0 params = Saw_Ghost2_details bone = left_palm
  Kill name = Skater_Saw_Start
  if not IsAlive name = Skater_Saw
    Create name = Skater_Saw
  endif
endscript
script Sawing_OnGround_Pad_Choose
  MakeSkaterGoto CNV_MG_SAWING_START
endscript
script Sawing_OnGround_Pad_Square
  MakeSkaterGoto CNV_Sawing_End
endscript
script CNV_MG_SAWING_START
  speech_box_exit
   <cutcounter> = 0
   <logscut> = 0
  Create Prefix = "TRG_Sawing_"
  Kill Prefix = "TRG_SawIdle_"
  Kill name = Other_Saw_Start
  if not IsAlive name = Other_Saw_Move
    Create name = Other_Saw_Move
  endif
  UnSetFlag flag = FLAG_YOU_LOSE
  SpawnScript CNV_Sawing_Opponents
  begin
    if IsXBOX
      if Held Circle
        Kill Prefix = "TRG_Sawing_"
        KillSpawnedScript name = CNV_Sawing_Opponents
        Goto CNV_Sawing_End
        break
      endif
    else
      if IsNGC
        if Held Square
          Kill Prefix = "TRG_Sawing_"
          KillSpawnedScript name = CNV_Sawing_Opponents
          Goto CNV_Sawing_End
          break
        endif
      else
        if Held Triangle
          Kill Prefix = "TRG_Sawing_"
          KillSpawnedScript name = CNV_Sawing_Opponents
          Goto CNV_Sawing_End
          break
        endif
      endif
    endif
    if GetFlag flag = FLAG_YOU_LOSE
      Kill Prefix = "TRG_Sawing_"
      create_panel_message pos = (200, 100) rgba = [ 128 0 0 128 ] text = "You Lose!" time = 2000
      KillSpawnedScript name = CNV_Sawing_Opponents
      Goto CNV_Sawing_End
      break
    endif
    if GetFlag flag = FLAG_CUT_DONE
      UnSetFlag flag = FLAG_CUT_DONE
       <cutcounter> = ( <cutcounter> + 1 )
      Printf "And 1!"
      if ( <cutcounter> > 4 )
        PlayStream LogHitGround
         <logscut> = ( <logscut> + 1 )
        if ( <logscut> > 4 )
          create_panel_message pos = (200, 100) rgba = [ 128 128 128 128 ] text = "You Win The Wood Warriors" time = 2000
          create_panel_message pos = (200, 120) rgba = [ 128 128 128 128 ] text = "Invitational!" time = 2000
          Kill Prefix = "TRG_Sawing_"
          KillSpawnedScript name = CNV_Sawing_Opponents
          Goto CNV_Sawing_End
          break
        else
          create_panel_message pos = (200, 100) rgba = [ 128 128 128 128 ] text = "\b3 to replace log!"
        endif
        FormatText TextName = Foo "%q" q = <logscut>
        create_panel_message id = MiniGame1 text = <Foo> style = panel_message_MG_1_Low
        create_panel_message id = MiniGame2 text = "Logs Cut" style = panel_message_MG_2
        Printf "Start Over"
        Kill name = MG_Log
        Create Prefix = "LogPiece_"
         <cutcounter> = 0
      endif
    endif
    if Held x
      Printf "Triangle pressed"
      if not IsAlive name = MG_Log
        Create name = MG_Log
      endif
      Debounce x
    endif
    if IsAlive name = MG_Log
      if Held Right
        Printf "Right Pressed"
        if IsAlive name = MG_Log
          SendException EXCEPTION_SAW_RIGHT name = MG_Saw01
        endif
        Debounce Right
        PlayAnim Anim = Ped_Saw_Pull
        WaitAnimFinished
      endif
      if Held Left
        Printf "Left Pressed"
        if IsAlive name = MG_Log
          SendException EXCEPTION_SAW_LEFT name = MG_Saw01
        endif
        Debounce Left
        PlayAnim Anim = Ped_Saw_Push
        WaitAnimFinished
      endif
    endif
    Wait 1 frame
  repeat
endscript
script CNV_Sawing_End
  PlaySkaterCamAnim skater = 0 stop
  Kill Prefix = "TRG_SawIdle"
  Create Prefix = "TRG_NotSawing"
  if not IsAlive name = Other_Log
    Create name = Other_Log
  endif
  if not IsAlive name = MG_Log
    Create name = MG_Log
  endif
  if not IsAlive name = Other_Saw_Start
    Create name = Other_Saw_Start
  endif
  Kill name = Other_Saw_Move
  Kill name = Skater_Saw
  if not IsAlive name = Skater_Saw_Start
    Create name = Skater_Saw_Start
  endif
  TurnOffSpecialItem
  SpawnScript CNV_MG_EndGame
endscript
script CNV_LogPiece
  Obj_RotX speed = random( @-200 @-100 @100 @200 ) 
  Obj_RotY speed = random( @-200 @-100 @100 @200 ) 
  Obj_RotZ speed = random( @-200 @-100 @100 @200 ) 
  Obj_MoveToRelPos (0, -50, 0) speed = 10 acceleration = 10
  Obj_WaitMove
  Die
endscript
script CNV_Sawing_Ped_Push
  Obj_GetId
   <objID>:CreateSpecialItem index = 0 params = Saw_Ghost_details bone = left_palm
  begin
    Obj_CycleAnim Anim = Ped_Saw_Push
    Obj_PlayAnim Anim = Ped_Saw_PushIdle
    Wait 5 frames
    Obj_CycleAnim Anim = Ped_Saw_Pull
    Obj_PlayAnim Anim = Ped_Saw_PullIdle
    Wait 5 frames
  repeat
endscript
script CNV_Sawing_Ped_Pull
  begin
    Obj_CycleAnim Anim = Ped_Saw_Pull
    Obj_PlayAnim Anim = Ped_Saw_PullIdle
    Wait 5 frames
    Obj_CycleAnim Anim = Ped_Saw_Push
    Obj_PlayAnim Anim = Ped_Saw_PushIdle
    Wait 5 frames
  repeat
endscript
script CNV_Sawing_Ped_Idle
  begin
    Obj_CycleAnim Anim = Ped_M_Idle1 numcycles = random( @1 @2 ) 
    Obj_CycleAnim Anim = random( @Ped_M_ScratchChin @Ped_M_Talk_Shrug @Ped_M_Talk_Nod ) 
    Obj_CycleAnim Anim = Ped_M_Idle1 numcycles = random( @1 @2 ) 
    Obj_CycleAnim Anim = random( @Ped_M_Talk_WhoKnows @Ped_M_Talk_TheyWereThisBig @Ped_M_Talk_Dull ) 
  repeat
endscript
script CNV_Other_Saw
  Obj_LockToObject ObjectName = Saw_Ghost (-1, -12, -2) NoRotation
endscript
script CNV_Skater_Saw
  Obj_LockToObject ObjectName = Saw_Ghost2 (-1, -12, -2) NoRotation
endscript
script CNV_Sawing_Opponents
   <numlogs> = 0
  begin
    Wait 7.5 seconds
    Kill name = Other_Log
    Create Prefix = "Other_Piece"
     <numlogs> = ( <numlogs> + 1 )
    if ( <numlogs> > 4 )
      SetFlag flag = FLAG_YOU_LOSE
    endif
    Wait 0.5 seconds
    Create name = Other_Log
  repeat
endscript
script Cnv_MG_Shooting
  if IsCareerMode
    setup_ped_speech {
      ped_id = Cnv_MG_Shooting
      display_name = "Carnie"
      speed = 100
      inner_radius = 5
      text = [
        "Carnie:\n"
        "Hey! You!\n"
        "Wanna get in some target practice?\n"
        "Press \b3 to Accept\nPress \m1 to Decline"
      ]
      pad_choose_script = CNV_MG_ShootingClose
      pad_back_script = CNV_MG_ShootingDecline
    }
  endif
endscript
script CNV_AddMinigame_Shooting
  AddMinigame_Generic4 {
    career_only
    activate_script = cnv_shooting_activate
    deactivate_script = cnv_shooting_deactivate
  }
endscript
script CNV_MG_ShootingClose
  speech_box_exit
  if GoalManager_HasActiveGoals
    GoalManager_DeactivateAllGoals
  endif
  Wait 1 frame
  GoalManager_ActivateGoal name = cnv_goal_minigame_generic4
endscript
script CNV_MG2_EndGame
  GoalManager_DeactivateGoal name = cnv_goal_minigame_generic4
endscript
script CNV_MG_ShootingDecline
  UnPauseSkaters
  speech_box_exit
  MakeSkaterGoto SkaterInit
endscript
script cnv_shooting_activate
  MakeSkaterGoto CNV_ShootingOnGround
endscript
script cnv_shooting_deactivate
  skater:SwitchOnBoard
  UnPauseSkaters
  speech_box_exit
  MakeSkaterGoto SkaterInit
  Wait 3 frame
  PlaySkaterCamAnim skater = 0 stop
  skater:SetRollingFriction 1
  skater:EnablePlayerInput
endscript
EXCEPTION_PLAYER_FIRE = 5
script CNV_Shooting
  if IsCareerMode
    Obj_SetException ex = SkaterInRadius scr = CNV_ShootingClose
    Obj_SetInnerRadius 10
    Obj_SetOuterRadius 0
  endif
endscript
script CNV_ShootingClose
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = CNV_Shooting
  Obj_SetOuterRadius 10
  Obj_SetInnerRadius 0
  begin
    if SkaterSpeedLessThan 1
      MakeSkaterGoto CNV_ShootingOnGround
      break
    endif
    Wait 1 frame
  repeat
endscript
script Shooting_OnGround_Pad_Choose
  MakeSkaterGoto CNV_MG_Shooting_START
endscript
script Shooting_OnGround_Pad_Square
  SpawnScript CNV_MG2_EndGame
endscript
script CNV_ShootingOnGround
  UnPauseSkaters
  PlaySkaterCamAnim name = CAM_MG_Shooting play_hold allow_pause = 1
  create_speech_box { text = [ "You get 10 shots! "
      "5 points for stationary targets. "
      "10 points for moving targets. "
      "\n\b3 to Start \b1 to Quit" ]
    style = speech_box_style
    pad_choose_script = Shooting_OnGround_Pad_Choose
    pad_square_script = Shooting_OnGround_Pad_Square
  }
  ClearExceptions
  ClearTrickQueue
  ClearEventBuffer
  SetRollingFriction 1000
  Obj_MoveToNode name = TRG_MG_ShootingNav01 orient
  DisablePlayerInput
  Wait 30 frames
   <NumShots> = 10
  PlayAnim Anim = Ped_PPGun_Idle Cycle
  skater:SwitchOffBoard
  skater:TurnOnSpecialItem specialitem_details = gun_details
endscript
script CNV_MG_Shooting_START
  speech_box_exit
  if not IsAlive name = MOVINGTARGET_01
    Kill Prefix = "TARGET_"
    Create Prefix = "MOVINGTARGET_"
    Create name = SHOOTING_Crosshairs
    Create name = TRG_Score_Checker
  endif
   <NumShots> = 10
  FormatText TextName = Foo "%q" q = <NumShots>
  create_panel_message id = MiniGame1 text = <Foo> style = panel_message_MG_1_High
  create_panel_message id = MiniGame2 text = "Shots Left" style = panel_message_MG_2
  begin
    if ( <NumShots> < 1 )
      Printf "All done"
      PlaySkaterCamAnim skater = 0 stop
      SendFlag name = TRG_Score_Checker OBJ_FLAG_SHOOTING_DONE
      Wait 1 frame
      Kill Prefix = "MOVINGTARGET_"
      Create Prefix = "TARGET_"
      Kill name = TRG_Score_Checker
      Kill name = SHOOTING_Crosshairs
      SetRollingFriction 1
      EnablePlayerInput
      SpawnScript CNV_MG2_EndGame
      break
    endif
    if Held Square
      Printf "Square Pressed"
      skater:SwitchOnBoard
      PlaySkaterCamAnim skater = 0 stop
      SendFlag name = TRG_Score_Checker OBJ_FLAG_SHOOTING_DONE
      Wait 1 frame
      Kill Prefix = "MOVINGTARGET_"
      Create Prefix = "TARGET_"
      Kill name = TRG_Score_Checker
      Kill name = SHOOTING_Crosshairs
      SetRollingFriction 1
      EnablePlayerInput
      SpawnScript CNV_MG2_EndGame
      break
    endif
    if Held Circle
      Printf "Circle Pressed"
      SendException EXCEPTION_PLAYER_FIRE name = STAT_TARGET_03
       <NumShots> = ( <NumShots> - 1 )
      FormatText TextName = Foo "%q" q = <NumShots>
      create_panel_message id = MiniGame1 text = <Foo> style = panel_message_MG_1_High
      if ( <NumShots> = 1 )
        create_panel_message id = MiniGame2 text = "Shot Left" style = panel_message_MG_2
      else
        create_panel_message id = MiniGame2 text = "Shots Left" style = panel_message_MG_2
      endif
      PlayAnim Anim = Ped_PPGun_Shoot
      Debounce Circle
      WaitAnimFinished
      PlayAnim Anim = Ped_PPGun_Idle Cycle
    endif
    if Held Triangle
      Printf "Triangle Pressed"
      SendException EXCEPTION_PLAYER_FIRE name = STAT_TARGET_01
      if IsAlive name = MOVINGTARGET_01
        SendException EXCEPTION_PLAYER_FIRE name = MOVINGTARGET_01
      endif
       <NumShots> = ( <NumShots> - 1 )
      FormatText TextName = Foo "%q" q = <NumShots>
      create_panel_message id = MiniGame1 text = <Foo> style = panel_message_MG_1_High
      if ( <NumShots> = 1 )
        create_panel_message id = MiniGame2 text = "Shot Left" style = panel_message_MG_2
      else
        create_panel_message id = MiniGame2 text = "Shots Left" style = panel_message_MG_2
      endif
      PlayAnim Anim = Ped_PPGun_Shoot
      Debounce Triangle
      WaitAnimFinished
      PlayAnim Anim = Ped_PPGun_Idle Cycle
    endif
    if Held x
      Printf "X Pressed"
      SendException EXCEPTION_PLAYER_FIRE name = STAT_TARGET_02
      if IsAlive name = MOVINGTARGET_02
        SendException EXCEPTION_PLAYER_FIRE name = MOVINGTARGET_02
      endif
       <NumShots> = ( <NumShots> - 1 )
      FormatText TextName = Foo "%q" q = <NumShots>
      create_panel_message id = MiniGame1 text = <Foo> style = panel_message_MG_1_High
      if ( <NumShots> = 1 )
        create_panel_message id = MiniGame2 text = "Shot Left" style = panel_message_MG_2
      else
        create_panel_message id = MiniGame2 text = "Shots Left" style = panel_message_MG_2
      endif
      PlayAnim Anim = Ped_PPGun_Shoot
      Debounce x
      WaitAnimFinished
      PlayAnim Anim = Ped_PPGun_Idle Cycle
    endif
    Wait 1 frame
    if IsAlive name = MOVINGTARGET_01
    else
      Create name = MOVINGTARGET_01
    endif
    if IsAlive name = MOVINGTARGET_02
    else
      Create name = MOVINGTARGET_02
    endif
  repeat
endscript
script CNV_MovingTarget
  Obj_ClearExceptions
  Obj_SetException ex = EXCEPTION_PLAYER_FIRE scr = CNV_MovingTargetCheck params = <...>
  begin
    Obj_MoveToNode speed = random( @3 @5 @7  ) name = <targetnav01>
    Obj_WaitMove
    Obj_MoveToNode speed = random( @3 @5 @7  ) name = <targetnav02>
    Obj_WaitMove
  repeat
endscript
script CNV_MovingTargetCheck
  Obj_ClearExceptions
  if Obj_ObjectInRadius radius = 1.5 name = SHOOTING_Crosshairs
    Printf "You got me!"
    GoalManager_AwardMinigameCash name = cnv_goal_minigame_generic4 30
    SendFlag name = TRG_Score_Checker OBJ_FLAG_MOVING_HIT
    PlaySound GrindMetalOn pitch = random( @75 @85 @95 ) 
    Obj_MoveToRelPos (0, -200, 0) speed = 10 acceleration = 10
    Obj_WaitMove
    Die
  endif
  GotoPreserveParams CNV_MovingTarget
endscript
script CNV_Target
  Obj_ClearExceptions
  Obj_SetException ex = EXCEPTION_PLAYER_FIRE scr = CNV_TargetCheck
endscript
script CNV_TargetCheck
  Obj_ClearExceptions
  if Obj_ObjectInRadius radius = 2 name = SHOOTING_Crosshairs
    Printf "You got me!"
    GoalManager_AwardMinigameCash name = cnv_goal_minigame_generic4 15
    SendFlag name = TRG_Score_Checker OBJ_FLAG_STAT_HIT
    PlaySound GrindMetalOn pitch = random( @75 @85 @95 ) 
    Obj_RotY angle = 360 speed = 360
    Obj_WaitRotate
  else
    PlaySound Ricco2_11 pitch = random( @75 @85 @95 ) 
  endif
  Goto CNV_Target
endscript
script CNV_Crosshair
  begin
    Obj_MoveToNode { name = random( @TRG_CrossHairNav01 @TRG_CrossHairNav02 @TRG_CrossHairNav03 @TRG_CrossHairNav04 @TRG_CrossHairNav05 ) 
      speed = random( @3 @5 @7 ) 
    }
    Obj_WaitMove
  repeat
endscript
OBJ_FLAG_MOVING_HIT = 0
OBJ_FLAG_STAT_HIT = 1
OBJ_FLAG_SHOOTING_DONE = 2
script CNV_Shooting_Score
   <score> = 0
  begin
    if Obj_FlagSet OBJ_FLAG_MOVING_HIT
      Obj_ClearFlag OBJ_FLAG_MOVING_HIT
       <score> = ( <score> + 10 )
    endif
    if Obj_FlagSet OBJ_FLAG_STAT_HIT
      Obj_ClearFlag OBJ_FLAG_STAT_HIT
       <score> = ( <score> + 5 )
    endif
    if Obj_FlagSet OBJ_FLAG_SHOOTING_DONE
      FormatText TextName = Foo "%q" q = <score>
      create_panel_message id = MiniGame1 text = <Foo> style = panel_message_MG_1_High
      create_panel_message id = MiniGame2 text = "Final Score" style = panel_message_MG_2
      switch <score>
      case 100
      case 95
      case 90
      case 85
      case 80
        create_panel_message pos = (200, 120) rgba = [ 128 128 128 128 ] text = "Rank = Sharpshooter!" time = 2000
      case 75
      case 70
      case 65
      case 60
        create_panel_message pos = (200, 120) rgba = [ 128 128 128 128 ] text = "Rank = Marksman!" time = 2000
      case 55
      case 50
      case 45
      case 40
        create_panel_message pos = (200, 120) rgba = [ 128 128 128 128 ] text = "Rank = Average Shot!" time = 2000
      case 35
      case 30
      case 25
      case 20
        create_panel_message pos = (200, 120) rgba = [ 128 128 128 128 ] text = "Rank = Drunk with Gun!" time = 2000
      case 15
      case 10
      case 5
      case 0
        create_panel_message pos = (200, 120) rgba = [ 128 128 128 128 ] text = "Rank = Blind Man!" time = 2000
      endswitch
      break
    endif
    Wait 1 frame
    Printf "score"
  repeat
endscript
