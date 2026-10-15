SCRIPT Sch_Setup
  IF IsCareerMode
    Create name = TRG_MG_Pong
    IF GoalManager_HasWonGoal name = sch_goal_collect
      Printf "------------ creating the jocks"
      Create prefix = "TRG_Ped_Jock"
      Kill prefix = "G_Collect_Trashcan"
    ELSE
      Printf "------------ not creating the jocks"
      Create prefix = "G_Collect_Trashcan"
    ENDIF
  ELSE
  ENDIF
ENDSCRIPT

SCRIPT sch_startup
  Printf "loading cameras----------------------------------------------"
  LoadSound "sch\sch_security_breathing_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "sch\sch_tennis_11" vol = 100 dropoff = 150
  LoadSound "sch\tennisballbounce_11" vol = 100 dropoff = 150
  LoadSound "sch\tennisballbounce2_11" vol = 100 dropoff = 150
  LoadSound "Shared\Hits\HitGlassPane2x"
  LoadSound "Shared\Auto\LA_Skid_11" vol = 100 dropoff = 150
  LoadSound "Shared\Auto\CarBrakeSqueal" vol = 100 dropoff = 150
  LoadSound "Shared\Auto\CarLoop" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "jnk\dieselgenerator" vol = 100 dropoff = 150 PosUpdate
  LoadSound "Shared\Auto\CarHorn_11" vol = 100 dropoff = 150
  LoadSound "sch\sparks_11"
  LoadSound "sch\spark2_11"
  LoadSound "sch\spark3_11"
  LoadSound "sch\spark4_11"
  LoadSound "sch\spark5_11"
  LoadSound "Shared\Hits\HitMetalCan_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "Shared\Hits\BonkBush" vol = 100 dropoff = 0
  LoadSound "sch\HitFootballHelmet_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "sch\BBallBounce_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "sch\BBallBounce2_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "sch\BBallBounce3_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "sch\BBallhitbasket_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "sch\BBallhitbasket2_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "sch\BBallSwish_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "sch\BBallSwish2_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "sch\BBallSwish3_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "sch\BBallSwish4_11" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "Shared\Animal\ElephantBlast" vol = 100
ENDSCRIPT

SCRIPT Sch_Goals
  IF InMultiplayerGame
    add_multiplayer_mode_goals
  ENDIF
  IF not InSplitScreenGame
    IF not GameModeEquals is_singlesession
      AddGoal_HighScore {
        ordinal = 1
        record_type = time
        win_wait_time = 30
        goal_text = sch_highscore_text
        view_goals_text = sch_highscore_text
        score = sch_highscore_score
        pro = "Jamie"
        full_name = "Jamie Thomas"
        proset_prefix = "ProSet3_"
        start_cam_anim = G_HS_CameraStart
        success_cam_anim = G_HS_CameraSuccess
        reward_goal = Sch_Goal_ProScore
        goal_description = sch_highscore_desc
      }
      AddGoal_ProScore {
        ordinal = 11
        record_type = time
        win_wait_time = 30
        goal_text = sch_proscore_text
        view_goals_text = sch_proscore_text
        score = sch_proscore_score
        pro = "Jamie"
        full_name = "Jamie Thomas"
        proset_prefix = "ProSet1_"
        start_cam_anim = G_PS_CameraStart
        success_cam_anim = G_PS_CameraSuccess
        unlocked_by_another
        goal_description = sch_proscore_desc
      }
      AddGoal_SickScore {
        ordinal = 21
        record_type = time
        win_wait_time = 30
        goal_text = sch_sickscore_text
        view_goals_text = sch_sickscore_text
        score = sch_sickscore_score
        pro = "tony"
        full_name = "Tony Hawk"
        proset_prefix = "ProSet6_"
        start_cam_anim = G_SS_CameraStart
        success_cam_anim = G_SS_CameraSuccess
        pro_goal
        goal_description = sch_sickscore_desc
      }
      AddGoal_Kill {
        ordinal = 17
        record_type = time
        win_wait_time = 30
        goal_text = sch_kill_text
        start_cam_anim = G_KILL_CameraStart
        success_cam_anim = G_KILL_CameraSuccess
        pro = "Jamie"
        full_name = "Jamie Thomas"
        score = sch_kill_score
        pro_goal
        time = 10
        goal_flags = [ got_1
          got_2
          got_3
        ]
        kill_clusters = [ { id = Sch_KillSpot01 flag = got_1 }
          { id = Sch_KillSpot02 flag = got_2 }
          { id = Sch_KillSpot03 flag = got_3 }
        ]
        goal_description = sch_kill_desc
        goal_text = "Get 50,000 on the Benches, Stairs and Flag Pole"
        view_goals_text = "Combo the Benches, Stairs and Flag Pole"
      }
      AddGoal_Tetris {
        ordinal = 5
        record_type = score
        goal_text = "Nail the tricks they yell out"
        time = 60
        proset_prefix = "ProSet4_"
        start_cam_anim = G_TETRIS_CameraStart
        success_cam_anim = G_TETRIS_CameraSuccess
        trigger_prefix = "TRG_G_TETRIS_Spectator"
        goal_start_script = Sch_Goal_Tetris_Start
        goal_deactivate_script = Sch_Goal_Tetris_Deactivate
        pro = "Tony"
        full_name = "Tony Hawk"
        reward_goal = Sch_Goal_Special
        goal_description = sch_tetris_desc
        view_goals_text = "Nail the tricks they yell out"
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
        time_to_stop_adding_tricks = 10
        kill_radius = 180
      }
      AddGoal_Special {
        ordinal = 14
        record_type = time
        CAREER_ONLY
        goal_text = "Get SPECIAL then do a 360 Varial McTwist"
        win_wait_time = 3000
        key_combo_text = "\n360 Varial McTwist\n\k1"
        start_cam_anim = G_SPECIAL_CameraStart
        success_cam_anim = G_SPECIAL_CameraSuccess
        pro = "tony"
        full_name = "Tony Hawk"
        trick_name = Trick_360VarialMcTwist
        trick_type = air
        proset_prefix = "ProSet5_"
        reward_trickslot
        goal_description = sch_special_desc
        unlocked_by_another
        view_goals_text = "Nail a 360 Varial McTwist"
        time = 30
        goal_outro_script = Sch_Goal_Special_outro
      }
      AddGoal_Combo {
        ordinal = 3
        record_type = score
        goal_text = "Collect C-O-M-B-O in one combo"
        view_goals_text = "Collect the C-O-M-B-O letters"
        start_cam_anim = G_COMBO_CameraStart
        pro = "Ollie"
        full_name = "Ollie the Bum"
        success_cam_anim = G_COMBO_CameraSuccess
        reward_goal = Sch_Goal_Counter2
        goal_description = sch_combo_desc
      }
      AddGoal_Counter2 {
        ordinal = 12
        record_type = score
        goal_text = "Get all of the Pink Elephants in one run"
        number = 12
        time = 10
        geo_prefix = "G_Counter2_PinkElephant"
        start_cam_anim = G_COUNTER2_CameraStart
        pro = "Ollie2"
        full_name = "Ollie the Bum"
        goal_description = sch_counter2_desc
        view_goals_text = "Stop all of the Pink Elephants"
        unlocked_by_another
        use_hud_counter
        hud_counter_caption = "Pink Elephants"
      }
      AddGoal_ProCombo {
        ordinal = 19
        record_type = score
        goal_text = "Collect C-O-M-B-O in one combo"
        view_goals_text = "Collect Pro C-O-M-B-O"
        start_cam_anim = G_PROLINE_CameraStart
        success_cam_anim = G_PROLINE_CameraSuccess
        pro = "Ollie"
        full_name = "Ollie the Bum"
        pro_goal
        goal_description = sch_procombo_desc
      }
      AddGoal_Skate {
        ordinal = 2
        goal_text = "Collect S-K-A-T-E"
        record_type = time
        win_wait_time = 40
        view_goals_text = "Collect the S-K-A-T-E letters"
        start_cam_anim = G_SKATE_CameraStart
        success_cam_anim = G_SKATE_CameraSuccess
        full_name = "The Professor"
        pro = "Prof"
        proset_prefix = "ProSet2_"
        goal_description = sch_skate_desc
      }
      AddGoal_Gaps {
        ordinal = 18
        win_wait_time = 30
        record_type = time
        goal_text = "Get all 4 Masters Lip Gaps"
        view_goals_text = "Get all 4 Master's Lip Gaps"
        proset_prefix = "ProSet1_"
        goal_flags = [ got_1
          got_2
          got_3
          got_4
        ]
        start_cam_anim = G_GAP_CameraStart
        success_cam_anim = G_GAP_CameraSuccess
        full_name = "The Professor"
        pro = "Prof"
        time = 60
        pro_goal
        goal_description = sch_gaps_desc
        use_hud_counter
        hud_counter_caption = "Master's Gaps"
      }
      AddGoal_gaps3 {
        ordinal = 9
        record_type = none
        CAREER_ONLY
        unlimited_time
        goal_text = "Skitch the Professor's car"
        view_goals_text = "Skitch the Professor's car"
        goal_flags = [ got_1
        ]
        start_cam_anim = G_GAP3_CameraStart
        success_cam_anim = G_GAP3_CameraSuccess
        key_combo_text = "\nTo Skitch\nHold \b7 behind the car"
        time = 3
        pro = "Prof"
        full_name = "The Professor"
        goal_intro_script = Sch_Goal_Gap3_Intro
        goal_start_script = Sch_Goal_Gap3_Start
        goal_deactivate_script = Sch_Goal_Gap3_Deactivate
        goal_outro_script = Sch_Goal_Gap3_Outro
        goal_success_script = Sch_Goal_Gap3_Success
        goal_description = sch_gaps3_desc
      }
      AddGoal_Collect {
        ordinal = 6
        record_type = time
        win_wait_time = 60
        CAREER_ONLY
        goal_text = "Get back at the 5 frat boys"
        view_goals_text = "Get back at the 5 frat boys"
        goal_flags = [ got_1
          got_2
          got_3
          got_4
          got_5
        ]
        goal_collect_objects = [
          { id = GO_G_COLLECT_FratKeg01 scr = goal_sch_collect_keg1 flag = got_1 fratboy = TRG_G_COLL_FratBoy01 }
          { id = GO_G_COLLECT_FratKeg02 scr = goal_sch_collect_keg2 flag = got_2 }
          { id = GO_G_COLLECT_FratKeg03 scr = goal_sch_collect_keg3 flag = got_3 }
          { id = GO_G_COLLECT_FratKeg04 scr = goal_sch_collect_keg4 flag = got_4 }
          { id = GO_G_COLLECT_FratKeg05 scr = goal_sch_collect_keg5 flag = got_5 }
        ]
        start_cam_anim = G_COLLECT_CameraStart
        success_cam_anim = G_COLLECT_CameraSuccess
        pro = "Buddy"
        full_name = "Your Buddy"
        trigger_wait_script = Sch_TrashedWaiting
        next_trigger_script = Sch_TrashedWaiting
        goal_start_trigger_script = Sch_TrashedTalking
        goal_description = sch_collect_desc
        reward_goal = Sch_Goal_CounterCombo
        collect_type = "frat boys"
        Intro_Node = TRG_G_COLLECT_IntroNode
        goal_intro_script = Sch_Goal_Collect_Intro
        goal_deactivate_script = Sch_Goal_Collect_Deactivate
        goal_outro_script = Sch_Goal_Collect_Outro
        goal_success_script = Sch_Goal_Collect_success
        use_hud_counter
        hud_counter_caption = "Frat Boys\nKnocked"
      }
      AddGoal_CounterCombo {
        ordinal = 15
        CAREER_ONLY
        record_type = score
        goal_text = "Clock 5 jocks in one combo"
        view_goals_text = "Clock 5 jocks in one combo"
        number = 5
        start_cam_anim = G_COUNTERCOMBO_CameraStart
        success_cam_anim = G_COUNTERCOMBO_CameraSuccess
        pro = "Buddy2"
        full_name = "Your Buddy"
        goal_description = sch_countercombo_desc
        goal_countercombo_object_init_script = NullScript
        goal_intro_script = Sch_Goal_Countercombo_Intro
        goal_outro_script = Sch_Goal_Countercombo_Outro
        goal_success_script = Sch_Goal_CounterCombo_Success
        unlocked_by_another
        use_hud_counter
        hud_counter_caption = "Jocks Combo Clocked"
      }
      IF IsPS2
         <sch_goal_trickspot_goal_description> = sch_trickspot_desc_ps2
         <sch_goal_trickspot_goal_text> = "Do a Spine Transfer over the wall."
         <sch_key_combo_text> = "\nSpine Transfer\n(\bg or \bh)"
      ELSE
         <sch_goal_trickspot_goal_description> = sch_trickspot_desc_xbox_ngc
         <sch_goal_trickspot_goal_text> = "Do a Spine Transfer over the wall."
         <sch_key_combo_text> = "\nSpine Transfer\n(\be + \bf)"
      ENDIF
      AddGoal_Trickspot {
        ordinal = 7
        record_type = time
        win_wait_time = 30
        goal_text = <sch_goal_trickspot_goal_text>
        key_combo_text = <sch_key_combo_text>
        goal_flags = [ got_1
          got_2
          got_3
        ]
        start_cam_anim = G_TS_CameraStart
        success_cam_anim = G_TS_CameraSuccess
        pro = "PhotoGuy"
        full_name = "Atiba Jefferson"
        trigger_prefix = "TRG_G_TS_SpineChecker"
        proset_prefix = "ProSet7_"
        reward_goal = Sch_Goal_Counter
        key_combos = [ Air_SquareL Air_CircleR ]
        goal_description = <sch_goal_trickspot_goal_description>
        view_goals_text = "Spine Transfer over the wall"
        goal_intro_script = Sch_Goal_Trickspot_Intro
        goal_deactivate_script = Sch_Goal_Trickspot_Deactivate
        use_hud_counter
        hud_counter_caption = "Spine transfers"
      }
      AddGoal_Counter {
        ordinal = 16
        record_type = time
        win_wait_time = 40
        CAREER_ONLY
        goal_text = "Gap between floats 10 times"
        view_goals_text = "Gap between floats 10 times"
        number = 10
        geo_prefix = "TRG_Parade"
        start_cam_anim = G_COUNTER_CameraStart
        success_cam_anim = G_COUNTER_CameraSuccess
        pro = "PhotoGuy"
        full_name = "Atiba Jefferson"
        counter_objects = [ { id = TRG_Parade_Float_Guitar }
          { id = TRG_Parade_Float_Sea }
          { id = TRG_Parade_Float_Bowl }
          { id = TRG_Parade_Float_Book }
        ]
        goal_description = sch_counter_desc
        goal_intro_script = Sch_Goal_Counter_Intro
        goal_start_script = Sch_Goal_Counter_start
        goal_deactivate_script = Sch_Goal_Counter_Deactivate
        use_hud_counter
        hud_counter_caption = "Float Gaps"
        unlocked_by_another
      }
      AddGoal_Race {
        ordinal = 8
        record_type = time
        CAREER_ONLY
        goal_text = "Warn the other skaters"
        view_goals_text = "Warn the other skaters"
        goal_flags = [ got_1
          got_2
          got_3
          got_4
        ]
        race_waypoints = [ { id = TRG_G_RACE_RaceNav01 scr = sch_race_waypoint_1 flag = got_1 time = 17 }
          { id = TRG_G_RACE_RaceNav02 scr = sch_race_waypoint_2 flag = got_2 time = 17 }
          { id = TRG_G_RACE_RaceNav03 scr = sch_race_waypoint_3 flag = got_3 time = 22 }
          { id = TRG_G_RACE_RaceNav04 scr = sch_race_waypoint_4 flag = got_4 time = 16 }
        ]
        start_cam_anim = G_RACE_CameraStart
        success_cam_anim = G_RACE_CameraSuccess
        pro = "schskaterat"
        full_name = "Skate Rat"
        goal_description = sch_race_desc
        goal_intro_script = Sch_Goal_Race_Intro
        goal_deactivate_script = Sch_Goal_Race_Deactivate
        goal_outro_script = Sch_Goal_Race_Outro
        use_hud_counter
        hud_counter_caption = "Skaters Warned"
      }
      AddGoal_Gaps2 {
        ordinal = 10
        win_wait_time = 40
        record_type = time
        goal_text = "Grind down the Banners"
        view_goals_text = "Grind down Officer Tom's Banners"
        goal_flags = [ got_1
          got_2
          got_3
          got_4
          got_5
          got_6
          got_7
        ]
        key_combo_text = "\nWallride (\b0)\nWallie (\b3)\nGrind (\b0)"
        start_cam_anim = G_GAP2_CameraStart
        success_cam_anim = G_GAP2_CameraSuccess
        pro = "citizen"
        full_name = "Citizen"
        geo_prefix = "TRGP_G_Gaps2_Banner"
        trigger_prefix = "TRG_G_Gaps2_Guard"
        goal_description = sch_gaps2_desc
        use_hud_counter
        hud_counter_caption = "Banners"
      }
      AddGoal_Horse {
        ordinal = 20
        record_type = score
        CAREER_ONLY
        goal_text = "Beat Bob's 3 best combos"
        view_goals_text = "Beat Bob's 3 best combos"
        current_goal_text = "Beat my combo:"
        start_cam_anim = G_HORSE_CameraStart
        success_cam_anim = G_HORSE_CameraSuccess
        pro = "bob"
        full_name = "Bob Burnquist"
        goal_flags = [ got_1
          got_2
          got_3
        ]
        horse_spots = [ { id = TRG_G_HORSE_Spot01 scr = sch_horse_spot01 flag = got_1 score = sch_horse_score1 time = 30 }
          { id = TRG_G_HORSE_Spot02 scr = sch_horse_spot02 flag = got_2 score = sch_horse_score2 time = 30 }
          { id = TRG_G_HORSE_Spot03 scr = sch_horse_spot03 flag = got_3 score = sch_horse_score3 time = 30 }
        ]
        goal_description = sch_horse_desc
        pro_goal
      }
      AddGoal_Competition {
        ordinal = 13
        CAREER_ONLY
        goal_text = "Medal the High-Combo Competition"
        view_goals_text = "Medal the High-Combo Competition"
        start_cam_anim = G_COMP_CameraStart
        success_cam_anim = G_COMP_CameraSuccess
        pro = "bob"
        full_name = "Bob Burnquist"
        goal_intro_script = Sch_Goal_Comp_Intro
        goal_deactivate_script = Sch_Goal_Comp_Deactivate
        goal_description = sch_comp_desc
        gold = 95
        silver = 85
        bronze = 70
        time = 10
        gold_score = sch_comp_gold
        silver_score = sch_comp_silver
        bronze_score = sch_comp_bronze
        bail = 1
        unlocked_by_another
      }
      AddGoal_Race3 {
        ordinal = 4
        record_type = time
        goal_text = "Race the Inline Skater"
        view_goals_text = "Race the Inline Skater"
        goal_flags = [ got_01
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
        geo_prefix = "G_RACE3_CHECK"
        race_waypoints = [ { id = G_RACE3_CHECKPOINT_01 scr = NullScript flag = got_01 time = 30 }
          { id = G_RACE3_CHECKPOINT_02 scr = NullScript flag = got_02 time = 0 }
          { id = G_RACE3_CHECKPOINT_03 scr = NullScript flag = got_03 time = 0 }
          { id = G_RACE3_CHECKPOINT_04 scr = NullScript flag = got_04 time = 0 }
          { id = G_RACE3_CHECKPOINT_05 scr = NullScript flag = got_05 time = 0 }
          { id = G_RACE3_CHECKPOINT_06 scr = NullScript flag = got_06 time = 0 }
          { id = G_RACE3_CHECKPOINT_07 scr = NullScript flag = got_07 time = 0 }
          { id = G_RACE3_CHECKPOINT_08 scr = NullScript flag = got_08 time = 0 }
          { id = G_RACE3_CHECKPOINT_09 scr = NullScript flag = got_09 time = 0 }
          { id = G_RACE3_CHECKPOINT_10 scr = NullScript flag = got_10 time = 0 }
          { id = G_RACE3_CHECKPOINT_11 scr = NullScript flag = got_11 time = 0 }
          { id = G_RACE3_CHECKPOINT_12 scr = NullScript flag = got_12 time = 0 }
          { id = G_RACE3_CHECKPOINT_13 scr = NullScript flag = got_13 time = 0 }
          { id = G_RACE3_CHECKPOINT_14 scr = NullScript flag = got_14 time = 0 }
          { id = G_RACE3_CHECKPOINT_15 scr = NullScript flag = got_15 time = 0 }
        ]
        pro = "inline"
        full_name = "Local Inline Skater"
        goal_description = sch_race3_desc
        reward_goal = Sch_Goal_Comp
        goal_start_script = Sch_Goal_Race3_Start
        goal_deactivate_script = Sch_Goal_Race3_Deactivate
        goal_outro_script = Sch_Goal_Race3_Outro
      }
      AddGoal_Counter3 {
        record_type = time
        CAREER_ONLY
        pro_specific_challenge
        pro_challenge_title = "Sky High Transfers"
        pro_challenge_tag_line = "Now you put them together..."
        pro_challenge_text = "In 2000 Tony risked it all when he made a roof to roof gap 7 stories high. 8 months later he followed that up with a McTwist over an 18 foot gap and an incredible 24 foot frontside air."
        pro_challenge_pro_name = "Tony"
        required_tricks = [ Trick_BarrelRoll Trick_Indy900 Trick_360VarialMcTwist ]
        goal_text = "\t1\n\k1\n\t2\n\k2\n\t3\n\k3"
        number = 9
        time = 240
        start_cam_anim = G_COUNTER3_CameraStart
        success_cam_anim = G_COUNTER3_CameraStart
        key_combos = [
          Air_CircleU
          Air_CircleD
          Air_CircleR
          Air_CircleDL
          Air_CircleUL
          Air_CircleUR
        ]
        pro = "photoguy"
        full_name = "Atiba Jefferson"
        goal_description = sch_counter3_desc
        goal_intro_script = Sch_Goal_Counter3_Intro
        goal_deactivate_script = Sch_Goal_Counter3_Deactivate
        goal_outro_script = Sch_Goal_Counter3_outro
        goal_success_script = Sch_Goal_Counter3_success
        view_goals_text = "Tony's Pro Specific Challenge"
      }
      AddGoal_Race2 {
        record_type = time
        CAREER_ONLY
        pro_specific_challenge
        pro_challenge_title = "A Day in the Life"
        pro_challenge_tag_line = "Time to get moving..."
        pro_challenge_text = "When pro skaters shoot photos for a feature story, it can often take weeks or even months. In 1995, Jamie Thomas decided to shoot his pro spotlight in a single day. In all, Jamie hit 10 spots in just 12 hours."
        pro_challenge_pro_name = "Jamie"
        goal_text = "Jamie's Pro Specific Challenge"
        key_combo_text = "\b0 + \b4"
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
        race_waypoints = [ { id = TRG_G_RACE2_RaceNav01 scr = sch_race2_waypoint_1 flag = got_1 time = 20 }
          { id = TRG_G_RACE2_RaceNav02 scr = sch_race2_waypoint_2 flag = got_2 time = 15 }
          { id = TRG_G_RACE2_RaceNav03 scr = sch_race2_waypoint_3 flag = got_3 time = 15 }
          { id = TRG_G_RACE2_RaceNav04 scr = sch_race2_waypoint_4 flag = got_4 time = 15 }
          { id = TRG_G_RACE2_RaceNav05 scr = sch_race2_waypoint_5 flag = got_5 time = 10 }
          { id = TRG_G_RACE2_RaceNav06 scr = sch_race2_waypoint_6 flag = got_6 time = 10 }
          { id = TRG_G_RACE2_RaceNav07 scr = sch_race2_waypoint_7 flag = got_7 time = 10 }
          { id = TRG_G_RACE2_RaceNav08 scr = sch_race2_waypoint_8 flag = got_8 time = 5 }
          { id = TRG_G_RACE2_RaceNav09 scr = sch_race2_waypoint_9 flag = got_9 time = 5 }
          { id = TRG_G_RACE2_RaceNav10 scr = sch_race2_waypoint_10 flag = got_10 time = 5 }
        ]
        required_tricks = [ Trick_VarialKickflip Trick_FSShoveIt Trick_Kickflip Trick_Benihana ]
        key_combos = [ Air_CircleU ]
        start_cam_anim = G_RACE2_CameraStart
        success_cam_anim = G_RACE2_CameraSuccess
        pro = "Photoguy"
        full_name = "Atiba Jefferson"
        goal_description = sch_race2_desc
        view_goals_text = "Jamie's Pro Specific Challenge"
        goal_intro_script = Sch_Goal_Race2_Intro
        goal_deactivate_script = Sch_Goal_Race2_Deactivate
        goal_outro_script = Sch_Goal_Race2_Outro
        goal_success_script = Sch_Goal_Race2_success
      }
    ENDIF
  ENDIF
  IF not InSplitScreenGame
    IF not GameModeEquals is_singlesession
      IF not InNetGame
        AddMinigame_Timer {
          CAREER_ONLY
          time = 40
          score = 5000
          score_time = 10
          timer_description = "seconds"
          deactivate_script = sch_GarbageDay_end
          activate_script = sch_garbageday_activate
        }
        Sch_AddMinigame_Pong
        Sch_AddMinigame_Wires
        Printf "adding minigames"
        AddMinigame_Fountain {
          create_geometry = [ TRGP_MG_CounterKiller04
            TRGP_MG_CounterTrigger03
          ]
        }
        AddMinigame_Fountain2 {
          trigger_obj_id = TRG_MG_JockCounter
        }
        Printf "adding trickspot minigame"
        AddMinigame_trickspot
        AddMinigame_TimedCombo {
          trigger_obj_id = TRG_MG_RiverCombo
          create_geometry = [ TRGP_River_Entrance
            TRGP_River_Exit
          ]
        }
      ENDIF
    ENDIF
  ENDIF
ENDSCRIPT

SCRIPT Sch_Goal_Special_outro
  skater:KillSkater node = TRG_G_SPECIAL_RestartNode
ENDSCRIPT

SCRIPT Sch_CheckForRaceKill
  IF GoalManager_GoalExists name = SCH_goal_race3
    IF GoalManager_GoalIsActive name = SCH_goal_race3
      GoalManager_LoseGoal name = SCH_goal_race3
    ENDIF
  ENDIF
ENDSCRIPT

SCRIPT sch_race_checkpoint race_flag = got_01 prev_flag = got_01
  GoalManager_SetGoalFlag name = SCH_goal_race3 <race_flag> 1
  GoalManager_NextRaceWaypoint name = SCH_goal_race3
  IF not GoalManager_GoalFlagSet name = SCH_goal_race3 flag = <prev_flag>
    IF GoalManager_GoalIsActive name = SCH_goal_race3
      create_panel_message id = goal_complete_line2 text = "Missed a Checkpoint" style = panel_message_goalcompleteline2
      GoalManager_LoseGoal name = SCH_goal_race3
    ENDIF
  ENDIF
ENDSCRIPT

SCRIPT SCH_RACE3_BailCheck
  Obj_SetException Ex = SkaterBailed scr = SCH_RACE3_BailCheckBailed params = { <...> }
ENDSCRIPT

SCRIPT SCH_RACE3_BailCheckBailed
  IF GoalManager_GoalIsActive name = SCH_goal_race3
    DisassociateFromObject
    GoalManager_LoseGoal name = SCH_goal_race3
  ENDIF
ENDSCRIPT

SCRIPT Sch_Goal_Race3_Start
  MakeSkaterGoto ShoppingCart_Start params = { racemode = luge CarMode turn_friction = 0 startspeed = 20 accelerate_to = 800 }
ENDSCRIPT

SCRIPT Sch_Goal_Race3_Deactivate
  create_panel_message id = goal_complete_line2 text = " " style = panel_message_goalcompleteline2
  MakeSkaterGoto SkaterInit
ENDSCRIPT

SCRIPT Sch_Goal_Race3_Outro
  IF not InNetGame
    MakeSkaterGoto LugeBrake
  ENDIF
ENDSCRIPT

SCRIPT Sch_Counter2_PinkElephant
  Obj_SetException Ex = SkaterInRadius scr = Sch_Counter2_PinkElephantGot
  Obj_SetInnerRadius 10
  Obj_RotY speed = random( @50 @-150 @200 @-250 ) 
  Obj_Hover Amp = random( @5 @10 @15  ) Freq = random( @0.5 @1 @2 ) 
ENDSCRIPT

SCRIPT Sch_Counter2_PinkElephantGot
  GoalManager_GotCounterObject name = Sch_Goal_Counter2
  PlaySound ElephantBlast pitch = random( @125 @110 @105 ) 
  Die
ENDSCRIPT

SCRIPT Sch_Float_FrontToBack1
  EndGap GapID = Sch_Float_FrontToBack1 text = "Float Gap!!!" score = 200 trickscript = Sch_Float_FrontToBack
  StartGap GapID = Sch_Float_FrontToBack2 flags = [ Cancel_Ground pure_air ] trickscript = Sch_Float_FrontToBack
  Printf "Sch_Float_FrontToBack1"
ENDSCRIPT

SCRIPT Sch_Float_FrontToBack2
  EndGap GapID = Sch_Float_FrontToBack2 text = "Float Gap!!!" score = 200
  StartGap GapID = Sch_Float_FrontToBack1 flags = [ Cancel_Ground pure_air ] trickscript = Sch_Float_FrontToBack
  Printf "Sch_Float_FrontToBack2"
ENDSCRIPT

SCRIPT Sch_Float_Odd
  EndGap GapID = Sch_Float_Even text = "Float Gap!!!" score = 200
  StartGap GapID = Sch_Float_Odd flags = [ Cancel_Ground pure_air ] trickscript = Sch_GotFloatGap
  Printf "Sch_Float_Odd"
ENDSCRIPT

SCRIPT Sch_Float_Even
  EndGap GapID = Sch_Float_Odd text = "Float Gap!!!" score = 200
  StartGap GapID = Sch_Float_Even flags = [ Cancel_Ground pure_air ] trickscript = Sch_GotFloatGap
  Printf "Sch_Float_Even"
ENDSCRIPT

SCRIPT Sch_GotFloatGap
  GoalManager_GotCounterObject name = Sch_Goal_Counter
  PlayStream random( @stadiumcheers @stadiumcheers2  ) vol = random( @50 @60 @70  ) dropoff = 400
ENDSCRIPT

SCRIPT Sch_Goal_Comp_Intro
  Sch_GenPedsGone
  Sch_TrafficGone
  Sch_ParkedCarsGone
  Sch_ClearGarbageDay
  Sch_ClearStaticGarbageTruck
  StopStream
  Kill prefix = "TRG_Stadium_Sounds"
  Wait 1 frame
  Create prefix = "TRG_Stadium_Sounds"
ENDSCRIPT

SCRIPT Sch_Goal_Comp_Deactivate
  Sch_GenPedsStart
  Sch_ParkedCarsReturn
  Sch_ReturnStaticGarbageTruck
  Kill prefix = "MLS_Garbage_Truck_Container0"
  Sch_TrafficStart
  Create prefix = "MLS_Garbage_Truck_ContainerTrigg"
ENDSCRIPT
SCH_FLOAT_START_RUN = 1

SCRIPT Sch_Goal_Counter_Intro
  Sch_GenPedsGone
  Sch_ClearGarbageDay
  Wait 1 frame
  Sch_TrafficGone
  Sch_ParkedCarsGone
  Kill name = TRG_AI_TennisBall
  Kill prefix = "TRG_Ped_Playa"
ENDSCRIPT

SCRIPT Sch_Goal_Counter_start
  SpawnScript Sch_ParadeMusic id = parademusic
  Wait 5 frames
  Sch_TrafficGone
  SendException SCH_FLOAT_START_RUN prefix = "TRG_Parade_Float_"
ENDSCRIPT

SCRIPT Sch_Goal_Counter_Deactivate
  Sch_GenPedsStart
  Kill prefix = "MLS_Garbage_Truck_Container0"
  Sch_TrafficStart
  Create prefix = "MLS_Garbage_Truck_ContainerTrigg"
  Sch_ParkedCarsReturn
  KillSpawnedScript id = parademusic
  Create prefix = "TRG_Ped_Playa"
ENDSCRIPT

SCRIPT Sch_ParadeMusic
  PauseMusic 1
  Wait 1 seconds
  PauseMusic 1
  StopStream
  Printf "music start"
  Wait 1 frame
  PauseMusic 1
ENDSCRIPT
OBJFLAG_G_TS_GOT1 = 1
OBJFLAG_G_TS_GOT2 = 2
OBJFLAG_G_TS_GOT3 = 3

SCRIPT Sch_TS_SpineChecker
  BEGIN
    IF Obj_FlagSet OBJFLAG_G_TS_GOT1
      sch_goal_trickspot_got_Gap1
      BREAK
    ENDIF
    Wait 1 frame
  REPEAT
  Obj_ClearFlag OBJFLAG_G_TS_GOT2
  BEGIN
    IF Obj_FlagSet OBJFLAG_G_TS_GOT2
      sch_goal_trickspot_got_Gap2
      BREAK
    ENDIF
    Wait 1 frame
  REPEAT
  Obj_ClearFlag OBJFLAG_G_TS_GOT3
  BEGIN
    IF Obj_FlagSet OBJFLAG_G_TS_GOT3
      sch_goal_trickspot_got_Gap3
      BREAK
    ENDIF
    Wait 1 frame
  REPEAT
ENDSCRIPT

SCRIPT Sch_TrickspotSpine01EtoW
  StartGap GapID = Spine01EtoW1 flags = [ Cancel_Ground ] tricktext = "Spine Transfer" trickscript = sch_goal_trickspot_got_part1
  StartGap GapID = Spine01EtoW2 flags = [ Cancel_Ground ] KeyCombo = Air_SquareL trickscript = sch_goal_trickspot_got_part2
  StartGap GapID = Spine01EtoW3 flags = [ Cancel_Ground ] KeyCombo = Air_CircleR trickscript = sch_goal_trickspot_got_part3
  EndGap GapID = Spine01WtoE1
  EndGap GapID = Spine01WtoE2
  EndGap GapID = Spine01WtoE3
ENDSCRIPT

SCRIPT Sch_TrickspotSpine01WtoE
  StartGap GapID = Spine01WtoE1 flags = [ Cancel_Ground ] tricktext = "Spine Transfer" trickscript = sch_goal_trickspot_got_part1
  StartGap GapID = Spine01WtoE2 flags = [ Cancel_Ground ] KeyCombo = Air_SquareL trickscript = sch_goal_trickspot_got_part2
  StartGap GapID = Spine01WtoE3 flags = [ Cancel_Ground ] KeyCombo = Air_CircleR trickscript = sch_goal_trickspot_got_part3
  EndGap GapID = Spine01EtoW1
  EndGap GapID = Spine01EtoW2
  EndGap GapID = Spine01EtoW3
ENDSCRIPT

SCRIPT Sch_TrickspotSpine02EtoW
ENDSCRIPT

SCRIPT Sch_TrickspotSpine02WtoE
ENDSCRIPT

SCRIPT sch_goal_trickspot_got_part1
  IF GoalManager_GoalIsActive name = Sch_Goal_Trickspot
    SendFlag prefix = "TRG_G_TS_SpineChecker" OBJFLAG_G_TS_GOT1
  ENDIF
ENDSCRIPT

SCRIPT sch_goal_trickspot_got_part2
  IF GoalManager_GoalIsActive name = Sch_Goal_Trickspot
    SendFlag prefix = "TRG_G_TS_SpineChecker" OBJFLAG_G_TS_GOT2
  ENDIF
ENDSCRIPT

SCRIPT sch_goal_trickspot_got_part3
  IF GoalManager_GoalIsActive name = Sch_Goal_Trickspot
    SendFlag prefix = "TRG_G_TS_SpineChecker" OBJFLAG_G_TS_GOT3
  ENDIF
ENDSCRIPT

SCRIPT sch_goal_trickspot_got_Gap1
  IF GoalManager_SetGoalFlag name = Sch_Goal_Trickspot got_1 1
  ENDIF
  GoalManager_ReplaceTrickText name = Sch_Goal_Trickspot text = "Now \t1 while Spine Transferring the wall"
  create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
  GoalManager_ReplaceTrickText name = Sch_Goal_Trickspot text = "\n\t1\n\k1"
  SpawnScript goal_wait_and_show_key_combo_text params = { text = <tricktext> }
ENDSCRIPT

SCRIPT sch_goal_trickspot_got_Gap2
  Printf "got_Gap2"
  IF GoalManager_SetGoalFlag name = Sch_Goal_Trickspot got_2 1
  ENDIF
  GoalManager_ReplaceTrickText name = Sch_Goal_Trickspot text = "Now \t2 while Spine Transferring the wall"
  create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
  GoalManager_ReplaceTrickText name = Sch_Goal_Trickspot text = "\n\t2\n\k2"
  SpawnScript goal_wait_and_show_key_combo_text params = { text = <tricktext> }
ENDSCRIPT

SCRIPT sch_goal_trickspot_got_Gap3
  IF GoalManager_SetGoalFlag name = Sch_Goal_Trickspot got_3 1
  ENDIF
ENDSCRIPT

SCRIPT Sch_Goal_Trickspot_Intro
  Sch_TrafficGone
  Sch_ParkedCarsGone
  Sch_ClearGarbageDay
ENDSCRIPT

SCRIPT Sch_Goal_Trickspot_Deactivate
  Sch_TrafficStart
  Sch_ParkedCarsReturn
ENDSCRIPT

SCRIPT Sch_SendFlagToFratGuy fratboy = TRG_G_COLL_FratBoy01
  SendFlag name = TRG_G_COLL_FratBoy01 OBJFLAG_FRATBOY_LOSTBEER
ENDSCRIPT

SCRIPT goal_sch_collect_keg1
  SendFlag name = TRG_G_COLL_FratBoy01 OBJFLAG_FRATBOY_LOSTBEER
  GotoPreserveParams goal_sch_collect_keg
ENDSCRIPT

SCRIPT goal_sch_collect_keg2
  SendFlag name = TRG_G_COLL_FratBoy02 OBJFLAG_FRATBOY_LOSTBEER
  GotoPreserveParams goal_sch_collect_keg
ENDSCRIPT

SCRIPT goal_sch_collect_keg3
  SendFlag name = TRG_G_COLL_FratBoy03 OBJFLAG_FRATBOY_LOSTBEER
  GotoPreserveParams goal_sch_collect_keg
ENDSCRIPT

SCRIPT goal_sch_collect_keg4
  SendFlag name = TRG_G_COLL_FratBoy04 OBJFLAG_FRATBOY_LOSTBEER
  GotoPreserveParams goal_sch_collect_keg
ENDSCRIPT

SCRIPT goal_sch_collect_keg5
  SendFlag name = TRG_G_COLL_FratBoy05 OBJFLAG_FRATBOY_LOSTBEER
  GotoPreserveParams goal_sch_collect_keg
ENDSCRIPT

SCRIPT Sch_GoalFratGuy
  AddGoalArrowAlc
  BEGIN
    random( @
    Obj_PlayAnim Anim = Ped_Frat_DrunkenIdle
    @Obj_PlayAnim Anim = Ped_Frat_WooHooo
    @Obj_PlayAnim Anim = Ped_Frat_ThrowShaka
     ) 
    BEGIN
      IF Obj_AnimComplete
        BREAK
      ENDIF
      IF Obj_FlagSet OBJFLAG_FRATBOY_LOSTBEER
        Goto Sch_GoalFratGuyFall
      ENDIF
      Obj_LookAtObject type = skater time = 0.3
      Wait 1 frames
    REPEAT
  REPEAT
ENDSCRIPT

SCRIPT Sch_GoalFratGuyFall
  IF not GoalManager_HasWonGoal name = sch_goal_collect
    Printf "fratboy hit"
  ENDIF
  Obj_MoveToLink speed = 10
  Obj_PlayAnim Anim = Ped_M_FalldownA
  Wait 5 frames
  PlayStream random( @
  fratboy_sch_goal_collect_01
  @fratboy_sch_goal_collect_02
  @fratboy_sch_goal_collect_03
  @fratboy_sch_goal_collect_04
  @fratboy_sch_goal_collect_05
  @fratboy_sch_goal_collect_06
  @fratboy_sch_goal_collect_07
  @fratboy_sch_goal_collect_08
  @fratboy_sch_goal_collect_09
   ) vol = 200
  Obj_WaitAnimFinished
  Die
ENDSCRIPT

SCRIPT goal_sch_collect_keg
  GoalManager_SetGoalFlag name = <goal_id> <flag> 1
  GoalManager_GetGoalParams name = <goal_id>
  IF not GoalManager_AllFlagsSet name = <goal_id>
    FormatText TextName = collect_text "%c of %n %t" c = <num_flags_set> t = <collect_type> n = <num_flags>
    create_panel_message text = <collect_text> style = goal_collect_text
  ENDIF
  Printf "hit the keg!"
  Obj_ClearExceptions
  PlaySound HitMetalCan_11
  PlaySound GapSound vol = 100
  Obj_RotX speed = 500
  Obj_MoveToRelPos (0, 30, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, 20, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, 10, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, 5, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, 2, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, -2, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, -5, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, -10, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, -20, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, -30, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, 10, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, 5, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, 2, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, -2, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, -5, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, -10, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, 5, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, 2, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, -2, 0) time = 0.1
  Obj_WaitMove
  Obj_MoveToRelPos (0, -5, 0) time = 0.1
  Obj_WaitMove
  Die
ENDSCRIPT

SCRIPT Sch_Goal_Collect_Intro
  Printf "creating frat boys and kegs"
  StopStream
  Kill prefix = "TRG_Stadium_Sounds"
  Kill prefix = "BO_FratKeg"
  Kill prefix = "TRG_KegBO_Killer"
  Create prefix = "TRG_Stadium_Sounds"
  Create prefix = "TRG_G_COLL_FratBoy"
  Create prefix = "GO_G_COLLECT_FratKeg"
ENDSCRIPT

SCRIPT Sch_Goal_Collect_Deactivate
  Printf "deactivating (killing) frat boys and kegs"
  KillTheArrow id = TRG_G_COLL_FratBoy01
  KillTheArrow id = TRG_G_COLL_FratBoy02
  KillTheArrow id = TRG_G_COLL_FratBoy03
  KillTheArrow id = TRG_G_COLL_FratBoy04
  KillTheArrow id = TRG_G_COLL_FratBoy05
  Wait 1 frame
  Kill prefix = "TRG_G_COLL_FratBoy"
  Kill prefix = "GO_G_COLLECT_FratKeg"
  Create prefix = "BO_FratKeg"
  Create prefix = "TRG_KegBO_Killer"
ENDSCRIPT

SCRIPT Sch_Goal_Collect_Outro
  skater:KillSkater node = TRG_G_COLLECT_RestartNode
  SpawnScript Sch_Goal_Collect_OutroActual
  StopStream
ENDSCRIPT

SCRIPT Sch_Goal_Collect_OutroActual
  Kill prefix = "BO_FratKeg"
  Kill prefix = "G_Collect_Trashcan"
  Create prefix = "TRG_G_Coll_Success"
ENDSCRIPT

SCRIPT Sch_Goal_Collect_success
  Kill prefix = "TRG_G_Coll_Success"
  Create prefix = "G_Collect_Trashcan"
  Sch_CollectJockSpawner
ENDSCRIPT

SCRIPT Sch_CollectJockSpawner
  Wait 2 seconds
  IF GoalManager_HasWonGoal name = sch_goal_collect
    Printf "------------ creating the jocks"
    Kill prefix = "TRG_Ped_Jock"
    Create prefix = "TRG_Ped_Jock"
  ENDIF
ENDSCRIPT

SCRIPT Sch_KegBO_Killer
  IF InNetGame
    IF Inside
      Printf "creating kegs"
      Kill prefix = "BO_FratKeg"
      Create prefix = "BO_FratKeg"
    ELSE
      Printf "killing kegs"
      Kill prefix = "BO_FratKeg"
    ENDIF
  ELSE
    IF Inside
      IF not GoalManager_GoalIsActive name = sch_goal_collect
        Printf "creating kegs"
        Kill prefix = "BO_FratKeg"
        Create prefix = "BO_FratKeg"
      ENDIF
    ELSE
      Printf "killing kegs"
      Kill prefix = "BO_FratKeg"
    ENDIF
  ENDIF
ENDSCRIPT

SCRIPT sch_race_waypoint_1
  create_panel_block id = current_goal text = "He's heading toward the Philosophy building" style = panel_message_goal
  Kill prefix = "TRG_G_RACE_SecOfficer"
  Kill prefix = "TRG_G_RACE_SecOfficer01"
  Wait 1 frame
  Create name = TRG_G_RACE_SecOfficer02
  Create name = TRG_G_RACE_Friend01
  PlayStream security_sch_goal_nav1 volume = 175
ENDSCRIPT

SCRIPT sch_race_waypoint_2
  create_panel_block id = current_goal text = "Now he's heading toward security" style = panel_message_goal
  Create name = TRG_G_RACE_Friend02
  PlayStream security_sch_goal_nav2 volume = 175
ENDSCRIPT

SCRIPT sch_race_waypoint_3
  create_panel_block id = current_goal text = "Beat him to the coliseum!" style = panel_message_goal
  Create name = TRG_G_RACE_Friend03
  PlayStream security_sch_goal_nav3 volume = 175
ENDSCRIPT

SCRIPT sch_race_waypoint_4
  create_panel_block id = current_goal text = "Last one in front of the parking garage" style = panel_message_goal
  Create name = TRG_G_RACE_Friend04
  PlayStream security_sch_goal_nav4 volume = 175
ENDSCRIPT

SCRIPT Sch_Goal_Race_Intro
  Wait 1 frame
  Sch_ClearGarbageDay
  Create name = TRG_G_RACE_SecOfficer01
  Create prefix = "TRG_G_RACE_RaceNav"
ENDSCRIPT

SCRIPT Sch_Goal_Race_Deactivate
  Kill prefix = "TRG_G_RACE_Friend"
  Kill prefix = "TRG_G_RACE_SecOfficer"
  Kill prefix = "TRG_G_RACE_RaceNav"
ENDSCRIPT

SCRIPT Sch_Goal_Race_Outro
  skater:KillSkater node = TRG_G_RACE_RestartNode
ENDSCRIPT

SCRIPT Sch_Race_Friend
  AddGoalArrow
  Obj_SetInnerRadius 20
  Obj_SetException Ex = SkaterInRadius scr = Sch_Race_Friend_Alerted params = { <...> }
ENDSCRIPT

SCRIPT Sch_Race_Friend_Alerted
  Obj_ClearExceptions
  PlaySound GoalDone
  GoalManager_SetGoalFlag name = sch_goal_race <race_flag> 1
  GoalManager_NextRaceWaypoint name = sch_goal_race
  BEGIN
    Obj_PlayAnim Anim = random( @Ped_M_Clap @Ped_M_Cheering ) 
    Obj_WaitAnimFinished
  REPEAT
ENDSCRIPT

SCRIPT Sch_SecurityGuard_Listening
  BEGIN
    Obj_PlayAnim Anim = random( @Ped_M_Clap @Ped_M_Cheering ) 
    Obj_WaitAnimFinished
  REPEAT
ENDSCRIPT

SCRIPT Sch_SecurityGuard_RunToNav
  AddGoalArrow
  Obj_SetPathAcceleration 20 mphps
  Obj_SetPathDeceleration 20 mphps
  Obj_SetPathVelocity 30 mph
  Obj_PlayAnim Anim = Ped_BP_RunFromIdle
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_FollowPathLinked
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_BP_Run Cycle
  Obj_PlaySound sch_security_breathing_11
  Obj_SpawnScript Sch_SecurityGuard_VO
  Obj_WaitMove
  Die
ENDSCRIPT

SCRIPT Sch_SecurityGuard_VO
  BEGIN
    Obj_PlayStream randomnorepeat( @
    security_midgoal01
    @security_midgoal02
     ) vol = 200
    Wait random( @3 @5 @10  ) seconds
  REPEAT
ENDSCRIPT

SCRIPT Sch_SpinalGap
ENDSCRIPT

SCRIPT Sch_Gap_MoE
ENDSCRIPT

SCRIPT Sch_SpinalGap3
ENDSCRIPT

SCRIPT Sch_SpinalGap4
ENDSCRIPT

SCRIPT sch_Goal_gaps_got_1
  IF GoalManager_GoalExists name = sch_goal_gaps
    IF GoalManager_GoalIsActive name = sch_goal_gaps
      IF GoalManager_SetGoalFlag name = sch_goal_gaps got_1 1
        Printf "got gap 1 - really"
      ENDIF
    ENDIF
  ENDIF
ENDSCRIPT

SCRIPT sch_Goal_gaps_got_2
  IF GoalManager_GoalExists name = sch_goal_gaps
    IF GoalManager_GoalIsActive name = sch_goal_gaps
      IF GoalManager_SetGoalFlag name = sch_goal_gaps got_2 1
        Printf "got gap 2 - really"
      ENDIF
    ENDIF
  ENDIF
ENDSCRIPT

SCRIPT sch_Goal_gaps_got_3
  IF GoalManager_GoalExists name = sch_goal_gaps
    IF GoalManager_GoalIsActive name = sch_goal_gaps
      IF GoalManager_SetGoalFlag name = sch_goal_gaps got_3 1
        Printf "got gap 3 - really"
      ENDIF
    ENDIF
  ENDIF
ENDSCRIPT

SCRIPT sch_Goal_gaps_got_4
  IF GoalManager_GoalExists name = sch_goal_gaps
    IF GoalManager_GoalIsActive name = sch_goal_gaps
      IF GoalManager_SetGoalFlag name = sch_goal_gaps got_4 1
        Printf "got gap 4 - really"
      ENDIF
    ENDIF
  ENDIF
ENDSCRIPT

SCRIPT Sch_Gaps2_Guard
  Obj_PlayAnim Anim = Ped_FB_RunningInPlace Cycle
ENDSCRIPT

SCRIPT Sch_Gap2_TriggerPoly Flagscript = sch_Goal_gaps2_got_1
  Printf "banner gap"
   <Flagscript>
  StartGap GapID = Sch_BannerGap1
  Wait 1 frame
  EndGap GapID = Sch_BannerGap1 text = "Banner Gap!" score = 50
  ShatterAndDie name = <FlagGeo>
  Kill name = <FlagGeo>
  PlayStream random( @security_banner01 @security_banner02 @security_banner03 @security_banner04 ) 
ENDSCRIPT

SCRIPT sch_Goal_gaps2_got_1
  IF GoalManager_SetGoalFlag name = sch_goal_gaps2 got_1 1
    Printf "got gap 1"
  ENDIF
ENDSCRIPT

SCRIPT sch_Goal_gaps2_got_2
  IF GoalManager_SetGoalFlag name = sch_goal_gaps2 got_2 1
    Printf "got gap 2"
  ENDIF
ENDSCRIPT

SCRIPT sch_Goal_gaps2_got_3
  IF GoalManager_SetGoalFlag name = sch_goal_gaps2 got_3 1
    Printf "got gap 3"
  ENDIF
ENDSCRIPT

SCRIPT sch_Goal_gaps2_got_4
  IF GoalManager_SetGoalFlag name = sch_goal_gaps2 got_4 1
    Printf "got gap 4"
  ENDIF
ENDSCRIPT

SCRIPT sch_Goal_gaps2_got_5
  IF GoalManager_SetGoalFlag name = sch_goal_gaps2 got_5 1
    Printf "got gap 5"
  ENDIF
ENDSCRIPT

SCRIPT sch_Goal_gaps2_got_6
  IF GoalManager_SetGoalFlag name = sch_goal_gaps2 got_6 1
    Printf "got gap 6"
  ENDIF
ENDSCRIPT

SCRIPT sch_Goal_gaps2_got_7
  IF GoalManager_SetGoalFlag name = sch_goal_gaps2 got_7 1
    Printf "got gap 7"
  ENDIF
ENDSCRIPT
SCH_VIPER_START_RUN = 1

SCRIPT Sch_Goal_Gap3_Intro
  Sch_GenPedsGone
  Sch_TrafficGone
  Wait 1 frame
  Create prefix = "TRG_GAP3_Thief"
  Create prefix = "TRG_Gap3_Car_Viper"
ENDSCRIPT

SCRIPT Sch_Goal_Gap3_Start
  Printf "intro killing thieves"
  Kill prefix = "TRG_GAP3_Thief"
  SendException SCH_VIPER_START_RUN name = TRG_Gap3_Car_Viper01
ENDSCRIPT

SCRIPT Sch_Goal_Gap3_Deactivate
  GoalManager_GetGoalParams name = sch_goal_gaps3
  IF not GotParam just_won_goal
    StopStream
  ENDIF
  Kill prefix = "TRG_GAP3_Thief"
  MakeSkaterGoto SkaterInit
  Wait 1 frame
  Kill prefix = "TRG_Gap3_Car_Viper"
  Sch_GenPedsStart
  Sch_TrafficStart
  PlaySkaterCamAnim skater = 0 stop
ENDSCRIPT

SCRIPT Sch_Goal_Gap3_Outro
  SpawnSkaterScript MoveToGAP3NODE
  Create prefix = "TRG_Gap3_EndMovie"
ENDSCRIPT

SCRIPT Sch_Goal_Gap3_Success
  Kill prefix = "TRG_Gap3_EndMovie"
ENDSCRIPT

SCRIPT MoveToGAP3NODE
  Obj_MoveToNode name = TRG_G_GAP3_RestartNode orient
ENDSCRIPT

SCRIPT Sch_Car_Viper_Stolen
  Obj_SetException Ex = SCH_VIPER_START_RUN scr = Sch_Car_Viper_Stolen_Start
ENDSCRIPT

SCRIPT Sch_Car_Viper_Stolen_Start
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetGroundOffset 0.1
  Obj_SetPathTurnDist 30
  Obj_SetPathAcceleration 40 mphps
  Obj_SetPathDeceleration 40 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlaySound CarLoop
  PlayStream helopilot_sch_gap3
  BEGIN
    IF SkaterCamAnimFinished skater = 0
      BREAK
    ENDIF
    Wait 1 frame
  REPEAT
  Obj_FollowPathLinked
  Obj_SetPathVelocity 2 mph
  Wait 3 seconds
  Sch_Gaps3_CheckForSkitch
  PlaySound LA_skid_11 vol = 200 pitch = 140
  Obj_SetPathVelocity 55 mph
  Wait 1 seconds
  Sch_Gaps3_CheckForSkitch
  Wait 1 seconds
  Sch_Gaps3_CheckForSkitch
  Wait 1 seconds
  Sch_Gaps3_CheckForSkitch
  Wait 1 seconds
  Sch_Gaps3_CheckForSkitch
  PlaySound LA_skid_11 vol = 200 pitch = 140
  Obj_SetPathVelocity 75 mph
  PlayStream randomnorepeat( @
  carthief_sch_random01
  @carthief_sch_random02
  @carthief_sch_random03
  @carthief_sch_random04
  @carthief_sch_random05
  @carthief_sch_random06
   ) 
  Wait 1 seconds
  Sch_Gaps3_CheckForSkitch
  Wait 1 seconds
  Sch_Gaps3_CheckForSkitch
  Wait 1 seconds
  Sch_Gaps3_CheckForSkitch
  Wait 1 seconds
  Sch_Gaps3_CheckForSkitch
  Wait 1 seconds
  Sch_Gaps3_CheckForSkitch
  BEGIN
    Sch_Gaps3_CheckForSkitch
    Wait 10 frames
    GetRandomValue name = theifline integer a = 1 b = 9
    IF ( <theifline> = 9 )
      PlayStream random( @
      carthief_sch_random01
      @carthief_sch_random02
      @carthief_sch_random03
      @carthief_sch_random04
      @carthief_sch_random05
      @carthief_sch_random06 ) 
    ENDIF
  REPEAT
  Obj_WaitMove
  Printf "car at end of path"
  Wait 1 frame
  PlaySkaterCamAnim skater = 0 stop
  Printf "car killing self"
  Wait 1 frame
  Die
ENDSCRIPT

SCRIPT Sch_Gaps3_CheckForSkitch
  IF not skater:Skitching
    MakeSkaterGoto SkaterInit
    IF GoalManager_GoalIsActive name = sch_goal_gaps3
      SpawnScript Sch_Gaps3_LoseGoal
    ENDIF
  ENDIF
ENDSCRIPT

SCRIPT Sch_Gaps3_LoseGoal
  GoalManager_LoseGoal name = sch_goal_gaps3
ENDSCRIPT

SCRIPT Sch_ChaseTurnRight
  Printf "Turning Right"
  Obj_PathHeading Off
  Obj_Rotate relative = (0, 0, 120) time = 0.5 FLAG_MAX_COORDS
  Obj_WaitRotate
  Obj_Rotate relative = (0, 0, -40) time = 0.2 FLAG_MAX_COORDS
  Obj_WaitRotate
  Obj_Rotate relative = (0, 0, 15) time = 0.1 FLAG_MAX_COORDS
  Obj_WaitRotate
  Obj_Rotate relative = (0, 0, -5) time = 0.1 FLAG_MAX_COORDS
  Obj_WaitRotate
  Obj_PathHeading On
ENDSCRIPT

SCRIPT Sch_Chase180Left
  Printf "Pulling 180"
  Obj_PathHeading Off
  Obj_Rotate relative = (0, 0, 100) time = 0.3 FLAG_MAX_COORDS
  Obj_WaitRotate
  Obj_Rotate relative = (0, 0, 100) time = 0.4 FLAG_MAX_COORDS
  Obj_WaitRotate
  Obj_Rotate relative = (0, 0, -40) time = 0.2 FLAG_MAX_COORDS
  Obj_WaitRotate
  Obj_Rotate relative = (0, 0, 15) time = 0.1 FLAG_MAX_COORDS
  Obj_WaitRotate
  Obj_Rotate relative = (0, 0, -5) time = 0.1 FLAG_MAX_COORDS
  Obj_WaitRotate
  Obj_PathHeading On
ENDSCRIPT

SCRIPT Sch_ViperHeloCam
  Printf "spawning movie player"
  SpawnSkaterScript Sch_ViperHeloCamSkater
ENDSCRIPT

SCRIPT Sch_ViperHeloCamSkater
  Printf "playing viper movie"
  TRG_Gap3_Car_Viper01:Obj_GetId
  PlaySkaterCamAnim skater = 0 name = G_ViperFollow allow_pause = 1
ENDSCRIPT

SCRIPT Sch_ChaseDoneCheck
  Printf "checking to see if the skater is still skitching"
  IF skater:Skitching
    Printf "yep still skitching"
    Wait 1 frame
    SpawnSkaterScript Sch_GAP3_CompleteGoalGap
  ENDIF
ENDSCRIPT

SCRIPT Sch_GAP3_CompleteGoalGap
  IF GoalManager_SetGoalFlag name = sch_goal_gaps3 got_1 1
    Printf "got gap 1"
  ENDIF
ENDSCRIPT

SCRIPT Sch_Gap3_Endmovie
  Obj_SetPathAcceleration 20 mphps
  Obj_SetPathDeceleration 20 mphps
  Obj_SetPathVelocity 30 mph
  Obj_PlayAnim Anim = Ped_M_RunFromIdle
  Obj_FollowPathLinked
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_M_Run Cycle speed = 2
ENDSCRIPT

SCRIPT sch_horse_spot01
  create_panel_block id = current_horse_spot text = sch_horse_text1 style = panel_message_new_horse_spot
ENDSCRIPT

SCRIPT sch_horse_spot02
  create_panel_block id = current_horse_spot text = sch_horse_text2 style = panel_message_new_horse_spot
ENDSCRIPT

SCRIPT sch_horse_spot03
  create_panel_block id = current_horse_spot text = sch_horse_text3 style = panel_message_new_horse_spot
ENDSCRIPT

SCRIPT Sch_Goal_Tetris_Start
  Create prefix = "TRG_G_TETRIS_AISkater"
  IF IsAlive name = TRG_G_TETRIS_Pro
    TRG_G_TETRIS_Pro:Obj_MoveToNode name = TRG_G_TETRIS_ProNav
  ENDIF
ENDSCRIPT

SCRIPT Sch_Goal_Tetris_Deactivate
  Kill prefix = "TRG_G_TETRIS_AISkater"
  IF IsAlive name = TRG_G_TETRIS_Pro
    TRG_G_TETRIS_Pro:Obj_MoveToNode name = TRG_G_TETRIS_Pro
  ENDIF
ENDSCRIPT

SCRIPT Sch_SkatetrisSpectator
  Obj_ClearExceptions
  Obj_SetException Ex = SkaterInRadius scr = Sch_SkatetrisSpectatorFall
  Obj_SetInnerRadius 3
  BEGIN
    random( @
    Obj_PlayAnim Anim = Ped_M_Cheering
    @Obj_PlayAnim Anim = Ped_M_ThumbUp
    @Obj_PlayAnim Anim = Ped_M_Clap
     ) 
    Obj_LookAtObject type = skater time = 0.3
    Obj_WaitAnimFinished
  REPEAT
ENDSCRIPT

SCRIPT Sch_SkatetrisSpectatorFall
  Obj_PlayAnim Anim = Ped_M_FalldownA
  Obj_SetException Ex = SkaterOutOfRadius scr = Sch_SkatetrisSpectatorGetUp
  Obj_SetOuterRadius 20
ENDSCRIPT

SCRIPT Sch_SkatetrisSpectatorGetUp
  Obj_PlayAnim Anim = Ped_M_GetUpA
  Obj_WaitAnimFinished
  Goto Sch_SkatetrisSpectator
ENDSCRIPT

SCRIPT Sch_PedProTest Path1 = TRG_SS_PedPro02Nav01 Path2 = TRG_SS_PedPro02Nav20
  Skateshop_PedProInitialSetup Path = <Path1> dropin = <Path3>
  BEGIN
    Skateshop_PedProStartRun Path = <Path1> dropin = <Path3>
    Skateshop_PedProDoTrick Path = <Path2>
    Skateshop_PedProCrossBottom Path = <Path2>
    BEGIN
      Skateshop_PedProDoTrick Path = <Path1>
      Skateshop_PedProCrossBottom Path = <Path1>
      Skateshop_PedProDoTrick Path = <Path2>
      Skateshop_PedProCrossBottom Path = <Path2>
    REPEAT
    Skateshop_PedProEndRun Path = <Path1>
  REPEAT
ENDSCRIPT

SCRIPT Sch_Jock
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathTurnDist 5 feet
  Obj_StickToGround Off
  Obj_SetConstantHeight
  Obj_PathHeading On
  Obj_SetPathVelocity 20 fps
  Obj_SetPathAcceleration 35 fpsps
  Obj_SetPathDeceleration 35 fpsps
  Obj_FollowPathLinked
  Obj_StopAlongPath
  Goto Sch_Jock_Running
ENDSCRIPT

SCRIPT Sch_Jock_Running
  Obj_ClearExceptions
  Obj_SetInnerRadius 6
  Obj_SetException Ex = SkaterInRadius scr = Sch_Jock_Collision
  BEGIN
  <numcy> = random ( @1 @2 @3 )
  <numcy2> = random ( @1 @2 @3 )
  <numcy3> = random ( @3 @8 @10 @14 )
    random( @
    
    Obj_StopAlongPath
    Obj_CycleAnim Anim = Ped_FB_RunningInPlace NumCycles = <numcy>
    Obj_CycleAnim Anim = Ped_FB_ReadyStanceFromIdle
    Obj_CycleAnim Anim = Ped_FB_ReadyStance NumCycles = <numcy2>
    Obj_CycleAnim Anim = Ped_FB_ReadyStanceToIdle
    @
    Obj_CycleAnim Anim = Ped_FB_ReadyStanceFromIdle
    Obj_CycleAnim Anim = Ped_FB_ReadyStance
    Obj_StartAlongPath
    Obj_CycleAnim Anim = Ped_FB_RunFromReadyStance
    Obj_CycleAnim Anim = Ped_FB_RunForward NumCycles = <numcy3>
    Obj_StopAlongPath
    Obj_CycleAnim Anim = Ped_FB_RunToReadyStance
    Obj_CycleAnim Anim = Ped_FB_ReadyStance
    Obj_CycleAnim Anim = Ped_FB_ReadyStanceToIdle
    )
    Obj_PlayStream random( @
    jock_sch_random01
    @jock_sch_random02
    @jock_sch_random03
    @jock_sch_random04
    @jock_sch_random05
     ) 
  REPEAT
ENDSCRIPT

SCRIPT Sch_Jock_Collision
  Obj_ClearExceptions
  IF skater:InAir
    Printf "In Air !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    Goto Sch_JockClocked
  ELSE
    IF skater:OnRail
      Printf "On Rail !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      Goto Sch_JockClocked
    ELSE
      IF SkaterCurrentScorePotGreaterThan 0
        Goto Sch_JockClocked
      ELSE
        Obj_LookAtObject type = skater time = 0.05
        Obj_PlayAnim Anim = Ped_FB_RunningShovePlayer
        Wait 0.05
        Obj_PlaySound bail04 vol = 200
        Obj_PlaySound bail05 vol = 200
        Obj_LookAtObject type = skater time = 0.05
        MakeSkaterGoto PedKnockDown
        Obj_SetAnimCycleMode Off
        Wait 0.05
        Obj_LookAtObject type = skater time = 0.05
        Obj_WaitAnimFinished
        Obj_StopAlongPath
        Obj_WaitAnimFinished
        Obj_LookAtObject type = skater time = 0.3
        Obj_PlayAnim Anim = Ped_M_RotateLeft Cycle
        Obj_WaitRotate
        Obj_SetAnimCycleMode Off
        Obj_WaitAnimFinished
        Obj_CycleAnim Anim = random( @Ped_M_PlayerPoint @Ped_M_PlayerPoint ) 
        Obj_LookAtNodeLinked time = 0.3
        Obj_PlayAnim Anim = Ped_M_RotateLeft Cycle
        Obj_WaitRotate
        Obj_SetAnimCycleMode Off
        Obj_WaitAnimFinished
      ENDIF
    ENDIF
  ENDIF
  Goto Sch_Jock_Running
ENDSCRIPT

SCRIPT Sch_JockClocked
  Obj_StopAlongPath
  Obj_PlaySound HitFootballHelmet_11
  Obj_PlayAnim Anim = Ped_M_FalldownA
  IF not GoalManager_GoalIsActive name = sch_goal_minigame_timer
    IF GoalManager_GoalIsActive name = Sch_Goal_CounterCombo
      GoalManager_GotCounterObject name = Sch_Goal_CounterCombo
      GoalManager_GetGoalParams name = Sch_Goal_CounterCombo
      Wait 10 frames
    ELSE
      minigame_fountain_GrindCounter goal_id = sch_goal_minigame_fountain2 object = "Clocked" verb_s = "Jock" verb_p = "Jocks"
      TRG_MG_JockCounter:Obj_SetException Ex = SkaterLanded scr = sch_goal_minigame_combo_lost
      TRG_MG_JockCounter:Obj_SetException Ex = SkaterBailed scr = sch_goal_minigame_combo_lost
    ENDIF
  ENDIF
  Obj_WaitAnimFinished
  Obj_CycleAnim Anim = Ped_M_GetUpA
  Printf "calling sch_jock_running"
  Goto Sch_Jock_Running
ENDSCRIPT

SCRIPT sch_goal_countercombo_combo_lost
ENDSCRIPT

SCRIPT sch_goal_minigame_combo_lost
  Printf "skater landed or bailed AAAAAAAAAAAAAAAAAAAAAAAAHHHHH"
  Obj_ClearException SkaterLanded
  Obj_ClearException SkaterBailed
  IF GoalManager_GoalIsActive name = sch_goal_minigame_fountain2
    GoalManager_DeactivateGoal name = sch_goal_minigame_fountain2
  ENDIF
ENDSCRIPT

SCRIPT Sch_Goal_Countercombo_Intro
  StopStream
ENDSCRIPT

SCRIPT Sch_Goal_Countercombo_Outro
  Kill prefix = "TRG_Ped_Jock"
  Create prefix = "TRG_G_CC_Success"
  PlayStream jock_beaten
ENDSCRIPT

SCRIPT Sch_Goal_CounterCombo_Success
  Kill prefix = "TRG_G_CC_Success"
  Kill prefix = "TRG_Ped_Jock"
  Create prefix = "TRG_Ped_Jock"
  IF GoalManager_GoalIsActive name = sch_goal_minigame_fountain2
    GoalManager_DeactivateGoal name = sch_goal_minigame_fountain2
  ENDIF
ENDSCRIPT

SCRIPT Sch_Jock_Beaten
  Obj_PlayAnim Anim = Ped_M_GetUpA
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_M_CheckDamage
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_M_ShakeFist Cycle
  Obj_WaitAnimFinished
ENDSCRIPT
OBJFLAG_TONY_PROCHALLENGE_TRICK1 = 0
OBJFLAG_TONY_PROCHALLENGE_TRICK2 = 1
OBJFLAG_TONY_PROCHALLENGE_TRICK3 = 2
OBJFLAG_TONY_PROCHALLENGE_TRICK1_DONE = 3
OBJFLAG_TONY_PROCHALLENGE_TRICK2_DONE = 4
OBJFLAG_TONY_PROCHALLENGE_TRICK3_DONE = 5

SCRIPT Sch_Goal_Counter3_Intro
  Printf "clearing tony pro challenge flags"
  Sch_GenPedsGone
  Sch_TrafficGone
  Kill prefix = "LO_ProChallenge"
  Kill prefix = "ProChallenge"
  Kill prefix = "TRG_COUNTER3_TrickCheck"
  Kill prefix = "TRGP_ProChallenge"
  Wait 1 frame
  Create prefix = "TRG_G_Counter3_Spectator"
  Create name = TRG_COUNTER3_TrickCheck
  Create name = ProChallenge01
  Create name = ProChallenge04
  Create name = LO_ProChallenge
  Create name = LO_ProChallenge_TRANS
  Create name = TRGP_ProChallenge
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK1
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK2
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK3
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK1_DONE
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK2_DONE
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK3_DONE
ENDSCRIPT

SCRIPT Sch_Goal_Counter3_Deactivate
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK1
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK2
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK3
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK1_DONE
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK2_DONE
  ClearFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK3_DONE
  Kill prefix = "TRG_G_Counter3_Spectator"
  Kill prefix = "LO_ProChallenge"
  Kill prefix = "ProChallenge"
  Kill prefix = "TRG_COUNTER3_TrickCheck"
  Kill prefix = "TRGP_ProChallenge"
  Wait 1 frame
  Sch_GenPedsStart
  Sch_TrafficStart
ENDSCRIPT

SCRIPT Sch_Goal_Counter3_outro
  SpawnScript Sch_Goal_Counter3_outroActual
ENDSCRIPT

SCRIPT Sch_Goal_Counter3_outroActual
  Kill prefix = "TRG_G_Counter3_Spectator"
  Kill prefix = "LO_ProChallenge"
  Kill name = ProChallenge03
  Kill name = ProChallenge04
  Create prefix = "TRG_G_Counter3_Spectator"
  Create prefix = "LO_ProChallenge"
  Create name = ProChallenge04
  Wait 1 frame
  LO_ProChallenge:Obj_MoveToNode name = ProChallenge03
  LO_ProChallenge_TRANS:Obj_MoveToNode name = ProChallenge03
ENDSCRIPT

SCRIPT Sch_Goal_Counter3_success
  Kill prefix = "TRG_G_Counter3_Spectator"
  Kill prefix = "LO_ProChallenge"
  Kill prefix = "ProChallenge04"
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_OutOfBounds
  Wait 10 frames
  MakeSkaterGoto Spasmodic
  Wait 1 frames
  Sch_ProChallengeTony_MoveToRestart
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_LevelObject
  BEGIN
    IF Obj_FlagSet OBJFLAG_TONY_PROCHALLENGE_TRICK1
      GoalManager_ReplaceTrickText name = sch_goal_counter3 text = "\t4\n\k4\n\t5\n\k5\n\t6\n\k6"
      create_panel_block id = current_goal text = <tricktext> style = panel_message_goal
      Kill name = ProChallenge01
      Obj_ClearFlag OBJFLAG_TONY_PROCHALLENGE_TRICK1
      PlaySkaterCamAnim skater = 0 name = G_COUNTER3_CameraMid01
      Sch_ProChallengeTony_MoveToRestart
      GoalManager_PauseGoal name = sch_goal_counter3
      Wait 5 frame
      PauseSkaters
      Obj_MoveToNode name = ProChallenge02 speed = 5
      Obj_WaitMove
      GoalManager_UnPauseGoal name = sch_goal_counter3
      PlaySkaterCamAnim skater = 0 stop
      UnPauseSkaters
      Create name = ProChallenge02
    ENDIF
    IF Obj_FlagSet OBJFLAG_TONY_PROCHALLENGE_TRICK2
      GetKeyComboArrayFromTrickArray tricks = [ Trick_BarrelRoll Trick_Indy900 Trick_360VarialMcTwist ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
       <combo_2> = ( ( goal_tetris_trick_text.( <keycombos> [ 1 ] ) ) )
       <combo_3> = ( ( goal_tetris_trick_text.( <keycombos> [ 2 ] ) ) )
      FormatText TextName = tricks "Barrel Roll\n%a\nIndy 900\n%b\n360 Varial McTwist\n%c" a = <combo_1> b = <combo_2> c = <combo_3>
      create_panel_block id = current_goal text = <tricks> style = panel_message_goal
      Kill name = ProChallenge02
      Obj_ClearFlag OBJFLAG_TONY_PROCHALLENGE_TRICK2
      PlaySkaterCamAnim skater = 0 name = G_COUNTER3_CameraMid01
      Sch_ProChallengeTony_MoveToRestart
      GoalManager_PauseGoal name = sch_goal_counter3
      Wait 5 frame
      PauseSkaters
      Obj_MoveToNode name = ProChallenge03 speed = 5
      Obj_WaitMove
      GoalManager_UnPauseGoal name = sch_goal_counter3
      PlaySkaterCamAnim skater = 0 stop
      UnPauseSkaters
      Obj_WaitMove
      Create name = ProChallenge03
    ENDIF
    Wait 1 frame
  REPEAT
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_TrickTrigger1_1
  EndGap GapID = ProChallengeTony_TRICK11_2
  EndGap GapID = ProChallengeTony_TRICK12_2
  EndGap GapID = ProChallengeTony_TRICK13_2
  EndGap GapID = ProChallengeTony_Gap_2 text = "Tony's Pro Challenge Gap" score = 500
  StartGap GapID = ProChallengeTony_TRICK11_1 flags = [ pure_air ] KeyCombo = Air_CircleU trickscript = Sch_ProChallengeTony_GotTRICK1
  StartGap GapID = ProChallengeTony_TRICK12_1 flags = [ pure_air ] KeyCombo = Air_CircleD trickscript = Sch_ProChallengeTony_GotTRICK2
  StartGap GapID = ProChallengeTony_TRICK13_1 flags = [ pure_air ] KeyCombo = Air_CircleR trickscript = Sch_ProChallengeTony_GotTRICK3
  StartGap GapID = ProChallengeTony_Gap_1 flags = [ pure_air ]
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_TrickTrigger1_2
  EndGap GapID = ProChallengeTony_TRICK11_1
  EndGap GapID = ProChallengeTony_TRICK12_1
  EndGap GapID = ProChallengeTony_TRICK13_1
  EndGap GapID = ProChallengeTony_Gap_1 text = "Tony's Pro Challenge Gap" score = 500
  StartGap GapID = ProChallengeTony_TRICK11_2 flags = [ pure_air ] KeyCombo = Air_CircleU trickscript = Sch_ProChallengeTony_GotTRICK1
  StartGap GapID = ProChallengeTony_TRICK12_2 flags = [ pure_air ] KeyCombo = Air_CircleD trickscript = Sch_ProChallengeTony_GotTRICK2
  StartGap GapID = ProChallengeTony_TRICK13_2 flags = [ pure_air ] KeyCombo = Air_CircleR trickscript = Sch_ProChallengeTony_GotTRICK3
  StartGap GapID = ProChallengeTony_Gap_2 flags = [ pure_air ]
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_TrickTrigger2_1
  StartGap GapID = ProChallengeTony_Gap_1 flags = [ pure_air ]
  StartGap GapID = ProChallengeTony_TRICK21_1 flags = [ pure_air ] KeyCombo = Air_CircleDL trickscript = Sch_ProChallengeTony_GotTRICK1
  StartGap GapID = ProChallengeTony_TRICK22_1 flags = [ pure_air ] KeyCombo = Air_CircleUR trickscript = Sch_ProChallengeTony_GotTRICK3
  StartGap GapID = ProChallengeTony_TRICK23_1 flags = [ pure_air ] KeyCombo = Air_CircleUL trickscript = Sch_ProChallengeTony_GotTRICK2
  EndGap GapID = ProChallengeTony_Gap_2 text = "Tony's Pro Challenge Gap" score = 500
  EndGap GapID = ProChallengeTony_TRICK21_2
  EndGap GapID = ProChallengeTony_TRICK22_2
  EndGap GapID = ProChallengeTony_TRICK23_2
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_TrickTrigger2_2
  StartGap GapID = ProChallengeTony_Gap_2 flags = [ pure_air ]
  StartGap GapID = ProChallengeTony_TRICK21_2 flags = [ pure_air ] KeyCombo = Air_CircleDL trickscript = Sch_ProChallengeTony_GotTRICK1
  StartGap GapID = ProChallengeTony_TRICK22_2 flags = [ pure_air ] KeyCombo = Air_CircleUR trickscript = Sch_ProChallengeTony_GotTRICK3
  StartGap GapID = ProChallengeTony_TRICK23_2 flags = [ pure_air ] KeyCombo = Air_CircleUL trickscript = Sch_ProChallengeTony_GotTRICK2
  EndGap GapID = ProChallengeTony_Gap_1 text = "Tony's Pro Challenge Gap" score = 500
  EndGap GapID = ProChallengeTony_TRICK21_1
  EndGap GapID = ProChallengeTony_TRICK22_1
  EndGap GapID = ProChallengeTony_TRICK23_1
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_TrickTrigger3_1
  StartGap GapID = ProChallengeTony_Gap_1 flags = [ pure_air ]
  StartGap GapID = ProChallengeTony_TRICK31_1 flags = [ pure_air ] tricktext = "Indy 900" trickscript = Sch_ProChallengeTony_GotTRICK2
  StartGap GapID = ProChallengeTony_TRICK32_1 flags = [ pure_air ] tricktext = "Barrel Roll" trickscript = Sch_ProChallengeTony_GotTRICK1
  StartGap GapID = ProChallengeTony_TRICK33_1 flags = [ pure_air ] tricktext = "360 Varial McTwist" trickscript = Sch_ProChallengeTony_GotTRICK3
  EndGap GapID = ProChallengeTony_Gap_2 text = "Tony's Pro Challenge Gap" score = 500
  EndGap GapID = ProChallengeTony_TRICK31_2
  EndGap GapID = ProChallengeTony_TRICK32_2
  EndGap GapID = ProChallengeTony_TRICK33_2
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_TrickTrigger3_2
  StartGap GapID = ProChallengeTony_Gap_2 flags = [ pure_air ]
  StartGap GapID = ProChallengeTony_TRICK31_2 flags = [ pure_air ] tricktext = "Indy 900" trickscript = Sch_ProChallengeTony_GotTRICK2
  StartGap GapID = ProChallengeTony_TRICK32_2 flags = [ pure_air ] tricktext = "Barrel Roll" trickscript = Sch_ProChallengeTony_GotTRICK1
  StartGap GapID = ProChallengeTony_TRICK33_2 flags = [ pure_air ] tricktext = "360 Varial McTwist" trickscript = Sch_ProChallengeTony_GotTRICK3
  EndGap GapID = ProChallengeTony_Gap_1 text = "Tony's Pro Challenge Gap" score = 500
  EndGap GapID = ProChallengeTony_TRICK31_1
  EndGap GapID = ProChallengeTony_TRICK32_1
  EndGap GapID = ProChallengeTony_TRICK33_1
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_GotTRICK1
  StartGap GapID = ProChallengeTony_TRICK1
  EndGap GapID = ProChallengeTony_TRICK1 text = "Tony's Pro Challenge TRICK 1" score = 500
  SendFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK1
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_GotTRICK2
  StartGap GapID = ProChallengeTony_TRICK2
  EndGap GapID = ProChallengeTony_TRICK2 text = "Tony's Pro Challenge TRICK 2" score = 500
  SendFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK2
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_GotTRICK3
  StartGap GapID = ProChallengeTony_TRICK3
  EndGap GapID = ProChallengeTony_TRICK3 text = "Tony's Pro Challenge TRICK 3" score = 500
  SendFlag name = TRG_COUNTER3_TrickCheck OBJFLAG_TONY_PROCHALLENGE_TRICK3
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_TrickChecker
  Obj_VarSet var = 0 value = 0
  BEGIN
    IF GoalManager_GoalIsActive name = sch_goal_counter3
      IF Obj_FlagSet OBJFLAG_TONY_PROCHALLENGE_TRICK1
        Obj_ClearFlag OBJFLAG_TONY_PROCHALLENGE_TRICK1
        Printf "got TRICK1"
        IF not Obj_FlagSet OBJFLAG_TONY_PROCHALLENGE_TRICK1_DONE
          Obj_VarInc var = 0
          Obj_SetFlag OBJFLAG_TONY_PROCHALLENGE_TRICK1_DONE
          Sch_ProChallengeTony_MoveCheck
          Printf "GoalManager_GotCounterObject"
          GoalManager_GotCounterObject name = sch_goal_counter3
        ENDIF
      ENDIF
      IF Obj_FlagSet OBJFLAG_TONY_PROCHALLENGE_TRICK2
        Obj_ClearFlag OBJFLAG_TONY_PROCHALLENGE_TRICK2
        Printf "got TRICK2"
        IF not Obj_FlagSet OBJFLAG_TONY_PROCHALLENGE_TRICK2_DONE
          Obj_VarInc var = 0
          Obj_SetFlag OBJFLAG_TONY_PROCHALLENGE_TRICK2_DONE
          Sch_ProChallengeTony_MoveCheck
          Printf "GoalManager_GotCounterObject"
          GoalManager_GotCounterObject name = sch_goal_counter3
        ENDIF
      ENDIF
      IF Obj_FlagSet OBJFLAG_TONY_PROCHALLENGE_TRICK3
        Obj_ClearFlag OBJFLAG_TONY_PROCHALLENGE_TRICK3
        Printf "got TRICK3"
        IF not Obj_FlagSet OBJFLAG_TONY_PROCHALLENGE_TRICK3_DONE
          Obj_VarInc var = 0
          Obj_SetFlag OBJFLAG_TONY_PROCHALLENGE_TRICK3_DONE
          Sch_ProChallengeTony_MoveCheck
          Printf "GoalManager_GotCounterObject"
          GoalManager_GotCounterObject name = sch_goal_counter3
        ENDIF
      ENDIF
    ELSE
      Obj_VarSet var = 0 value = 0
    ENDIF
    Wait 10 frames
  REPEAT
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_MoveCheck
  IF Obj_VarEQ var = 0 value = 3
    Printf "got the first 3"
    Obj_ClearFlag OBJFLAG_TONY_PROCHALLENGE_TRICK1_DONE
    Obj_ClearFlag OBJFLAG_TONY_PROCHALLENGE_TRICK2_DONE
    Obj_ClearFlag OBJFLAG_TONY_PROCHALLENGE_TRICK3_DONE
    Wait 1 Frame
    SendFlag name = LO_ProChallenge OBJFLAG_TONY_PROCHALLENGE_TRICK1
    SendFlag name = LO_ProChallenge_TRANS OBJFLAG_TONY_PROCHALLENGE_TRICK1
  ENDIF
  IF Obj_VarEQ var = 0 value = 6
    Printf "got the next 3"
    Obj_ClearFlag OBJFLAG_TONY_PROCHALLENGE_TRICK1_DONE
    Obj_ClearFlag OBJFLAG_TONY_PROCHALLENGE_TRICK2_DONE
    Obj_ClearFlag OBJFLAG_TONY_PROCHALLENGE_TRICK3_DONE
    Wait 1 Frame
    SendFlag name = LO_ProChallenge OBJFLAG_TONY_PROCHALLENGE_TRICK2
    SendFlag name = LO_ProChallenge_TRANS OBJFLAG_TONY_PROCHALLENGE_TRICK2
  ENDIF
ENDSCRIPT

SCRIPT Sch_ProChallengeTony_MoveToRestart
  skater:KillSkater node = TRG_G_COUNTER3_RestartNode
ENDSCRIPT

SCRIPT sch_race2_waypoint_1
  create_panel_block id = current_goal text = "9:40 AM\nFS 5-0 the lower School Pool Lip" style = panel_message_goal
  Kill prefix = "TRGP_G_Race2_"
  Kill prefix = "TRG_G_Race2_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_RACE2_RaceArrow01
  Create name = TRGP_G_Race2_Exit01
ENDSCRIPT

SCRIPT sch_race2_waypoint_2
  create_panel_block id = current_goal text = "10:20 AM\n360 Flip over the Tennis Net" style = panel_message_goal
  GetKeyComboArrayFromTrickArray tricks = [ Trick_VarialKickflip ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
  FormatText TextName = tricks "360 Flip\n%a + \b1" a = <combo_1>
  GoalManager_ReplaceTrickText name = sch_goal_race2 text = <tricks>
  SpawnScript goal_wait_and_show_key_combo_text params = { text = <tricktext> }
  Kill prefix = "TRGP_G_Race2_"
  Kill prefix = "TRG_G_Race2_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_RACE2_RaceArrow02
  Create name = TRGP_G_Race2_Enter02
  Create name = TRGP_G_Race2_Enter11
  Create name = TRGP_G_Race2_Exit02
ENDSCRIPT

SCRIPT sch_race2_waypoint_3
  create_panel_block id = current_goal text = "12:00 PM\nNoseSlide the Stone Bridge Ledge" style = panel_message_goal
  GoalManager_ReplaceTrickText name = sch_goal_race2 text = "\b0 + \b5 or \b0 + \b6"
  SpawnScript goal_wait_and_show_key_combo_text params = { text = <tricktext> }
  Kill prefix = "TRGP_G_Race2_"
  Kill prefix = "TRG_G_Race2_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_RACE2_RaceArrow03
  Create name = TRGP_G_Race2_Exit03
ENDSCRIPT

SCRIPT sch_race2_waypoint_4
  create_panel_block id = current_goal text = "12:30 PM\nSmith Grind the Philoshopy Building's Ledge" style = panel_message_goal
  GoalManager_ReplaceTrickText name = sch_goal_race2 text = "\b0 + \bc or \b0 + \ba"
  SpawnScript goal_wait_and_show_key_combo_text params = { text = <tricktext> }
  Kill prefix = "TRGP_G_Race2_"
  Kill prefix = "TRG_G_Race2_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_RACE2_RaceArrow04
  Create name = TRGP_G_Race2_Enter04
  Create name = TRGP_G_Race2_Exit04
ENDSCRIPT

SCRIPT sch_race2_waypoint_5
  create_panel_block id = current_goal text = "1:10 PM\nDo a FS Shove-It between any of the Outer Coliseum Rails" style = panel_message_goal
  GetKeyComboArrayFromTrickArray tricks = [ Trick_FSShoveIt ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
  FormatText TextName = tricks "FS Shove-It\n%a" a = <combo_1>
  GoalManager_ReplaceTrickText name = sch_goal_race2 text = <tricks>
  SpawnScript goal_wait_and_show_key_combo_text params = { text = <tricktext> }
  Kill prefix = "TRGP_G_Race2_"
  Kill prefix = "TRG_G_Race2_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_RACE2_RaceArrow05
  Create name = TRGP_G_Race2_Enter05
  Create name = TRGP_G_Race2_Exit05
ENDSCRIPT

SCRIPT sch_race2_waypoint_6
  create_panel_block id = current_goal text = "2:00 PM\n NoseGrind the Elementary School Rails" style = panel_message_goal
  GoalManager_ReplaceTrickText name = sch_goal_race2 text = "\b0 + \b7"
  SpawnScript goal_wait_and_show_key_combo_text params = { text = <tricktext> }
  Kill prefix = "TRGP_G_Race2_"
  Kill prefix = "TRG_G_Race2_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_RACE2_RaceArrow06
  Create name = TRGP_G_Race2_Enter06
  Create name = TRGP_G_Race2_Exit06
ENDSCRIPT

SCRIPT sch_race2_waypoint_7
  create_panel_block id = current_goal text = "3:15 PM\nTailslide the Curved Clock Tower Bench" style = panel_message_goal
  GoalManager_ReplaceTrickText name = sch_goal_race2 text = "\b0 + \b5 or \b0 + \b6"
  SpawnScript goal_wait_and_show_key_combo_text params = { text = <tricktext> }
  Kill prefix = "TRGP_G_Race2_"
  Kill prefix = "TRG_G_Race2_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_RACE2_RaceArrow07
  Create name = TRGP_G_Race2_Exit07
ENDSCRIPT

SCRIPT sch_race2_waypoint_8
  create_panel_block id = current_goal text = "4:00 PM\nKickFlip off of any of the Information Kiosks" style = panel_message_goal
  GetKeyComboArrayFromTrickArray tricks = [ Trick_Kickflip ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
  FormatText TextName = tricks "Kickflip\n%a" a = <combo_1>
  GoalManager_ReplaceTrickText name = sch_goal_race2 text = <tricks>
  SpawnScript goal_wait_and_show_key_combo_text params = { text = <tricktext> }
  Kill prefix = "TRGP_G_Race2_"
  Kill prefix = "TRG_G_Race2_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_RACE2_RaceArrow08
  Create name = TRGP_G_Race2_Exit08
ENDSCRIPT

SCRIPT sch_race2_waypoint_9
  create_panel_block id = current_goal text = "6:20 PM\nNosegrind the Keg Ledge" style = panel_message_goal
  GoalManager_ReplaceTrickText name = sch_goal_race2 text = "\b0 + \b7"
  SpawnScript goal_wait_and_show_key_combo_text params = { text = <tricktext> }
  Kill prefix = "TRGP_G_Race2_"
  Kill prefix = "TRG_G_Race2_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_RACE2_RaceArrow09
  Create name = TRGP_G_Race2_Enter09
  Create name = TRGP_G_Race2_Exit09
ENDSCRIPT

SCRIPT sch_race2_waypoint_10
  create_panel_block id = current_goal text = "7:15 PM\nBenihana the Roof Gap" style = panel_message_goal
  GetKeyComboArrayFromTrickArray tricks = [ Trick_Benihana ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
  FormatText TextName = tricks "Benihana\n%a" a = <combo_1>
  GoalManager_ReplaceTrickText name = sch_goal_race2 text = <tricks>
  SpawnScript goal_wait_and_show_key_combo_text params = { text = <tricktext> }
  Kill prefix = "TRGP_G_Race2_"
  Kill prefix = "TRG_G_Race2_RaceArrow"
  Wait 1 frame
  Create name = TRG_G_RACE2_RaceArrow10
  Create name = TRGP_G_Race2_Enter10
  Create name = TRGP_G_Race2_Exit10
ENDSCRIPT

SCRIPT Sch_Goal_Race2_Intro
  Wait 1 frame
  Create prefix = "TRG_G_RACE2_RaceNav"
ENDSCRIPT

SCRIPT Sch_Goal_Race2_Deactivate
  Kill prefix = "TRG_G_RACE2_RaceNav"
  Kill prefix = "TRG_G_RACE2_RaceArrow"
  Kill prefix = "TRGP_G_Race2_"
ENDSCRIPT

SCRIPT Sch_Goal_Race2_Outro
  KillSpawnedScript id = sch_special
  SpawnScript Sch_Goal_Race2_OutroActual id = sch_special
ENDSCRIPT

SCRIPT Sch_Goal_Race2_Outro_Anims
  PlayAnim Anim = Benihana_Idle from = 20 to = 20 BlendPeriod = 0
  Wait 30 frames
ENDSCRIPT

SCRIPT Sch_Goal_Race2_OutroActual
  UnPauseSkaters
  skater:Obj_MoveToNode name = TRG_G_RACE2_OutroNode orient
  Wait 1 frame
  MakeSkaterGoto Sch_Goal_Race2_Outro_Anims
  Wait 4 frame
  PauseSkaters
  PlaySound hud_jumpgap
ENDSCRIPT

SCRIPT Sch_Goal_Race2_success
  skater:KillSkater node = TRG_G_Race2_RestartNode
ENDSCRIPT

SCRIPT Sch_Race2_Enter01PreGap
  StartGap GapID = sch_race2_01 flags = [ pure_air ]
  Printf "one"
ENDSCRIPT

SCRIPT Sch_Race2_Enter01MidGap
  Printf "two"
  EndGap GapID = sch_race2_01 gapscript = Sch_Race2_Enter01GotGap
ENDSCRIPT

SCRIPT Sch_Race2_Enter01GotGap
  Printf "three"
  Sch_Race2_Enter01 textA = "360 Flip" textB = "foo" G_script = Sch_ProChallengeJamie_Got02
ENDSCRIPT

SCRIPT Sch_Race2_Enter01 textA = "kickflip" textB = "kickflip" G_script = Sch_ProChallengeJamie_Got01
  Printf "Sch_Race2_Enter01"
  StartGap GapID = ProChallengeJamie_1 flags = [ Cancel_Ground ] tricktext = <textA> trickscript = <G_script>
  StartGap GapID = ProChallengeJamie_2 flags = [ Cancel_Ground ] tricktext = <textB> trickscript = <G_script>
ENDSCRIPT

SCRIPT Sch_Race2_Exit01
  Printf "Sch_Race2_Exit01"
  EndGap GapID = ProChallengeJamie_1 flags = [ Cancel_Ground ]
  EndGap GapID = ProChallengeJamie_2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_ProChallengeJamie_Got01
  Sch_ProChallengeJamie_GotRaceNav race_flag = got_1 GapText = "FS 5-0 School Pool"
ENDSCRIPT

SCRIPT Sch_ProChallengeJamie_Got02
  Sch_ProChallengeJamie_GotRaceNav race_flag = got_2 GapText = "360 Flip Tennis Net"
ENDSCRIPT

SCRIPT Sch_ProChallengeJamie_Got03
  Sch_ProChallengeJamie_GotRaceNav race_flag = got_3 GapText = "NoseSlide Bridge Ledge"
ENDSCRIPT

SCRIPT Sch_ProChallengeJamie_Got04
  Sch_ProChallengeJamie_GotRaceNav race_flag = got_4 GapText = "Smith Grind Philoshopy Ledge"
ENDSCRIPT

SCRIPT Sch_ProChallengeJamie_Got05
  Sch_ProChallengeJamie_GotRaceNav race_flag = got_5 GapText = "FS Shove-It between Coliseum Rail"
ENDSCRIPT

SCRIPT Sch_ProChallengeJamie_Got06
  Sch_ProChallengeJamie_GotRaceNav race_flag = got_6 GapText = "NoseGrind Elementary Rails"
ENDSCRIPT

SCRIPT Sch_ProChallengeJamie_Got07
  Sch_ProChallengeJamie_GotRaceNav race_flag = got_7 GapText = "Tailslide Tower Bench"
ENDSCRIPT

SCRIPT Sch_ProChallengeJamie_Got08
  Sch_ProChallengeJamie_GotRaceNav race_flag = got_8 GapText = "KickFlip Info Kiosk"
ENDSCRIPT

SCRIPT Sch_ProChallengeJamie_Got09
  Sch_ProChallengeJamie_GotRaceNav race_flag = got_9 GapText = "Nosegrind the Keg Ledge"
ENDSCRIPT

SCRIPT Sch_ProChallengeJamie_Got10
  Sch_ProChallengeJamie_GotRaceNav race_flag = got_10 GapText = "Benihana the Roof Gap"
ENDSCRIPT

SCRIPT Sch_ProChallengeJamie_GotRaceNav race_flag = got_1 GapText = "foo"
  GoalManager_SetGoalFlag name = sch_goal_race2 <race_flag> 1
  GoalManager_NextRaceWaypoint name = sch_goal_race2
  StartGap GapID = ProChallengeJamie_GotRaceNav
  EndGap GapID = ProChallengeJamie_GotRaceNav text = <GapText> score = 100
  pulse_blur start = 255 speed = 5
ENDSCRIPT

SCRIPT Sch_Photoguy_RunToNav
  AddGoalArrow
  Obj_SetPathAcceleration 20 mphps
  Obj_SetPathDeceleration 20 mphps
  Obj_SetPathVelocity 30 mph
  Obj_PlayAnim Anim = Ped_BP_RunFromIdle
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_FollowPathLinked
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_BP_Run Cycle
  Obj_PlaySound sch_security_breathing_11
  Obj_SpawnScript Sch_SecurityGuard_VO
  Obj_WaitMove
  Die
ENDSCRIPT

SCRIPT MG_Sch_WireRide
  SpawnScript WireFlasher id = MG_SpawnScript
  Printf "activating timed combo"
  SetScreenElementLock id = root_window Off
  IF ObjectExists id = voltage_counter
    DestroyScreenElement id = voltage_counter
  ENDIF
  CreateScreenElement {
    type = TextBlockElement
    parent = root_window
    id = voltage_counter
    text = " "
    font = small
    pos = (20, 190)
    rgba = [ 128 128 128 128 ]
    dims = (200, 100)
    just = [ left center ]
    internal_just = [ center center ]
  }
  Obj_VarSet var = 0 value = 1
  BEGIN
    IF Obj_FlagSet OBJFLAG_FRATBOY_LOSTBEER
      Obj_VarDec var = 0
      Obj_VarGet var = 0 name = counter
      PlaySound random( @Sparks_11 @spark2_11 @spark3_11 @spark4_11 @spark5_11  ) pitch = random( @110 @120 @130  ) vol = random( @0 @0 @<counter> @60 ) 
      FormatText TextName = minigame_time "%s percent\nVoltage Capacitance" s = <counter>
      SetScreenElementProps {
        id = voltage_counter
        text = <minigame_time>
        rgba = [ 26 115 26 95 ]
      }
    ELSE
      Obj_VarInc var = 0
      Obj_VarGet var = 0 name = counter
      PlaySound random( @Sparks_11 @spark2_11 @spark3_11 @spark4_11 @spark5_11  ) pitch = random( @90 @95 @85  ) vol = random( @0 @0 @<counter> @60 ) 
      FormatText TextName = minigame_time "%s percent\nVoltage Capacitance" s = <counter>
      SetScreenElementProps {
        id = voltage_counter
        text = <minigame_time>
        rgba = [ 115 26 26 95 ]
      }
    ENDIF
    Wait 10 frame
    IF Obj_VarEQ var = 0 value = 100
      KillSpawnedScript id = MG_SpawnScript
      Kill prefix = "wiresElectrified"
      FormatText TextName = minigame_time "Capacitors blown!"
      SetScreenElementProps {
        id = voltage_counter
        text = <minigame_time>
        rgba = [ 115 26 26 95 ]
      }
      BREAK
    ENDIF
    IF Obj_VarEQ var = 0 value = 0
      KillSpawnedScript id = MG_SpawnScript
      Kill prefix = "wiresElectrified"
      PlaySound cash
      FormatText TextName = minigame_time "Capacitors cleared!\nThanks, amigo!"
      GoalManager_AwardMinigameCash name = sch_goal_minigame_generic2 500
      SetScreenElementProps {
        id = voltage_counter
        text = <minigame_time>
        rgba = [ 26 115 26 95 ]
      }
      BREAK
    ENDIF
  REPEAT
  SCH_MG_Wires_EndGame
ENDSCRIPT

SCRIPT MG_Sch_WireRideEnd
  KillSpawnedScript id = MG_SpawnScript
  Kill prefix = "wiresElectrified"
  Wait 3 seconds
  DestroyScreenElement id = voltage_counter
  TRG_MG_Wires01:Die
ENDSCRIPT

SCRIPT WireFlasher
  PlaySound Sparks_11 vol = 150
  BEGIN
    Printf "sparks on"
    Create name = wiresElectrified01
    Wait random( @1 @5 @10  ) frames
    Printf "sparks off"
    Kill name = wiresElectrified01
    Wait random( @1 @5 @10  ) frames
  REPEAT
ENDSCRIPT

SCRIPT Sch_MG_VoltageReducer
  IF IsAlive name = TRG_MG_Wires01
    IF TriggerType [ TRIGGER_SKATE_ONTO TRIGGER_LAND_ON ]
      Printf "onto or land"
      SendFlag name = TRG_MG_Wires01 OBJFLAG_VOLTAGE_LREDUCING
    ENDIF
    IF TriggerType [ TRIGGER_SKATE_OFF TRIGGER_JUMP_OFF ]
      Printf "skate off or jump off"
      ClearFlag name = TRG_MG_Wires01 OBJFLAG_VOLTAGE_LREDUCING
    ENDIF
  ENDIF
ENDSCRIPT
OBJFLAG_VOLTAGE_LREDUCING = 0
OBJFLAG_DONTCREATECARS = 0
OBJFLAG_ONECARGONE = 1

SCRIPT Sch_CarGenerator_North numcars = 6
  Obj_VarSet var = 0 value = 0
  BEGIN
    IF Obj_FlagSet OBJFLAG_DONTCREATECARS
    ELSE
      IF Obj_VarGT var = 0 value = <numcars>
      ELSE
        randomnorepeat( @
        Sch_CheckThenCreateCar carname = TRG_Car_Random_North01
        @Sch_CheckThenCreateCar carname = TRG_Car_Random_North02
        @Sch_CheckThenCreateCar carname = TRG_Car_Random_North03
        @Sch_CheckThenCreateCar carname = TRG_Car_Random_North04
        @Sch_CheckThenCreateCar carname = TRG_Car_Random_North05
         ) 
      ENDIF
    ENDIF
    BEGIN
      Wait 10 frame
      IF Obj_FlagSet OBJFLAG_ONECARGONE
        Obj_ClearFlag OBJFLAG_ONECARGONE
        Obj_VarDec var = 0
      ENDIF
    REPEAT randomnorepeat( @30 @80 @250 @400 ) 
  REPEAT
ENDSCRIPT

SCRIPT Sch_CarGenerator_South numcars = 6
  Obj_VarSet var = 0 value = 0
  BEGIN
    IF Obj_FlagSet OBJFLAG_DONTCREATECARS
    ELSE
      IF Obj_VarGT var = 0 value = <numcars>
      ELSE
        randomnorepeat( @
        Sch_CheckThenCreateCar carname = TRG_Car_Random_South01
        @Sch_CheckThenCreateCar carname = TRG_Car_Random_South02
        @Sch_CheckThenCreateCar carname = TRG_Car_Random_South03
        @Sch_CheckThenCreateCar carname = TRG_Car_Random_South04
        @Sch_CheckThenCreateCar carname = TRG_Car_Random_South05
         ) 
      ENDIF
    ENDIF
    BEGIN
      Wait 10 frame
      IF Obj_FlagSet OBJFLAG_ONECARGONE
        Obj_ClearFlag OBJFLAG_ONECARGONE
        Obj_VarDec var = 0
      ENDIF
    REPEAT randomnorepeat( @30 @80 @250 @400 ) 
  REPEAT
ENDSCRIPT

SCRIPT Sch_CheckThenCreateCar
  IF not IsAlive name = <carname>
    Create name = <carname>
    Obj_VarInc var = 0
  ENDIF
ENDSCRIPT

SCRIPT Sch_NorthernCarKillItself
  SendFlag name = TRG_Car_Generator_North OBJFLAG_ONECARGONE
  Die
ENDSCRIPT

SCRIPT Sch_SouthernCarKillItself
  SendFlag name = TRG_Car_Generator_South OBJFLAG_ONECARGONE
  Die
ENDSCRIPT

SCRIPT Sch_TrafficGone
  Kill prefix = "TRG_Car_"
ENDSCRIPT

SCRIPT Sch_TrafficStart
  Printf "sending flag to car creator!!!"
  Kill prefix = "TRG_Car_Generator_"
  Wait 1 frame
  Create prefix = "TRG_Car_Generator_"
ENDSCRIPT

SCRIPT Sch_GenPedsGone
  Printf "killing generic peds"
  Kill prefix = "TRG_Ped_Gen_"
ENDSCRIPT

SCRIPT Sch_GenPedsStart
  Printf "creating generic peds"
  Kill prefix = "TRG_Ped_Gen_"
  Wait 1 frame
  Create prefix = "TRG_Ped_Gen_"
ENDSCRIPT

SCRIPT Sch_ParkedCarsGone
  Kill prefix = "CarplantCar_"
ENDSCRIPT

SCRIPT Sch_ParkedCarsReturn
  Kill prefix = "CarplantCar_"
  Wait 1 frame
  Create prefix = "CarplantCar_"
ENDSCRIPT

SCRIPT Sch_ClearGarbageDay
  Kill prefix = "TRG_Veh_GarbageTruck"
  Kill prefix = "TRG_GarbageDayMoney"
ENDSCRIPT

SCRIPT Sch_ClearStaticGarbageTruck
  Kill prefix = "TRG_GarbageTruck"
  Kill prefix = "MLS_Garbage"
ENDSCRIPT

SCRIPT Sch_ReturnStaticGarbageTruck
  Create name = MLS_Garbage_Truck_ContainerTrigger
  Create prefix = "TRG_GarbageTruck"
  Create prefix = "MLS_Garbage_Wheel"
  Create name = MLS_Garbage_shadow
  Create name = MLS_Garbage_Truck
  Create name = MLS_garbage_collision
ENDSCRIPT

SCRIPT Sch_GarbageDay_AwardCash
  Obj_SetException Ex = SkaterInRadius scr = Sch_GarbageDay_AwardCash2
  Obj_SetInnerRadius 7
  Obj_RotY speed = 250
  Obj_Hover Amp = 10 Freq = 1
ENDSCRIPT

SCRIPT Sch_GarbageDay_AwardCash2
  GoalManager_AwardMinigameCash name = sch_goal_minigame_timer 50
  Wait 1 frame
  Die
ENDSCRIPT

SCRIPT Sch_RestartScript
ENDSCRIPT

SCRIPT Sch_BBallSounds
  BEGIN
    Obj_PlayStream Basketballshoesqueak vol = 100 dropoff = 200
    Wait 4.3 seconds
    random( @
    Obj_PlayStream sch_bball_random01 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random02 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random03 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random04 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random05 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random06 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random07 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random08 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random09 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random10 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random11 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random12 vol = 200 dropoff = 400
    @Obj_PlayStream sch_bball_random13 vol = 200 dropoff = 400
     ) 
    Wait random( @2 @4 @6  ) seconds
  REPEAT
ENDSCRIPT

SCRIPT Sch_TennisSounds
  BEGIN
    Obj_PlayStream Tennisshoesqueak vol = 80 dropoff = 200
    Wait 4.3 seconds
  REPEAT
ENDSCRIPT

SCRIPT Sch_StadiumSounds
  BEGIN
    Wait 3.1 seconds
    Obj_PlayStream random( @stadiumcheers @stadiumcheers2  ) vol = random( @50 @75 @100  ) dropoff = 400
  REPEAT
ENDSCRIPT

SCRIPT Sch_ClockSounds
  BEGIN
    Wait random( @25 @35 @45  ) seconds
    BEGIN
      PlayStream clockchime dropoff = 900 vol = 75
      Wait 6 seconds
    REPEAT random( @1 @3 @5 ) 
  REPEAT
ENDSCRIPT

SCRIPT Sch_ClockTickSounds
  Wait 1 second
  BEGIN
    Obj_PlayStream clocktick dropoff = 900 vol = 50
    Wait 5.1 seconds
  REPEAT
ENDSCRIPT

SCRIPT Sch_GarageSounds
  BEGIN
    Obj_PlayStream TireSqueak vol = 100 dropoff = 800
    Wait 16 seconds
  REPEAT
ENDSCRIPT

SCRIPT Sch_MovieSounds
  BEGIN
    Obj_PlayStream MovieTheater vol = 100 dropoff = 400
    Wait 31 seconds
  REPEAT
ENDSCRIPT

SCRIPT Sch_SororitySounds
  BEGIN
    Obj_PlayStream GirlGiggles vol = 100 dropoff = 400
    Wait 10 seconds
  REPEAT
ENDSCRIPT

SCRIPT Sch_KidsSounds
  BEGIN
    Obj_PlayStream random( @kidsplaying @kidsplaying2  ) vol = random( @50 @75 @100  ) dropoff = 400
    Wait 3.1 seconds
  REPEAT
ENDSCRIPT

SCRIPT Sch_BirdsSounds
  BEGIN
    Obj_PlayStream amb_birdchirps vol = random( @50 @60 @70  ) dropoff = 200
    Wait 38 seconds
  REPEAT
ENDSCRIPT
OBJFLAG_TENNIS_FLIPPED = 0
OBJFLAG_TENNIS_NAV1 = 1
OBJFLAG_TENNIS_NAV2 = 2
OBJFLAG_TENNIS_NAV3 = 3
OBJFLAG_TENNIS_NAV4 = 4
OBJFLAG_CURRENT_NAV1 = 5
OBJFLAG_CURRENT_NAV2 = 6
OBJFLAG_CURRENT_NAV3 = 7
OBJFLAG_CURRENT_NAV4 = 8
OBJFLAG_TENNIS_RETURN = 9
OBJFLAG_TENNIS_SWING = 10
OBJFLAG_TENNIS_THERE = 11
OBJFLAG_TENNIS_WIN = 12
OBJFLAG_TENNIS_LOSE = 13
OBJFLAG_TENNIS_UP = 14
OBJFLAG_TENNIS_DOWN = 15
OBJ_EXCEPTION_RUNTONAV = 1

SCRIPT Sch_TP_Player1
  CPF_SetUpStandardPed
  Obj_PlayAnim Anim = Ped_TP_Idle Cycle
  BEGIN
    IF Obj_FlagSet OBJFLAG_TENNIS_NAV1
      Sch_Tennis_RunToNav Sch_Tennis_Nav = TRG_Ped_TP1_Nav01 GotoNav = OBJFLAG_TENNIS_NAV1 CurrentNav = OBJFLAG_CURRENT_NAV1
    ENDIF
    IF Obj_FlagSet OBJFLAG_TENNIS_NAV2
      Sch_Tennis_RunToNav Sch_Tennis_Nav = TRG_Ped_TP1_Nav02 GotoNav = OBJFLAG_TENNIS_NAV2 CurrentNav = OBJFLAG_CURRENT_NAV2
    ENDIF
    IF Obj_FlagSet OBJFLAG_TENNIS_NAV3
      Sch_Tennis_RunToNav Sch_Tennis_Nav = TRG_Ped_TP1_Nav03 GotoNav = OBJFLAG_TENNIS_NAV3 CurrentNav = OBJFLAG_CURRENT_NAV3
    ENDIF
    IF Obj_FlagSet OBJFLAG_TENNIS_NAV4
      Sch_Tennis_RunToNav Sch_Tennis_Nav = TRG_Ped_TP1_Nav04 GotoNav = OBJFLAG_TENNIS_NAV4 CurrentNav = OBJFLAG_CURRENT_NAV4
    ENDIF
    Wait 10 frame
  REPEAT
ENDSCRIPT

SCRIPT Sch_TP_Player2
  CPF_SetUpStandardPed
  Obj_PlayAnim Anim = Ped_TP_Idle Cycle
  BEGIN
    IF Obj_FlagSet OBJFLAG_TENNIS_NAV1
      Sch_Tennis_RunToNav Sch_Tennis_Nav = TRG_Ped_TP2_Nav01 GotoNav = OBJFLAG_TENNIS_NAV1 CurrentNav = OBJFLAG_CURRENT_NAV1
    ENDIF
    IF Obj_FlagSet OBJFLAG_TENNIS_NAV2
      Sch_Tennis_RunToNav Sch_Tennis_Nav = TRG_Ped_TP2_Nav02 GotoNav = OBJFLAG_TENNIS_NAV2 CurrentNav = OBJFLAG_CURRENT_NAV2
    ENDIF
    IF Obj_FlagSet OBJFLAG_TENNIS_NAV3
      Sch_Tennis_RunToNav Sch_Tennis_Nav = TRG_Ped_TP2_Nav03 GotoNav = OBJFLAG_TENNIS_NAV3 CurrentNav = OBJFLAG_CURRENT_NAV3
    ENDIF
    IF Obj_FlagSet OBJFLAG_TENNIS_NAV4
      Sch_Tennis_RunToNav Sch_Tennis_Nav = TRG_Ped_TP2_Nav04 GotoNav = OBJFLAG_TENNIS_NAV4 CurrentNav = OBJFLAG_CURRENT_NAV4
    ENDIF
    Wait 10 frame
  REPEAT
ENDSCRIPT

SCRIPT Sch_Tennis_RunToNav Sch_Tennis_Nav = TRG_Ped_TP1_Nav01 GotoNav = OBJFLAG_TENNIS_NAV1 CurrentNav = OBJFLAG_CURRENT_NAV1
  Sch_TP_CheckForFlip
  Obj_PlayAnim Anim = Ped_TP_RunFromIdle
  Obj_MoveToNode name = <Sch_Tennis_Nav> time = 0.5 second
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_TP_Run Cycle
  Obj_WaitMove
  Obj_PlayAnim Anim = Ped_TP_RunToIdle
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_TP_StandingHit
  Wait 15 frames
  Obj_PlaySound sch_tennis_11 pitch = random( @95 @100 @105 ) 
  Obj_WaitAnimFinished
  Obj_ClearFlag <GotoNav>
  Obj_SetFlag <CurrentNav>
  Obj_PlayAnim Anim = Ped_TP_Idle Cycle
ENDSCRIPT

SCRIPT Sch_TP_CheckForFlip
  IF Obj_FlagSet OBJFLAG_TENNIS_NAV1
    Sch_TP_UNFlipTheTennisPlayer
  ENDIF
  IF Obj_FlagSet OBJFLAG_TENNIS_NAV4
    Sch_TP_FlipTheTennisPlayer
  ENDIF
  IF Obj_FlagSet OBJFLAG_TENNIS_NAV2
    IF Obj_FlagSet OBJFLAG_CURRENT_NAV1
      Sch_TP_FlipTheTennisPlayer
    ENDIF
    IF Obj_FlagSet OBJFLAG_CURRENT_NAV3
      Sch_TP_UNFlipTheTennisPlayer
    ENDIF
    IF Obj_FlagSet OBJFLAG_CURRENT_NAV4
      Sch_TP_UNFlipTheTennisPlayer
    ENDIF
  ENDIF
  IF Obj_FlagSet OBJFLAG_TENNIS_NAV3
    IF Obj_FlagSet OBJFLAG_CURRENT_NAV1
      Sch_TP_FlipTheTennisPlayer
    ENDIF
    IF Obj_FlagSet OBJFLAG_CURRENT_NAV2
      Sch_TP_FlipTheTennisPlayer
    ENDIF
    IF Obj_FlagSet OBJFLAG_CURRENT_NAV4
      Sch_TP_UNFlipTheTennisPlayer
    ENDIF
  ENDIF
  Obj_ClearFlag OBJFLAG_CURRENT_NAV1
  Obj_ClearFlag OBJFLAG_CURRENT_NAV2
  Obj_ClearFlag OBJFLAG_CURRENT_NAV3
  Obj_ClearFlag OBJFLAG_CURRENT_NAV4
ENDSCRIPT

SCRIPT Sch_TP_FlipTheTennisPlayer
  IF not Obj_FlagSet OBJFLAG_TENNIS_FLIPPED
    Obj_Flip
    Obj_SetFlag OBJFLAG_TENNIS_FLIPPED
  ENDIF
ENDSCRIPT

SCRIPT Sch_TP_UNFlipTheTennisPlayer
  IF Obj_FlagSet OBJFLAG_TENNIS_FLIPPED
    Obj_Flip
    Obj_ClearFlag OBJFLAG_TENNIS_FLIPPED
  ENDIF
ENDSCRIPT

SCRIPT Sch_TP_TennisBall
  Wait 10 frames
  BEGIN
    randomnorepeat( @
    Sch_TP_TennisBallMoveScript TP_player = TRG_Ped_Playa06 flag = OBJFLAG_TENNIS_NAV1 nav = TRG_Ped_TP2_Nav01
    @Sch_TP_TennisBallMoveScript TP_player = TRG_Ped_Playa06 flag = OBJFLAG_TENNIS_NAV2 nav = TRG_Ped_TP2_Nav02
    @Sch_TP_TennisBallMoveScript TP_player = TRG_Ped_Playa06 flag = OBJFLAG_TENNIS_NAV3 nav = TRG_Ped_TP2_Nav03
    @Sch_TP_TennisBallMoveScript TP_player = TRG_Ped_Playa06 flag = OBJFLAG_TENNIS_NAV4 nav = TRG_Ped_TP2_Nav04
     ) 
    Obj_WaitMove
    randomnorepeat( @
    Sch_TP_TennisBallMoveScript TP_player = TRG_Ped_Playa05 flag = OBJFLAG_TENNIS_NAV1 nav = TRG_Ped_TP1_Nav01
    @Sch_TP_TennisBallMoveScript TP_player = TRG_Ped_Playa05 flag = OBJFLAG_TENNIS_NAV2 nav = TRG_Ped_TP1_Nav02
    @Sch_TP_TennisBallMoveScript TP_player = TRG_Ped_Playa05 flag = OBJFLAG_TENNIS_NAV3 nav = TRG_Ped_TP1_Nav03
    @Sch_TP_TennisBallMoveScript TP_player = TRG_Ped_Playa05 flag = OBJFLAG_TENNIS_NAV4 nav = TRG_Ped_TP1_Nav04
     ) 
    Obj_WaitMove
  REPEAT
ENDSCRIPT

SCRIPT Sch_TP_TennisBallMoveScript TP_player = TRG_Ped_Playa06 flag = OBJFLAG_TENNIS_NAV1 nav = TRG_Ped_TP2_Nav01
  SendFlag name = <TP_player> <flag>
  Obj_MoveToNode name = <nav> time = 1.5 second
  Obj_Jump gravity = -420 speed = 200
  Obj_WaitJumpFinished
  Obj_PlaySound random( @tennisballbounce_11 @tennisballbounce2_11  ) pitch = 100 vol = 50
  Obj_Jump gravity = -420 speed = 150
ENDSCRIPT

SCRIPT Sch_DestroyWindows
  Kill name = Sch_Windows01
ENDSCRIPT

SCRIPT Sch_KenTest
ENDSCRIPT

SCRIPT Sch_LO_TestSpine
  Obj_RotY speed = 60
ENDSCRIPT

SCRIPT Sch_CarWarp
ENDSCRIPT

SCRIPT Sch_MapGuyAnims
  Obj_PlayAnim Anim = Ped_M_Idle1 Cycle
ENDSCRIPT

SCRIPT Sch_ElevatorDoor_Use
  RunScriptOnObject id = LO_Elevator_Door_Floor1_01 Sch_ElevatorDoor2
  RunScriptOnObject id = LO_Elevator_Door_Floor1_02 Sch_ElevatorDoor2
ENDSCRIPT

SCRIPT Sch_ElevatorDoor
ENDSCRIPT

SCRIPT Sch_ElevatorDoor2
  GetNodeName
  Obj_MoveToLink time = 0.6
  Wait 20 frames
  StopStream
  Wait 1 frames
  PlayStream ElevatorDing
  Obj_WaitMove
  Wait 20 frames
  Obj_MoveToNode name = <nodename> time = 0.6
  Obj_WaitMove
ENDSCRIPT

SCRIPT Sch_SkaterInElevator
  PauseSkaters
  Wait 30 frames
  UnPauseSkaters
ENDSCRIPT

SCRIPT Sch_GAP_GateGap1
  EndGap GapID = Sch_GAP_GateGap1 gapscript = Sch_GAP_GateGap
  StartGap GapID = Sch_GAP_GateGap2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_GateGap2
  EndGap GapID = Sch_GAP_GateGap2 gapscript = Sch_GAP_GateGap
  StartGap GapID = Sch_GAP_GateGap1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_GateGap
  StartGap GapID = Sch_GAP_GateGap
  EndGap GapID = Sch_GAP_GateGap text = "Gateway Gap!" score = 50
ENDSCRIPT

SCRIPT Sch_GAP_StairCrossGap1
  EndGap GapID = Sch_GAP_StairCrossGap1 gapscript = Sch_GAP_StairCrossGap
  StartGap GapID = Sch_GAP_StairCrossGap2 flags = [ pure_air ]
ENDSCRIPT

SCRIPT Sch_GAP_StairCrossGap2
  EndGap GapID = Sch_GAP_StairCrossGap2 gapscript = Sch_GAP_StairCrossGap
  StartGap GapID = Sch_GAP_StairCrossGap1 flags = [ pure_air ]
ENDSCRIPT

SCRIPT Sch_GAP_StairCrossGap
  StartGap GapID = Sch_GAP_StairCrossGap
  EndGap GapID = Sch_GAP_StairCrossGap text = "Over the Stairs!" score = 50
ENDSCRIPT

SCRIPT Sch_GAP_RAilCrossGap1
  Printf "rail cross 1"
  EndGap GapID = Sch_GAP_RAilCrossGap1 gapscript = Sch_GAP_RAilCrossGap
  StartGap GapID = Sch_GAP_RAilCrossGap2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_RAilCrossGap2
  Printf "rail cross 2"
  EndGap GapID = Sch_GAP_RAilCrossGap2 gapscript = Sch_GAP_RAilCrossGap
  StartGap GapID = Sch_GAP_RAilCrossGap1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_RAilCrossGap
  Printf "rail cross done"
  StartGap GapID = Sch_GAP_RAilCrossGap
  EndGap GapID = Sch_GAP_RAilCrossGap text = "Rail Cross!" score = 25
ENDSCRIPT

SCRIPT Sch_GAP_RailHopGap1
  EndGap GapID = Sch_GAP_RailHopGap1 gapscript = Sch_GAP_RailHopGap
  StartGap GapID = Sch_GAP_RailHopGap2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_RailHopGap2
  EndGap GapID = Sch_GAP_RailHopGap2 gapscript = Sch_GAP_RailHopGap
  StartGap GapID = Sch_GAP_RailHopGap1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_RailHopGap
  StartGap GapID = Sch_GAP_RailHopGap
  EndGap GapID = Sch_GAP_RailHopGap text = "Rail Hop!" score = 25
ENDSCRIPT

SCRIPT Sch_GAP_HigherLearningStart
  StartGap GapID = Sch_GAP_HigherLearning flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_HigherLearningEnd
  EndGap GapID = Sch_GAP_HigherLearning text = "Higher Learning!" score = 50
ENDSCRIPT

SCRIPT Sch_GAP_SportsStoreStart
  StartGap GapID = Sch_GAP_SportsStore flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_SportsStoreEnd
  EndGap GapID = Sch_GAP_SportsStore text = "Nice Equipment!" score = 50
ENDSCRIPT

SCRIPT Sch_GAP_SchnitzelStart
  StartGap GapID = Sch_GAP_Schnitzel flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_SchnitzelEnd
  EndGap GapID = Sch_GAP_Schnitzel text = "Schnitzels for All!" score = 50
ENDSCRIPT

SCRIPT Sch_GAP_HighRoadHopGap1
  EndGap GapID = Sch_GAP_HighRoadHopGap1 gapscript = Sch_GAP_HighRoadHopGap
  StartGap GapID = Sch_GAP_HighRoadHopGap2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_HighRoadHopGap2
  EndGap GapID = Sch_GAP_HighRoadHopGap2 gapscript = Sch_GAP_HighRoadHopGap
  StartGap GapID = Sch_GAP_HighRoadHopGap1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_HighRoadHopGap
  StartGap GapID = Sch_GAP_HighRoadHopGap
  EndGap GapID = Sch_GAP_HighRoadHopGap text = "High Road Hop!" score = 50
ENDSCRIPT

SCRIPT Sch_GAP_OnTheFenceStart
  StartGap GapID = Sch_GAP_OnTheFence flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_OnTheFenceEnd
  EndGap GapID = Sch_GAP_OnTheFence text = "On the Fence!" score = 100
ENDSCRIPT

SCRIPT Sch_GAP_LogHopGap1
  EndGap GapID = Sch_GAP_LogHopGap1 gapscript = Sch_GAP_LogHopGap
  StartGap GapID = Sch_GAP_LogHopGap2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_LogHopGap2
  EndGap GapID = Sch_GAP_LogHopGap2 gapscript = Sch_GAP_LogHopGap
  StartGap GapID = Sch_GAP_LogHopGap1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_LogHopGap
  StartGap GapID = Sch_GAP_LogHopGap
  EndGap GapID = Sch_GAP_LogHopGap text = "Log Hop!" score = 25
ENDSCRIPT

SCRIPT Sch_GAP_SkipEntrance1
  EndGap GapID = Sch_GAP_SkipEntrance1 gapscript = Sch_GAP_SkipEntrance
  StartGap GapID = Sch_GAP_SkipEntrance2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_SkipEntrance2
  EndGap GapID = Sch_GAP_SkipEntrance2 gapscript = Sch_GAP_SkipEntrance
  StartGap GapID = Sch_GAP_SkipEntrance1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_SkipEntrance
  StartGap GapID = Sch_GAP_SkipEntrance
  EndGap GapID = Sch_GAP_SkipEntrance text = "Skippin over!" score = 50
ENDSCRIPT

SCRIPT Sch_GAP_PlazaJump1
  EndGap GapID = Sch_GAP_PlazaJump1 gapscript = Sch_GAP_PlazaJump
  StartGap GapID = Sch_GAP_PlazaJump2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_PlazaJump2
  EndGap GapID = Sch_GAP_PlazaJump2 gapscript = Sch_GAP_PlazaJump
  StartGap GapID = Sch_GAP_PlazaJump1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_PlazaJump
  StartGap GapID = Sch_GAP_PlazaJump
  EndGap GapID = Sch_GAP_PlazaJump text = "Plaza Jump!" score = 10
ENDSCRIPT

SCRIPT Sch_GAP_BenchToBenchStart
  StartGap GapID = Sch_GAP_BenchToBench flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_BenchToBenchEnd
  EndGap GapID = Sch_GAP_BenchToBench text = "Bench to Bench!" score = 50
ENDSCRIPT

SCRIPT Sch_GAP_FratWindowGrindStart
ENDSCRIPT

SCRIPT Sch_GAP_FratWindowVertStart
ENDSCRIPT

SCRIPT Sch_GAP_Frat
  GetSkaterState
  StartGap GapID = Sch_GAP_Frat
  IF ( <state> = skater_InManual )
    EndGap GapID = Sch_GAP_Frat text = "Through the Frat Window Manualing!" score = 50
  ELSE
    IF ( <state> = skater_OnRail )
      EndGap GapID = Sch_GAP_Frat text = "Through the Frat Window Grinding!" score = 50
    ELSE
      IF skater:InAir
        EndGap GapID = Sch_GAP_Frat text = "Through the Frat Window Ollieing!" score = 50
      ENDIF
    ENDIF
  ENDIF
ENDSCRIPT

SCRIPT Sch_GAP_ColiseumTransfer1
  EndGap GapID = Sch_GAP_ColiseumTransfer1 gapscript = Sch_GAP_ColiseumTransfer
  StartGap GapID = Sch_GAP_ColiseumTransfer2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_ColiseumTransfer2
  EndGap GapID = Sch_GAP_ColiseumTransfer2 gapscript = Sch_GAP_ColiseumTransfer
  StartGap GapID = Sch_GAP_ColiseumTransfer1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_ColiseumTransfer
  StartGap GapID = Sch_GAP_ColiseumTransfer
  EndGap GapID = Sch_GAP_ColiseumTransfer text = "Coliseum Transfer!" score = 50
ENDSCRIPT

SCRIPT Sch_GAP_KioskHop1
  EndGap GapID = Sch_GAP_KioskHop1 gapscript = Sch_GAP_KioskHop
  StartGap GapID = Sch_GAP_KioskHop2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_KioskHop2
  EndGap GapID = Sch_GAP_KioskHop2 gapscript = Sch_GAP_KioskHop
  StartGap GapID = Sch_GAP_KioskHop1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_KioskHop
  StartGap GapID = Sch_GAP_KioskHop
  EndGap GapID = Sch_GAP_KioskHop text = "KioskHop!" score = 25
ENDSCRIPT

SCRIPT Sch_GAP_ClassTransfer1
  EndGap GapID = Sch_GAP_ClassTransfer1 gapscript = Sch_GAP_ClassTransfer
  StartGap GapID = Sch_GAP_ClassTransfer2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_ClassTransfer2
  EndGap GapID = Sch_GAP_ClassTransfer2 gapscript = Sch_GAP_ClassTransfer
  StartGap GapID = Sch_GAP_ClassTransfer1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_ClassTransfer
  StartGap GapID = Sch_GAP_ClassTransfer
  EndGap GapID = Sch_GAP_ClassTransfer text = "Class Transfer!" score = 50
ENDSCRIPT

SCRIPT Sch_GAP_UpperRiverQP
  EndGap GapID = Sch_GAP_LowerRiverQP text = "Out of the River!" score = 100
  StartGap GapID = Sch_GAP_UpperRiverQP flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_LowerRiverQP
  EndGap GapID = Sch_GAP_UpperRiverQP text = "Into the River!" score = 50
  StartGap GapID = Sch_GAP_LowerRiverQP flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_OverRiverQP1
  EndGap GapID = Sch_GAP_OverRiverQP1 gapscript = Sch_GAP_OverRiverQP
  StartGap GapID = Sch_GAP_OverRiverQP2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_OverRiverQP2
  EndGap GapID = Sch_GAP_OverRiverQP2 gapscript = Sch_GAP_OverRiverQP
  StartGap GapID = Sch_GAP_OverRiverQP1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_OverRiverQP
  StartGap GapID = Sch_GAP_OverRiverQP
  EndGap GapID = Sch_GAP_OverRiverQP text = "Over the River!" score = 200
ENDSCRIPT

SCRIPT Sch_GAP_RoofGap1
  EndGap GapID = Sch_GAP_RoofGap1 text = "Roof Gap!" score = 200
  StartGap GapID = Sch_GAP_RoofGap2 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_RoofGap2
  EndGap GapID = Sch_GAP_RoofGap2 text = "Roof Gap!" score = 200
  StartGap GapID = Sch_GAP_RoofGap1 flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_TowerGrindStart
  StartGap GapID = Sch_GAP_TowerGrind flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_TowerGrindEnd
  EndGap GapID = Sch_GAP_TowerGrind text = "Clock Tower Grind!" score = 200
ENDSCRIPT

SCRIPT Sch_KickerSmallGapStart
  StartGap GapID = Sch_KickerSmallGap flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_KickerSmallGapEnd
  EndGap GapID = Sch_KickerSmallGap text = "Off the Lil Kicker!" score = 50
ENDSCRIPT

SCRIPT Sch_Masters_Start_Philosophy
  StartGap GapID = Sch_Masters flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_Masters_End_Philosophy
  IF TriggerType TRIGGER_LIP_ON
    EndGap GapID = Sch_Masters text = "Masters in Philosophy Lip" score = 150
    Wait 30 frames
    sch_Goal_gaps_got_3
  ELSE
    EndGap GapID = Sch_Masters text = "Masters in Philosophy Grind" score = 100
  ENDIF
ENDSCRIPT

SCRIPT Sch_Masters_Start_FineArts
  StartGap GapID = Sch_Masters flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_Bachelors_End_FineArts
  IF TriggerType TRIGGER_LIP_ON
    EndGap GapID = Sch_Masters text = "Bachelors in FineArts Lip" score = 100
  ELSE
    EndGap GapID = Sch_Masters text = "Bachelors in FineArts Grind" score = 50
  ENDIF
ENDSCRIPT

SCRIPT Sch_Masters_End_FineArts
  IF TriggerType TRIGGER_LIP_ON
    EndGap GapID = Sch_Masters text = "Masters in Fine Arts Lip" score = 150
    Wait 30 frames
    sch_Goal_gaps_got_2
  ELSE
    EndGap GapID = Sch_Masters text = "Masters in Fine Arts Grind" score = 100
  ENDIF
ENDSCRIPT

SCRIPT Sch_Masters_Start_Engineering
  StartGap GapID = Sch_Masters flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_Bachelors_End_Engineering
  IF TriggerType TRIGGER_LIP_ON
    EndGap GapID = Sch_Masters text = "Bachelors in Engineering Lip" score = 100
  ELSE
    EndGap GapID = Sch_Masters text = "Bachelors in Engineering Grind" score = 50
  ENDIF
ENDSCRIPT

SCRIPT Sch_Masters_End_Engineering
  IF TriggerType TRIGGER_LIP_ON
    EndGap GapID = Sch_Masters text = "Masters in Engineering Lip" score = 150
    Wait 30 frames
    sch_Goal_gaps_got_4
  ELSE
    EndGap GapID = Sch_Masters text = "Masters in Engineering Grind" score = 100
  ENDIF
ENDSCRIPT

SCRIPT Sch_Masters_Start_English
  StartGap GapID = Sch_Masters flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_Masters_End_English
  IF TriggerType TRIGGER_LIP_ON
    EndGap GapID = Sch_Masters text = "Masters in English Lip" score = 150
    Wait 30 frames
    sch_Goal_gaps_got_1
  ELSE
    EndGap GapID = Sch_Masters text = "Masters in English Grind" score = 100
  ENDIF
ENDSCRIPT

SCRIPT Sch_GAP_TrafficLight
  StartGap GapID = Sch_GAP_TrafficLight flags = [ Cancel_Ground ]
  Wait 10 frames
  EndGap GapID = Sch_GAP_TrafficLight text = "Traffic Light Grind" score = 150
ENDSCRIPT

SCRIPT Sch_GAP_GrindToFenceStart
  StartGap GapID = Sch_GAP_GrindToFence flags = [ Cancel_Ground ]
ENDSCRIPT

SCRIPT Sch_GAP_GrindToFenceEnd
  EndGap GapID = Sch_GAP_GrindToFence text = "Grind Hop to the Fence" score = 50
ENDSCRIPT
OBJFLAG_SCH_GEN_0 = 0
OBJFLAG_SCH_GEN_1 = 1

SCRIPT SCH_Ped_ExplainsGoals
  IF IsTrue skip_intro
    Die
  ENDIF
  GoalManager_GetNumberOfGoalPoints total
  IF GameModeEquals is_career
    IF ( <goal_points> = 0 )
      exit_pause_menu
      kill_start_key_binding
      Wait 1 gameframe
      SetGlobalFlag flag = GOALS_EXPLAINED
      IF CD
        SetButtonEventMappings block_menu_input
      ENDIF
      GetValueFromVolume cdvol
      IF ( <value> > 0 )
         <volume> = <value>
        SetMusicVolume 20
      ENDIF
      PauseSkaters
      Obj_SetPathAcceleration 20 mphps
      Obj_SetPathDeceleration 20 mphps
      Obj_SetPathVelocity 6 mph
      Obj_PlayAnim Anim = Ped_M_Walk1FromIdle
      Obj_StickToGround distAbove = 3 distBelow = 6
      Obj_FollowPathLinked
      Wait 5 gameframes
      UnPauseSkaters
      MakeSkaterGoto FreezeSkater
      PlaySkaterCamAnim skater = 0 name = CAM_INTRO play_hold
      Obj_WaitAnimFinished
      Obj_PlayAnim Anim = Ped_M_Walk1 Cycle
      Obj_WaitMove
      Obj_PlayAnim Anim = Ped_M_Walk1ToIdle
      Obj_WaitAnimFinished
      create_speech_box {
        text = sch_intro_text
        pad_choose_script = SCH_Ped_ExplainsGoalsDone
        pad_choose_params = { volume = <volume> }
        style = speech_box_style
      }
      Obj_PlayStream photoguy_sch_goal_intro vol = 150 dropoff = 400 use_pos_info = 0
      Obj_PlayAnim Anim = Ped_M_Talk1
       <new_intro_text> = ""
      IF IsArray sch_intro_text
        GetArraySize sch_intro_text
         <index> = 0
        BEGIN
          FormatText TextName = new_intro_text "%o%n" o = <new_intro_text> n = ( sch_intro_text [ <index> ] )
           <index> = ( <index> + 1 )
        REPEAT <array_size>
        FormatText TextName = new_intro_text "%s\nPress \m0 to continue" s = <new_intro_text>
      ELSE
         <new_intro_text> = sch_intro_text
      ENDIF
      create_speech_box {
        text = <new_intro_text>
        pad_choose_script = SCH_Ped_ExplainsGoalsDone
        pad_choose_params = { volume = <volume> }
      }
      SetButtonEventMappings unblock_menu_input
    ELSE
      Die
    ENDIF
  ELSE
    Die
  ENDIF
ENDSCRIPT

SCRIPT SCH_Ped_ExplainsGoalsDone
  restore_start_key_binding
  IF GotParam volume
    Printf "setting volume to %i" i = <volume>
    SetMusicVolume ( <volume> * 10 )
  ENDIF
  PlaySkaterCamAnim skater = 0 stop
  speech_box_exit
  Kill prefix = "TRG_IntroPed"
  MakeSkaterGoto StartSkating1
ENDSCRIPT

SCRIPT Sch_Blimp
  Obj_StickToGround Off
  Obj_SetPathVelocity 8 mph
  Obj_SetPathTurnDist 30
  Obj_FollowPathLinked
ENDSCRIPT

SCRIPT SCH_Gateopen_FromNorth
  RunScriptOnObject id = LO_Gate01 Sch_GateSwing_CW
  RunScriptOnObject id = LO_Gate02 Sch_GateSwing_CCW
ENDSCRIPT

SCRIPT SCH_Gateopen_FromSouth
  RunScriptOnObject id = LO_Gate01 Sch_GateSwing_CCW
  RunScriptOnObject id = LO_Gate02 Sch_GateSwing_CW
ENDSCRIPT

SCRIPT Sch_GateSwing_CW
  Obj_RotY angle = 85 speed = 600
  Wait 10 frames
  Obj_RotY angle = -85 speed = 600
ENDSCRIPT

SCRIPT Sch_GateSwing_CCW
  Obj_RotY angle = -85 speed = 600
  Wait 10 frames
  Obj_RotY angle = 85 speed = 600
ENDSCRIPT

SCRIPT Sch_AddMinigame_Pong
  AddMinigame_Generic {
    CAREER_ONLY
    activate_script = sch_Tennis_activate
    deactivate_script = sch_Tennis_deactivate
  }
ENDSCRIPT

SCRIPT Sch_MG_PongClose
  speech_box_exit
  IF GoalManager_HasActiveGoals
    GoalManager_DeactivateAllGoals
  ENDIF
  Wait 1 frame
  GoalManager_ActivateGoal name = sch_goal_minigame_generic
ENDSCRIPT

SCRIPT SCH_MG_EndGame
  GoalManager_DeactivateGoal name = sch_goal_minigame_generic
ENDSCRIPT

SCRIPT sch_Tennis_activate
  UnPauseSkaters
  MakeSkaterGoto Pong_OnGround
ENDSCRIPT

SCRIPT sch_Tennis_deactivate
  create_panel_block id = current_goal text = " " style = panel_message_goal
  UnPauseSkaters
  speech_box_exit
  KillSpawnedScript id = MG_TP_Spawnscript
  Kill prefix = "TRG_MG_TennisBall"
  MakeSkaterGoto SkaterInit
  Wait 3 frame
  Kill prefix = "TRG_Ped_TennisPlayer"
  PlaySkaterCamAnim skater = 0 stop
  skater:SetRollingFriction 1
  Create name = TRG_Ped_Playa05
  Create name = TRG_Ped_Playa06
  Create name = TRG_AI_TennisBall
  skater:EnablePlayerInput
  TRG_MG_TP_AnimControl:Sch_MG_Tennis_Judge
ENDSCRIPT

SCRIPT Sch_AddMinigame_Wires
  AddMinigame_Generic2 {
    CAREER_ONLY
    activate_script = sch_MG_wires_activate
    deactivate_script = sch_MG_wires_deactivate
  }
ENDSCRIPT

SCRIPT Sch_MG_Wires
  IF IsCareerMode
    IF not IsAlive name = TRG_MG_Wires01
      IF TriggerType TRIGGER_LIP_ON
        IF not GoalManager_HasActiveGoals
          GoalManager_DeactivateAllGoals
          Wait 1 frame
          GoalManager_ActivateGoal name = sch_goal_minigame_generic2
        ELSE
          PlaySound Sparks_11 vol = 150
        ENDIF
      ENDIF
    ENDIF
  ENDIF
ENDSCRIPT

SCRIPT SCH_MG_Wires_EndGame
  GoalManager_DeactivateGoal name = sch_goal_minigame_generic2
ENDSCRIPT

SCRIPT sch_MG_wires_activate
  Printf "activating the stuff"
  Create name = TRG_MG_Wires01
ENDSCRIPT

SCRIPT sch_MG_wires_deactivate
  Printf "deactivating the stuff"
  TRG_MG_Wires01:MG_Sch_WireRideEnd
ENDSCRIPT
