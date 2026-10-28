script SF2_Setup
  if IsCareerMode
    Printf "is career mode"
    if not GoalManager_HasWonGoal Name = SF2_Goal_SPECIAL
      Create Prefix = "TRG_G_SPECIALTrick_Husband"
    endif
    if GoalManager_HasWonGoal Name = SF2_Goal_Counter
      Kill Prefix = "TRG_Ped_Seal_Husband"
    endif
    if GoalManager_HasWonGoal Name = SF2_Goal_Counter3
      Kill Prefix = "Skate_Stopper"
    endif
    if GoalManager_HasSeenGoal Name = SF2_Goal_GAPS2
      Printf "shark not active"
      Kill Name = P7_Seal_Ladder
      CJR_SF2_SharkPier_Break_Fast
      if GoalManager_HasWonGoal Name = SF2_Goal_GAPS2
        Printf "won GAPS2"
        Kill Prefix = "EMB_Ball07"
        Kill Prefix = "JOW_EMB_BallShadow"
        Kill Prefix = "G_Gap2_SupportWires"
        Kill Prefix = "TRG_G_GAP2_WireNode"
      else
        Printf "haven't won GAPS2"
        Printf "shark active"
        Kill Prefix = "EMB_Ball09"
        Create Prefix = "TRG_Ped_Painter01"
      endif
    else
      Printf "normal start"
      Kill Prefix = "EMB_Ball09"
      Create Prefix = "TRG_Pigeon"
      Create Prefix = "TRG_Ped_Painter01"
      Create Prefix = "TRG_G_GAP2_Pro01"
    endif
  else
    Kill Prefix = "TRG_Seal0"
    Kill Prefix = "TRG_Ped_Seal_Husband"
  endif
endscript
script SF2_Startup
  LoadSound "Shared\Auto\CarBrakeSqueal" Vol = 100 Dropoff = 150
  LoadSound "Shared\Auto\LA_Skid_11" Vol = 100 Dropoff = 150
  LoadSound "Shared\Auto\CarLoop" Vol = 100 Dropoff = 150 PosUpdateWithDoppler
  LoadSound "Shared\Auto\CarHorn_11" Vol = 100 Dropoff = 150
  LoadSound "Shared\Auto\CarAlarm" Vol = 100 Dropoff = 150
  LoadSound "Shared\animal\hitseagulls" Vol = 100 Dropoff = 150
  LoadSound "Shared\Hits\HitMetalCan_11" Vol = 100 Dropoff = 150 PosUpdateWithDoppler
  LoadSound "skater\armwhoosh01" Vol = 100 Dropoff = 150 PosUpdateWithDoppler
  LoadSound "Shared\Hits\HitGlassPane2x"
  LoadSound "Shared\water\FallWater"
  LoadSound "SF2\Rap_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\Scratchloop_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_BeatScratch_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Alarm01_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_DropLevel_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_RaiseLevel_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Beat01_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Beat02_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Beat03_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Beat04_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Beat05_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Beat06_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Beat07_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Beat08_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Beat09_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Bass01_44" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Bass02_44" Vol = 100 Dropoff = 150
  LoadSound "SF2\MB_Flip_44" Vol = 100 Dropoff = 150
  LoadSound "SF2\scratch_01_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\scratch_02_11" Vol = 100 Dropoff = 150
  LoadSound "SF2\scratch_03_11" Vol = 100 Dropoff = 150
endscript
script Sf2_Goals
  if InMultiplayerGame
    Add_MultiPlayer_Mode_Goals
  endif
  if not InSplitScreenGame
    if not GameModeEquals is_singlesession
      SF2_AddGoal_HighScore
      SF2_AddGoal_Skate
      SF2_AddGoal_Combo
      SF2_AddGoal_Collect
      SF2_AddGoal_Trickspot
      SF2_AddGoal_Counter
      SF2_AddGoal_Gaps
      SF2_AddGoal_Horse
      SF2_AddGoal_Special
      SF2_AddGoal_Competition
      SF2_AddGoal_ProScore
      SF2_AddGoal_Gaps2
      SF2_AddGoal_Race2
      SF2_AddGoal_Race
      SF2_AddGoal_Counter2
      SF2_AddGoal_Tetris
      SF2_AddGoal_SickScore
      SF2_AddGoal_ProCombo
      SF2_AddGoal_CounterCombo
      SF2_AddGoal_Gaps3
      SF2_AddGoal_Counter3
      SF2_AddGoal_Counter4
      SF2_AddGoal_Tetris2
      SF2_AddGoal_Gaps4
      SF2_AddMinigame_Generic
    endif
  endif
endscript
script SF2_AddGoal_HighScore
  AddGoal_HighScore {
    record_type = time
    Goal_Text = sf2_highscore_text
    View_Goals_Text = sf2_highscore_text
    Score = sf2_highscore_score
    Pro = "kareem"
    Full_Name = "Kareem Campbell"
    Intro_Node = TRG_G_HS_Intro_Node
    Start_Cam_Anim = G_HS_CameraStart
    success_cam_anim = G_HS_CameraSuccess
    Reward_Goal = Sf2_Goal_ProScore
    Goal_Description = sf2_highscore_desc }
endscript
script SF2_AddGoal_ProScore
  AddGoal_ProScore {
    record_type = time
    Goal_Text = sf2_proscore_text
    View_Goals_Text = sf2_proscore_text
    win_wait_time = 30
    Score = sf2_proscore_score
    Pro = "kareem"
    Full_Name = "Kareem Campbell"
    Intro_Node = TRG_G_PS_Intro_Node
    Start_Cam_Anim = G_PS_CameraStart
    success_cam_anim = G_PS_CameraSuccess
    Unlocked_By_Another
    Goal_Description = sf2_proscore_desc }
endscript
script SF2_AddGoal_SickScore
  AddGoal_SickScore {
    record_type = time
    Goal_Text = sf2_sickscore_text
    View_Goals_Text = sf2_sickscore_text
    win_wait_time = 30
    Score = sf2_sickscore_score
    Pro = "kareem"
    Full_Name = "Kareem Campbell"
    Intro_Node = TRG_G_SS_Intro_Node
    Start_Cam_Anim = G_SS_CameraStart
    success_cam_anim = G_SS_CameraSuccess
    Pro_Goal
    Goal_Description = sf2_sickscore_desc }
endscript
script SF2_AddGoal_Combo
  AddGoal_Combo {
    record_type = Score
    Goal_Text = "Collect C-O-M-B-O"
    View_Goals_Text = "Collect the C-O-M-B-O letters"
    win_wait_time = 30
    Pro = "SkateRat"
    Full_Name = "Skater Kid"
    Goal_Description = sf2_combo_desc }
  Intro_Node = TRG_G_COMBO_Intro_Node
endscript
script SF2_AddGoal_ProCombo
  AddGoal_ProCombo {
    record_type = Score
    Goal_Text = "Collect C-O-M-B-O"
    View_Goals_Text = "Collect Pro C-O-M-B-O"
    win_wait_time = 30
    Pro = "SkateRat"
    Full_Name = "Skater Kid"
    Pro_Goal
    Goal_Description = sf2_procombo_desc }
endscript
script SF2_AddGoal_Skate
  AddGoal_Skate {
    record_type = time
    Goal_Text = "Collect S-K-A-T-E"
    View_Goals_Text = "Collect the S-K-A-T-E letters"
    win_wait_time = 30
    Pro = "PainterNeal"
    Full_Name = "Painter Bob"
    Intro_Node = TRG_G_SKATE_Intro_Node
    Start_Cam_Anim = G_SKATE_CameraStart
    success_cam_anim = G_SKATE_CameraSuccess
    Goal_Description = sf2_skate_desc }
endscript
script SF2_AddGoal_Collect
  AddGoal_Collect {
    record_type = time
    Goal_Text = "Find the Messenger's 5 Missing Packages"
    View_Goals_Text = "Find the Messenger's 5 Missing Packages"
    win_wait_time = 30
    Pro = "messenger"
    Full_Name = "Bike Messenger"
    Intro_Node = TRG_G_Collect_Intro_Node
    Trigger_Prefix = "TRG_G_COLLECT_Package"
    Goal_Flags = [
      Got_1_Package
      Got_2_Package
      Got_3_Package
      Got_4_Package
      Got_5_Package
    ]
    Collect_Type = "Packages"
    Num_Flags = 5
    Start_Cam_Anim = G_COLLECT_CameraStart
    success_cam_anim = G_COLLECT_CameraSuccess
    Use_Hud_Counter
    Hud_Counter_Caption = "Packages"
    Reward_Goal = SF2_Goal_Race2
    Goal_Description = sf2_collect_desc }
endscript
script SF2_AddGoal_Trickspot
  AddGoal_Trickspot {
    record_type = time
    Goal_Text = "\t1 3 Pier Signs"
    key_combo_text = "\n\t1\n\k1"
    View_Goals_Text = "\t1 the 3 Pier Signs"
    ProSet_Prefix = "ProSet2_"
    win_wait_time = 30
    Goal_Flags = [
      Got_1_TS_Lip
      Got_2_TS_Lip
      Got_3_TS_Lip
    ]
    Pro = "Photoguy"
    Full_Name = "Atiba Jefferson"
    Start_Cam_Anim = G_TS_CameraStart
    key_combos = [ Lip_TriangleR ]
    Use_Hud_Counter
    Hud_Counter_Caption = "Pier Signs"
    Reward_Goal = Sf2_Goal_Race
    Goal_Description = sf2_trickspot_desc }
endscript
script SF2_AddGoal_Counter
  AddGoal_Counter {
    record_type = time
    Goal_Text = "Feed the 4 Angry Sea Lions"
    View_Goals_Text = "Feed the 4 Angry Sea Lions"
    Number = 4
    win_wait_time = 30
    success_movie_wait_frames = 5
    Geo_Prefix = "G_Seal_"
    CAREER_ONLY
    Start_Cam_Anim = G_Seal_CameraStart
    success_cam_anim = G_Seal_CameraSuccess
    trigger_obj_id = TRG_G_Counter_Ped_Wife
    Pro = "Wife"
    Full_Name = "Distressed Wife"
    Intro_Node = TRG_G_Seal_Intro_Node
    Goal_Counter_Object_Init_Script = Nullscript
    next_trigger_script = SF2_Wife_Checking
    Goal_Intro_Script = SF2_Goal_Counter_Intro
    Goal_Deactivate_Script = SF2_Goal_Counter_Deactivate
    goal_outro_script = SF2_Goal_Counter_Outro
    counter_objects = [
      { ID = TRG_Fisherman_Payload01 }
      { ID = TRG_Fisherman_Payload02 }
      { ID = TRG_Fisherman_Payload03 }
      { ID = TRG_Fisherman_Payload04 }
    ]
    Goal_Description = sf2_counter_desc
    Use_Hud_Counter
    Hud_Counter_Caption = "Sea Lions fed"
  }
endscript
script SF2_AddGoal_Race
  AddGoal_Race {
    record_type = time
    Goal_Text = "Get the Camera"
    View_Goals_Text = "Race to get the Camera"
    CAREER_ONLY
    Goal_Flags = [
      Got_1_Camera
      Got_2_Thug
      Got_3_Film
      Got_4_End
    ]
    Race_Waypoints = [
      { ID = TRG_G_RACE_RaceNav01 Scr = SF2_Race_Waypoint_1 Flag = Got_1_Camera time = 25 }
      { ID = TRG_G_RACE_RaceNav02 Scr = SF2_Race_Waypoint_2 Flag = Got_2_Thug time = 12 }
      { ID = TRG_G_RACE_RaceNav03 Scr = SF2_Race_Waypoint_3 Flag = Got_3_Film time = 12 }
      { ID = TRG_G_RACE_RaceNav04 Scr = SF2_Race_Waypoint_4 Flag = Got_4_End time = 12 }
    ]
    Intro_Node = TRG_G_RACE_RaceNav04
    Start_Cam_Anim = G_RACE_CameraStart
    success_cam_anim = G_RACE_CameraSuccess
    ProSet_Prefix = "ProSet4_"
    Pro = "Photoguy"
    Full_Name = "Atiba Jefferson"
    Unlocked_By_Another
    Goal_Description = sf2_race_desc
    Goal_Intro_Script = SF2_Goal_Race_Intro
    Goal_Deactivate_Script = SF2_Goal_Race_Deactivate
  }
endscript
script SF2_AddGoal_Gaps
  AddGoal_Gaps {
    record_type = Score
    Goal_Text = "Manual the overhead walkway"
    key_combo_text = "\nManual\n\b7\b4 or \b4\b7"
    View_Goals_Text = "Manual the Overhead Walkway"
    win_wait_time = 30
    Goal_Flags = [ got_1
    ]
    Intro_Node = TRG_G_GAP_Intro_Node
    Start_Cam_Anim = G_GAP_CameraStart
    time = 10
    Pro = "Eric"
    Full_Name = "Eric Koston"
    Geo_Prefix = "Geo_Gap_"
    Reward_Goal = SF2_Goal_Counter2
    Goal_Description = sf2_gaps_desc
    Goal_Deactivate_Script = SF2_Goal_Gaps_Deactivate
  }
endscript
script SF2_AddGoal_Gaps2
  AddGoal_Gaps2 {
    record_type = time
    CAREER_ONLY
    Goal_Text = "Save Painter Neal"
    View_Goals_Text = "Save Painter Neal"
    Goal_Flags = [ got_1
    ]
    Start_Cam_Anim = G_GAP2_CameraStart
    success_cam_anim = G_GAP2_CameraSuccess1
    time = 30
    Pro = "PainterBob"
    Full_Name = "Painter Bob"
    Unlocked_By_Another
    Goal_Description = sf2_gaps2_desc
    Goal_Intro_Script = Sf2_Goal_Gap2_Intro
    Goal_Start_Script = Sf2_Goal_Gap2_Start
    Goal_Deactivate_Script = SF2_goal_gap2_deactivate
    goal_outro_script = Sf2_Goal_Gap2_Outro
    Goal_Success_Script = Sf2_Goal_Gap2_Success
  }
endscript
script SF2_AddGoal_Gaps3
  AddGoal_Gaps3 {
    record_type = Score
    goal_success_wait_frames = 30
    Goal_Text = "Do the Spine Transfer-Transfer"
    win_wait_time = 30
    View_Goals_Text = "Do the Spine Transfer-Transfer"
    Goal_Flags = [ got_1
    ]
    Start_Cam_Anim = G_GAP3_CameraStart
    Intro_Node = TRG_G_GAP3_Intro_Node
    time = 6
    Pro = "Chad"
    Full_Name = "Chad Muska"
    ProSet_Prefix = "ProSet1_"
    Geo_Prefix = "G_GAPS3_"
    Pro_Goal
    Goal_Intro_Script = Sf2_Goal_Gap3_Intro
    Goal_Deactivate_Script = Sf2_Goal_Gap3_Deactivate
    Goal_Description = sf2_gaps3_desc
  }
endscript
script SF2_AddGoal_CounterCombo
  AddGoal_CounterCombo {
    record_type = Score
    Goal_Text = "Manual the Pad in both directions in one combo"
    key_combo_text = "\nManual\n\b7\b4 or \b4\b7"
    View_Goals_Text = "Manual the Pad in both directions"
    win_wait_time = 30
    Pro = "Eric"
    Full_Name = "Eric Koston"
    Start_Cam_Anim = G_CC_CameraStart
    Number = 2
    Pro_Goal
    Goal_Description = sf2_countercombo_desc
    Use_Hud_Counter
    Hud_Counter_Caption = "Legs" }
endscript
script SF2_AddGoal_Special
  AddGoal_Special {
    record_type = time
    CAREER_ONLY
    Special_Gap
    Goal_Text = "Darkslide the Waterside Railing"
    key_combo_text = "\nDarkslide\n\k1"
    View_Goals_Text = "Darkslide the Waterside Railing"
    win_wait_time = 30
    Start_Cam_Anim = G_SPECIAL_CameraStart
    success_cam_anim = G_SPECIAL_CameraSuccess
    Goal_Intro_Script = SF2_Goal_Special_intro
    Goal_Deactivate_Script = SF2_Goal_Special_deactivate
    goal_outro_script = SF2_Goal_Special_Outro
    Goal_Success_Script = SF2_Goal_Special_Success
    Pro = "wife2"
    Full_Name = "Tourist"
    time = 30
    Intro_Node = TRG_G_SPECIAL_Intro_Node
    Trick_Name = Trick_Darkslide
    Trick_Type = grind
    reward_trickslot
    Goal_Description = sf2_special_desc
  }
endscript
script SF2_AddGoal_Competition
  AddGoal_Competition {
    CAREER_ONLY
    Goal_Text = "Medal the Competition"
    View_Goals_Text = "Medal the Competition"
    Pro = "Judge"
    Full_Name = "Competition Judge"
    Start_Cam_Anim = G_COMP_CameraStart
    success_cam_anim = G_COMP_CameraSuccess
    Intro_Node = TRG_G_COMP_Intro_Node
    Goal_Description = sf2_competition_desc
    Gold = 95
    Silver = 85
    Bronze = 70
    time = 60
    Gold_Score = sf2_comp_gold
    Silver_Score = sf2_comp_silver
    Bronze_Score = sf2_comp_bronze
    Bail = 1
  }
endscript
script SF2_AddGoal_Horse
  AddGoal_Horse {
    record_type = Score
    Goal_Text = "Beat Muska's 3 best combos"
    View_Goals_Text = "Beat Muska's 3 best combos"
    Pro = "Chad"
    Full_Name = "Chad Muska"
    Current_Goal_Text = "Beat my combo:"
    Start_Cam_Anim = G_Horse_CameraStart
    success_cam_anim = G_HORSE_CameraSuccess
    Intro_Node = TRG_G_HORSE_Intro_Node
    Pro = "Chad"
    Goal_Flags = [ got_1
      got_2
      got_3
    ]
    Horse_Spots = [ { ID = TRG_G_HORSE_Spot01 Scr = sf2_horse_spot01 Flag = got_1 Score = sf2_horse_score1 time = 30 }
      { ID = TRG_G_HORSE_Spot02 Scr = sf2_horse_spot02 Flag = got_2 Score = sf2_horse_score2 time = 30 }
      { ID = TRG_G_HORSE_Spot03 Scr = sf2_horse_spot03 Flag = got_3 Score = sf2_horse_score3 time = 30 }
    ]
    Goal_Description = sf2_horse_desc
    Reward_Goal = SF2_Goal_Tetris
  }
endscript
script SF2_AddGoal_Counter2
  AddGoal_Counter2 {
    Goal_Text = "Manual, Gap, and Manual the Proset in one combo"
    key_combo_text = "\nManual\n\b7\b4 or \b4\b7"
    View_Goals_Text = "Manual, Gap and Manual in one combo"
    record_type = time
    Pro = "Eric"
    Full_Name = "Eric Koston"
    Number = 5
    time = 10
    Start_Cam_Anim = G_COUNTER2_CameraStart
    success_cam_anim = G_COUNTER2_CameraSuccess
    Pro = "Eric"
    Geo_Prefix = "TRGP_G_COUNTER2_"
    ProSet_Prefix = "ProSet3_"
    Goal_Description = sf2_counter2_desc
    View_Goals_Text = "Manual, Gap and Manual the setup"
    Unlocked_By_Another
  }
endscript
script SF2_AddGoal_Race2
  AddGoal_Race2 {
    record_type = time
    Goal_Text = "Race the Bike Messenger"
    key_combo_text = "\nTo Skitch\nHold \b7\nTo Release\nTap \b4"
    View_Goals_Text = "Race the Bike Messenger"
    CAREER_ONLY
    Goal_Flags = [
      got_1
      got_2
    ]
    Race_Waypoints = [
      { ID = TRG_RACE2_RaceNav01 Scr = SF2_Race2_Waypoint_1 Flag = got_1 time = 30 }
      { ID = TRG_RACE2_RaceNav02 Scr = SF2_Race2_Waypoint_2 Flag = got_2 time = 0 }
    ]
    Pro = "messenger2"
    Full_Name = "Bike Messenger"
    Trigger_Prefix = "TRG_RACE2_Race"
    Unlocked_By_Another
    Goal_Description = sf2_race2_desc
    Goal_Start_Script = SF2_Goal_Race2_Start
    Goal_Deactivate_Script = SF2_Goal_Race2_Deactivate
  }
endscript
script SF2_AddGoal_Tetris
  AddGoal_Tetris {
    record_type = Score
    time = 60
    Trick_Flag = 0
    Goal_Text = "Hit the tricks into or off of the EMB ledge"
    View_Goals_Text = "Nail the tricks Muska yells out"
    Start_Cam_Anim = G_TETRIS_CameraStart
    success_cam_anim = G_TETRIS_CameraSuccess
    Unlocked_By_Another
    Pro = "chad"
    Full_Name = "Chad Muska"
    Goal_Description = sf2_tetris_desc
    Goal_Tetris_Key_Combos = [
      Air_SquareUL
      Air_SquareUR
      Air_SquareDL
      Air_SquareDR
      Air_SquareU
      Air_SquareD
      Air_SquareL
      Air_SquareR
    ]
    Acceleration_Interval = 8
    Acceleration_Percent = 0.02
    Time_To_Stop_Adding_Tricks = 13
  }
endscript
script SF2_AddGoal_Counter3
  AddGoal_Counter3 {
    CAREER_ONLY
    record_type = time
    Goal_Text = "Grind the Blockers off the Ledges"
    Trigger_Prefix = "TRG_Ped_Hubba_Guard01"
    View_Goals_Text = "Grind the Blockers off the Ledges"
    Number = 12
    time = 30
    win_wait_time = 30
    Start_Cam_Anim = G_COUNTER3_CameraStart
    Pro = "SkateRat"
    Full_Name = "Skater Kid"
    Goal_Description = sf2_counter3_desc
    Goal_Intro_Script = SF2_Goal_Counter3_Intro
    Goal_Deactivate_Script = SF2_Goal_Counter3_Deactivate
    Goal_Success_Script = SF2_Goal_Counter3_Success
    Pro_Goal
    Unlocked_By_Another
  }
endscript
script SF2_AddGoal_Counter4
  AddGoal_Counter4 {
    CAREER_ONLY
    record_type = time
    pro_specific_challenge
    pro_challenge_title = "Trick out the Beatz"
    pro_challenge_text = "Chad Muska is both an accomplished pro skater and a musical artist. Through his Muska Beatz label he offers a fresh take on hip-hop music. For Muska, the two worlds of skating and music are inseparable."
    pro_challenge_tag_line = "Time for some scratchin'..."
    pro_challenge_pro_name = "Chad"
    Goal_Text = "Nail tricks to increase the beat - don't bail"
    View_Goals_Text = "Chad's Pro Specific Challenge"
    Number = 8
    time = 300
    Pro = "producer"
    Full_Name = "Music Producer"
    Trigger_Prefix = "TRG_Test_Music"
    Goal_Description = sf2_counter4_desc
    Goal_Intro_Script = SF2_Goal_Counter4_Intro
    Goal_Deactivate_Script = SF2_Goal_Counter4_Deactivate
    Use_Hud_Counter
    Hud_Counter_Caption = " "
  }
endscript
script SF2_AddGoal_Tetris2
  AddGoal_Tetris2 {
    CAREER_ONLY
    record_type = Score
    CAREER_ONLY
    pro_specific_challenge
    pro_challenge_title = "Roof Gap Challenge"
    pro_challenge_text = "Kareem is known for his smooth style and flawless flip tricks. He's also the first person to kickflip the Gonz gap, proving he can also step up to the big gaps when needed. Can you showcase both of his skills together?"
    pro_challenge_tag_line = "Time for some rooftop poppin'..."
    pro_challenge_pro_name = "Kareem"
    time = 150
    Trick_Flag = 0
    Goal_Text = "Nail the tricks between the Roof Gaps"
    View_Goals_Text = "Kareem's Pro Specific Challenge"
    Start_Cam_Anim = G_TETRIS2_CameraStart
    success_cam_anim = G_TETRIS2_CameraSuccess
    Geo_Prefix = "Geo_Tetris2_"
    Goal_Intro_Script = SF2_Goal_Tetris2_Start
    Goal_Deactivate_Script = SF2_Goal_Tetris2_Deactivate
    Pro = "PhotoGuy"
    Full_Name = "Atiba Jefferson"
    Goal_Description = sf2_tetris2_desc
    combo = 0
    single_combo = 0
    combo_size = 5
    Goal_Tetris_Key_Combos = [
      Air_SquareUL
      Air_SquareUR
      Air_SquareDL
      Air_SquareDR
      Air_SquareU
      Air_SquareD
      Air_SquareL
      Air_SquareR
    ]
    Acceleration_Interval = 6
    Acceleration_Percent = 0.01
    Time_To_Stop_Adding_Tricks = 10
    Trick_time = 3000
    Max_tricks = 10
  }
endscript
SF2_GOALFLAG01 = 1
script SF2_AddGoal_Gaps4
  AddGoal_Gaps4 {
    CAREER_ONLY
    pro_specific_challenge
    pro_challenge_title = "Drop the Hammer"
    pro_challenge_text = "Andrew Reynolds constantly amazes with his ability to conquer any gap. Whether it's massive stair sets, monster gaps, or simply taking a pyramid ramp to the floor, Andrew can take it all."
    pro_challenge_tag_line = "Flip this..."
    pro_challenge_pro_name = "Andrew"
    Goal_Text = "Gap the Pier"
    View_Goals_Text = "Andrew's Pro Specific Challenge"
    Goal_Description = sf2_gaps4_desc
    time = 210
    Pro = "PhotoGuy"
    Full_Name = "Atiba Jefferson"
    Goal_Intro_Script = SF2_Goal_Gaps4_Intro
    Goal_Deactivate_Script = SF2_Goal_Gaps4_Deactivate
    goal_outro_script = SF2_Goal_Gaps4_Outro
    Geo_Prefix = "TRGP_Gap4_"
    record_type = time
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
    ]
    key_combos = [
      Air_SquareL
      Air_CircleDL
      Air_SquareD
    ]
  }
endscript
script SF2_Goal_Gaps4_Intro
  Create Prefix = "ProSet5_"
  Create Prefix = "TRG_ProSet5_"
endscript
script SF2_Goal_Gaps4_Deactivate
  Kill Prefix = "ProSet5_"
  Kill Prefix = "TRG_ProSet5_"
  Kill Prefix = "TRGP_Gap4_ResetSkater"
endscript
script SF2_Goal_Gaps4_Outro
  SpawnScript SF2_Goal_Gaps4_OutroActual ID = SF2_Gaps4_Outro
  Kill Prefix = "TRG_Gap4_LandChecker"
endscript
script SF2_Goal_Gaps4_OutroActual
  Wait 10 Frames
  PauseSkaters
  Kill Prefix = "TRGP_Gap4_ResetSkater"
  Kill Prefix = "TRG_Gap4_LandChecker"
endscript
script SF2_Gaps4_LandChecker
  if GoalManager_GoalIsActive Name = SF2_Goal_Gaps4
    begin
      if not Skater:OnGround
        break
      endif
      Wait 1 gameframe
    repeat
    begin
      if Skater:OnGround
        break
      endif
      Wait 1 gameframe
    repeat
    SF2_Gaps4_Restart
  endif
endscript
script SF2_Gaps4_Restart
  begin
    if SkaterCurrentScorePotLessThan 1
      break
    endif
    Wait 1 frame
  repeat
  Wait 0.1 Seconds
  SF2_Gaps4_ResetSkaterGeo_On
  if not GoalManager_GoalFlagSet Name = SF2_Goal_Gaps4 Flag = got_03
    Skater:KillSkater node = TRG_G_Gap4_RestartNode
  else
    if not GoalManager_GoalFlagSet Name = SF2_Goal_Gaps4 Flag = got_06
      Skater:KillSkater node = TRG_G_Gap4_RestartNode02
    else
      if not GoalManager_GoalFlagSet Name = SF2_Goal_Gaps4 Flag = got_09
        Skater:KillSkater node = TRG_G_Gap4_RestartNode03
      else
        if not GoalManager_GoalFlagSet Name = SF2_Goal_Gaps4 Flag = got_12
          Skater:KillSkater node = TRG_G_Gap4_RestartNode04
        else
          if not GoalManager_GoalFlagSet Name = SF2_Goal_Gaps4 Flag = got_15
            Skater:KillSkater node = TRG_G_Gap4_RestartNode05
          endif
        endif
      endif
    endif
  endif
  Wait 20 Frames
  SF2_Gaps4_ResetSkaterGeo_On
  Die
endscript
script SF2_Gaps4_ResetSkaterGeo_On
  Printf "-----------------------------------------trigger planes on"
  Create Prefix = "TRGP_Gap4_ResetSkater"
endscript
script SF2_Gaps4_ResetSkaterGeo_Off
  Printf "-----------------------------------------trigger planes almost off"
  Wait 60 Frames
  Printf "-----------------------------------------trigger planes off"
  Kill Prefix = "TRGP_Gap4_ResetSkater"
endscript
script SF2_Gaps4_StartGapA
  SF2_Gaps4_ResetSkaterGeo_On
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = gaps4_A Flags = PURE_AIR
    SF2_Gaps4_Enter myFlag = got_01
    SF2_Gaps4_Enter myFlag = got_02
    SF2_Gaps4_Enter myFlag = got_03
  endif
endscript
script SF2_Gaps4_EndGapA
  EndGap GapID = gaps4_A Score = 300 Text = "Andrew's Pro Challenge Pier"
  SF2_Gaps4_Exit myGapID = gaps4_A01
  SF2_Gaps4_Exit myGapID = gaps4_A02
  SF2_Gaps4_Exit myGapID = gaps4_A03
endscript
script SF2_Gaps4_StartGapB
  SF2_Gaps4_ResetSkaterGeo_On
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = gaps4_B Flags = PURE_AIR
    SF2_Gaps4_Enter myFlag = got_04
    SF2_Gaps4_Enter myFlag = got_05
    SF2_Gaps4_Enter myFlag = got_06
  endif
endscript
script SF2_Gaps4_EndGapB
  EndGap GapID = gaps4_B Score = 600 Text = "Andrew's Pro Challenge Walkway"
  SF2_Gaps4_Exit myGapID = gaps4_B01
  SF2_Gaps4_Exit myGapID = gaps4_B02
  SF2_Gaps4_Exit myGapID = gaps4_B03
endscript
script SF2_Gaps4_StartGapC
  SF2_Gaps4_ResetSkaterGeo_On
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = gaps4_C Flags = PURE_AIR
    SF2_Gaps4_Enter myFlag = got_07
    SF2_Gaps4_Enter myFlag = got_08
    SF2_Gaps4_Enter myFlag = got_09
  endif
endscript
script SF2_Gaps4_EndGapC
  EndGap GapID = gaps4_C Score = 1000 Text = "Andrew's Pro Challenge Fountain"
  SF2_Gaps4_Exit myGapID = gaps4_C01
  SF2_Gaps4_Exit myGapID = gaps4_C02
  SF2_Gaps4_Exit myGapID = gaps4_C03
endscript
script SF2_Gaps4_StartGapD
  SF2_Gaps4_ResetSkaterGeo_On
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = gaps4_D Flags = PURE_AIR
    SF2_Gaps4_Enter myFlag = got_10
    SF2_Gaps4_Enter myFlag = got_11
    SF2_Gaps4_Enter myFlag = got_12
  endif
endscript
script SF2_Gaps4_EndGapD
  EndGap GapID = gaps4_D Score = 1000 Text = "Andrew's Pro Challenge Bowl"
  SF2_Gaps4_Exit myGapID = gaps4_D01
  SF2_Gaps4_Exit myGapID = gaps4_D02
  SF2_Gaps4_Exit myGapID = gaps4_D03
endscript
script SF2_Gaps4_StartGapE
  SF2_Gaps4_ResetSkaterGeo_On
  if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
    StartGap GapID = gaps4_E Flags = PURE_AIR
    SF2_Gaps4_Enter myFlag = got_13
    SF2_Gaps4_Enter myFlag = got_14
    SF2_Gaps4_Enter myFlag = got_15
  endif
endscript
script SF2_Gaps4_EndGapE
  EndGap GapID = gaps4_E Score = 1000 Text = "Andrew's Pro Challenge Street"
  SF2_Gaps4_Exit myGapID = gaps4_E01
  SF2_Gaps4_Exit myGapID = gaps4_E02
  SF2_Gaps4_Exit myGapID = gaps4_E03
endscript
script SF2_Gaps4_Enter gapFlags = [ PURE_AIR ]
  switch <myFlag>
  case got_01
    myGapIDA = gaps4_A01
    winScript = SF2_Gaps4_GotA01
  case got_02
    myTrickText = "Double Kickflip"
    tagA = "\t1"
    myGapIDA = gaps4_A02
    prevFlag = got_01
    winScript = SF2_Gaps4_GotA02
  case got_03
    myTrickText = "Triple Heelflip"
    tagA = "\t1"
    myGapIDA = gaps4_A03
    prevFlag = got_02
    winScript = SF2_Gaps4_GotA03
  case got_04
    prevFlag = got_03
    myGapIDA = gaps4_B01
    winScript = SF2_Gaps4_GotB01
  case got_05
    tagA = "\t1"
    myGapIDA = gaps4_B02
    myTrickText = "Double Kickflip"
    prevFlag = got_04
    winScript = SF2_Gaps4_GotB02
  case got_06
    myTrickText = "Triple Heelflip"
    tagA = "\t1"
    myGapIDA = gaps4_B03
    winScript = SF2_Gaps4_GotB03
    prevFlag = got_05
  case got_07
    prevFlag = got_06
    myGapIDA = gaps4_C01
    winScript = SF2_Gaps4_GotC01
  case got_08
    myTrickText = "Double Kickflip"
    tagA = "\t1"
    myGapIDA = gaps4_C02
    prevFlag = got_07
    winScript = SF2_Gaps4_GotC02
  case got_09
    myTrickText = "Triple Heelflip"
    tagA = "\t1"
    myGapIDA = gaps4_C03
    prevFlag = got_08
    winScript = SF2_Gaps4_GotC03
  case got_10
    prevFlag = got_09
    myGapIDA = gaps4_D01
    winScript = SF2_Gaps4_GotD01
  case got_11
    myTrickText = "Double Kickflip"
    tagA = "\t1"
    myGapIDA = gaps4_D02
    prevFlag = got_10
    winScript = SF2_Gaps4_GotD02
  case got_12
    myTrickText = "Triple Heelflip"
    tagA = "\t1"
    myGapIDA = gaps4_D03
    prevFlag = got_11
    winScript = SF2_Gaps4_GotD03
  case got_13
    prevFlag = got_12
    myGapIDA = gaps4_E01
    winScript = SF2_Gaps4_GotE01
  case got_14
    myTrickText = "Double Kickflip"
    tagA = "\t1"
    myGapIDA = gaps4_E02
    prevFlag = got_13
    winScript = SF2_Gaps4_GotE02
  case got_15
    myTrickText = "Triple Heelflip"
    tagA = "\t1"
    myGapIDA = gaps4_E03
    prevFlag = got_14
    winScript = SF2_Gaps4_GotE03
  endswitch
  if GoalManager_GoalIsActive Name = SF2_Goal_Gaps4
    shouldStartGap = 1
    if GotParam prevFlag
      if not GoalManager_GoalFlagSet Name = SF2_Goal_Gaps4 Flag = <prevFlag>
        shouldStartGap = 0
      endif
    endif
    if GoalManager_GoalFlagSet Name = SF2_Goal_Gaps4 Flag = <myFlag>
      shouldStartGap = 0
    endif
    if ( <shouldStartGap> = 1 )
      Printf "---- starting gap: %g" g = <myFlag>
      if ( ( GotParam tagA ) or ( GotParam myTrickText ) )
        if GotParam myTrickText
          Printf "---- starting gap1: %i: %g" i = <myGapIDA> g = <myTrickText>
          StartGap GapID = <myGapIDA> Flags = <gapFlags> TrickText = <myTrickText> TrickScript = <winScript>
        else
          GoalManager_ReplaceTrickText Name = SF2_Goal_Gaps4 Text = <tagA>
          Printf "---- starting gap1: %i: %g" i = <myGapIDA> g = <TrickText>
          StartGap GapID = <myGapIDA> Flags = <gapFlags> TrickText = <TrickText> TrickScript = <winScript>
        endif
        if ( ( GotParam tagB ) or ( GotParam myTrickText2 ) )
          UnSetFlag Flag = SF2_GOALFLAG01
          if GotParam myTrickText2
            Printf "---- starting gap2: %i: %g" i = <myGapIDB> g = <myTrickText2>
            StartGap GapID = <myGapIDB> Flags = <gapFlags> TrickText = <myTrickText2> TrickScript = <winScript>
          else
            GoalManager_ReplaceTrickText Name = SF2_Goal_Gaps4 Text = <tagB>
            Printf "---- starting gap2: %i: %g" i = <myGapIDB> g = <TrickText>
            StartGap GapID = <myGapIDB> Flags = <gapFlags> TrickText = <TrickText> TrickScript = <winScript>
          endif
        endif
      else
        StartGap GapID = <myGapIDA> Flags = <gapFlags> TrickScript = <winScript>
      endif
      Kill Prefix = "TRG_Gap4_LandChecker"
      Create Name = TRG_Gap4_LandChecker
    endif
  endif
endscript
script SF2_Gaps4_Exit myGapID = mush Score = 0
  if GotParam winScript
    EndGap GapID = <myGapID> GapScript = <winScript>
  else
    EndGap GapID = <myGapID>
  endif
endscript
script SF2_Gaps4_GotA01
  SF2_Gaps4_CheckSuccess myFlag = got_01
endscript
script SF2_Gaps4_GotA02
  SF2_Gaps4_CheckSuccess myFlag = got_02
endscript
script SF2_Gaps4_GotA03
  SF2_Gaps4_CheckSuccess myFlag = got_03
endscript
script SF2_Gaps4_GotB01
  SF2_Gaps4_CheckSuccess myFlag = got_04
endscript
script SF2_Gaps4_GotB02
  SF2_Gaps4_CheckSuccess myFlag = got_05
endscript
script SF2_Gaps4_GotB03
  SF2_Gaps4_CheckSuccess myFlag = got_06
endscript
script SF2_Gaps4_GotC01
  SF2_Gaps4_CheckSuccess myFlag = got_07
endscript
script SF2_Gaps4_GotC02
  SF2_Gaps4_CheckSuccess myFlag = got_08
endscript
script SF2_Gaps4_GotC03
  SF2_Gaps4_CheckSuccess myFlag = got_09
endscript
script SF2_Gaps4_GotD01
  SF2_Gaps4_CheckSuccess myFlag = got_10
endscript
script SF2_Gaps4_GotD02
  SF2_Gaps4_CheckSuccess myFlag = got_11
endscript
script SF2_Gaps4_GotD03
  SF2_Gaps4_CheckSuccess myFlag = got_12
endscript
script SF2_Gaps4_GotE01
  SF2_Gaps4_CheckSuccess myFlag = got_13
endscript
script SF2_Gaps4_GotE02
  SF2_Gaps4_CheckSuccess myFlag = got_14
endscript
script SF2_Gaps4_GotE03
  SF2_Gaps4_CheckSuccess myFlag = got_15
endscript
script SF2_Gaps4_CheckSuccess
  if GoalManager_GoalIsActive Name = SF2_Goal_Gaps4
    Kill Prefix = "TRGP_Gap4_ResetSkater"
    switch <myFlag>
    case got_01
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Kickflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = tricks "Hey, great!\nNow do a Double Kickflip over the Pier:\nDouble Kickflip\n(%a + \b1)" a = <combo_1>
      nextText = <tricks>
    case got_02
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Heelflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = tricks "Now do a Triple Heelflip over the Pier\n(%a + \b1 + \b1)" a = <combo_1>
      nextText = <tricks>
    case got_03
      nextText = "Now gap the overhead Walkway."
    case got_04
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Kickflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = tricks "Hey, great!\nNow do a Double Kickflip over the Walkway:\nDouble Kickflip\n(%a + \b1)" a = <combo_1>
      nextText = <tricks>
    case got_05
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Heelflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = tricks "Now do a Triple Heelflip over the walkway\n(%a + \b1 + \b1)" a = <combo_1>
      nextText = <tricks>
    case got_06
      nextText = "Now gap the fountain."
    case got_07
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Kickflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = tricks "Hey, great!\nNow do a Double Kickflip over the Fountain:\nDouble Kickflip\n(%a + \b1)" a = <combo_1>
      nextText = <tricks>
    case got_08
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Heelflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = tricks "Now do a Triple Heelflip over the fountain\n(%a + \b1 + \b1)" a = <combo_1>
      nextText = <tricks>
    case got_09
      nextText = "Now gap into the EMB Bowl."
    case got_10
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Kickflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = tricks "Hey, great!\nNow do a Double Kickflip into the bowl:\nDouble Kickflip\n(%a + \b1)" a = <combo_1>
      nextText = <tricks>
    case got_11
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Heelflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = tricks "Now do a Triple Heelflip into the bowl\n(%a + \b1 + \b1)" a = <combo_1>
      nextText = <tricks>
    case got_12
      nextText = "Now gap over the street."
    case got_13
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Kickflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = tricks "Hey, great!\nNow do a Double Kickflip over the street:\nDouble Kickflip\n(%a + \b1)" a = <combo_1>
      nextText = <tricks>
    case got_14
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Heelflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = tricks "Now do a Triple Heelflip over the street\n(%a + \b1 + \b1)" a = <combo_1>
      nextText = <tricks>
    case got_15
    endswitch
    if GotParam doubleTrick
      if GetFlag Flag = SF2_GOALFLAG01
        GoalManager_SetGoalFlag Name = SF2_Goal_Gaps4 <myFlag> 1
        if GotParam nextText
          GoalManager_ReplaceTrickText Name = SF2_Goal_Gaps4 Text = <nextText>
          Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
        endif
      else
        SetFlag Flag = SF2_GOALFLAG01
      endif
    else
      GoalManager_SetGoalFlag Name = SF2_Goal_Gaps4 <myFlag> 1
      if GotParam nextText
        GoalManager_ReplaceTrickText Name = SF2_Goal_Gaps4 Text = <nextText>
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    endif
  endif
endscript
EX_FISHERMAN_BOX = 1
EX_FISHERMAN_BAIT = 2
EX_SEAL_GO_1 = 3
EX_SEAL_GO_2 = 4
EX_SEAL_GO_3 = 5
EX_SEAL_GO_4 = 6
SEAL_GOAL_SKIP_ENDING = 7
EX_PAINTER_SWITCH = 1
EX_SHARK_DIE = 1
EX_BALL_ROCK = 1
EX_BALL_MOVE = 2
script SF2_Goal_Counter3_Intro
  Kill Prefix = "Skate_Stopper"
  Wait 1 frame
  DebugFn 8123
  Create Prefix = "Skate_Stopper"
  DebugFn 8124
endscript
script SF2_Goal_Counter3_Deactivate
  Kill Prefix = "Skate_Stopper"
  Wait 1 frame
  DebugFn 8123
  Create Prefix = "Skate_Stopper"
  DebugFn 8124
endscript
script SF2_Goal_Counter3_Success
  Kill Prefix = "Skate_Stopper"
endscript
script SF2_Counter3_SS_Collide
  Obj_PlaySound bail04 Vol = 200
  Obj_PlaySound bail05 Vol = 200
  if IsAlive Name = TRG_Ped_Hubba_Guard01
    SendFlag Name = TRG_Ped_Hubba_Guard01 OBJFLAG_SKATESTOPHIT
  endif
  if GoalManager_GoalIsActive Name = SF2_Goal_Counter3
    DebugFn 8888
    Printf "got a skate stopper"
    PlaySound GapSound
    GoalManager_GotCounterObject Name = SF2_Goal_Counter3
  endif
endscript
OBJFLAG_SKATESTOPHIT = 2
OBJEX_ALARMHIT = 1
script SF2_Counter3_Alarm
  if IsCareerMode
    if IsAlive Name = TRG_Ped_Hubba_Guard01
      SendException OBJEX_ALARMHIT Name = TRG_Ped_Hubba_Guard01
    endif
    PlaySound caralarm
  endif
endscript
script SF2_Security_SkateStopper
  Obj_ClearExceptions
  Obj_SetException EX = OBJEX_ALARMHIT Scr = SF2_Security_SkateStopper_TurnOffAlarm
  Obj_SetException EX = SkaterInRadius Scr = SF2_Security_SkateStopper_InRadius
  Obj_SetInnerRadius 30
  begin
    Obj_PlayAnim Anim = random( @Ped_M_Idle1 @Ped_M_PlayerWave @Ped_M_LookAtWatch @Ped_M_Idle2 ) 
    Obj_WaitAnimFinished
    Obj_ClearFlag OBJFLAG_SKATESTOPHIT
  repeat
endscript
script SF2_Security_SkateStopper_InRadius
  Obj_ClearExceptions
  Obj_ClearFlag OBJFLAG_SKATESTOPHIT
  Obj_SetException EX = OBJEX_ALARMHIT Scr = SF2_Security_SkateStopper_TurnOffAlarm
  Obj_SetException EX = SkaterOutOfRadius Scr = SF2_Security_SkateStopper
  Obj_SetOuterRadius 30
  Obj_SetException EX = SkaterInRadius Scr = SF2_Security_SkateStopper_KickSkaterAss2
  Obj_SetInnerRadius 10
  begin
    Obj_PlayAnim Anim = random( @Ped_M_ShakeFist @Ped_M_Disgust ) 
    begin
      if Obj_FlagSet OBJFLAG_SKATESTOPHIT
        Goto SF2_Security_SkateStopper_KickSkaterAss
      endif
      if Obj_AnimComplete
        break
      endif
      Wait 3 frame
    repeat
  repeat
endscript
script SF2_Security_SkateStopper_TurnOffAlarm
  Printf "turning off alarm ------------------------------------"
  Obj_ClearExceptions
  Obj_ClearFlag OBJFLAG_SKATESTOPHIT
  Obj_StickToGround distAbove = 3 distBelow = 3
  Obj_SetPathAcceleration 40 mphps
  Obj_SetPathDeceleration 40 mphps
  Obj_SetPathVelocity 40 mph
  Obj_FollowPath Name = TRG_Ped_Hubba_Guard_AlarmNav01
  Obj_PlayAnim Anim = Ped_M_Run Cycle
  Wait 1 frame
  Obj_WaitMove
  Obj_PlayAnim Anim = Ped_M_LookAtWatch Cycle
  Wait 1 Seconds
  Obj_FollowPath Name = TRG_Ped_Hubba_Guard_AlarmNav07
  Obj_PlayAnim Anim = Ped_M_Run Cycle
  Wait 1 frame
  Obj_WaitMove
  Obj_StickToGround off
  Obj_MoveToNode Name = TRG_Ped_Hubba_Guard01 orient
  SF2_Security_SkateStopper
endscript
script SF2_Security_SkateStopper_HitSkaterCam
  Obj_ClearExceptions
  Obj_ClearFlag OBJFLAG_SKATESTOPHIT
  PlaySkaterCamAnim Skater = 0 stop
  Obj_GetId
  PlaySkaterCamAnim { Name = <cam_anim>
    Skater = 0
    targetID = <objID>
    targetOffset = (50, 50, 0)
    positionOffset = (80, 0, -50)
    Frames = 120
    play_hold
    skippable = 1
    virtual_cam
  }
  Obj_PlayAnim Anim = Ped_M_Punch
  PlaySound armwhoosh01
  Skater:Obj_MoveToNode Name = TRG_Ped_Hubba_Guard_Nav orient
  Obj_LookAtObject Type = Skater time = 0.001
  if Skater:IsInBail
    MakeSkaterGoto SkaterInit
  endif
  MakeSkaterGoto SkaterCollideBall
  Wait 60 Frames
  PauseSkaters
endscript
script SF2_Security_SkateStopper_KickSkaterAss
  kill_start_key_binding
  SF2_Security_SkateStopper_HitSkaterCam
  create_speech_box {
    Text = [
      "Security Guard:\n"
      "'You little jerk - the skate Blockers are there for a reason\n"
      "Now I'm gonna hafta replace them all...\n..."
    ]
    pad_choose_script = SF2_Security_SkateStopper_KickSkaterAssDone
    Style = speech_box_style
  }
  Wait 1 Second
  StopStream
  Wait 1 frame
  PlayStream security_hitgrind01
  SF2_Security_SkateStopper_InRadius
endscript
script SF2_Security_SkateStopper_KickSkaterAss2
  kill_start_key_binding
  SF2_Security_SkateStopper_HitSkaterCam
  create_speech_box {
    Text = [
      "Security Guard:\n"
      "'My ledge, my blockers, my rules, your loss!\n"
      "Now for the last time... scram!'"
    ]
    pad_choose_script = SF2_Security_SkateStopper_KickSkaterAssDone
    Style = speech_box_style
  }
  Wait 1 Second
  StopStream
  Wait 1 frame
  PlayStream security_hitgrind05
  SF2_Security_SkateStopper_InRadius
endscript
script SF2_Security_SkateStopper_KickSkaterAssDone
  restore_start_key_binding
  Printf "replacing Blockers"
  PlaySkaterCamAnim Skater = 0 stop
  speech_box_exit
  if GoalManager_GoalIsActive Name = SF2_Goal_Counter3
    GoalManager_LoseGoal Name = SF2_Goal_Counter3
  else
    Kill Prefix = "Skate_Stopper"
    Wait 1 frame
    DebugFn 8123
    Create Prefix = "Skate_Stopper"
    DebugFn 8124
  endif
  UnPauseSkaters
endscript
script SF2_Tetris_TrickCheck
  if GoalManager_GoalIsActive Name = SF2_Goal_Tetris
    Printf "checking trick"
    GoalManager_EditGoal Name = SF2_Goal_Tetris Params = { Trick_Flag = 1 }
  endif
endscript
script SF2_Tetris2_TrickCheck
  if IsCareerMode
    if GoalManager_GoalIsActive Name = SF2_Goal_Tetris2
      Printf "checking trick"
      GoalManager_EditGoal Name = SF2_Goal_Tetris2 Params = { Trick_Flag = 1 }
    endif
  endif
endscript
script SF2_Goal_Tetris2_Start
  SpawnScript SF2_Goal_Tetris2_Escalate ID = SF2_Goal_Tetris2
endscript
script SF2_Goal_Tetris2_Deactivate
  KillSpawnedScript ID = SF2_Goal_Tetris2
  GoalManager_EditGoal Name = SF2_Goal_Tetris2 Params = {
    combo = 0
    single_combo = 0
    combo_size = 5
    Trick_time = 2000
  }
endscript
script SF2_Goal_Tetris2_Escalate
  Wait 60 Seconds
  Create_Panel_Message Text = "Time for some combos!" ID = current_goal Style = panel_message_goal
  PlaySound scratch_01_11
  GoalManager_ClearTetrisTricks Name = SF2_Goal_Tetris2
  GoalManager_EditGoal Name = SF2_Goal_Tetris2 Params = {
    combo = 1
    single_combo = 0
    combo_size = 2
    Adjusted_Trick_time = 5000
  }
  Wait 60 Seconds
  Printf "escalatin the tricks!!!"
  Create_Panel_Message Text = "Ok, one last massive combo!" ID = current_goal Style = panel_message_goal
  PlaySound scratch_01_11
  GoalManager_ClearTetrisTricks Name = SF2_Goal_Tetris2
  GoalManager_EditGoal Name = SF2_Goal_Tetris2 Params = {
    combo = 0
    single_combo = 1
    combo_size = 5
    Trick_time = 8000
  }
endscript
script SF2_Goal_Race2_Start
  Create Prefix = "TRG_G_Race2_Messenger"
  SF2_Kill_the_Cars
  if IsAlive Name = TRG_G_Race2_Pro
    TRG_G_Race2_Pro:Obj_MoveToNode Name = TRG_G_Gap2_BallNav08
  endif
endscript
script SF2_Goal_Race2_Deactivate
  KillTheArrow ID = TRG_G_Race2_Messenger
  Wait 1 frame
  Kill Prefix = "TRG_G_Race2_Messenger"
  Kill Prefix = "TRG_G_Race2_Arrow"
  Kill Prefix = "TRG_G_Race2_Cars"
  SF2_Create_the_Cars
  if IsAlive Name = TRG_G_Race2_Pro
    TRG_G_Race2_Pro:Obj_MoveToNode Name = TRG_G_Race2_Pro
  endif
endscript
script SF2_Race2_Waypoint_1
  Kill Prefix = "TRG_G_Race2_Cars"
  Wait 1 frame
  Create_Panel_Block ID = current_goal Text = "He started early!\nGet to Pier 18 warehouse!" Style = panel_message_goal
  Create Name = TRG_G_Race2_Arrow01
  Create Prefix = "TRG_G_Race2_Cars"
endscript
script SF2_Race2_Waypoint_2
  Kill Name = TRG_G_Race2_Arrow01
  Kill Prefix = "TRG_G_Race2_Cars"
  Wait 1 frame
  Create_Panel_Block ID = current_goal Text = "Get back to the Slam Bros. warehouse!" Style = panel_message_goal
  Create Name = TRG_G_Race2_Arrow02
  Create Prefix = "TRG_G_Race2_Cars"
endscript
script SF2_Race2_MessengerBike
  Obj_PlayAnim Anim = BMX_Cycle Cycle Speed = 2
  Obj_LockToObject ObjectName = TRG_G_Race2_Messenger (0, 0, -10)
endscript
script SF2_Race2_Messenger
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathAcceleration 50 mphps
  Obj_SetPathDeceleration 50 mphps
  Obj_SetPathVelocity 48 mph
  Obj_PlayAnim Anim = Cycle Cycle Speed = 2
  GetNodeName
  KillTheArrow ID = TRG_G_Race2_Messenger
  AddGoalArrowAlc
  Obj_FollowPathLinked
  Obj_SetException EX = SkaterInRadius Scr = SF2_Race2_MessengerCollide
  Obj_SetInnerRadius 2
  Wait 19 Seconds
  Obj_SetPathVelocity 30 mph
endscript
script SF2_Race2_MessengerCollide
  MakeSkaterGoto Spasmodic
endscript
script SF2_Counter2_LoseGoal
  if GoalManager_GoalIsActive Name = SF2_Goal_Counter2
    GoalManager_LoseGoal Name = SF2_Goal_Counter2
  endif
endscript
script SF2_Counter2_Gap01
  GetSkaterState
  if ( <state> = skater_InManual )
    StartGap GapID = SF2_COUNTER2_01 Flags = [ PURE_MANUAL ]
    Wait 1 frame
    EndGap GapID = SF2_COUNTER2_01 Text = "On the Way" Score = 100 GapScript = SF2_COUNTER2_GOTONE
  endif
endscript
script SF2_Counter2_Gap02
  GetSkaterState
  if ( <state> = skater_InManual )
    StartGap GapID = SF2_COUNTER2_02 Flags = [ PURE_MANUAL ]
    Wait 1 frame
    EndGap GapID = SF2_COUNTER2_02 Text = "Halfway there!" Score = 100 GapScript = SF2_COUNTER2_GOTONE
  endif
endscript
script SF2_Counter2_Gap03
  StartGap GapID = SF2_COUNTER2_03 Flags = [ PURE_MANUAL ]
  Wait 1 frame
  EndGap GapID = SF2_COUNTER2_03 Text = "Cleared the Gap" Score = 100 GapScript = SF2_COUNTER2_GOTONE
endscript
script SF2_Counter2_Gap04
  GetSkaterState
  if ( <state> = skater_InManual )
    StartGap GapID = SF2_COUNTER2_04 Flags = [ PURE_MANUAL ]
    Wait 1 frame
    EndGap GapID = SF2_COUNTER2_04 Text = "Almost" Score = 100 GapScript = SF2_COUNTER2_GOTONE
  endif
endscript
script SF2_Counter2_Gap05
  GetSkaterState
  if ( <state> = skater_InManual )
    StartGap GapID = SF2_COUNTER2_05 Flags = [ PURE_MANUAL ]
    Wait 1 frame
    EndGap GapID = SF2_COUNTER2_05 Text = "Made It!" Score = 100 GapScript = SF2_COUNTER2_GOTONE
  endif
endscript
script SF2_COUNTER2_GOTONE
  GoalManager_GotCounterObject Name = SF2_Goal_Counter2
endscript
script sf2_horse_spot01
  Create_Panel_Block ID = Current_Horse_Spot Text = sf2_horse_text1 Style = Panel_Message_New_Horse_Spot
endscript
script sf2_horse_spot02
  Create_Panel_Block ID = Current_Horse_Spot Text = sf2_horse_text2 Style = Panel_Message_New_Horse_Spot
endscript
script sf2_horse_spot03
  Create_Panel_Block ID = Current_Horse_Spot Text = sf2_horse_text3 Style = Panel_Message_New_Horse_Spot
endscript
OBJFLAG_GOTSPECIALTRICK = 1
script SF2_Goal_Special_intro
  if not IsAlive Name = TRG_G_SPECIALTrick_Husband
    Create Name = TRG_G_SPECIALTrick_Husband
    KillSpawnedScript ID = sf2_special
  endif
endscript
script SF2_Goal_Special_deactivate
  if not GoalManager_HasWonGoal Name = SF2_Goal_SPECIAL
    Kill Prefix = "TRG_G_SPECIALTrick_Husband"
  endif
endscript
script SF2_Goal_Special_Outro
  KillSpawnedScript ID = sf2_special
  SpawnScript SF2_Goal_Special_Outro_Actual ID = sf2_special
endscript
script SF2_Goal_Special_Outro_Anims
  PlayAnim Anim = Darkslide_Range from = 10 to = 10 BlendPeriod = 0
  Wait 30 Frames
endscript
script SF2_Goal_Special_Outro_Actual
  MakeSkaterGoto SF2_Goal_Special_Outro_Anims
  UnPauseSkaters
  if not IsAlive Name = TRG_G_SPECIALTrick_Husband
    Create Name = TRG_G_SPECIALTrick_Husband
  endif
  Skater:Obj_MoveToNode Name = TRG_G_SPECIALTrick_EndNav orient
  Wait 1 frame
  MakeSkaterGoto SF2_Goal_Special_Outro_Anims
  if IsAlive Name = TRG_G_SPECIALTrick_Husband
    RunScriptOnObject ID = TRG_G_SPECIALTrick_Husband SF2_SPECIAL_HUSBAND2
  endif
  Wait 1 Frames
  MakeSkaterGoto SF2_Goal_Special_Outro_Anims
  Wait 1 frame
  PauseSkaters
  PlaySound hud_jumpgap
  Wait 0.5 Second
  UnPauseSkaters
  Skater:Obj_MoveToNode Name = TRG_G_SPECIALTrick_EndNav01 orient
  MakeSkaterGoto SF2_Goal_Special_Outro_Anims
  Wait 1 frame
  PauseSkaters
  PlaySound hud_jumpgap
  Wait 0.5 Second
  UnPauseSkaters
  Skater:Obj_MoveToNode Name = TRG_G_SPECIALTrick_EndNav02 orient
  Wait 1 frame
  PauseSkaters
  PlaySound hud_jumpgap
  Wait 0.5 Second
endscript
script SF2_Goal_Special_Success
  Skater:Obj_MoveToNode Name = TRG_G_SPECIAL_Intro_Node orient
  MakeSkaterGoto SkaterInit
  Kill Prefix = "TRG_G_SPECIALTrick_Husband"
endscript
script SF2_goal_special_StartGap
  StartGap GapID = SF2Special
  StartGap GapID = SF2Special2 Flags = [ REQUIRE_RAIL CANCEL_GROUND ] TrickText = "BS Darkslide" TrickScript = SF2_goal_special_got_gap1
  StartGap GapID = SF2Special2b Flags = [ REQUIRE_RAIL CANCEL_GROUND ] TrickText = "FS Darkslide" TrickScript = SF2_goal_special_got_gap1
endscript
script SF2_goal_special_EndGap
  if GoalManager_GoalIsActive Name = SF2_Goal_SPECIAL
    Printf "checking grind 1"
    Wait 2 Frames
    if TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF TRIGGER_SKATE_OFF_EDGE ]
      EndGap GapID = SF2Special2
      EndGap GapID = SF2Special2b
    else
      StartGap GapID = SF2Special2 Flags = [ REQUIRE_RAIL CANCEL_GROUND ] TrickText = "BS Darkslide" TrickScript = SF2_goal_special_got_gap1
      StartGap GapID = SF2Special2b Flags = [ REQUIRE_RAIL CANCEL_GROUND ] TrickText = "FS Darkslide" TrickScript = SF2_goal_special_got_gap1
      EndGap GapID = SF2Special Text = "3rd Army Grind" Score = 100
    endif
  endif
  Printf "checking grind 2"
endscript
script SF2_goal_special_got_gap1
  Printf "got grind"
  if not QueryFlag OBJFLAG_GOTSPECIALTRICK Name = TRG_G_Special_Pro
    SendFlag Name = TRG_G_Special_Pro OBJFLAG_GOTSPECIALTRICK
    GoalManager_WinGoal Name = SF2_Goal_SPECIAL
  endif
endscript
script SF2_SPECIAL_HUSBAND
  Obj_PlayAnim Anim = Ped_M_Wave Cycle
endscript
script SF2_SPECIAL_HUSBAND2
  Obj_PlayAnim Anim = Ped_M_Wave from = 20 to = 20
endscript
script SF2_CC_PadManualWestStart
  Printf "west manual start"
  EndGap GapID = SF2_CC_ManualWestToEast Text = "Heading Back" Score = 100 GapScript = SF2_CC_ManualWestToEast
  StartGap GapID = SF2_CC_ManualWest Flags = [ PURE_MANUAL ]
endscript
script SF2_CC_PadManualWestEnd
  Printf "west manual end"
  EndGap GapID = SF2_CC_ManualWest Text = "Pad Manual West" Score = 100 GapScript = SF2_CC_ManualEither
  StartGap GapID = SF2_CC_ManualWestToEast Flags = [ CANCEL_GROUND ]
endscript
script SF2_CC_PadManualEastStart
  Printf "east manual start"
  EndGap GapID = SF2_CC_ManualWestToEast Text = "Heading Back" Score = 100 GapScript = SF2_CC_ManualWestToEast
  StartGap GapID = SF2_CC_ManualEast Flags = [ PURE_MANUAL ]
endscript
script SF2_CC_PadManualEastEnd
  Printf "east manual end"
  EndGap GapID = SF2_CC_ManualEast Text = "Pad Manual East" Score = 100 GapScript = SF2_CC_ManualEither
  StartGap GapID = SF2_CC_ManualWestToEast Flags = [ CANCEL_GROUND ]
endscript
script SF2_CC_ManualEither
  Printf "got counter"
  if GoalManager_GoalIsActive Name = sf2_goal_countercombo
    GoalManager_GotCounterObject Name = sf2_goal_countercombo
  endif
endscript
script sf2_goal_countercombo_combo_lost
  Obj_ClearException SkaterLanded
  Obj_ClearException SkaterBailed
  GoalManager_EditGoal Name = sf2_goal_countercombo Params = { number_collected = 0 }
  goal_update_counter goal_id = sf2_goal_countercombo
endscript
script SF2_CC_ManualWestToEast
  Printf "SF2_CC_ManualEast"
endscript
script Sf2_Goal_Gap3_Intro
  SpawnScript Sf2_Goal_Gap3_Intro2
endscript
script Sf2_Goal_Gap3_Intro2
  Wait 1 frame
  Kill Prefix = "ProSet1_Hyatt_Not"
endscript
script Sf2_Goal_Gap3_Deactivate
  Create Prefix = "ProSet1_Hyatt_Not"
  Skater:KillSkater node = TRG_G_GAP3_RestartNode01
endscript
script SF2_GAPS3_HubbaTransfer1
  EndGap GapID = SF2_HubbaTransfer1 GapScript = SF2_HubbaTransfer
  StartGap GapID = SF2_HubbaTransfer2 Flags = [ PURE_AIR ]
endscript
script SF2_GAPS3_HubbaTransfer2
  EndGap GapID = SF2_HubbaTransfer2 GapScript = SF2_HubbaTransfer
  StartGap GapID = SF2_HubbaTransfer1 Flags = [ PURE_AIR ]
endscript
script SF2_HubbaTransfer
  StartGap GapID = SF2_HubbaTransfer
  EndGap GapID = SF2_HubbaTransfer Text = "Hubba Transfer!" Score = 100
endscript
script SF2_GAPS3_HubbaSpine1
  EndGap GapID = SF2_HubbaSpine1 GapScript = SF2_HubbaSpine
  StartGap GapID = SF2_HubbaSpine2 Flags = [ PURE_AIR ]
endscript
script SF2_GAPS3_HubbaSpine2
  EndGap GapID = SF2_HubbaSpine2 GapScript = SF2_HubbaSpine
  StartGap GapID = SF2_HubbaSpine1 Flags = [ PURE_AIR ]
endscript
script SF2_HubbaSpine
  StartGap GapID = SF2_HubbaSpine
  EndGap GapID = SF2_HubbaSpine Text = "Hubba Spine!" Score = 100
endscript
script SF2_GAPS3_HubbaSpineTransfer1
  EndGap GapID = SF2_HubbaSpineTransfer1 GapScript = SF2_HubbaSpineTransfer
  StartGap GapID = SF2_HubbaSpineTransfer2 Flags = [ CANCEL_GROUND ]
endscript
script SF2_GAPS3_HubbaSpineTransfer2
  EndGap GapID = SF2_HubbaSpineTransfer2 GapScript = SF2_HubbaSpineTransfer
  StartGap GapID = SF2_HubbaSpineTransfer1 Flags = [ CANCEL_GROUND ]
endscript
script SF2_GAPS3_HubbaSpineTransfer3
  EndGap GapID = SF2_HubbaSpineTransfer3 GapScript = SF2_HubbaSpineTransfer
  StartGap GapID = SF2_HubbaSpineTransfer4 Flags = [ CANCEL_GROUND ]
  StartGap GapID = SF2_HubbaSpineTransfer Flags = [ CANCEL_GROUND ] TrickText = "Spine Transfer" TrickScript = SF2_HubbaSpineTransferDone
endscript
script SF2_GAPS3_HubbaSpineTransfer4
  EndGap GapID = SF2_HubbaSpineTransfer Text = "Hubba Spine AND Transfer!!!"
  EndGap GapID = SF2_HubbaSpineTransfer4 GapScript = SF2_HubbaSpineTransfer
  StartGap GapID = SF2_HubbaSpineTransfer3 Flags = [ CANCEL_GROUND ]
endscript
script SF2_HubbaSpineTransfer
endscript
script SF2_HubbaSpineTransferCheck
endscript
script SF2_HubbaSpineTransferDone
  if GoalManager_GoalExists Name = SF2_goal_GAPS3
    if GoalManager_SetGoalFlag Name = SF2_goal_GAPS3 got_1 1
      Printf "got the spine and transfer"
    endif
  endif
endscript
script SF2_Package_Waiting
  GenBouncyObject
  begin
    Printf " package is alive"
    Wait 10 Frames
  repeat
endscript
script SF2_Package_Got
  GoalManager_SetGoalFlag Name = <goal_id> <Flag> 1
  GoalManager_GetGoalParams Name = <goal_id>
  if not GoalManager_AllFlagsSet Name = <goal_id>
    FormatText TextName = collect_text "%c of %n %t" c = <num_flags_set> t = <Collect_Type> n = <Num_Flags>
    Create_Panel_Message Text = <collect_text> Style = goal_collect_text
  endif
  Printf "got the package"
endscript
script SF2_Goal_Race_Intro
  Create Prefix = "TRG_G_RACE_RaceNav"
endscript
script SF2_Goal_Race_Deactivate
  Kill Prefix = "TRG_G_RACE_RaceNav"
endscript
script SF2_Goal_Race_Outro
  Kill Prefix = "RACE_Camera"
  Kill Prefix = "RACE_Canister"
endscript
script SF2_Race_Waypoint_1
  Create_Panel_Block ID = current_goal Text = "Find the camera guy by the Pier 18 warehouse!" Style = panel_message_goal
  StopStream
  Wait 1 frame
  PlayStream photoguy_sf2_goal_race_midsuccess01
  if not IsAlive Name = TRG_G_RACE_CameraGuy
    Create Name = TRG_G_RACE_CameraGuy
  endif
endscript
script SF2_Race_Waypoint_2
  Create_Panel_Block ID = current_goal Text = "I got mugged! He stole the camera and tried to catch a bus! Catch him!" Style = panel_message_goal
  StopStream
  Wait 1 frame
  PlayStream photoguy_sf2_goal_race_midsuccess02
  if not IsAlive Name = TRG_G_RACE_Thug
    Create Name = TRG_G_RACE_Thug
  endif
  if not IsAlive Name = RACE_Camera
    Create Name = RACE_Camera
  endif
endscript
script SF2_Race_Waypoint_3
  Create_Panel_Block ID = current_goal Text = "ACK! NO FILM!!! Get to the camera store in the plaza!" Style = panel_message_goal
  StopStream
  Wait 1 frame
  PlayStream photoguy_sf2_goal_race_midsuccess03
  Kill Prefix = "RACE_Camera"
  if not IsAlive Name = RACE_Camera
    Create Name = RACE_Canister
  endif
endscript
script SF2_Race_Waypoint_4
  Create_Panel_Block ID = current_goal Text = "Now get back to the photographer before the skaters leave!" Style = panel_message_goal
  Kill Prefix = "RACE_Canister"
  Kill Prefix = "TRG_G_RACE_CameraGuy"
  Kill Prefix = "TRG_G_RACE_Thug"
  StopStream
  Wait 1 frame
  PlayStream photoguy_sf2_goal_race_midsuccess04
endscript
script CJR_SF2_Mechanic
  Wait random( @
  0.5 Seconds
  @1 Seconds
  @1.5 Seconds
  @2 Seconds
  @2.5 Seconds
  @3 Seconds
  @3.5 Seconds
  @4 Seconds
   ) 
   begin
    Obj_PlayAnim Anim = random( @
  Ped_Mec_Idle1 Cycle
    @Ped_Mec_Idle3 Cycle
     ) 
   Wait 2 Seconds
    Wait random( @
    0.25 seconds
    @0.5 seconds
    @0.75 seconds
    @1 seconds
    @1.25 seconds
    @1.5 seconds
    @1.75 seconds
    @2 seconds
     ) 
    Obj_PlayAnim Anim = Ped_Mec_PullOut
    Wait 1.75 seconds
    Create name = <Gap_Polys_1>
    Create name = <Gap_Polys_2>
    Obj_WaitAnimFinished
    Obj_CycleAnim Anim = random( @
    Ped_Mec_WipeHead
    @Ped_Mec_LookAtWatch
     ) 
    Obj_PlayAnim Anim = Ped_Mec_PullIn
    Wait 3.5 Seconds
    Kill Name = <Gap_Polys_1>
    Kill Name = <Gap_Polys_2>
    Obj_WaitAnimFinished
  repeat
endscript
Mechanic01Params = {
  Gap_Polys_1 = TRGP_Gap_Mechanic01_Start
  Gap_Polys_2 = TRGP_Gap_Mechanic01_End }
Mechanic02Params = {
  Gap_Polys_1 = TRGP_Gap_Mechanic02_Start
  Gap_Polys_2 = TRGP_Gap_Mechanic02_End }
Mechanic03Params = {
  Gap_Polys_1 = TRGP_Gap_Mechanic03_Start
  Gap_Polys_2 = TRGP_Gap_Mechanic03_End }
Mechanic04Params = {
  Gap_Polys_1 = TRGP_Gap_Mechanic04_Start
  Gap_Polys_2 = TRGP_Gap_Mechanic04_End }
script CJR_SF2_Got_TS_Lip1
  if GoalManager_GoalExists Name = SF2_Goal_TrickSpot
    if GoalManager_SetGoalFlag Name = SF2_Goal_TrickSpot Got_1_TS_Lip 1
      Obj_VarInc var = 0
    endif
  endif
endscript
script CJR_SF2_Got_TS_Lip2
  if GoalManager_GoalExists Name = SF2_Goal_TrickSpot
    if GoalManager_SetGoalFlag Name = SF2_Goal_TrickSpot Got_2_TS_Lip 1
    endif
  endif
endscript
script CJR_SF2_Got_TS_Lip3
  if GoalManager_GoalExists Name = SF2_Goal_TrickSpot
    if GoalManager_SetGoalFlag Name = SF2_Goal_TrickSpot Got_3_TS_Lip 1
    endif
  endif
endscript
script CJR_SF2_EndGap_PierSign_Lip
  EndGap GapID = <ID1> Text = "Pier Perch" Score = 250
endscript
script SF2_G_Gap_Start
  if Skater:OnGround
    if Skater:DoingTrick
      Printf "start gap"
      StartGap GapID = SF2_G_GAP_MANUAL Flags = [ PURE_MANUAL ] TrickScript = SF2_GAP_CompleteGoalGap
      StartGap GapID = SF2_G_GAP_MANUALtext
      Wait 1 frame
      EndGap GapID = SF2_G_GAP_MANUALtext Text = "Manualin" Score = 50
      SpawnScript SF2_Goal_Gaps_AirCheck ID = gap_air_checker
    else
      if GoalManager_GoalIsActive Name = SF2_goal_gaps
        GoalManager_LoseGoal Name = SF2_goal_gaps
      endif
    endif
  else
    if GoalManager_GoalIsActive Name = SF2_goal_gaps
      GoalManager_LoseGoal Name = SF2_goal_gaps
    endif
  endif
endscript
script SF2_G_Gap_End
  Printf "end gap"
  KillSpawnedScript ID = gap_air_checker
  EndGap GapID = SF2_G_GAP_MANUAL Text = "Manual Pleasure" Score = 250
endscript
script SF2_GAP_CompleteGoalGap
  if GoalManager_SetGoalFlag Name = SF2_goal_gaps got_1 1
    Printf "got gap 1"
  endif
endscript
script SF2_Goal_Gaps_AirCheck
  begin
    if Skater:InAir
      if GoalManager_GoalIsActive Name = SF2_goal_gaps
        GoalManager_LoseGoal Name = SF2_goal_gaps
      endif
    endif
    Wait 1 frame
  repeat
endscript
script SF2_Goal_Gaps_Deactivate
  KillSpawnedScript ID = gap_air_checker
endscript
script Sf2_Goal_Gap2_Intro
  SF2_Kill_the_Cars
  Kill Prefix = "EMB_Ball07"
  Create Prefix = "EMB_Ball07"
  if GoalManager_HasWonGoal Name = SF2_Goal_GAPS2
    Create Prefix = "G_Gap2_SupportWires"
    Create Prefix = "TRG_G_GAP2_WireNode"
    Create Prefix = "TRG_Shark"
    Create Prefix = "TRG_Ped_Painter"
    Wait 1 gameframe
    RunScriptOnObject ID = TRG_Ped_Painter01 SF2_Painter_Hanging
    TRG_Ped_Painter01:Obj_ClearExceptions
  endif
  Wait 1 gameframe
  SendException EX_BALL_ROCK Name = EMB_Ball07
  SendException EX_BALL_ROCK Name = G_Gap2_SupportWires02
endscript
script Sf2_Goal_Gap2_Start
  SpawnScript Sf2_Goal_Gap2_StartActual ID = sf2_fap2_spawnscript
endscript
script Sf2_Goal_Gap2_StartActual
  trg_g_gap2_pro:Obj_MoveToNode Name = TRG_G_GAP2_ProNav02 orient
  trg_g_gap2_pro:Obj_PlayAnim Anim = Ped_M_ShakeFist Cycle
endscript
script SF2_goal_gap2_deactivate
  Kill spawnedscript ID = sf2_fap2_spawnscript
  GoalManager_GetGoalParams Name = SF2_Goal_GAPS2
  if GoalManager_HasWonGoal Name = SF2_Goal_GAPS2
    if not GotParam just_won_goal
      Kill Prefix = "G_Gap2_SupportWires"
      Kill Prefix = "TRG_G_GAP2_WireNode"
      Kill Prefix = "TRG_Shark"
      Kill Prefix = "TRG_Ped_Painter"
      Kill Prefix = "JOW_EMB_BallShadow"
      Kill Prefix = "G_Gap2_SupportWires"
      Kill Prefix = "TRG_G_GAP2_WireNode"
      Kill Prefix = "EMB_Ball07"
    endif
  endif
endscript
script Sf2_Goal_Gap2_Outro
  Skater:KillSkater node = TRG_Start_Gen03
  MakeSkaterGoto SkaterInit
  Kill Prefix = "JOW_EMB_BallShadow"
  Kill Prefix = "G_Gap2_SupportWires"
  Kill Prefix = "TRG_G_GAP2_WireNode"
  Create Prefix = "EMB_Ball09"
  SF2_Create_the_Cars
endscript
script Sf2_Goal_Gap2_Success
  Kill Prefix = "TRG_Ped_Painter"
  Skater:KillSkater node = TRG_G_GAP2_RestartNode
endscript
script SF2_G_GAP2_StartGap1
  EndGap GapID = SF2_G_GAP2_StartGap1 GapScript = SF2_G_GAP2_StartGap
  StartGap GapID = SF2_G_GAP2_StartGap2 Flags = [ PURE_RAIL ]
endscript
script SF2_G_GAP2_StartGap2
  EndGap GapID = SF2_G_GAP2_StartGap2 GapScript = SF2_G_GAP2_StartGap
  StartGap GapID = SF2_G_GAP2_StartGap1 Flags = [ PURE_RAIL ]
endscript
script SF2_G_GAP2_StartGap
  StartGap GapID = SF2_G_GAP2_StartGap Flags = [ PURE_RAIL ]
  EndGap GapID = SF2_G_GAP2_StartGap Text = "Wire Breakin!!!" Score = 200 GapScript = SF2_G_GAP2_GapDone
endscript
script SF2_G_GAP2_GapDone
  if GoalManager_GoalExists Name = SF2_Goal_GAPS2
    if GoalManager_GoalIsActive Name = SF2_Goal_GAPS2
      SendException EX_BALL_MOVE Name = EMB_Ball07
      PlayStream HitConcBalls
      Kill Prefix = "JOW_EMB_BallShadow"
      Kill Prefix = "G_Gap2_Support"
      Kill Prefix = "TRG_G_GAP2_WireNode"
      if GoalManager_SetGoalFlag Name = SF2_Goal_GAPS2 got_1 1
      endif
      PauseClock
    endif
  endif
endscript
script SF2_G_GAP2_Ball
  Obj_SetException EX = EX_BALL_MOVE Scr = SF2_G_GAP2_BallMove
  Obj_SetException EX = EX_BALL_ROCK Scr = SF2_G_GAP2_BallRock
endscript
script SF2_G_GAP2_Wire
  Obj_SetBoundingSphere 100000
  Obj_SetException EX = EX_BALL_ROCK Scr = SF2_G_GAP2_WireRock
endscript
script SF2_G_GAP2_WireRock
  Wait 3 Seconds
  begin
    Obj_MoveToRelPos (0, -1, 0) Speed = 1
    Obj_WaitMove
    Obj_MoveToRelPos (0, 1, 0) Speed = 1
    Obj_WaitMove
  repeat 20
  begin
    Obj_MoveToRelPos (0, -1, 0) Speed = 0.5
    Obj_WaitMove
    Obj_MoveToRelPos (0, 1, 0) Speed = 0.5
    Obj_WaitMove
  repeat 5
  begin
    Obj_MoveToRelPos (0, -1, 0) Speed = 0.1
    Obj_WaitMove
    Obj_MoveToRelPos (0, 1, 0) Speed = 0.1
    Obj_WaitMove
  repeat 5
endscript
script SF2_G_GAP2_BallRock
  Wait 3 Seconds
  begin
    Obj_RotZ angle = 1 Speed = 7
    Obj_WaitRotate
    Obj_RotZ angle = -1 Speed = 7
    Obj_WaitRotate
  repeat 10
  begin
    Obj_RotZ angle = 1 Speed = 3
    Obj_WaitRotate
    Obj_RotZ angle = -1 Speed = 3
    Obj_WaitRotate
  repeat 3
  begin
    Obj_RotZ angle = 1 Speed = 1
    Obj_WaitRotate
    Obj_RotZ angle = -1 Speed = 1
    Obj_WaitRotate
  repeat 3
endscript
script SF2_G_GAP2_BallMove
  Obj_MoveToNode Name = EMB_Ball07 orient
  Obj_RotZ Speed = 700
  Obj_PathHeading off
  Obj_SetPathAcceleration 200 mphps
  Obj_SetPathDeceleration 200 mphps
  Obj_SetPathVelocity 50 mph
  Obj_FollowPathLinked
  Wait 20 Frames
  PlaySound HitMetalCan_11 Vol = 200 Pitch = 40
  Wait 60 Frames
  PlaySound HitMetalCan_11 Vol = 200 Pitch = 50
  Wait 40 Frames
  PlaySound HitMetalCan_11 Vol = 100 Pitch = 30
  Wait 30 Frames
  PlaySound HitMetalCan_11 Vol = 100 Pitch = 30
  Obj_WaitMove
  Obj_MoveToNode Name = TRG_G_Gap2_BallNav06
  Obj_SetPathAcceleration 600 mphps
  Obj_FollowPathLinked
  RunScriptOnObject ID = TRG_Shark CJR_SF2_SharkDie
  Wait 15 Frames
  PlaySound FallWater Vol = 300 Pitch = 50
  Wait 10 Frames
  PlaySound FallWater Vol = 300 Pitch = 120
  Obj_WaitMove
  Wait 1 Second
  Die
endscript
script SF2_G_GAP2_BallJump
  Printf "jump!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  Obj_Jump gravity = -800 Speed = 450
  Obj_WaitJumpFinished
  Obj_Jump gravity = -800 Speed = 250
endscript
script SF2_Goal_Counter_Intro
  TRG_G_Counter_Ped_Wife:Obj_VarSet var = 0 value = 0
  Kill Prefix = "TRGP_Fisherman"
  Kill Prefix = "TRG_Ped_Fisherman"
  Kill Prefix = "Fisherman0"
  Kill Prefix = "TRG_Seal0"
  Kill Prefix = "TRG_Ped_Seal_Husband"
  Wait 1 frame
  Create Prefix = "TRG_Ped_Seal_Husband"
  Create Prefix = "TRG_Seal0"
  Create Prefix = "Fisherman01_Box_Open"
  Create Prefix = "Fisherman02_Box_Open"
  Create Prefix = "Fisherman03_Box_Open"
  Create Prefix = "Fisherman04_Box_Open"
  Create Prefix = "TRG_Ped_Fisherman"
  Create Prefix = "TRGP_Fisherman01_Box"
  Create Prefix = "TRGP_Fisherman02_Box"
  Create Prefix = "TRGP_Fisherman03_Box"
  Create Prefix = "TRGP_Fisherman04_Box"
endscript
script SF2_Goal_Counter_Deactivate
  TRG_G_Counter_Ped_Wife:Obj_VarSet var = 0 value = 0
  Kill Prefix = "TRGP_Fisherman"
  Kill Prefix = "TRG_Ped_Fisherman"
  Kill Prefix = "Fisherman0"
  Kill Prefix = "TRG_Seal0"
  Kill Prefix = "TRG_Ped_Seal_Husband"
  Wait 1 frame
  Create Prefix = "TRG_Ped_Seal_Husband"
  Create Prefix = "TRG_Seal0"
  Create Prefix = "Fisherman01_Box_Open"
  Create Prefix = "Fisherman02_Box_Open"
  Create Prefix = "Fisherman03_Box_Open"
  Create Prefix = "Fisherman04_Box_Open"
  Create Prefix = "TRG_Ped_Fisherman"
  Create Prefix = "TRGP_Fisherman01_Box"
  Create Prefix = "TRGP_Fisherman02_Box"
  Create Prefix = "TRGP_Fisherman03_Box"
  Create Prefix = "TRGP_Fisherman04_Box"
endscript
script SF2_Goal_Counter_Outro
  Printf "running outro script..................................."
  Kill Prefix = "TRGP_Fisherman"
  Kill Prefix = "TRG_Ped_Fisherman"
  Kill Prefix = "Fisherman0"
  Kill Prefix = "TRG_Seal0"
  Kill Prefix = "TRG_Ped_Seal_Husband"
  Wait 1 frame
  Create Prefix = "Fisherman01_Box_Open"
  Create Prefix = "Fisherman02_Box_Open"
  Create Prefix = "Fisherman03_Box_Open"
  Create Prefix = "Fisherman04_Box_Open"
  Create Prefix = "TRG_Ped_Fisherman"
  Create Prefix = "TRGP_Fisherman01_Box"
  Create Prefix = "TRGP_Fisherman02_Box"
  Create Prefix = "TRGP_Fisherman03_Box"
  Create Prefix = "TRGP_Fisherman04_Box"
endscript
Fisherman01Params = {
  Fisherman = TRG_Ped_Fisherman01
  Box_Polys = TRGP_Fisherman01_Box
  Gap_Polys_1 = TRGP_Fisherman01_Payload01
  Gap_Polys_2 = TRGP_Fisherman01_Payload02
  Box_Open = Fisherman01_Box_Open
  Box_Closed = Fisherman01_Box_Closed
  Check_Target = TRG_Fisherman01_Target_Box
  Fish_Target = TRG_Fisherman01_Target_Payload
  Payload = G_Seal_Fisherman01_Payload
  Payload_Move = Fisherman01_Payload_Move
  Bait_Target = TRG_Fisherman01_Bait_Target
  Bait_Camera = Cam_Fisherman01_Bait
  Seal_EX = EX_SEAL_GO_1 }
Fisherman02Params = {
  Fisherman = TRG_Ped_Fisherman02
  Box_Polys = TRGP_Fisherman02_Box
  Gap_Polys_1 = TRGP_Fisherman02_Payload01
  Gap_Polys_2 = TRGP_Fisherman02_Payload02
  Box_Open = Fisherman02_Box_Open
  Box_Closed = Fisherman02_Box_Closed
  Check_Target = TRG_Fisherman02_Target_Box
  Fish_Target = TRG_Fisherman02_Target_Payload
  Payload = G_Seal_Fisherman02_Payload
  Payload_Move = Fisherman02_Payload_Move
  Bait_Target = TRG_Fisherman02_Bait_Target
  Bait_Camera = Cam_Fisherman02_Bait
  Seal_EX = EX_SEAL_GO_2 }
Fisherman03Params = {
  Fisherman = TRG_Ped_Fisherman03
  Box_Polys = TRGP_Fisherman03_Box
  Gap_Polys_1 = TRGP_Fisherman03_Payload01
  Gap_Polys_2 = TRGP_Fisherman03_Payload02
  Box_Open = Fisherman03_Box_Open
  Box_Closed = Fisherman03_Box_Closed
  Check_Target = TRG_Fisherman03_Target_Box
  Fish_Target = TRG_Fisherman03_Target_Payload
  Payload = G_Seal_Fisherman03_Payload
  Payload_Move = Fisherman03_Payload_Move
  Bait_Target = TRG_Fisherman03_Bait_Target
  Bait_Camera = Cam_Fisherman03_Bait
  Seal_EX = EX_SEAL_GO_3 }
Fisherman04Params = {
  Fisherman = TRG_Ped_Fisherman04
  Box_Polys = TRGP_Fisherman04_Box
  Gap_Polys_1 = TRGP_Fisherman04_Payload01
  Gap_Polys_2 = TRGP_Fisherman04_Payload02
  Box_Open = Fisherman04_Box_Open
  Box_Closed = Fisherman04_Box_Closed
  Check_Target = TRG_Fisherman04_Target_Box
  Fish_Target = TRG_Fisherman04_Target_Payload
  Payload = G_Seal_Fisherman04_Payload
  Payload_Move = Fisherman04_Payload_Move
  Bait_Target = TRG_Fisherman04_Bait_Target
  Bait_Camera = Cam_Fisherman04_Bait
  Seal_EX = EX_SEAL_GO_4 }
script CJR_SF2_Idiot
  Obj_ClearExceptions
  Obj_SetException EX = EX_SEAL_GO_4 Scr = CJR_SF2_Idiot_Saved
  begin
    Obj_CycleAnim Anim = Ped_SG_Idle NumCycles = random( @
  1
    @2
    @3
     ) 
   Obj_CycleAnim Anim = random( @
   Ped_SG_Approach
    @Ped_SG_Shout
     ) 
   random( @
   Obj_PlayStream husband_far01 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far02 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far03 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far04 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far05 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far06 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far07 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far08 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far09 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far10 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far11 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far12 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far13 Vol = 200 Dropoff = 300
    @Obj_PlayStream husband_far14 Vol = 200 Dropoff = 300
   ) 
    If GetFlag flag = SEAL_GOAL_SKIP_ENDING // If I remember correctly this might be a failsafe if the cutscene at the end of Feed the 4 Angry Sea Lions is skipped
      Wait 2 seconds
      break
    endif
 repeat
 Die
endscript
script CJR_SF2_Idiot_Saved
  Obj_ClearExceptions
  Wait 120 Frames
  Obj_CycleAnim Anim = Ped_SG_Idle
  Obj_SetPathVelocity 3.25
  Obj_SetPathAcceleration 6
  Obj_StickToGround off
  Obj_PathHeading off
  Obj_PlayAnim Anim = Ped_SG_WalkFromIdle
  Wait 5 Frames
  Obj_FollowPathLinked
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_SG_Walk Cycle
endscript
script CJR_SF2_Idiot_Hop
  Obj_CycleAnim Anim = Ped_SG_WalkHop
endscript
script CJR_SF2_Idiot_Path_SpeedUp
  Obj_SetPathVelocity 8
  Obj_SetPathAcceleration 15
endscript
script CJR_SF2_Idiot_Path_SpeedDown
  Obj_SetPathVelocity 10
  Obj_SetPathAcceleration 10
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_M_Run Cycle
  Obj_FollowPathLinked
  Obj_WaitMove
  Die
endscript
script CJR_SF2_Fisherman
  Obj_SetInnerRadius 4
  Obj_SetException EX = EX_FISHERMAN_BOX Scr = CJR_SF2_Fisherman_React Params = <...>
  Obj_SetException EX = EX_FISHERMAN_BAIT Scr = CJR_SF2_Fisherman_Robbed Params = <...>
  Wait 1 frame
  if GoalManager_GoalIsActive Name = SF2_Goal_Counter
    Obj_SetException EX = SkaterInRadius Scr = Sf2_Fisherman_Knock_Skater Params = <...>
  else
    Obj_SetException EX = SkaterInRadius Scr = CJR_SF2_Fisherman_Fall Params = <...>
  endif
  begin
    Obj_LookAtNode Name = <Fish_Target>
    Obj_PlayAnim Anim = random( @
  Ped_Fish_Idle1
    @Ped_Fish_CastOff
    @Ped_Fish_Idle2
     ) Obj_WaitAnimFinished
    random( @@@Obj_PlayStream fisherman_sf2_random01
   ) 
   repeat
endscript
script CJR_SF2_Fisherman_Fall
  Obj_ClearExceptions
  Obj_SetOuterRadius 15
  Obj_SetException EX = SkaterOutOfRadius Scr = CJR_SF2_Fisherman_GetUp Params = <...>
  Obj_SetException EX = EX_FISHERMAN_BAIT Scr = CJR_SF2_Fisherman_Robbed Params = <...>
  PlayStream random( @
  Fisherman_SF2_Avoid01 Vol = 225
  @Fisherman_SF2_Avoid02 Vol = 225
  @Fisherman_SF2_Avoid03 Vol = 225
  @Fisherman_SF2_Avoid04 Vol = 225
   ) 
   Obj_PlayAnim Anim = Ped_M_FalldownA
endscript
script CJR_SF2_Fisherman_GetUp
  Obj_ClearExceptions
  Obj_SetInnerRadius 3
  Obj_SetException EX = SkaterInRadius Scr = CJR_SF2_Fisherman_Fall Params = <...>
  Obj_SetException EX = EX_FISHERMAN_BAIT Scr = CJR_SF2_Fisherman_Robbed Params = <...>
  Obj_PlayAnim Anim = Ped_M_GetUpA
  Obj_WaitAnimFinished
  GotoPreserveParams CJR_SF2_Fisherman
endscript
script CJR_SF2_Fisherman_React
  Obj_ClearExceptions
  Obj_SetException EX = EX_FISHERMAN_BAIT Scr = CJR_SF2_Fisherman_Robbed Params = <...>
  Kill Name = <Box_Polys>
  if GoalManager_GoalIsActive Name = SF2_Goal_Counter
    Create Name = <Gap_Polys_1>
    Create Name = <Gap_Polys_2>
  endif
  StopStream
  Wait 1 frame
  PlayStream random( @
  Fisherman_SF2_Box01 Vol = 225
  @Fisherman_SF2_Box02 Vol = 300
  @Fisherman_SF2_Box03 Vol = 225
  @Fisherman_SF2_Box04 Vol = 225
   ) 
   Wait 30 Frames
  Obj_LookAtNode Name = <Check_Target>
  Obj_PlayAnim Anim = Ped_WalkFromStandIdle
  Obj_MoveToNode Name = <Check_Target> Speed = 2
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_Walk Cycle
  Obj_WaitMove
  Obj_PlayAnim Anim = Ped_WalkToStandIdle
  Wait 1.5 Seconds
  Kill Name = <Box_Closed>
  Create Name = <Box_Open>
  GotoPreserveParams CJR_SF2_Fisherman_Return
endscript
script CJR_SF2_Fisherman_Return
  Obj_ClearExceptions
  Obj_SetException EX = EX_FISHERMAN_BOX Scr = CJR_SF2_Fisherman_React Params = <...>
  Obj_SetException EX = EX_FISHERMAN_BAIT Scr = CJR_SF2_Fisherman_Robbed Params = <...>
  Create Name = <Box_Polys>
  Obj_LookAtNode Name = <Fish_Target>
  Obj_PlayAnim Anim = Ped_WalkFromStandIdle
  Obj_MoveToNode Name = <Fish_Target> Speed = 1.5
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_Walk Cycle
  Wait 30 Frames
  Obj_WaitMove
  Kill Name = <Gap_Polys_1>
  Kill Name = <Gap_Polys_2>
  Obj_PlayAnim Anim = Ped_WalkToStandIdle
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_StandIdleToIdle
  Obj_WaitAnimFinished
  GotoPreserveParams CJR_SF2_Fisherman
endscript
script CJR_SF2_Fisherman_Robbed
  Obj_ClearExceptions
  Obj_MoveToNode Name = <Check_Target>
  Obj_LookAtNode Name = <Fish_Target>
  PlayStream random( @Fisherman_SF2_Payload01 Vol = 225
  @Fisherman_SF2_Payload02 Vol = 225
  @Fisherman_SF2_Payload03 Vol = 225
  @Fisherman_SF2_Payload04 Vol = 225
  @Fisherman_SF2_Payload05 Vol = 225
   ) if IsAlive Name = <Box_Closed>
    Kill Name = <Box_Closed>
    Create Name = <Box_Open>
  endif
  if IsAlive Name = <Gap_Polys_1>
    Kill Name = <Gap_Polys_1>
  endif
  if IsAlive Name = <Gap_Polys_2>
    Kill Name = <Gap_Polys_2>
  endif
  if IsAlive Name = <Box_Polys>
    Kill Name = <Box_Polys>
  endif
  Goto CJR_SF2_Fisherman Params = <...>
endscript
script CJR_SF2_Fisherman_Box_Hit
  Printf "KILL OPEN BOX!"
  Kill Name = <Box_Open>
  Printf "KILLED OPEN BOX...NOW CREATE CLOSED BOX"
  if not IsAlive Name = <Box_Closed>
    Printf "I'M NOT ALIVE I'M NOT ALIVE I'M NOT ALIVE I'M NOT ALIVE!!!"
    Create Name = <Box_Closed>
    Printf "CREATED CLOSED BOX...NOW TELL FISHERMAN TO REACT"
  else
    Printf "I'M ALIVE I'M ALIVE I'M ALIVE I'M ALIVE"
    Printf "NOT CREATING NEW CLOSED BOX...NOW TELL FISHERMAN TO REACT"
  endif
  SendException EX_FISHERMAN_BOX Name = <Fisherman>
endscript
script CJR_SF2_TackleBox
  Printf "CLOSED BOX ROTATING 1"
  Obj_RotZ Speed = 990 FLAG_MAX_COORDS
  Wait 30 Frames
  Printf "CLOSED BOX ROTATING 2"
  Obj_RotZ Speed = 880 FLAG_MAX_COORDS
  Wait 30 Frames
  Printf "CLOSED BOX ROTATING 3"
  Obj_RotZ Speed = 770 FLAG_MAX_COORDS
  Wait 30 Frames
  Printf "CLOSED BOX ROTATING 4"
  Obj_RotZ Speed = 660 FLAG_MAX_COORDS
  Wait 30 Frames
  Printf "CLOSED BOX ROTATING 5"
  Obj_RotZ Speed = 550 FLAG_MAX_COORDS
  Wait 30 Frames
  Obj_RotZ Speed = 440 FLAG_MAX_COORDS
  Wait 30 Frames
  Printf "CLOSED BOX ROTATING 2"
  Obj_RotZ Speed = 330 FLAG_MAX_COORDS
  Wait 30 Frames
  Printf "CLOSED BOX ROTATING 3"
  Obj_RotZ Speed = 220 FLAG_MAX_COORDS
  Wait 30 Frames
  Printf "CLOSED BOX ROTATING 4"
  Obj_RotZ Speed = 110 FLAG_MAX_COORDS
  Wait 44 Frames
  Printf "CLOSED BOX ROTATING 5"
  Obj_RotZ Speed = 0 FLAG_MAX_COORDS
  Printf "CLOSED BOX WAIT ROTATE"
  Obj_WaitRotate
  Printf "CLOSED BOXED DONE ROTATE...NOW WAITS"
endscript
script CJR_SF2_EndGap_Fisherman01_Payload
  EndGap GapID = Fisherman01_Payload GapScript = CJR_SF2_Seal_Param_Pass01
endscript
script CJR_SF2_EndGap_Fisherman02_Payload
  EndGap GapID = Fisherman02_Payload GapScript = CJR_SF2_Seal_Param_Pass02
endscript
script CJR_SF2_EndGap_Fisherman03_Payload
  EndGap GapID = Fisherman03_Payload GapScript = CJR_SF2_Seal_Param_Pass03
endscript
script CJR_SF2_EndGap_Fisherman04_Payload
  EndGap GapID = Fisherman04_Payload GapScript = CJR_SF2_Seal_Param_Pass04
endscript
script SF2_Falling_Fish Name = TRG_Fisherman03_Bait_Target bait = Fisherman03_Bait
  Obj_MoveToRelPos (0, -1000, 0) Speed = 10
  Obj_WaitMove
  Create Name = <bait>
  Die
endscript
script SF2_Fisherman_Bait_Landed
  Obj_RotZ Speed = 10
endscript
script CJR_SF2_Seal
  Obj_ApplyScaling X = random( @1.1 @1.2 @1.3  ) Y = random( @1.1 @1.2 @1.3  ) z = random( @1.1 @1.2 @1.3 ) 
  Obj_ClearExceptions
  Obj_SetException EX = EX_SEAL_GO_1 Scr = CJR_SF2_Seal_Get_Bait Params = Fisherman01Params
  Obj_SetException EX = EX_SEAL_GO_2 Scr = CJR_SF2_Seal_Get_Bait Params = Fisherman02Params
  Obj_SetException EX = EX_SEAL_GO_3 Scr = CJR_SF2_Seal_Get_Bait Params = Fisherman03Params
  Obj_SetException EX = EX_SEAL_GO_4 Scr = CJR_SF2_Seal_Get_Bait Params = Fisherman04Params
  Wait random( @
  1 Seconds
  @1.25 Seconds
  @1.5 Seconds
  @1.75 Seconds
  @2 Seconds
  @2.25 Seconds
  @2.5 Seconds
   ) 
   begin
    Obj_PlayStream random( @Sealbark @Sealbark3 @Sealhappy3  ) Pitch = random( @80 @90 @100 ) 
    Obj_CycleAnim Anim = Bark NumCycles = random( @
  1
    @2
    @3
     ) 
   Wait random( @
   0.25 Seconds
    @0.5 Seconds
    @0.75 Seconds
    @1 Seconds
     ) 
   Obj_PlayStream random( @Sealbark4 @Sealhappy  ) Pitch = random( @80 @85 @90 @95 @100 ) 
    Obj_CycleAnim Anim = Idle
  repeat
endscript
script CJR_SF2_Seal_Get_Bait
  Obj_PlayAnim Anim = WalkFromIdle
  Obj_LookAtNodeLinked
  Obj_WaitRotate
  Obj_SetPathAcceleration 35 fpsps
  Obj_SetPathVelocity 15 fps
  Obj_WaitAnimFinished
  Obj_FollowPathLinked
  Obj_PlayAnim Anim = Walk Cycle
  Obj_WaitMove
  Obj_SetAnimCycleMode off
  Obj_WaitAnimFinished
  Obj_ShadowOff
  Obj_PlayAnim Anim = SlideOff
  Wait 10 Frames
  Obj_PlayStream Sealslide
  Obj_WaitAnimFinished
  Obj_LookAtNode Name = <Bait_Target>
  Obj_MoveToNode Name = <Bait_Target>
  Wait 0.5 Seconds
  Obj_PlayAnim Anim = PopUp
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Eating
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Eating
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Eating
  Obj_WaitAnimFinished
  Die
  begin
    Obj_CycleAnim Anim = Idle NumCycles = 1
    Obj_CycleAnim Anim = Clap NumCycles = 2
  repeat
endscript
OBJFLAG_SEAL01 = 1
OBJFLAG_SEAL02 = 2
OBJFLAG_SEAL03 = 3
OBJFLAG_SEAL04 = 4
script CJR_SF2_Seal_Param_Pass01
  SendException EX_FISHERMAN_BAIT Name = TRG_Ped_Fisherman01
  Wait 1 frame
  TRG_G_Counter_Ped_Wife:sf2_wife_reacting Fisherman01Params
endscript
script CJR_SF2_Seal_Param_Pass02
  SendException EX_FISHERMAN_BAIT Name = TRG_Ped_Fisherman02
  Wait 1 frame
  TRG_G_Counter_Ped_Wife:sf2_wife_reacting Fisherman02Params
endscript
script CJR_SF2_Seal_Param_Pass03
  SendException EX_FISHERMAN_BAIT Name = TRG_Ped_Fisherman03
  Wait 1 frame
  TRG_G_Counter_Ped_Wife:sf2_wife_reacting Fisherman03Params
endscript
script CJR_SF2_Seal_Param_Pass04
  SendException EX_FISHERMAN_BAIT Name = TRG_Ped_Fisherman04
  Wait 1 frame
  TRG_G_Counter_Ped_Wife:sf2_wife_reacting Fisherman04Params
endscript
script SF2_Wife_Waiting
  Obj_ClearException
  Obj_CycleAnim Anim = Ped_F_Angry
endscript
script SF2_Wife_Checking
  Obj_CycleAnim Anim = Ped_F_Wave
  begin
    if Obj_FlagSet OBJFLAG_SEAL01
      sf2_wife_reacting Fisherman01Params
    endif
    if Obj_FlagSet OBJFLAG_SEAL02
      sf2_wife_reacting Fisherman02Params
    endif
    if Obj_FlagSet OBJFLAG_SEAL03
      sf2_wife_reacting Fisherman03Params
    endif
    if Obj_FlagSet OBJFLAG_SEAL04
      sf2_wife_reacting Fisherman04Params
    endif
    Obj_ClearFlag OBJFLAG_SEAL01
    Obj_ClearFlag OBJFLAG_SEAL02
    Obj_ClearFlag OBJFLAG_SEAL03
    Obj_ClearFlag OBJFLAG_SEAL04
    Wait 3 frame
  repeat
endscript
script sf2_wife_reacting ID = WifeReact
  Obj_PlayAnim Anim = Ped_F_Talk1
  GoalManager_GotCounterObject Name = SF2_Goal_Counter
  Obj_VarInc var = 0
  if Obj_VarEQ var = 0 value = 1
    Printf "GOT ONE GOAL OB SEAL BAIT"
    Skater:Obj_MoveToRelPos (0, -1000, 0) time = 0.001
    Skater:SparksOff
    Wait 1 frame
    GoalManager_PauseGoal Name = SF2_Goal_Counter
    PauseSkaters
    Skater:Hide
    kill_start_key_binding
    PlaySkaterCamAnim Skater = 0 Name = <Bait_Camera>
    SpawnScript SF2_Wife_Kill_Dialog
    Wait 10 Frames
    Create Name = <Payload_Move>
    Kill Name = <Payload>
    Wait 140 Frames
    StopStream
    Wait 1 frame
    PlayStream wife_sf2_goal_counter_midsuccess01
    SendException <Seal_EX> Name = TRG_Seal01
    Create_Panel_Block ID = current_goal Text = "1 of 4 Sea Lions Distracted!" Style = panel_message_goal
    Gen_WaitForCameraAnimToFinish
    speech_box_exit
    KillSpawnedScript SF2_Wife_Kill_Dialog
    restore_start_key_binding
    Skater:Unhide
    UnPauseSkaters
    GoalManager_UnPauseGoal Name = SF2_Goal_Counter
    Skater:Obj_MoveToRelPos (0, 1000, 0) time = 0.001
  endif
  if Obj_VarEQ var = 0 value = 2
    Printf "GOT TWO GOAL OB SEAL BAIT"
    Skater:Obj_MoveToRelPos (0, -1000, 0) time = 0.001
    Skater:SparksOff
    Wait 1 frame
    GoalManager_PauseGoal Name = SF2_Goal_Counter
    PauseSkaters
    Skater:Hide
    kill_start_key_binding
    PlaySkaterCamAnim Skater = 0 Name = <Bait_Camera>
    SetSkaterCamAnimSkippable Name = <Bait_Camera>
    SpawnScript SF2_Wife_Kill_Dialog
    Wait 10 Frames
    Create Name = <Payload_Move>
    Kill Name = <Payload>
    Wait 140 Frames
    StopStream
    Wait 1 frame
    PlayStream wife_sf2_goal_counter_midsuccess02
    SendException <Seal_EX> Name = TRG_Seal02
    Create_Panel_Block ID = current_goal Text = "2 of 4 Sea Lions Distracted!" Style = panel_message_goal
    Gen_WaitForCameraAnimToFinish
    KillSpawnedScript SF2_Wife_Kill_Dialog
    speech_box_exit
    restore_start_key_binding
    Skater:Unhide
    UnPauseSkaters
    GoalManager_UnPauseGoal Name = SF2_Goal_Counter
    Skater:Obj_MoveToRelPos (0, 1000, 0) time = 0.001
  endif
  if Obj_VarEQ var = 0 value = 3
    Printf "GOT THREE GOAL OB SEAL BAIT"
    Skater:Obj_MoveToRelPos (0, -1000, 0) time = 0.001
    Skater:SparksOff
    Wait 1 frame
    GoalManager_PauseGoal Name = SF2_Goal_Counter
    PauseSkaters
    Skater:Hide
    kill_start_key_binding
    PlaySkaterCamAnim Skater = 0 Name = <Bait_Camera>
    SpawnScript SF2_Wife_Kill_Dialog
    Wait 10 Frames
    Create Name = <Payload_Move>
    Kill Name = <Payload>
    Wait 140 Frames
    StopStream
    Wait 1 frame
    PlayStream wife_sf2_goal_counter_midsuccess01
    SendException <Seal_EX> Name = TRG_Seal03
    Create_Panel_Block ID = current_goal Text = "3 of 4 Sea Lions Distracted!" Style = panel_message_goal
    Gen_WaitForCameraAnimToFinish
    KillSpawnedScript SF2_Wife_Kill_Dialog
    speech_box_exit
    restore_start_key_binding
    Skater:Unhide
    UnPauseSkaters
    GoalManager_UnPauseGoal Name = SF2_Goal_Counter
    Skater:Obj_MoveToRelPos (0, 1000, 0) time = 0.001
  endif
  if Obj_VarEQ var = 0 value = 4
    Printf "GOT FOUR GOAL OB SEAL BAIT"
    Skater:Obj_MoveToRelPos (0, -1000, 0) time = 0.001
    Skater:SparksOff
    Skater:Hide
    Wait 1 frame
    SetFlag flag = SEAL_GOAL_SKIP_ENDING
    Spawnscript SF2_Wife_Kill_Dialog
    PauseSkaters
    Wait 10 Frames
    Create Name = <Payload_Move>
    Kill Name = <Payload>
    Kill Prefix = "TRG_Seal0"
    Wait 1 frame
    Create Name = TRG_Seal04
    Wait 40 Frames
    SendException <Seal_EX> Name = TRG_Seal04
    Wait 140 Frames
    SendException EX_SEAL_GO_4 Name = TRG_Ped_Seal_Husband
    Gen_WaitForCameraAnimToFinish
    speech_box_exit
    Skater:Unhide
    UnPauseSkaters
    Skater:Obj_MoveToRelPos (0, 1000, 0) time = 0.001
  endif
  Obj_ClearFlag OBJFLAG_SEAL01
  Obj_ClearFlag OBJFLAG_SEAL02
  Obj_ClearFlag OBJFLAG_SEAL03
  Obj_ClearFlag OBJFLAG_SEAL04
  Goto SF2_Wife_Checking
endscript
script SF2_Wife_Kill_Dialog // This prompt appears when you drop fish into the water
  create_speech_box {
    Text = "Press \m0 to skip"
    pad_choose_script = SF2_Wife_Kill_Activate
    pad_choose_params = { Bait_Camera = <Bait_Camera> }
  }
endscript
script SF2_Wife_Kill_Activate // Skips cutscenes of sealions eating fish
  PlaySkaterCamAnim Skater = 0 stop
  KillSpawnedScript ID = Wife_React
  KillSkaterCamAnim skaterId = 0
  restore_start_key_binding
  Skater:Unhide
  UnPauseSkaters
  GoalManager_UnPauseGoal Name = SF2_Goal_Counter
  Skater:Obj_MoveToRelPos (0, 1000, 0) time = 0.001
  speech_box_exit
  If GetFlag flag = SEAL_GOAL_SKIP_ENDING
    Wait 10 frames
    SendException EX_SEAL_GO_4 Name = TRG_Ped_Seal_Husband
  endif
endscript
script CJR_SF2_Shark
  Obj_SetException ex = SkaterInRadius Scr = CJR_SF2_SharkKillSkater
  Obj_SetBoundingSphere 100000
  Obj_SetInnerRadius 10
  Wait 5 seconds
  Obj_ApplyScaling X = 3.0 Y = 3.0 Z = 3.0
  Obj_MoveToLink speed = 30
  Obj_PlayAnim Anim = OnPier NumCycles = 1
  StopStream
  Wait 1 frame
  Obj_PlayStream Sharkcrash
  Obj_PlaySound FallWater vol = 300 pitch = 80 dropoff = 300
  Wait 10 frames
  Kill name = P7_Rail_Broken04
  Create name = P7_Rail_Broken05
  Wait 1 frame
  ShatterAndDie name = P7_Rail_Broken05
  Obj_PlaySound HitMetalCan_11
  Obj_WaitAnimFinished
  Obj_CycleAnim Anim = Hit
  CJR_SF2_SharkAnims
endscript
script CJR_SF2_SharkKillSkater
  create_panel_message style = panel_message_death ID = death_message text = "Shark food!"
  Skater:KillSkater node = TRG_Start_Gen03
  pulse_blur start = 255 speed = 5
  Obj_ClearExceptions
  Wait 20 frames
  Obj_SetException ex = SkaterInRadius Scr = CJR_SF2_SharkKillSkater
  CJR_SF2_SharkAnims
endscript
script CJR_SF2_SharkAnims
  begin
    Obj_CycleAnim Anim = Swivel NumCycles = 1
    Obj_CycleAnim Anim = Chomp NumCycles = 1
    Obj_PlaySound FallWater vol = 200 pitch = random( @80 @100 @110 ) 
    randomnorepeat( @
    
    @
    @
    @Obj_PlayStream painterNeal_sf2_falling01
    @Obj_PlayStream painterNeal_sf2_falling02
    @Obj_PlayStream painterNeal_sf2_falling03
    @Obj_PlayStream painterNeal_sf2_falling04
    @Obj_PlayStream painterNeal_sf2_falling05
    @Obj_PlayStream painterNeal_sf2_falling06
    @Obj_PlayStream painterNeal_sf2_falling07
    @Obj_PlayStream painterNeal_sf2_falling08
     ) 
    Wait random( @10 @20 @30 ) 
    Obj_PlaySound FallWater vol = 200 pitch = random( @80 @100 @110 ) 
  repeat
endscript
script CJR_SF2_SharkDie
  Wait 0.3 second
  Obj_PlayStream Sharkcrash
  Obj_MoveToNode name = TRG_G_Gap2_BallNav08 speed = 70
  Obj_WaitMove
  Die
endscript
script SF2_GAP2_SettingsCheck
endscript
script CJR_SF2_Painter2
  setup_ped_speech { ped_id = TRG_G_GAP2_Pro01
    display_name = "Painter Bob"
    speed = 200
    inner_radius = 20
    activation_script = SF2_PainterVO3
    text = [ "Painter Bob:\n Quit Bothering me, - maybe my partner needs a hand on the pier.." ]
  }
  Obj_PlayAnim Anim = Ped_PNT_CrouchStroke Cycle
endscript
script CJR_SF2_Painter2Anims
  speech_box_exit
  TRG_G_GAP2_Pro01:CJR_SF2_Painter2AnimsCycle
  MakeSkaterGoto SkaterInit
endscript
script CJR_SF2_Painter2AnimsCycle
  begin
    Obj_CycleAnim Anim = Ped_PNT_Stroke NumCycles = random( @
    1
    @2
    @3
    @4
     ) 
    Obj_CycleAnim Anim = random( @
    Ped_PNT_Dip
    @Ped_PNT_LookAround
    @Ped_PNT_Stroke
    @Ped_PNT_Stroke
     ) 
  repeat
endscript
script SF2_Painter_Wait
  Obj_MoveToNode name = TRG_G_GAP2_Pro orient
  begin
    Obj_CycleAnim Anim = Ped_PNT_Stroke NumCycles = random( @
    1
    @2
    @3
    @4
     ) 
    Obj_CycleAnim Anim = random( @
    Ped_PNT_Dip
    @Ped_PNT_LookAround
    @Ped_PNT_Stroke
    @Ped_PNT_Stroke
     ) 
  repeat
endscript
script SF2_Painter_HelpPartnerStill
  Obj_PlayAnim Anim = Ped_M_ShakeFist
  Obj_WaitAnimFinished
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathAcceleration 20 mphps
  Obj_SetPathDeceleration 20 mphps
  Obj_SetPathVelocity 40 mph
  Obj_PlayAnim Anim = Ped_M_Run Cycle
  Obj_FollowPathLinked
  Obj_WaitMove
  Obj_PlayAnim Anim = Ped_M_ShakeFist Cycle
endscript
script SF2_Painter_HelpPartnerStill2
  Obj_MoveToNode name = TRG_G_GAP2_ProNav02
  Obj_PlayAnim Anim = Ped_M_ShakeFist Cycle
endscript
script SF2_PainterVO1
  StopStream
  Wait 1 frame
  PlayStream painterneal_sf2_talking
endscript
script SF2_PainterVO2
  StopStream
  Wait 1 frame
  PlayStream painterneal2_sf2_talking
endscript
script SF2_PainterVO3
  StopStream
  Wait 1 frame
  PlayStream painterbob_sf2_talking
endscript
script CJR_SF2_Painter
  Obj_ShadowOff
  if not IsAlive name = TRG_G_GAP2_Pro
    Printf "creating arrow !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    Wait 1 frame
    SetScreenElementLock ID = root_window off
    if not IsTrue no_arrows
      CreateScreenElement {
        parent = root_window
        type = Element3D
        ID = PainterArrow
        model = "Arrow"
        HoverParams = { Amp = 9.5 Freq = 2.5 }
        AngVelY = 0.16
        ParentParams = { name = TRG_Ped_Painter01 (0, 100, 0) IgnoreParentsYRotation }
      }
    endif
  else
    SF2_Painter_Hanging
  endif
  Obj_SetException ex = EX_PAINTER_SWITCH Scr = SF2_Painter_Hanging
  setup_ped_speech { ped_id = TRG_Ped_Painter01
    display_name = "Painter"
    speed = 200
    inner_radius = 20
    text = [ "Painter Neal:\n Look - if you really wanna help me- clean the bird turd off of the railing in one shot pole-to-pole - I'm paintin that next... " ]
    activation_script = SF2_PainterVO1
  }
  Obj_PlayAnim Anim = Ped_PNT_Stroke Cycle
endscript
OBJFLAG_SF2_LADDER_FALL = 0
SKIP_SHARK = 1
script SF2_Painter_Ladder
  Obj_SetException ex = EX_PAINTER_SWITCH Scr = SF2_Painter_Ladder_Fall
endscript
script SF2_Painter_Ladder_Fall
  Obj_MoveToRelPos (0, -50, 0) time = 0.4
  Wait 2.8 seconds
  Obj_MoveToRelPos (-20, -130, 0) time = 0.6
  Obj_RotX angle = 90 speed = 180
  Obj_WaitMove
  Wait 5 seconds
endscript
script SF2_Painter_Hanging
  Obj_ClearExceptions
  if ObjectExists ID = PainterArrow
    DestroyScreenElement ID = PainterArrow
  endif
  Kill prefix = "TRG_G_GAP2_Pro01"
  GoalManager_UnlockGoal name = SF2_Goal_GAPS2
  Obj_MoveToRelPos (0, -50, 0) time = 0.2
  Obj_PlayAnim Anim = Ped_PNT_StrokeToShaking
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_PNT_Shaking Cycle
  Wait 1.8 seconds
  Obj_MoveToRelPos (-20, -110, 0) time = 0.6
  Obj_PlayAnim Anim = Ped_PNT_LatchOn
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_PNT_Hanging Cycle
  begin
    Obj_PlayStream SharkSquirm vol = 100 dropoff = 200
    Printf "shark sounds"
    Wait 11 seconds
  repeat
endscript
script CJR_SF2_SharkPier_Break
  if IsCareerMode
    if not GoalManager_HasActiveGoals
      Kill_start_key_binding
      PauseSkaters
      Kill prefix = "TRG_Pigeon"
      if not GoalManager_HasWonGoal name = SF2_Goal_GAPS2
        UnPauseSkaters
        Skater:Obj_MoveToNode name = TRG_G_Bogus_RestartNode
        MakeSkaterGoto SkaterInit
        Wait 1 frame
        PauseSkaters
        PlaySkaterCamAnim Skater = 0 name = Cam_P7_Break
        Skater:ShakeCamera {
          duration = 0.5
          vert_amp = 9.0
          horiz_amp = 3.0
          vert_vel = 10.27
          horiz_vel = 5.92
        }
        StopStream
        Wait 1 frame
        if not GoalManager_GoalIsActive
          PlayStream PierStress
        endif
        SpawnScript CJR_SF2_SharkPier_Break_Skip
        Wait 2 seconds
        If not GetFlag flag = SKIP_SHARK
          if not GoalManager_GoalIsActive
            PlaySound HitMetalCan_11 vol = 300 pitch = 40
          endif
          SendException EX_PAINTER_SWITCH name = TRG_Ped_Painter01
          SendException EX_PAINTER_SWITCH name = P7_Seal_Ladder
        endif
      endif
      If not GetFlag flag = SKIP_SHARK
        Kill name = P7_Platform_Norm
        Create name = P7_Platform_Broken_Nub
        Kill name = P7_Rail_Norm01
        Kill name = P7_Rail_Norm02
        Create name = P7_Rail_Broken_Nub
        Create name = P7_Rail_Broken01
        Create name = P7_Platform_Broken01
        Create name = P7_Rail_Broken02
        Create name = P7_Platform_Broken02
        Create name = P7_Rail_Broken03
        Create name = P7_Rail_Broken04
        Create name = P7_Platform_Broken03
        Kill name = P7_Sign_Norm
        Create name = P7_Sign_Broken
        Kill name = P7_Pillars_Norm
        Create name = P7_Pillars_Broken
        Wait 2 seconds
        StopStream
        Wait 1 frame
      endif
      If not GetFlag flag = SKIP_SHARK
        if not GoalManager_GoalIsActive
          PlayStream painterNeal_sf2_falling03 vol = 300
        endif
        Create name = TRG_Shark
        begin
          if SkaterCamAnimFinished Skater = 0 name = Cam_P7_Break
            break
          endif
          Wait 1 frame
        repeat
        Kill prefix = "TRG_Rail_P7_Norm"
        Create prefix = "TRG_Rail_P7_Broken"
        UnPauseSkaters
        GoalManager_ActivateGoal name = SF2_Goal_GAPS2
        restore_start_key_binding
      endif
    endif
  endif
endscript

script CJR_SF2_SharkPier_Break_Skip
  create_speech_box {
    Text = "Press \m0 to skip"
    pad_choose_script = CJR_SF2_SharkPier_Break_Skip_Activate audio_skip
    }
endscript

script CJR_SF2_SharkPier_Break_Skip_Activate
  KillSpawnedScript CJR_SF2_SharkPier_Break
  Kill prefix = "TRG_Rail_P7_Norm"
  Create prefix = "TRG_Rail_P7_Broken"
  SetFlag flag = SKIP_SHARK
  SendException EX_PAINTER_SWITCH name = TRG_Ped_Painter01
  SendException EX_PAINTER_SWITCH name = P7_Seal_Ladder
  SpawnScript CJR_SF2_SharkPier_Break_Fast
  Wait 1 frame
  UnPauseSkaters
  GoalManager_ActivateGoal name = SF2_Goal_GAPS2
  restore_start_key_binding
endscript

script CJR_SF2_SharkPier_Break_Fast
  Kill prefix = "TRG_Pigeon"
  Kill name = P7_Platform_Norm
  Create name = P7_Platform_Broken_Nub
  Kill name = P7_Rail_Norm01
  Kill name = P7_Rail_Norm02
  Create name = P7_Rail_Broken_Nub
  Create name = P7_Rail_Broken01
  Create name = P7_Platform_Broken01
  Create name = P7_Rail_Broken02
  Create name = P7_Platform_Broken02
  Create name = P7_Rail_Broken03
  Create name = P7_Rail_Broken04
  Create name = P7_Platform_Broken03
  Kill name = P7_Sign_Norm
  Create name = P7_Sign_Broken
  Kill name = P7_Pillars_Norm
  Create name = P7_Pillars_Broken
  Kill prefix = "TRG_Rail_P7_Norm"
  Create prefix = "TRG_Rail_P7_Broken"
  if not GoalManager_HasWonGoal name = SF2_Goal_GAPS2
    Create name = TRG_Shark
  endif
endscript
script CJR_SF2_SharkPier_Fix
  PauseSkaters
  OceanPosts01:Obj_RotZ angle = -17 speed = 30
  Create name = P7_Platform_Norm
  Kill name = P7_Platform_Broken_Nub
  Create name = P7_Rail_Norm01
  Create name = P7_Rail_Norm02
  Kill name = P7_Rail_Broken_Nub
  Kill name = P7_Rail_Broken01
  Kill name = P7_Platform_Broken01
  Kill name = P7_Rail_Broken02
  Kill name = P7_Platform_Broken02
  Kill name = P7_Rail_Broken03
  Kill name = P7_Platform_Broken03
  Create name = P7_Sign_Norm
  Kill name = P7_Sign_Broken
  Create name = P7_Pillars_Norm
  Kill name = P7_Pillars_Broken
  Kill name = TRG_Shark
  Create name = P7_Seal_Ladder
  Kill name = TRG_Ped_Painter01
  Wait 1 frame
  Create name = TRG_Ped_Painter01
  Create prefix = "TRG_Rail_P7_Norm"
  Kill prefix = "TRG_Rail_P7_Broken"
  UnPauseSkaters
endscript
script CJR_SF2_PierBreak_Piece01
  Obj_RotY angle = 15 speed = 50 FLAG_MAX_COORDS
  If not GetFlag flag = SKIP_SHARK
    Obj_PlayStream PierBreak pitch = 80
  endif
endscript
script CJR_SF2_PierBreak_Fence01
  Obj_RotY angle = 15 speed = 50 FLAG_MAX_COORDS
endscript
script CJR_SF2_PierBreak_Piece02
  Obj_MoveToNode name = TRG_Waypoint_P7_Target01 speed = 10
  OceanPosts01:Obj_RotZ angle = 10 speed = 30
  If not GetFlag flag = SKIP_SHARK
    if not GoalManager_HasWonGoal name = SF2_Goal_GAPS2
      PlaySound HitMetalCan_11 vol = 130 pitch = 60
    endif
  endif
  Obj_WaitMove
  Wait 2.5 seconds
  If not GetFlag flag = SKIP_SHARK
    if not GoalManager_HasWonGoal name = SF2_Goal_GAPS2
      PlaySound HitMetalCan_11 vol = 130 pitch = 60
    endif
  endif
  Obj_RotY angle = 25 speed = 100 FLAG_MAX_COORDS
  OceanPosts01:Obj_RotZ angle = 7 speed = 30
endscript
script CJR_SF2_PierBreak_Fence02
  Obj_MoveToNode name = TRG_Waypoint_P7_Target01 speed = 10
  Obj_WaitMove
  Wait 2.5 seconds
  Obj_RotY angle = 25 speed = 100 FLAG_MAX_COORDS
endscript
script CJR_SF2_PierBreak_Piece03
  Obj_MoveToNode name = TRG_Waypoint_P7_Target02 speed = 10
  Obj_WaitMove
  Wait 2.5 seconds
  Obj_MoveToNode name = TRG_Waypoint_P7_Target03 speed = 20
  Wait 5 frames
  Obj_RotY angle = 10 speed = 50 FLAG_MAX_COORDS
  If not GetFlag flag = SKIP_SHARK
    Obj_PlayStream Piercrash
  endif
endscript
script CJR_SF2_PierBreak_Fence03
  Obj_MoveToNode name = TRG_Waypoint_P7_Target02 speed = 10
  Obj_WaitMove
  Wait 2.5 seconds
  Obj_MoveToNode name = TRG_Waypoint_P7_Target03 speed = 20
  Wait 5 frames
  Obj_RotY angle = 10 speed = 50 FLAG_MAX_COORDS
endscript
script CJR_SF2_PierBreak_Sign
  Obj_MoveToNode name = TRG_Waypoint_P7_Target02 speed = 10
  Obj_WaitMove
  Wait 2.5 seconds
  Obj_MoveToNode name = TRG_Waypoint_P7_Target03 speed = 20
  Wait 5 frames
  Obj_RotY angle = 10 speed = 50 FLAG_MAX_COORDS
endscript
script CJR_SF2_EndGap_Mechanic
  EndGap GapID = <ID1> Text = "Mechanic Pop" Score = 50
endscript
script CJR_SF2_SoundTest
  PlaySound GapSound Vol = 100
endscript
script CJR_SF2_CarSpawn_Path_A
endscript
script CJR_SF2_Elevator
  Create_Panel_Message Text = "2nd Floor" pos = (320, 300) rgba = [ 118 , 110 , 14 , 128 ]
  Sk3_TeleportToNode nodename = TRG_Start_24_Hallway
endscript
script sf2_fisherman_idle
  Printf "sf2_fisherman_idle"
  Obj_SetInnerRadius 6
  Obj_SetException EX = SkaterInRadius Scr = Sf2_Fisherman_Knock_Skater
  begin
    Obj_PlayAnim Anim = DickIdle Cycle
    Wait random( @
    1 seconds
    @1.5 seconds
    @2 seconds
    @2.5 seconds
    @3 seconds
     ) 
    Obj_PlayAnim Anim = random( @
    DickBeckon
    @DickBeckon
    @DickBeckon
     ) 
    Obj_WaitAnimFinished
  repeat
endscript
script Sf2_Fisherman_Knock_Skater
  Obj_ClearException SkaterInRadius
  Obj_LookAtObject Type = Skater time = 0.05
  MakeSkaterGoto PedKnockDown
  Wait 4 Seconds
  Obj_SetException EX = SkaterInRadius Scr = Sf2_Fisherman_Knock_Skater Params = <...>
  GotoPreserveParams CJR_SF2_Fisherman
endscript
script sf2_fisherman_got_tackle_box
  Printf "sf2_fisherman_got_tackle_box"
  Obj_SwitchScript sf2_fisherman_fix_tackle_box
endscript
script sf2_fisherman_fix_tackle_box
  Printf "sf2_fisherman_fix_tackle_box"
  Obj_Rotate relative = (0, 180, 0) time = 0.2
  Wait 5 Seconds
  Obj_Rotate relative (0, 180, 0) time = 0.2
  Obj_SwitchScript sf2_fisherman_idle
endscript
OBJFLAG_DONTCREATECARS = 0
OBJFLAG_ONECARGONE = 1
script SF2_CarGenerator_PathA numcars = 8
  Obj_VarSet var = 0 value = 0
  begin
    if Obj_FlagSet OBJFLAG_DONTCREATECARS
    else
      if Obj_VarGT var = 0 value = <numcars>
      else
        randomnorepeat( @
        SF2_CheckThenCreateCar carname = TRG_Car_Path_A_Minivan01
        @SF2_CheckThenCreateCar carname = TRG_Car_Path_A_Galaxie01
        @SF2_CheckThenCreateCar carname = TRG_Car_Path_A_ChevPick01
        @SF2_CheckThenCreateCar carname = TRG_Car_Path_A_TransAm01
        @SF2_CheckThenCreateCar carname = TRG_Car_Path_A_Focus01
         ) 
      endif
    endif
    begin
      Wait 10 frame
      if Obj_FlagSet OBJFLAG_ONECARGONE
        Obj_ClearFlag OBJFLAG_ONECARGONE
        Obj_VarDec var = 0
      endif
    repeat randomnorepeat( @60 @90 @150 @200 ) 
  repeat
endscript
script SF2_CarGenerator_PathB numcars = 8
  Obj_VarSet var = 0 value = 0
  Kill Prefix = "TRG_Car_Path_C_BusUS02"
  Create Prefix = "TRG_Car_Path_C_BusUS02"
  begin
    if Obj_FlagSet OBJFLAG_DONTCREATECARS
    else
      if Obj_VarGT var = 0 value = <numcars>
      else
        randomnorepeat( @
        SF2_CheckThenCreateCar carname = TRG_Car_Path_B_Minivan01
        @SF2_CheckThenCreateCar carname = TRG_Car_Path_B_Galaxie01
        @SF2_CheckThenCreateCar carname = TRG_Car_Path_B_ChevPick01
        @SF2_CheckThenCreateCar carname = TRG_Car_Path_B_TransAm01
        @SF2_CheckThenCreateCar carname = TRG_Car_Path_B_Focus01
         ) 
      endif
    endif
    begin
      Wait 10 frame
      if Obj_FlagSet OBJFLAG_ONECARGONE
        Obj_ClearFlag OBJFLAG_ONECARGONE
        Obj_VarDec var = 0
      endif
    repeat randomnorepeat( @60 @90 @150 @200 ) 
  repeat
endscript
script SF2_CheckThenCreateCar
  if not IsAlive Name = <carname>
    Create Name = <carname>
    Obj_VarInc var = 0
  endif
endscript
script SF2_Path_A_CarKillItself
  if IsAlive Name = TRG_Car_Generator_Path_A
    SendFlag Name = TRG_Car_Generator_Path_A OBJFLAG_ONECARGONE
  endif
  Die
endscript
script SF2_Path_B_CarKillItself
  if IsAlive Name = TRG_Car_Generator_Path_B
    SendFlag Name = TRG_Car_Generator_Path_B OBJFLAG_ONECARGONE
  endif
  Die
endscript
OBJFLAG_MBEATZ_BEAT_INC = 0
OBJFLAG_MBEATZ_BEAT_DEC = 1
OBJFLAG_MBEATZ_ON_BEAT = 2
OBJFLAG_MBEATZ_ON_MAIN_BEAT = 3
script SF2_Goal_Counter4_Intro
  SetScreenElementLock ID = root_window off
  CreateScreenElement {
    Type = ContainerElement
    parent = root_window
    ID = equalizer
    dims = (640, 480)
    pos = (320, 295)
  }
  SF2_Goal_Counter4_StandardBar bar = bar1 pos = (215, 480)
  SF2_Goal_Counter4_StandardBar bar = bar2 pos = (245, 480)
  SF2_Goal_Counter4_StandardBar bar = bar3 pos = (275, 480)
  SF2_Goal_Counter4_StandardBar bar = bar4 pos = (305, 480)
  SF2_Goal_Counter4_StandardBar bar = bar5 pos = (335, 480)
  SF2_Goal_Counter4_StandardBar bar = bar6 pos = (365, 480)
  SF2_Goal_Counter4_StandardBar bar = bar7 pos = (395, 480)
  SF2_Goal_Counter4_StandardBar bar = bar8 pos = (425, 480)
  SpawnScript SF2_Goal_Counter4_BarRandomMoveRepeat ID = SF2_Goal_Counter4
endscript
script SF2_Goal_Counter4_StandardBar bar = bar1 pos = 320
  CreateScreenElement {
    Type = SpriteElement
    parent = equalizer
    ID = <bar>
    pos = <pos>
    just = [ center bottom ]
    texture = white2
    scale = (2, 5)
    rgba = [ 255 1 1 40 ]
  }
endscript
script SF2_Goal_Counter4_BarRandomMoveRepeat
  begin
    SF2_Goal_Counter4_BarRandomMove
    Wait 3 frame
  repeat
endscript
script SF2_Goal_Counter4_BarRandomMove
  SF2_Goal_Counter4_BarRandomDoMorph bar = bar1
  SF2_Goal_Counter4_BarRandomDoMorph bar = bar2
  SF2_Goal_Counter4_BarRandomDoMorph bar = bar3
  SF2_Goal_Counter4_BarRandomDoMorph bar = bar4
  SF2_Goal_Counter4_BarRandomDoMorph bar = bar5
  SF2_Goal_Counter4_BarRandomDoMorph bar = bar6
  SF2_Goal_Counter4_BarRandomDoMorph bar = bar7
  SF2_Goal_Counter4_BarRandomDoMorph bar = bar8
endscript
script SF2_Goal_Counter4_BarRandomDoMorph
  if trg_test_music:Obj_VarEQ var = 2 value = 2
    DoScreenElementMorph {
      ID = <bar>
      DoMorph time = 0.01 scale = ( (1, 0) + randomrange(9, 11) * (0, 0.1) ) relative_scale
    }
  else
    if trg_test_music:Obj_VarEQ var = 2 value = 1
      DoScreenElementMorph {
        ID = <bar>
        DoMorph time = 0.01 scale = ( (1, 0) + randomrange(9, 11) * (0, 0.1) ) relative_scale
      }
    else
      DoScreenElementMorph {
        ID = <bar>
        DoMorph time = 0.01 scale = ( (1, 0) + randomrange(9, 11) * (0, 0.1) ) relative_scale
      }
    endif
  endif
endscript
script SF2_Goal_Counter4_BarBeatUpAndDown
  if trg_test_music:Obj_VarEQ var = 2 value = 2
    HighScale = (2, 28)
    LowScale = (2, 21)
  else
    if trg_test_music:Obj_VarEQ var = 2 value = 1
      HighScale = (2, 25)
      LowScale = (2, 19)
    else
      HighScale = (2, 23)
      LowScale = (2, 17)
    endif
  endif
  SF2_Goal_Counter4_BarBeatUpMorph bar = bar1 HighScale = <HighScale>
  SF2_Goal_Counter4_BarBeatUpMorph bar = bar2 HighScale = <HighScale>
  SF2_Goal_Counter4_BarBeatUpMorph bar = bar3 HighScale = <HighScale>
  SF2_Goal_Counter4_BarBeatUpMorph bar = bar4 HighScale = <HighScale>
  SF2_Goal_Counter4_BarBeatUpMorph bar = bar5 HighScale = <HighScale>
  SF2_Goal_Counter4_BarBeatUpMorph bar = bar6 HighScale = <HighScale>
  SF2_Goal_Counter4_BarBeatUpMorph bar = bar7 HighScale = <HighScale>
  SF2_Goal_Counter4_BarBeatUpMorph bar = bar8 HighScale = <HighScale>
  SF2_Goal_Counter4_BarRandomMove
  Wait 10 Frames
  SF2_Goal_Counter4_BarBeatDownMorph bar = bar1 LowScale = <LowScale>
  SF2_Goal_Counter4_BarBeatDownMorph bar = bar2 LowScale = <LowScale>
  SF2_Goal_Counter4_BarBeatDownMorph bar = bar3 LowScale = <LowScale>
  SF2_Goal_Counter4_BarBeatDownMorph bar = bar4 LowScale = <LowScale>
  SF2_Goal_Counter4_BarBeatDownMorph bar = bar5 LowScale = <LowScale>
  SF2_Goal_Counter4_BarBeatDownMorph bar = bar6 LowScale = <LowScale>
  SF2_Goal_Counter4_BarBeatDownMorph bar = bar7 LowScale = <LowScale>
  SF2_Goal_Counter4_BarBeatDownMorph bar = bar8 LowScale = <LowScale>
  SF2_Goal_Counter4_BarRandomMove
endscript
script SF2_Goal_Counter4_BarBeatUpMorph HighScale = (4, 43)
  DoScreenElementMorph {
    ID = <bar>
    DoMorph time = 0.01 scale = <HighScale>
  }
endscript
script SF2_Goal_Counter4_BarBeatDownMorph LowScale = (4, 37)
  DoScreenElementMorph {
    ID = <bar>
    DoMorph time = 0.01 scale = <LowScale>
  }
endscript
script SF2_Goal_Counter4_Deactivate
  KillSpawnedScript ID = SF2_Goal_Counter4
  if ObjectExists ID = equalizer
    DestroyScreenElement ID = equalizer
  endif
endscript
script MuskaBeatzCounterUpdate
  trg_test_music:Obj_VarGet var = 1 Name = counter
  if ( <counter> > 1000 )
    Create_Panel_Message ID = MuskaBeatzCounter Text = "1000" Style = panel_message_Muskabeatz
  else
    FormatText TextName = Foo "%q" q = <counter>
    Create_Panel_Message ID = MuskaBeatzCounter Text = <Foo> Style = panel_message_Muskabeatz
  endif
endscript
script SF2_MB_Bar_TurnGreen
  SetProps rgba = [ 1 255 1 70 ]
endscript
script SF2_MB_Bar_TurnRed
  SetProps rgba = [ 28 72 20 50 ]
endscript
script PlayMusicBeatz music = base_01_11 waittime = 60 numbeatz = 2 extratime = 0
  PlaySound <music> Vol = 100
  SendFlag Name = TRG_Test_MusicCheck02 OBJFLAG_MBEATZ_ON_MAIN_BEAT
  SendFlag Name = TRG_Test_MusicCheck03 OBJFLAG_MBEATZ_ON_MAIN_BEAT
  begin
    RunScriptOnScreenElement ID = <bar> SF2_MB_Bar_TurnGreen
    if Obj_VarEQ var = 2 value = 2
      PlaySound mb_bass02_44 Vol = 200
    endif
    if Obj_VarEQ var = 2 value = 1
      PlaySound mb_bass01_44 Vol = 200
    endif
    SendFlag Name = TRG_Test_MusicCheck02 OBJFLAG_MBEATZ_ON_BEAT
    SendFlag Name = TRG_Test_MusicCheck03 OBJFLAG_MBEATZ_ON_BEAT
    Create_Panel_Message ID = BeatSignal Text = "B E A T" pos = (315, 67)
    SF2_Goal_Counter4_BarBeatUpAndDown
    RunScriptOnScreenElement ID = <bar> SF2_MB_Bar_TurnRed
    ClearFlag Name = TRG_Test_MusicCheck02 OBJFLAG_MBEATZ_ON_BEAT
    ClearFlag Name = TRG_Test_MusicCheck02 OBJFLAG_MBEATZ_ON_MAIN_BEAT
    ClearFlag Name = TRG_Test_MusicCheck03 OBJFLAG_MBEATZ_ON_BEAT
    ClearFlag Name = TRG_Test_MusicCheck03 OBJFLAG_MBEATZ_ON_MAIN_BEAT
    Create_Panel_Message ID = BeatSignal Text = " "
    Wait <waittime> Frames
    MuskaBeatzCounterUpdate
    SendFlag Name = TRG_Test_MusicCheck02 OBJFLAG_MBEATZ_ON_BEAT
    SendFlag Name = TRG_Test_MusicCheck03 OBJFLAG_MBEATZ_ON_BEAT
  repeat <numbeatz>
  Wait <extratime> Frames
  SF2_TestMusic_LevelSwitchCheck
endscript
script SF2_TestMusic_LevelSwitchCheck level = 0
  if Obj_VarLT var = 1 value = 0
    Obj_VarSet var = 1 value = 0
  endif
  if Obj_VarGT var = 1 value = 1000
    Obj_VarSet var = 1 value = 0
    Obj_VarSet var = 2 value = 0
    Wait 25 Frames
    PlaySound MB_RaiseLevel_11 Vol = 1000
    Create_Panel_Message ID = goal_complete_line2 Text = "New Stage!" Style = panel_message_goalcomplete
    GoalManager_GotCounterObject Name = SF2_Goal_Counter4
    Obj_VarInc var = 0 value = <level>
    Wait 40 Frames
  else
    if Obj_VarGT var = 1 value = 500
      Obj_VarSet var = 2 value = 2
    else
      if Obj_VarGT var = 1 value = 0
        Obj_VarSet var = 2 value = 1
      else
        Obj_VarSet var = 2 value = 0
      endif
    endif
  endif
endscript
script SF2_TestMusic
  Obj_VarSet var = 0 value = 0
  Obj_VarSet var = 1 value = 0
  Obj_VarSet var = 2 value = 0
  Wait 1 Second
  begin
    PauseMusic 1
    if Obj_VarGT var = 0 value = 6
      PlayMusicBeatz { music = MB_Beat09_11 waittime = 11 numbeatz = 16 extratime = 0 bar = bar8 }
    else
      if Obj_VarGT var = 0 value = 5
        PlayMusicBeatz { music = MB_Beat08_11 waittime = 11 numbeatz = 16 extratime = 0 bar = bar7 }
      else
        if Obj_VarGT var = 0 value = 4
          PlayMusicBeatz { music = MB_Beat07_11 waittime = 33 numbeatz = 8 extratime = 0 bar = bar6 }
        else
          if Obj_VarGT var = 0 value = 3
            PlayMusicBeatz { music = MB_Beat06_11 waittime = 11 numbeatz = 16 extratime = 0 bar = bar5 }
          else
            if Obj_VarGT var = 0 value = 2
              PlayMusicBeatz { music = MB_Beat05_11 waittime = 11 numbeatz = 8 extratime = 0 bar = bar4 }
            else
              if Obj_VarGT var = 0 value = 1
                PlayMusicBeatz { music = MB_Beat03_11 waittime = 11 numbeatz = 4 extratime = 0 bar = bar3 }
              else
                if Obj_VarGT var = 0 value = 0
                  PlayMusicBeatz { music = MB_Beat02_11 waittime = 33 numbeatz = 4 extratime = 2 bar = bar2 }
                else
                  PlayMusicBeatz { music = MB_Beat01_11 waittime = 33 numbeatz = 4 extratime = 2 bar = bar1 }
                endif
              endif
            endif
          endif
        endif
      endif
    endif
  repeat
endscript
script SF2_TestMusic1
  begin
    Obj_ClearFlag OBJFLAG_MBEATZ_ON_BEAT
    if SkaterCurrentScorePotGreaterThan 1
      Obj_SetFlag OBJFLAG_MBEATZ_ON_BEAT
    endif
    if Skater:InAir
      Obj_SetFlag OBJFLAG_MBEATZ_ON_BEAT
    endif
    Wait 1 frame
  repeat
endscript
script MuskaBeatzUp soundz = mb_flip_44 repeatz = 1 volz = 200 waitz = 10 beatz = OBJFLAG_MBEATZ_ON_BEAT
  begin
    if Obj_FlagSet <beatz>
      break
    endif
    Wait 1 frame
  repeat
  begin
    trg_test_music:Obj_VarInc var = 1
  repeat <repeatz>
  MuskaBeatzCounterUpdate
  PlaySound <soundz> Vol = <volz>
  Wait <waitz> Frames
endscript
script SF2_TestMusic2
  begin
    if Skater:IsInBail
      Printf "bailing"
      trg_test_music:Obj_VarDec var = 1
      trg_test_music:Obj_VarPrintf var = 1
      trg_test_music:Obj_VarSet var = 1 value = 0
      trg_test_music:Obj_VarSet var = 2 value = 0
      PlaySound MB_DropLevel_11 Vol = 800
      MuskaBeatzCounterUpdate
      begin
        Wait 5 Frames
        if not Skater:IsInBail
          break
        endif
      repeat
    endif
    MuskaBeatzCounterUpdate
    if QueryFlag OBJFLAG_MBEATZ_ON_BEAT Name = TRG_Test_MusicCheck01
      GetSkaterState
      if ( <state> = skater_InManual )
        MuskaBeatzUp soundz = MB_BeatScratch_11 waitz = 20 volz = 170 repeatz = 50 beatz = OBJFLAG_MBEATZ_ON_MAIN_BEAT
      else
        if ( <state> = skater_OnRail )
          MuskaBeatzUp soundz = scratchloop_11 waitz = 40 volz = 800 repeatz = 75 beatz = OBJFLAG_MBEATZ_ON_BEAT
        else
          if Skater:OnLip
            MuskaBeatzUp soundz = scratch_01_11 waitz = 100 volz = 600 repeatz = 15 beatz = OBJFLAG_MBEATZ_ON_BEAT
          endif
        endif
      endif
    endif
    Wait 1 frame
  repeat
endscript
script SF2_TestMusic3
  begin
    begin
      Wait 5 Frames
      if not Skater:IsInBail
        break
      endif
    repeat
    Printf "im alive"
    if QueryFlag OBJFLAG_MBEATZ_ON_BEAT Name = TRG_Test_MusicCheck01
      GetSkaterState
      if ( <state> = skater_InFlip )
        Printf "flip trick"
        if Skater:Held Left
          MuskaBeatzUp soundz = scratch_03_11 waitz = 20 volz = 200 repeatz = 40 beatz = OBJFLAG_MBEATZ_ON_BEAT
        else
          if Skater:Held Right
            MuskaBeatzUp soundz = scratch_03_11 waitz = 20 volz = 200 repeatz = 40 beatz = OBJFLAG_MBEATZ_ON_BEAT
          else
            MuskaBeatzUp soundz = scratch_02_11 waitz = 20 volz = 200 repeatz = 40 beatz = OBJFLAG_MBEATZ_ON_BEAT
          endif
        endif
      else
        if ( <state> = skater_InGrab )
          random( @
          MuskaBeatzUp soundz = rap_11 waitz = 80 volz = 300 repeatz = 50 beatz = OBJFLAG_MBEATZ_ON_BEAT
          @MuskaBeatzUp soundz = MB_Alarm01_11 waitz = 80 volz = 120 repeatz = 50 beatz = OBJFLAG_MBEATZ_ON_BEAT
           ) 
        else
          if Skater:Held R2
            if ( <state> = skater_InManual )
              MuskaBeatzUp soundz = mb_flip_44 waitz = 20 volz = 200 repeatz = 20 beatz = OBJFLAG_MBEATZ_ON_BEAT
            endif
          endif
        endif
      endif
    endif
    Printf "done trick checks"
    begin
      if not Skater:Held square
        if not Skater:Held R2
          Printf "waiting for release"
          break
        endif
      endif
      Wait 1 frame
    repeat
    Wait 1 frame
  repeat
endscript
script SF2_Create_the_Cars
  Create Prefix = "TRG_Car_Generator_Path_"
endscript
script SF2_Kill_the_Cars
  Kill Prefix = "TRG_Car_Path_"
  Kill Prefix = "TRG_Car_Generator_Path_"
endscript
script SF2_Viewfinder_01
  Obj_ClearExceptions
  Obj_SetException EX = SkaterInRadius Scr = SF2_Viewfinder_01_Close
  Obj_SetInnerRadius 10
endscript
script SF2_Viewfinder_01_Close
  Obj_ClearExceptions
  Obj_SetException EX = SkaterOutOfRadius Scr = SF2_Viewfinder_01
  Obj_SetOuterRadius 10
  begin
    if IsCareerMode
      if SkaterSpeedLessThan 1
        if SkaterCurrentScorePotLessThan 1
          if not GoalManager_HasActiveGoals
            break
          endif
        endif
      endif
    endif
    Wait 10 frame
  repeat
  ClearTrickAndScoreText
  PauseSkaters
  create_speech_box {
    Text = [
      "Press \b3 to look through viewfinder"
      "\nPress \m1 to leave"
    ]
    Style = speech_box_style
    pad_back_script = SF2_Viewfinder_01_Decline
    pad_choose_script = SF2_Viewfinder_01_Start
  }
endscript
script SF2_Viewfinder_01_Decline
  UnPauseSkaters
  MakeSkaterGoto SkaterInit
  speech_box_exit
  trg_viewcamchecker01:Nullscript
  trg_viewcamchecker01:Obj_ClearExceptions
  trg_viewcamchecker01:Obj_SetException EX = SkaterOutOfRadius Scr = SF2_Viewfinder_01
  trg_viewcamchecker01:Obj_SetOuterRadius 10
endscript
script SF2_Viewfinder_01_Start
  speech_box_exit
  Create Prefix = "VF_PRISON_"
  Create Prefix = "TRG_ViewFinder_Prisoner"
  PlaySkaterCamAnim Skater = 0 Name = CAM_PRISON
  Gen_WaitForCameraAnimToFinish
  Kill Prefix = "VF_PRISON_"
  Kill Prefix = "TRG_ViewFinder_Prisoner"
  UnPauseSkaters
endscript
script SF2_Viewfinder_Prisoner01
  Obj_PlayAnim Anim = Ped_M_Run Cycle
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 600 mphps
  Obj_SetPathVelocity 10 mph
endscript
script SF2_Viewfinder_02
  Obj_ClearExceptions
  Obj_SetException EX = SkaterInRadius Scr = SF2_Viewfinder_02_Close
  Obj_SetInnerRadius 10
endscript
script SF2_Viewfinder_02_Close
  Obj_ClearExceptions
  Obj_SetException EX = SkaterOutOfRadius Scr = SF2_Viewfinder_02
  Obj_SetOuterRadius 10
  begin
    if IsCareerMode
      if not GoalManager_HasActiveGoals
        if SkaterSpeedLessThan 1
          if SkaterCurrentScorePotLessThan 1
            break
          endif
        endif
      endif
    endif
    Wait 10 frame
  repeat
  ClearTrickAndScoreText
  MakeSkaterGoto HandBrake
  Wait 0.5 Second
  PauseSkaters
  create_speech_box {
    Text = [
      "Press \b3 to look through viewfinder"
      "\nPress \m1 to leave"
    ]
    Style = speech_box_style
    pad_back_script = SF2_Viewfinder_02_Decline
    pad_choose_script = SF2_Viewfinder_02_Start
  }
endscript
script SF2_Viewfinder_02_Decline
  MakeSkaterGoto SkaterInit
  UnPauseSkaters
  speech_box_exit
  trg_viewcamchecker02:Nullscript
  trg_viewcamchecker02:Obj_ClearExceptions
  trg_viewcamchecker02:Obj_SetException EX = SkaterOutOfRadius Scr = SF2_Viewfinder_02
  trg_viewcamchecker02:Obj_SetOuterRadius 10
endscript
script SF2_Viewfinder_02_Start
  speech_box_exit
  if GoalManager_HasActiveGoals
    GoalManager_DeactivateAllGoals
  endif
  Wait 1 frame
  GoalManager_ActivateGoal Name = sf2_goal_minigame_generic
endscript
script SF2_Viewfinder_02_Start2
  speech_box_exit
  Create_Panel_Block ID = current_goal Text = "\n\n\nPress \m1 to Quit" Style = panel_message_goal
  create_speech_box Text = "Quickly tap \b3 to help the seals get away from the shark." Style = speech_box_style pause_input pause_input_time = 3000 z_priority = 10
  Create Prefix = "VF2_MG_Race"
  Create Prefix = "TRG_MG_RACE"
  PlaySkaterCamAnim Skater = 0 Name = CAM_MG_RACE play_hold allow_pause = 1
  pulse_blur start = 255 Speed = 2
  Wait 5 Seconds
  speech_box_exit
  Gen_WaitForCameraAnimToFinish
  GoalManager_DeactivateGoal Name = sf2_goal_minigame_generic
endscript
script SF2_MG_EndMiniGame
  Create_Panel_Block ID = current_goal Text = " " Style = panel_message_goal
  PlaySkaterCamAnim Skater = 0 stop
  Kill Prefix = "VF2_MG_Race"
  Kill Prefix = "TRG_MG_RACE"
  speech_box_exit
  UnPauseSkaters
  MakeSkaterGoto SkaterInit
endscript
OBJFLAG_MG_GOTSPEED = 1
script SF2_MG_RACE_Seal
  Obj_ShadowOff
  Obj_Hover Amp = random( @2 @5 @10  ) Freq = random( @1 @0.8 @1.2 ) 
  Obj_ClearFlag OBJFLAG_MG_GOTSPEED
  begin
    if Obj_FlagSet OBJFLAG_MG_GOTSPEED
      Obj_PlayAnim Anim = swim Speed = 3
    else
      Obj_PlayAnim Anim = swim Speed = 1
    endif
    Obj_WaitAnimFinished
    Obj_PlayStream Vol = 30 random( @
  Sealbark
    @Sealbark3
    @Sealhappy3
     ) 
   Obj_PlaySound Vol = 30 hitbody02 pitch = random( @80 @90 @100 ) 
  repeat
endscript
script SF2_MG_RACE_Shark
  Obj_ShadowOff
  Obj_ApplyScaling X = 3.0 Y = 3.0 z = 3.0
  Wait 1 Second
  Obj_PlayAnim Anim = swim Cycle Speed = 2
  begin
    begin
      SF2_MG_RACE_QuitCheck
      if Skater:Held X
        break
      endif
      Wait 1 frame
    repeat
    begin
      SF2_MG_RACE_QuitCheck
      if not Skater:Held X
        break
      endif
      Wait 1 frame
    repeat
    trg_mg_race_checker:Obj_VarDec var = 0
    trg_mg_race_checker:Obj_VarDec var = 0
  repeat
endscript
script SF2_MG_RACE_QuitCheck
  if IsXBOX
    if Skater:Held Circle
      GoalManager_DeactivateGoal Name = sf2_goal_minigame_generic
    endif
  else
    if IsNGC
      if Skater:Held square
        GoalManager_DeactivateGoal Name = sf2_goal_minigame_generic
      endif
    else
      if Skater:Held triangle
        GoalManager_DeactivateGoal Name = sf2_goal_minigame_generic
      endif
    endif
  endif
endscript
script SF2_MG_RACE_Checker
  begin
    Obj_VarSet var = 0 value = 0
    begin
      Obj_VarInc var = 0
      Wait 5 frame
      Obj_VarGet var = 0 Name = counter
      Obj_VarPrintf var = 0
    repeat 10
    if Obj_VarGT var = 0 value = 0
      trg_mg_race_shark:Obj_MoveToRelPos (0, 0, -30) time = 1
      ClearFlag Prefix = "TRG_MG_RACE_Seal" OBJFLAG_MG_GOTSPEED
      Obj_VarInc var = 1
      if Obj_VarGT var = 1 value = 10
        PlayStream random( @sharkcomp @sharkcomp2 ) 
        Create_Panel_Message ID = SharkDistance Text = "yum, yum!"
        trg_mg_race_shark:Obj_MoveToRelPos (0, 30, 0) time = 0.0
        trg_mg_race_shark:Obj_PlayAnim Anim = Chomp
        Wait 60 Frames
        break
      endif
    endif
    if Obj_VarLT var = 0 value = 0
      trg_mg_race_shark:Obj_MoveToRelPos (0, 0, 30) time = 1
      SendFlag Prefix = "TRG_MG_RACE_Seal" OBJFLAG_MG_GOTSPEED
      Obj_VarDec var = 1
      if Obj_VarLT var = 1 value = -8
        Create_Panel_Message ID = SharkDistance Text = "you got them away!"
        GoalManager_AwardMinigameCash Name = sf2_goal_minigame_generic 500
        break
      endif
    endif
  repeat
  PlaySkaterCamAnim Skater = 0 stop
  Kill Prefix = "TRG_MG_RACE_Seal"
  Kill Prefix = "TRG_MG_RACE_Shark"
  Kill Prefix = "VF2_MG_Race"
  Wait 10 Frames
  Die
endscript
script SF2_Pigeon
  Obj_ShadowOff
  Obj_ClearExceptions
  Obj_SetException EX = SkaterInRadius Scr = SF2_PigeonFly
  Obj_SetInnerRadius 6
  begin
    Obj_PlayAnim Anim = random( @Idle @Idle @FlyHop @Preen @Peck @Preen @Peck ) 
    Obj_LookAtObject Type = Skater time = 0.1
    Obj_WaitAnimFinished
  repeat
endscript
script SF2_PigeonFly
  Obj_ClearExceptions
  Obj_PlayAnim Anim = FlyHop
  PlaySound hitseagulls Pitch = random( @80 @90 @100 @110 ) 
  Obj_WaitAnimFinished
  SF2_Pigeon
endscript
script SF2_GAP_BowlHop1
  EndGap GapID = SF2_GAP_BowlHop1 Text = "Bowl Transfer" Score = 50
  StartGap GapID = Sf2_GAP_BowlHop2 Flags = [ PURE_AIR ]
endscript
script Sf2_GAP_BowlHop2
  EndGap GapID = Sf2_GAP_BowlHop2 Text = "Bowl Transfer" Score = 50
  StartGap GapID = SF2_GAP_BowlHop1 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_RampToRamp1
  EndGap GapID = SF2_GAP_RampToRamp1 Text = "Ramp To Ramp" Score = 50
  StartGap GapID = SF2_GAP_RampToRamp2 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_RampToRamp2
  EndGap GapID = SF2_GAP_RampToRamp2 Text = "Ramp To Ramp" Score = 50
  StartGap GapID = SF2_GAP_RampToRamp1 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_FNTRampToRamp1
  EndGap GapID = SF2_GAP_FNTRampToRamp1 Text = "Fountain Ramp To Ramp" Score = 50
  StartGap GapID = SF2_GAP_FNTRampToRamp2 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_FNTRampToRamp2
  EndGap GapID = SF2_GAP_FNTRampToRamp2 Text = "Fountain Ramp To Ramp" Score = 50
  StartGap GapID = SF2_GAP_FNTRampToRamp1 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_RampUp1Start
  StartGap GapID = SF2_GAP_RampUp1 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_RampUp1End
  EndGap GapID = SF2_GAP_RampUp1 Text = "Rampin up" Score = 50
  StartGap GapID = SF2_GAP_RampUp2 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_RampUp2End
  EndGap GapID = SF2_GAP_RampUp2 Text = "Gone High" Score = 50
endscript
script SF2_GAP_UpTheStairs1
  StartGap GapID = SF2_GAP_UpTheStairs1 Flags = [ PURE_AIR ]
  EndGap GapID = SF2_GAP_DownTheStairs2 Text = "Down the Stairs" Score = 25
endscript
script SF2_GAP_UpTheStairs2
  EndGap GapID = SF2_GAP_UpTheStairs1 Text = "Up the Stairs" Score = 50
  StartGap GapID = SF2_GAP_UpTheStairs2 Flags = [ PURE_AIR ]
  EndGap GapID = SF2_GAP_DownTheStairs1 Text = "Down the Stairs" Score = 25
  StartGap GapID = SF2_GAP_DownTheStairs2 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_UpTheStairs3
  EndGap GapID = SF2_GAP_UpTheStairs2 Text = "Up the Stairs" Score = 50
  StartGap GapID = SF2_GAP_DownTheStairs1 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_EMB_Hop1
  EndGap GapID = SF2_GAP_EMB_Hop2 Text = "EMB Ledge Hop" Score = 25
  StartGap GapID = SF2_GAP_EMB_Hop1 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_EMB_Hop2
  EndGap GapID = SF2_GAP_EMB_Hop1 Text = "EMB Ledge Hop" Score = 25
  StartGap GapID = SF2_GAP_EMB_Hop2 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_Pane_Side
  StartGap GapID = SF2_GAP_Pane_Side Flags = [ PURE_AIR ]
  EndGap GapID = SF2_GAP_Pane_Side Text = "A Pane in the Side" Score = 50
endscript
script SF2_GAP_Pane_Top1
  StartGap GapID = SF2_GAP_Pane_Top1 Flags = [ PURE_AIR ]
  EndGap GapID = SF2_GAP_Pane_Top1 Text = "Paneful Gap" Score = 50
endscript
script SF2_GAP_Pane_Top2
  StartGap GapID = SF2_GAP_Pane_Top2 Flags = [ PURE_AIR ]
  EndGap GapID = SF2_GAP_Pane_Top2 Text = "What a Pane" Score = 50
endscript
script SF2_GAP_DownTheSpiralStairsStart
  StartGap GapID = SF2_GAP_DownTheSpiralStairs Flags = [ CANCEL_GROUND ]
endscript
script SF2_GAP_DownTheSpiralStairsEnd
  EndGap GapID = SF2_GAP_DownTheSpiralStairs Text = "Down the Spiral" Score = 50
endscript
script SF2_GAP_BenchGrind1
  StartGap GapID = SF2_GAP_BenchGrind1 Flags = [ CANCEL_GROUND ]
  EndGap GapID = SF2_GAP_BenchGrind2 Text = "Bench Grind" Score = 50
endscript
script SF2_GAP_BenchGrind2
  StartGap GapID = SF2_GAP_BenchGrind2 Flags = [ CANCEL_GROUND ]
  EndGap GapID = SF2_GAP_BenchGrind1 Text = "Bench Grind" Score = 50
endscript
script SF2_GAP_HubbaLedge1
  StartGap GapID = SF2_GAP_HubbaLedge1 Flags = [ CANCEL_GROUND ]
  EndGap GapID = SF2_GAP_HubbaLedge2 Text = "Hubba Ledge" Score = 50
endscript
script SF2_GAP_HubbaLedge2
  StartGap GapID = SF2_GAP_HubbaLedge2 Flags = [ CANCEL_GROUND ]
  EndGap GapID = SF2_GAP_HubbaLedge1 Text = "Hubba Ledge" Score = 50
endscript
script SF2_GAP_3rdLipStart
  Printf "lips start"
  StartGap GapID = SF2_GAP_3rdLip
endscript
script SF2_GAP_3rdLipEnd
  if TriggerType TRIGGER_LIP_ON
    EndGap GapID = SF2_GAP_3rdLip Text = "3rd n Army Lip" Score = 50
  endif
endscript
script SF2_GAP_3rdGrind1
  StartGap GapID = SF2_GAP_3rdGrind1 Flags = [ CANCEL_GROUND ]
  EndGap GapID = SF2_GAP_3rdGrind2 Text = "3rd n Army Hop n Grind" Score = 50
endscript
script SF2_GAP_3rdGrind2
  StartGap GapID = SF2_GAP_3rdGrind2 Flags = [ CANCEL_GROUND ]
  EndGap GapID = SF2_GAP_3rdGrind1 Text = "3rd n Army Hop n Grind" Score = 50
endscript
script SF2_GAP_BigStairStart
  StartGap GapID = SF2_GAP_BigStair Flags = [ PURE_AIR ]
endscript
script SF2_GAP_BigStairEnd
  EndGap GapID = SF2_GAP_BigStair Text = "Cleared the Stair Set" Score = 50
endscript
script SF2_GAP_Overhead1
  StartGap GapID = SF2_GAP_Overhead1 Flags = [ PURE_AIR ]
  EndGap GapID = SF2_GAP_Overhead2 Text = "Overhead Grind Hop" Score = 50
endscript
script SF2_GAP_Overhead2
  StartGap GapID = SF2_GAP_Overhead2 Flags = [ PURE_AIR ]
  EndGap GapID = SF2_GAP_Overhead1 Text = "Overhead Grind Hop" Score = 50
endscript
script SF2_GAP_LedgeHop1
  StartGap GapID = SF2_GAP_LedgeHop1 Flags = [ PURE_AIR ]
  EndGap GapID = SF2_GAP_LedgeHop2 Text = "Ledge Hop" Score = 50
endscript
script SF2_GAP_LedgeHop2
  StartGap GapID = SF2_GAP_LedgeHop2 Flags = [ PURE_AIR ]
  EndGap GapID = SF2_GAP_LedgeHop1 Text = "Ledge Hop" Score = 50
endscript
script SF2_GAP_UpToTheWires1
  StartGap GapID = SF2_GAP_UpToTheWires1 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_UpToTheWires2
  EndGap GapID = SF2_GAP_UpToTheWires1 Text = "Up To The Wires" Score = 50
endscript
script SF2_GAP_WireHop1
  StartGap GapID = SF2_GAP_WireHop1 Flags = [ PURE_AIR ]
  EndGap GapID = SF2_GAP_WireHop2 Text = "Wire Hop" Score = 25
endscript
script SF2_GAP_WireHop2
  StartGap GapID = SF2_GAP_WireHop2 Flags = [ PURE_AIR ]
  EndGap GapID = SF2_GAP_WireHop1 Text = "Wire Hop" Score = 25
endscript
script SF2_GAP_TC_Roof1
  Printf "TC's roof1"
  EndGap GapID = SF2_GAP_TC_Roof1 Text = "TC's Roof Gap Too" Score = 50
  StartGap GapID = SF2_GAP_TC_Roof2 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_TC_Roof2
  Printf "TC's roof2"
  EndGap GapID = SF2_GAP_TC_Roof2 Text = "TC's Roof Gap Too" Score = 50
  StartGap GapID = SF2_GAP_TC_Roof1 Flags = [ PURE_AIR ]
endscript
script SF2_FallInWater
  if GoalManager_GoalIsActive Name = Sf2_goal_Horse
    GoalManager_LoseGoal Name = Sf2_goal_Horse
  endif
  if GoalManager_GoalIsActive Name = SF2_Goal_Gaps4
    GoalManager_LoseGoal Name = SF2_Goal_Gaps4
  endif
  SK3_KillSkater_Water Message1 = "Glug...Glug...Glug!" Message2 = "Where's Your Floaties?!" Message3 = "Swan Dive!" Message4 = "Cannon Ball!" DeathSound = HitBody02
endscript
script Sf2_OceanSounds
  begin
    Obj_PlayStream dockside Vol = 70 Dropoff = 600
    Wait 57 Seconds
  repeat
endscript
script Sf2_BirdsSounds
  begin
    Obj_PlayStream amb_birdchirps Vol = random( @50 @60 @70  ) Dropoff = 200
    Wait 38 Seconds
  repeat
endscript
script SF2_GAP_Bus01
  EndGap GapID = SF2_GAP_Bus1 Text = "Gap the Bus" Score = 50
  StartGap GapID = SF2_GAP_Bus2 Flags = [ PURE_AIR ]
endscript
script SF2_GAP_Bus02
  EndGap GapID = SF2_GAP_Bus2 Text = "Gap the Bus" Score = 50
  StartGap GapID = SF2_GAP_Bus1 Flags = [ PURE_AIR ]
endscript
script SF2_AddMinigame_Generic
  AddMinigame_Generic {
    CAREER_ONLY
    activate_script = SF2_Viewfinder_02_Start2
    deactivate_script = SF2_MG_EndMiniGame
  }
  endscript
