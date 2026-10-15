script Lon_Startup
  LoadSound "Terrains\GrindMetalOn"
  LoadSound "Shared\Hits\BonkBush" vol = 100 dropoff = 150
  LoadSound "Shared\Hits\FallPungee_11" vol = 70 pitch = 45 dropoff = 0
  LoadSound "Shared\Water\FallWater"
  LoadSound "Shared\Hits\HitGlassPane2x"
  LoadSound "Shared\Animal\ElephantBlast"
  LoadSound "Shared\Animal\ElephantDie"
  LoadSound "Skater\hitbody01"
  LoadSound "Skater\hitbody01a"
  LoadSound "Skater\hitbody02"
  LoadSound "Skater\hitbody03"
  LoadSound "Skater\hitbody04"
  LoadSound "Shared\Hits\SmashCake"
  LoadSound "Shared\Misc\LA_GratesOpen"
  LoadSound "Skater\bitchslap2"
  LoadSound "Skater\footstep01" vol = 150
  LoadSound "Skater\bail04"
  LoadSound "Shared\Hits\FallSand_11"
  LoadSound "Shared\Hits\HitCanFlag"
  LoadSound "Lon\PigeonFly" vol = 200
  LoadSound "Shared\Animal\Pigeon" vol = 200
  LoadSound "Shared\Hits\HitOrangeCone"
  LoadSound "Shared\Animal\StompyStep01"
  LoadSound "Shared\Animal\StompyStep02"
  LoadSound "Shared\Animal\StompyStep03"
  LoadSound "Shared\Animal\StompyStep04"
  LoadSound "Shared\Water\BigFountain_11" vol = 80 dropoff = 150 PosUpdate
  LoadSound "Shared\Water\TFountains_11" vol = 80 dropoff = 150 PosUpdate
  LoadSound "Lon\Wiresnap"
  LoadSound "Shared\Animal\Werewolf"
  LoadSound "Skater\ArmWhoosh01"
  LoadSound "Shared\Hits\HitMetalCan_11"
  LoadSound "Shared\Auto\CarBrakeSqueal" vol = 60 dropoff = 150 PosUpdate
  LoadSound "Shared\Auto\CarLoop" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "Shared\Auto\CarHorn_11" vol = 100 dropoff = 150
  LoadSound "Shared\Auto\LA_Skid_11" vol = 100 dropoff = 150
  LoadSound "Shared\Auto\UKBusEngineLoop" vol = 80 dropoff = 150 PosUpdateWithDoppler
  LoadSound "Shared\Auto\CycleAndSideCar" vol = 130 dropoff = 150 PosUpdateWithDoppler
  LoadSound "Shared\Auto\_4CylinderEngineLoop" vol = 90 dropoff = 150 PosUpdateWithDoppler
  Lon_CreateCars_Start
  if ( ( IsXBOX ) or ( IsNGC ) )
    Lon_CreateFountains
  else
    Create prefix = "TRG_Lon_PS2_Fountain"
  endif
endscript
script Lon_Goals
  if InMultiplayerGame
    add_multiplayer_mode_goals
  endif
  if not InSplitScreenGame
    if not GameModeEquals is_singlesession
      Lon_AddMinigame_Pimp
      AddGoal_HighScore {
        goal_text = Lon_HighScore_Text
        view_goals_text = Lon_HighScore_Text
        goal_description = Lon_HighScore_Desc
        score = Lon_HighScore_Score
        start_cam_anim = G_HS_CameraStart
        success_cam_anim = G_HS_CameraStart
        pro = "LonLocal1"
        full_name = "Cockney"
        reward_goal = Lon_Goal_ProScore
      }
      AddGoal_Skate {
        goal_text = "Collect the S-K-A-T-E letters"
        view_goals_text = "Collect the S-K-A-T-E letters"
        goal_description = Lon_SKATE_Desc
        start_cam_anim = G_SKATE_CameraStart
        success_cam_anim = G_SKATE_CameraSuccess
        pro = "LonLocal2"
        full_name = "The Ginger Man"
      }
      AddGoal_Combo {
        goal_text = "Collect the C-O-M-B-O letters"
        view_goals_text = "Collect the C-O-M-B-O letters"
        goal_description = Lon_Combo_Desc
        time = 30
        start_cam_anim = G_COMBO_CameraStart
        success_cam_anim = G_COMBO_CameraStart
        pro = "LonLocal3"
        full_name = "Bloke"
      }
      AddGoal_Trickspot4 {
        goal_text = "Wallride Tag 5 buses"
        view_goals_text = "Wallride Tag 5 buses"
        goal_description = Lon_Trickspot4_Desc
        goal_flags = [ got_1
          got_2
          got_3
          got_4
          got_5 ]
        goal_start_script = Lon_BusWallride_Start
        goal_deactivate_script = Lon_BusWallride_Deactivate
        start_cam_anim = G_TS4_CameraStart
        success_cam_anim = G_TS4_CameraStart
        pro = "Chad"
        full_name = "Chad Muska"
        use_hud_counter
        hud_counter_caption = "\nBuses"
        reward_goal = Lon_Goal_Special
        record_type = time
        CAREER_ONLY
      }
      AddGoal_Collect {
        goal_text = "Grab 5 Coppers hats.  Do a grab trick over them"
        view_goals_text = "Grab 5 Coppers hats"
        goal_description = Lon_Collect_Desc
        goal_flags = [ got_1
          got_2
          got_3
          got_4
          got_5 ]
        time = 90
        collect_type = "Copper Hats"
        goal_intro_script = Lon_CopperHat_Intro
        goal_deactivate_script = Lon_CopperHat_Deactivate
        start_cam_anim = G_COLLECT_CameraStart
        success_cam_anim = G_COLLECT_CameraSuccess
        pro = "Geoff"
        full_name = "Geoff Rowley"
        use_hud_counter
        hud_counter_caption = "\nHats"
        reward_goal = Lon_Goal_Gaps3
        record_type = time
        goal_ped_arrow_height = 300
        CAREER_ONLY
      }
      AddGoal_HighCombo {
        goal_text = Lon_HighCombo_Text
        view_goals_text = Lon_HighCombo_Text
        goal_description = Lon_HighCombo_Desc
        score = Lon_HighCombo_Score
        start_cam_anim = G_HighCombo_CameraStart
        success_cam_anim = G_HighCombo_CameraStart
        pro = "LonLocal4"
        full_name = "Local Skater"
        reward_goal = Lon_Goal_Tetris
        record_type = time
      }
      AddGoal_Trickspot2 {
        goal_text = "Rodney's flatland training"
        view_goals_text = "Rodney's flatland training"
        goal_description = Lon_Trickspot2_Desc
        goal_flags = [ got_1
          got_2
          got_3
          got_4 ]
        time = 80
        goal_start_script = Lon_FlatlandCombo_Start
        goal_deactivate_script = Lon_FlatlandCombo_Deactivate
        start_cam_anim = G_TS2_CameraStart
        success_cam_anim = G_TS2_CameraStart
        pro = "Rodney"
        full_name = "Rodney Mullen"
        reward_goal = [ Lon_Goal_Comp Lon_Goal_Tetris2 ]
        CAREER_ONLY
      }
      AddGoal_Trickspot {
        key_combos = [ Air_CircleUL ]
        goal_text = "Do a \t1\n ( \k1 )\n over both of the fountains"
        view_goals_text = "Do a \t1 over the fountains"
        goal_description = Lon_Trickspot_Desc
        goal_flags = [ got_1
          got_2 ]
        time = 60
        start_cam_anim = G_TS_CameraStart
        success_cam_anim = G_TS_CameraStart
        pro = "Photoguy"
        full_name = "Atiba Jefferson"
        proset_prefix = "ProSet2_"
        use_hud_counter
        hud_counter_caption = "\nFountains"
      }
      AddGoal_Trickspot3 {
        goal_text = "Race the Coppers around London"
        view_goals_text = "Race the Coppers around London"
        goal_description = Lon_Trickspot3_Desc
        goal_flags = [ got_1
          got_2 ]
        time = 120
        goal_intro_script = Lon_CopperBikeRace_Intro
        goal_start_script = Lon_CopperBikeRace_Start
        goal_deactivate_script = Lon_CopperBikeRace_Deactivate
        start_cam_anim = G_TS3_CameraStart
        success_cam_anim = G_TS3_CameraEnd
        pro = "LonLocal5"
        full_name = "Hooligan"
        record_type = time
        use_hud_counter
        hud_counter_caption = "\nLaps Completed"
        CAREER_ONLY
      }
      AddGoal_Gaps2 {
        goal_text = "Free Stompy! Destroy the traps"
        view_goals_text = "Free Stompy! Destroy the traps"
        goal_description = Lon_Gaps2_Desc
        goal_flags = [ got_1
          got_2
          got_3
          got_4 ]
        unlimited_time
        goal_intro_script = Lon_Stompy_Intro
        goal_start_movie_script = Lon_Stompy_Start_Movie
        goal_start_script = Lon_Stompy_Start
        goal_deactivate_script = Lon_Stompy_Deactivate
        start_cam_anim = G_GAP2_CameraStart
        success_cam_anim = G_GAP2_CameraSuccess
        no_play_hold
        pro = "ProtLead"
        full_name = "Elephant Lover"
        use_hud_counter
        hud_counter_caption = "\nTraps"
        goal_ped_arrow_height = 145
        CAREER_ONLY
      }
      AddGoal_ProScore {
        goal_text = Lon_ProScore_Text
        view_goals_text = Lon_ProScore_Text
        goal_description = Lon_ProScore_Desc
        score = Lon_ProScore_Score
        start_cam_anim = G_PS_CameraStart
        success_cam_anim = G_PS_CameraStart
        pro = "LonLocal1"
        full_name = "Cockney"
        unlocked_by_another
      }
      AddGoal_Special {
        goal_text = "Ghetto Tag\n ( \k1 )\n the SB light line"
        view_goals_text = "Ghetto Tag the SB light line"
        goal_description = Lon_Special_Desc
        start_cam_anim = G_SPECIAL_CameraStart
        success_cam_anim = G_SPECIAL_CameraEnd
        pro = "Chad"
        full_name = "Chad Muska"
        trick_name = Trick_SprayPaintGrind
        trick_type = grind
        special_gap
        proset_prefix = "ProSet4_"
        reward_trickslot
        unlocked_by_another
        CAREER_ONLY
      }
      AddGoal_Gaps3 {
        goal_text = "Skitch the Police bike. Dodge with (\be or \bf)"
        view_goals_text = "Skitch the Police Bike"
        goal_description = Lon_Gaps3_Desc
        goal_flags = [ got_1 ]
        unlimited_time
        goal_intro_script = Lon_CopperBike_Intro
        goal_deactivate_script = Lon_CopperBike_Deactivate
        start_cam_anim = G_GAP3_CameraStart
        success_cam_anim = G_GAP3_CameraSuccess
        pro = "Geoff"
        full_name = "Geoff Rowley"
        unlocked_by_another
        record_type = none
        CAREER_ONLY
      }
      AddGoal_Tetris {
        goal_text = "Nail the combos as they come up"
        view_goals_text = "Nail the combos as they come up"
        goal_description = Lon_Tetris_Desc
        time = 60
        combo
        combo_size = 2
        goal_start_script = Lon_Tetris_Start
        start_cam_anim = G_TETRIS_CameraStart
        success_cam_anim = G_TETRIS_CameraStart
        pro = "LonLocal4"
        full_name = "Local Skater"
        goal_tetris_key_combos = [
          Air_CircleU
          Air_CircleD
          Air_CircleL
          Air_CircleR
          Air_CircleUL
          Air_CircleUR
          Air_CircleDL
          Air_CircleDR
          Air_SquareU
          Air_SquareD
          Air_SquareL
          Air_SquareR
          Air_SquareUL
          Air_SquareUR
          Air_SquareDL
          Air_SquareDR
        ]
        time_to_stop_adding_tricks = 7
        Trick_time = 7000
        Max_tricks = 10
        acceleration_interval = 6
        acceleration_percent = 0.1
        kill_radius = 180
        unlocked_by_another
      }
      AddGoal_Tetris2 {
        goal_text = "Land the Flatland tricks as they appear"
        view_goals_text = "Land the Flatland tricks as they appear"
        goal_description = Lon_Tetris2_Desc
        time = 60
        start_cam_anim = G_TETRIS2_CameraStart
        success_cam_anim = G_TETRIS2_CameraStart
        pro = "Rodney"
        full_name = "Rodney Mullen"
        goal_tetris_tricks = [
          { trick = "Pogo" key_combo = "\b0 + \b0" text = "Pogo" }
          { trick = "Truckstand" key_combo = "\b0 + \b1" text = "Truckstand" }
          { trick = "To Rail" key_combo = "\b2 + \b1" text = "To Rail" }
          { trick = "Switch Foot Pogo" key_combo = "\b0 + \b2" text = "Switch Foot Pogo" }
          { trick = "Casper" key_combo = "\b1 + \b0" text = "Casper" }
          { trick = "Anti Casper" key_combo = "\b1 + \b2" text = "Anti Casper" }
          { trick = "Handstand" key_combo = "\b2 + \b2" text = "Handstand" }
        ]
        time_to_stop_adding_tricks = 7
        Trick_time = 6000
        acceleration_interval = 5
        acceleration_percent = 0.1
        kill_radius = 180
        unlocked_by_another
      }
      AddGoal_Competition {
        goal_text = "Medal in the Competition"
        view_goals_text = "Medal in the Competition"
        goal_description = Lon_Comp_Desc
        start_cam_anim = G_COMP_CameraStart
        success_cam_anim = G_COMP_CameraStart
        pro = "Judge"
        full_name = "Competition Judge"
        goal_intro_script = Lon_Goal_Comp_Intro
        goal_deactivate_script = Lon_Goal_Comp_Deactivate
        gold = 95
        silver = 85
        bronze = 70
        time = 60
        gold_score = Lon_Comp_Gold_Score
        silver_score = Lon_Comp_Silver_Score
        bronze_score = Lon_Comp_Bronze_Score
        bail = 7
        unlocked_by_another
        CAREER_ONLY
      }
      AddGoal_SickScore {
        goal_text = Lon_SickScore_Text
        view_goals_text = Lon_SickScore_Text
        goal_description = Lon_SickScore_Desc
        score = Lon_SickScore_Score
        start_cam_anim = G_SS_CameraStart
        success_cam_anim = G_SS_CameraStart
        pro = "LonLocal5"
        full_name = "Hooligan"
        pro_goal
      }
      AddGoal_ProCombo {
        goal_text = "Get the C-O-M-B-O letters in one combo"
        goal_description = Lon_ProCombo_Desc
        time = 30
        start_cam_anim = G_PROLINE_CameraStart
        success_cam_anim = G_PROLINE_CameraStart
        pro = "LonLocal3"
        full_name = "Bloke"
        proset_prefix = "ProSet1_"
        pro_goal
      }
      AddGoal_Horse {
        goal_text = "Beat Muska's best 6 Combos"
        view_goals_text = "Beat Muska's best 6 Combos"
        current_goal_text = "Beat my combo"
        goal_description = Lon_Horse_Desc
        start_cam_anim = G_Horse_CameraStart
        success_cam_anim = G_Horse_CameraStart
        pro = "Chad"
        full_name = "Chad Muska"
        goal_flags = [ got_1
          got_2
          got_3
          got_4
          got_5
          got_6 ]
        horse_spots = [ { id = TRG_G_HORSE_Spot01 scr = lon_horse_spot01 flag = got_1 score = Lon_Horse_Score1 time = 30 }
          { id = TRG_G_HORSE_Spot02 scr = lon_horse_spot02 flag = got_2 score = Lon_Horse_Score2 time = 30 }
          { id = TRG_G_HORSE_Spot03 scr = lon_horse_spot03 flag = got_3 score = Lon_Horse_Score3 time = 30 }
          { id = TRG_G_HORSE_Spot04 scr = lon_horse_spot04 flag = got_4 score = Lon_Horse_Score4 time = 30 }
          { id = TRG_G_HORSE_Spot05 scr = lon_horse_spot05 flag = got_5 score = Lon_Horse_Score5 time = 30 }
          { id = TRG_G_HORSE_Spot06 scr = lon_horse_spot06 flag = got_6 score = Lon_Horse_Score6 time = 30 } ]
        pro_goal
      }
      AddGoal_Gaps {
        goal_text = "Grind the American cars in one combo, in order"
        view_goals_text = "Grind American cars for Parking Guy"
        goal_description = Lon_Gaps_Desc
        unlimited_time
        goal_flags = [ got_1
          got_2
          got_3
          got_4 ]
        unlimited_time
        goal_intro_script = Lon_ParkingNazi_Intro
        goal_deactivate_script = Lon_ParkingNazi_Deactivate
        start_cam_anim = G_GAP_CameraStart
        success_cam_anim = G_GAP_CameraSuccess
        use_hud_counter
        hud_counter_caption = "\nAmerican Cars"
        pro = "ParkingAtt"
        full_name = "Parking Attendant"
        pro_goal
        goal_ped_arrow_height = 135
        CAREER_ONLY
      }
      AddGoal_Kill {
        goal_text = "Trick on every object in the Southbank"
        view_goals_text = "Trick on every object in the Southbank"
        goal_description = Lon_Kill_Desc
        start_cam_anim = G_KILL_CameraStart
        success_cam_anim = G_KILL_CameraStart
        goal_start_script = Lon_Kill_Start
        use_hud_counter
        hud_counter_caption = "\nTrickObs"
        pro = "Geoff"
        full_name = "Geoff Rowley"
        score = Lon_Kill_Score
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
          got_23
          got_24
          got_25
          got_26
          got_27
          got_28
          got_29
          got_30
          got_31
          got_32
          got_33
          got_34
          got_35
          got_36
          got_37
          got_38
          got_39
          got_40
          got_41
          got_42
          got_43
          got_44
          got_45
          got_46
          got_47
          got_48
          got_49
          got_50
          got_51
          got_52
          got_53
          got_54
          got_55 ]
        num_flags_to_win = 40
        kill_clusters = [ { id = Lon_SB_FountainBlock01 flag = got_1 }
          { id = Lon_SB_FountainBlock02 flag = got_2 }
          { id = Lon_SB_FountainBlock03 flag = got_3 }
          { id = Lon_SB_UnderBridge_Ledge02 flag = got_4 }
          { id = Lon_SB_Rails01 flag = got_5 }
          { id = Lon_SB_Rails02 flag = got_6 }
          { id = Lon_SB_Rail01 flag = got_7 }
          { id = Lon_SB_QP03 flag = got_8 }
          { id = Lon_SB_QP02 flag = got_9 }
          { id = Lon_SB_QP01 flag = got_10 }
          { id = Lon_SD_RiverSide04_Rail flag = got_11 }
          { id = Lon_SB_QEBuild_Railing02 flag = got_12 }
          { id = Lon_SB_QEBuild_Railing20 flag = got_13 }
          { id = Lon_SB_QEBuild_Railing19 flag = got_14 }
          { id = Lon_SB_Wire05 flag = got_15 }
          { id = Lon_SB_QEBuild_Railing16 flag = got_16 }
          { id = Lon_SD_RiverSide01_Rail flag = got_17 }
          { id = Lon_SD_RiverSide08_Rail flag = got_18 }
          { id = Lon_SB_Wire16 flag = got_19 }
          { id = Lon_SD_RiverSide01_Rail2 flag = got_20 }
          { id = Lon_SB_QEBuild_QP06 flag = got_21 }
          { id = Lon_SB_QP06 flag = got_22 }
          { id = Lon_SB_UnderBridge_Ledge01 flag = got_23 }
          { id = Lon_SB_QP07 flag = got_24 }
          { id = Lon_SB_QEBuild_Ledges01 flag = got_25 }
          { id = Lon_SB_Bench02 flag = got_26 }
          { id = Lon_SD_RiverSide13a_Rail2 flag = got_27 }
          { id = Lon_SD_RiverSide13a_Rail flag = got_28 }
          { id = Lon_SB_BridgeX01_QP01 flag = got_29 }
          { id = Lon_SB_BridgeX01_QP02 flag = got_30 }
          { id = Lon_SB_Bridge01_Ledge01 flag = got_31 }
          { id = Lon_SB_Bridge01_Ledge02 flag = got_32 }
          { id = Lon_SB_Ledge01 flag = got_33 }
          { id = Lon_SB_Ledge02 flag = got_34 }
          { id = Lon_SB_QEBuild_QP07 flag = got_35 }
          { id = Lon_SB_QEBuild_Walkway_Ledge01 flag = got_36 }
          { id = Lon_SAHouse_Railing01 flag = got_37 }
          { id = Lon_SB_QEBuild_Railing03 flag = got_38 }
          { id = Lon_SB_QEBuild_Railing21 flag = got_39 }
          { id = Lon_SB_QEBuild_QP04 flag = got_40 }
          { id = Lon_SB_QEBuild_QP01 flag = got_41 }
          { id = Lon_SB_QEBuild_QP02 flag = got_42 }
          { id = Lon_SB_Build02_Ledge flag = got_43 }
          { id = Lon_SB_QP08 flag = got_44 }
          { id = Lon_SB_QP10 flag = got_45 }
          { id = PROSET4_Spine01 flag = got_46 }
          { id = PROSET3_QP01 flag = got_47 }
          { id = Lon_SB_RiverSide37_Rail flag = got_48 }
          { id = Lon_SB_Build03_Railing01 flag = got_49 }
          { id = Lon_SB_Bridge_Railing flag = got_50 }
          { id = Lon_SB_Bridge_Railing01 flag = got_51 }
          { id = Lon_SB_Build03a flag = got_52 }
          { id = Lon_SB_QP05 flag = got_53 }
          { id = Lon_SB_Build03_Ledge flag = got_54 }
          { id = Lon_SB_Build02_Ledge flag = got_55 } ]
        pro_goal
      }
      AddGoal_Trickspot5 {
        goal_text = "Gap over the sreet and land a \t1\n (\k1)\n to a FS Nosegrind\n (\b7 + \b0)\n on the rail"
        view_goals_text = "Rowley's Pro Specific Challenge"
        goal_description = Lon_Trickspot5_Desc
        start_cam_anim = G_TS5_CameraStart
        success_cam_anim = G_TS5_CameraStart
        pro_specific_challenge
        pro_challenge_title = "Flip-Gap-Grind"
        pro_challenge_text = "Watch 'Sorry', the latest Flip video, and you'll see what Geoff's all about. It's not enough to grind a sickening handrail - you've also got to flip into it, or clear some sketchy gap to get to it. The lesson is clear: Geoff destroys everything he skates."
        pro_challenge_tag_line = "Three spots - kill them all."
        pro_challenge_pro_name = "Geoff"
        time = 180
        pro = "PhotoGuy"
        full_name = "Atiba Jefferson"
        goal_flags = [ got_01
          got_02
          got_03
          got_04
          got_05
          got_06
          got_07
          got_08
          got_09 ]
        goal_start_script = Lon_RowleyPro_Start
        goal_deactivate_script = Lon_RowleyPro_Deactivate
        proset_prefix = "ProSet3_"
        key_combos = [
          Air_SquareU
          Air_SquareUR
          Air_SquareUL ]
        required_tricks = [
          Trick_RowleyDarkSlide
          Trick_AirCasperFlip
          Trick_Kickflip ]
        unlocked_by_another
        record_type = time
        use_hud_counter
        hud_counter_caption = "\nInsane Grinds"
        CAREER_ONLY
      }
    endif
  endif
endscript
script Lon_Kill_Start
endscript
FLAG_LON_TRAFFICLIGHT_GREEN = 0
FLAG_LON_TRAFFICLIGHT_YELLOW = 1
FLAG_LON_TRAFFICLIGHT_RED = 2
FLAG_LON_CRAZYCOPPER_SLAP = 3
FLAG_LON_REVERBON = 0
script Lon_CreateFountains
  Create prefix = "TRG_Lon_Fountain"
endscript
script Lon_KillCars
  Printf "### KILLING CARS ###"
  KillSpawnedScript name = Lon_CreateCars
  KillSpawnedScript name = Lon_CarCreate_Wait
  Kill prefix = "TRG_Lon_Car_AdArch"
  Kill prefix = "TRG_Lon_Car_Traf"
  Kill prefix = "TRG_Lon_Car_BigPath"
endscript
script Lon_CreateCars
  Create name = TRG_Lon_Car_AdArch_Car01
  Create name = TRG_Lon_Car_BigPath1_Car01
  SpawnScript Lon_CarCreate_Wait params = { Wait = 5 name = TRG_Lon_Car_TrafPath1_Car04 }
  SpawnScript Lon_CarCreate_Wait params = { Wait = 10 name = TRG_Lon_Car_BigPath1_Car03 }
endscript
script Lon_CreateCars_Start
  Lon_KillCars
  Create name = TRG_Lon_Car_AdArch_Car04
  Create name = TRG_Lon_Car_BigPath1_Car01
  Create name = TRG_Lon_Car_TrafPath1_Car03
  SpawnScript Lon_CarCreate_Wait params = { Wait = 10 name = TRG_Lon_Car_BigPath1_Car03 }
endscript
script Lon_CarCreate_Wait
  Wait <Wait> seconds
  Create name = <name>
endscript
script Lon_CarTraf01
  Car_Generic01 DefaultSpeed = 30 <...>
  Obj_WaitMove
  Die
endscript
script Lon_CarBridge01
  Car_Generic01 DefaultSpeed = 30 <...>
  Obj_WaitMove
  Wait randomrange(30, 90)
  if GotParam car01
    Create name = TRG_Lon_Car_BigPath1_Car02
  endif
  if GotParam car02
    Create name = TRG_Lon_Car_BigPath1_Car01
  endif
  if GotParam car03
    Create name = TRG_Lon_Car_BigPath1_Car04
  endif
  if GotParam car04
    Create name = TRG_Lon_Car_BigPath1_Car03
  endif
  Die
endscript
script Lon_CarAdArch01
  Car_Generic01 DefaultSpeed = 30 <...>
  Obj_WaitMove
  Wait randomrange(30, 90)
  if GotParam car01
    Create name = TRG_Lon_Car_AdArch_Car02
  endif
  if GotParam car02
    Create name = TRG_Lon_Car_AdArch_Car01
  endif
  if GotParam car03
    Create name = TRG_Lon_Car_AdArch_Car04
  endif
  if GotParam car04
    Create name = TRG_Lon_Car_AdArch_Car03
  endif
  Die
endscript
script Lon_TrafficLight01
  Obj_SetFlag FLAG_LON_TRAFFICLIGHT_GREEN
  Create name = Lon_TrafficLight01_Green
  Create name = Lon_TrafficLight02_Red
  Wait randomrange(5000, 12000)
  begin
    Obj_SetFlag FLAG_LON_TRAFFICLIGHT_YELLOW
    Obj_ClearFlag FLAG_LON_TRAFFICLIGHT_GREEN
    Kill name = Lon_TrafficLight01_Green
    Create name = Lon_TrafficLight01_Yellow
    Wait 3000
    Obj_SetFlag FLAG_LON_TRAFFICLIGHT_RED
    Obj_ClearFlag FLAG_LON_TRAFFICLIGHT_YELLOW
    Kill name = Lon_TrafficLight01_Yellow
    Create name = Lon_TrafficLight01_Red
    Kill name = Lon_TrafficLight02_Red
    Create name = Lon_TrafficLight02_Green
    Wait randomrange(9000, 15000)
    Kill name = Lon_TrafficLight02_Green
    Create name = Lon_TrafficLight02_Yellow
    Wait 3000
    Obj_SetFlag FLAG_LON_TRAFFICLIGHT_GREEN
    Obj_ClearFlag FLAG_LON_TRAFFICLIGHT_RED
    Kill name = Lon_TrafficLight01_Red
    Create name = Lon_TrafficLight01_Green
    Kill name = Lon_TrafficLight02_Yellow
    Create name = Lon_TrafficLight02_Red
    Wait randomrange(7000, 12000)
  repeat
endscript
script FountainPlant
  ClearExceptions
  InAirExceptions
  ClearException Carplant
  PlaySound FallWater random( @pitch = 80 @pitch = 90 @pitch = 85 ) 
  Obj_SpawnScript CarSparks
  DoCarPlantBoost
  SetTrickName "Fountain Plant"
  SetTrickScore 500
  Display
  if DoingTrick
  else
    PlayAnim Anim = Beanplant BlendPeriod = 0.3
    WaitAnimWhilstChecking
    Goto Airborne
  endif
endscript
script lon_horse_spot01
  create_panel_block id = current_horse_spot text = Lon_Horse_Score1_Text style = panel_message_new_horse_spot
endscript
script lon_horse_spot02
  create_panel_block id = current_horse_spot text = Lon_Horse_Score2_Text style = panel_message_new_horse_spot
endscript
script lon_horse_spot03
  create_panel_block id = current_horse_spot text = Lon_Horse_Score3_Text style = panel_message_new_horse_spot
endscript
script lon_horse_spot04
  create_panel_block id = current_horse_spot text = Lon_Horse_Score4_Text style = panel_message_new_horse_spot
endscript
script lon_horse_spot05
  create_panel_block id = current_horse_spot text = Lon_Horse_Score5_Text style = panel_message_new_horse_spot
endscript
script lon_horse_spot06
  create_panel_block id = current_horse_spot text = Lon_Horse_Score6_Text style = panel_message_new_horse_spot
endscript
script Lon_Goal_TrickSpot_got_1
  if GoalManager_GoalIsActive name = lon_goal_trickspot
    if GoalManager_SetGoalFlag name = lon_goal_trickspot got_1 1
    endif
  endif
endscript
script Lon_Goal_TrickSpot_got_2
  if GoalManager_GoalIsActive name = lon_goal_trickspot
    if GoalManager_SetGoalFlag name = lon_goal_trickspot got_2 1
    endif
  endif
endscript
script Lon_Goal_Special
  if GoalManager_GoalIsActive name = Lon_Goal_Special
    GoalManager_WinGoal name = Lon_Goal_Special
  endif
endscript
FLAG_LON_ELE_DRIVERSLAP = 0
FLAG_LON_ELE_GATEOPEN = 1
FLAG_LON_ELE_DRIVERTALK = 2
FLAG_LON_ELE_DRIVERSTOMP = 3
FLAG_LON_ELE_STOMPLAND = 4
FLAG_LON_ELE_CAMFRONT = 5
FLAG_LON_ELE_CAMBACK = 6
FLAG_LON_ELE_INTROFINISHED = 7
FLAG_LON_ELE_SPEECHSKIPPED = 8
FLAG_LON_ELE_CLOCK = 9
FLAG_LON_ELE_CLOSEDOOR = 10
FLAG_LON_ELE_NETTINGA_LEFT = 0
FLAG_LON_ELE_NETTINGA_RIGHT = 1
FLAG_LON_ELE_NETTINGB_LEFT = 2
FLAG_LON_ELE_NETTINGB_RIGHT = 3
FLAG_LON_ELE_NETTINGC_LEFT = 4
FLAG_LON_ELE_NETTINGC_RIGHT = 5
FLAG_LON_ELE_NETTINGD_LEFT = 6
FLAG_LON_ELE_NETTINGD_RIGHT = 7
script Lon_Stompy_Intro
  Printf "### stompy intro called ###"
  SpawnScript Lon_KillCars
  KillSpawnedScript id = Lon_StompyScripts
  ClearFlag FLAG_LON_ELE_NETTINGA_LEFT name = TRG_G_GAP2_Pro
  ClearFlag FLAG_LON_ELE_NETTINGA_RIGHT name = TRG_G_GAP2_Pro
  ClearFlag FLAG_LON_ELE_NETTINGB_LEFT name = TRG_G_GAP2_Pro
  ClearFlag FLAG_LON_ELE_NETTINGB_RIGHT name = TRG_G_GAP2_Pro
  ClearFlag FLAG_LON_ELE_NETTINGC_LEFT name = TRG_G_GAP2_Pro
  ClearFlag FLAG_LON_ELE_NETTINGC_RIGHT name = TRG_G_GAP2_Pro
  ClearFlag FLAG_LON_ELE_NETTINGD_LEFT name = TRG_G_GAP2_Pro
  ClearFlag FLAG_LON_ELE_NETTINGD_RIGHT name = TRG_G_GAP2_Pro
  SpawnScript Lon_Stompy_NettingA_Break id = Lon_StompyScripts
  SpawnScript Lon_Stompy_NettingB_Break id = Lon_StompyScripts
  SpawnScript Lon_Stompy_NettingC_Break id = Lon_StompyScripts
  SpawnScript Lon_Stompy_NettingD_Break id = Lon_StompyScripts
  if IsAlive name = TRG_Lon_Elephant01
    TRG_Lon_Elephant01:Die
  endif
  if IsAlive name = TRG_Lon_Elephant01a
    TRG_Lon_Elephant01a:Die
  endif
  if IsAlive name = TRG_Lon_ElephantCollision
    TRG_Lon_ElephantCollision:Die
  endif
  Kill prefix = "Lon_Stompy_Free"
  Kill prefix = "TRG_Lon_Stompy_Free"
  Kill prefix = "Lon_Stompy_Netting"
  Kill prefix = "TRG_Lon_Stompy_Netting"
  Create name = TRG_Lon_Elephant01a
  Printf "creating ele"
  Create name = TRG_Lon_ElephantCollision
  Create prefix = "Lon_Stompy_Netting_"
  Create prefix = "TRG_Lon_Stompy_Netting_"
endscript
script Lon_Stompy_Start
  SetFlag flag = FLAG_LON_ELE_SPEECHSKIPPED
  if not GetFlag flag = FLAG_LON_ELE_INTROFINISHED
  Wait 1 frame
  SpawnScript Lon_Stompy_SkipIntro_activate
  endif
endscript
script Lon_Stompy_Start_Movie
  Printf "### stompy start movie called ###"
  if IsAlive name = TRG_Lon_Elephant01
    TRG_Lon_Elephant01:Die
  endif
  if IsAlive name = TRG_Lon_Elephant01a
    TRG_Lon_Elephant01a:Die
  endif
  SpawnScript Lon_Stompy_CheckIntro
  PlaySkaterCamAnim skater = 0 name = G_GAP2_CameraStart skippable = 0 exitscript = Lon_Stompy_Cam_FollowTruck
  PlaySkaterCamAnim skater = 0 name = Lon_Cam_Stompy_FollowTruck skippable = 0 exitscript = Lon_Stompy_Cam_FrontTruck
  PlaySkaterCamAnim skater = 0 name = Lon_Cam_Stompy_FrontTruck skippable = 0 exitscript = Lon_Stompy_Cam_BackTruck
  PlaySkaterCamAnim skater = 0 name = Lon_Cam_Stompy_BehindTruck skippable = 0
  PlaySkaterCamAnim skater = 0 name = Lon_Cam_Stompy_Zoo01 skippable = 0
  PlaySkaterCamAnim skater = 0 name = Lon_Cam_Stompy_Zoo02 skippable = 0
  PlaySkaterCamAnim skater = 0 name = Lon_Cam_Stompy_Zoo03 skippable = 0
  PlaySkaterCamAnim skater = 0 name = Lon_Cam_Stompy_Zoo04 skippable = 0 exitscript = Lon_Stompy_Cam_Finished
endscript
script Lon_Stompy_Deactivate
  Printf "### stompy deact called ###"
  MakeSkaterGoto SkaterInit
  KillSkaterCamAnim name = G_GAP2_CameraStart
  KillSkaterCamAnim name = Lon_Cam_Stompy_FollowTruck
  KillSkaterCamAnim name = Lon_Cam_Stompy_FrontTruck
  KillSkaterCamAnim name = Lon_Cam_Stompy_BehindTruck
  KillSkaterCamAnim name = Lon_Cam_Stompy_Zoo01
  KillSkaterCamAnim name = Lon_Cam_Stompy_Zoo02
  KillSkaterCamAnim name = Lon_Cam_Stompy_Zoo03
  KillSkaterCamAnim name = Lon_Cam_Stompy_Zoo04
  KillSpawnedScript id = Lon_StompyScripts
  KillSpawnedScript name = Lon_Stompy_CheckIntro
  UnSetFlag flag = FLAG_LON_ELE_INTROFINISHED
  UnSetFlag flag = FLAG_LON_ELE_SPEECHSKIPPED
  if IsAlive name = TRG_Lon_Elephant01
    TRG_Lon_Elephant01:Die
  endif
  if IsAlive name = TRG_Lon_Elephant01a
    TRG_Lon_Elephant01a:Die
  endif
  Kill name = TRG_Lon_ElephantCollision
  Kill prefix = "Lon_Stompy_Free"
  Kill prefix = "TRG_Lon_Stompy_Free"
  Kill prefix = "Lon_Stompy_Netting"
  Kill prefix = "TRG_Lon_Stompy_Netting"
  SpawnScript Lon_CreateCars
endscript
script Lon_Stompy_Win
  Kill prefix = "TRG_Lon_Stompy_Prot_Picket"
  Create prefix = "TRG_Lon_Stompy_Win"
  SpawnScript Lon_Stompy_WinFrig
endscript
script Lon_Stompy_WinFrig
  Wait 4 seconds
  Kill prefix = "TRG_Lon_Stompy_Win"
endscript
script Lon_Stompy_Cam_FollowTruck
  Create name = TRG_Lon_Elephant01
  Create prefix = "Lon_Stompy_Free_"
  Create prefix = "TRG_Lon_Stompy_Free_"
endscript
script Lon_Stompy_Cam_FrontTruck
  SendFlag name = TRG_Lon_Stompy_Free_Sneaky FLAG_LON_ELE_CAMFRONT
endscript
script Lon_Stompy_Cam_BackTruck
  SendFlag name = TRG_Lon_Stompy_Free_Sneaky FLAG_LON_ELE_CAMBACK
endscript
script Lon_Stompy_Cam_Finished
  SetFlag flag = FLAG_LON_ELE_INTROFINISHED
  Lon_Stompy_Intro
endscript
script Lon_Stompy_CheckIntro
  begin
    skater:DisablePlayerInput
    skater:SetRollingFriction 10000
    if ( ( GetFlag flag = FLAG_LON_ELE_INTROFINISHED ) and ( GetFlag flag = FLAG_LON_ELE_SPEECHSKIPPED ) )
      Printf "### enable player input ###"
      MakeSkaterGoto SkaterInit
      break
    endif
    Wait 1 frame
  repeat
  UnSetFlag flag = FLAG_LON_ELE_SPEECHSKIPPED
endscript
script Lon_Stompy_SkipIntro_activate
  speech_box_exit
  KillSpawnedScript Lon_Stompy_Start_Movie
  KillSpawnedScript Lon_Stompy_CheckIntro
  KillSkaterCamAnim name = G_GAP2_CameraStart
  KillSkaterCamAnim name = Lon_Cam_Stompy_FollowTruck
  KillSkaterCamAnim name = Lon_Cam_Stompy_FrontTruck
  KillSkaterCamAnim name = Lon_Cam_Stompy_BehindTruck
  KillSkaterCamAnim name = Lon_Cam_Stompy_Zoo01
  KillSkaterCamAnim name = Lon_Cam_Stompy_Zoo02
  KillSkaterCamAnim name = Lon_Cam_Stompy_Zoo03
  KillSkaterCamAnim name = Lon_Cam_Stompy_Zoo04
  wait 1 frame
  PlaySkaterCamAnim Skater = 0 stop
  KillSkaterCamAnim skaterId = 0
  KillSkater
  MakeSkaterGoto SkaterInit
  SetFlag flag = FLAG_LON_ELE_INTROFINISHED
endscript
script Lon_Stompy
  Obj_ShadowOff
  Obj_MoveToLink speed = 30
  Obj_SetGroundOffset 6
  Obj_PlayAnim Anim = Lying cycle
  Obj_ApplyScaling x = 1.5 y = 1.5 z = 1.5
  begin
    Wait 1 frame
    if Obj_FlagSet FLAG_LON_ELE_GATEOPEN
      PlaySound ElephantBlast
      Obj_CycleAnim Anim = LyingToIdle to = 30
      Obj_PlayAnim Anim = Rearing from = start to = 94 BlendPeriod = 0.3
      Obj_WaitAnimFinished
      SendFlag name = TRG_Lon_Stompy_Free_ElephantTruck_Bed FLAG_LON_ELE_STOMPLAND
      SendFlag name = TRG_Lon_Stompy_Free_ElephantTruck_Gate FLAG_LON_ELE_STOMPLAND
      Obj_MoveToRelPos (0, -7, 0) time = 0.1
      Obj_WaitMove
      PlaySound StompyStep01 pitch = 100 vol = 180 dropoff = 5
      PlaySound StompyStep01 pitch = 40 vol = 200 dropoff = 5
      PlaySound LA_GratesOpen pitch = 80
      Obj_PlayAnim Anim = Rearing from = 95 to = end
      Obj_MoveToRelPos (0, 7, 0) time = 0.1
      Obj_WaitAnimFinished
      break
    endif
  repeat
endscript
script Lon_StompyA
  Obj_SetPathTurnDist 35
  Obj_SetPathVelocity 15
  Obj_SetPathAcceleration 30
  Obj_SetPathDeceleration 30
  Obj_FollowPathLinked
  Obj_SetGroundOffset 0
  Obj_StickToGround on DistAbove = 6 DistBelow = 6
  begin
    Obj_PlaySound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim Anim = run from = start to = 13
    Obj_PlaySound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim Anim = run from = 14 to = 26
    Obj_PlaySound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim Anim = run from = 27 to = 42
    Obj_PlaySound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim Anim = run from = 43 to = end
  repeat
endscript
script Lon_Stompy_Sneaky
  Obj_PlayAnim Anim = Ped_Prot_WallCreep cycle
  begin
    if Obj_FlagSet FLAG_LON_ELE_CAMFRONT
      Obj_MoveToNode name = TRG_Lon_Ele_Way04 speed = 1
      break
    endif
    Wait 1 frame
  repeat
  begin
    if Obj_FlagSet FLAG_LON_ELE_DRIVERTALK
      Obj_CycleAnim Anim = Ped_Prot_CrouchToIdle
      Obj_PlayAnim Anim = Ped_M_Run cycle
      Obj_LookAtNode name = TRG_Lon_Ele_Way01
      Obj_MoveToNode name = TRG_Lon_Ele_Way01 speed = 10
      break
    endif
    Wait 1 frames
  repeat
  begin
    if Obj_FlagSet FLAG_LON_ELE_CAMBACK
      Obj_MoveToNode name = TRG_Lon_Ele_Way05
      Obj_WaitMove
      Obj_LookAtNode name = TRG_Lon_Ele_Way02
      Obj_MoveToNode name = TRG_Lon_Ele_Way02 speed = 10
      Obj_WaitMove
      Obj_LookAtNode name = TRG_Lon_Ele_Way06
      Obj_CycleAnim Anim = Ped_Prot_UnlockGate from = start to = 60
      SendFlag name = TRG_Lon_Elephant01 FLAG_LON_ELE_GATEOPEN
      SendFlag name = TRG_Lon_Stompy_Free_ElephantTruck_Gate FLAG_LON_ELE_GATEOPEN
      Obj_CycleAnim Anim = Ped_Prot_UnlockGate from = 61 to = end
      break
    endif
    Wait 1 frame
  repeat
  begin
    random( @Obj_CycleAnim Anim = Ped_M_Cheering
    @Obj_CycleAnim Anim = Ped_M_Clap
    @Obj_CycleAnim Anim = Ped_M_ShakeFist ) 
  repeat
endscript
script Lon_Stompy_Helpy
  Obj_PlayAnim Anim = Ped_SG_Shout cycle
  begin
    Wait 1 frame
    if Obj_FlagSet FLAG_LON_ELE_DRIVERTALK
      Obj_PlayAnim Anim = Ped_M_Punch
      Wait 20 frames
      SendFlag name = TRG_Lon_Stompy_FreeNotStart_TruckDriver FLAG_LON_ELE_DRIVERSLAP
      break
    endif
  repeat
  Wait 20 frames
  begin
    Obj_CycleAnim Anim = Ped_M_JumpForward from = 20 to = 45
    SendFlag name = TRG_Lon_Stompy_FreeNotStart_TruckDriver FLAG_LON_ELE_DRIVERSTOMP
    random( @PlaySound HitBody01
    @PlaySound HitBody01a
    @PlaySound HitBody02
    @PlaySound HitBody03
    @PlaySound HitBody04 ) 
    Obj_CycleAnim Anim = Ped_M_JumpForward from = 46 to = 65
    Wait randomrange(5, 20) frames
  repeat 4
endscript
script Lon_Stompy_Driver
  Obj_CycleAnim Anim = Ped_Prot_GetOutTruck from = start to = 280 speed = 1.8
  SendFlag name = TRG_Lon_Stompy_Free_ElephantTruck_Door FLAG_LON_ELE_CLOSEDOOR
  Wait 20 frames
  Obj_MoveToNode name = TRG_Lon_ElephantPed_Waypoint02 speed = 8 acceleration = 1
  Obj_PlayAnim Anim = Ped_M_Run cycle
  Obj_WaitMove
  Obj_PlayAnim Anim = Idle cycle
  SendFlag name = TRG_Lon_Stompy_Free_Helpy FLAG_LON_ELE_DRIVERTALK
  begin
    Wait 1 frame
    if Obj_FlagSet FLAG_LON_ELE_DRIVERSLAP
      PlaySound BitchSlap2
      Obj_PlayAnim Anim = Ped_M_FalldownA
      SendFlag name = TRG_Lon_Stompy_Free_Sneaky FLAG_LON_ELE_DRIVERTALK
      break
    endif
  repeat
  begin
    Wait 1 frame
    if Obj_FlagSet FLAG_LON_ELE_DRIVERSTOMP
      Obj_ClearFlag FLAG_LON_ELE_DRIVERSTOMP
      Obj_PlayAnim Anim = Spasmodic from = 40 to = end
    endif
  repeat
endscript
script Lon_Stompy_ElephantTruck
  Obj_PlaySound carloop vol = 250
  Obj_MoveToLink speed = 30
  Obj_WaitMove
  Obj_StopSound carloop
  Obj_PlaySound CarBrakeSqueal vol = 80
  Create name = TRG_Lon_Stompy_FreeNotStart_TruckDriver
  SendFlag name = TRG_Lon_Stompy_Free_ElephantTruck_Door FLAG_LON_ELE_CAMFRONT
  SendFlag prefix = "TRG_Lon_Stompy_Free_ElephantTruck_Wheel" FLAG_LON_ELE_CAMFRONT
endscript
script Lon_Stompy_ElephantTruck_Wheel
  if GotParam Wheel1
    Obj_LockToObject NoRotation ObjectName = TRG_Lon_Stompy_Free_ElephantTruck (62, 25.5, 47)
  endif
  if GotParam Wheel2
    Obj_LockToObject NoRotation ObjectName = TRG_Lon_Stompy_Free_ElephantTruck (64, 25.5, -33)
  endif
  if GotParam Wheel3
    Obj_LockToObject NoRotation ObjectName = TRG_Lon_Stompy_Free_ElephantTruck (64, 25.5, -228)
  endif
  if GotParam Wheel4
    Obj_LockToObject NoRotation ObjectName = TRG_Lon_Stompy_Free_ElephantTruck (64, 25.5, -284)
  endif
  begin
    if Obj_FlagSet FLAG_LON_ELE_CAMFRONT
      Obj_StopRotating
      break
    endif
    Obj_RotX angle = 360 speed = 700
    Obj_WaitRotate
    Wait 5 frames
  repeat
endscript
script Lon_Stompy_ElephantTruck_Door
  Obj_LockToObject NoRotation ObjectName = TRG_Lon_Stompy_Free_ElephantTruck (72, 93, 91.5)
  begin
    if Obj_FlagSet FLAG_LON_ELE_CAMFRONT
      Obj_LockToObject NoRotation ObjectName = TRG_Lon_Stompy_Free_ElephantTruck (72, 93, 101.5)
      Obj_RotY angle = -100 speed = 150
      Obj_WaitRotate
      break
    endif
    Wait 5 frames
  repeat
  begin
    if Obj_FlagSet FLAG_LON_ELE_CLOSEDOOR
      Obj_RotY angle = 100 speed = 250 acceleration = 800
      Obj_WaitRotate
      break
    endif
    Wait 5 frames
  repeat
endscript
script Lon_Stompy_ElephantTruck_Bed
  Obj_LockToObject NoRotation ObjectName = TRG_Lon_Stompy_Free_ElephantTruck (0, 0, 0)
  begin
    if Obj_FlagSet FLAG_LON_ELE_STOMPLAND
      Obj_MoveToRelPos (0, -7, 0) time = 0.1
      Obj_WaitMove
      Obj_MoveToRelPos (0, 7, 0) time = 0.1
      Obj_WaitMove
      break
    endif
    Wait 1 frame
  repeat
endscript
script Lon_Stompy_ElephantTruck_Gate
  Obj_LockToObject NoRotation ObjectName = TRG_Lon_Stompy_Free_ElephantTruck (1.15, 69.5, -381.7)
  begin
    if Obj_FlagSet FLAG_LON_ELE_GATEOPEN
      Obj_RotX angle = -130 speed = 200
      Obj_WaitRotate
      PlaySound LA_GratesOpen pitch = 80
      Wait 5 frames
      Obj_RotX angle = 7 speed = 29
      Obj_WaitRotate
      Obj_RotX angle = -7 speed = 34
      Obj_WaitRotate
      PlaySound LA_GratesOpen vol = 50 pitch = 80
      break
    endif
    Wait 1 frame
  repeat
  begin
    if Obj_FlagSet FLAG_LON_ELE_STOMPLAND
      Obj_MoveToRelPos (0, -7, 0) time = 0.1
      Obj_WaitMove
      Obj_MoveToRelPos (0, 7, 0) time = 0.1
      Obj_WaitMove
      break
    endif
    Wait 1 frame
  repeat
endscript
script Lon_Stompy_ProtWalk avoid_radius = 3
  if GotParam VO
    Printf "playing vo"
    Obj_SpawnScript Lon_Stompy_ProtVO
  endif
  Obj_SetInnerAvoidRadius <avoid_radius>
  Obj_SetException ex = SkaterInAvoidRadius scr = goal_pro_bounce_skater params = { avoid_radius = <avoid_radius> }
  s1 = ( randomrange(10, 12) / 10.0 )
  Obj_ApplyScaling {
    x = <s1>
    y = ( randomrange(9, 11) / 10.0 )
    z = <s1> }
  Obj_SetPathVelocity 2.3
  Obj_SetPathAcceleration 5
  Obj_FollowPathLinked
  Obj_CycleAnim Anim = Ped_Prot_Walk from = randomrange(0, 30)
  Obj_PlayAnim Anim = Ped_Prot_Walk cycle
endscript
script Lon_Stompy_ProtVO
  begin
    randomnorepeat( @@
    @Obj_PlayStream prot_picket01 dropoff = 200
    @Obj_PlayStream prot_picket02 dropoff = 200
    @Obj_PlayStream prot_picket03 dropoff = 200
    @Obj_PlayStream prot_picket04 dropoff = 200
    @Obj_PlayStream prot_picket05 dropoff = 200
    Wait 17 seconds ) 
  repeat
endscript
script Lon_Stompy_Netting_Fall
  Obj_MoveToRelPos (0, -135, 0) time = 0.9
  Obj_WaitMove
  if GotParam NettingA
    Create name = Lon_Stompy_NettingNotStart_A_Ground
  endif
  if GotParam NettingB
    Create name = Lon_Stompy_NettingNotStart_B_Ground
  endif
  if GotParam NettingC
    Create name = Lon_Stompy_NettingNotStart_C_Ground
  endif
  if GotParam NettingD
    Create name = Lon_Stompy_NettingNotStart_D_Ground
  endif
  Obj_PlaySound HitCanFlag vol = 300
  Die
endscript
script Lon_Stompy_Netting_ZooWire
  Obj_RotZ angle = 10 speed = 25
  Obj_WaitRotate
endscript
script Lon_Stompy_Netting_Gap1
  Printf "test"
  StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL ] GapID = ID_Lon_StompyWire01
  EndGap GapID = ID_Lon_StompyWire02 score = 500 text = "Netting Destroyed!" GapScript = <GapScript>
endscript
script Lon_Stompy_Netting_Gap2
  Printf "test2"
  StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL ] GapID = ID_Lon_StompyWire02
  EndGap GapID = ID_Lon_StompyWire01 score = 500 text = "Netting Destroyed!" GapScript = <GapScript>
endscript
script Lon_Stompy_NettingA_WireLeft
  SendFlag FLAG_LON_ELE_NETTINGA_LEFT name = TRG_G_GAP2_Pro
  PlaySound wiresnap
  MakeSkaterGoto SkaterInit
  Kill prefix = "TRG_Lon_Stompy_Netting_A_RailLeft"
  Kill name = Lon_Stompy_Netting_A_Wire01
  Kill name = Lon_Stompy_Netting_A_Wire03
  Create name = Lon_Stompy_NettingNotStart_A_Wire03
  Kill name = Lon_Stompy_Netting_A_Wire06
  Create name = Lon_Stompy_NettingNotStart_A_Wire06
endscript
script Lon_Stompy_NettingA_WireRight
  SendFlag FLAG_LON_ELE_NETTINGA_RIGHT name = TRG_G_GAP2_Pro
  PlaySound wiresnap
  MakeSkaterGoto SkaterInit
  Kill prefix = "TRG_Lon_Stompy_Netting_A_RailRight"
  Kill name = Lon_Stompy_Netting_A_Wire02
  Kill name = Lon_Stompy_Netting_A_Wire04
  Create name = Lon_Stompy_NettingNotStart_A_Wire04
  Kill name = Lon_Stompy_Netting_A_Wire05
  Create name = Lon_Stompy_NettingNotStart_A_Wire05
endscript
script Lon_Stompy_NettingB_WireLeft
  SendFlag FLAG_LON_ELE_NETTINGB_LEFT name = TRG_G_GAP2_Pro
  PlaySound wiresnap
  MakeSkaterGoto SkaterInit
  Kill prefix = "TRG_Lon_Stompy_Netting_B_RailLeft"
  Kill name = Lon_Stompy_Netting_B_Wire02
  Kill name = Lon_Stompy_Netting_B_Wire04
  Create name = Lon_Stompy_NettingNotStart_B_Wire04
  Kill name = Lon_Stompy_Netting_B_Wire06
  Create name = Lon_Stompy_NettingNotStart_B_Wire06
endscript
script Lon_Stompy_NettingB_WireRight
  SendFlag FLAG_LON_ELE_NETTINGB_RIGHT name = TRG_G_GAP2_Pro
  PlaySound wiresnap
  MakeSkaterGoto SkaterInit
  Kill prefix = "TRG_Lon_Stompy_Netting_B_RailRight"
  Kill name = Lon_Stompy_Netting_B_Wire01
  Kill name = Lon_Stompy_Netting_B_Wire03
  Create name = Lon_Stompy_NettingNotStart_B_Wire03
  Kill name = Lon_Stompy_Netting_B_Wire05
  Create name = Lon_Stompy_NettingNotStart_B_Wire05
endscript
script Lon_Stompy_NettingC_WireLeft
  SendFlag FLAG_LON_ELE_NETTINGC_LEFT name = TRG_G_GAP2_Pro
  PlaySound wiresnap
  MakeSkaterGoto SkaterInit
  Kill prefix = "TRG_Lon_Stompy_Netting_C_RailLeft"
  Kill name = Lon_Stompy_Netting_C_Wire02
  Kill name = Lon_Stompy_Netting_C_Wire04
  Create name = Lon_Stompy_NettingNotStart_C_Wire04
  Kill name = Lon_Stompy_Netting_C_Wire06
  Create name = Lon_Stompy_NettingNotStart_C_Wire06
endscript
script Lon_Stompy_NettingC_WireRight
  SendFlag FLAG_LON_ELE_NETTINGC_RIGHT name = TRG_G_GAP2_Pro
  PlaySound wiresnap
  MakeSkaterGoto SkaterInit
  Kill prefix = "TRG_Lon_Stompy_Netting_C_RailRight"
  Kill name = Lon_Stompy_Netting_C_Wire01
  Kill name = Lon_Stompy_Netting_C_Wire03
  Create name = Lon_Stompy_NettingNotStart_C_Wire03
  Kill name = Lon_Stompy_Netting_C_Wire05
  Create name = Lon_Stompy_NettingNotStart_C_Wire05
endscript
script Lon_Stompy_NettingD_WireLeft
  SendFlag FLAG_LON_ELE_NETTINGD_LEFT name = TRG_G_GAP2_Pro
  PlaySound wiresnap
  MakeSkaterGoto SkaterInit
  Kill prefix = "TRG_Lon_Stompy_Netting_D_RailLeft"
  Kill name = Lon_Stompy_Netting_D_Wire01
  Kill name = Lon_Stompy_Netting_D_Wire04
  Create name = Lon_Stompy_NettingNotStart_D_Wire04
  Kill name = Lon_Stompy_Netting_D_Wire06
  Create name = Lon_Stompy_NettingNotStart_D_Wire06
endscript
script Lon_Stompy_NettingD_WireRight
  SendFlag FLAG_LON_ELE_NETTINGD_RIGHT name = TRG_G_GAP2_Pro
  PlaySound wiresnap
  MakeSkaterGoto SkaterInit
  Kill prefix = "TRG_Lon_Stompy_Netting_D_RailRight"
  Kill name = Lon_Stompy_Netting_D_Wire02
  Kill name = Lon_Stompy_Netting_D_Wire03
  Create name = Lon_Stompy_NettingNotStart_D_Wire03
  Kill name = Lon_Stompy_Netting_D_Wire05
  Create name = Lon_Stompy_NettingNotStart_D_Wire05
endscript
script Lon_Stompy_NettingA_Break
  begin
    if ( ( QueryFlag FLAG_LON_ELE_NETTINGA_LEFT name = TRG_G_GAP2_Pro ) and ( QueryFlag FLAG_LON_ELE_NETTINGA_RIGHT name = TRG_G_GAP2_Pro ) )
      GoalManager_SetGoalFlag name = Lon_Goal_Gaps2 got_1 1
      break
    endif
    Wait 5 frames
  repeat
  Printf "### Breaking Netting A ###"
  Kill name = Lon_Stompy_Netting_A_Hanging
  Create name = Lon_Stompy_NettingNotStart_A_Falling
endscript
script Lon_Stompy_NettingB_Break
  begin
    if ( ( QueryFlag FLAG_LON_ELE_NETTINGB_LEFT name = TRG_G_GAP2_Pro ) and ( QueryFlag FLAG_LON_ELE_NETTINGB_RIGHT name = TRG_G_GAP2_Pro ) )
      GoalManager_SetGoalFlag name = Lon_Goal_Gaps2 got_2 1
      break
    endif
    Wait 5 frames
  repeat
  Printf "### Breaking Netting B ###"
  GoalManager_SetGoalFlag name = Lon_Goal_Gaps2 got_2 1
  Kill name = Lon_Stompy_Netting_B_Hanging
  Create name = Lon_Stompy_NettingNotStart_B_Falling
endscript
script Lon_Stompy_NettingC_Break
  begin
    if ( ( QueryFlag FLAG_LON_ELE_NETTINGC_LEFT name = TRG_G_GAP2_Pro ) and ( QueryFlag FLAG_LON_ELE_NETTINGC_RIGHT name = TRG_G_GAP2_Pro ) )
      GoalManager_SetGoalFlag name = Lon_Goal_Gaps2 got_3 1
      break
    endif
    Wait 5 frames
  repeat
  Printf "### Breaking Netting C ###"
  GoalManager_SetGoalFlag name = Lon_Goal_Gaps2 got_3 1
  Kill name = Lon_Stompy_Netting_C_Hanging
  Create name = Lon_Stompy_NettingNotStart_C_Falling
endscript
script Lon_Stompy_NettingD_Break
  begin
    if ( ( QueryFlag FLAG_LON_ELE_NETTINGD_LEFT name = TRG_G_GAP2_Pro ) and ( QueryFlag FLAG_LON_ELE_NETTINGD_RIGHT name = TRG_G_GAP2_Pro ) )
      begin
        GetSkaterState
        if ( <state> = skater_OnGround )
          GoalManager_SetGoalFlag name = Lon_Goal_Gaps2 got_4 1
          break
        else
        endif
        Wait 1 gameframe
      repeat
      break
    endif
    Wait 5 frames
  repeat
  Printf "### Breaking Netting D ###"
  GoalManager_SetGoalFlag name = Lon_Goal_Gaps2 got_4 1
  Kill name = Lon_Stompy_Netting_D_Hanging
  Create name = Lon_Stompy_NettingNotStart_D_Falling
endscript
script Lon_Stompy_CheckSafe
  if GoalManager_GoalFlagSet name = Lon_Goal_Gaps2 flag = <flag>
    PlaySound ElephantBlast
  else
    PlaySound ElephantDie
    Obj_StopAlongPath 5
    Obj_CycleAnim Anim = RunToIdle
    GoalManager_LoseGoal name = Lon_Goal_Gaps2
  endif
endscript
script Lon_Stompy_Zookeeper
  Obj_ClearExceptions
  Obj_SetInnerRadius 5
  Obj_SetException ex = SkaterInRadius scr = Lon_Stompy_Zookeeper_Collision params = <...>
  Obj_CycleAnim Anim = Ped_M_ThumbUp from = randomrange(30, 70) to = 75
  Obj_PlayAnim Anim = Ped_M_ThumbUp from = 30 to = 75 cycle
  begin
    if Obj_FlagSet FLAG_LON_ELE_CLOCK
      GotoPreserveParams Lon_Stompy_Zookeeper_Clocked
    endif
    Wait 1 frame
  repeat
endscript
script Lon_Stompy_Zookeeper_Collision
  Obj_ClearExceptions
  if SkaterCurrentScorePotGreaterThan 0
    GotoPreserveParams Lon_Stompy_Zookeeper_Clocked
  else
    Obj_LookAtObject type = skater time = 0.05
    Obj_CycleAnim Anim = Ped_M_Punch to = 20
    Obj_LookAtObject type = skater time = 0.05
    Obj_PlayAnim Anim = Ped_M_Punch from = 21 to end
    Obj_PlaySound bail04 vol = 200
    MakeSkaterGoto PedKnockDown
    Obj_WaitAnimFinished
    GotoPreserveParams Lon_Stompy_Zookeeper
  endif
endscript
script Lon_Stompy_Zookeeper_Clocked
  Printf "###clocked called###"
  Obj_ClearExceptions
  Obj_SetFlag FLAG_LON_ELE_CLOCK
  Kill name = <WireKill>
  Create name = <WireCreate>
  Obj_PlaySound bail04 vol = 300
  Obj_CycleAnim Anim = Ped_Zoo_CrouchHit
  Obj_PlayAnim Anim = Ped_Zoo_LayIdle cycle
endscript
script Lon_Goal_Gaps3
  if GoalManager_SetGoalFlag name = lon_goal_gaps got_1 1
    Printf "got gap 1"
  endif
endscript
script Lon_PigeonFollow
  Obj_ApplyScaling {
    x = 2
    y = 2
    z = 2 }
  Obj_SetInnerRadius 50
  Obj_SetException ex = SkaterInRadius scr = Lon_Pigeon_ChaseSkater
  begin
    random( @
    Obj_CycleAnim Anim = Idle
    @Obj_CycleAnim Anim = peck
    @Obj_CycleAnim Anim = preen ) 
  repeat
endscript
script Lon_Pigeon_Idle
  Obj_MoveForward speed = 0
  Obj_ClearExceptions
  Obj_SetInnerRadius 50
  Obj_SetException ex = SkaterInRadius scr = Lon_Pigeon_ChaseSkater
  begin
    random( @
    Obj_CycleAnim Anim = Idle
    @Obj_CycleAnim Anim = peck
    @Obj_CycleAnim Anim = preen ) 
  repeat
endscript
script Lon_Pigeon_ChaseSkater
  Obj_ClearExceptions
  Obj_SetInnerRadius 5
  Obj_SetOuterRadius 100
  Obj_SetException ex = SkaterInRadius scr = Lon_Pigeon_Attack
  Obj_SetException ex = SkaterOutOfRadius scr = Lon_Pigeon_Idle
  begin
    Obj_LookAtObject type = skater time = 0.1
    Obj_WaitRotate
    if not Obj_GetCollision height = 0.5 length = 50
      if not Obj_AnimEquals run
        Obj_PlayAnim Anim = run cycle
      endif
      Obj_MoveForward dist = 600 speed = 10 acceleration = 1
    else
      if not Obj_GetCollision height = 0.5 length = 20
        if not Obj_AnimEquals run
          Obj_PlayAnim Anim = run cycle
        endif
        Obj_MoveForward dist = 240 speed = 10 acceleration = 1
      else
        Obj_CycleAnim Anim = Idle
        Goto Lon_Pigeon_Idle
      endif
    endif
    Obj_WaitMove
  repeat
endscript
script Lon_Pigeon_Attack
  Obj_ClearExceptions
  Obj_PlayAnim Anim = FlyHop
  Obj_MoveForward speed = 0
  MakeSkaterGoto PedKnockDown
  PlaySound BitchSlap2
  Obj_WaitAnimFinished
  Goto Lon_Pigeon_Idle
endscript
FLAG_LON_COMP_OFFSLOPE = 0
script Lon_Goal_Comp_Intro
  Create name = TRG_Lon_COMP_Ghost01
endscript
script Lon_Goal_Comp_Deactivate
  Kill name = TRG_Lon_COMP_Ghost01
endscript
script Lon_Comp_SlopeTurn_Skate
  ClearFlag FLAG_LON_COMP_OFFSLOPE name = TRG_Lon_COMP_Ghost01
  Friction = Physics_Rolling_Friction
  skater:DisablePlayerInput
  begin
    skater:GetSpeed
    skater:SetRollingFriction <Friction>
    Friction = ( <Friction> * 8 )
    if ( <speed> = 0 )
      break
    endif
    Wait 1 frame
  repeat
  skater:Rotate y = 180 duration = 0.5 seconds
  Wait 0.5 second
  skater:SetRollingFriction #"default"
  begin
    if QueryFlag FLAG_LON_COMP_OFFSLOPE name = TRG_Lon_COMP_Ghost01
      skater:EnablePlayerInput
      break
    endif
    Wait 5 frames
  repeat
endscript
script Lon_Comp_SlopeTurn_Jump
  ClearFlag FLAG_LON_COMP_OFFSLOPE name = TRG_Lon_COMP_Ghost01
  skater:DisablePlayerInput
endscript
script Lon_Comp_SlopeTurn_Off
  SendFlag FLAG_LON_COMP_OFFSLOPE name = TRG_Lon_COMP_Ghost01
endscript
script Lon_Copper avoid_radius = 3
  s1 = ( randomrange(9, 13) / 10.0 )
  Obj_ApplyScaling {
    x = <s1>
    y = ( randomrange(9, 11) / 10.0 )
    z = <s1> }
  GotoPreserveParams Lon_Copper_Walk
endscript
script Lon_Copper_Walk
  Obj_SetPathVelocity 2.3
  Obj_SetPathAcceleration 5
  Obj_PlayAnim Anim = Ped_Cop_WalkFromIdle
  Obj_FollowPathLinked
  Obj_SetInnerRadius 7
  Obj_SetException ex = SkaterInRadius scr = Lon_Copper_TryHitSkater params = <...>
  Obj_WaitAnimFinished
  Obj_PlayAnim Anim = Ped_Cop_Walk cycle
  begin
    Wait randomrange(300, 600) frames
    Lon_Copper_Idle <...>
  repeat
endscript
script Lon_Copper_Idle
  Obj_SetAnimCycleMode Off
  Obj_WaitAnimFinished
  Obj_StopAlongPath
  Obj_CycleAnim Anim = Ped_Cop_WalkToIdle
  begin
    randomnorepeat( @
    Obj_CycleAnim Anim = Ped_Cop_Idle1
    @Obj_CycleAnim Anim = Ped_Cop_Idle2
    @Obj_CycleAnim Anim = Ped_Cop_Idle4 ) 
    break
  repeat
  Obj_StartAlongPath
  Obj_CycleAnim Anim = Ped_Cop_WalkFromIdle
  Obj_PlayAnim Anim = Ped_Cop_Walk cycle
endscript
script Lon_Copper_TryHitSkater
  Obj_ClearException SkaterInRadius
  Obj_StopAlongPath
  Obj_LookAtObject type = skater time = 0.01
  GetSkaterState
  if ( ( <state> = skater_endofrun ) or ( <state> = skater_inbail ) )
    Obj_CycleAnim Anim = Ped_Cop_Idle1
    GotoPreserveParams Lon_Copper_Walk
  else
    Obj_CycleAnim Anim = Ped_Cop_Hit from = start to = 20
    Obj_PlaySound ArmWhoosh01
    if Obj_ObjectInRect dist = 7 width = 4 height = 10 type = skater offset = (0, 0, 0)
      skater:bloodsplat
      Obj_PlayStream vol = 250 random( @
      Copper_Attack01
      @Copper_Attack02
      @Copper_Attack03
      @Copper_Attack04 ) 
      if ( <state> = skater_endofrun )
        Printf "## end of run dont hit skater ##"
      else
        MakeSkaterGoto PedKnockDown
      endif
      PlaySound BitchSlap2
    endif
    Obj_CycleAnim Anim = Ped_Cop_Hit from = 21 to = end
    GotoPreserveParams Lon_Copper_Walk
  endif
endscript
script Lon_CopperHat_Intro
  Kill name = TRG_Lon_Ped_Cop02
  Create name = TRG_Lon_Ped_Cop02
  Wait 1 frame
  TRG_Lon_Ped_Cop01:Obj_SpawnScript Lon_CopperHat_GoalActive params = { Copper01 CopperName = TRG_Lon_Ped_Cop01 CopperHat = TRG_Lon_Ped_Cop01_Hat } id = CopperHatScript
  TRG_Lon_Ped_Cop02:Obj_SpawnScript Lon_CopperHat_GoalActive params = { Copper02 CopperName = TRG_Lon_Ped_Cop02 CopperHat = TRG_Lon_Ped_Cop02_Hat } id = CopperHatScript
  TRG_Lon_Ped_Cop03:Obj_SpawnScript Lon_CopperHat_GoalActive params = { Copper03 CopperName = TRG_Lon_Ped_Cop03 CopperHat = TRG_Lon_Ped_Cop03_Hat } id = CopperHatScript
  TRG_Lon_Ped_Cop04:Obj_SpawnScript Lon_CopperHat_GoalActive params = { Copper04 CopperName = TRG_Lon_Ped_Cop04 CopperHat = TRG_Lon_Ped_Cop04_Hat } id = CopperHatScript
  TRG_Lon_Ped_Cop05:Obj_SpawnScript Lon_CopperHat_GoalActive params = { Copper05 CopperName = TRG_Lon_Ped_Cop05 CopperHat = TRG_Lon_Ped_Cop05_Hat } id = CopperHatScript
  Kill name = TRG_Lon_Ped_Cop01_Hat
  Kill name = TRG_Lon_Ped_Cop02_Hat
  Kill name = TRG_Lon_Ped_Cop03_Hat
  Kill name = TRG_Lon_Ped_Cop04_Hat
  Kill name = TRG_Lon_Ped_Cop05_Hat
  TRG_Lon_Ped_Cop01:SwitchOnAtomic Ped_M_head
  TRG_Lon_Ped_Cop02:SwitchOnAtomic Ped_M_head
  TRG_Lon_Ped_Cop03:SwitchOnAtomic Ped_M_head
  TRG_Lon_Ped_Cop04:SwitchOnAtomic Ped_M_head
  TRG_Lon_Ped_Cop05:SwitchOnAtomic Ped_M_head
endscript
script Lon_CopperHat_Deactivate
  Printf "### goal deact called ##"
  KillSpawnedScript id = CopperHatScript
  TRG_Lon_Ped_Cop01:Obj_ClearException SkaterLanded SkaterBailed
  TRG_Lon_Ped_Cop02:Obj_ClearException SkaterLanded SkaterBailed
  TRG_Lon_Ped_Cop03:Obj_ClearException SkaterLanded SkaterBailed
  TRG_Lon_Ped_Cop04:Obj_ClearException SkaterLanded SkaterBailed
  TRG_Lon_Ped_Cop05:Obj_ClearException SkaterLanded SkaterBailed
  TRG_Lon_Ped_Cop01:Obj_ClearFlag All
  TRG_Lon_Ped_Cop02:Obj_ClearFlag All
  TRG_Lon_Ped_Cop03:Obj_ClearFlag All
  TRG_Lon_Ped_Cop04:Obj_ClearFlag All
  TRG_Lon_Ped_Cop05:Obj_ClearFlag All
  GoalManager_GetGoalParams name = Lon_Goal_Collect
  if not GotParam just_won_goal
    Printf "### failed putting the hats back on now ###"
    Kill name = TRG_Lon_Ped_Cop01_Hat
    Kill name = TRG_Lon_Ped_Cop02_Hat
    Kill name = TRG_Lon_Ped_Cop03_Hat
    Kill name = TRG_Lon_Ped_Cop04_Hat
    Kill name = TRG_Lon_Ped_Cop05_Hat
    TRG_Lon_Ped_Cop01:SwitchOnAtomic Ped_M_head
    TRG_Lon_Ped_Cop02:SwitchOnAtomic Ped_M_head
    TRG_Lon_Ped_Cop03:SwitchOnAtomic Ped_M_head
    TRG_Lon_Ped_Cop04:SwitchOnAtomic Ped_M_head
    TRG_Lon_Ped_Cop05:SwitchOnAtomic Ped_M_head
  else
    Printf "### won goal in deact leaving the hats ###"
  endif
endscript
script Lon_CopperHat_Success
  Kill name = TRG_Lon_Ped_Cop02
  Create name = TRG_Lon_Ped_Cop02
  TRG_Lon_Ped_Cop02:Obj_SwitchScript Lon_CopperHat_CopperFret params = <...>
endscript
FLAG_LON_COPPER_HAT_GOTGAP = 0
FLAG_LON_COPPER_HAT_NOTGRABBING = 1
FLAG_LON_COPPER_HAT_1 = 2
FLAG_LON_COPPER_HAT_2 = 3
FLAG_LON_COPPER_HAT_3 = 4
FLAG_LON_COPPER_HAT_4 = 5
FLAG_LON_COPPER_HAT_5 = 6
script Lon_CopperHat_CopperFret
  Obj_SetInnerRadius 7
  Obj_SetException ex = SkaterInRadius scr = Lon_Copper_TryHitSkater params = <...>
  Obj_StopAlongPath
  SwitchOffAtomic Ped_M_head
  Obj_CycleAnim Anim = Ped_Cop_LookRightLeft
  Obj_CycleAnim Anim = Ped_Cop_KnockHat
  Obj_CycleAnim Anim = Ped_Cop_Acknowledge
  Obj_CycleAnim Anim = Ped_Cop_Idle1
  GotoPreserveParams Lon_Copper_Walk
endscript
script Lon_CopperHat_Plant
  ClearExceptions
  InAirExceptions
  ClearException Carplant
  DoCarPlantBoost
  if DoingTrick
  else
    PlayAnim Anim = Beanplant BlendPeriod = 0.3
    WaitAnimWhilstChecking
    Goto Airborne
  endif
endscript
script Lon_CopperHat_GoalActive
  p1 = { dist = 5 width = 5 height = 14 type = skater offset = (0, 7, -2) }
  begin
    Wait 5 frames
    if Obj_FlagNotSet FLAG_LON_COPPER_HAT_GOTGAP
      if Obj_ObjectInRect <p1>
        Lon_CopperHat_GrabCheck id = CopperHatScript
        if Obj_FlagNotSet FLAG_LON_COPPER_HAT_NOTGRABBING
          Obj_SetFlag FLAG_LON_COPPER_HAT_GOTGAP
          PlayStream vol = 280 random( @
          Copper_Hat01
          @Copper_Hat02
          @Copper_Hat03
          @Copper_Hat04
          @Copper_Hat05
          @Copper_Hat07
          @Copper_Hat08
          @Copper_Hat09
          @Copper_Hat10 ) 
          skater:GetGap score = 500 text = "Oi, gimme me hat!"
          SwitchOffAtomic Ped_M_head
          Kill name = <CopperHat>
          Create name = <CopperHat>
          Wait 1 frame
           <CopperHat>:Obj_ApplyScaling x = 1.5 y = 1.5 z = 1.5
           <CopperHat>:Obj_LockToObject ObjectName = skater (0, 10, -12)
          Obj_SpawnScript Lon_CopperHat_GrabHatCheck params = <...> id = CopperHatScript
          Obj_SetException ex = SkaterLanded scr = Lon_CopperHat_CheckScore params = <...>
          Obj_SetException ex = SkaterBailed scr = Lon_CopperHat_Bailed params = <...>
        else
          Obj_SetFlag FLAG_LON_COPPER_HAT_GOTGAP
          skater:GetGap score = 200 text = "Get outta here... Skater!"
          Obj_SetException ex = SkaterLanded scr = Lon_CopperHat_NoGrab params = <...>
          Obj_SetException ex = SkaterBailed scr = Lon_CopperHat_NoGrab params = <...>
        endif
      endif
    endif
  repeat
endscript
script Lon_CopperHat_GrabHatCheck
  begin
    Lon_CopperHat_GrabCheck <...> id = CopperHatScript
    if Obj_FlagSet FLAG_LON_COPPER_HAT_NOTGRABBING
       <CopperHat>:BouncyObj_Go (10, 300, 0)
      break
    endif
    Wait 1 frame
  repeat
endscript
script Lon_CopperHat_GrabCheck
  GetSkaterState
  if ( <state> = skater_InGrab )
    Obj_ClearFlag FLAG_LON_COPPER_HAT_NOTGRABBING
  else
    Obj_SetFlag FLAG_LON_COPPER_HAT_NOTGRABBING
  endif
endscript
script Lon_CopperHat_NoGrab
  Obj_ClearExceptions
  Obj_ClearFlag All
  Obj_StopAlongPath
  Obj_CycleAnim Anim = Ped_Cop_Acknowledge
  Obj_CycleAnim Anim = Ped_Cop_WalkFromIdle
  GotoPreserveParams Lon_Copper_Walk
endscript
script Lon_CopperHat_Bailed
  SwitchOnAtomic Ped_M_head
  Kill name = <CopperHat>
  Obj_KillSpawnedScript name = Lon_CopperHat_GrabHatCheck
  Obj_ClearExceptions
  Obj_ClearFlag All
  Obj_StopAlongPath
  Obj_CycleAnim Anim = Ped_Cop_Idle2 numcycles = 2
  Obj_CycleAnim Anim = Ped_Cop_WalkFromIdle
  GotoPreserveParams Lon_Copper_Walk
endscript
script Lon_CopperHat_CheckScore
  Obj_ClearExceptions
  if GotParam Copper01
    GoalManager_SetGoalFlag name = Lon_Goal_Collect got_1 1
  else
    if GotParam Copper02
      GoalManager_SetGoalFlag name = Lon_Goal_Collect got_2 1
    else
      if GotParam Copper03
        GoalManager_SetGoalFlag name = Lon_Goal_Collect got_3 1
      else
        if GotParam Copper04
          GoalManager_SetGoalFlag name = Lon_Goal_Collect got_4 1
        else
          if GotParam Copper05
            GoalManager_SetGoalFlag name = Lon_Goal_Collect got_5 1
          endif
        endif
      endif
    endif
  endif
  create_panel_message id = current_horse_spot text = "You grabbed his hat!" just = [ center top ] z_priority = -5
  Obj_KillSpawnedScript id = CopperHatScript
  GotoPreserveParams Lon_Copper_Walk
endscript
FLAG_LON_COPPERBIKE_WON = 0
script Lon_CopperBike_Intro
  KillSpawnedScript name = Lon_CopperBike_BikeDriveAway
  SpawnScript Lon_KillCars
  Kill prefix = "TRG_Lon_CopperBike_"
  Create prefix = "TRG_Lon_CopperBike_"
endscript
script Lon_CopperBike_Deactivate
  SpawnScript Lon_CreateCars
  SpawnScript Lon_CopperBike_BikeDriveAway
endscript
script Lon_CopperBike_Win
  KillSpawnedScript name = Lon_CopperBike
  if TRG_Lon_CopperBike_Bike01:Obj_FlagSet FLAG_CAR_SKITCH
    TRG_Lon_CopperBike_Bike01:Obj_SetFlag FLAG_LON_COPPERBIKE_WON
    MakeSkaterGoto BigBrake
    Wait 1 second
    GoalManager_WinGoal name = Lon_Goal_Gaps3
  endif
endscript
script Lon_CopperBike_Fail
  MakeSkaterGoto BigBrake
  GoalManager_LoseGoal name = Lon_Goal_Gaps3
endscript
script Lon_CopperBike_BikeDriveAway
  TRG_Lon_CopperBike_Bike01:Obj_SwitchScript Car_Generic01 params = { DefaultSpeed = 100 NoSkitchStop }
  Wait 210 frames
  Kill prefix = "TRG_Lon_CopperBike_"
  KillSpawnedScript id = ID_CopperBikeScript
endscript
script Lon_CopperBike
  begin
    Wait 1 frame
    if skater:Skitching
      Car_Generic01 DefaultSpeed = 25 AllowSlow NoSkitchStop CarLoopSFX = CycleAndSideCar
      Obj_StickToGround on DistAbove = 4 DistBelow = 4
      break
    endif
  repeat
  Wait 40 gameframes
  begin
    if not TRG_Lon_CopperBike_Bike01:Obj_FlagSet FLAG_CAR_SKITCH
      if not TRG_Lon_CopperBike_Bike01:Obj_FlagSet FLAG_LON_COPPERBIKE_WON
        GotoPreserveParams Lon_CopperBike_Fail id = ID_CopperBikeScript
      endif
    endif
    Wait 1 frame
  repeat
endscript
script Lon_CopperBike_Copper
  Obj_Flip
  Obj_LockToObject ObjectName = TRG_Lon_CopperBike_Bike01 (-13, -1, -4)
  p1 = { dist = 9 width = 2 height = 9 type = skater offset = (-0.5, 0, -10) }
  begin
    if TRG_Lon_CopperBike_Bike01:Obj_FlagSet FLAG_CAR_SKITCH
      Wait randomrange(100, 140) frames
      if Obj_ObjectInRect <p1>
        Obj_PlayStream vol = 300 randomnorepeat( @
        Copper_Skitch01
        @Copper_Skitch02
        @Copper_Skitch03
        @Copper_Skitch04
        @Copper_Skitch05
        @Copper_Skitch06
        @Copper_Skitch07
        @Copper_Skitch08
        @Copper_Skitch09 ) 
        Obj_CycleAnim Anim = Ped_Cop_RiderHitBack from = start to = 54
        Obj_PlaySound ArmWhoosh01
        Obj_PlayAnim Anim = Ped_Cop_RiderHitBack from = 55 to = end
        if Obj_ObjectInRect <p1>
          skater:bloodsplat
          MakeSkaterGoto PedKnockDown
          Obj_PlaySound BitchSlap2
        endif
        Obj_WaitAnimFinished
      endif
    endif
    Obj_PlayAnim Anim = Ped_Cop_RiderIdle cycle NoRestart
    Wait 1 frame
  repeat
endscript
script Lon_CopperBike_Passenger
  Obj_Flip
  Obj_LockToObject ObjectName = TRG_Lon_CopperBike_Bike01 (22, 4, 5)
  p1 = { dist = 6 width = 1.5 height = 9 type = skater offset = (1.3, 0, -9) }
  begin
    if TRG_Lon_CopperBike_Bike01:Obj_FlagSet FLAG_CAR_SKITCH
      Wait randomrange(100, 140) frames
      if Obj_ObjectInRect <p1>
        Obj_PlayStream vol = 300 randomnorepeat( @
        Copper_Skitch01
        @Copper_Skitch02
        @Copper_Skitch03
        @Copper_Skitch04
        @Copper_Skitch05
        @Copper_Skitch06
        @Copper_Skitch07
        @Copper_Skitch08
        @Copper_Skitch09 ) 
        Obj_CycleAnim Anim = Ped_Cop_PassengerHitBack from = start to = 56
        Obj_PlaySound ArmWhoosh01
        Wait 5 frames
        Obj_PlayAnim Anim = Ped_Cop_PassengerHitBack from = 57 to = end
        if Obj_ObjectInRect <p1>
          skater:bloodsplat
          MakeSkaterGoto PedKnockDown
          Obj_PlaySound BitchSlap2
        endif
        Obj_WaitAnimFinished
      endif
    endif
    Obj_PlayAnim Anim = Ped_Cop_PassengerIdle cycle NoRestart
    Wait 1 frame
  repeat
endscript
FLAG_LON_COPPERBIKERACE_BIKEGO = 0
FLAG_LON_COPPERBIKERACE_PLANE1 = 1
FLAG_LON_COPPERBIKERACE_PLANE2 = 2
FLAG_LON_COPPERBIKERACE_PLANE3 = 3
FLAG_LON_COPPERBIKERACE_PLANE4 = 4
FLAG_LON_COPPERBIKERACE_PLANE1a = 5
FLAG_LON_COPPERBIKERACE_PLANE2a = 6
FLAG_LON_COPPERBIKERACE_PLANE3a = 7
FLAG_LON_COPPERBIKERACE_PLANE4a = 8
FLAG_LON_COPPERBIKERACE_ONELAP = 9
FLAG_LON_COPPERBIKERACE_COPPERONELAP = 10
FLAG_LON_COPPERBIKERACE_SKATERWIN = 11
script Lon_CopperBikeRace_Intro
  SpawnScript Lon_KillCars
  Kill name = TRG_Lon_Ped_Cop01
  Kill name = TRG_Lon_XCopperBikeRace_Ghost01
  Create name = TRG_Lon_XCopperBikeRace_Ghost01
  Kill name = Lon_CopperBikeRace_StartRamp
  Create name = Lon_CopperBikeRace_StartRamp
  Kill name = Lon_CopperBikeRace_StartFinish
  Create name = Lon_CopperBikeRace_StartFinish
  Create prefix = "Lon_CopperBikeRace_Geo"
  Kill prefix = "TRG_Lon_CopperBikeRace"
  Create prefix = "TRG_Lon_CopperBikeRace"
  Kill prefix = "TRGP_Lon_CopperBikeRace"
  Create prefix = "TRGP_Lon_CopperBikeRace"
  Kill prefix = "TRG_Lon_CopperBikeRace_Lap2"
  Kill prefix = "TRG_Lon_CopperBikeRace_Lap3"
endscript
script Lon_CopperBikeRace_Start
  TRG_Lon_CopperBikeRace_Bike01:Obj_SetFlag FLAG_LON_COPPERBIKERACE_BIKEGO
endscript
script Lon_CopperBikeRace_Deactivate
  MakeSkaterGoto SkaterInit
  if IsAlive name = TRG_Lon_CopperBikeRace_Bike01
    TRG_Lon_CopperBikeRace_Bike01:Die
  endif
  if IsAlive name = TRG_Lon_CopperBikeRace_Copper
    TRG_Lon_CopperBikeRace_Copper:Die
  endif
  if IsAlive name = TRG_Lon_CopperBikeRace_Passenger
    TRG_Lon_CopperBikeRace_Passenger:Die
  endif
  Kill name = Lon_CopperBikeRace_StartRamp
  Kill name = Lon_CopperBikeRace_StartFinish
  Kill prefix = "Lon_CopperBikeRace_Geo"
  Kill prefix = "TRG_Lon_CopperBikeRace"
  Kill prefix = "TRGP_Lon_CopperBikeRace"
  if ObjectExists id = lapcheck
    DestroyScreenElement id = lapcheck
  endif
  SpawnScript Lon_CreateCars
  Create name = TRG_Lon_Ped_Cop01
endscript
script Lon_CopperBikeRace_Win
  if IsAlive name = TRG_Lon_CopperBikeRace_Bike01
    SendFlag FLAG_LON_COPPERBIKERACE_SKATERWIN name = TRG_Lon_CopperBikeRace_Bike01
  endif
  Obj_ClearExceptions
  MakeSkaterGoto BigBrake
  Wait 1 second
  GoalManager_WinGoal name = Lon_Goal_Trickspot3
endscript
script Lon_CopperBikeRace_Lose
  Obj_ClearExceptions
  GoalManager_LoseGoal name = Lon_Goal_Trickspot3
endscript
script Lon_CopperBikeRace_Startskater
  MakeSkaterGoto ShoppingCart_Start params = { racemode = luge CarMode StartSpeed = 30 Accelerate_to = 1200 BailSpeed = 100 Turn_Friction = 5 }
endscript
script Lon_CopperBikeRace_Jump
  Printf "bike jumping"
  Obj_AdjustSound CycleAndSideCar volumePercent = 100 volumeStep = 5.0 pitchPercent = 400 pitchStep = 5.0
  Obj_SetPathVelocity 20
  Obj_StickToGround Off
endscript
script Lon_CopperBikeRace_Land
  Printf "bike landing"
  Obj_AdjustSound CycleAndSideCar volumePercent = 100 volumeStep = 0.7 pitchPercent = 100 pitchStep = 20.0
  Obj_StickToGround on DistAbove = 4 DistBelow = 4
  Obj_PlaySound LA_Skid_11 vol = randomrange(30, 60)
endscript
script Lon_CopperBikeRace_Bike
  begin
    if TRG_Lon_CopperBikeRace_Bike01:Obj_FlagSet FLAG_LON_COPPERBIKERACE_BIKEGO
      Obj_SetInnerRadius 23
      Obj_SetException ex = SkaterInRadius scr = Lon_CopperBikeRace_SkaterCloseEnough
      break
    endif
    Wait 1 frame
  repeat
endscript
script Lon_CopperBikeRace_SkaterCloseEnough
  Obj_ClearException SkaterInRadius
  Obj_StickToGround on DistAbove = 4 DistBelow = 4
  skater:Obj_GetSpeed
  Car_Generic01 DefaultSpeed = ( <speed> * 0.7 ) AllowSlow NoSkater CarLoopSFX = CycleAndSideCar
  Obj_SetPathAcceleration 50 mphps
  Obj_SetPathDeceleration 50 mphps
  GotoPreserveParams Lon_CopperBikeRace_RaceSkater
endscript
script Lon_CopperBikeRace_RaceSkater
  SpeedDif = 3
  BikeSpeedLosing = 1
  BikeSpeedWinning = 3
  SkaterSpeedWinning = 50
  begin
    Obj_GetSpeed
    BikeSpeed = <speed>
    skater:Obj_GetSpeed
    SkaterSpeed = <speed>
    if ( <SkaterSpeed> > <SkaterSpeedWinning> )
      BikeSpeed = ( <BikeSpeed> + <BikeSpeedLosing> )
      if ( <SkaterSpeed> > <BikeSpeed> )
        if not ( ( <SkaterSpeed> - <BikeSpeed> ) < <SpeedDif> )
          Printf "### SKATER WINNING: slowing bike down to just below skater ###"
          Obj_SetPathVelocity ( <SkaterSpeed> - <BikeSpeedLosing> )
        else
          Printf "### SKATER WINNING: bike speed within range ###"
        endif
      else
        Printf "### SKATER WINNING: bike faster and now slowing down to below the skater ###"
        Obj_SetPathVelocity ( <SkaterSpeed> - <BikeSpeedLosing> )
      endif
    else
      if ( <BikeSpeed> > <SkaterSpeedWinning> )
        if not ( ( <BikeSpeed> - <SkaterSpeedWinning> ) < <SpeedDif> )
          Printf "### SKATER LOSING: setting bike to default speed ###"
          Obj_SetPathVelocity <SkaterSpeedWinning>
        else
          Printf "### SKATER LOSING: bike speed within range ###"
        endif
      else
        Printf "### SKATER LOSING: bike slower so speeding up ###"
        Obj_SetPathVelocity ( <SkaterSpeedWinning> + <BikeSpeedWinning> )
      endif
    endif
    Wait 20 frames
  repeat
endscript
script Lon_CopperBikeRace_Bonk
  PlaySound HitBody01
  skater:GetSpeed
  skater:SetSpeed ( <speed> * 0.5 )
  skater:GetSpeed
  begin
    skater:SetSpeed <speed>
    Wait 1 frame
  repeat 45
endscript
script Lon_CopperBikeRace_SetSpeedToHitSkater
  Printf "## switching script to equal skater speed ###"
  Obj_SetPathVelocity <speed>
  begin
    Wait 5 frames
    skater:Obj_GetSpeed
    Obj_SetPathVelocity <speed>
  repeat 25
  GotoPreserveParams Lon_CopperBikeRace_BikeCheckSkaterSpeed
endscript
script Lon_CopperBikeRace_DriveAway
  Obj_SetPathVelocity 70
endscript
script Lon_CopperBikeRace_Copper
  Obj_Flip
  Obj_SetException ex = SkaterBailed scr = Lon_CopperBikeRace_SkaterBailed
  Obj_LockToObject ObjectName = TRG_Lon_CopperBikeRace_Bike01 (-13, -1, -4)
  p1 = { dist = 10 width = 6 height = 9 type = skater offset = (-3, 0, -4) }
  begin
    if TRG_Lon_CopperBikeRace_Bike01:Obj_FlagSet FLAG_LON_COPPERBIKERACE_BIKEGO
      if Obj_ObjectInRect <p1>
        Obj_CycleAnim Anim = Ped_Cop_RiderKickLeft from = start to = 50 speed = 1.5
        Obj_PlaySound ArmWhoosh01
        Obj_PlayAnim Anim = Ped_Cop_RiderKickLeft from = 51 to = end speed = 1.5
        if Obj_ObjectInRect <p1>
          Obj_SpawnScript Lon_CopperBikeRace_HitSkater
          Obj_PlaySound BitchSlap2
        endif
        Obj_WaitAnimFinished
      endif
    endif
    Obj_PlayAnim Anim = Ped_Cop_RiderIdle cycle NoRestart
    Wait 1 frame
  repeat
endscript
script Lon_CopperBikeRace_Passenger
  Obj_Flip
  Obj_LockToObject ObjectName = TRG_Lon_CopperBikeRace_Bike01 (22, 4, 5)
  p1 = { dist = 8 width = 5.5 height = 9 type = skater offset = (3.5, 0, -5) }
  begin
    if TRG_Lon_CopperBikeRace_Bike01:Obj_FlagSet FLAG_LON_COPPERBIKERACE_BIKEGO
      if Obj_ObjectInRect <p1>
        Obj_CycleAnim Anim = Ped_Cop_PassengerHitRight from = start to = 55 speed = 1.5
        Obj_PlaySound ArmWhoosh01
        Obj_PlayAnim Anim = Ped_Cop_PassengerHitRight from = 56 to = end speed = 1.5
        if Obj_ObjectInRect <p1>
          Obj_SpawnScript Lon_CopperBikeRace_HitSkater
          Obj_PlaySound BitchSlap2
        endif
        Obj_WaitAnimFinished
      endif
    endif
    Obj_PlayAnim Anim = Ped_Cop_PassengerIdle cycle NoRestart
    Wait 1 frame
  repeat
endscript
script Lon_CopperBikeRace_HitSkater
  TRG_Lon_CopperBikeRace_Bike01:Obj_SwitchScript Lon_CopperBikeRace_DriveAway
  skater:bloodsplat
  MakeSkaterGoto PedKnockDown
  Wait 2 seconds
  Goto Lon_CopperBikeRace_Lose
endscript
script Lon_CopperBikeRace_SkaterBailed
  TRG_Lon_CopperBikeRace_Bike01:Obj_SwitchScript Lon_CopperBikeRace_DriveAway
  Wait 1 seconds
  Goto Lon_CopperBikeRace_Lose
endscript
script copperbikerace_panel_message
  SetProps just = [ center top ] internal_just = [ center center ] rgba = [ 60 150 60 100 ]
  DoMorph pos = (320, 114) scale = 1.0
  DoMorph pos = (320, 114) scale = 2.0 time = 0.1
  DoMorph pos = (320, 114) scale = 1.0 time = 0.1
  DoMorph pos = (320, 114) scale = 2.0 time = 0.1
endscript
script Lon_CopperBikeRace_ScreenElement
  if ObjectExists id = <id>
    DestroyScreenElement id = <id>
  endif
  create_panel_block id = <id> text = <text> style = copperbikerace_panel_message
  Wait <time> frames
  if ObjectExists id = <id>
    DestroyScreenElement id = <id>
  endif
endscript
script Lon_CopperBikeRace_CopperLapCheck
  if not QueryFlag FLAG_LON_COPPERBIKERACE_SKATERWIN name = TRG_Lon_CopperBikeRace_Bike01
    if QueryFlag FLAG_LON_COPPERBIKERACE_COPPERONELAP name = TRG_Lon_CopperBikeRace_Bike01
      Printf "## bike wins ##"
      Lon_CopperBikeRace_Lose
    endif
  endif
  if not QueryFlag FLAG_LON_COPPERBIKERACE_COPPERONELAP name = TRG_Lon_CopperBikeRace_Bike01
    Printf "## bike one lap ##"
    SendFlag FLAG_LON_COPPERBIKERACE_COPPERONELAP name = TRG_Lon_CopperBikeRace_Bike01
  endif
endscript
script Lon_CopperBikeRace_LapCheck1
  if ( ( QueryFlag FLAG_LON_COPPERBIKERACE_PLANE1 name = TRG_Lon_XCopperBikeRace_Ghost01 ) and ( QueryFlag FLAG_LON_COPPERBIKERACE_PLANE2 name = TRG_Lon_XCopperBikeRace_Ghost01 ) and ( QueryFlag FLAG_LON_COPPERBIKERACE_PLANE3 name = TRG_Lon_XCopperBikeRace_Ghost01 ) and ( QueryFlag FLAG_LON_COPPERBIKERACE_PLANE4 name = TRG_Lon_XCopperBikeRace_Ghost01 ) )
    SendFlag FLAG_LON_COPPERBIKERACE_PLANE1a name = TRG_Lon_XCopperBikeRace_Ghost01
    if ObjectExists id = current_goal
      DestroyScreenElement id = current_goal
    endif
    if not QueryFlag FLAG_LON_COPPERBIKERACE_ONELAP name = TRG_Lon_XCopperBikeRace_Ghost01
      GoalManager_SetGoalFlag name = Lon_Goal_Trickspot3 got_1 1
      SendFlag FLAG_LON_COPPERBIKERACE_ONELAP name = TRG_Lon_XCopperBikeRace_Ghost01
    endif
    if QueryFlag FLAG_LON_COPPERBIKERACE_ONELAP name = TRG_Lon_XCopperBikeRace_Ghost01
      if ( ( QueryFlag FLAG_LON_COPPERBIKERACE_PLANE1a name = TRG_Lon_XCopperBikeRace_Ghost01 ) and ( QueryFlag FLAG_LON_COPPERBIKERACE_PLANE2a name = TRG_Lon_XCopperBikeRace_Ghost01 ) and ( QueryFlag FLAG_LON_COPPERBIKERACE_PLANE3a name = TRG_Lon_XCopperBikeRace_Ghost01 ) and ( QueryFlag FLAG_LON_COPPERBIKERACE_PLANE4a name = TRG_Lon_XCopperBikeRace_Ghost01 ) )
        Goto Lon_CopperBikeRace_Win
      endif
    endif
  endif
  if not QueryFlag FLAG_LON_COPPERBIKERACE_ONELAP name = TRG_Lon_XCopperBikeRace_Ghost01
    Lon_CopperBikeRace_ScreenElement id = lapcheck text = "GO!" time = 80
    SendFlag FLAG_LON_COPPERBIKERACE_PLANE1 name = TRG_Lon_XCopperBikeRace_Ghost01
  endif
endscript
script Lon_CopperBikeRace_LapCheck2
  if QueryFlag FLAG_LON_COPPERBIKERACE_ONELAP name = TRG_Lon_XCopperBikeRace_Ghost01
    SendFlag FLAG_LON_COPPERBIKERACE_PLANE2a name = TRG_Lon_XCopperBikeRace_Ghost01
  else
    SendFlag FLAG_LON_COPPERBIKERACE_PLANE2 name = TRG_Lon_XCopperBikeRace_Ghost01
  endif
endscript
script Lon_CopperBikeRace_LapCheck3
  if QueryFlag FLAG_LON_COPPERBIKERACE_ONELAP name = TRG_Lon_XCopperBikeRace_Ghost01
    SendFlag FLAG_LON_COPPERBIKERACE_PLANE3a name = TRG_Lon_XCopperBikeRace_Ghost01
  else
    SendFlag FLAG_LON_COPPERBIKERACE_PLANE3 name = TRG_Lon_XCopperBikeRace_Ghost01
    Kill prefix = "TRG_Lon_CopperBikeRace_Lap1"
    Create prefix = "TRG_Lon_CopperBikeRace_Lap1_2"
    Create prefix = "TRG_Lon_CopperBikeRace_Lap2"
  endif
endscript
script Lon_CopperBikeRace_LapCheck4
  if QueryFlag FLAG_LON_COPPERBIKERACE_ONELAP name = TRG_Lon_XCopperBikeRace_Ghost01
    SendFlag FLAG_LON_COPPERBIKERACE_PLANE4a name = TRG_Lon_XCopperBikeRace_Ghost01
  else
    SendFlag FLAG_LON_COPPERBIKERACE_PLANE4 name = TRG_Lon_XCopperBikeRace_Ghost01
    Create prefix = "TRG_Lon_CopperBikeRace_Lap3"
  endif
endscript
script Lon_MG_CrazyCopper
  Obj_SetException ex = SkaterInRadius scr = Lon_MG_CrazyCopperClose
  Obj_SetInnerRadius 10
  Obj_SetOuterRadius 0
endscript
script Lon_MG_CrazyCopperClose
  Obj_SetException ex = SkaterOutOfRadius scr = Lon_MG_CrazyCopper
  Obj_SetOuterRadius 10
  Obj_SetInnerRadius 0
  begin
    if SkaterSpeedLessThan 1
      MakeSkaterGoto CrazyCopper
      Lon_KillCars
      break
    endif
    Wait 1 frame
  repeat
endscript
script CrazyCopper
  create_speech_box text = "Press Circle to Start\nPress Square to Quit" style = speech_box_style
  ClearExceptions
  ClearTrickQueue
  ClearEventBuffer
  SetRollingFriction 1000
  Obj_MoveToNode name = TRG_Lon_MG_CrazyCopperNav01 orient
  DisablePlayerInput
  begin
    if Held Circle
      SpawnScript Lon_CrazyCopperController
      break
    endif
    Wait 1 frame
  repeat
  begin
    if Held Left
      Move x = 10
    endif
    if Held Right
      Move x = -10
    endif
    if Held Square
      Printf "########square pressed########"
      PlaySkaterCamAnim skater = 0 stop
      Lon_CreateCars
      KillSpawnedScript name = Lon_CrazyCopperController
      Kill prefix = "TRG_Lon_CrazyCopper_Cop0"
      SetRollingFriction 1
      EnablePlayerInput
      MakeSkaterGoto SkaterInit
      break
    endif
    if GetFlag flag = FLAG_LON_CRAZYCOPPER_SLAP
      Printf "########copper hit skater flag sent########"
      UnSetFlag flag = FLAG_LON_CRAZYCOPPER_SLAP
      PlaySkaterCamAnim skater = 0 stop
      Lon_CreateCars
      KillSpawnedScript name = Lon_CrazyCopperController
      Kill prefix = "TRG_Lon_CrazyCopper_Cop0"
      SetRollingFriction 1
      EnablePlayerInput
      MakeSkaterGoto PedKnockDown
      break
    endif
    Wait 1 frame
  repeat
endscript
script Lon_CrazyCopperController
  begin
    Printf "creating coppers"
    Create name = randomnorepeat( @
    TRG_Lon_CrazyCopper_Cop01
    @TRG_Lon_CrazyCopper_Cop02
    @TRG_Lon_CrazyCopper_Cop03 ) 
    Wait randomrange(15, 40) frames
  repeat
endscript
script Lon_CrazyCopper
  Obj_SetException ex = SkaterInRadius scr = Lon_CrazyCopper_TryHitSkater
  Obj_SetInnerRadius 7
  Obj_PlayAnim Anim = Ped_M_Run cycle
  random( @
  Obj_LookAtNode name = TRG_Lon_CrazyCopper_CopNode01
  Obj_MoveToNode name = TRG_Lon_CrazyCopper_CopNode01 speed = 13
  @Obj_LookAtNode name = TRG_Lon_CrazyCopper_CopNode02
  Obj_MoveToNode name = TRG_Lon_CrazyCopper_CopNode02 speed = 13
  @Obj_LookAtNode name = TRG_Lon_CrazyCopper_CopNode03
  Obj_MoveToNode name = TRG_Lon_CrazyCopper_CopNode03 speed = 13
  @Obj_LookAtNode name = TRG_Lon_CrazyCopper_CopNode04
  Obj_MoveToNode name = TRG_Lon_CrazyCopper_CopNode04 speed = 13
  @Obj_LookAtNode name = TRG_Lon_CrazyCopper_CopNode05
  Obj_MoveToNode name = TRG_Lon_CrazyCopper_CopNode05 speed = 13
  @Obj_LookAtNode name = TRG_Lon_CrazyCopper_CopNode06
  Obj_MoveToNode name = TRG_Lon_CrazyCopper_CopNode06 speed = 13 ) 
  Obj_WaitMove
  Obj_CycleAnim Anim = Ped_M_FalldownA
  Die
endscript
script Lon_CrazyCopper_TryHitSkater
  Obj_ClearExceptions
  Obj_LookAtObject type = skater time = 0.25
  Obj_PlayAnim Anim = Ped_M_Punch from = start to = 25
  Obj_WaitAnimFinished
  Obj_PlaySound ArmWhoosh01
  if Obj_ObjectInRadius radius = 6 type = skater
    SetFlag flag = FLAG_LON_CRAZYCOPPER_SLAP
    PlaySound BitchSlap2
  endif
  Obj_PlayAnim Anim = Ped_M_Punch from = 26 to = end
  Obj_WaitAnimFinished
  Obj_CycleAnim Anim = Ped_M_FalldownA
  Die
endscript
script Lon_CrazyCopper_SetFlag
  Printf "****set flag?****"
  Printf "****set flag?****"
  Printf "****set flag?****"
  Printf "****set flag?****"
  Printf "****set flag?****"
  SetFlag flag = FLAG_LON_CRAZYCOPPER_SLAP
  if GetFlag flag = FLAG_LON_CRAZYCOPPER_SLAP
    Printf "*****copper hit skater flag sent*****"
  endif
endscript
script Lon_Foo
  Obj_ClearExceptions
  Obj_PlayAnim Anim = Ped_M_Idle1 cycle
  Obj_SetException ex = SkaterInRadius scr = Ped_BailWhenSkaterClose
  Obj_SetInnerRadius 7
endscript
script Ped_BailWhenSkaterClose
  Obj_ClearExceptions
  PlaySound bail04
  random( @
  Obj_CycleAnim Anim = Ped_M_FalldownA
  Obj_PlayAnim Anim = Ped_M_LayIdleA cycle
  SetTags bail = A
  @Obj_CycleAnim Anim = Ped_M_FalldownB
  Obj_PlayAnim Anim = Ped_M_LayIdleB cycle
  SetTags bail = B
  @Obj_CycleAnim Anim = Ped_M_FalldownC
  Obj_PlayAnim Anim = Ped_M_LayIdleC cycle
  SetTags bail = C
  @Obj_CycleAnim Anim = Ped_M_FalldownD
  Obj_PlayAnim Anim = Ped_M_LayIdleD cycle
  SetTags bail = D
  @Obj_CycleAnim Anim = Ped_M_FalldownE
  Obj_PlayAnim Anim = Ped_M_LayIdleE cycle
  SetTags bail = E ) 
  Obj_SetException ex = SkaterOutOfRadius scr = Ped_GetUpFromBail
  Obj_SetOuterRadius 20
endscript
script Ped_GetUpFromBail
  Obj_ClearExceptions
  GetTags
  Obj_SetAnimCycleMode Off
  Obj_WaitAnimFinished
  switch <bail>
  case A
    Obj_CycleAnim Anim = Ped_M_GetUpA
  case B
    Obj_CycleAnim Anim = Ped_M_GetUpB
  case C
    Obj_CycleAnim Anim = Ped_M_GetUpC
  case D
    Obj_CycleAnim Anim = Ped_M_GetUpD
  case E
    Obj_CycleAnim Anim = Ped_M_GetUpE
  default
    Printf "no matching case for falldown"
  endswitch
  Goto Lon_Ped_Elephant
endscript
script Lon_Ped_Elephant
  Obj_ClearExceptions
  Obj_SetException ex = ZOO_ELEPHANT_SCARED scr = Zoo_Ped_Stampede
  Obj_SetException ex = SkaterInRadius scr = Ped_BailWhenSkaterClose
  Obj_SetInnerRadius 7
  Wait random( @5 frames @10 frames @15 frames ) 
  begin
    Obj_CycleAnim Anim = Ped_M_Idle1 numcycles = random( @2 @4 @7 @9 ) 
    Obj_CycleAnim Anim = Ped_M_Idle1toIdle2
    Obj_CycleAnim Anim = Ped_M_Idle2 numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim Anim = Ped_M_Idle2toIdle3
    Obj_CycleAnim Anim = Ped_M_Idle3 numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim Anim = Ped_M_Idle3toIdle1
  repeat
endscript
FLAG_LON_BITCH_DOWN = 1
FLAG_LON_BITCH_START = 2
FLAG_LON_BITCH_STOP = 3
FLAG_LON_BITCH_SLAPPING = 4
FLAG_LON_BITCH_DODGING = 5
FLAG_LON_PIMP_ACTIVATE = 6
FLAG_LON_PIMP_BET = 7
FLAG_LON_PIMP_LOSE = 8
FLAG_LON_PIMP_WIN = 9
FLAG_LON_PIMP_MID = 10
script Lon_Bitch
  Obj_ClearFlag All
  Obj_PlayAnim Anim = Ped_Bitches_Idle cycle
  begin
    if Obj_FlagSet FLAG_LON_BITCH_START
      if GotParam Left
        Obj_CycleAnim Anim = Ped_Bitches_Taunt1
      else
        Wait 100 frames
        Obj_CycleAnim Anim = Ped_Bitches_Taunt2
      endif
      break
    endif
    Wait 10 frames
  repeat
  GotoPreserveParams Lon_Bitch_Start
endscript
script Lon_Bitch_Start
  begin
    begin
      if Obj_FlagSet FLAG_LON_BITCH_STOP
        Obj_CycleAnim Anim = Ped_Bitches_Spit from = start to = 74
        if GotParam Left
          Kill name = TRG_Lon_Bitch_Left_Spit
          Create name = TRG_Lon_Bitch_Left_Spit
        else
          Kill name = TRG_Lon_Bitch_Right_Spit
          Create name = TRG_Lon_Bitch_Right_Spit
        endif
        Obj_PlaySound Footstep01
        Obj_CycleAnim Anim = Ped_Bitches_Spit from = 75 to = end
        GotoPreserveParams Lon_Bitch
      endif
      if <BitchName>:Obj_AnimEquals Ped_Bitches_Slap2
        GotoPreserveParams Lon_Bitch_Dodge
      endif
      Wait 1 frame
    repeat randomrange(10, 50)
    if GotParam Left
       <BitchName>:Obj_SwitchScript Lon_Bitch_Dodge params = { BitchName = TRG_Lon_Bitch_Left Right }
    endif
    Obj_CycleAnim Anim = Ped_Bitches_Slap2 from = start to = 20
    Obj_PlaySound RevertWood
    Obj_CycleAnim Anim = Ped_Bitches_Slap2 from = 21 to = end
    Obj_PlayAnim Anim = Ped_Bitches_Idle cycle
  repeat
endscript
script Lon_Bitch_Dodge
  Obj_SetFlag FLAG_LON_BITCH_DODGING
  begin
    if <BitchName>:Obj_AnimEquals Ped_Bitches_Slap2
      random( @@
      @Wait 20 frames
      GotoPreserveParams Lon_Bitch_GotHit ) 
      random( @
      Wait 20 frames
      Obj_CycleAnim Anim = Ped_Bitches_DodgeBack
      @Wait 20 frames
      Obj_CycleAnim Anim = Ped_Bitches_DodgeLeft
      @Wait 20 frames
      Obj_CycleAnim Anim = Ped_Bitches_DodgeRight ) 
      Obj_PlayAnim Anim = Ped_Bitches_Idle cycle
      begin
        if <BitchName>:Obj_AnimEquals Ped_Bitches_Slap2
        else
          Obj_ClearFlag FLAG_LON_BITCH_DODGING
          GotoPreserveParams Lon_Bitch_Start
        endif
        Wait 1 frame
      repeat
    endif
    Wait 1 frame
  repeat
endscript
script Lon_Bitch_GotHit
  SendFlag name = <BitchName> FLAG_LON_BITCH_STOP
  Obj_PlayAnim Anim = Ped_Bitches_DodgeBack
  Wait 15 frames
  PlaySound BitchSlap2
  Obj_CycleAnim Anim = Ped_Bitches_Knockdown
  Obj_SetFlag FLAG_LON_BITCH_DOWN
  SendFlag prefix = "TRG_Lon_Bitch_Ped" FLAG_LON_BITCH_STOP
  Obj_CycleAnim Anim = Ped_Bitches_LyingIdle numcycles = 2
  Obj_CycleAnim Anim = Ped_Bitches_GetUp
  GotoPreserveParams Lon_Bitch
endscript
script Lon_Bitch_Left_Spit
  Obj_LockToObject ObjectName = TRG_Lon_Bitch_Left (0, 62, 6)
  Obj_LockToObject Off ObjectName = TRG_Lon_Bitch_Left
  Obj_MoveToNode name = TRG_Lon_Bitch_Right time = 0.3
  Obj_WaitMove
  Die
endscript
script Lon_Bitch_Right_Spit
  Obj_LockToObject ObjectName = TRG_Lon_Bitch_Right (0, 60, 5)
  Obj_LockToObject ObjectName = TRG_Lon_Bitch_Right Off
  Obj_MoveToNode name = TRG_Lon_Bitch_Left time = 0.3
  Obj_WaitMove
  Die
endscript
script Lon_AddMinigame_Pimp
  AddMinigame_Generic {
    CAREER_ONLY
    activate_script = Lon_Minigame_Pimp_Activate
    deactivate_script = Lon_Minigame_Pimp_Deactivate
    cash_limit = 500 }
endscript
script Lon_Minigame_Pimp
  speech_box_exit
  if GoalManager_HasActiveGoals
    GoalManager_DeactivateAllGoals
  endif
  Wait 1 frame
  GoalManager_ActivateGoal name = Lon_Goal_Minigame_Generic
endscript
script Lon_Minigame_Pimp_EndGame
  GoalManager_DeactivateGoal name = Lon_Goal_Minigame_Generic
endscript
script Lon_Minigame_Pimp_Activate
  Lon_Pimp_Bet_Activate
endscript
script Lon_Minigame_Pimp_Deactivate
endscript
script Lon_Pimp_Start avoid_radius = 3
  Obj_SpawnScript Lon_Pimp_Idle
  Obj_SetInnerAvoidRadius <avoid_radius>
  Obj_SetException ex = SkaterInAvoidRadius scr = goal_pro_bounce_skater params = { avoid_radius = <avoid_radius> }
  if IsCareerMode
    setup_ped_speech {
      ped_id = TRG_Lon_Pimp01
      display_name = "Pimp" speed = 200
      text = [ "Pimp:\n" "Oi, wanna bet on one of these lovely ladies?\n"
        "Press \b3 to Accept\nPress \m1 to Decline" ]
      pad_choose_script = Lon_Minigame_Pimp
      pad_back_script = Lon_Pimp_Bet_No
    }
  endif
endscript
script Lon_Pimp_Betting_Idle
  KillSpawnedScript name = Lon_Pimp_Idle
  Obj_LookAtObject type = skater time = 0.25
  StopStream
  Wait 1 frame
  PlayStream vol = 300 Pimp_Lon_Bitch
  Obj_PlayAnim Anim = Ped_M_Idle1 cycle
  begin
    if Obj_FlagSet FLAG_LON_PIMP_BET
      StopStream Pimp_Lon_Bitch
      Wait 1 frame
      Obj_PlayStream vol = 300 randomnorepeat( @
      Pimp_Ack02
      @Pimp_Ack03
      @Pimp_Ack04
      @Pimp_Ack05
      @Pimp_Ack06 ) 
      Obj_ClearFlag FLAG_LON_PIMP_BET
    endif
    if Obj_FlagSet FLAG_LON_PIMP_LOSE
      Obj_PlayStream vol = 300 randomnorepeat( @
      Pimp_Lose01
      @Pimp_Lose02
      @Pimp_Lose03 ) 
      Obj_ClearFlag FLAG_LON_PIMP_LOSE
    endif
    if Obj_FlagSet FLAG_LON_PIMP_WIN
      Obj_PlayStream vol = 300 randomnorepeat( @
      Pimp_Win01
      @Pimp_Win02 ) 
      Obj_ClearFlag FLAG_LON_PIMP_WIN
    endif
    if Obj_FlagSet FLAG_LON_PIMP_MID
      Obj_PlayStream vol = 300 randomnorepeat( @
      Pimp_Mid01
      @Pimp_Mid02
      @Pimp_Mid03 ) 
      Obj_ClearFlag FLAG_LON_PIMP_MID
    endif
    if Obj_FlagNotSet FLAG_LON_PIMP_ACTIVATE
      StopStream Pimp_Lon_Bitch
      Obj_SpawnScript Lon_Pimp_Idle
    endif
    Wait 5 frames
  repeat
endscript
script Lon_Pimp_Idle
  KillSpawnedScript name = Lon_Pimp_Betting_Idle
  Obj_CycleAnim Anim = Cheer
  begin
    Obj_LookAtObject type = skater time = 0.25
    Obj_PlayStream vol = 300 randomnorepeat( @@
    @Pimp_Far01
    @Pimp_Far02
    @Pimp_Far03
    @Pimp_Far04
    @Pimp_Far05
    @Pimp_Far06
    @Pimp_Far07
    @Pimp_Far08
    @Pimp_Far09
    @Pimp_Far10 ) 
    random( @
    Obj_CycleAnim Anim = Cheer
    @Obj_CycleAnim Anim = Wave
    @Obj_CycleAnim Anim = ComeOver ) 
  repeat
endscript
script Lon_Pimp_Bet_Activate
  UnPauseSkaters
  MakeSkaterGoto SkaterInit
  MakeSkaterGoto Lon_Bitch_Activate_Skater
  SendFlag name = TRG_Lon_Pimp01 FLAG_LON_PIMP_ACTIVATE
  TRG_Lon_Pimp01:Obj_SpawnScript Lon_Pimp_Betting_Idle
  create_speech_box {
    pad_back_script = Lon_Pimp_Bet_No
    pad_left_script = Lon_Pimp_Bet_Left
    pad_right_script = Lon_Pimp_Bet_Right
    pad_choose_script = null_script
    text = [ "\c7Pimp:\c0\n Oi, these Slappers are tough! Pick the winner and win $100.\n \b6 - Left, "
      "\b5 - Right or \m1 to chicken out." ]
  }
endscript
script Lon_Pimp_Bet_Left
  speech_box_exit
  PlaySkaterCamAnim skater = 0 stop
  PlaySkaterCamAnim skater = 0 name = Lon_Cam_Bitch01 play_hold allow_pause = 1
  SendFlag prefix = "TRG_Lon_Bitch_" FLAG_LON_BITCH_START
  SendFlag name = TRG_Lon_Pimp01 FLAG_LON_PIMP_BET
  MakeSkaterGoto Lon_Bitch_Activate_SkaterCheer params = { Left }
  begin
    if TRG_Lon_Bitch_Right:Obj_FlagSet FLAG_LON_BITCH_DOWN
      SendFlag name = TRG_Lon_Pimp01 FLAG_LON_PIMP_WIN
      GoalManager_AwardMinigameCash name = Lon_Goal_Minigame_Generic 100
      create_panel_message id = current_horse_spot text = "You Win!" just = [ center center ] z_priority = -5 rgba = [ 128 128 128 128 ]
      break
    endif
    if TRG_Lon_Bitch_Left:Obj_FlagSet FLAG_LON_BITCH_DOWN
      SendFlag name = TRG_Lon_Pimp01 FLAG_LON_PIMP_LOSE
      create_panel_message id = current_horse_spot text = "You Lose!" just = [ center center ] z_priority = -5 rgba = [ 128 128 128 128 ]
      break
    endif
    Wait 30 frames
  repeat
endscript
script Lon_Pimp_Bet_Right
  speech_box_exit
  PlaySkaterCamAnim skater = 0 stop
  PlaySkaterCamAnim skater = 0 name = Lon_Cam_Bitch01 play_hold allow_pause = 1
  SendFlag prefix = "TRG_Lon_Bitch_" FLAG_LON_BITCH_START
  SendFlag name = TRG_Lon_Pimp01 FLAG_LON_PIMP_BET
  MakeSkaterGoto Lon_Bitch_Activate_SkaterCheer params = { Right }
  begin
    if TRG_Lon_Bitch_Left:Obj_FlagSet FLAG_LON_BITCH_DOWN
      SendFlag name = TRG_Lon_Pimp01 FLAG_LON_PIMP_WIN
      GoalManager_AwardMinigameCash name = Lon_Goal_Minigame_Generic 100
      create_panel_message id = current_horse_spot text = "You Win!" just = [ center center ] z_priority = -5 rgba = [ 128 128 128 128 ]
      break
    endif
    if TRG_Lon_Bitch_Right:Obj_FlagSet FLAG_LON_BITCH_DOWN
      ClearFlag name = TRG_Lon_Pimp01 FLAG_LON_PIMP_LOSE
      create_panel_message id = current_horse_spot text = "You Lose!" just = [ center center ] z_priority = -5 rgba = [ 128 128 128 128 ]
      break
    endif
    Wait 30 frames
  repeat
endscript
script Lon_Pimp_Bet_No
  Lon_Minigame_Pimp_EndGame
  speech_box_exit
  MakeSkaterGoto SkaterInit
  MakeSkaterGoto Lon_Bitch_Activate_SkaterEnd
endscript
script Lon_Bitch_Activate_Skater
  Obj_ClearFlag All
  PlaySkaterCamAnim skater = 0 name = Lon_Cam_Bitch play_hold allow_pause = 1
  ClearExceptions
  ClearTrickQueue
  ClearEventBuffer
  SetRollingFriction 1000
  DisablePlayerInput
  Obj_MoveToNode name = TRG_Lon_Skater_BitchWait orient
  PlayAnim Anim = BoardShake BlendPeriod = 0.3 cycle
endscript
script Lon_Bitch_Activate_SkaterCheer
  PlayAnim Anim = BoardWave BlendPeriod = 0.3
  WaitAnimFinished
  PlayAnim Anim = BoardShake BlendPeriod = 0.3 cycle
  begin
    if GotParam Left
      if TRG_Lon_Bitch_Left:Obj_FlagSet FLAG_LON_BITCH_DOWN
        PlayAnim Anim = BoardShrug BlendPeriod = 0.3
        WaitAnimFinished
        break
      endif
      if TRG_Lon_Bitch_Right:Obj_FlagSet FLAG_LON_BITCH_DOWN
        PlayAnim Anim = BoardWave BlendPeriod = 0.3
        WaitAnimFinished
        break
      endif
      if TRG_Lon_Bitch_Left:Obj_AnimEquals [ Ped_Bitches_Slap2 ]
        random( @
        PlayAnim Anim = BoardClap BlendPeriod = 0.3
        WaitAnimFinished
        PlayAnim Anim = BoardShake BlendPeriod = 0.3 cycle
        @PlayAnim Anim = BoardPump BlendPeriod = 0.3
        WaitAnimFinished
        PlayAnim Anim = BoardShake BlendPeriod = 0.3 cycle ) 
        begin
          if TRG_Lon_Bitch_Left:Obj_AnimEquals [ Ped_Bitches_Slap2 ]
          else
            break
          endif
          Wait 5 frames
        repeat
      endif
      if TRG_Lon_Bitch_Right:Obj_AnimEquals [ Ped_Bitches_Slap2 ]
        random( @
        PlayAnim Anim = BoardShrug BlendPeriod = 0.3
        WaitAnimFinished
        PlayAnim Anim = BoardShake BlendPeriod = 0.3 cycle
        @PlayAnim Anim = BoardShake BlendPeriod = 0.3 cycle ) 
        begin
          if TRG_Lon_Bitch_Right:Obj_AnimEquals [ Ped_Bitches_Slap2 ]
          else
            break
          endif
          Wait 5 frames
        repeat
      endif
    endif
    if GotParam Right
      if TRG_Lon_Bitch_Right:Obj_FlagSet FLAG_LON_BITCH_DOWN
        PlayAnim Anim = BoardShrug BlendPeriod = 0.3
        WaitAnimFinished
        break
      endif
      if TRG_Lon_Bitch_Left:Obj_FlagSet FLAG_LON_BITCH_DOWN
        PlayAnim Anim = BoardWave BlendPeriod = 0.3
        WaitAnimFinished
        break
      endif
      if TRG_Lon_Bitch_Right:Obj_AnimEquals [ Ped_Bitches_Slap2 ]
        random( @
        PlayAnim Anim = BoardClap
        WaitAnimFinished
        PlayAnim Anim = BoardShake BlendPeriod = 0.3 cycle
        @PlayAnim Anim = BoardPump BlendPeriod = 0.3
        WaitAnimFinished
        PlayAnim Anim = BoardShake BlendPeriod = 0.3 cycle ) 
        begin
          if TRG_Lon_Bitch_Right:Obj_AnimEquals [ Ped_Bitches_Slap2 ]
          else
            break
          endif
          Wait 5 frames
        repeat
      endif
      if TRG_Lon_Bitch_Left:Obj_AnimEquals [ Ped_Bitches_Slap2 ]
        random( @
        PlayAnim Anim = BoardShrug BlendPeriod = 0.3
        WaitAnimFinished
        PlayAnim Anim = BoardShake BlendPeriod = 0.3 cycle
        @PlayAnim Anim = BoardShake BlendPeriod = 0.3 cycle ) 
        begin
          if TRG_Lon_Bitch_Left:Obj_AnimEquals [ Ped_Bitches_Slap2 ]
          else
            break
          endif
          Wait 5 frames
        repeat
      endif
    endif
    Wait 1 frame
  repeat
  MakeSkaterGoto Lon_Bitch_Activate_SkaterEnd
endscript
script Lon_Bitch_Activate_SkaterEnd
  if ObjectExists id = current_horse_spot
    DestroyScreenElement id = current_horse_spot
  endif
  PlaySkaterCamAnim skater = 0 stop
  ClearFlag name = TRG_Lon_Pimp01 FLAG_LON_PIMP_ACTIVATE
  SetRollingFriction 1
  UnPauseSkaters
  Obj_MoveToNode name = TRG_Lon_Skater_BitchEnd orient
  EnablePlayerInput
  MakeSkaterGoto OnGroundAi
endscript
script Lon_BitchSpectator_BailWhenSkaterClose
  Obj_ClearExceptions
  PlaySound bail04
  random( @
  Obj_CycleAnim Anim = Ped_M_FalldownA
  Obj_PlayAnim Anim = Ped_M_LayIdleA cycle
  SetTags bail = A
  @Obj_CycleAnim Anim = Ped_M_FalldownB
  Obj_PlayAnim Anim = Ped_M_LayIdleB cycle
  SetTags bail = B
  @Obj_CycleAnim Anim = Ped_M_FalldownC
  Obj_PlayAnim Anim = Ped_M_LayIdleC cycle
  SetTags bail = C
  @Obj_CycleAnim Anim = Ped_M_FalldownD
  Obj_PlayAnim Anim = Ped_M_LayIdleD cycle
  SetTags bail = D
  @Obj_CycleAnim Anim = Ped_M_FalldownE
  Obj_PlayAnim Anim = Ped_M_LayIdleE cycle
  SetTags bail = E ) 
  Obj_SetException ex = SkaterOutOfRadius scr = Lon_BitchSpectator_GetUpFromBail
  Obj_SetOuterRadius 5
endscript
script Lon_BitchSpectator_GetUpFromBail
  Obj_ClearExceptions
  GetTags
  Obj_SetAnimCycleMode Off
  Obj_WaitAnimFinished
  switch <bail>
  case A
    Obj_CycleAnim Anim = Ped_M_GetUpA
  case B
    Obj_CycleAnim Anim = Ped_M_GetUpB
  case C
    Obj_CycleAnim Anim = Ped_M_GetUpC
  case D
    Obj_CycleAnim Anim = Ped_M_GetUpD
  case E
    Obj_CycleAnim Anim = Ped_M_GetUpE
  default
    Printf "no matching case for pimp spec"
  endswitch
  Goto Lon_Bitch_Spectator
endscript
script Lon_Bitch_Spectator
  Obj_SetInnerRadius 5
  Obj_SetException ex = SkaterInRadius scr = Lon_BitchSpectator_BailWhenSkaterClose
  begin
    begin
      if TRG_Lon_Bitch_Left:Obj_FlagSet FLAG_LON_BITCH_START
        random( @
        Obj_CycleAnim Anim = Ped_M_Cheering
        @Obj_CycleAnim Anim = Ped_M_Clap
        @Obj_CycleAnim Anim = Ped_M_ShakeFist ) 
        Obj_PlayAnim Anim = Ped_M_Idle1 cycle
        break
      else
        random( @
        Obj_CycleAnim Anim = Ped_M_Talk_Shrug
        @Obj_CycleAnim Anim = Ped_M_Talk_RaiseArn
        @Obj_CycleAnim Anim = Ped_M_Talk_WhoKnows
        @Obj_CycleAnim Anim = Ped_M_Talk_ISupposeSo
        @Obj_CycleAnim Anim = Ped_M_Talk_TheyWereThisBig
        @Obj_CycleAnim Anim = Ped_M_Talk1
        @Obj_CycleAnim Anim = Ped_M_Talk2
        @Obj_CycleAnim Anim = Ped_M_Talk_ShagAir ) 
        Obj_PlayAnim Anim = Ped_M_Idle1 cycle
      endif
      Wait 5 frames
    repeat
  create prefix = Lon_Bitch_Spectator_RNG random ( @1 @2 )
    if Lon_Bitch_Spectator_RNG = 1
    begin
      if TRG_Lon_Bitch_Left:Obj_AnimEquals Ped_Bitches_Slap2
        random( @
        Obj_CycleAnim Anim = Ped_M_Wave
        @Obj_CycleAnim Anim = Ped_M_Cheering
        @Obj_CycleAnim Anim = Ped_M_Clap
        @Obj_CycleAnim Anim = Ped_M_Idle1
        @Obj_CycleAnim Anim = Ped_M_ShakeFist
        @Obj_CycleAnim Anim = Ped_M_ThumbUp
         ) 
        Obj_PlayAnim Anim = Ped_M_Idle1 cycle
        begin
          if TRG_Lon_Bitch_Left:Obj_AnimEquals Ped_Bitches_Slap2
          else
            break
          endif
          Wait 5 frames
        repeat
      else
        if TRG_Lon_Bitch_Left:Obj_AnimEquals Ped_F_Knockdown
        endif
      endif
      if Obj_FlagSet FLAG_LON_BITCH_STOP
        break
      endif
      Wait 5 frames
    repeat
   else
    begin
      if TRG_Lon_Bitch_Right:Obj_AnimEquals Ped_Bitches_Slap2
        random( @
        Obj_CycleAnim Anim = Ped_M_Wave
        @Obj_CycleAnim Anim = Ped_M_Cheering
        @Obj_CycleAnim Anim = Ped_M_Clap
        @Obj_CycleAnim Anim = Ped_M_Idle1
        @Obj_CycleAnim Anim = Ped_M_ShakeFist
        @Obj_CycleAnim Anim = Ped_M_ThumbUp
         ) 
        Obj_PlayAnim Anim = Ped_M_Idle1 cycle
        begin
          if TRG_Lon_Bitch_Right:Obj_AnimEquals Ped_Bitches_Slap2
          else
            break
          endif
          Wait 5 frames
        repeat
      else
        if TRG_Lon_Bitch_Right:Obj_AnimEquals Ped_F_Knockdown
        endif
      endif
      if Obj_FlagSet FLAG_LON_BITCH_STOP
        break
      endif
      Wait 5 frames
    repeat
  endif
    Obj_PlayAnim Anim = Ped_M_Idle1 cycle
  repeat
endscript
script Lon_Car_DecelIntoLevel
  Obj_SetPathVelocity 30 mph
endscript
script Lon_Car_AccelOutOfLevel
  Obj_SetPathVelocity 60 mph
endscript
script Lon_FlatlandCombo_Start
  MakeSkaterGoto HandBrake
  SpawnScript Lon_FlatlandCombo_SetSkaterSpeed
  Create name = TRG_Lon_FlatlandCombo_CheckManual
endscript
script Lon_FlatlandCombo_Deactivate
  KillSpawnedScript name = Lon_FlatlandCombo_SetSkaterSpeed
  MakeSkaterGoto SkaterInit
  Kill name = TRG_Lon_FlatlandCombo_CheckManual
endscript
script Lon_FlatlandCombo_Win
  GoalManager_SetGoalFlag name = Lon_Goal_Trickspot2 got_4 1
endscript
script Lon_FlatlandCombo_SetSkaterSpeed
  begin
    skater:SetRollingFriction 20000
    Wait 1 frame
  repeat
endscript
script Lon_FlatlandCombo_CheckManual_Bail
  Obj_ClearExceptions
  if ObjectExists id = current_goal
    DestroyScreenElement id = current_goal
  endif
  create_panel_block id = current_goal text = "Try Again..." style = panel_message_goal
  Wait 0.5 second
  Goto <ReturnScript>
endscript
script Lon_FlatlandCombo_CheckManual
  m1 = { [ Manual_Range2 Manual_Range NoseManual_Range2 NoseManual_Range ] }
  Obj_ClearExceptions
  Wait 1 second
  if ObjectExists id = current_goal
    DestroyScreenElement id = current_goal
  endif
  create_panel_block id = current_goal text = "Manual\n (\b7+\b4 or \b4+\b7)" style = panel_message_goal
  begin
    if skater:AnimEquals <m1>
      if ObjectExists id = current_goal
        DestroyScreenElement id = current_goal
      endif
      create_panel_block id = current_goal text = "Great now land it!" style = panel_message_goal
      break
    endif
    Wait 1 frame
  repeat
  Obj_SetException ex = SkaterBailed scr = Lon_FlatlandCombo_CheckManual_Bail params = { ReturnScript = Lon_FlatlandCombo_CheckManual }
  Obj_SetException ex = SkaterLanded scr = Lon_FlatlandCombo_CheckManual_Flat
endscript
script Lon_FlatlandCombo_CheckManual_Flat
  m1 = { [ Manual_Range2 Manual_Range NoseManual_Range2 NoseManual_Range ] }
  m2 = { [ Pogo_Bounce ] }
  Obj_ClearExceptions
  GoalManager_SetGoalFlag name = Lon_Goal_Trickspot2 got_1 1
  Wait 1 second
  if ObjectExists id = current_goal
    DestroyScreenElement id = current_goal
  endif
  create_panel_block id = current_goal text = "Now manual\n (\b7+\b4 or \b4+\b7)\n to a Pogo\n (\b0 + \b0)" style = panel_message_goal
  begin
    if skater:AnimEquals <m2>
      if ObjectExists id = current_goal
        DestroyScreenElement id = current_goal
      endif
      create_panel_block id = current_goal text = "Great now land it!" style = panel_message_goal
      break
    endif
    Wait 1 frame
  repeat
  Obj_SetException ex = SkaterBailed scr = Lon_FlatlandCombo_CheckManual_Bail params = { ReturnScript = Lon_FlatlandCombo_CheckManual_Flat }
  Obj_SetException ex = SkaterLanded scr = Lon_FlatlandCombo_CheckManual_FlatMod
endscript
script Lon_FlatlandCombo_CheckManual_FlatMod
  m1 = { [ Manual_Range2 Manual_Range NoseManual_Range2 NoseManual_Range ] }
  m2 = { [ Pogo_Bounce ] }
  m3 = { [ Pogo_Kickfoot ] }
  Obj_ClearExceptions
  GoalManager_SetGoalFlag name = Lon_Goal_Trickspot2 got_2 1
  Wait 1 second
  if ObjectExists id = current_goal
    DestroyScreenElement id = current_goal
  endif
  create_panel_block id = current_goal text = "Now Manual\n (\b7+\b4 or \b4+\b7)\n to a Pogo\n (\b0 + \b0)\n to a Wrap Around\n (\b1 + \b1)" style = panel_message_goal
  begin
    if skater:AnimEquals <m2>
      begin
        if skater:AnimEquals <m3>
          if ObjectExists id = current_goal
            DestroyScreenElement id = current_goal
          endif
          create_panel_block id = current_goal text = "Great now land it!" style = panel_message_goal
          break
        endif
        Wait 1 frame
      repeat
      break
    endif
    Wait 1 frame
  repeat
  Obj_SetException ex = SkaterBailed scr = Lon_FlatlandCombo_CheckManual_Bail params = { ReturnScript = Lon_FlatlandCombo_CheckManual_FlatMod }
  Obj_SetException ex = SkaterLanded scr = Lon_FlatlandCombo_CheckManual_Combo
endscript
script Lon_FlatlandCombo_CheckManual_Combo
  Obj_ClearExceptions
  GoalManager_SetGoalFlag name = Lon_Goal_Trickspot2 got_3 1
  Wait 1 second
  if ObjectExists id = current_goal
    DestroyScreenElement id = current_goal
  endif
  create_panel_block id = current_goal text = "Now do a 8000 point flatland combo." style = panel_message_goal
  begin
    if skater:InAir
    endif
    if SkaterCurrentScorePotGreaterThan 8000
      create_panel_block id = current_goal text = "Great now land it!" style = panel_message_goal
      break
    endif
    Wait 1 frame
  repeat
  Obj_SetException ex = SkaterBailed scr = Lon_FlatlandCombo_CheckManual_Bail params = { ReturnScript = Lon_FlatlandCombo_CheckManual_Combo }
  Obj_SetException ex = SkaterLanded scr = Lon_FlatlandCombo_Win
endscript
FLAG_LON_TRICKONCAR_ONCAR = 0
FLAG_LON_TRICKONCAR_OFFCAR = 1
script Lon_TrickOnCar_Intro
  SpawnScript Lon_KillCars
  Kill name = TRG_Lon_Car_TrickOnCar01
  Create name = TRG_Lon_Car_TrickOnCar01
endscript
script Lon_TrickOnCar_Start
  SpawnScript Lon_TrickOnCar_SetSkaterSpeed id = TrickOnCarScript
  skater:TeleportSkaterToNode nodename = TRG_Lon_TrickOnCarRestart
  TRG_Lon_Car_TrickOnCar01:Obj_SetFlag FLAG_LON_TRICKONCAR_ONCAR
endscript
script Lon_TrickOnCar_Deactivate
  KillSpawnedScript id = TrickOnCarScript
  TRG_Lon_Car_TrickOnCar01:Die
  SpawnScript Lon_CreateCars
endscript
script Lon_TrickOnCar_Fail
  MakeSkaterGoto PedKnockDown params = { #"Jump" }
  TRG_Lon_Car_TrickOnCar01:Obj_SetPathVelocity 70
  Wait 2 seconds
  GoalManager_LoseGoal name = Lon_Goal_Trickspot2
endscript
script Lon_TrickOnCar
  begin
    Wait 5 frames
    if Obj_FlagSet FLAG_LON_TRICKONCAR_ONCAR
      Car_Generic01 DefaultSpeed = 30 TurnDist = 40 NoSkater
      break
    endif
  repeat
  create_panel_message id = leaving_message text = "3 seconds to start combo"
  begin
    Wait 5 frames
    if SkaterCurrentScorePotGreaterThan 0
      Obj_SpawnScript Lon_TrickOnCar_Timer id = TrickOnCarScript
      GotoPreserveParams Lon_TrickOnCar_CheckSkaterOnCar
    endif
  repeat 36
  Goto Lon_TrickOnCar_Fail
endscript
script Lon_TrickOnCar_CheckSkaterOnCar
  begin
    Wait 5 frames
    if Obj_FlagSet FLAG_LON_TRICKONCAR_OFFCAR
      begin
        Wait 1 frame
        if Obj_FlagSet FLAG_LON_TRICKONCAR_ONCAR
          GotoPreserveParams Lon_TrickOnCar_CheckSkaterOnCar
        endif
      repeat 60
      GotoPreserveParams Lon_TrickOnCar_Fail
    else
      if SkaterCurrentScorePotLessThan 1
        GotoPreserveParams Lon_TrickOnCar_Fail
      endif
    endif
  repeat
endscript
script Lon_TrickOnCar_SetSkaterSpeed
  begin
    skater:SetRollingFriction 20000
    Wait 1 frame
  repeat
endscript
script Lon_TrickOnCar_Timer
  Wait 15 seconds
  GoalManager_WinGoal name = Lon_Goal_Trickspot2
endscript
script Lon_ParkingNazi_Intro
  SpawnScript Lon_ParkingNazi_CheckGround
  if IsAlive name = TRG_Lon_ParkingNazi_Ghost01
    TRG_Lon_ParkingNazi_Ghost01:Die
  endif
  Create name = TRG_Lon_ParkingNazi_Ghost01
endscript
script Lon_ParkingNazi_Deactivate
  KillSpawnedScript name = Lon_ParkingNazi_CheckGround
  if IsAlive name = TRG_Lon_ParkingNazi_Ghost01
    TRG_Lon_ParkingNazi_Ghost01:Die
  endif
  TRG_Lon_Car_ParkGarage_Gap01:Obj_ClearFlag All
  TRG_Lon_Car_ParkGarage_Gap02:Obj_ClearFlag All
  TRG_Lon_Car_ParkGarage_Gap03:Obj_ClearFlag All
  TRG_Lon_Car_ParkGarage_Gap04:Obj_ClearFlag All
  TRG_Lon_Car_ParkGarage_Gap01:Lon_ParkingGarage_CarLighting
  TRG_Lon_Car_ParkGarage_Gap02:Lon_ParkingGarage_CarLighting
  TRG_Lon_Car_ParkGarage_Gap03:Lon_ParkingGarage_CarLighting
  TRG_Lon_Car_ParkGarage_Gap04:Lon_ParkingGarage_CarLighting
endscript
script Lon_Gap_CrazyAmericans01
  if GoalManager_GoalIsActive name = lon_goal_gaps
    Lon_ParkingNazi_CheckGapOrder FirstCar
  endif
endscript
script Lon_Gap_CrazyAmericans02
  if GoalManager_GoalIsActive name = lon_goal_gaps
    Lon_ParkingNazi_CheckGapOrder SecondCar
  endif
endscript
script Lon_Gap_CrazyAmericans03
  if GoalManager_GoalIsActive name = lon_goal_gaps
    Lon_ParkingNazi_CheckGapOrder ThirdCar
  endif
endscript
script Lon_Gap_CrazyAmericans04
  if GoalManager_GoalIsActive name = lon_goal_gaps
    Lon_ParkingNazi_CheckGapOrder FourthCar
  endif
endscript
script Lon_ParkingNazi_Gap
  GetGap score = 500 text = "Crazy Americans"
endscript
script Lon_ParkingNazi_CheckGround
  begin
    Wait 1 frame
    if SkaterCurrentScorePotGreaterThan 1
      begin
        Wait 1 frame
        if SkaterCurrentScorePotLessThan 1
          GoalManager_LoseGoal name = lon_goal_gaps
        endif
      repeat
    endif
  repeat
endscript
script Lon_ParkingNazi_ColorCar
  Obj_SetLightAmbientColor r = 100 g = 50 B = 50
  Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 B = 0
  Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 B = 0
endscript
script Lon_ParkingNazi_CheckGapOrder
  if TriggerType TRIGGER_LAND_ON
    Lon_ParkingNazi_Gap
    if GotParam FirstCar
      GoalManager_SetGoalFlag name = lon_goal_gaps got_1 1
      TRG_Lon_Car_ParkGarage_Gap01:Lon_ParkingNazi_ColorCar
    else
      if GotParam SecondCar
        if GoalManager_GoalFlagSet name = lon_goal_gaps flag = got_1
          GoalManager_SetGoalFlag name = lon_goal_gaps got_2 1
          TRG_Lon_Car_ParkGarage_Gap02:Lon_ParkingNazi_ColorCar
        endif
      else
        if GotParam ThirdCar
          if GoalManager_GoalFlagSet name = lon_goal_gaps flag = got_2
            GoalManager_SetGoalFlag name = lon_goal_gaps got_3 1
            TRG_Lon_Car_ParkGarage_Gap03:Lon_ParkingNazi_ColorCar
          endif
        else
          if GotParam FourthCar
            if GoalManager_GoalFlagSet name = lon_goal_gaps flag = got_3
              TRG_Lon_Car_ParkGarage_Gap04:Lon_ParkingNazi_ColorCar
              KillSpawnedScript name = Lon_ParkingNazi_CheckGround
              TRG_Lon_ParkingNazi_Ghost01:Obj_ClearExceptions
              TRG_Lon_ParkingNazi_Ghost01:Obj_SetException ex = SkaterBailed scr = Lon_ParkingNazi_Lose
              TRG_Lon_ParkingNazi_Ghost01:Obj_SetException ex = SkaterLanded scr = Lon_ParkingNazi_Win
            endif
          endif
        endif
      endif
    endif
  endif
endscript
script Lon_ParkingNazi_Win
  GoalManager_SetGoalFlag name = lon_goal_gaps got_4 1
endscript
script Lon_ParkingNazi_Lose
  GoalManager_LoseGoal name = lon_goal_gaps
endscript
script Lon_SBLIght_EmitScript01
  SetPos pos = (183.1923, 102, -2246.485)
  SetLife min = 0.8 max = 0.8
  SetAngleSpread spread = 1.0
  SetSpeedRange min = 6.0 max = 6.0
  SetEmitRange width = 1.0 height = 1.0
  SetForce force = (0, 0, 0)
  SetEmitTarget target = (0, 1, 0)
  SetParticleSize sw = 10.0 sh = 10.0 ew = 1.0 eh = 1.0
  SetColor corner = 0 sr = 255 sg = 0 sb = 0 sa = 0 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
  SetColor corner = 1 sr = 255 sg = 0 sb = 0 sa = 0 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
  SetColor corner = 2 sr = 255 sg = 0 sb = 0 sa = 0 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
  SetColor corner = 3 sr = 255 sg = 0 sb = 0 sa = 0 mr = 255 mg = 200 mb = 0 ma = 0 er = 255 eg = 255 eb = 0 ea = 0 midtime = 0.5
  SetCircularEmit circular = 0
  begin
    Emit num = 1.0
    Wait 1.0 frame
  repeat
endscript
script Lon_LightSpark
  Kill name = <node>
  Create name = <node>
endscript
script Lon_SetReverb
  if not Obj_FlagSet FLAG_LON_REVERBON
    SetSfxReverb 50 mode = REV_MODE_HALL
    Obj_SetFlag FLAG_LON_REVERBON
  else
    SetSfxReverb 0 mode = REV_MODE_HALL
    Obj_ClearFlag FLAG_LON_REVERBON
  endif
endscript
script Lon_SetReverbOn
  if not Obj_FlagSet FLAG_LON_REVERBON
    SetSfxReverb 50 mode = REV_MODE_HALL
    Obj_SetFlag FLAG_LON_REVERBON
  endif
endscript
script Lon_SetReverbOff
  SetSfxReverb 0 mode = REV_MODE_HALL
  Obj_ClearFlag FLAG_LON_REVERBON
endscript
FLAG_LON_BUSWALLRIDE_1 = 31
FLAG_LON_BUSWALLRIDE_2 = 31
FLAG_LON_BUSWALLRIDE_3 = 31
FLAG_LON_BUSWALLRIDE_4 = 31
FLAG_LON_BUSWALLRIDE_5 = 31
script Lon_BusWallride_Start
  SpawnScript Lon_KillCars
  SpawnScript Lon_BusWallRide_CreateCars
  Create prefix = "TRG_Lon_BusWallride_GhostFrig"
endscript
script Lon_BusWallride_Deactivate
  KillSpawnedScript name = Lon_BusWallride_CreateNewBus
  KillSpawnedScript name = Lon_BusWallRide_CreateCars
  Kill prefix = "TRG_Lon_Car_BusWallride"
  Kill prefix = "TRG_Lon_Car_BusTag"
  Kill prefix = "TRG_Lon_BusWallride_GhostFrig"
  SpawnScript Lon_CreateCars
endscript
script Lon_Traf_BusWallride
  Car_Generic01 DefaultSpeed = 30 <...>
endscript
script Lon_AdArch_BusWallride
  Car_Generic01 DefaultSpeed = 30 <...>
  Obj_WaitMove
  if GotParam BusWallride02
    if not Obj_FlagSet FLAG_LON_BUSWALLRIDE_2
      SpawnScript Lon_BusWallride_CreateNewBus params = <...>
    endif
    Die
  endif
  if GotParam BusWallride03
    if not Obj_FlagSet FLAG_LON_BUSWALLRIDE_3
      SpawnScript Lon_BusWallride_CreateNewBus params = <...>
    endif
    Die
  endif
endscript
script Lon_Bridge_BusWallride
  Car_Generic01 DefaultSpeed = 30 <...>
  Obj_WaitMove
  if GotParam BusWallride04
    if not Obj_FlagSet FLAG_LON_BUSWALLRIDE_4
      SpawnScript Lon_BusWallride_CreateNewBus params = <...>
    endif
    Die
  endif
  if GotParam BusWallride05
    if not Obj_FlagSet FLAG_LON_BUSWALLRIDE_5
      SpawnScript Lon_BusWallride_CreateNewBus params = <...>
    endif
    Die
  endif
endscript
script Lon_BusWallride_CreateNewBus
  Wait 0.5 seconds
  Create name = <BusCreate>
endscript
script Lon_BusWallRide_CreateCars
  Create name = TRG_Lon_Car_BusWallride01
  Create name = TRG_Lon_Car_BusWallride02
  Create name = TRG_Lon_Car_BusWallride05
  Wait 5 seconds
  Create name = TRG_Lon_Car_BusWallride03
  Create name = TRG_Lon_Car_BusWallride04
endscript
script Lon_BusWallride_NewBusGap
  skater:GetGap score = 500 text = "Bloody tourists!"
endscript
script Lon_BusWallride_OldBusGap
  skater:GetGap score = 0 text = "Already got this bus"
endscript
script Lon_BusWallride_CheckSkaterState
  Obj_ClearExceptions
  begin
    if IsAlive name = <BusCreate>
      if QueryFlag name = <BusCreate> <CheckFlag>
        Obj_SetException ex = SkaterBailed scr = Lon_BusWallride_Bailed params = <...>
        Obj_SetException ex = SkaterLanded scr = Lon_BusWallride_Landed params = <...>
        break
      endif
    endif
    Wait 1 frame
  repeat
endscript
script Lon_BusWallride_Bailed
  Obj_ClearExceptions
  ClearFlag name = <BusCreate> <CheckFlag>
  GotoPreserveParams Lon_BusWallride_CheckSkaterState
endscript
script Lon_BusWallride_Landed
  Obj_ClearExceptions
  if GotParam BusWallride_1
    Create name = TRG_Lon_Car_BusTag01
    GoalManager_SetGoalFlag name = Lon_Goal_TrickSpot4 got_1 1
  endif
  if GotParam BusWallride_2
    Create name = TRG_Lon_Car_BusTag02
    GoalManager_SetGoalFlag name = Lon_Goal_TrickSpot4 got_2 1
  endif
  if GotParam BusWallride_3
    Create name = TRG_Lon_Car_BusTag03
    GoalManager_SetGoalFlag name = Lon_Goal_TrickSpot4 got_3 1
  endif
  if GotParam BusWallride_4
    Create name = TRG_Lon_Car_BusTag04
    GoalManager_SetGoalFlag name = Lon_Goal_TrickSpot4 got_4 1
  endif
  if GotParam BusWallride_5
    Create name = TRG_Lon_Car_BusTag05
    GoalManager_SetGoalFlag name = Lon_Goal_TrickSpot4 got_5 1
  endif
endscript
script Lon_BusWallride_Gap
  if GotParam BusWallride_1
    if <BusCreate>:Obj_FlagNotSet FLAG_LON_BUSWALLRIDE_1
       <BusCreate>:Obj_SetFlag FLAG_LON_BUSWALLRIDE_1
      Lon_BusWallride_NewBusGap
    else
      Lon_BusWallride_OldBusGap
    endif
  else
    if GotParam BusWallride_2
      if <BusCreate>:Obj_FlagNotSet FLAG_LON_BUSWALLRIDE_2
         <BusCreate>:Obj_SetFlag FLAG_LON_BUSWALLRIDE_2
        Lon_BusWallride_NewBusGap
      else
        Lon_BusWallride_OldBusGap
      endif
    else
      if GotParam BusWallride_3
        if <BusCreate>:Obj_FlagNotSet FLAG_LON_BUSWALLRIDE_3
           <BusCreate>:Obj_SetFlag FLAG_LON_BUSWALLRIDE_3
          Lon_BusWallride_NewBusGap
        else
          Lon_BusWallride_OldBusGap
        endif
      else
        if GotParam BusWallride_4
          if <BusCreate>:Obj_FlagNotSet FLAG_LON_BUSWALLRIDE_4
             <BusCreate>:Obj_SetFlag FLAG_LON_BUSWALLRIDE_4
            Lon_BusWallride_NewBusGap
          else
            Lon_BusWallride_OldBusGap
          endif
        else
          if GotParam BusWallride_5
            if <BusCreate>:Obj_FlagNotSet FLAG_LON_BUSWALLRIDE_5
               <BusCreate>:Obj_SetFlag FLAG_LON_BUSWALLRIDE_5
              Lon_BusWallride_NewBusGap
            else
              Lon_BusWallride_OldBusGap
            endif
          else
            skater:GetGap score = 500 text = "Ridin the Bus"
          endif
        endif
      endif
    endif
  endif
endscript
script Lon_AnimalLover_Idle
  begin
    Obj_CycleAnim Anim = Ped_Prot_Idle
  repeat
endscript
script Lon_Tetris_Start
endscript
script Lon_Tetris_DropIn
endscript
script Lon_Tetris_Deactivate
endscript
script Lon_GlassShatter
  ShatterAndDie {
    name = <name>
    area = 1000
    variance = 4
    vel_x = 30
    vel_y = -100
    vel_z = 30
    spread = 1 }
  PlaySound Hitglasspane2x
endscript
script Lon_TreeLeaves
  PlaySound bonkbush
endscript
script Lon_Bush
  random( @ ) @PlaySound bonkbush
endscript
script Lon_ElevatorDoor
  begin
    if GoalManager_GoalExists name = lon_goal_gaps
      if GoalManager_HasWonGoal name = lon_goal_gaps
        Obj_SetInnerRadius 10
        Obj_SetException ex = SkaterInRadius scr = Lon_ElevatorDoor_Open params = <...>
        break
      endif
    endif
    Wait 1 second
  repeat
endscript
script Lon_ElevatorDoor_Open
  Obj_ClearExceptions
  if GotParam Left
    Obj_MoveToRelPos (-42, 0, 0) time = 0.7
  endif
  if GotParam Right
    Obj_MoveToRelPos (42, 0, 0) time = 0.7
  endif
  Obj_WaitMove
  Obj_SetOuterRadius 30
  Obj_SetException ex = SkaterOutOfRadius scr = Lon_ElevatorDoor_Close params = <...>
endscript
script Lon_ElevatorDoor_Close
  Obj_ClearExceptions
  if GotParam Left
    Obj_MoveToRelPos (42, 0, 0) time = 0.7
  endif
  if GotParam Right
    Obj_MoveToRelPos (-42, 0, 0) time = 0.7
  endif
  Obj_WaitMove
  GotoPreserveParams Lon_ElevatorDoor
endscript
FLAG_LON_ROWLEYPRO_RESTARTFRIG = 0
FLAG_LON_ROWLEYPRO_01 = 1
FLAG_LON_ROWLEYPRO_01a = 2
FLAG_LON_ROWLEYPRO_02 = 3
FLAG_LON_ROWLEYPRO_02a = 4
FLAG_LON_ROWLEYPRO_03 = 5
FLAG_LON_ROWLEYPRO_03a = 6
FLAG_LON_ROWLEYPRO_04 = 7
FLAG_LON_ROWLEYPRO_04a = 8
FLAG_LON_ROWLEYPRO_05 = 9
FLAG_LON_ROWLEYPRO_05a = 10
FLAG_LON_ROWLEYPRO_06 = 11
FLAG_LON_ROWLEYPRO_06a = 12
FLAG_LON_ROWLEYPRO_07 = 13
FLAG_LON_ROWLEYPRO_07a = 14
FLAG_LON_ROWLEYPRO_07b = 15
FLAG_LON_ROWLEYPRO_08 = 16
FLAG_LON_ROWLEYPRO_08a = 17
FLAG_LON_ROWLEYPRO_08b = 18
FLAG_LON_ROWLEYPRO_09 = 19
FLAG_LON_ROWLEYPRO_09a = 20
FLAG_LON_ROWLEYPRO_09b = 21
script Lon_RowleyPro_Start
  SpawnScript Lon_RowleyPro_FlagChecker
  Kill name = TRG_Lon_RowleyPro_Ghost01
  Create name = TRG_Lon_RowleyPro_Ghost01
  Create prefix = "RowleyPro_Rollin"
endscript
script Lon_RowleyPro_Deactivate
  KillSpawnedScript name = Lon_RowleyPro_FlagChecker
  Kill prefix = "RowleyPro_Rollin"
endscript
script Lon_RowleyPro_SetFlag_01
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_01
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_01
endscript
script Lon_RowleyPro_SetFlag_01a
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_01a
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_01a
endscript
script Lon_RowleyPro_SetFlag_02
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_02
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_02
endscript
script Lon_RowleyPro_SetFlag_02a
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_02a
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_02a
endscript
script Lon_RowleyPro_SetFlag_03
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_03
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_03
endscript
script Lon_RowleyPro_SetFlag_03a
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_03a
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_03a
endscript
script Lon_RowleyPro_SetFlag_04
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_04
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_04
endscript
script Lon_RowleyPro_SetFlag_04a
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_04a
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_04a
endscript
script Lon_RowleyPro_SetFlag_05
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_05
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_05
endscript
script Lon_RowleyPro_SetFlag_05a
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_05a
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_05a
endscript
script Lon_RowleyPro_SetFlag_06
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_06
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_06
endscript
script Lon_RowleyPro_SetFlag_06a
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_06a
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_06a
endscript
script Lon_RowleyPro_SetFlag_07
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_07
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_07
endscript
script Lon_RowleyPro_SetFlag_07a
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_07a
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_07a
endscript
script Lon_RowleyPro_SetFlag_07b
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_07b
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_07b
endscript
script Lon_RowleyPro_SetFlag_08
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_08
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_08
endscript
script Lon_RowleyPro_SetFlag_08a
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_08a
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_08a
endscript
script Lon_RowleyPro_SetFlag_08b
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_08b
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_08b
endscript
script Lon_RowleyPro_SetFlag_09
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_09
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_09
endscript
script Lon_RowleyPro_SetFlag_09a
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_09a
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_09a
endscript
script Lon_RowleyPro_SetFlag_09b
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_09b
  Wait 1 second
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_09b
endscript
script Lon_RowleyPro_AwardTrick
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearExceptions SkaterLanded SkaterBailed
  TRG_Lon_RowleyPro_Ghost01:Obj_SetFlag FLAG_LON_ROWLEYPRO_RESTARTFRIG
  GoalManager_SetGoalFlag name = lon_goal_trickspot5 <flag> 1
  if ObjectExists id = current_goal
    DestroyScreenElement id = current_goal
  endif
  GoalManager_ReplaceTrickText name = lon_goal_trickspot5 text = <text>
  create_panel_block id = current_goal text = <TrickText> style = panel_message_goal
  Wait 0.5 seconds
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearFlag FLAG_LON_ROWLEYPRO_RESTARTFRIG
  skater:KillSkater node = <RestartNode>
endscript
script Lon_RowleyPro_PauseForInstructions
  MakeSkaterGoto HandBrake
endscript
script Lon_RowleyPro_PauseForInstructions_NG
  MakeSkaterGoto DropIn
endscript
script Lon_RowleyPro_FlagChecker
  GetKeyComboArrayFromTrickArray tricks = [ Trick_RowleyDarkSlide ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
  begin
    if ( ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_01 ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_01a ) )
      Lon_RowleyPro_AwardTrick {
        flag = got_01
        text = "OK, now...\n Land a \t1\n (\k1)\n to a FS 5-0\n (\b4 + \b0)\n on the rail"
        RestartNode = TRG_G_TS5_RestartNode }
      break
    endif
    Wait 5 frames
  repeat
  begin
    if ( ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_02 ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_02a ) )
      FormatText TextName = SpecialText "OK, now...\n Land a \t1\n (\k1)\n to a Rowley Darkslide\n (%a)\n on the rail" A = <combo_1>
      Lon_RowleyPro_AwardTrick {
        flag = got_02
        text = <SpecialText>
        RestartNode = TRG_G_TS5_RestartNode }
      break
    endif
    Wait 5 frames
  repeat
  begin
    if ( ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_03 ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_03a ) )
      Lon_RowleyPro_AwardTrick {
        flag = got_03
        text = "Decent, now lets move to a new spot."
        RestartNode = TRG_Lon_RowleyPro_RestartSA }
      break
    endif
    Wait 5 frames
  repeat
  skater:DisablePlayerInput
  Wait 0.5 second
  skater:EnablePlayerInput
  if ObjectExists id = current_goal
    DestroyScreenElement id = current_goal
  endif
  GetKeyComboArrayFromTrickArray tricks = [ Trick_RowleyDarkSlide ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
  GoalManager_ReplaceTrickText name = lon_goal_trickspot5 text = "OK now...\n Land a \t2\n (\k2)\n to a FS Crooked\n (\bd + \b0)\n on the ledge below"
  create_panel_block id = current_goal text = <TrickText> style = panel_message_goal
  begin
    if ( ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_04 ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_04a ) )
      Lon_RowleyPro_AwardTrick {
        flag = got_04
        text = "OK, now...\n Land a \t2\n (\k2)\n to a FS Overcrook\n (\bb + \b0)\n on the ledge below"
        RestartNode = TRG_Lon_RowleyPro_RestartSA }
      break
    endif
    Wait 5 frames
  repeat
  begin
    if ( ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_05 ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_05a ) )
      FormatText TextName = SpecialText "OK, now...\n Land a \t2\n (\k2)\n to a Rowley Darkslide\n (%a)\n on the ledge below" A = <combo_1>
      Lon_RowleyPro_AwardTrick {
        flag = got_05
        text = <SpecialText>
        RestartNode = TRG_Lon_RowleyPro_RestartSA }
      break
    endif
    Wait 5 frames
  repeat
  begin
    if ( ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_06 ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_06a ) )
      Lon_RowleyPro_AwardTrick {
        flag = got_06
        text = "Not too bad... One more spot to go."
        RestartNode = TRG_Lon_RowleyPro_RestartCanada }
      break
    endif
    Wait 5 frames
  repeat
  skater:DisablePlayerInput
  Wait 0.5 second
  skater:EnablePlayerInput
  if ObjectExists id = current_goal
    DestroyScreenElement id = current_goal
  endif
  GetKeyComboArrayFromTrickArray tricks = [ Trick_RowleyDarkSlide Trick_AirCasperFlip Trick_Kickflip ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
   <combo_2> = ( ( goal_tetris_trick_text.( <keycombos> [ 1 ] ) ) )
   <combo_3> = ( ( goal_tetris_trick_text.( <keycombos> [ 2 ] ) ) )
  FormatText TextName = SpecialText "Now... \t3\n (\k3)\n to a FS Feeble\n (\ba + \b0)\n on the light wire to a Kickflip\n (%c)" C = <combo_3>
  GoalManager_ReplaceTrickText name = lon_goal_trickspot5 text = <SpecialText>
  create_panel_block id = current_goal text = <TrickText> style = panel_message_goal
  begin
    if ( ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_07 ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_07a ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_07b ) )
      FormatText TextName = SpecialText "Now... \t3\n (\k3)\n to a Rowley Darkslide\n (%a)\n on the light wire to a Double Kickflip\n (%c + \b1)" A = <combo_1> C = <combo_3>
      Lon_RowleyPro_AwardTrick {
        flag = got_07
        text = <SpecialText>
        RestartNode = TRG_Lon_RowleyPro_RestartCanada }
      break
    endif
    Wait 5 frames
  repeat
  begin
    if ( ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_08 ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_08a ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_08b ) )
      FormatText TextName = SpecialText "Now... Casper Flip 360 Flip\n (%b)\n to a Rowley Darkslide\n (%a)\n Triple Kickflip out\n (%c + \b1 + \b1)" A = <combo_1> B = <combo_2> C = <combo_3>
      Lon_RowleyPro_AwardTrick {
        flag = got_08
        text = <SpecialText>
        RestartNode = TRG_Lon_RowleyPro_RestartCanada }
      break
    endif
    Wait 5 frames
  repeat
  begin
    if ( ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_09 ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_09a ) and ( QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_09b ) )
      Lon_RowleyPro_AwardTrick {
        flag = got_09
        text = "You did it!"
        RestartNode = TRG_Lon_RowleyPro_RestartCanada }
      break
    endif
    Wait 5 frames
  repeat
endscript
script Lon_RowleyPro_FailText
  if ObjectExists id = current_horse_spot trickspotend
    DestroyScreenElement id = current_horse_spot
  endif
  create_panel_block id = current_horse_spot text = "Sorry, Try again!" time = 800 just = [ center top ] z_priority = -5
endscript
script Lon_RowleyPro_TrickSpotRestart
  Printf "###restart called##"
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearExceptions SkaterLanded SkaterBailed
  begin
    if QueryFlag name = TRG_Lon_RowleyPro_Ghost01 FLAG_LON_ROWLEYPRO_RESTARTFRIG
      Goto EmptyScript
    endif
    Wait 1 frame
  repeat 10
  Lon_RowleyPro_FailText
  Wait 0.5 seconds
  begin
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_03
      skater:KillSkater node = TRG_G_TS5_RestartNode
      break
    endif
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_06
      skater:KillSkater node = TRG_Lon_RowleyPro_RestartSA
      break
    endif
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_09
      skater:KillSkater node = TRG_Lon_RowleyPro_RestartCanada
      break
    endif
    break
  repeat
endscript
script Lon_RowleyPro_TrickSpotEnd
  Printf "###ending gap###"
  EndGap GapID = ID_Lon_RowleyPro_Got_01
  EndGap GapID = ID_Lon_RowleyPro_Got_01a
  if GotParam last
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_07
      StartGap GapID = ID_Lon_RowleyPro_Got_01b TrickText = "Kickflip" TrickScript = Lon_RowleyPro_SetFlag_07b
    else
      if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_08
        StartGap GapID = ID_Lon_RowleyPro_Got_01b TrickText = "Double Kickflip" TrickScript = Lon_RowleyPro_SetFlag_08b
      else
        if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_09
          StartGap GapID = ID_Lon_RowleyPro_Got_01b TrickText = "Triple Kickflip" TrickScript = Lon_RowleyPro_SetFlag_09b
        endif
      endif
    endif
    Wait 1 second
    EndGap GapID = ID_Lon_RowleyPro_Got_01b
  endif
endscript
script Lon_RowleyPro_1stTrickSpotStart
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearExceptions SkaterLanded SkaterBailed
  TRG_Lon_RowleyPro_Ghost01:Obj_SetException ex = SkaterLanded scr = Lon_RowleyPro_TrickSpotRestart
  TRG_Lon_RowleyPro_Ghost01:Obj_SetException ex = SkaterBailed scr = Lon_RowleyPro_TrickSpotRestart
  begin
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_01
      GoalManager_ReplaceTrickText name = lon_goal_trickspot5 text = "\t1"
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01 TrickText = <TrickText> TrickScript = Lon_RowleyPro_SetFlag_01
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01a TrickText = "FS Nosegrind" TrickScript = Lon_RowleyPro_SetFlag_01a
      break
    endif
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_02
      GoalManager_ReplaceTrickText name = lon_goal_trickspot5 text = "\t1"
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01 TrickText = <TrickText> TrickScript = Lon_RowleyPro_SetFlag_02
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01a TrickText = "FS 5-0" TrickScript = Lon_RowleyPro_SetFlag_02a
      break
    endif
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_03
      GoalManager_ReplaceTrickText name = lon_goal_trickspot5 text = "\t1"
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01 TrickText = <TrickText> TrickScript = Lon_RowleyPro_SetFlag_03
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01a TrickText = "Rowley Darkslide" TrickScript = Lon_RowleyPro_SetFlag_03a
      break
    endif
    break
  repeat
endscript
script Lon_RowleyPro_2ndTrickSpotStart
  Printf "###starting gaps for 2nd trickspot###"
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearExceptions SkaterLanded SkaterBailed
  TRG_Lon_RowleyPro_Ghost01:Obj_SetException ex = SkaterLanded scr = Lon_RowleyPro_TrickSpotRestart
  TRG_Lon_RowleyPro_Ghost01:Obj_SetException ex = SkaterBailed scr = Lon_RowleyPro_TrickSpotRestart
  begin
    Printf "###in stupid loop###"
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_04
      GoalManager_ReplaceTrickText name = lon_goal_trickspot5 text = "\t2"
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01 TrickText = <TrickText> TrickScript = Lon_RowleyPro_SetFlag_04
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01a TrickText = "FS Crooked" TrickScript = Lon_RowleyPro_SetFlag_04a
      break
    endif
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_05
      GoalManager_ReplaceTrickText name = lon_goal_trickspot5 text = "\t2"
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01 TrickText = <TrickText> TrickScript = Lon_RowleyPro_SetFlag_05
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01a TrickText = "FS Overcrook" TrickScript = Lon_RowleyPro_SetFlag_05a
      break
    endif
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_06
      GoalManager_ReplaceTrickText name = lon_goal_trickspot5 text = "\t2"
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01 TrickText = <TrickText> TrickScript = Lon_RowleyPro_SetFlag_06
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01a TrickText = "Rowley Darkslide" TrickScript = Lon_RowleyPro_SetFlag_06a
      break
    endif
    break
  repeat
endscript
script Lon_RowleyPro_3rdTrickSpotStart
  TRG_Lon_RowleyPro_Ghost01:Obj_ClearExceptions SkaterLanded SkaterBailed
  TRG_Lon_RowleyPro_Ghost01:Obj_SetException ex = SkaterLanded scr = Lon_RowleyPro_TrickSpotRestart
  TRG_Lon_RowleyPro_Ghost01:Obj_SetException ex = SkaterBailed scr = Lon_RowleyPro_TrickSpotRestart
  begin
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_07
      GoalManager_ReplaceTrickText name = lon_goal_trickspot5 text = "\t3"
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01 TrickText = <TrickText> TrickScript = Lon_RowleyPro_SetFlag_07
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01a TrickText = "FS Feeble" TrickScript = Lon_RowleyPro_SetFlag_07a
      break
    endif
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_08
      GoalManager_ReplaceTrickText name = lon_goal_trickspot5 text = "\t3"
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01 TrickText = <TrickText> TrickScript = Lon_RowleyPro_SetFlag_08
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01a TrickText = "Rowley Darkslide" TrickScript = Lon_RowleyPro_SetFlag_08a
      break
    endif
    if not GoalManager_GoalFlagSet name = lon_goal_trickspot5 flag = got_09
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01 TrickText = "Casper Flip 360 Flip" TrickScript = Lon_RowleyPro_SetFlag_09
      StartGap flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL ] GapID = ID_Lon_RowleyPro_Got_01a TrickText = "Rowley Darkslide" TrickScript = Lon_RowleyPro_SetFlag_09a
      break
    endif
    break
  repeat
endscript
script Lon_GarageLighting
  Obj_AllowSkitching Off
  Obj_CreateModelLights
  Obj_EnableAmbientLight
  Obj_EnableDiffuseLight index = 0
  Obj_EnableDiffuseLight index = 1
  Lon_ParkingGarage_CarLighting
endscript
script Lon_ParkingGarage_CarLighting
  Obj_SetLightAmbientColor r = 80 g = 80 B = 80
  Obj_SetLightDiffuseColor index = 0 r = 0 g = 0 B = 0
  Obj_SetLightDiffuseColor index = 1 r = 0 g = 0 B = 0
endscript
script Lon_Proxim_SB
  if Inside
    Visible prefix = "Lon_SB_cafe"
    Visible prefix = "Lon_SB_Tree"
    Visible prefix = "Lon_SD_RiverSide"
    Visible prefix = "Lon_SB_Pillar"
    Visible prefix = "Lon_SB_Wire"
    Visible prefix = "Lon_SB_FountainBlock"
    Visible prefix = "Lon_SB_Floor"
    Visible prefix = "Lon_SB_QEBuild_Railing"
    Visible prefix = "lon_SB_UnderBridge_Ledge"
    Visible prefix = "Lon_SB_QEBuild_QP04"
    Visible prefix = "Lon_SB_QEBuild_QP07"
    Visible prefix = "Lon_SB_QP02"
    Visible prefix = "Lon_SB_QP03"
    Visible prefix = "Lon_SB_QP05"
    Visible prefix = "Lon_SB_BridgeX"
  else
    Invisible prefix = "Lon_SB_cafe"
    Invisible prefix = "Lon_SB_Tree"
    Invisible prefix = "Lon_SD_RiverSide"
    Invisible prefix = "Lon_SB_Pillar"
    Invisible prefix = "Lon_SB_Wire"
    Invisible prefix = "Lon_SB_FountainBlock"
    Invisible prefix = "Lon_SB_Floor"
    Invisible prefix = "Lon_SB_QEBuild_Railing"
    Invisible prefix = "lon_SB_UnderBridge_Ledge"
    Invisible prefix = "Lon_SB_QEBuild_QP07"
    Invisible prefix = "Lon_SB_QP02"
    Invisible prefix = "Lon_SB_QP03"
    Invisible prefix = "Lon_SB_QP05"
    Invisible prefix = "Lon_SB_BridgeX"
  endif
endscript
script Lon_Proxim_Garage
  if Inside
    Visible prefix = "Lon_Garage"
  else
    Invisible prefix = "Lon_Garage"
  endif
endscript
script Lon_Gap_PureAir_Start
  StartGap {
    GapID = <StartGapID>
    flags = PURE_AIR }
endscript
script Lon_Gap_PureManual_Start
  StartGap {
    GapID = <StartGapID>
    flags = PURE_MANUAL }
endscript
script Lon_Gap_Lip_Start
  StartGap {
    GapID = <StartGapID>
    flags = [ REQUIRE_LIP CANCEL_GROUND CANCEL_WALL CANCEL_MANUAL CANCEL_RAIL ] }
endscript
script Lon_Gap_Fountain
  StartGap {
    GapID = <StartGapID>
    flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_RAIL ]
    KeyCombo = Air_CircleUL
    TrickScript = Lon_Goal_TrickSpot_got_1 }
endscript
script Lon_Gap_Fountain2
  StartGap {
    GapID = <StartGapID>
    flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_RAIL ]
    KeyCombo = Air_CircleUL
    TrickScript = Lon_Goal_TrickSpot_got_2 }
endscript
script Lon_Gap_FountainEnd
  EndGap {
    GapID = <EndGapID>
    text = "Ye Old Fountain"
    score = 100 }
endscript
script Lon_Gap_Gen_Rail2Rail_Start
  StartGap {
    GapID = <StartGapID>
    flags = [ CANCEL_GROUND CANCEL_MANUAL ] }
endscript
script Lon_Gap_Gen_Rail2Rail_Small
  EndGap {
    GapID = <EndGapID>
    text = "Rail 2 Rail"
    score = 50 }
endscript
script Lon_Gap_Gen_Rail2Rail_Big
  EndGap {
    GapID = <EndGapID>
    text = "Big Rail 2 Rail"
    score = 100 }
endscript
script Lon_Gap_Gen_Ledge2Ledge_Small
  EndGap {
    GapID = <EndGapID>
    text = "Ledge 2 Ledge"
    score = 50 }
endscript
script Lon_Gap_Gen_BenchGap_Start
  StartGap {
    GapID = <StartGapID>
    flags = [ CANCEL_GROUND CANCEL_MANUAL ] }
endscript
script Lon_Gap_Gen_BenchGap
  EndGap {
    GapID = <EndGapID>
    text = "Bench Gap"
    score = 25 }
endscript
script Lon_Gap_Gen_Lip
  Wait 1 frame
  EndGap {
    GapID = <EndGapID>
    text = "Lip Gap"
    score = 100 }
endscript
script Lon_Gap_AcrossNG
  EndGap {
    GapID = <EndGapID>
    text = "Top 'O the Gallery"
    score = 200 }
endscript
script Lon_Gap_BusStop
  EndGap {
    GapID = <EndGapID>
    text = "Bus Stop"
    score = 50 }
endscript
script Lon_Gap_AroundArches
  EndGap {
    GapID = <EndGapID>
    text = "'Round the Arches"
    score = 200 }
endscript
script Lon_Gap_ShellBuild
  EndGap {
    GapID = <EndGapID>
    text = "Shell Building Hop"
    score = 50 }
endscript
script Lon_Gap_ShellBuildFlag
  EndGap {
    GapID = <EndGapID>
    text = "Onto the flags"
    score = 100 }
endscript
script Lon_Gap_ShellBuildFlagOff
  EndGap {
    GapID = <EndGapID>
    text = "Off the flags"
    score = 100 }
endscript
script Lon_Gap_ShellWires
  EndGap {
    GapID = <EndGapID>
    text = "Shell mega wire"
    score = 250 }
endscript
script Lon_Gap_ShellTransfer
  EndGap {
    GapID = <EndGapID>
    text = "Shell Transfer"
    score = 100 }
endscript
script Lon_Gap_TrafBigTransfer
  EndGap {
    GapID = <EndGapID>
    text = "Canada bomb"
    score = 500 }
endscript
script Lon_Gap_NelsonLip
  Wait 1 frame
  EndGap {
    GapID = <EndGapID>
    text = "Nelson's lip"
    score = 50 }
endscript
script Lon_Gap_ScafTopLip
  Wait 1 frame
  EndGap {
    GapID = <EndGapID>
    text = "Me Scaffolding"
    score = 100 }
endscript
script Lon_Gap_SALip
  Wait 1 frame
  EndGap {
    GapID = <EndGapID>
    text = "South Afrika"
    score = 50 }
endscript
script Lon_Gap_CanadaLip
  Wait 1 frame
  EndGap {
    GapID = <EndGapID>
    text = "Eh? Canada..."
    score = 50 }
endscript
script Lon_Gap_Admiralty
  EndGap {
    GapID = <EndGapID>
    text = "Admiralty"
    score = 100 }
endscript
script Lon_Gap_FuhrerHop
  EndGap {
    GapID = <EndGapID>
    text = "Garage Hop"
    score = 25 }
endscript
script Lon_Gap_Special_Start
  StartGap {
    GapID = <StartGapID>
    flags = [ CANCEL_GROUND CANCEL_MANUAL ]
    TrickText = "Ghetto Tag Grind"
    TrickScript = Lon_Goal_Special }
endscript
script Lon_Gap_Special
  EndGap {
    GapID = <EndGapID>
    text = "Southbank Lights"
    score = 500 }
endscript
script Lon_Gap_TrafManual
  EndGap {
    GapID = <EndGapID>
    text = "Ring around the Column"
    score = 500 }
endscript
script Lon_Gap_TrafManualA
  EndGap {
    GapID = <EndGapID>
    Continue = { GapID = <StartGapID> flags = PURE_MANUAL } }
endscript
script Lon_Gap_GalleryGap
  EndGap {
    GapID = <EndGapID>
    text = "Gallery Gap"
    score = 50 }
endscript
script Lon_Gap_ShellLip
  Wait 1 frame
  EndGap {
    GapID = <EndGapID>
    text = "Shell Edge"
    score = 50 }
endscript
script Lon_Gap_CanadaNokiaLip
  Wait 1 frame
  EndGap {
    GapID = <EndGapID>
    text = "Eh? Nokia..."
    score = 50 }
endscript
script Lon_Gap_YetAnotherWire
  EndGap {
    GapID = <EndGapID>
    text = "Yet Another Wire"
    score = 50 }
endscript
script Lon_Gap_CheeseLedge_Start
  StartGap {
    GapID = <StartGapID>
    flags = [ REQUIRE_WALL CANCEL_GROUND ] }
endscript
script Lon_Gap_CheeseLedge
  EndGap {
    GapID = <EndGapID>
    text = "Cheese Ledge"
    score = 50 }
endscript
script Lon_Gap_CanadaLip2
  Wait 1 frame
  EndGap {
    GapID = <EndGapID>
    text = "Eh? Canda..."
    score = 50 }
endscript
script Lon_SFX_Proxim
  if Inside
    if not IsAlive name = <SoundNode>
      Create name = <SoundNode>
    else
    endif
  else
    Kill name = <SoundNode>
  endif
endscript
script Lon_Garage_SFX
  begin
    Obj_PlayStream TireSqueak vol = 100 dropoff = 150
    Wait 16 seconds
  repeat
endscript
script Lon_Fountain_SFX
  if GotParam Fount1
    Obj_PlaySound BigFountain_11
  else
    Obj_PlaySound TFountains_11
  endif
  begin
    Wait 10 seconds
  repeat
endscript
script Lon_StartFountainSounds
  if not IsAlive name = TRG_Lon_SFX_fountain
    Create name = TRG_Lon_SFX_fountain
  endif
  if not IsAlive name = TRG_Lon_SFX_fountain01
    Create name = TRG_Lon_SFX_fountain01
  endif
endscript
script Lon_JumpInFountain
endscript
script Lon_LeavingMessage
  if not InSplitScreenGame
    create_panel_message id = leaving_message text = "Please Stay In Game Area"
  endif
  if GotParam AdArch
    Sk3_Killskater bail nodename = TRG_RE_AdArch01
  else
    Sk3_Killskater
  endif
endscript
