script Jnk_Setup
endscript
script Jnk_Startup
  Jnk_LoadSounds
  if InMultiplayerGame
    add_multiplayer_mode_goals
  endif
  LoadSound "Shared\Hits\HitFlimsyWood_11" vol = 100 dropoff = 50
  LoadSound "Shared\Misc\LA_GratesOpen"
  LoadSound "Shared\Hits\HitGlassPane2x" vol = 100 dropoff = 50
  LoadSound "Shared\Water\FallWater" vol = 100 dropoff = 50
  LoadSound "Shared\misc\explode1_11" vol = 100
  LoadSound "Shared\misc\ricco1_11" vol = 100
  LoadSound "Shared\misc\ricco2_11" vol = 100
  LoadSound "Jnk\dieselgenerator" vol = 100 dropoff = 50
  LoadSound "Jnk\buoybellring"
  LoadSound "Jnk\buoymvmtloop" vol = 200 dropoff = 150
  LoadSound "Shared\Hits\HitOrangeCone"
  LoadSound "Shared\Hits\SmashWoodQP" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\HitMetalCan_11"
  LoadSound "Shared\Hits\HitTrashCanDebris"
  LoadSound "Shared\Water\SewagePipeLoop" vol = 80 dropoff = 100 PosUpdate
  LoadSound "Jnk\magnethum2" PosUpdate
  LoadSound "Jnk\GeneratorWobble" vol = 80 dropoff = 50 PosUpdate
  LoadSound "Jnk\TrainLoop" vol = 100 dropoff = 100 PosUpdateWithDoppler
  LoadSound "Shared\Misc\Gunshot01" vol = 100
  LoadSound "Shared\Animal\DogWhimper"
  if ( ( IsXBOX ) or ( IsNGC ) )
    Kill name = Jnk_Go_Ground_Puddle02_Iri
    Kill name = Jnk_Go_Ground_Puddle01_Iri
    Kill name = Jnk_Go_Ground_Trailor_Iri
    Kill name = Jnk_Go_Ground_Puddle03_Iri
    Kill name = Jnk_Go_Ground_B_Oil01
    Kill name = Jnk_Go_Ground_B_Oil02
    Kill name = Jnk_Go_Crgo_A_Qrtr_04_Iri
    Kill name = Jnk_Go_Crgo_A_QrtrRmp_01_Iri
    Kill name = Jnk_Go_Crgo_A_Qrtr_03_Iri
  endif
endscript
script Jnk_LoadSounds
endscript
script Jnk_Goals
  if not InSplitScreenGame
    if not GameModeEquals is_singlesession
      Jnk_AddGoal_HighScore
      Jnk_AddGoal_Skate
      Jnk_AddGoal_Combo
      Jnk_AddGoal_Trickspot2
      Jnk_AddGoal_Gaps3
      Jnk_AddGoal_Counter
      Jnk_AddGoal_Counter2
      Jnk_AddGoal_Collect
      Jnk_AddGoal_Race
      Jnk_AddGoal_Kill
      Jnk_AddGoal_ProScore
      Jnk_AddGoal_MedCombo
      Jnk_AddGoal_Tetris
      Jnk_AddGoal_Trickspot
      Jnk_AddGoal_Competition
      Jnk_AddGoal_Gaps2
      Jnk_AddGoal_Gaps4
      Jnk_AddGoal_SickScore
      Jnk_AddGoal_ProCombo
      Jnk_AddGoal_Race2
      Jnk_AddGoal_Gaps
      Jnk_AddGoal_Counter3
      Jnk_AddGoal_Gaps5
      Jnk_AddGoal_Gaps6
    endif
  endif
endscript
script Jnk_AddGoal_Competition
  AddGoal_Competition {
    CAREER_ONLY
    Goal_Text = "Competition: Medal the barges"
    View_Goals_Text = "Competition: Medal the barges"
    Pro = "DockWorker"
    full_name = "Dockworker"
    Gold = 95
    Silver = 85
    Bronze = 70
    Time = 60
    Gold_score = Jnk_comp_gold
    Silver_score = Jnk_comp_silver
    Bronze_score = Jnk_comp_bronze
    Bail = 7
    Unlocked_By_Another
    Start_Cam_Anim = G_COMP_CameraStart
    Goal_Start_Script = Jnk_COMP_Start
    Goal_Deactivate_Script = Jnk_COMP_Deactivate
    Goal_Description = Jnk_Competition_Desc
  }
endscript
script Jnk_AddGoal_Combo
  AddGoal_Combo {
    Goal_Text = "Collect C-O-M-B-O"
    View_Goals_Text = "Collect C-O-M-B-O"
    Pro = "Andrew"
    full_name = "Andrew Reynolds"
    Reward_Goal = Jnk_Goal_MedCombo
    Start_Cam_Anim = G_Combo_CameraStart
    Goal_Description = Jnk_Combo_Desc
  }
endscript
script Jnk_AddGoal_MedCombo
  AddGoal_MedCombo {
    Goal_Text = "Collect High C-O-M-B-O"
    View_Goals_Text = "Collect High C-O-M-B-O"
    Pro = "Andrew"
    full_name = "Andrew Reynolds"
    Unlocked_By_Another
    Start_Cam_Anim = G_CounterCombo_CameraStart
    Goal_Intro_Script = Jnk_MedCombo_Intro
    Goal_Description = Jnk_CounterCombo_Desc
  }
endscript
script Jnk_AddGoal_ProCombo
  AddGoal_ProCombo {
    Goal_Text = "Collect Pro C-O-M-B-O"
    View_Goals_Text = "Collect Pro C-O-M-B-O"
    Pro = "Andrew"
    full_name = "Andrew Reynolds"
    Pro_Goal
    Start_Cam_Anim = G_ProLine_CameraStart
    Goal_Description = Jnk_ProCombo_Desc
  }
endscript
script Jnk_AddGoal_Skate
  AddGoal_Skate {
    Time = 120 seconds
    Goal_Text = "Collect S-K-A-T-E"
    View_Goals_Text = "Collect S-K-A-T-E"
    Pro = "SecurityGuard"
    full_name = "Security Guard"
    Start_Cam_Anim = G_Skate_CameraStart
    Goal_Description = Jnk_Skate_Desc
  }
endscript
script Jnk_AddGoal_HighScore
  AddGoal_HighScore {
    Time = 120 seconds
    Goal_Text = Jnk_highscore_text
    View_Goals_Text = Jnk_highscore_text
    Score = Jnk_highscore_score
    Pro = "SkaterKid"
    full_name = "Skater Kid"
    Reward_Goal = Jnk_Goal_ProScore
    Goal_Description = Jnk_HighScore_Desc
  }
endscript
script Jnk_AddGoal_ProScore
  AddGoal_ProScore {
    Time = 120 seconds
    Goal_Text = Jnk_proscore_text
    View_Goals_Text = Jnk_proscore_text
    Score = Jnk_proscore_score
    Pro = "SkaterKid"
    full_name = "Skater Kid"
    Unlocked_By_Another
    Goal_Description = Jnk_ProScore_Desc
  }
endscript
script Jnk_AddGoal_SickScore
  AddGoal_SickScore {
    Time = 120 seconds
    Goal_Text = Jnk_sickscore_text
    View_Goals_Text = Jnk_sickscore_text
    Score = Jnk_sickscore_score
    Pro = "SkaterKid"
    full_name = "Skater Kid"
    Pro_Goal
    Start_Cam_Anim = G_SS_CameraStart
    Goal_Description = Jnk_SickScore_Desc
  }
endscript
script Jnk_AddGoal_Counter
  AddGoal_Counter {
    Time = 30 seconds
    Goal_Text = "Slap the buoy"
    View_Goals_Text = "Slap the buoy"
    Use_Hud_Counter
    Number = 5
    Pro = "DockWorker"
    full_name = "Dockworker"
    Start_Cam_Anim = G_Counter_CameraStart
    Goal_Intro_Script = Jnk_Counter_Intro
    Goal_Start_Script = Jnk_Counter_Start
    Goal_Outro_Script = Jnk_Counter_Outro
    Goal_Deactivate_Script = Jnk_Counter_Deactivate
    Goal_Description = Jnk_Counter_Desc
  }
endscript
script Jnk_AddGoal_Counter2
  AddGoal_Counter2 {
    CAREER_ONLY
    Time = 10 seconds
    Goal_Text = "Welders need food badly"
    View_Goals_Text = "Welder lunch delivery"
    Use_Hud_Counter
    Number = 5
    Trigger_Prefix = "TRG_G_Counter2_Welder"
    Pro = "DeliveryGuy"
    full_name = "Delivery Guy"
    Start_Cam_Anim = G_Counter2_CameraStart
    Goal_Intro_Script = Jnk_Counter2_Intro
    Goal_Deactivate_Script = Jnk_Counter2_Deactivate
    Goal_Description = Jnk_Counter2_Desc
  }
endscript
script Jnk_AddGoal_Collect
  AddGoal_Collect {
    Time = 30 seconds
    Goal_Text = "Collect the rivets"
    View_Goals_Text = "Collect the rivets"
    Use_Hud_Counter
    Pro = "Foreman"
    full_name = "Foreman"
    Reward_Goal = Jnk_Goal_Comp
    Start_Cam_Anim = G_Collect_CameraStart
    Goal_Description = Jnk_Collect_Desc
    Trigger_Prefix = "TRG_G_COLLECT_Rivet"
    Goal_Flags = [
      got_01
      got_02
      got_03
      got_04
      got_05
      got_06
      got_07
      got_09
      got_10
      got_11
      got_12
      got_13
      got_14
      got_15
      got_16
      got_17
      got_18
      got_19
      got_20
      got_21
      got_22
    ]
    Goal_Collect_Objects = [
      { id = TRG_G_COLLECT_Rivet_01 scr = Goal_Jnk_Collect_Got_Rivet flag = got_01 }
      { id = TRG_G_COLLECT_Rivet_02 scr = Goal_Jnk_Collect_Got_Rivet flag = got_02 }
      { id = TRG_G_COLLECT_Rivet_03 scr = Goal_Jnk_Collect_Got_Rivet flag = got_03 }
      { id = TRG_G_COLLECT_Rivet_04 scr = Goal_Jnk_Collect_Got_Rivet flag = got_04 }
      { id = TRG_G_COLLECT_Rivet_05 scr = Goal_Jnk_Collect_Got_Rivet flag = got_05 }
      { id = TRG_G_COLLECT_Rivet_06 scr = Goal_Jnk_Collect_Got_Rivet flag = got_06 }
      { id = TRG_G_COLLECT_Rivet_07 scr = Goal_Jnk_Collect_Got_Rivet flag = got_07 }
      { id = TRG_G_COLLECT_Rivet_09 scr = Goal_Jnk_Collect_Got_Rivet flag = got_09 }
      { id = TRG_G_COLLECT_Rivet_10 scr = Goal_Jnk_Collect_Got_Rivet flag = got_10 }
      { id = TRG_G_COLLECT_Rivet_11 scr = Goal_Jnk_Collect_Got_Rivet flag = got_11 }
      { id = TRG_G_COLLECT_Rivet_12 scr = Goal_Jnk_Collect_Got_Rivet flag = got_12 }
      { id = TRG_G_COLLECT_Rivet_13 scr = Goal_Jnk_Collect_Got_Rivet flag = got_13 }
      { id = TRG_G_COLLECT_Rivet_14 scr = Goal_Jnk_Collect_Got_Rivet flag = got_14 }
      { id = TRG_G_COLLECT_Rivet_15 scr = Goal_Jnk_Collect_Got_Rivet flag = got_15 }
      { id = TRG_G_COLLECT_Rivet_16 scr = Goal_Jnk_Collect_Got_Rivet flag = got_16 }
      { id = TRG_G_COLLECT_Rivet_17 scr = Goal_Jnk_Collect_Got_Rivet flag = got_17 }
      { id = TRG_G_COLLECT_Rivet_18 scr = Goal_Jnk_Collect_Got_Rivet flag = got_18 }
      { id = TRG_G_COLLECT_Rivet_19 scr = Goal_Jnk_Collect_Got_Rivet flag = got_19 }
      { id = TRG_G_COLLECT_Rivet_20 scr = Goal_Jnk_Collect_Got_Rivet flag = got_20 }
      { id = TRG_G_COLLECT_Rivet_21 scr = Goal_Jnk_Collect_Got_Rivet flag = got_21 }
      { id = TRG_G_COLLECT_Rivet_22 scr = Goal_Jnk_Collect_Got_Rivet flag = got_22 }
    ] }
endscript
script Jnk_AddGoal_Trickspot
  AddGoal_Special {
    CAREER_ONLY
    Trigger_obj_id = TRG_G_TS_PhotoGuy
    Restart_node = TRG_G_TS_RestartNode
    Start_pad_id = G_TS_StartPad
    Special_gap
    Trick_name = Trick_HeelflipFSInvert
    Trick_type = lip
    reward_trickslot
    Time = 120 seconds
    Goal_Text = "Heelflip FS Invert (\k1) the freight container lip, then ride from bowl to bowl"
    View_Goals_Text = "Heelflip FS Invert the freight container"
    Pro = "Bucky"
    full_name = "Buck Lasek"
    Unlocked_By_Another
    Start_Cam_Anim = G_TS_CameraStart
    Goal_Intro_Script = Jnk_TS_Intro
    Goal_Start_Script = Jnk_TS_Start
    Goal_Deactivate_Script = Jnk_TS_Deactivate
    Goal_Description = Jnk_Special_Desc
  }
endscript
script Jnk_AddGoal_Trickspot2
  AddGoal_Trickspot2 {
    Goal_Text = "Varial kickflip the shack water gap"
    View_Goals_Text = "Varial kickflip the shack water gap"
    Pro = "Rune"
    full_name = "Rune Glifberg"
    Reward_Goal = Jnk_Goal_Tetris
    Start_Cam_Anim = G_TS2_CameraStart
    Goal_Intro_Script = Jnk_TS2_Intro
    Goal_Start_Script = Jnk_TS2_Start
    Goal_Description = Jnk_TrickSpot2_Desc
    Goal_Flags = [ got_01 ]
    required_tricks = [ Trick_VarialKickflip ]
    CAREER_ONLY
  }
endscript
script Jnk_AddGoal_Race
  AddGoal_Race {
    CAREER_ONLY
    Goal_Text = "Dog Chase"
    View_Goals_Text = "Dog Chase"
    Number = 5
    Trigger_Prefix = "TRG_G_Race_RaceIcon"
    Pro = "SecurityGuard"
    full_name = "Security Guard"
    Start_Cam_Anim = G_Race_CameraStart
    Goal_Intro_Script = Jnk_Race_Intro
    Goal_Start_Script = Jnk_Race_Start
    Goal_Deactivate_Script = Jnk_Race_Deactivate
    Goal_Description = Jnk_Race_Desc
    Goal_Flags = [ got_01
      got_02
      got_03
      got_04
      got_05
      got_06 ]
    Race_Waypoints = [ { id = Trg_G_RACE_RaceNav_01 scr = nullscript flag = got_01 Time = 3 }
      { id = Trg_G_RACE_RaceNav_02 scr = nullscript flag = got_02 Time = 2 }
      { id = Trg_G_RACE_RaceNav_03 scr = nullscript flag = got_03 Time = 2 }
      { id = Trg_G_RACE_RaceNav_04 scr = nullscript flag = got_04 Time = 2 }
      { id = Trg_G_RACE_RaceNav_05 scr = nullscript flag = got_05 Time = 2 } ]
    record_type = none
  }
endscript
script Jnk_AddGoal_Race2
  AddGoal_Race2 {
    CAREER_ONLY
    Goal_Text = "Rat Race: Catch the rat"
    View_Goals_Text = "Rat Race: Catch the rat"
    Number = 5
    Trigger_Prefix = "TRG_G_RACE2_RaceIcon_01"
    Pro = "Rune"
    full_name = "Rune Glifberg"
    Pro_Goal
    Start_Cam_Anim = G_Race2_CameraStart
    Goal_Intro_Script = Jnk_Race2_Intro
    Goal_Start_Script = Jnk_Race2_Start
    Goal_Deactivate_Script = Jnk_Race2_Deactivate
    Goal_Description = Jnk_Race2_Desc
    Goal_Flags = [
      got_01
      got_02
      got_03
      got_04
      got_05
      got_06
      got_07
      got_08
      got_09
      got_10 ]
    Race_Waypoints = [
      { id = Trg_G_RACE2_RaceNav_01 scr = nullscript flag = got_01 Time = 15 }
      { id = Trg_G_RACE2_RaceNav_02 scr = nullscript flag = got_02 Time = 5 }
      { id = Trg_G_RACE2_RaceNav_03 scr = nullscript flag = got_03 Time = 5 }
      { id = Trg_G_RACE2_RaceNav_04 scr = nullscript flag = got_04 Time = 2 }
      { id = Trg_G_RACE2_RaceNav_05 scr = nullscript flag = got_05 Time = 2 }
      { id = Trg_G_RACE2_RaceNav_06 scr = nullscript flag = got_06 Time = 2 }
      { id = Trg_G_RACE2_RaceNav_07 scr = nullscript flag = got_07 Time = 2 }
      { id = Trg_G_RACE2_RaceNav_08 scr = nullscript flag = got_08 Time = 2 }
      { id = Trg_G_RACE2_RaceNav_09 scr = nullscript flag = got_09 Time = 2 }
      { id = Trg_G_RACE2_RaceNav_10 scr = nullscript flag = got_10 Time = 2 } ]
  }
endscript
script Jnk_AddGoal_Tetris
  AddGoal_Tetris {
    Time = 60
    Goal_Text = "Bust tricks across the rooftop gap"
    View_Goals_Text = "Bust tricks across the rooftop gap"
    Pro = "Rune"
    full_name = "Rune Glifberg"
    ProSet_prefix = "ProSet1_"
    Unlocked_By_Another
    Start_Cam_Anim = G_Tetris_CameraStart
    Goal_Description = Jnk_Tetris_Desc
    Goal_tetris_key_combos = [
      Air_CircleD
      Air_CircleDL
      Air_CircleDR
      Air_CircleL
      Air_CircleR
      Air_CircleU
      Air_CircleUL
      Air_CircleUR
      Air_D_D_Circle
      Air_R_R_Square
      Air_SquareD
      Air_SquareDL
      Air_SquareDR
      Air_SquareL
      Air_SquareR
      Air_SquareU
      Air_SquareUL
      Air_SquareUR
      Air_U_U_Circle
      Air_U_U_Square
    ]
    Acceleration_interval = 5
    Acceleration_percent = 0.05
    Kill_radius = 200
    Trick_Flag = 0
    time_to_stop_adding_tricks = 20
  }
endscript
script Jnk_AddGoal_Gaps
  AddGoal_Gaps {
    CAREER_ONLY
    Goal_Text = "Liptrick transfer"
    View_Goals_Text = "Liptrick transfer"
    Pro = "Bucky"
    full_name = "Bucky Lasek"
    Pro_Goal
    Start_Cam_Anim = G_Gap_CameraStart
    Goal_Intro_Script = Jnk_Gap_Intro
    Goal_Deactivate_Script = Jnk_Gap_Deactivate
    Goal_Success_Script = Jnk_Gap_Success
    Goal_Description = Jnk_Gaps_Desc
    Goal_Flags = [ got_01 ]
  }
endscript
script Jnk_AddGoal_Gaps2
  AddGoal_Gaps2 {
    CAREER_ONLY
    Time = 40 seconds
    Goal_Text = "Manual combo the train"
    View_Goals_Text = "Manual combo the train"
    Pro = "Mechanic"
    full_name = "Mechanic"
    Unlocked_By_Another
    Start_Cam_Anim = G_Gap2_CameraStart
    Goal_Intro_Script = Jnk_Gap2_Intro
    Goal_Start_Script = Jnk_Gap2_Start
    Goal_Outro_Script = Jnk_Gap2_Outro
    Goal_Deactivate_Script = Jnk_Gap2_Deactivate
    Goal_Description = Jnk_Gaps2_Desc
    Goal_Flags = [ got_01 ]
  }
endscript
script Jnk_AddGoal_Kill
  AddGoal_Kill {
    Time = 120 seconds
    Goal_Text = Jnk_kill_text
    View_Goals_Text = Jnk_kill_text
    Use_Hud_Counter
    Pro = "Foreman"
    full_name = "Foreman"
    Score = Jnk_kill_score
    Reward_Goal = Jnk_Goal_Gaps2
    Start_Cam_Anim = G_Kill_CameraStart
    Goal_Description = Jnk_Kill_Desc
    Goal_Flags = [
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
      got_11
      got_12
      got_13
      got_14
      got_15
      got_16
      got_17
      got_18
      got_19
      got_20
      got_21
    ]
    Kill_clusters = [
      { id = Jnk_KillSpot_01 flag = got_01 }
      { id = Jnk_KillSpot_02 flag = got_02 }
      { id = Jnk_KillSpot_03 flag = got_03 }
      { id = Jnk_KillSpot_04 flag = got_04 }
      { id = Jnk_KillSpot_05 flag = got_05 }
      { id = Jnk_KillSpot_06 flag = got_06 }
      { id = Jnk_KillSpot_07 flag = got_07 }
      { id = Jnk_KillSpot_08 flag = got_08 }
      { id = Jnk_KillSpot_09 flag = got_09 }
      { id = Jnk_KillSpot_10 flag = got_10 }
      { id = Jnk_KillSpot_11 flag = got_11 }
      { id = Jnk_KillSpot_12 flag = got_12 }
      { id = Jnk_KillSpot_13 flag = got_13 }
      { id = Jnk_KillSpot_14 flag = got_14 }
      { id = Jnk_KillSpot_15 flag = got_15 }
      { id = Jnk_KillSpot_16 flag = got_16 }
      { id = Jnk_KillSpot_17 flag = got_17 }
      { id = Jnk_KillSpot_18 flag = got_18 }
      { id = Jnk_KillSpot_19 flag = got_19 }
      { id = Jnk_KillSpot_20 flag = got_20 }
      { id = Jnk_KillSpot_21 flag = got_21 }
    ] }
endscript
script Jnk_AddGoal_Counter3
  AddGoal_Counter3 {
    CAREER_ONLY
    Goal_Text = "Do a 10,000 point combo"
    Number = 5
    Time = 240
    Pro_specific_challenge
    Pro_challenge_title = "Rusty Old Ramp"
    Pro_challenge_text = "Bucky is no stranger to gnarly, broken down ramps. Raised near Baltimore's Landsdown Cement Park and on the infamous 'Hell Ramp', if a ramp is still standing - Bucky will rip it up."
    Pro_challenge_tag_line = "Beware of falling objects..."
    Pro_challenge_pro_name = "Bucky"
    Unlocked_By_Another
    Geo_prefix = "Bucky_"
    Start_Cam_Anim = G_COUNTER3_CameraStart
    Pro = "PhotoGuy"
    full_name = "Atiba Jefferson"
    Goal_Description = Jnk_Counter3_Desc
    Goal_Outro_Script = Jnk_Goal_Counter3_Outro
    Goal_Deactivate_Script = Jnk_Goal_Counter3_Deactivate
    View_Goals_Text = "Bucky's Pro specific challenge"
  }
endscript
script Jnk_AddGoal_Gaps3
  AddGoal_Gaps3 {
    CAREER_ONLY
    Time = 120 seconds
    Goal_Text = "Gap across the suspended containers"
    View_Goals_Text = "Gap across the suspended containers"
    Pro = "Bucky"
    full_name = "Bucky Lasek"
    Reward_Goal = Jnk_Goal_Special
    Start_Cam_Anim = G_Gap3_CameraStart
    Success_Cam_Anim = G_Gap3_CameraSuccess
    Goal_Intro_Script = Jnk_Gap3_Intro
    Goal_Start_Script = Jnk_Gap3_Start
    Goal_Deactivate_Script = Jnk_Gap3_Deactivate
    Goal_Description = jnk_gaps3_desc
    Goal_Flags = [ got_01 ]
  }
endscript
script Jnk_AddGoal_Gaps4
  AddGoal_Gaps4 {
    CAREER_ONLY
    Time = 120 seconds
    Goal_Text = "Gap the suspended containers"
    View_Goals_Text = "Gap the suspended containers"
    Pro = "Foreman"
    full_name = "Foreman"
    Pro_Goal
    Goal_Intro_Script = Jnk_Gap4_Intro
    Goal_Start_Script = Jnk_Gap4_Start
    Goal_Deactivate_Script = Jnk_Gap4_Deactivate
    Goal_Description = jnk_gaps4_desc
    Goal_Flags = [ got_01 ]
  }
endscript
script Jnk_COMP_Start
endscript
script Jnk_COMP_Deactivate
endscript
script Jnk_COMP_Entering
  Goal_comp_enter_area goal_id = Jnk_Goal_Comp
endscript
script Jnk_COMP_Leaving
  Goal_comp_leave_area goal_id = Jnk_Goal_Comp
endscript
script Jnk_MedCombo_Intro
  if GetFlag flag = FLAG_G_COMP_GEO_ON
    UnSetFlag flag = FLAG_G_COMP_GEO_ON
    toggle_geo_nomenu bit = 5 param_id = toggle_comp_geo_params flag = FLAG_G_COMP_GEO_ON Geo_prefix = "G_COMP_" trg_prefix = "TRG_G_COMP_" geo_not_prefix = "G_COMPNOT_" trg_not_prefix = "TRG_G_COMPNOT_" id = toggle_comp_geo
  endif
endscript
script Jnk_CounterCombo_Intro
endscript
script Jnk_CounterCombo_Deactivate
endscript
script Jnk_CounterCombo_Node
  Obj_SetException ex = SkaterInRadius scr = Jnk_CounterCombo_Got
  Obj_SetInnerRadius 10
  Obj_RotY speed = 250
  Obj_Hover Amp = 10 Freq = 1
endscript
script Jnk_CounterCombo_Got
  GoalManager_GotCounterObject name = Jnk_Goal_CounterCombo
  PlaySound GapSound
  Die
endscript
script Jnk_Counter_Intro
  Create prefix = "TRG_Veh_Shp_Trn_Bin_Intro"
endscript
script Jnk_Counter_Start
  Create prefix = "Jnk_Go_Trn_Bin"
  Kill prefix = "TRG_Veh_Shp_Trn_Bin_Intro"
  Kill prefix = "TRG_Veh_Shp_Trn_A"
endscript
script Jnk_Counter_Outro
  Wait 0.5 seconds
  Create prefix = "TRG_Veh_Shp_Trn_Bin_Outro"
endscript
script Jnk_Counter_Deactivate
  Kill prefix = "TRG_Veh_Shp_Trn_Bin"
  Kill prefix = "Jnk_Go_Trn_Bin"
  Create name = TRG_Veh_Shp_Trn_A
endscript
FLAG_TRN_COUNTER = 1
script Jnk_Trn_Counter_Intro
  Kill name = TRG_Veh_Shp_Trn_A
  SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_UP
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_22 Time = 5
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_21 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_DOWN
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_20 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_19 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_18 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_17 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_16 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_15 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_14 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_12 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_13 Time = 5
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_Bin_00 Time = 5
  Obj_WaitMove
  Die
endscript
script Jnk_Trn_Counter_Outro
  Kill prefix = "Jnk_Go_Trn_Bin"
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_13 Time = 5
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_12 Time = 5
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_14 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_15 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_16 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_17 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_18 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_19 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_20 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_UP
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_21 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_22 Time = 1
  Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_23 Time = 5
  Wait 4 second
  SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_DOWN
  Obj_WaitMove
  Obj_ClearFlag FLAG_TRN_COUNTER
  Wait 1 second
  Die
endscript
FLAG_TRN_Bin_Wall = 1
script Jnk_Trn_Bin_Wall_A
  Obj_Rotate Time = 0.5 relative = (90, 0, 0) FLAG_MAX_COORDS
  begin
    Wait 5 gameframes
    if Obj_FlagSet FLAG_TRN_Bin_Wall
      Obj_Rotate Time = 0.5 relative = (-90, 0, 0) FLAG_MAX_COORDS
    endif
  repeat
endscript
script Jnk_Trn_Bin_Wall_B
  Obj_Rotate Time = 0.5 relative = (-90, 0, 0) FLAG_MAX_COORDS
  begin
    Wait 5 gameframes
    if Obj_FlagSet FLAG_TRN_Bin_Wall
      Obj_Rotate Time = 0.5 relative = (90, 0, 0) FLAG_MAX_COORDS
    endif
  repeat
endscript
script Jnk_Counter2_Intro
  Kill prefix = "Ped_Welder"
endscript
script Jnk_Counter2_Deactivate
  Create prefix = "Ped_Welder"
  if IsAlive name = TRG_G_Counter2_Welder_01
    KillTheArrow id = TRG_G_Counter2_Welder_01
  endif
  if IsAlive name = TRG_G_Counter2_Welder_02
    KillTheArrow id = TRG_G_Counter2_Welder_02
  endif
  if IsAlive name = TRG_G_Counter2_Welder_03
    KillTheArrow id = TRG_G_Counter2_Welder_03
  endif
  if IsAlive name = TRG_G_Counter2_Welder_04
    KillTheArrow id = TRG_G_Counter2_Welder_04
  endif
  if IsAlive name = TRG_G_Counter2_Welder_05
    KillTheArrow id = TRG_G_Counter2_Welder_05
  endif
endscript
script Jnk_Counter2_Node
  Obj_SetException ex = SkaterInRadius scr = Jnk_Counter2_Got
  Obj_SetInnerRadius 10
  Jnk_AddGoalArrow
endscript
script Jnk_AddGoalArrow
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
script Jnk_Counter2_Got
  GoalManager_GotCounterObject name = Jnk_Goal_Counter2
  PlaySound GapSound
  Die
endscript
script Jnk_Welder_Idle
  begin
    Obj_PlayAnim anim = random( @Ped_Weld_LookUp @Ped_Weld_Squat ) 
    Obj_WaitAnimFinished
    Obj_PlayAnim anim = random( @Ped_Weld_LookUp @Ped_Weld_Squat ) 
    Obj_WaitAnimFinished
    Obj_PlayAnim anim = random( @Ped_Weld_LookUp @Ped_Weld_Squat ) 
    Obj_WaitAnimFinished
    Obj_PlayAnim anim = random( @ ) Ped_Weld_SquatToStand
    Obj_WaitAnimFinished
    Obj_PlayAnim anim = random( @ ) Ped_Weld_SquatFromStand
    Obj_WaitAnimFinished
  repeat
endscript
script Goal_Jnk_Collect_Got_Rivet
  Obj_ClearExceptions
  PlaySound GapSound vol = 100
  GoalManager_SetGoalFlag name = <goal_id> <flag> 1
  Die
endscript
script Jnk_TS_Intro
  Kill prefix = "TRG_Crane03"
  Create prefix = "TRG_Crane03"
endscript
script Jnk_TS_Start
endscript
script Jnk_TS_Deactivate
  Kill prefix = "TRG_Crane03"
  Create prefix = "TRG_Crane03"
endscript
script Goal_Jnk_TrickspotEntranceTrigger1
  if TriggerType [ TRIGGER_SKATE_ONTO TRIGGER_LAND_ON ]
    EndGap GapID = goal_Backside360NoseComplyTransfer_2
  else
    StartGap GapID = goal_Backside360NoseComplyTransfer_1 flags = [ cancel_ground require_lip ] tricktext = "Heelflip FS Invert" trickscript = Goal_Jnk_Trickspot_Got_Gap1
  endif
endscript
script Goal_Jnk_TrickspotExitTrigger1
  if TriggerType [ TRIGGER_SKATE_ONTO TRIGGER_LAND_ON ]
    EndGap GapID = goal_Backside360NoseComplyTransfer_1
  else
    StartGap GapID = goal_Backside360NoseComplyTransfer_2 flags = [ cancel_ground require_lip ] tricktext = "Heelflip FS Invert" trickscript = Goal_Jnk_Trickspot_Got_Gap1
  endif
endscript
script Goal_Jnk_Trickspot_Got_Gap1
  if GoalManager_GoalIsActive name = Jnk_Goal_Special
    GoalManager_WinGoal name = Jnk_Goal_Special
  endif
endscript
FLAG_TRICKSPOT_DCK_CRNE = 1
script Jnk_Trickspot_Dck_Crne_B
  Printf "### trickspot goal being called ###"
  begin
    begin
      if Obj_FlagSet FLAG_TRICKSPOT_DCK_CRNE
        break
      else
      endif
      Wait 6 Frame
    repeat
    Obj_ClearFlag FLAG_TRICKSPOT_DCK_CRNE
    Obj_MoveToNode name = TRG_WP_Dck_Crne_B_01 Time = 8.5
    Obj_WaitMove
    begin
      if Obj_FlagSet FLAG_TRICKSPOT_DCK_CRNE
        break
      else
      endif
      Wait 6 Frame
    repeat
    Obj_ClearFlag FLAG_TRICKSPOT_DCK_CRNE
    Obj_MoveToNode name = TRG_WP_Dck_Crne_B_00 Time = 8.5
    Obj_WaitMove
  repeat
endscript
script Jnk_Trickspot_Dck_Crne_B_SendFlag
  if GoalManager_GoalIsActive name = Jnk_Goal_Special
    if TriggerType [ TRIGGER_LIP_ON ]
      SendFlag name = TRG_Crane03_Base FLAG_TRICKSPOT_DCK_CRNE
    endif
  endif
endscript
script Goal_Jnk_Trickspot2EntranceTrigger1
  StartGap GapID = goal_VarialKickflip_1 flags = [ cancel_ground cancel_rail ] tricktext = "Varial Kickflip" trickscript = Goal_Jnk_Trickspot2_Got_Gap1
  EndGap GapID = goal_VarialKickflip_2 text = "Varial kickflip across the shack water gap"
endscript
script Goal_Jnk_Trickspot2ExitTrigger1
  StartGap GapID = goal_VarialKickflip_2 flags = [ cancel_ground cancel_rail ] tricktext = "Varial Kickflip" trickscript = Goal_Jnk_Trickspot2_Got_Gap1
  EndGap GapID = goal_VarialKickflip_1 text = "Varial kickflip across the shack water gap"
endscript
script Goal_Jnk_Trickspot2_Got_Gap1
  if GoalManager_GoalIsActive name = Jnk_Goal_Trickspot2
    if GoalManager_SetGoalFlag name = Jnk_Goal_Trickspot2 got_01 1
    endif
  endif
endscript
script Jnk_Race_WayPoint_01
  Race_flag = got_01
  Obj_SetInnerRadius 6
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race_WayPointGotten params = { <...> }
endscript
script Jnk_Race_WayPoint_02
  Race_flag = got_02
  Obj_SetInnerRadius 6
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race_WayPointGotten params = { <...> }
endscript
script Jnk_Race_WayPoint_03
  Race_flag = got_03
  Obj_SetInnerRadius 6
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race_WayPointGotten params = { <...> }
endscript
script Jnk_Race_WayPoint_04
  Race_flag = got_04
  Obj_SetInnerRadius 6
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race_WayPointGotten params = { <...> }
endscript
script Jnk_Race_WayPoint_05
  Race_flag = got_05
  Obj_SetInnerRadius 6
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race_WayPointGotten params = { <...> }
endscript
script Jnk_Race_WayPointGotten
  Obj_ClearExceptions
  PlaySound DogWhimper
  GoalManager_SetGoalFlag name = jnk_goal_race <Race_flag> 1
  GoalManager_NextRaceWaypoint name = jnk_goal_race
  Wait 1 Frame
  Die
endscript
script Jnk_Race2_Intro
  Create name = TRG_G_Race2_Rat
  Create prefix = "TRG_G_Race2_Shck_Crne"
  Kill prefix = "TRG_Veh_Shp_Shck_Crne"
endscript
script Jnk_Race2_Start
endscript
script Jnk_Race2_Deactivate
  Kill prefix = "TRG_G_RACE2_RaceIcon"
  Kill name = TRG_G_Race2_Rat
  Kill prefix = "TRG_G_Race2_Shck_Crne"
  Create prefix = "TRG_Veh_Shp_Shck_Crne"
endscript
FLAG_RACE2_RACEICON_01 = 1
script Jnk_Race2_Rat_Stop
  Obj_StopAlongPath 2
endscript
script Jnk_Race2_Rat
  Obj_PlayAnim anim = idle cycle
  Wait 3 seconds
  Obj_SetPathAcceleration 0
  Obj_SetPathDeceleration 0
  Obj_SetPathVelocity 80
  Obj_SetPathTurnDist 0
  Obj_FollowPath name = TRG_G_RACE2_WP_01
  begin
    if Obj_FlagSet FLAG_RACE2_RACEICON_01
      break
    else
    endif
    Wait 1 Frame
  repeat
  Obj_ClearFlag FLAG_RACE2_RACEICON_01
  Obj_StartAlongPath
  begin
    if Obj_FlagSet FLAG_RACE2_RACEICON_01
      break
    else
    endif
    Wait 1 Frame
  repeat
  Obj_ClearFlag FLAG_RACE2_RACEICON_01
  Obj_StartAlongPath
  begin
    if Obj_FlagSet FLAG_RACE2_RACEICON_01
      break
    else
    endif
    Wait 1 Frame
  repeat
  Obj_ClearFlag FLAG_RACE2_RACEICON_01
  Obj_StartAlongPath
  begin
    if Obj_FlagSet FLAG_RACE2_RACEICON_01
      break
    else
    endif
    Wait 1 Frame
  repeat
  Obj_ClearFlag FLAG_RACE2_RACEICON_01
  Obj_StartAlongPath
  begin
    if Obj_FlagSet FLAG_RACE2_RACEICON_01
      break
    else
    endif
    Wait 1 Frame
  repeat
  Obj_ClearFlag FLAG_RACE2_RACEICON_01
  Obj_StartAlongPath
  begin
    if Obj_FlagSet FLAG_RACE2_RACEICON_01
      break
    else
    endif
    Wait 1 Frame
  repeat
  Obj_ClearFlag FLAG_RACE2_RACEICON_01
  Obj_StartAlongPath
  begin
    if Obj_FlagSet FLAG_RACE2_RACEICON_01
      break
    else
    endif
    Wait 1 Frame
  repeat
  Obj_ClearFlag FLAG_RACE2_RACEICON_01
  Obj_StartAlongPath
  begin
    if Obj_FlagSet FLAG_RACE2_RACEICON_01
      break
    else
    endif
    Wait 1 Frame
  repeat
  Obj_ClearFlag FLAG_RACE2_RACEICON_01
  Obj_StartAlongPath
  begin
    if Obj_FlagSet FLAG_RACE2_RACEICON_01
      break
    else
    endif
    Wait 1 Frame
  repeat
  Obj_ClearFlag FLAG_RACE2_RACEICON_01
  Obj_StartAlongPath
  begin
    if Obj_FlagSet FLAG_RACE2_RACEICON_01
      break
    else
    endif
    Wait 1 Frame
  repeat
  Obj_ClearFlag FLAG_RACE2_RACEICON_01
  Die
endscript
script Jnk_Race2_WayPoint_01
  Race2_flag = got_01
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race2_WayPointGotten params = { <...> Icon = TRG_G_RACE2_RaceIcon_02 }
endscript
script Jnk_Race2_WayPoint_02
  Race2_flag = got_02
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race2_WayPointGotten params = { <...> Icon = TRG_G_RACE2_RaceIcon_03 }
endscript
script Jnk_Race2_WayPoint_03
  Race2_flag = got_03
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race2_WayPointGotten params = { <...> Icon = TRG_G_RACE2_RaceIcon_04 }
endscript
script Jnk_Race2_WayPoint_04
  Race2_flag = got_04
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race2_WayPointGotten params = { <...> Icon = TRG_G_RACE2_RaceIcon_05 }
endscript
script Jnk_Race2_WayPoint_05
  Race2_flag = got_05
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race2_WayPointGotten params = { <...> Icon = TRG_G_RACE2_RaceIcon_06 }
endscript
script Jnk_Race2_WayPoint_06
  Race2_flag = got_06
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race2_WayPointGotten params = { <...> Icon = TRG_G_RACE2_RaceIcon_07 }
endscript
script Jnk_Race2_WayPoint_07
  Race2_flag = got_07
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race2_WayPointGotten params = { <...> Icon = TRG_G_RACE2_RaceIcon_08 }
endscript
script Jnk_Race2_WayPoint_08
  Race2_flag = got_08
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race2_WayPointGotten params = { <...> Icon = TRG_G_RACE2_RaceIcon_09 }
endscript
script Jnk_Race2_WayPoint_09
  Race2_flag = got_09
  Obj_SetInnerRadius 15
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race2_WayPointGotten params = { <...> Icon = TRG_G_RACE2_RaceIcon_10 }
endscript
script Jnk_Race2_WayPoint_10
  Race2_flag = got_10
  Obj_SetInnerRadius 4
  Obj_SetException ex = SkaterInRadius scr = Jnk_Race2_WayPointGotten params = { <...> }
endscript
script Jnk_Race2_WayPointGotten
  Obj_ClearExceptions
  GoalManager_SetGoalFlag name = jnk_goal_race2 <Race2_flag> 1
  GoalManager_NextRaceWaypoint name = jnk_goal_race2
  Printf "icon creating"
  Create name = <Icon>
  Printf "icon created"
  SendFlag name = TRG_G_Race2_Rat FLAG_RACE2_RACEICON_01
  Wait 1 Frame
  Die
endscript
script Goal_Jnk_GapGoalEntranceTrigger1
  StartGap GapID = goal_LiptrickTransfer_1 flags = [ cancel_ground cancel_rail cancel_wall require_lip ] trickscript = Goal_Jnk_GapGoal_Got_Gap1
  EndGap GapID = goal_LiptrickTransfer_2
endscript
script Goal_Jnk_GapGoalExitTrigger1
  StartGap GapID = goal_LiptrickTransfer_2 flags = [ cancel_ground cancel_rail cancel_wall require_lip ] trickscript = Goal_Jnk_GapGoal_Got_Gap1
  EndGap GapID = goal_LiptrickTransfer_1
endscript
script Goal_Jnk_GapGoal_Got_Gap1
  if GoalManager_SetGoalFlag name = Jnk_Goal_Gaps got_01 1
  endif
endscript
FLAG_JNK_GAP_CRANE_LIPTRICK = 0
FLAG_JNK_GAP_CRANE_HOME = 1
FLAG_JNK_GAP_CRANE_AWAY = 2
script Jnk_Gap_Intro
  Kill prefix = "TRG_CraneControl"
  Kill name = TRG_Crane01_Base
  Create name = TRG_Crane01_Base
  Kill name = TRG_Crane01_Arm
  Create name = TRG_Crane01_Arm
  Kill name = TRG_Crane01_Container
  Create name = TRG_Crane01_Container
  Kill name = TRG_Crane01_Control
  Create name = TRG_Crane01_Control
  TRG_Crane01_Base:Obj_SwitchScript Jnk_Gap_Crane
  TRG_Crane01_Arm:Obj_SwitchScript Jnk_Gap_Crane
  TRG_Crane01_Container:Obj_SwitchScript Jnk_Gap_Crane
  TRG_Crane01_Control:Obj_SwitchScript Jnk_Gap_Crane
endscript
script Jnk_Gap_Deactivate
  Kill name = TRG_Crane01_Base
  Create name = TRG_Crane01_Base
  Kill name = TRG_Crane01_Arm
  Create name = TRG_Crane01_Arm
  Kill name = TRG_Crane01_Container
  Create name = TRG_Crane01_Container
  Kill name = TRG_Crane01_Control
  Create name = TRG_Crane01_Control
  Kill name = TRG_Crane02_Base
  Create name = TRG_Crane02_Base
  Kill name = TRG_Crane02_Arm
  Create name = TRG_Crane02_Arm
  Kill name = TRG_Crane02_Container
  Create name = TRG_Crane02_Container
  Kill name = TRG_Crane02_Control
  Create name = TRG_Crane02_Control
  Create prefix = "TRG_CraneControl"
endscript
script Jnk_Gap_Success
  goal_create_proset_geom ProSet_prefix = "ProSet2_"
endscript
script Jnk_Gap_Crane
  Obj_ClearFlag All
  Obj_MoveToNode name = TRG_Crane01_NavHome
  begin
    if Obj_FlagSet FLAG_JNK_GAP_CRANE_LIPTRICK
      Printf "liptrick flag set?"
      Wait 1 second
      Obj_MoveToNode name = TRG_Crane01_NavAway Time = 6
      Obj_WaitMove
      Wait 3 seconds
      Obj_MoveToNode name = TRG_Crane01_NavHome Time = 6
      Obj_WaitMove
      Obj_ClearFlag FLAG_JNK_GAP_CRANE_LIPTRICK
    endif
    Wait 10 frames
  repeat
endscript
script Goal_Jnk_GapGoal2EntranceTrigger2
  StartGap GapID = goal_TrainManual_1 flags = [ cancel_ground cancel_rail cancel_wall cancel_lip require_manual ] trickscript = Goal_Jnk_GapGoal2_Got_Gap2
  EndGap GapID = goal_TrainManual_2
endscript
script Goal_Jnk_GapGoal2ExitTrigger2
  StartGap GapID = goal_TrainManual_2 flags = [ cancel_ground cancel_rail cancel_wall cancel_lip require_manual ] trickscript = Goal_Jnk_GapGoal2_Got_Gap2
  EndGap GapID = goal_TrainManual_1
endscript
script Goal_Jnk_GapGoal2_Got_Gap2
  if GoalManager_SetGoalFlag name = Jnk_Goal_Gaps2 got_01 1
  endif
endscript
script Jnk_Gap2_Intro
  Create prefix = "TRG_Trn_Gap2_Intro"
endscript
script Jnk_Gap2_Start
  SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_DOWN
  Create prefix = "TRG_Trn_Gap2_GoalA"
  Kill prefix = "TRG_Trn_Gap2_Intro"
  Kill prefix = "TRG_Trn_Gap2_Outro"
  Kill prefix = "TRG_Veh_Shp_Trn_A"
endscript
script Jnk_Gap2_Outro
  Kill prefix = "TRG_Trn_Gap2_GoalB"
  Kill prefix = "TRG_Trn_Gap2_Intro"
  Create prefix = "TRG_Trn_Gap2_Outro"
endscript
script Jnk_Gap2_Deactivate
  Kill prefix = "TRG_Trn_Gap2"
  Create name = TRG_Veh_Shp_Trn_A
endscript
script Jnk_Trn_Gap2_LeadCar_Intro
  Obj_PlaySound TrainLoop
  Kill name = TRG_Veh_Shp_Trn_A
  SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_UP
  SpawnScript Jnk_TrainRail_B
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_22 Time = 3.75
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_21 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_20 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_19 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_18 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_17 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_16 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_15 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_14 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_12 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_13 Time = 3.75
  Obj_WaitMove
  SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_DOWN
  Obj_MoveToNode name = TRG_WP_Trn_Bin_00 Time = 3.75
  Obj_WaitMove
endscript
script Jnk_Trn_Gap2_SecondCar_Intro
  Printf "ack A"
  Obj_FollowLeader name = TRG_Trn_Gap2_Intro_LeadCar Distance = 480 OrientY
  Printf "ack B"
endscript
script Jnk_Trn_Gap2_ThirdCar_Intro
  Printf "phht A"
  Obj_FollowLeader name = TRG_Trn_Gap2_Intro_SecondCar Distance = 480 OrientY
  Printf "phht B"
endscript
script Jnk_Trn_Gap2_EndCar_Intro
  Printf "thhpt A"
  Obj_FollowLeader name = TRG_Trn_Gap2_Intro_ThirdCar Distance = 480 OrientY
  Printf "thhpt B"
endscript
FLAG_TRN_GAP2_GOALA_DIE = 1
script Jnk_Trn_Gap2_LeadCar_GoalA
  Obj_PlaySound TrainLoop
  Wait 0.5 second
  SpawnScript Jnk_TrainRail_A
  Wait 0.5 second
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_12 Time = 0.1
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_11 Time = 0.1
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_10 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_09 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_08 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_07 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_06 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_05 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_04 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_03 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_02 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, -10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_01 Time = 2
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_00 Time = 5.5
  Obj_WaitMove
  Wait 2 seconds
  Create prefix = "TRG_Trn_Gap2_GoalB"
  SendFlag prefix = "TRG_Trn_Gap2_GoalA" FLAG_TRN_GAP2_GOALA_DIE
  Die
endscript
script Jnk_Trn_Gap2_SecondCar_GoalA
  Obj_FollowLeader name = TRG_Trn_Gap2_GoalA_LeadCar Distance = 480 OrientY
  begin
    Wait 5 gameframes
    if Obj_FlagSet FLAG_TRN_GAP2_GOALA_DIE
      Die
    endif
  repeat
endscript
script Jnk_Trn_Gap2_ThirdCar_GoalA
  Obj_FollowLeader name = TRG_Trn_Gap2_GoalA_SecondCar Distance = 480 OrientY
  begin
    Wait 5 gameframes
    if Obj_FlagSet FLAG_TRN_GAP2_GOALA_DIE
      Die
    endif
  repeat
endscript
script Jnk_Trn_Gap2_EndCar_GoalA
  Obj_PlaySound TrainLoop
  Obj_FollowLeader name = TRG_Trn_Gap2_GoalA_ThirdCar Distance = 480 OrientY
  begin
    Wait 5 gameframes
    if Obj_FlagSet FLAG_TRN_GAP2_GOALA_DIE
      Die
    endif
  repeat
endscript
script Jnk_Trn_Gap2_LeadCar_GoalB
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_02 Time = 2
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_03 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_04 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_05 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_06 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_07 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_08 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_09 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_10 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_11 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_12 Time = 3.75
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_13 Time = 3.75
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_Bin_00 Time = 3.75
  Obj_WaitMove
endscript
script Jnk_Trn_Gap2_SecondCar_GoalB
  Obj_FollowLeader name = TRG_Trn_Gap2_GoalB_LeadCar Distance = 480 OrientY
endscript
script Jnk_Trn_Gap2_ThirdCar_GoalB
  Obj_FollowLeader name = TRG_Trn_Gap2_GoalB_SecondCar Distance = 480 OrientY
endscript
script Jnk_Trn_Gap2_EndCar_GoalB
  Obj_FollowLeader name = TRG_Trn_Gap2_GoalB_ThirdCar Distance = 480 OrientY
endscript
script Jnk_Trn_Gap2_LeadCar_Outro
  Wait 0.5 second
  SpawnScript Jnk_TrainRail_B
  Wait 0.5 second
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_13 Time = 3.75
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_12 Time = 3.75
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_14 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_15 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_16 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_17 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_18 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_19 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_20 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_DOWN
  Printf "XXX"
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_21 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_22 Time = 0.75
  Obj_Rotate Time = 0.75 relative = (0, 0, 10) FLAG_MAX_COORDS
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_FltBd_23 Time = 3.75
  Obj_WaitMove
  Obj_MoveToNode name = TRG_WP_Trn_Gap2_00 Time = 3.5
  Obj_WaitMove
  Wait 1 second
  Die
endscript
script Jnk_Trn_Gap2_SecondCar_Outro
  Obj_FollowLeader name = TRG_Trn_Gap2_Outro_LeadCar Distance = 480 OrientY
endscript
script Jnk_Trn_Gap2_ThirdCar_Outro
  Obj_FollowLeader name = TRG_Trn_Gap2_Outro_SecondCar Distance = 480 OrientY
endscript
script Jnk_Trn_Gap2_EndCar_Outro
  Obj_FollowLeader name = TRG_Trn_Gap2_Outro_ThirdCar Distance = 480 OrientY
endscript
script Jnk_Gap2_Loser
  Wait 1 gameframe
  GoalManager_LoseGoal name = Jnk_Goal_Gaps2
endscript
script Goal_Jnk_Tetris_A
  StartGap GapID = Gap_Tetris_A flags = PURE_AIR
  EndGap GapID = Gap_Tetris_B Gapscript = Goal_Jnk_Tetris_Gapper
endscript
script Goal_Jnk_Tetris_B
  StartGap GapID = Gap_Tetris_B flags = PURE_AIR
  EndGap GapID = Gap_Tetris_A Gapscript = Goal_Jnk_Tetris_Gapper
endscript
script Goal_Jnk_Tetris_Gapper
  GoalManager_EditGoal name = Jnk_Goal_Tetris params = { Trick_Flag = 1 }
  Printf "Tetris Gap"
endscript
script Jnk_Wood_Shatter
  ShatterAndDie {
    name = <me>
    area = 15000
    variance = 4
    vel_x = 30
    vel_y = -100
    vel_z = 30
    spread = 1 }
endscript
script Jnk_Kill_Shck_G
  Jnk_Wood_Shatter me = <me>
  PlaySound SmashWoodQP
endscript
script Jnk_Kill_Shck_G_A
  Jnk_Wood_Shatter me = <me>
  Kill prefix = "Jnk_Go_Shck_G_BrkAwy_A"
  PlaySound SmashWoodQP
endscript
script Jnk_Kill_Shck_G_B
  Jnk_Wood_Shatter me = <me>
  Kill prefix = "Jnk_Go_Shck_G_BrkAwy_B"
  PlaySound SmashWoodQP
endscript
script Jnk_Kill_Shck_G_D
  Jnk_Wood_Shatter me = <me>
  Kill prefix = "Jnk_Go_Shck_G_BrkAwy_D"
  Create name = "Jnk_Go_Shck_G_BrkAwy_D_Ground_B"
  PlaySound SmashWoodQP
endscript
script Jnk_Kill_Shck_G_E
  Jnk_Wood_Shatter me = <me>
  Kill prefix = "Jnk_Go_Shck_G_BrkAwy_E"
  Create name = "Jnk_Go_Shck_G_BrkAwy_E_Ramp_B"
  PlaySound SmashWoodQP
endscript
script Jnk_Kill_Shck_A
  Jnk_Wood_Shatter me = <me>
  Kill prefix = "Jnk_Go_Ground_Shadow_On"
  Create name = "Jnk_Go_Ground_Shadow_Off"
  PlaySound SmashWoodQP
endscript
script Jnk_Kill_DctWrk
  PlaySound HitFlimsyWood_11
  Kill name = <me>
  Kill name = <a>
  Kill name = <b>
endscript
script Jnk_Kill_WrHse_A
  PlaySound HitFlimsyWood_11
  Kill name = <me>
endscript
script Jnk_Cnvyr_Crne
  Obj_PlaySound MagnetHum2 vol = 300
  begin
    Obj_MoveToNode name = TRG_WP_Cnvyr_Crne_Dump Time = 10
    Obj_WaitMove
    Obj_AdjustSound MagnetHum2 volumePercent = 50 volumeStep = 2 pitchPercent = 50 pitchStep = 1
    Wait 3 second
    Obj_AdjustSound MagnetHum2 volumePercent = 100 volumeStep = 2 pitchPercent = 100 pitchStep = 1
    Obj_MoveToNode name = TRG_WP_Cnvyr_Crne_Load Time = 10
    Obj_WaitMove
    Obj_AdjustSound MagnetHum2 volumePercent = 50 volumeStep = 2 pitchPercent = 50 pitchStep = 1
    Wait 3 second
    Obj_AdjustSound MagnetHum2 volumePercent = 100 volumeStep = 2 pitchPercent = 100 pitchStep = 1
  repeat
endscript
script Jnk_Islnd_Brdg
  begin
    Obj_PlayStream BridgeDown
    Obj_MoveToNode name = TRG_WP_Islnd_Brdg_01 Time = 2
    Obj_WaitMove
    Wait 4 second
    Obj_PlayStream BridgeUp
    Obj_MoveToNode name = TRG_WP_Islnd_Brdg_02 Time = 2
    Obj_WaitMove
    Wait 4 second
  repeat
endscript
script Jnk_Shck_Crne_H
  begin
    Obj_PlayStream PulleyArms volume = 60 dropoff = 50
    Obj_Rotate Time = 2 relative = (0, 0, 90) FLAG_MAX_COORDS
    Obj_WaitRotate
    Wait randomrange(3, 15) seconds
    Obj_PlayStream PulleyArms volume = 60 dropoff = 50
    Obj_Rotate Time = 2 relative = (0, 0, -90) FLAG_MAX_COORDS
    Obj_WaitRotate
    Wait randomrange(3, 15) seconds
  repeat
endscript
script Jnk_Shck_Crne_J
  begin
    Obj_PlayStream PulleyArms
    Obj_Rotate Time = 2 relative = (0, 0, 90) FLAG_MAX_COORDS
    Obj_WaitRotate
    Wait randomrange(3, 15) seconds
    Obj_PlayStream PulleyArms
    Obj_Rotate Time = 2 relative = (0, 0, -90) FLAG_MAX_COORDS
    Obj_WaitRotate
    Wait randomrange(3, 15) seconds
  repeat
endscript
script Jnk_Forklift_A
  Obj_StickToGround On DistAbove = 1 DistBelow = 1
  Obj_PathHeading
  Obj_SetPathVelocity 20 Mph
  Obj_FollowPath name = TRG_WP_Forklift_A_01
endscript
script Jnk_Dck_Crne_B
  begin
    Obj_MoveToNode name = TRG_WP_Dck_Crne_B_00 Time = 10
    Obj_WaitMove
    Wait 5 seconds
    Obj_MoveToNode name = TRG_WP_Dck_Crne_B_01 Time = 10
    Obj_WaitMove
    Wait 5 seconds
  repeat
endscript
script Jnk_Trn_FltBd
  Obj_PlaySound TrainLoop
  begin
    SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_UP
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_22 Time = 5
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_21 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_DOWN
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_20 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_19 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_18 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_17 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_16 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_15 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_14 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_12 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_13 Time = 5
    Obj_WaitMove
    Obj_AdjustSound TrainLoop volumePercent = 50 volumeStep = 2 pitchPercent = 50 pitchStep = 1
    Obj_PlayStream TrainBrake1a
    Wait 1 second
    SpawnScript Jnk_TrainRail_A
    Wait 1 second
    Obj_AdjustSound TrainLoop volumePercent = 100 volumeStep = 2 pitchPercent = 100 pitchStep = 1
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_12 Time = 5
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_11 Time = 5
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_10 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_09 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_08 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_07 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_06 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_05 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_04 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_03 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_02 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, -10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_01 Time = 2.5
    Obj_WaitMove
    Obj_AdjustSound TrainLoop volumePercent = 50 volumeStep = 2 pitchPercent = 50 pitchStep = 1
    Obj_PlayStream TrainBrake1a
    Wait 2 second
    Obj_AdjustSound TrainLoop volumePercent = 100 volumeStep = 2 pitchPercent = 100 pitchStep = 1
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_00 Time = 7.5
    Obj_WaitMove
    Obj_AdjustSound TrainLoop volumePercent = 50 volumeStep = 2 pitchPercent = 50 pitchStep = 1
    Obj_PlayStream TrainBrake1a
    Wait 2 second
    Obj_AdjustSound TrainLoop volumePercent = 100 volumeStep = 2 pitchPercent = 100 pitchStep = 1
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_01 Time = 7.5
    Obj_WaitMove
    Obj_AdjustSound TrainLoop volumePercent = 50 volumeStep = 2 pitchPercent = 50 pitchStep = 1
    Obj_PlayStream TrainBrake1a
    Wait 2 second
    Obj_AdjustSound TrainLoop volumePercent = 100 volumeStep = 2 pitchPercent = 100 pitchStep = 1
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_02 Time = 2.5
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_03 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_04 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_05 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_06 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_07 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_08 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_09 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_10 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_11 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_12 Time = 5
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_13 Time = 5
    Obj_WaitMove
    Obj_AdjustSound TrainLoop volumePercent = 50 volumeStep = 2 pitchPercent = 50 pitchStep = 1
    Obj_PlayStream TrainBrake1a
    Wait 1 second
    SpawnScript Jnk_TrainRail_B
    Wait 1 second
    Obj_AdjustSound TrainLoop volumePercent = 100 volumeStep = 2 pitchPercent = 100 pitchStep = 1
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_12 Time = 5
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_14 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_15 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_16 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_17 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_18 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_19 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_20 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_UP
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_21 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_22 Time = 1
    Obj_Rotate Time = 1 relative = (0, 0, 10) FLAG_MAX_COORDS
    Obj_WaitMove
    Obj_MoveToNode name = TRG_WP_Trn_FltBd_23 Time = 5
    Wait 4 second
    SendFlag name = Jnk_Go_WrHse_Door FLAG_WAREHOUSE_DOOR_DOWN
    Obj_WaitMove
    Obj_AdjustSound TrainLoop volumePercent = 50 volumeStep = 2 pitchPercent = 50 pitchStep = 1
    Obj_PlayStream TrainBrake1a
    Wait 7 second
    Obj_AdjustSound TrainLoop volumePercent = 100 volumeStep = 2 pitchPercent = 100 pitchStep = 1
  repeat
endscript
FLAG_WAREHOUSE_DOOR_UP = 1
FLAG_WAREHOUSE_DOOR_DOWN = 2
script Jnk_Warehouse_Door
  begin
    Wait 5 gameframes
    if Obj_FlagSet FLAG_WAREHOUSE_DOOR_UP
      Create name = Jnk_Go_WrHse_Door_Trnsprtr
      Obj_MoveToNode name = TRG_WP_WrHse_Door_Up Time = 1
      Obj_WaitMove
      Obj_ClearFlag FLAG_WAREHOUSE_DOOR_UP
    else
      if Obj_FlagSet FLAG_WAREHOUSE_DOOR_DOWN
        Obj_MoveToNode name = TRG_WP_WrHse_Door_Down Time = 1
        Obj_WaitMove
        Kill name = Jnk_Go_WrHse_Door_Trnsprtr
        Obj_ClearFlag FLAG_WAREHOUSE_DOOR_DOWN
      endif
    endif
  repeat
endscript
FLAG_WAREHOUSE_B_DOOR_A = 1
script Jnk_Warehouse_B_Door_A_Controller
  SendFlag name = Jnk_Go_WrHse_B_Door_A FLAG_WAREHOUSE_B_DOOR_A
endscript
script Jnk_Warehouse_B_Door_A
  begin
    Wait 5 gameframes
    if Obj_FlagSet FLAG_WAREHOUSE_B_DOOR_A
      Create name = Jnk_Go_WrHse_B_Door_A_Trnsprtr
      Obj_MoveToNode name = TRG_WP_WrHse_B_Door_A_Up Time = 0.5
      Obj_WaitMove
      Wait 3 seconds
      Obj_MoveToNode name = TRG_WP_WrHse_B_Door_A_Down Time = 0.5
      Obj_WaitMove
      Kill name = Jnk_Go_WrHse_B_Door_A_Trnsprtr
      Obj_ClearFlag FLAG_WAREHOUSE_B_DOOR_A
    endif
  repeat
endscript
script Jnk_Warehouse_B_Door_A_Down_Control
  Create name = Jnk_Go_WrHse_B_Door_A_Down
endscript
FLAG_WAREHOUSE_B_DOOR_B = 1
script Jnk_Warehouse_B_Door_B_Controller
  SendFlag name = Jnk_Go_WrHse_B_Door_B FLAG_WAREHOUSE_B_DOOR_B
endscript
script Jnk_Warehouse_B_Door_B
  begin
    Wait 5 gameframes
    if Obj_FlagSet FLAG_WAREHOUSE_B_DOOR_B
      Create name = Jnk_Go_WrHse_B_Door_B_Trnsprtr
      Obj_MoveToNode name = TRG_WP_WrHse_B_Door_B_Up Time = 0.5
      Obj_WaitMove
      Wait 3 seconds
      Obj_MoveToNode name = TRG_WP_WrHse_B_Door_B_Down Time = 0.5
      Obj_WaitMove
      Kill name = Jnk_Go_WrHse_B_Door_B_Trnsprtr
      Obj_ClearFlag FLAG_WAREHOUSE_B_DOOR_A
    endif
  repeat
endscript
FLAG_CNVYRTWR_DOOR_B = 1
script Jnk_CnvyrTwr_Door_Controller
  SendFlag prefix = "Jnk_Go_CnvyrTwr_Door" FLAG_CNVYRTWR_DOOR_B
endscript
script Jnk_CnvyrTwr_Door_L
  begin
    Wait 5 gameframes
    if Obj_FlagSet FLAG_CNVYRTWR_DOOR_B
      Obj_MoveToNode name = TRG_WP_CnvyrTwr_Door_L Time = 0.5
      Obj_WaitMove
      Wait 3 seconds
      Obj_MoveToNode name = TRG_WP_CnvyrTwr_Door_M Time = 0.5
      Obj_WaitMove
      Obj_ClearFlag FLAG_CNVYRTWR_DOOR_B
    endif
  repeat
endscript
script Jnk_CnvyrTwr_Door_R
  begin
    Wait 5 gameframes
    if Obj_FlagSet FLAG_CNVYRTWR_DOOR_B
      Obj_MoveToNode name = TRG_WP_CnvyrTwr_Door_R Time = 0.5
      Obj_WaitMove
      Wait 3 seconds
      Obj_MoveToNode name = TRG_WP_CnvyrTwr_Door_M Time = 0.5
      Obj_WaitMove
      Obj_ClearFlag FLAG_CNVYRTWR_DOOR_B
    endif
  repeat
endscript
script Jnk_TrainRail_Lever_A
  Obj_Rotate Time = 0.2 relative = (0, -60, 0) FLAG_MAX_COORDS
  Printf "blah on AA"
endscript
script Jnk_TrainRail_A
  Printf "## TrainRail_A ##"
  TRG_Jnk_SwitchTracks_AB:Obj_PlaySound LA_GratesOpen
  Create name = Jnk_Go_Ground_Junct_AB
  Kill name = Jnk_Go_Ground_Junct_B
  Kill prefix = "TrP_Trn_Rl_A"
  Kill name = Jnk_Go_Trn_Rl_Chngr_Lvr_B
  Create name = Jnk_Go_Trn_Rl_Chngr_Lvr_A_Mov
  Kill prefix = "TRG_Rl_Trn_Rl_AB_B"
  Create prefix = "TRG_Rl_Trn_Rl_AB_A"
  SpawnScript Jnk_TrainRail_D
  Kill name = Jnk_Go_Trn_Rl_B
  Create name = Jnk_Go_Trn_Rl_AB_06
  Wait 0.01 seconds
  Kill name = Jnk_Go_Trn_Rl_AB_06
  Create name = Jnk_Go_Trn_Rl_AB_04
  Wait 0.01 seconds
  Kill name = Jnk_Go_Trn_Rl_AB_04
  Create name = Jnk_Go_Trn_Rl_AB_02
  Wait 0.01 seconds
  Kill name = Jnk_Go_Trn_Rl_AB_02
  Create name = Jnk_Go_Trn_Rl_A
  Kill name = Jnk_Go_Ground_Junct_AB
  Create name = Jnk_Go_Ground_Junct_A
  Kill name = Jnk_Go_Trn_Rl_Chngr_Lvr_A_Mov
  Create name = Jnk_Go_Trn_Rl_Chngr_Lvr_A
  Create prefix = "TrP_Trn_Rl_B"
endscript
script Jnk_TrainRail_Lever_B
  Obj_Rotate Time = 0.2 relative = (0, 60, 0) FLAG_MAX_COORDS
  Printf "blah on BB"
endscript
script Jnk_TrainRail_B
  Printf "## TrainRail_B ##"
  TRG_Jnk_SwitchTracks_AB:Obj_PlaySound LA_GratesOpen
  Create name = Jnk_Go_Ground_Junct_AB
  Kill name = Jnk_Go_Ground_Junct_A
  Kill prefix = "TrP_Trn_Rl_B"
  Kill name = Jnk_Go_Trn_Rl_Chngr_Lvr_A
  if not IsAlive name = Jnk_Go_Trn_Rl_Chngr_Lvr_B_Mov
    Create name = Jnk_Go_Trn_Rl_Chngr_Lvr_B_Mov
  endif
  Kill prefix = "TRG_Rl_Trn_Rl_AB_A"
  Create prefix = "TRG_Rl_Trn_Rl_AB_B"
  SpawnScript Jnk_TrainRail_C
  Kill name = Jnk_Go_Trn_Rl_A
  Create name = Jnk_Go_Trn_Rl_AB_02
  Wait 0.01 seconds
  Kill name = Jnk_Go_Trn_Rl_AB_02
  Create name = Jnk_Go_Trn_Rl_AB_04
  Wait 0.01 seconds
  Kill name = Jnk_Go_Trn_Rl_AB_04
  Create name = Jnk_Go_Trn_Rl_AB_06
  Wait 0.01 seconds
  Kill name = Jnk_Go_Trn_Rl_AB_06
  Create name = Jnk_Go_Trn_Rl_B
  Kill name = Jnk_Go_Ground_Junct_AB
  Create name = Jnk_Go_Ground_Junct_B
  Kill prefix = "Jnk_Go_Trn_Rl_Chngr_Lvr_B_Mov"
  Create name = Jnk_Go_Trn_Rl_Chngr_Lvr_B
  Create prefix = "TrP_Trn_Rl_A"
endscript
script Jnk_TrainRail_C
  Printf "## TrainRail_C ##"
  TRG_Jnk_SwitchTracks_CD:Obj_PlaySound LA_GratesOpen
  Create name = Jnk_Go_Ground_Junct_CD
  Kill name = Jnk_Go_Ground_Junct_D
  Kill prefix = "TRG_Rl_Trn_Rl_CD_D"
  Create prefix = "TRG_Rl_Trn_Rl_CD_C"
  Kill name = Jnk_Go_Trn_Rl_D
  Create name = Jnk_Go_Trn_Rl_CD_10
  Wait 0.007 seconds
  Kill name = Jnk_Go_Trn_Rl_CD_10
  Create name = Jnk_Go_Trn_Rl_CD_08
  Wait 0.007 seconds
  Kill name = Jnk_Go_Trn_Rl_CD_08
  Create name = Jnk_Go_Trn_Rl_CD_06
  Wait 0.007 seconds
  Kill name = Jnk_Go_Trn_Rl_CD_06
  Create name = Jnk_Go_Trn_Rl_CD_04
  Wait 0.007 seconds
  Kill name = Jnk_Go_Trn_Rl_CD_04
  Create name = Jnk_Go_Trn_Rl_CD_02
  Wait 0.007 seconds
  Kill name = Jnk_Go_Trn_Rl_CD_02
  Create name = Jnk_Go_Trn_Rl_C
  Kill name = Jnk_Go_Ground_Junct_CD
  Create name = Jnk_Go_Ground_Junct_C
endscript
script Jnk_TrainRail_D
  Printf "## TrainRail_D ##"
  TRG_Jnk_SwitchTracks_CD:Obj_PlaySound LA_GratesOpen
  Create name = Jnk_Go_Ground_Junct_CD
  Kill name = Jnk_Go_Ground_Junct_C
  Kill prefix = "TRG_Rl_Trn_Rl_CD_C"
  Create prefix = "TRG_Rl_Trn_Rl_CD_D"
  Kill name = Jnk_Go_Trn_Rl_C
  Create name = Jnk_Go_Trn_Rl_CD_02
  Wait 0.007 seconds
  Kill name = Jnk_Go_Trn_Rl_CD_02
  Create name = Jnk_Go_Trn_Rl_CD_04
  Wait 0.007 seconds
  Kill name = Jnk_Go_Trn_Rl_CD_04
  Create name = Jnk_Go_Trn_Rl_CD_06
  Wait 0.007 seconds
  Kill name = Jnk_Go_Trn_Rl_CD_06
  Create name = Jnk_Go_Trn_Rl_CD_08
  Wait 0.007 seconds
  Kill name = Jnk_Go_Trn_Rl_CD_08
  Create name = Jnk_Go_Trn_Rl_CD_10
  Wait 0.007 seconds
  Kill name = Jnk_Go_Trn_Rl_CD_10
  Create name = Jnk_Go_Trn_Rl_D
  Kill name = Jnk_Go_Ground_Junct_CD
  Create name = Jnk_Go_Ground_Junct_D
endscript
script Jnk_Buoy_Bob
  Obj_Hover Amp = 10 Freq = 0.3
  begin
    Obj_Rotate Time = 2 relative = (0, -21, 0) FLAG_MAX_COORDS
    Obj_WaitRotate
    Wait 0.2 seconds
    Obj_Rotate Time = 2 relative = (0, 21, 0) FLAG_MAX_COORDS
    Obj_WaitRotate
    Obj_Rotate Time = 2 relative = (0, 21, 0) FLAG_MAX_COORDS
    Obj_WaitRotate
    Wait 0.2 seconds
    Obj_Rotate Time = 2 relative = (0, -21, 0) FLAG_MAX_COORDS
    Obj_WaitRotate
  repeat
endscript
script Jnk_Gap_Buoy
  if TriggerType TRIGGER_LAND_ON
    Obj_PlaySound buoybellring
    if GoalManager_GoalIsActive name = Jnk_Goal_Counter
      GoalManager_GetGoalParams name = Jnk_Goal_Counter
      if ( <number_collected> = 4 )
        Printf "waitng to reward"
        Wait 1 second
        GoalManager_GotCounterObject name = Jnk_Goal_Counter
      else
        GoalManager_GotCounterObject name = Jnk_Goal_Counter
      endif
    endif
  endif
endscript
script Jnk_Warehouse_A_Light08
  begin
    Create prefix = "Jnk_Go_WrHse_A_Lamp08On"
    Kill prefix = "Jnk_Go_WrHse_A_Lamp08Off"
    Wait random( @0.05 @0.1 @0.2 @0.4 @0.8 @1  ) seconds
    Create prefix = "Jnk_Go_WrHse_A_Lamp08Off"
    Kill prefix = "Jnk_Go_WrHse_A_Lamp08On"
    Wait random( @0.05 @0.1 @0.2 @0.4 @0.8 @1  ) seconds
  repeat
endscript
script Jnk_Warehouse_B_Light05
  begin
    Create prefix = "Jnk_Go_WrHse_B_Lamp05On"
    Kill prefix = "Jnk_Go_WrHse_B_Lamp05Off"
    Wait random( @0.05 @0.1 @0.2 @0.4 @0.8 @1  ) seconds
    Create prefix = "Jnk_Go_WrHse_B_Lamp05Off"
    Kill prefix = "Jnk_Go_WrHse_B_Lamp05On"
    Wait random( @0.05 @0.1 @0.2 @0.4 @0.8 @1  ) seconds
  repeat
endscript
script Jnk_Warehouse_B_Light04
  begin
    Create prefix = "Jnk_Go_WrHse_B_Lamp04On"
    Kill prefix = "Jnk_Go_WrHse_B_Lamp04Off"
    Wait random( @0.05 @0.1 @0.2 @0.4 @0.8 @1  ) seconds
    Create prefix = "Jnk_Go_WrHse_B_Lamp04Off"
    Kill prefix = "Jnk_Go_WrHse_B_Lamp04On"
    Wait random( @0.05 @0.1 @0.2 @0.4 @0.8 @1  ) seconds
  repeat
endscript
script Jnk_Shack_J_Light01
  begin
    Create prefix = "Jnk_Go_Shck_J_Lamp01On"
    Kill prefix = "Jnk_Go_Shck_J_Lamp01Off"
    Wait random( @0.05 @0.1 @0.2 @0.4 @0.8 @1  ) seconds
    Create prefix = "Jnk_Go_Shck_J_Lamp01Off"
    Kill prefix = "Jnk_Go_Shck_J_Lamp01On"
    Wait random( @0.05 @0.1 @0.2 @0.4 @0.8 @1  ) seconds
  repeat
endscript
script Jnk_Generator
  Obj_PlaySound dieselgenerator
  Obj_Hover Amp = 2 Freq = 10
  begin
    Obj_RotY angle = 10 speed = 250
    Obj_WaitRotate
    Obj_RotY angle = -10 speed = 250
    Obj_WaitRotate
  repeat
endscript
FLAG_JNK_DOG_START = 1
script Jnk_Race_Intro
  Create prefix = "TRG_G_Race_BigDog"
endscript
script Jnk_Race_Start
  SendFlag prefix = "TRG_G_Race_BigDog" FLAG_JNK_DOG_START
endscript
script Jnk_Race_Deactivate
  Kill prefix = "TRG_G_Race_BigDog"
  KillSpawnedScript name = Jnk_SFX_Dog
endscript
script Jnk_SFX_Dog
  begin
    Obj_PlayStream volume = 400 random( @DogBarkChase1 @DogBarkChase2 ) 
    Wait 2 seconds
  repeat
endscript
script Jnk_BigDog_Path
  Wait randomrange(1, 60) frames
  if GotParam Bark
    Obj_SpawnScript Jnk_SFX_Dog
  endif
  random( @@@Obj_CycleAnim anim = LiftLeg ) 
  Obj_PlayAnim anim = BarkIdle cycle
  begin
    Wait 1 Frame
    if Obj_FlagSet FLAG_JNK_DOG_START
      break
    endif
  repeat
  Obj_ClearExceptions
  Obj_SetInnerRadius 4
  Obj_SetException ex = SkaterInRadius scr = Jnk_BigDog_Maul
  Obj_StickToGround DistAbove = 3 DistBelow = 6
  Obj_SetPathVelocity <speed> Mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 100 mphps
  Obj_SetPathDeceleration 100 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = run cycle
  begin
    if not Obj_IsMoving
      Obj_PlayAnim anim = BarkIdle cycle
      break
    endif
    Wait 2 frames
  repeat
endscript
script Jnk_BigDog_Maul
  Obj_ClearExceptions
  MakeSkaterGoto PedKnockDown
  Obj_LookAtObject type = skater Time = 0.1
  Obj_WaitRotate
  Obj_PlayAnim anim = BarkIdle cycle
  Obj_GetDistanceToObject skater
  Obj_MoveForward dist = ( ( <ObjectDistance> - 10 ) * 12 ) speed = 40 acceleration = 10000
  Obj_WaitMove
  Wait 2 seconds
  SpawnScript Jnk_LoseRace
endscript
script Jnk_LoseRace
  if GoalManager_GoalIsActive name = jnk_goal_race
    create_panel_message id = goal_message text = "Dog Food!" style = panel_message_generic_loss
    GoalManager_LoseGoal name = jnk_goal_race
  endif
endscript
script Jnk_Goal_Counter3_Deactivate
  Kill name = Bucky_Manager
  Kill prefix = "BuckyFLASH"
  Kill prefix = "TRGP_Bucky"
  skater:ClearTrickQueues
  skater:ClearGapTricks
  skater:ClearEventBuffer
  skater:ClearPanel_Bailed
  ResetSkaters node_name = TRG_G_Counter3_Success
endscript
script Jnk_Goal_Counter3_Outro
endscript
script Jnk_Counter3_Teleport
  Obj_MoveToNode name = TRG_G_Counter3_Success Orient
  MakeSkaterGoto SkaterInit
endscript
script Jnk_BuckyChallenge_Manager
  Obj_ClearExceptions
  Obj_SetException ex = SkaterLanded scr = Jnk_BuckyChallengeCheckScore
  Printf "Junk"
endscript
script Jnk_BuckyChallengeCheckScore
  Obj_ClearExceptions
  Printf "Skater Landed Junk"
  if IsAlive name = Bucky_BREAK1_01
    if SkaterLastScoreLandedGreaterThan 10000
      Create prefix = "BuckyFLASH1_"
      Create prefix = "TRGP_Bucky1_"
      Kill prefix = "Bucky_BREAK1_"
      PlaySound HitFlimsyWood_11
      GoalManager_GotCounterObject name = Jnk_Goal_Counter3
      create_panel_block id = current_goal text = "Do a 20,000 point combo" style = panel_message_goal
      Wait 2 seconds
      PlaySound HitFlimsyWood_11
      Kill prefix = "BuckyFLASH1_"
    endif
  else
    if IsAlive name = Bucky_BREAK2_01
      if SkaterLastScoreLandedGreaterThan 20000
        Create prefix = "BuckyFLASH2_"
        Create prefix = "TRGP_Bucky2_"
        Kill prefix = "Bucky_BREAK2_"
        PlaySound HitFlimsyWood_11
        GoalManager_GotCounterObject name = Jnk_Goal_Counter3
        create_panel_block id = current_goal text = "Do a 50,000 point combo" style = panel_message_goal
        Wait 2 seconds
        PlaySound HitFlimsyWood_11
        Kill prefix = "BuckyFLASH2_"
      endif
    else
      if IsAlive name = Bucky_BREAK3_01
        if SkaterLastScoreLandedGreaterThan 50000
          Create prefix = "BuckyFLASH3_"
          Kill prefix = "Bucky_BREAK3_"
          PlaySound HitFlimsyWood_11
          GoalManager_GotCounterObject name = Jnk_Goal_Counter3
          create_panel_block id = current_goal text = "Do a 100,000 point combo" style = panel_message_goal
          Wait 2 seconds
          PlaySound HitFlimsyWood_11
          Kill prefix = "BuckyFLASH3_"
        endif
      else
        if IsAlive name = Bucky_BREAK4_01
          if SkaterLastScoreLandedGreaterThan 100000
            Create prefix = "BuckyFLASH4_"
            Kill prefix = "Bucky_BREAK4_"
            PlaySound HitFlimsyWood_11
            GoalManager_GotCounterObject name = Jnk_Goal_Counter3
            create_panel_block id = current_goal text = "Do a 250,000 point combo" style = panel_message_goal
            Wait 2 seconds
            PlaySound HitFlimsyWood_11
            Kill prefix = "BuckyFLASH4_"
          endif
        else
          Printf "Waiting for 250,000"
          if SkaterLastScoreLandedGreaterThan 250000
            Printf "You got it"
            GoalManager_GotCounterObject name = Jnk_Goal_Counter3
          endif
        endif
      endif
    endif
  endif
  Goto Jnk_BuckyChallenge_Manager
endscript
script Jnk_Gap3_Intro
  Kill prefix = "TRG_Crane0"
  Create name = "TRG_Crane01_Base"
  Create name = "TRG_Crane02_Base"
  Create name = "TRG_Crane03_Base"
  Kill prefix = "TRG_CraneControl"
  Create prefix = "GAPS3_LO_CRANE0"
  KillSpawnedScript name = JNK_SecondCraneController
  GAPS3_LO_CRANE01_ARM:Obj_MoveToPos (3180.7, 734.7, -2714.2) Time = 5
  GAPS3_LO_CRANE01_CONT:Obj_MoveToPos (3180.7, 734.7, -2714.2) Time = 5
  TRG_Crane02_Base:Obj_SwitchScript EmptyScript
  TRG_Crane02_Base:Obj_MoveToPos (3180.7, 734.7, -2714.2) Time = 5
  GAPS3_LO_CRANE02_ARM:Obj_MoveToPos (1187.98, 734.7, -3802.1) Time = 5
  GAPS3_LO_CRANE02_CONT:Obj_MoveToPos (1187.98, 734.7, -3802.1) Time = 5
  TRG_Crane01_Base:Obj_SwitchScript EmptyScript
  TRG_Crane01_Base:Obj_MoveToPos (1999.59, 734.7, -3802.1)
  TRG_Crane01_Base:Obj_MoveToPos (1187.98, 734.7, -3802.1) Time = 5
  GAPS3_LO_CRANE03_ARM:Obj_MoveToPos (-1416, 680, -3167) Time = 5
  GAPS3_LO_CRANE03_CONT:Obj_MoveToPos (-1416, 680, -3167) Time = 5
  TRG_Crane03_Base:Obj_SwitchScript EmptyScript
  TRG_Crane03_Base:Obj_MoveToPos (-637.91, 680, -3167)
  TRG_Crane03_Base:Obj_MoveToPos (-1416, 680, -3167) Time = 5
  GAPS3_LO_CRANE02_ARM:Obj_RotY angle = 155 speed = 20
  GAPS3_LO_CRANE02_CONT:Obj_RotY angle = 151.5 speed = 20
  GAPS3_LO_CRANE03_ARM:Obj_RotY angle = -115.5 speed = 30
  GAPS3_LO_CRANE03_CONT:Obj_RotY angle = -115.5 speed = 30
endscript
script Jnk_Gap3_Start
  Kill prefix = "GAPS3_LO_CRANE01_CONT"
  Kill prefix = "GAPS3_LO_CRANE02_CONT"
  Kill prefix = "GAPS3_LO_CRANE03_CONT"
  Create prefix = "GAPS3_GEO1_CRANE0"
endscript
script Jnk_Gap3_Deactivate
  KillSpawnedScript name = Jnk_Gap3_StopSkater
  MakeSkaterGoto SkaterInit
  skater:KillSkater node = TRG_G_GAP3_RestartNode_Ground
  Kill prefix = "GAPS3_LO_CRANE0"
  Kill prefix = "GAPS3_GEO1_CRANE0"
  Kill prefix = "GAPS3_GEO2_CRANE0"
  Kill prefix = "TRG_Crane0"
  Create prefix = "TRG_Crane0"
  Create prefix = "TRG_CraneControl"
endscript
script Jnk_Gap3_StopSkater
  skater:KillSkater node = TRG_G_GAP3_RestartNode_Container
  MakeSkaterGoto HandBrake
  PlaySkaterCamAnim skater = 0 name = G_Gap3_CameraCrane01 skippable = 0 play_hold
  begin
    skater:DisablePlayerInput
    skater:SetRollingFriction 10000
    Wait 1 Frame
  repeat
endscript
script Jnk_Gap3_StartSkater
  KillSpawnedScript name = Jnk_Gap3_StopSkater
  MakeSkaterGoto SkaterInit
  speech_box_exit
endscript
script Jnk_Gap3_GoHigher
  Printf "crane rotating"
  if not IsAlive name = GAPS3_LO_CRANE03_CONT
    SpawnScript Jnk_Gap3_StopSkater
    Spawnscript JNK_GAP3_SKIPCUT_DIALOG
    Create prefix = "GAPS3_LO_CRANE01_CONT"
    Create prefix = "GAPS3_LO_CRANE02_CONT"
    Create prefix = "GAPS3_LO_CRANE03_CONT"
    GAPS3_LO_CRANE01_CONT:Obj_MoveToPos (3180.7, 734.7, -2714.2) Time = 0.0
    GAPS3_LO_CRANE02_CONT:Obj_MoveToPos (1187.98, 734.7, -3802.1) Time = 0.0
    GAPS3_LO_CRANE03_CONT:Obj_MoveToPos (-1416, 680, -3167) Time = 0.0
    GAPS3_LO_CRANE02_CONT:Obj_RotY angle = 151.5 speed = 20000
    GAPS3_LO_CRANE03_CONT:Obj_RotY angle = -115.5 speed = 30000
    Wait 2 Frame
    Kill prefix = "GAPS3_GEO1_CRANE0"
    Wait 100 Frame
    skater:ShakeCamera {
      duration = 0.5
      vert_amp = 9.0
      horiz_amp = 3.0
      vert_vel = 10.27
      horiz_vel = 5.92
    }
    if IsAlive name = GAPS3_LO_CRANE03_CONT
      if IsAlive name = GAPS3_LO_CRANE02_CONT
        GAPS3_LO_CRANE03_CONT:Obj_MoveToPos (-1416, 1664, -3167) Time = 5
        GAPS3_LO_CRANE02_CONT:Obj_MoveToPos (1187.98, 1234.7, -3802.1) Time = 5
        Wait 30 Frame
      endif
    endif
    if IsAlive name = GAPS3_LO_CRANE03_CONT
      if IsAlive name = GAPS3_LO_CRANE02_CONT
        GAPS3_LO_CRANE03_ARM:Obj_RotY angle = -182 speed = 30
        GAPS3_LO_CRANE03_CONT:Obj_RotY angle = -182 speed = 30
        Wait 370 Frame
      endif
    endif
    if IsAlive name = GAPS3_LO_CRANE03_CONT
      if IsAlive name = GAPS3_LO_CRANE02_CONT
        GAPS3_LO_CRANE03_ARM:Obj_RotY angle = -178 speed = 30
        GAPS3_LO_CRANE03_CONT:Obj_RotY angle = -178 speed = 30
        Wait 370 frames
      endif
    endif
    if IsAlive name = GAPS3_LO_CRANE03_CONT
      if IsAlive name = GAPS3_LO_CRANE02_CONT
        Kill prefix = "GAPS3_LO_CRANE01_CONT"
        Kill prefix = "GAPS3_LO_CRANE02_CONT"
        Kill prefix = "GAPS3_LO_CRANE03_CONT"
        Create prefix = "GAPS3_GEO2_CRANE0"
        skater:ShakeCamera {
          duration = 0.5
          vert_amp = 9.0
          horiz_amp = 3.0
          vert_vel = 10.27
          horiz_vel = 5.92
        }
        PlaySkaterCamAnim skater = 0 stop
        PlaySkaterCamAnim skater = 0 name = G_Gap3_CameraCrane02 skippable = 0 exitScript = Jnk_Gap3_StartSkater
        speech_box_exit
        Printf "crane rotation done"
      endif
    endif
  endif
endscript
script JNK_GAP3_SKIPCUT_DIALOG // Special script to deactivate the cutscene of the cranes and containers moving in Gap across the suspended containers, a special spawn point is needed too which is why jnk.q was modified
  create_speech_box {
    Text = "Press \m0 to skip"
    pad_choose_script = JNK_GAP3_SKIPCUT_ACTIVATE
    pad_choose_params = { Bait_Camera = <Bait_Camera> }
  }
endscript
script JNK_GAP3_SKIPCUT_ACTIVATE
  GAPS3_LO_CRANE01_CONT:Obj_MoveToPos (3180.7, 734.7, -2714.2) Time = 0.0
  GAPS3_LO_CRANE02_CONT:Obj_MoveToPos (1187.98, 1234.7, -3802.1) Time = 0.0
  GAPS3_LO_CRANE03_CONT:Obj_MoveToPos (-1416, 1664, -3167) Time = 0.0
  GAPS3_LO_CRANE03_ARM:Obj_RotY angle = -178 speed = 9999
  GAPS3_LO_CRANE03_CONT:Obj_RotY angle = -178 speed = 9999
  PlaySkaterCamAnim Skater = 0 stop
  KillSkaterCamAnim skaterId = 0
          Kill prefix = "GAPS3_LO_CRANE01_CONT"
        Kill prefix = "GAPS3_LO_CRANE02_CONT"
        Kill prefix = "GAPS3_LO_CRANE03_CONT"
        Create prefix = "GAPS3_GEO2_CRANE0"
  Wait 1 Frame
  skater:KillSkater node = TRG_G_GAP3_RestartNode_Skip
  Spawnscript Jnk_Gap3_StartSkater
endscript
script JNK_GAP3_LASTGAP_START
  StartGap GapID = JNK_GAPS3_END flags = [ PURE_AIR ] trickscript = JNK_GAP3_LASTGAP_DONE
endscript
script JNK_GAP3_LASTGAP_END
  EndGap GapID = JNK_GAPS3_END
endscript
script JNK_GAP3_LASTGAP_DONE
  GoalManager_SetGoalFlag name = jnk_goal_gaps3 got_01 1
endscript
script Jnk_Gap4_Intro
  Kill prefix = "TRG_Crane01"
  Kill prefix = "TRG_Crane02"
  Kill prefix = "TRG_CraneControl"
  KillSpawnedScript name = JNK_SecondCraneController
  Wait 1 Frame
  Create prefix = "TRG_Crane01"
  SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_MOVELEFT
  Create prefix = "TRG_Crane02"
  SendFlag prefix = "TRG_Crane02" OBJFLAG_CRANE_STOP
  Create prefix = "TRG_CraneControl"
  TRG_Crane01_Arm:Obj_MoveToRelPos (-500, 0, 0) Time = 0.00001
  TRG_Crane01_Base:Obj_MoveToRelPos (-500, 0, 0) Time = 0.00001
  TRG_Crane01_Control:Obj_MoveToRelPos (-500, 0, 0) Time = 0.00001
  TRG_Crane01_Container:Obj_MoveToRelPos (-500, 0, 0) Time = 0.00001
  Wait 1 Frame
  SendFlag prefix = "TRG_CraneController" OBJFLAG_CRANE_DONEMOVE
  SpawnScript Jnk_Gap4_StopMoveDone
endscript
script Jnk_Gap4_Start
endscript
script Jnk_Gap4_Deactivate
  Kill prefix = "TRG_Crane01"
  Kill prefix = "TRG_Crane02"
  Kill prefix = "TRG_CraneControl"
  KillSpawnedScript name = JNK_SecondCraneController
  KillSpawnedScript name = Jnk_Gap4_StopMoveDone
  Wait 1 Frame
  Create prefix = "TRG_Crane01"
  Create prefix = "TRG_Crane02"
  Create prefix = "TRG_CraneControl"
  Wait 1 Frame
  SendFlag prefix = "TRG_CraneController" OBJFLAG_CRANE_DONEMOVE
endscript
script Jnk_Gap4_StopMoveDone
  Wait 10 frames
  SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_STOP
endscript
script Jnk_Gap4_Gap1
  EndGap GapID = Jnk_Gap4_Gap2 text = "Container Combo" Score = 100
  StartGap GapID = Jnk_Gap4_Gap1 flags = [ cancel_ground ] trickscript = Jnk_Gap4_GapGot
endscript
script Jnk_Gap4_Gap2
  EndGap GapID = Jnk_Gap4_Gap1 text = "Container Combo" Score = 100
  StartGap GapID = Jnk_Gap4_Gap2 flags = [ cancel_ground ] trickscript = Jnk_Gap4_GapGot
endscript
script Jnk_Gap4_GapGot
  if GoalManager_GoalIsActive name = JNK_goal_gaps4
    Printf "got the container combo1"
    if GoalManager_SetGoalFlag name = JNK_goal_gaps4 got_01 1
      Printf "got the container combo2"
    endif
  endif
endscript
script Jnk_AddGoal_Gaps5
  AddGoal_Gaps5 {
    CAREER_ONLY
    Unlocked_By_Another
    Pro_specific_challenge
    Pro_challenge_title = "Movie Stunt Double"
    Pro_challenge_text = "For better or worse, Hollywood has taken note of the rising popularity of action sports. Just check the movie listings - chances are, your favorite action sports star is ripping it up in a movie playing near you..."
    Pro_challenge_tag_line = "Time to break a leg..."
    Pro_challenge_pro_name = "custom"
    View_Goals_Text = "Create-A-Skater's Pro Specific Challenge"
    Time = 120 seconds
    Goal_Text = "Hit all of the Green Detonators in one Combo"
    Start_Cam_Anim = G_Gap5_CameraStart
    Goal_Intro_Script = Jnk_Gap5_Intro
    Goal_Start_Script = Jnk_Gap5_Start
    Goal_Deactivate_Script = Jnk_Gap5_Deactivate
    Goal_Description = jnk_gaps5_desc
    Goal_Flags = [
      got_01
    ]
    Pro = "director"
    full_name = "Movie Director"
    Use_Hud_Counter
    hud_counter_caption = "That's a Wrap!"
    record_type = none
  }
endscript
script Jnk_Gap5_Intro
  Kill prefix = "TRG_Veh_Shp_Trn_A"
  Jnk_TrainRail_B
  Create prefix = "TRG_PC_Controller"
  Create prefix = "TRG_PC_BadGuy_"
  Create prefix = "Detonator_"
  Create prefix = "Mine_"
  Create prefix = "TRG_PC_HeloSkid"
  Create prefix = "PC_Helo_"
  Create prefix = "TRGP_PC_CAS_"
  Wait 1 Frame
  ClearFlag name = TRG_PC_Controller OBJFLAG_CAS_RESET_STAGE
  PauseSkaters
  skater:Hide
endscript
script Jnk_Gap5_Start
  UnPauseSkaters
  skater:Unhide
  Kill prefix = "TRG_PC_RiccoChecker"
  Create prefix = "TRG_PC_RiccoChecker"
  Kill prefix = "TRG_PC_Controller"
  Create prefix = "TRG_PC_Controller"
  KillSpawnedScript id = CAPS_PC_SpawnedScript
  create_panel_message id = MiniGame1 text = " " style = panel_sprite_goalfail
  skater:ShakeCamera {
    duration = 0.1
    vert_amp = 0.1
    horiz_amp = 0.1
    vert_vel = 0.1
    horiz_vel = 0.1
  }
endscript
script Jnk_Gap5_Deactivate
  create_panel_message id = MiniGame1 text = " " style = panel_sprite_goalfail
  PlaySkaterCamAnim skater = 0 stop
  Kill prefix = "TRG_PC_Controller"
  Kill prefix = "TRG_PC_RiccoChecker"
  Kill prefix = "TRG_PC_BadGuy_"
  Kill prefix = "Detonator_"
  Kill prefix = "Mine_"
  Kill prefix = "TRG_PC_HeloSkid"
  Kill prefix = "PC_Helo_"
  Kill prefix = "TRGP_PC_CAS_"
  Kill prefix = "TRG_PC_BadGuy2_"
  Kill prefix = "Detonator2_"
  Kill prefix = "Mine2_"
  DestroyParticleSystem name = Particle_Ricco
  Create prefix = "TRG_Veh_Shp_Trn_A"
  skater:Obj_GetId
  MangleChecksums a = skatersplash b = <objId>
  SetScript name = <mangled_id> emitscript = emit_skatersplash
  skater:KillSkater node = TRG_G_GAP6_IntroNode
endscript
script PC_CAS_RiccoChecker
  Wait 4 seconds
  begin
    skater:Obj_GetId
    MangleChecksums a = skatersplash b = <objId>
    SetScript name = <mangled_id> emitscript = PC_CAS_RiccoParticle
    ParticlesOn name = <mangled_id>
    Wait 0.1 seconds
    ParticlesOff name = <mangled_id>
    SetScript name = <mangled_id> emitscript = emit_skatersplash
    Printf "not firing"
    Wait 1 frames
    if not SkaterCurrentScorePotGreaterThan 1
      Printf "make skater fall *********************************"
      MakeSkaterGoto Spasmodic
      SendFlag name = TRG_PC_Controller OBJFLAG_CAS_RESET_STAGE
      Wait 4 seconds
    endif
    Printf "firing"
    Wait 1 frames
  repeat
endscript
script PC_CAS_HeloBlades
  Obj_RotY speed = 1900
endscript
script PC_CAS_BadGuy
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = PC_CAS_BadGuyShooting
  Obj_SetInnerRadius 50
  if IsAlive name = TRG_PC_RiccoChecker
    ClearFlag name = TRG_PC_RiccoChecker OBJFLAG_CAS_FIRING
  endif
endscript
script PC_CAS_BadGuyShooting
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = PC_CAS_BadGuyFall
  Obj_SetInnerRadius 3
  Obj_SetException ex = SkaterOutOfRadius scr = PC_CAS_BadGuy
  Obj_SetOuterRadius 50
  begin
    begin
      if IsAlive name = TRG_PC_RiccoChecker
        SendFlag name = TRG_PC_RiccoChecker OBJFLAG_CAS_FIRING
      endif
      Obj_PlayAnim anim = Ped_ET_Shoot speed = 20
      Obj_LookAtObject type = skater Time = 0.2
      Obj_PlaySound Gunshot01 pitch = randomrange(90, 100) vol = randomrange(160, 180) dropoff = 900
      Obj_WaitAnimFinished
    repeat random( @3 @5 @10 @10 ) 
    Wait random( @5 @10 @10 @15 @20 ) frames
  repeat
endscript
script PC_CAS_BadGuyFall
  Obj_ClearExceptions
  Obj_PlayAnim anim = Ped_M_FallDownA
  PlaySound random( @HitBody03 @HitBody04  ) vol = 200
  Obj_WaitAnimFinished
  Obj_PlayAnim anim = Ped_M_GetUpA
  Obj_WaitAnimFinished
  PC_CAS_BadGuy
endscript
script PC_CAS_Explosion
  SendFlag name = TRG_PC_Controller OBJFLAG_CAS_STEP_UP
  PlaySound explode1_11 vol = 200
  pulse_blur start = 255 speed = 5
  skater:ShakeCamera {
    duration = 2.5
    vert_amp = 1.0
    horiz_amp = 30.0
    vert_vel = 2.27
    horiz_vel = 2.92
  }
  skater:Obj_GetId
  MangleChecksums a = skatersplash b = <objId>
  SetScript name = <mangled_id> emitscript = PC_CAS_ExplosionParticle
  ParticlesOn name = <mangled_id>
  Wait 0.1 seconds
  ParticlesOff name = <mangled_id>
  SetScript name = <mangled_id> emitscript = PC_CAS_ExplosionParticle
endscript
script PC_CAS_Mine
  PlaySound explode1_11 vol = 200
  pulse_blur start = 255 speed = 5
  skater:ShakeCamera {
    duration = 3.5
    vert_amp = 10.0
    horiz_amp = 20.0
    vert_vel = 10.27
    horiz_vel = 5.92
  }
  MakeSkaterGoto Spasmodic
  skater:Obj_GetId
  MangleChecksums a = skatersplash b = <objId>
  SetScript name = <mangled_id> emitscript = PC_CAS_ExplosionParticle
  ParticlesOn name = <mangled_id>
  SendFlag name = TRG_PC_Controller OBJFLAG_CAS_RESET_STAGE
  Wait 0.4 seconds
  ParticlesOff name = <mangled_id>
  SetScript name = <mangled_id> emitscript = PC_CAS_ExplosionParticle
endscript
script PC_CAS_ExplosionParticle x = -1068 y = 6 z = 840
  skater:Obj_GetId
  GetBonePosition id = <objId> bone = pelvis
  SetPos x = <x> y = <y> z = <z>
  SetLife min = 0.2 max = 0.5
  SetAngleSpread spread = 2
  SetSpeedRange min = 16.0 max = 38.0
  SetEmitRange width = 1.0 height = 1.0
  SetForce force = (0, -0.01, 0)
  SetEmitTarget target = (0, 1, 0)
  SetParticleSize sw = 30.0 sh = 30.0 ew = 5.0 eh = 5.0
  SetColor corner = 0 sr = 255 sg = 0 sb = 0 sa = 255 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
  SetColor corner = 1 sr = 255 sg = 0 sb = 0 sa = 128 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
  SetColor corner = 2 sr = 255 sg = 0 sb = 0 sa = 0 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
  SetCircularEmit circular = 0
  begin
    Emit num = 50
    Wait 1 gameframe
  repeat 3
endscript
script PC_CAS_SmokeParticle x = -1068 y = 6 z = 840
  skater:Obj_GetId
  GetBonePosition id = <objId> bone = pelvis
  SetPos x = <x> y = <y> z = <z>
  SetLife min = 2.5 max = 5.0
  SetAngleSpread spread = 2
  SetSpeedRange min = 1.0 max = 3.0
  SetEmitRange width = 1.0 height = 1.0
  SetForce force = (0, -0.01, 0)
  SetEmitTarget target = (0, 1, 0)
  SetParticleSize sw = 10.0 sh = 10.0 ew = 25.0 eh = 25.0
  SetColor corner = 0 sr = 128 sg = 128 sb = 128 sa = 255 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
  SetColor corner = 1 sr = 64 sg = 64 sb = 64 sa = 128 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
  SetColor corner = 2 sr = 0 sg = 0 sb = 0 sa = 0 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
  SetCircularEmit circular = 0
  begin
    Emit num = 10
    Wait 1 gameframe
  repeat 3
endscript
script PC_CAS_RiccoParticle
  Wait 1 frames
  begin
    begin
      skater:Obj_GetId
      GetBonePosition id = <objId> bone = pelvis
      SetPos x = ( <x> + randomrange(-40, 40) ) y = ( <y> -4 ) z = ( <z> + randomrange(-40, 40) )
      SetLife min = 0.1 max = 0.3
      SetAngleSpread spread = random( @0.1 @0.25 @0.5 @1 ) 
      SetSpeedRange min = 1.0 max = 8.0
      SetEmitRange width = 1.0 height = 1.0
      SetForce force = (0, 0.02, 0)
      SetEmitTarget target = (0, 1, 0)
      SetParticleSize sw = 0.9 sh = 0.9 ew = 0.1 eh = 0.1
      SetColor corner = 0 sr = 255 sg = 255 sb = 128 sa = 255 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
      SetColor corner = 1 sr = 255 sg = 255 sb = 0 sa = 128 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
      SetColor corner = 2 sr = 255 sg = 255 sb = 0 sa = 0 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
      SetCircularEmit circular = 0
      Emit num = random( @5 @10 @20 ) 
      PlaySound random( @ricco1_11 @ricco2_11  ) pitch = random( @80 @90 @100  ) vol = 40
      Wait random( @1 @3 @5  ) frames
    repeat random( @3 @5 @10 @20 ) 
    Wait random( @10 @15 @20  ) frames
  repeat
endscript
script PC_CAS_TrickCheck01
  Printf "start trick check"
  if AnimEquals Indy900
    SpawnSkaterScript PC_CAS_TrickEffect
    SendFlag name = TRG_PC_Controller OBJFLAG_CAS_STEP_UP
    ClearFlag name = TRG_PC_Controller OBJFLAG_CAS_END_LOC
  else
    MakeSkaterGoto Spasmodic
    Wait 30 frames
    SendFlag name = TRG_PC_Controller OBJFLAG_CAS_RESET_STAGE
  endif
endscript
script PC_CAS_TrickCheck02
  Printf "trick check 2"
  Wait 30 frames
  SendFlag name = TRG_PC_Controller OBJFLAG_CAS_END_LOC
endscript
script PC_CAS_TrickDone
  SpawnSkaterScript PC_CAS_TrickEffect
endscript
script PC_CAS_TrickEffect
  PlaySkaterCamAnim skater = 0 name = G_GAPS5_TRICKCAM
  SetSlomo 0.3
  pulse_blur start = 0 end = 150 speed = 10
  PlaySound HUD_specialtrickAA vol = 200 pitch = 75
endscript
OBJFLAG_CAS_FIRING = 0
OBJFLAG_CAS_STEP_UP = 1
OBJFLAG_CAS_RESET_STAGE = 2
OBJFLAG_CAS_END_LOC = 3
script PC_CAS_AtEndLocation
  Printf "at end location"
  if IsAlive name = TRG_PC_Controller
    SendFlag name = TRG_PC_Controller OBJFLAG_CAS_END_LOC
  endif
endscript
script PC_CAS_RestartStage1
  Wait 2 seconds
  if GoalManager_GoalIsActive name = Jnk_Goal_Gaps5
    pulse_blur start = 255 speed = 2
    skater:ShakeCamera {
      duration = 0.01
      vert_amp = 0.1
      horiz_amp = 0.1
      vert_vel = 0.1
      horiz_vel = 0.1
    }
    Kill prefix = "PC_Helo_"
    Create prefix = "PC_Helo_"
    MakeSkaterGoto SkaterInit
    Wait 1 Frame
    skater:KillSkater node = TRG_G_GAP5_RestartNode
    Wait 1 Frame
    Kill prefix = "TRG_PC_RiccoChecker"
    Kill prefix = "TRG_PC_BadGuy_"
    Kill prefix = "Detonator_"
    Kill prefix = "Mine_"
    Kill prefix = "TRG_PC_HeloSkid"
    Kill prefix = "TRGP_PC_CAS_TrainTrackSwitch"
    DestroyParticleSystem name = Particle_Ricco
    Jnk_TrainRail_B
    Create prefix = "TRG_PC_RiccoChecker"
    Create prefix = "TRG_PC_BadGuy_"
    Create prefix = "Detonator_"
    Create prefix = "Mine_"
    Create prefix = "TRG_PC_HeloSkid"
    Create prefix = "TRGP_PC_CAS_TrainTrackSwitch"
  endif
endscript
script PC_CAS_RestartStage2
  pulse_blur start = 255 speed = 2
  MakeSkaterGoto SkaterInit
  Wait 1 Frame
  skater:KillSkater node = TRG_G_GAP5_RestartNode01
endscript
script PC_CAS_RestartStage3
  Kill prefix = "TRG_PC_BadGuy2_"
  Kill prefix = "Detonator2_"
  Kill prefix = "Mine2_"
  DestroyParticleSystem name = Particle_Ricco
  Create prefix = "TRG_PC_BadGuy2_"
  Create prefix = "Detonator2_"
  Create prefix = "Mine2_"
  MakeSkaterGoto SkaterInit
  Wait 1 Frame
  skater:Obj_MoveToNode name = TRG_G_GAP5_RestartNode02 Orient
endscript
script PC_CAS_Controller
  Obj_VarSet var = 0 value = 0
  Obj_VarSet var = 1 value = 0
  Obj_ClearFlag OBJFLAG_CAS_RESET_STAGE
  Obj_ClearFlag OBJFLAG_CAS_STEP_UP
  Obj_ClearFlag OBJFLAG_CAS_END_LOC
  Printf "stage 1"
  begin
    if skater:IsInBail
      if not Obj_FlagSet OBJFLAG_CAS_RESET_STAGE
        Obj_SetFlag OBJFLAG_CAS_RESET_STAGE
      endif
    endif
    if Obj_VarGT var = 0 value = 6
      create_panel_block id = current_goal text = "Now Lip Trick on the Chopper's landing skid" style = panel_message_goal
      Obj_ClearFlag OBJFLAG_CAS_END_LOC
      break
    endif
    if Obj_FlagSet OBJFLAG_CAS_STEP_UP
      Printf "got stepup"
      Obj_ClearFlag OBJFLAG_CAS_STEP_UP
      Obj_VarInc var = 0
    endif
    if Obj_FlagSet OBJFLAG_CAS_RESET_STAGE
      KillSpawnedScript id = CAPS_PC_SpawnedScript
      Wait 1 Frame
      SpawnScript PC_CAS_RestartStage1 id = CAPS_PC_SpawnedScript
      create_panel_message id = MiniGame1 text = "CUT, CUT, CUT!" style = panel_sprite_goalfail
      PlayStream random( @director_goalfail01 @director_goalfail02 @director_goalfail03 @director_goalfail04 ) 
      Wait 2.3 seconds
      Obj_ClearFlag OBJFLAG_CAS_RESET_STAGE
      Obj_ClearFlag OBJFLAG_CAS_STEP_UP
      Obj_VarSet var = 0 value = 0
      Obj_VarSet var = 1 value = 0
    endif
    Wait 10 Frame
  repeat
  begin
    if Obj_FlagSet OBJFLAG_CAS_END_LOC
      break
    endif
    if Obj_FlagSet OBJFLAG_CAS_RESET_STAGE
      SpawnScript PC_CAS_RestartStage1
      create_panel_message id = MiniGame1 text = "CUT, CUT, CUT!" style = panel_sprite_goalfail
      PlayStream random( @director_goalfail01 @director_goalfail02 @director_goalfail03 @director_goalfail04 ) 
      Wait 2.3 seconds
      create_panel_block id = current_goal text = "Hit all of the Green Detonators in one Combo" style = panel_message_goal
      Obj_ClearFlag OBJFLAG_CAS_RESET_STAGE
      Obj_ClearFlag OBJFLAG_CAS_STEP_UP
      Obj_VarSet var = 0 value = 0
      Obj_VarSet var = 1 value = 0
    endif
    Wait 10 frames
  repeat
  if GoalManager_SetGoalFlag name = Jnk_Goal_Gaps5 got_01 1
    Printf "got gap 1"
  endif
  Wait 20 frames
  PauseSkaters
  Wait 2 seconds
  UnPauseSkaters
  Kill prefix = "TRG_PC_BadGuy_"
  Kill prefix = "Detonator_"
  Kill prefix = "Mine_"
  SpawnScript PC_CAS_RestartStage2
  PlaySkaterCamAnim skater = 0 name = G_GAPS5_TRICKCAM
  PauseSkaters
  if IsAlive name = TRG_PC_RiccoChecker
    ClearFlag name = TRG_PC_RiccoChecker OBJFLAG_CAS_FIRING
  endif
  Wait 1 seconds
  PlaySkaterCamAnim skater = 0 stop
  UnPauseSkaters
  Obj_VarSet var = 0 value = 0
  Obj_VarSet var = 1 value = 0
  if IsAlive name = TRG_PC_RiccoChecker
    ClearFlag name = TRG_PC_RiccoChecker OBJFLAG_CAS_FIRING
  endif
  Obj_ClearFlag OBJFLAG_CAS_RESET_STAGE
  Obj_ClearFlag OBJFLAG_CAS_STEP_UP
  Obj_ClearFlag OBJFLAG_CAS_END_LOC
  Printf "stage 2"
  begin
    if skater:IsInBail
      Obj_SetFlag OBJFLAG_CAS_RESET_STAGE
    endif
    if Obj_FlagSet OBJFLAG_CAS_END_LOC
      if Obj_VarGT var = 0 value = 0
        break
      endif
    endif
    if Obj_FlagSet OBJFLAG_CAS_STEP_UP
      Obj_ClearFlag OBJFLAG_CAS_STEP_UP
      Obj_VarInc var = 0
    endif
    if Obj_FlagSet OBJFLAG_CAS_RESET_STAGE
      SpawnScript PC_CAS_RestartStage2
      create_panel_message id = MiniGame1 text = "CUT, CUT, CUT!" style = panel_sprite_goalfail
      PlayStream random( @director_goalfail01 @director_goalfail02 @director_goalfail03 @director_goalfail04 ) 
      Wait 2 seconds
      Obj_ClearFlag OBJFLAG_CAS_RESET_STAGE
      Obj_ClearFlag OBJFLAG_CAS_STEP_UP
      Obj_VarSet var = 0 value = 0
      Obj_VarSet var = 1 value = 0
    endif
    Wait 10 Frame
  repeat
  PauseSkaters
  PC_Helo_Blades08:Obj_RotY angle = 50 speed = 2000
  if GoalManager_SetGoalFlag name = Jnk_Goal_Gaps5 got_02 1
    Printf "got gap 2"
  endif
  Wait 2 seconds
  Obj_VarSet var = 0 value = 0
  Obj_VarSet var = 1 value = 0
  Obj_ClearFlag OBJFLAG_CAS_RESET_STAGE
  Obj_ClearFlag OBJFLAG_CAS_STEP_UP
  Obj_ClearFlag OBJFLAG_CAS_END_LOC
  PlaySkaterCamAnim skater = 0 stop
  UnPauseSkaters
  SetSlomo 1
  SpawnScript PC_CAS_RestartStage3
  PlaySkaterCamAnim skater = 0 name = G_GAPS5_LASTRUNCAM play_hold
  PauseSkaters
  Wait 13 seconds
  PlaySkaterCamAnim skater = 0 stop
  pulse_blur start = 255 speed = 2
  UnPauseSkaters
  Printf "stage 3"
  begin
    if skater:IsInBail
      Obj_SetFlag OBJFLAG_CAS_RESET_STAGE
    endif
    if Obj_FlagSet OBJFLAG_CAS_END_LOC
      if Obj_VarGT var = 0 value = 0
        break
      endif
    endif
    if Obj_FlagSet OBJFLAG_CAS_STEP_UP
      Obj_ClearFlag OBJFLAG_CAS_STEP_UP
      Obj_VarInc var = 0
    endif
    if Obj_FlagSet OBJFLAG_CAS_RESET_STAGE
      SpawnScript PC_CAS_RestartStage3
      create_panel_message id = MiniGame1 text = "CUT, CUT, CUT!" style = panel_sprite_goalfail
      Wait 2 seconds
      Obj_ClearFlag OBJFLAG_CAS_RESET_STAGE
      Obj_ClearFlag OBJFLAG_CAS_STEP_UP
      Obj_VarSet var = 0 value = 0
      Obj_VarSet var = 1 value = 0
    endif
    Wait 10 Frame
  repeat
  Printf "done!!!!"
  Wait 2 Frame
  PauseSkaters
  Wait 2 seconds
  if GoalManager_SetGoalFlag name = Jnk_Goal_Gaps5 got_03 1
    Printf "got gap 2"
  endif
endscript
script Jnk_Stage1_TrackSwap
  Jnk_TrainRail_A
endscript
OBJFLAG_CRANE_MOVELEFT = 0
OBJFLAG_CRANE_MOVERIGHT = 1
OBJFLAG_CRANE_TURNLEFT = 2
OBJFLAG_CRANE_TURNRIGHT = 3
OBJFLAG_CRANE_DONEMOVE = 4
OBJFLAG_CRANE_DONEROTATE = 5
OBJFLAG_CRANE_STOP = 6
script Jnk_Crane_CheckMove Time = <Time>
  if not Obj_FlagSet OBJFLAG_CRANE_STOP
    if Obj_FlagSet OBJFLAG_CRANE_MOVELEFT
      Obj_WaitMove
      Obj_ClearFlag OBJFLAG_CRANE_MOVELEFT
      Obj_MoveToNode name = <LeftNode> Time = 5
    endif
    if Obj_FlagSet OBJFLAG_CRANE_MOVERIGHT
      Obj_WaitMove
      Obj_ClearFlag OBJFLAG_CRANE_MOVERIGHT
      Obj_MoveToNode name = <RightNode> Time = 5
    endif
  endif
endscript
script Jnk_Crane_CheckTurn
  if not Obj_FlagSet OBJFLAG_CRANE_STOP
    if Obj_FlagSet OBJFLAG_CRANE_TURNLEFT
      Obj_WaitRotate
      Obj_ClearFlag OBJFLAG_CRANE_TURNLEFT
      Obj_RotY angle = 90 speed = 30
    endif
    if Obj_FlagSet OBJFLAG_CRANE_TURNRIGHT
      Obj_WaitRotate
      Obj_ClearFlag OBJFLAG_CRANE_TURNRIGHT
      Obj_RotY angle = -90 speed = 30
    endif
  endif
endscript
script Jnk_Crane_CheckFlags
  Obj_WaitRotate
  Obj_WaitMove
  Wait 10 Frame
endscript
script Jnk_Crane_Container
  begin
    Jnk_Crane_CheckMove LeftNode = <LeftNode> RightNode = <RightNode>
    Jnk_Crane_CheckTurn
    Wait 9 Frame
  repeat
endscript
script Jnk_Crane_Control
  begin
    Jnk_Crane_CheckMove LeftNode = <LeftNode> RightNode = <RightNode>
    Jnk_Crane_CheckTurn
    Wait 8 Frame
  repeat
endscript
script Jnk_Crane_Base
  begin
    Jnk_Crane_CheckMove LeftNode = <LeftNode> RightNode = <RightNode>
    Wait 10 Frame
  repeat
endscript
script Jnk_Crane_Arm
  begin
    Jnk_Crane_CheckMove LeftNode = <LeftNode> RightNode = <RightNode>
    Jnk_Crane_CheckTurn
    Wait 9 Frame
  repeat
endscript
script Jnk_CraneController
  begin
    Wait 10 seconds
    SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_MOVERIGHT
    SendFlag prefix = "TRG_Crane02" OBJFLAG_CRANE_TURNLEFT
    Wait 3 seconds
    SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_TURNRIGHT
    SendFlag prefix = "TRG_Crane02" OBJFLAG_CRANE_TURNLEFT
    Wait 3 seconds
    SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_MOVELEFT
    SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_TURNRIGHT
    Wait 3 seconds
    SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_TURNRIGHT
    SendFlag prefix = "TRG_Crane02" OBJFLAG_CRANE_TURNLEFT
    SendFlag prefix = "TRG_Crane02" OBJFLAG_CRANE_MOVERIGHT
    Wait 15 seconds
    SendFlag prefix = "TRG_Crane02" OBJFLAG_CRANE_MOVELEFT
    SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_TURNLEFT
    SendFlag prefix = "TRG_Crane02" OBJFLAG_CRANE_TURNRIGHT
    Wait 3 seconds
    SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_MOVERIGHT
    Wait 3 seconds
    SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_TURNLEFT
    Wait 3 seconds
    SendFlag prefix = "TRG_Crane02" OBJFLAG_CRANE_TURNRIGHT
    SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_TURNLEFT
    Wait 3 seconds
    SendFlag prefix = "TRG_Crane02" OBJFLAG_CRANE_TURNRIGHT
    SendFlag prefix = "TRG_Crane01" OBJFLAG_CRANE_MOVELEFT
  repeat
endscript
script JNK_SecondCraneController
endscript
script Jnk_Trashcan_CanBounce
   <Can1>:BouncyObj_Go (20, 370, 20)
   <Can2>:BouncyObj_Go (-20, 370, -20)
endscript
script Jnk_SFX_Proxim
  if Inside
    if not IsAlive name = <SoundNode>
      Create name = <SoundNode>
    endif
  else
    Kill name = <SoundNode>
  endif
endscript
script Jnk_SFX
  Obj_PlaySound <sound>
  begin
    Wait 10 seconds
  repeat
endscript
script Jnk_SFX_DogBone
  PlaySound DogWhimper
endscript
script Jnk_SFX_Generator
  begin
    Obj_PlaySound GeneratorWobble
    Wait 3 seconds
  repeat
endscript
script Jnk_Stream_TV
  begin
    Obj_PlayStream TV_BG vol = 250
    Wait 3 seconds
  repeat
endscript
script Jnk_Gap_PureAir_Start
  StartGap {
    GapID = <StartGapID>
    flags = PURE_AIR }
endscript
script Jnk_Gap_PureManual_Start
  StartGap {
    GapID = <StartGapID>
    flags = PURE_MANUAL }
endscript
script Jnk_Gap_Lip_Start
  StartGap {
    GapID = <StartGapID>
    flags = [ require_lip cancel_ground cancel_wall CANCEL_MANUAL cancel_rail ] }
endscript
script Jnk_Gap_R_Start
  StartGap {
    GapID = <StartGapID>
    flags = [ cancel_ground CANCEL_MANUAL ] }
endscript
script Jnk_Gap_Gen_R2R_Small
  EndGap {
    GapID = <EndGapID>
    text = "Rail 2 Rail"
    Score = 50 }
endscript
script Jnk_Gap_Gen_R2R_Big
  EndGap {
    GapID = <EndGapID>
    text = "Big Rail 2 Rail"
    Score = 100 }
endscript
script Jnk_Gap_Gen_L2L_Small
  EndGap {
    GapID = <EndGapID>
    text = "Ledge 2 Ledge"
    Score = 50 }
endscript
script Jnk_Gap_Gen_L2R_Small
  EndGap {
    GapID = <EndGapID>
    text = "Ledge 2 Rail"
    Score = 50 }
endscript
script Jnk_Gap_Gen_R2L_Small
  EndGap {
    GapID = <EndGapID>
    text = "Rail 2 Ledge"
    Score = 50 }
endscript
script Jnk_Gap_Gen_T2T_Small
  EndGap {
    GapID = <EndGapID>
    text = "Track 2 Track"
    Score = 50 }
endscript
script Jnk_Gap_Gen_R2T_Small
  EndGap {
    GapID = <EndGapID>
    text = "Rail 2 Track"
    Score = 50 }
endscript
script Jnk_Gap_Gen_T2R_Small
  EndGap {
    GapID = <EndGapID>
    text = "Track 2 Rail"
    Score = 50 }
endscript
script Jnk_Gap_BuildingHop
  EndGap {
    GapID = <EndGapID>
    text = "Building Hop"
    Score = 50 }
endscript
script Jnk_Gap_Transfer
  EndGap {
    GapID = <EndGapID>
    text = "Transfer"
    Score = 25 }
endscript
script Jnk_Gap_SmashTransfer
  EndGap {
    GapID = <EndGapID>
    text = "Roof Smash Transfer"
    Score = 100 }
endscript
script Jnk_Gap_RustyLip
  Wait 1 Frame
  EndGap {
    GapID = <EndGapID>
    text = "Rusty Lip"
    Score = 50 }
endscript
script Jnk_Gap_WareLedgeMadness
  EndGap {
    GapID = <EndGapID>
    text = "Warehouse Ledge Madness!"
    Score = 100 }
endscript
script Jnk_Gap_TrailerHop
  EndGap {
    GapID = <EndGapID>
    text = "Trailer Hop"
    Score = 50 }
endscript
script Jnk_Gap_DirtyWater
  EndGap {
    GapID = <EndGapID>
    text = "Dirty Water"
    Score = 50 }
endscript
script Jnk_Gap_ConveyorQPTransfer
  EndGap {
    GapID = <EndGapID>
    text = "Conveyor QP Transfer"
    Score = 100 }
endscript
script Jnk_Gap_AwningHop
  EndGap {
    GapID = <EndGapID>
    text = "Awning Hop"
    Score = 50 }
endscript
script Jnk_Gap_CircleT
  Wait 1 Frame
  EndGap {
    GapID = <EndGapID>
    text = "CircleT"
    Score = 100 }
endscript
script Jnk_Gap_MoreBargeFun
  EndGap {
    GapID = <EndGapID>
    text = "More Barge Fun!"
    Score = 50 }
endscript
script Jnk_Gap_IntoTheBarges
  EndGap {
    GapID = <EndGapID>
    text = "Into the Barges"
    Score = 50 }
endscript
script Jnk_Gap_DockTransfer
  EndGap {
    GapID = <EndGapID>
    text = "Dock Transfer"
    Score = 50 }
endscript
script Jnk_Gap_Onarabana
  EndGap {
    GapID = <EndGapID>
    text = "ONARABANA"
    Score = 50 }
endscript
script Jnk_Gap_VentClaust
  EndGap {
    GapID = <EndGapID>
    text = "Ventilation Claustrophobia"
    Score = 100 }
endscript
script Jnk_Gap_AwningManual
  EndGap {
    GapID = <EndGapID>
    text = "Awning Manual"
    Score = 200 }
endscript
script Jnk_Gap_PerfectDog_Start
  StartGap {
    GapID = <StartGapID>
    flags = [ cancel_ground cancel_wall ] }
endscript
script Jnk_Gap_PerfectDog
  EndGap {
    GapID = <EndGapID>
    text = "5 bones 1 combo"
    Score = 200 }
endscript
script Jnk_AddGoal_Gaps6
  AddGoal_Gaps6 {
    CAREER_ONLY
    Pro_specific_challenge
    Pro_challenge_title = "K-Grind Cables"
    Pro_challenge_text = "If it involves skating, Koston can probably master it. If all he did was invent the Crooked Grind, you'd know him. But Koston keeps pushing in new directions, chomping on long ledges, triple kinks, and handrails that go on for days."
    Pro_challenge_tag_line = "Time to test your balance..."
    Pro_challenge_pro_name = "Eric"
    Goal_Text = "Eric's Pro Specific Challenge"
    Pro = "photoguy"
    full_name = "Atiba Jefferson"
    View_Goals_Text = "Eric's Pro Specific Challenge"
    Goal_Description = Jnk_Gaps6_Desc
    Goal_Flags = [
      got_01
      got_02
      got_03
    ]
    Time = 360
    Use_Hud_Counter
    Goal_Intro_Script = jnk_Goal_Gap6_Intro
    Goal_Deactivate_Script = jnk_Goal_Gap6_Deactivate
    Intro_Node = TRG_G_GAP6_IntroNode
    record_type = Time
    custom_score_record = 0
  }
endscript
FLAG_KOSTON_COMPGEOON = 0
script jnk_Goal_Gap6_Intro
  Kill prefix = "GAPS3_LO_CRANE0"
  Kill prefix = "TRG_Veh_Shp_Dck_Crne_B"
  Kill prefix = "TRG_Crane0"
  Kill prefix = "TRG_CraneControl"
  if GetFlag flag = FLAG_G_COMP_GEO_ON
    UnSetFlag flag = FLAG_G_COMP_GEO_ON
    toggle_geo_nomenu bit = 5 param_id = toggle_comp_geo_params flag = FLAG_G_COMP_GEO_ON Geo_prefix = "G_COMP_" trg_prefix = "TRG_G_COMP_" geo_not_prefix = "G_COMPNOT_" trg_not_prefix = "TRG_G_COMPNOT_" id = toggle_comp_geo
  endif
  Create prefix = "GAPS3_LO_CRANE0"
  Create prefix = "G_GAPS6_Support"
  Create prefix = "G_GAPS6PLATFORM"
  Create prefix = "G_GAPS6_Support"
  Create prefix = "G_GAPS6_STARTRUN"
  Create prefix = "TRG_G_GAPS6_Grind"
  Create prefix = "TRG_G_GAPS6_Rail1"
  Create name = G_GAPS6_WIRE_01
  Create name = G_GAPS6_WIRE_02
  Create name = G_GAPS6_WIRE_03
  Create name = G_GAPS6_WIRE_04
  Create name = G_GAPS6_WIRE_05
  Create name = G_GAPS6_WIRE_06
  Create name = G_GAPS6_WIRE_07
  Create name = G_GAPS6_WIRE_019
  Create name = G_GAPS6_Corner01
  Create name = G_GAPS6_Corner03
  Create name = G_GAPS6_Corner04
  Create name = G_GAPS6_Corner05
  Create name = G_GAPS6_Corner06
  Create prefix = "TRG_Crane01_Base"
  Create prefix = "TRG_Crane02_Base"
  Create prefix = "TRG_Crane03_Base"
  TRG_Crane01_Base:Obj_SwitchScript Jnk_Gaps6_Crane params = { GAPS3_LO_CRANE02_ARM }
  TRG_Crane02_Base:Obj_SwitchScript Jnk_Gaps6_Crane
  TRG_Crane03_Base:Obj_SwitchScript Jnk_Gaps6_Crane params = { GAPS3_LO_CRANE03_ARM }
  Wait 1 Frame
  GAPS3_LO_CRANE01_ARM:Gap6_Stopscript
  GAPS3_LO_CRANE01_CONT:Gap6_Stopscript
  GAPS3_LO_CRANE02_ARM:Gap6_Stopscript
  GAPS3_LO_CRANE02_CONT:Gap6_Stopscript
  GAPS3_LO_CRANE03_ARM:Gap6_Stopscript
  GAPS3_LO_CRANE03_CONT:Gap6_Stopscript
endscript
script jnk_Goal_Gap6_Deactivate
  Kill prefix = "GAPS3_LO_CRANE0"
  Kill prefix = "G_GAPS6PLATFORM"
  Kill prefix = "G_GAPS6_Support"
  Kill prefix = "G_GAPS6_STARTRUN"
  Kill prefix = "G_GAPS6_CORNER"
  Kill prefix = "G_GAPS6_WIRE"
  Kill prefix = "TRG_G_GAPS6_Grind"
  Kill prefix = "TRG_G_GAPS6_Rail"
  Kill prefix = "TRG_CraneControl"
  Kill prefix = "TRG_Crane01_Base"
  Kill prefix = "TRG_Crane02_Base"
  Kill prefix = "TRG_Crane03_Base"
  Create prefix = "TRG_Crane0"
  Create prefix = "TRG_CraneControl"
  skater:KillSkater node = TRG_G_GAP6_IntroNode
endscript
script jnk_Goal_Gap6_Success
  Kill prefix = "GAPS3_LO_CRANE0"
endscript
script Gap6_Stopscript
  Obj_SetPathVelocity 0
  Obj_StopAlongPath
endscript
script Jnk_Gaps6_Crane
  if GotParam GAPS3_LO_CRANE02_ARM
    Obj_MoveToNode name = GAPS3_LO_CRANE02_ARM
  endif
  if GotParam GAPS3_LO_CRANE03_ARM
    Obj_MoveToNode name = GAPS3_LO_CRANE03_ARM
  endif
endscript
script jnk_gaps6_grindCheck
  begin
    Wait 100 Frame
  repeat
endscript
script jnk_gaps6_grindChecking restartNode = TRG_G_GAP6_RestartNode
  Wait 30 frames
  begin
    if skater:IsInBail
      Printf "skater bailed"
      begin
        if not skater:IsInBail
          break
        endif
        Wait 1 Frame
      repeat
      Printf "skater done bailing"
      create_panel_message style = panel_message_death id = death_message text = "You Bailed!"
      skater:KillSkater node = <restartNode>
      break
      Wait 5 frames
    endif
    if skater:OnGround
      Printf "skater on ground"
      Wait 5 frames
      create_panel_message style = panel_message_death id = death_message text = "Off the rail!"
      skater:KillSkater node = <restartNode>
      break
    endif
    Wait 5 Frame
    Printf "checking for falls"
  repeat
  begin
    Wait 100 Frame
  repeat
endscript
script jnk_Gaps6_Start1
  if IsAlive name = TRG_G_GAPS6_GrindCheck
    TRG_G_GAPS6_GrindCheck:jnk_gaps6_grindChecking restartNode = TRG_G_GAP6_RestartNode
  endif
endscript
script jnk_Gaps6_Start2
  if IsAlive name = TRG_G_GAPS6_GrindCheck
    TRG_G_GAPS6_GrindCheck:jnk_gaps6_grindChecking restartNode = TRG_G_GAP6_RestartNode01
  endif
endscript
script jnk_Gaps6_Start3
  if IsAlive name = TRG_G_GAPS6_GrindCheck
    TRG_G_GAPS6_GrindCheck:jnk_gaps6_grindChecking restartNode = TRG_G_GAP6_RestartNode02
  endif
endscript
script jnk_Gaps6_StartRun1
  StartGap GapID = Jnk_Gap6_Run1 flags = [ cancel_ground ] trickscript = jnk_gaps6_run1Done
endscript
script jnk_Gaps6_EndRun1
  EndGap GapID = Jnk_Gap6_Run1 text = "Run 1!!!" Score = 500 Gapscript = jnk_gaps6_run1Done
endscript
script jnk_Gaps6_StartRun2
  StartGap GapID = Jnk_Gap6_Run2 flags = [ cancel_ground ] trickscript = jnk_gaps6_run2Done
endscript
script jnk_Gaps6_EndRun2
  EndGap GapID = Jnk_Gap6_Run2 text = "Run 2!!!" Score = 500 Gapscript = jnk_gaps6_run2Done
endscript
script jnk_Gaps6_StartRun3
  StartGap GapID = Jnk_Gap6_Run3 flags = [ cancel_ground ] trickscript = jnk_gaps6_run3Done
endscript
script jnk_Gaps6_EndRun3
  EndGap GapID = Jnk_Gap6_Run3 text = "Run 3!!!" Score = 500 Gapscript = jnk_gaps6_run3Done
endscript
script jnk_gaps6_run1Done
  if GoalManager_GoalIsActive name = Jnk_goal_Gaps6
    if GoalManager_SetGoalFlag name = Jnk_goal_Gaps6 got_01 1
      Kill prefix = "TRG_G_GAPS6_Grind"
      Create prefix = "TRG_G_GAPS6_Grind"
      Create name = G_GAPS6_WIRE_09
      Create name = G_GAPS6_WIRE_10
      Create name = G_GAPS6_WIRE_11
      Create name = G_GAPS6_WIRE_12
      Create name = G_GAPS6_Corner08
      Create prefix = "TRG_G_GAPS6_Rail3"
      Wait 1 frames
      skater:KillSkater node = TRG_G_GAP6_RestartNode01
    endif
  endif
endscript
script jnk_gaps6_run2Done
  if GoalManager_GoalIsActive name = Jnk_goal_Gaps6
    if GoalManager_SetGoalFlag name = Jnk_goal_Gaps6 got_02 1
      Kill prefix = "TRG_G_GAPS6_Grind"
      Create prefix = "TRG_G_GAPS6_Grind"
      Create prefix = "G_GAPS6_WIRE_"
      Create prefix = "G_GAPS6_Corner"
      Create prefix = "TRG_G_GAPS6_Rail2"
      Wait 5 frames
      skater:KillSkater node = TRG_G_GAP6_RestartNode02
    endif
  endif
endscript
script jnk_gaps6_run3Done
  if GoalManager_GoalIsActive name = Jnk_goal_Gaps6
    if GoalManager_SetGoalFlag name = Jnk_goal_Gaps6 got_03 1
      Kill prefix = "TRG_G_GAPS6_Grind"
    endif
  endif
endscript
script Jnk_TS2_Intro
  GetKeyComboArrayFromTrickArray tricks = [ Trick_VarialKickflip ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
  FormatText TextName = VKickflipText "Varial kickflip\n (%a)\n the shack water gap" a = <combo_1>
  GoalManager_EditGoal name = Jnk_Goal_Trickspot2 params = { Goal_Text = <VKickflipText> }
endscript
script Jnk_TS2_Start
  GetKeyComboArrayFromTrickArray tricks = [ Trick_VarialKickflip ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
  FormatText TextName = VKickflipText "Varial kickflip\n (%a)\n the shack water gap" a = <combo_1>
  GoalManager_EditGoal name = Jnk_Goal_Trickspot2 params = { Goal_Text = <VKickflipText> }
endscript
