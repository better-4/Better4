script Zoo_Setup
endscript
script zoo_Startup
  LoadSound "Shared\Hits\BonkBush" vol = 100 dropoff = 150
  LoadSound "Shared\Water\FallWater" vol = 100 dropoff = 50
  LoadSound "Shared\Auto\CarBrakeSqueal" vol = 60 dropoff = 150 PosUpdate
  LoadSound "Shared\Auto\LA_Skid_11" vol = 100 dropoff = 150
  LoadSound "Shared\Auto\CarLoop" vol = 100 dropoff = 150 PosUpdateWithDoppler
  LoadSound "Shared\Auto\Carhorn_11" vol = 100 dropoff = 150
  LoadSound "Shared\Hits\HitFlimsyWood_11" vol = 100 dropoff = 50
  LoadSound "Shared\Hits\HitMetalPlexiglass_11" vol = 100 dropoff = 50
  LoadSound "Shared\Goals\GapSound" vol = 150 dropoff = 150
  LoadSound "Shared\Goals\GoalDone" vol = 150 dropoff = 150
  LoadSound "Skater\bail04"
  LoadSound "Terrains\BonkMetal_11"
  LoadSound "Shared\Misc\LA_GratesOpen" vol = 100
  LoadSound "Shared\Animal\ElephantBlast" vol = 100
  LoadSound "Zoo\hippo1" vol = 100 dropoff = 150 PosUpdate
  LoadSound "Zoo\manybirdchirps_rd" vol = 300 dropoff = 250 PosUpdate
  LoadSound "Zoo\lion2" vol = 150 dropoff = 150 PosUpdate
  LoadSound "Zoo\lion3" vol = 150 dropoff = 150 PosUpdate
  LoadSound "Zoo\rhino" vol = 150 dropoff = 150 PosUpdate
  LoadSound "Zoo\monkey_rd" vol = 300 dropoff = 250 PosUpdate
  LoadSound "Zoo\penguingroup1_rd" vol = 300 dropoff = 200 PosUpdate
  LoadSound "Shared\Auto\TramEngineLoop" vol = 50 dropoff = 150 PosUpdateWithDoppler
  LoadSound "Shared\Animal\StompyStep01" vol = 100 dropoff = 50
  LoadSound "Shared\Animal\StompyStep02" vol = 100 dropoff = 50
  LoadSound "Shared\Animal\StompyStep03" vol = 100 dropoff = 50
  LoadSound "Shared\Animal\StompyStep04" vol = 100 dropoff = 50
  LoadSound "Shared\hits\smashcake" vol = 100 dropoff = 50
  if not InNetGame
    animload_Ped_TP
  endif
endscript
script Zoo_Goals
  if InMultiplayerGame
    add_multiplayer_mode_goals
  endif
  if not InSplitScreenGame
    if not GameModeEquals is_singlesession
      Zoo_AddMinigame_Eggdrop
      Zoo_AddMinigame_RhinoBet
      Zoo_AddMinigame_MonkeyPoo
      AddGoal_HighScore {
        goal_text = zoo_highscore_text
        score = zoo_highscore_score
        view_goals_text = zoo_highscore_text
        start_cam_anim = G_HS_CameraStart
        success_cam_anim = G_HS_CameraSuccess
        reward_goal = Zoo_Goal_ProScore
        proset_prefix = "ProSet4_"
        pro = "Tony"
        goal_description = zoo_highscore_desc
      }
      AddGoal_Skate {
        start_cam_anim = G_SKATE_CameraStart
        success_cam_anim = G_SKATE_CameraSuccess
        proset_prefix = "ProSet1_"
        full_name = "Zoo Worker"
        pro = "Zooworker"
        goal_description = zoo_skate_desc
        view_goals_text = "Collect the S-K-A-T-E letters"
      }
      AddGoal_Combo {
        start_cam_anim = G_COMBO_CameraStart
        success_cam_anim = G_COMBO_CameraSuccess
        reward_goal = Zoo_Goal_Comp
        full_name = "Smart Kid"
        pro = "Kid"
        goal_description = zoo_combo_desc
        view_goals_text = "Collect the C-O-M-B-O letters"
      }
      AddGoal_Trickspot {
        career_only
        goal_text = "Do a Hardflip and a Heelflip over Kenny the Koala"
        goal_flags = [ got_1
          got_2
        ]
        start_cam_anim = G_TS_CameraStart
        success_cam_anim = G_TS_CameraSuccess
        view_goals_text = "Hardflip and Heelflip over Kenny"
        full_name = "Disgruntled Zoo Employee"
        pro = "Disgruntled"
        goal_intro_script = zoo_trickspot_intro
        goal_deactivate_script = Zoo_Trickspot_Deactivate
        goal_outro_script = Zoo_Trickspot_Outro
        required_tricks = [ Trick_Hardflip Trick_Heelflip ]
        goal_description = zoo_trickspot_desc
        record_type = time
      }
      AddGoal_Tetris {
        time = 60
        goal_text = "Nail the tricks they yell out"
        view_goals_text = "Nail the tricks they yell out"
        start_cam_anim = G_TETRIS_CameraStart
        success_cam_anim = G_TETRIS_CameraSuccess
        pro = "Bam"
        reward_goal = Zoo_Goal_Gaps
        goal_intro_script = Zoo_Tetris_Intro
        goal_outro_script = Zoo_Tetris_Outro
        goal_deactivate_script = Zoo_Tetris_Deactivate
        goal_description = zoo_tetris_desc
        goal_tetris_key_combos = [
          Air_CircleU
          Air_CircleD
          Air_CircleL
          Air_CircleR
          Air_SquareU
          Air_SquareD
          Air_SquareL
          Air_SquareR
          Lip_TriangleL
          Lip_TriangleR
          Lip_TriangleD
          Lip_TriangleU
        ]
        acceleration_interval = 5
        acceleration_percent = 0.05
        time_to_stop_adding_tricks = 10
      }
      AddGoal_HighCombo2 {
        goal_text = zoo_highcombo2_text
        score = zoo_highcombo2_score
        intro_node = TRG_G_HighCombo2_IntroNode
        start_cam_anim = G_HighCombo2_CameraStart
        success_cam_anim = G_HighCombo2_CameraSuccess
        goal_outro_script = Zoo_HighCombo2_Outro
        goal_deactivate_script = Zoo_HighCombo2_Deactivate
        trigger_wait_script = Zoo_LionTamerWaiting
        view_goals_text = "Help the Lion Tamer escape"
        full_name = "Lion Tamer"
        pro = "Liontamer"
        career_only
        reward_goal = Zoo_Goal_Trickspot4
        goal_description = zoo_highcombo2_desc
        record_type = time
      }
      AddGoal_Horse {
        career_only
        goal_text = "Beat Bob's 3 best combos"
        view_goals_text = "Beat Bob's 3 best combos"
        current_goal_text = zoo_horse_text
        start_cam_anim = G_HORSE_CameraStart
        success_cam_anim = G_HORSE_CameraSuccess
        pro = "Bob"
        reward_goal = Zoo_Goal_Special
        goal_flags = [ got_1
          got_2
          got_3
        ]
        horse_spots = [ { id = TRG_G_HORSE_Spot01 scr = zoo_horse_spot01 flag = got_1 score = zoo_horse_score1 time = 30 }
          { id = TRG_G_HORSE_Spot02 scr = zoo_horse_spot02 flag = got_2 score = zoo_horse_score2 time = 30 }
          { id = TRG_G_HORSE_Spot03 scr = zoo_horse_spot03 flag = got_3 score = zoo_horse_score3 time = 30 }
        ]
        goal_description = zoo_horse_desc
      }
      AddGoal_Race {
        career_only
        goal_text = "Stop the Monkey"
        view_goals_text = "Stop the Monkey from escaping"
        goal_flags = [ got_1
          got_2
        ]
        full_name = "Zookeeper"
        pro = "Monkeykeeper"
        race_waypoints = [ { id = TRG_G_RACE_RaceNav01 scr = zoo_race_waypoint_1 flag = got_1 time = 15 }
          { id = TRG_G_RACE_RaceNav02 scr = zoo_race_waypoint_2 flag = got_2 time = 15 }
        ]
        start_cam_anim = G_RACE_CameraStart
        success_cam_anim = G_RACE_CameraSuccess
        goal_intro_script = Zoo_Race_Intro
        goal_deactivate_script = Zoo_Race_Deactivate
        goal_outro_script = Zoo_Race_Outro
        proset_prefix = "ProSet3_"
        goal_description = zoo_race_desc
        record_type = time
      }
      AddGoal_Collect2 {
        use_hud_counter
        hud_counter_caption = "Hippos Fed"
        goal_text = "Feed the Hippos"
        view_goals_text = "Feed the Hippos"
        goal_flags = [ got_1
          got_2
          got_3
          got_4
        ]
        start_cam_anim = G_COLLECT2_CameraStart
        success_cam_anim = G_COLLECT2_CameraSuccess
        time = 5
        pro = "HippoTrainer"
        full_name = "Hippo Trainer"
        goal_intro_script = Zoo_Goal_Collect2_Intro
        goal_deactivate_script = Zoo_Goal_Collect2_Deactivate
        goal_description = zoo_Collect2_desc
        record_type = time
      }
      AddGoal_Trickspot3 {
        career_only
        goal_text = "Skitch the Elephant"
        view_goals_text = "Skitch the Elephant"
        goal_flags = [ got_1
        ]
        goal_intro_script = Zoo_Goal_Trickspot3_Intro
        goal_deactivate_script = Zoo_Goal_Trickspot3_Deactivate
        start_cam_anim = G_TS3_CameraStart
        success_cam_anim = G_TS3_CameraSuccess
        full_name = "Disgruntled Zoo Employee"
        pro = "Disgruntled"
        goal_description = zoo_trickspot3_desc
        record_type = none
      }
      AddGoal_Collect {
        career_only
        use_hud_counter
        hud_counter_caption = "Penguins\nCaught"
        goal_text = "Catch 5 runaway Penguins"
        view_goals_text = "Catch the 5 runaway Penguins"
        goal_intro_script = Zoo_Goal_Collect_Intro
        goal_outro_script = Zoo_Goal_Collect_Outro
        goal_deactivate_script = Zoo_Goal_Collect_Deactivate
        proset_prefix = "ProSet2_"
        full_name = "Zookeeper"
        pro = "Penguinkeeper"
        record_type = time
        goal_flags = [ got_1
          got_2
          got_3
          got_4
          got_5
        ]
        start_cam_anim = G_COLLECT_CameraStart
        success_cam_anim = G_COLLECT_CameraSuccess
        goal_description = zoo_collect_desc
        collect_type = "penguins"
      }
      AddGoal_ProScore {
        goal_text = zoo_proscore_text
        view_goals_text = zoo_proscore_text
        score = zoo_proscore_score
        start_cam_anim = G_PS_CameraStart
        success_cam_anim = G_PS_CameraSuccess
        unlocked_by_another
        pro = "Tony"
        proset_prefix = "ProSet7_"
        goal_description = zoo_proscore_desc
      }
      AddGoal_Competition {
        career_only
        goal_text = "Medal the Competition"
        view_goals_text = "Medal the Competition"
        goal_intro_script = Zoo_Comp_Intro
        goal_deactivate_script = Zoo_Comp_Outro
        goal_outro_script = Zoo_Comp_Outro
        full_name = "Competition Judge"
        pro = "Judge"
        unlocked_by_another
        start_cam_anim = G_COMP_CameraStart
        goal_description = zoo_comp_desc
        gold = 95
        silver = 90
        bronze = 85
        gold_score = zoo_comp_gold
        silver_score = zoo_comp_silver
        bronze_score = zoo_comp_bronze
        bail = 7
      }
      AddGoal_Gaps {
        goal_text = "Grind the 4 Zoo banners"
        view_goals_text = "Grind the 4 Zoo banners"
        goal_flags = [ got_1
          got_2
          got_3
          got_4
        ]
        pro = "Bam"
        use_hud_counter
        hud_counter_caption = "Banners"
        start_cam_anim = G_GAP_CameraStart
        success_cam_anim = G_GAP_CameraSuccess
        proset_prefix = "ProSet6_"
        unlocked_by_another
        goal_description = zoo_gaps_desc
        record_type = time
      }
      AddGoal_Trickspot4 {
        career_only
        goal_text = "Lure The Lions back to the cage"
        view_goals_text = "Lure the Lions back to the cage"
        goal_flags = [ got_1
          got_2
        ]
        start_cam_anim = G_TS4_CameraStart
        success_cam_anim = G_TS4_CameraSuccess
        unlocked_by_another
        full_name = "Lion Tamer"
        pro = "Liontamer2"
        goal_intro_script = Zoo_Goal_Trickspot4_Intro
        goal_outro_script = Zoo_Goal_Trickspot4_Outro
        goal_deactivate_script = Zoo_Goal_Trickspot4_Deactivate
        goal_description = zoo_trickspot4_desc
        record_type = time
      }
      AddGoal_Special {
        career_only
        special_gap
        goal_text = "Do a Sit Down Air over the Lion's cage"
        key_combo_text = "\nSit Down Air\n\k1"
        view_goals_text = "Do a Sit Down Air over the Lion's cage"
        start_cam_anim = G_SPECIAL_CameraStart
        success_cam_anim = G_SPECIAL_CameraSuccess
        pro = "Bob"
        trick_name = Trick_SitDownAir
        trick_type = air
        goal_description = zoo_special_desc
        unlocked_by_another
      }
      AddGoal_SickScore {
        goal_text = zoo_sickscore_text
        view_goals_text = zoo_sickscore_text
        score = zoo_sickscore_score
        start_cam_anim = G_SS_CameraStart
        success_cam_anim = G_SS_CameraSuccess
        proset_prefix = "ProSet5_"
        pro = "Tony"
        pro_goal
        unlocked_by_another
        goal_description = zoo_sickscore_desc
      }
      AddGoal_ProCombo {
        start_cam_anim = G_PROLINE_CameraStart
        success_cam_anim = G_PROLINE_CameraSuccess
        pro_goal
        full_name = "Smart Kid"
        pro = "Kid"
        view_goals_text = "Collect Pro C-O-M-B-O"
        goal_description = zoo_procombo_desc
      }
      AddGoal_Gaps2 {
        goal_text = "Transfer over Elephant Rock"
        view_goals_text = "Transfer over Elephant Rock"
        goal_flags = [ got_1
        ]
        start_cam_anim = G_GAP2_CameraStart
        success_cam_anim = G_GAP2_CameraSuccess
        pro = "Bob"
        pro_goal
        goal_description = zoo_gaps2_desc
        record_type = time
      }
      AddGoal_Trickspot2 {
        career_only
        goal_text = "Get Kong back in his cage"
        goal_flags = [ got_1
        ]
        start_cam_anim = G_TS2_CameraStart
        success_cam_anim = G_TS2_CameraSuccess
        goal_intro_script = zoo_trickspot2_intro
        goal_deactivate_script = zoo_trickspot2_deactivate
        view_goals_text = "Get Kong back in his cage"
        full_name = "Zookeeper"
        pro = "Kongkeeper"
        pro_goal
        goal_description = zoo_trickspot2_desc
        record_type = time
      }
      AddGoal_CounterCombo {
        career_only
        goal_text = "Combo scare 40 Birds"
        view_goals_text = "Combo scare 40 Birds"
        number = 40
        start_cam_anim = G_COUNTERCOMBO_CameraStart
        success_cam_anim = G_COUNTERCOMBO_CameraSuccess
        pro = "Bam"
        goal_description = zoo_countercombo_desc
        goal_countercombo_object_init_script = NullScript
        countercombo_objects = [ { id = TRG_Bird01 }
          { id = TRG_Bird02 }
          { id = TRG_Bird03 }
          { id = TRG_Bird04 }
          { id = TRG_Bird05 }
          { id = TRG_Bird06 }
          { id = TRG_Bird07 }
          { id = TRG_Bird08 }
          { id = TRG_Bird09 }
          { id = TRG_Bird10 }
          { id = TRG_Bird11 }
          { id = TRG_Bird12 }
          { id = TRG_Bird13 }
          { id = TRG_Bird14 }
          { id = TRG_Bird15 }
          { id = TRG_Bird16 }
          { id = TRG_Bird17 }
        ]
        goal_intro_script = Zoo_CounterCombo_Intro
        goal_deactivate_script = Zoo_CounterCombo_Deactivate
        use_hud_counter
        hud_counter_caption = "Birds Combo Scared"
        pro_goal
        record_type = time
      }
      AddGoal_Counter {
        career_only
        unlocked_by_another
        pro_specific_challenge
        pro_challenge_title = "Broken Loop Gap"
        pro_challenge_text = "So you skated a loop, then skated it switch. Next? Well, for a recent pay-per-view competition, Bob Burnquist built a loop in his back yard - then removed its top. Gapping the loop switch, Bob made history - and won the competition."
        pro_challenge_tag_line = "Warning: Severe disorientation ahead"
        pro_challenge_pro_name = "Bob"
        goal_text = "Do tricks across the loop"
        key_combo_text = "\n\t1 \k1\n\t2 \k2\n\t3 \k3"
        number = 9
        time = 240
        geo_prefix = "G_Counter_Loop"
        start_cam_anim = G_COUNTER_CameraMid
        full_name = "Atiba Jefferson"
        pro = "photoguy"
        goal_description = zoo_counter_desc
        goal_intro_script = Zoo_Goal_Counter_Intro
        goal_success_script = Bob_Challenge_Success
        goal_deactivate_script = Zoo_Goal_Counter_Deactivate
        view_goals_text = "Bob's Pro Specific Challenge"
        required_tricks = [ Trick_Melon Trick_SambaFlip Trick_SitDownAir ]
        key_combos = [
          Air_SquareL
          Air_CircleR
          Air_CircleD
          Air_CircleUR
          Air_SquareUL
          Air_SquareDR
          Air_CircleL
          Air_CircleUL
        ]
      }
      AddMinigame_Height
    endif
  endif
endscript
script Zoo_Initialize
  if InMultiplayerGame
  else
    if GoalManager_GoalExists name = Zoo_Goal_Collect
      if GoalManager_HasSeenGoal name = Zoo_Goal_Collect
        Kill name = TRG_Elephant_Standing
        Kill name = TRGP_ElephantStampede
        Kill name = TRG_Ped_Trainer01
        Create prefix = "TRG_Rail_PicnicDamage_"
        Create prefix = "TRGP_GapStart_BridgeHole"
        Kill prefix = "TRG_Ped_Elephant"
        Kill prefix = "TRG_Rail_PicnicNormal_"
        Create name = Zoo_PicnicDamage01
        Kill prefix = "Zoo_PicnicNormal"
        Kill prefix = "Bridge_Normal"
        Kill prefix = "Zoo_BridgeFloor"
        Create prefix = "Bridge_Damaged"
        Create prefix = "Zoo_BridgeDestroyed"
        Kill prefix = "TRG_Rail_Bridge"
        Create prefix = "TRG_Rail_Damage"
        Create name = Damage_Boards
        Kill name = BOARDED_01
        Kill name = Damage_Boards
        Create name = Damage_boards02
        Create prefix = "FallenDoor"
      endif
    endif
  endif
endscript
script Zoo_TrickspotEntranceTrigger1
  StartGap GapID = Aqua1 flags = [ CANCEL_GROUND ]
endscript
script Zoo_TrickspotContinueTrigger1
  if Triggertype [ TRIGGER_LIP_ON ]
    EndGap GapID = Aqua1 Text = "Aqua Sign Gap" score = 500
  endif
endscript
script Zoo_TrickspotExitTrigger1
endscript
script zoo_goal_trickspot_got_Gap1Hard
  if IsAlive name = TRG_Ped_Kenny_Heelflip
  else
    if GoalManager_SetGoalFlag name = zoo_goal_trickspot got_1 1
      Playsound GapSound
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Heelflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = KennyText "Now do a heelflip on him! %a" a = <combo_1>
      create_panel_block id = current_goal Text = <KennyText> style = panel_message_goal
      Kill name = Zoo_Kenny_Collision
      Kill name = TRG_Ped_Kenny
      Create name = TRG_Ped_Kenny_Heelflip
      PlayStream random( @Kenny_hit01 @kenny_hit02 @kenny_hit03 @kenny_hit04 ) 
    endif
  endif
endscript
script zoo_goal_trickspot_got_Gap1Heel
  if IsAlive name = TRG_Ped_Kenny_Hardflip
  else
    if GoalManager_SetGoalFlag name = zoo_goal_trickspot got_1 1
      Playsound GapSound
      GetKeyComboArrayFromTrickArray tricks = [ Trick_Hardflip ]
       <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
      FormatText TextName = KennyText "Now do a hardflip on him! %a" a = <combo_1>
      create_panel_block id = current_goal Text = <KennyText> style = panel_message_goal
      Kill name = Zoo_Kenny_Collision
      Kill name = TRG_Ped_Kenny
      Create name = TRG_Ped_Kenny_Hardflip
    endif
  endif
endscript
script Zoo_Goal_Collect_Intro
  Kill prefix = "TRG_G_COLLECT_Penguin"
  Create prefix = "TRG_G_COLLECT_Penguin"
endscript
script Zoo_Goal_Collect_Outro
  Kill prefix = "TRG_G_COLLECT_Penguin"
endscript
script Zoo_Goal_Collect_Deactivate
  Kill prefix = "TRG_G_COLLECT_Penguin"
endscript
script Zoo_Comp_Intro
  wait 1 frame
  Kill name = TRG_Ped_TramRider01
  Kill name = TRG_Ped_TramDriver
  Kill name = TRG_Tram
  Kill prefix = "TRG_HippoLovin"
  if IsAlive name = proset3_Funbox01
    Kill name = proset3_Bench05
    Kill name = proset3_Bench06
    Kill prefix = "trg_proset3_Rail_CompNot_"
  endif
  if IsAlive name = proset4_Bench01
    Kill prefix = "trg_proset4_Rail_QP_"
  endif
  if IsAlive name = Bridge_Damaged
    Create prefix = "trg_comp_Rail_Damage"
    Kill prefix = "TRG_Rail_Damage_CompSide"
    Create prefix = "Damaged_COMP_"
    Kill prefix = "Zoo_BridgeDestroyedFloor"
  else
    Create prefix = "trg_comp_Rail_Bowl"
    Create prefix = "Normal_COMP_"
    Kill prefix = "Zoo_BridgeFloor"
    Kill prefix = "TRG_Rail_Bridge_CompSide"
  endif
  if IsAlive name = Hippo_bridge_up_cw
    Kill name = Hippo_bridge_up_cw
    Create name = Hippo_bridge_COMP
  endif
endscript
script Zoo_Comp_Outro
  if not IsAlive name = TRG_HippoLovin01
    Create prefix = "TRG_HippoLovin"
  endif
  if IsAlive name = TRG_Tram
  else
    Create name = TRG_Tram
    Create name = TRG_Ped_TramRider01
    Create name = TRG_Ped_TramDriver
  endif
  if IsAlive name = proset3_Funbox01
    Create name = proset3_Bench05
    Create name = proset3_Bench06
    Create prefix = "trg_proset3_Rail_CompNot_"
  endif
  if IsAlive name = proset4_Bench01
    Kill prefix = "trg_proset4_Rail_QP_"
    Create prefix = "trg_proset4_Rail_QP_"
  endif
  if IsAlive name = Bridge_Damaged
    Kill prefix = "trg_comp_Rail_Damage"
    Create prefix = "TRG_Rail_Damage_CompSide"
    Create prefix = "Zoo_BridgeDestroyedFloor"
    Kill prefix = "Damaged_COMP_"
  else
    Kill prefix = "trg_comp_Rail_Bowl"
    Create prefix = "TRG_Rail_Bridge_CompSide"
    Create prefix = "Zoo_BridgeFloor"
    Kill prefix = "Normal_COMP_"
  endif
  if IsAlive name = Hippo_bridge_COMP
    Create name = Hippo_bridge_up_cw
    Kill name = Hippo_bridge_COMP
  endif
  MakeSkaterGoto SkaterInit
  SpawnSkaterScript ZOO_MoveToCOMPNODE
endscript
script ZOO_MoveToCOMPNODE
  Obj_MoveToNode name = Trg_G_COMP_restartnode orient
endscript
script Zoo_Race_Intro
  Create prefix = "TRG_Ped_Security_"
  Create name = TRG_Race_MonkeyStart
  Kill name = TRG_Race_Monkey
  Kill prefix = "TRG_G_RACE_RaceNav"
  Create prefix = "TRG_G_RACE_RaceNav"
  Kill prefix = "TRG_Ped_SecurityAlert"
  Kill name = TRG_Race_MonkeyCaught
endscript
script Zoo_Race_Outro
  Create name = TRG_Ped_SecurityAlert02
  Kill name = TRG_Ped_Security_02
  Create name = TRG_Race_MonkeyCaught
  Kill name = TRG_Race_Monkey
endscript
script Zoo_Race_Deactivate
  if IsAlive name = TRG_Ped_Security_01
    KillTheArrow id = TRG_Ped_Security_01
  endif
  if IsAlive name = TRG_Ped_Security_02
    KillTheArrow id = TRG_Ped_Security_02
  endif
  Kill prefix = "TRG_Ped_Security_"
  Kill name = TRG_Ped_SecurityAlert01
  Kill name = TRG_Race_Monkey
  Kill prefix = "TRG_G_RACE_RaceNav"
endscript
script Zoo_AddGoalArrow
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
script Zoo_HighCombo2_Outro
  if IsAlive name = TRG_G_TS4_PhotoGuy
    TRG_G_TS4_PhotoGuy:Obj_MoveToNode name = TRG_TrickSpot4_HideNode
  endif
  Kill prefix = "TRG_Lion"
  Kill name = Zoo_LionGate
  Create prefix = "TRG_Outro_Lion_"
endscript
script Zoo_HighCombo2_Deactivate
  if IsAlive name = TRG_G_TS4_PhotoGuy
    TRG_G_TS4_PhotoGuy:Obj_MoveToNode name = TRG_TrickSpot4_StartNode
  endif
endscript
script zoo_trickspot_intro
  if IsAlive name = TRG_Ped_Kenny
    TRG_Ped_Kenny:Obj_ClearExceptions
  else
    Create name = TRG_Ped_Kenny
    TRG_Ped_Kenny:Obj_ClearExceptions
  endif
  if not IsAlive name = Zoo_Kenny_Collision
    Create name = Zoo_Kenny_Collision
  endif
  if ObjectExists id = ped_speech_dialog
    DestroyScreenElement id = ped_speech_dialog
  endif
  GetKeyComboArrayFromTrickArray tricks = [ Trick_Hardflip Trick_Heelflip ]
   <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
   <combo_2> = ( ( goal_tetris_trick_text.( <keycombos> [ 1 ] ) ) )
  FormatText TextName = KennyText "Do a Hardflip \n%a\nand a Heelflip \n%b\nover Kenny the Koala" a = <combo_1> b = <combo_2>
  GoalManager_EditGoal name = zoo_goal_trickspot params = { goal_text = <KennyText> }
endscript
script Zoo_Trickspot_Deactivate
  Kill name = TRG_Ped_Kenny_Heelflip
  Kill name = TRG_Ped_Kenny_Hardflip
  wait 1 frame
  if IsAlive name = TRG_Ped_Kenny
    Kill name = TRG_Ped_Kenny
  endif
  if GoalManager_GoalExists name = zoo_goal_trickspot
    if not GoalManager_HasWonGoal name = zoo_goal_trickspot
      Create name = TRG_Ped_Kenny
      Create name = Zoo_Kenny_Collision
    endif
  endif
endscript
script Zoo_Trickspot_Outro
  Kill name = TRG_Ped_Kenny
  Kill name = Zoo_Kenny_Collision
endscript
script Zoo_Tetris_Intro
endscript
script Zoo_Tetris_Outro
endscript
script Zoo_Tetris_Deactivate
endscript
script Zoo_CounterCombo_Intro
endscript
script Zoo_CounterCombo_Outro
endscript
script Zoo_CounterCombo_Deactivate
endscript
script Zoo_Goal_Gap3_Intro
  Kill prefix = "Pumpkin_"
  wait 1 frame
  Create prefix = "Pumpkin_"
endscript
script Zoo_Goal_Gap3_Deactivate
  Kill prefix = "Pumpkin_"
endscript
script Zoo_Goal_Collect2_Intro
  Kill prefix = "Pumpkin_"
  Kill name = proset2_QP02
  Kill prefix = "trg_proset2_QP_Rail"
  wait 1 frame
  Create prefix = "Pumpkin_"
endscript
script Zoo_Goal_Collect2_Deactivate
  Kill prefix = "Pumpkin_"
  if IsAlive name = proset2_Bench02
    Create name = proset2_QP02
    Create prefix = "trg_proset2_QP_Rail"
  endif
endscript
script zoo_trickspot2_intro
  if not IsAlive name = TRG_CatchGorillaLoose
    Create name = TRG_CatchGorillaLoose
    Kill name = TRG_GorillaCaught
  endif
endscript
script zoo_trickspot2_deactivate
  Kill prefix = "TRG_CatchGorillaPOD"
  if GoalManager_GoalExists name = Zoo_Goal_trickspot2
    if GoalManager_HasWonGoal name = Zoo_Goal_trickspot2
      Kill name = TRG_CatchGorillaLoose
      if not IsAlive name = TRG_GorillaCaught
        Create name = TRG_GorillaCaught
      endif
    endif
  endif
endscript
script Zoo_Goal_Trickspot4_Intro
  Kill name = Zoo_LionGate
  Kill name = TRG_Ped_TramRider01
  Kill name = TRG_Ped_TramDriver
  Kill name = TRG_Tram
  Kill name = TRG_Lion01
  Kill name = TRG_Lion02
  if not IsAlive name = TRG_Chase_Manager
    Create name = TRG_Chase_Manager
  endif
  if not IsAlive name = TRG_CHASE_Lion01
    Create name = TRG_CHASE_Lion01
  endif
  if not IsAlive name = TRG_CHASE_Lion02
    Create name = TRG_CHASE_Lion02
  endif
  if not IsAlive name = TRG_CHASE_Collision
    Create name = TRG_CHASE_Collision
  endif
  if not IsAlive name = TRG_CHASE_Collision01
    Create name = TRG_CHASE_Collision01
  endif
endscript
script Zoo_Goal_Trickspot4_Deactivate
  Kill prefix = "TRG_CHASE_"
  if ( ( IsAlive name = TRG_Lion01 ) and ( IsAlive name = TRG_Lion02 ) )
  else
    Kill name = TRG_Lion01
    Kill name = TRG_Lion02
  endif
  Kill name = TRG_Chase_Effects
  if not IsAlive name = TRG_Tram
    Create name = TRG_Tram
    Create name = TRG_Ped_TramRider01
    Create name = TRG_Ped_TramDriver
  endif
endscript
script Zoo_Goal_Trickspot4_Outro
  Create name = Zoo_LionGate
  Kill prefix = "TRG_CHASE_"
  Kill name = TRG_Chase_Effects
  if not IsAlive name = TRG_Tram
    Create name = TRG_Tram
    Create name = TRG_Ped_TramRider01
    Create name = TRG_Ped_TramDriver
  endif
  if not IsAlive name = TRG_Lion01
    Create name = TRG_Lion01
  endif
  if not IsAlive name = TRG_Lion02
    Create name = TRG_Lion02
  endif
endscript
script zoo_race_waypoint_1
  Create name = TRG_Race_Monkey
  Kill name = TRG_Race_MonkeyStart
  create_panel_block id = current_goal Text = "Get to tram gate!" style = panel_message_goal
endscript
script zoo_race_waypoint_2
  Create name = TRG_Ped_SecurityAlert01
  Kill name = TRG_Ped_Security_01
  create_panel_block id = current_goal Text = "Get to the main gate!" style = panel_message_goal
endscript
script zoo_race_waypoint_3
  create_panel_block id = current_goal Text = "Get to the lion cage" style = panel_message_goal
endscript
script zoo_race_waypoint_4
  create_panel_block id = current_goal Text = "Get to the bridge" style = panel_message_goal
endscript
ZOO_ELEPHANT_SCARED = 1
OBJ_ELEPHANT_SKITCH = 2
OBJ_ELEPHANT_NOSKITCH = 3
script Zoo_NetGameInit
  if InNetGame
    if not IsAlive name = Hippo_bridge_up_cw
      Create name = Hippo_bridge_up_cw
    endif
  endif
  if InMultiplayerGame
    Create name = Zoo_MonkeyPooBlocker
    Create name = Zoo_GiraffeDoorNet
  endif
  Die
endscript
script Zoo_CreateBirdNoises
  if IsAlive name = TRG_BirdNoises
  else
    Create name = TRG_BirdNoises
  endif
endscript
script Zoo_BirdNoises
  Obj_Playsound manybirdchirps_rd
  begin
    wait 10 seconds
  repeat
endscript
script Zoo_CreatePenguinNoises
  if IsAlive name = TRG_PenguinNoises
  else
    Create name = TRG_PenguinNoises
  endif
endscript
script Zoo_Cockatoo
  Obj_ShadowOff
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = Zoo_Cockatoo_Fly
  Obj_SetInnerRadius 10
  wait random( @5 frames @15 frames @30 frames @45 frames ) 
  begin
    Obj_CycleAnim anim = Idle numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim anim = Preen numcycles = random( @1 @2 ) 
    Obj_CycleAnim anim = flap numcycles = random( @1 @2 ) 
  repeat
endscript
script Zoo_Cockatoo_Fly
  Obj_ClearExceptions
  if GoalManager_GoalExists name = Zoo_Goal_CounterCombo
    GoalManager_GotCounterObject name = Zoo_Goal_CounterCombo
  endif
  SendFlag name = TRG_MG_BirdCounter ONCE_AROUND
  Obj_PlayAnim anim = flap cycle
  Obj_MoveToRelPos (0, 200, 0) speed = 8 acceleration = 2
  Obj_WaitMove
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Cockatoo_Return
  Obj_SetOuterRadius 20
endscript
script Zoo_Cockatoo_Return
  Obj_ClearExceptions
  Obj_PlayAnim anim = flap cycle
  Obj_MoveToRelPos (0, -200, 0) speed = 8 acceleration = 2
  Obj_WaitMove
  Goto Zoo_Cockatoo
endscript
script Zoo_Cockatoo_Egg
  Obj_ShadowOff
  Obj_PlayAnim anim = Egg cycle
endscript
script CockatooCounter
   <number_collected> = 0
  begin
    wait 10 frames
    if GoalManager_GoalExists name = Zoo_Goal_CounterCombo
      if GoalManager_GoalIsActive name = Zoo_Goal_CounterCombo
         <tempvar> = <number_collected>
        GoalManager_GetNumberCollected name = Zoo_Goal_CounterCombo
        if ( <tempvar> < <number_collected> )
          if ( <number_collected> < 40 )
            Playsound hud_jumpgap vol = 70
          else
            Playsound cash vol = 130
          endif
        endif
      endif
    endif
  repeat
endscript
script Zoo_PenguinNoises
  Obj_Playsound penguingroup1_rd
  begin
    wait 10 seconds
  repeat
endscript
script Zoo_CreateMonkeyNoises
  if IsAlive name = TRG_MonkeyNoises
  else
    Create name = TRG_MonkeyNoises
  endif
endscript
script Zoo_MonkeyNoises
  Obj_Playsound monkey_rd
  begin
    wait 10 seconds
  repeat
endscript
script Zoo_LionNoises
  begin
    Obj_Playsound random( @lion2 @lion3 ) 
    wait random( @1 second @2 seconds ) 
  repeat
endscript
EXCEPTION_LION_DONE = 1
script Zoo_Chase_Manager
  begin
    if Obj_ObjectInRadius radius = 15 name = TRG_CHASE_Lion01
      if GoalManager_SetGoalFlag name = Zoo_Goal_Trickspot4 got_1 1
      endif
      SendException EXCEPTION_LION_DONE name = TRG_CHASE_Lion01
      Kill name = TRG_Chase_Effects
      Kill name = TRG_CHASE_Collision
    endif
    if Obj_ObjectInRadius radius = 15 name = TRG_CHASE_Lion02
      if GoalManager_SetGoalFlag name = Zoo_Goal_Trickspot4 got_2 1
      endif
      SendException EXCEPTION_LION_DONE name = TRG_CHASE_Lion02
      Kill name = TRG_Chase_Effects
      Kill name = TRG_CHASE_Collision01
    endif
    wait 5 frames
  repeat
endscript
script Zoo_Chase_Effects
  begin
    Playsound random( @lion2 @lion3  ) pitch = random( @100 @105 @110  ) vol = random( @125 @150 @175 ) 
    if not IsAlive name = TRG_Text_Chase
      Create name = TRG_Text_Chase
    endif
    wait 1.5 seconds
  repeat
endscript
script Zoo_Chase_Text
  create_panel_block id = Lion_Chase Text = "Run!!!" style = panel_message_goal time = 1500
  wait 1.4 seconds
  RunScriptOnScreenElement id = Lion_Chase kill_panel_message
  Die
endscript
script Zoo_Chase_Lion_ToEnd
  Obj_ClearExceptions
  Obj_FollowLeader off
  Obj_SetInnerRadius 5
  Obj_SetException ex = SkaterInRadius scr = Zoo_Chase_Lion_ToEndKill
  Kill name = TRGP_LionKill
  GetNodeName
  Obj_PlayAnim anim = Walk cycle
  if ( <nodename> = TRG_CHASE_Lion01 )
    printf "Chase_Lion01"
    Obj_MoveToNode name = TRG_Lion01 speed = 4
    Obj_WaitMove
    Obj_LookAtNode name = TRG_LionNav01 time = 0.5
    Obj_WaitRotate
    if not IsAlive name = TRG_Lion01
      Create name = TRG_Lion01
    endif
    Die
  else
    printf "Chase_Lion02"
    Obj_MoveToNode name = TRG_Lion02 speed = 4
    Obj_WaitMove
    Obj_LookAtNode name = TRG_LionNav13 time = 0.5
    Obj_WaitRotate
    if not IsAlive name = TRG_Lion02
      Create name = TRG_Lion02
    endif
    Die
  endif
endscript
script Zoo_Chase_Lion_ToEndKill
  Obj_ClearExceptions
  if not IsAlive name = TRGP_LionKill
    Create name = TRGP_LionKill
  endif
  wait 5 frames
  Goto Zoo_Chase_Lion_ToEnd
endscript
script Zoo_Chase_Lion_Waiting
  Obj_ClearExceptions
  Obj_GetDistanceToObject Skater
  Obj_SetException ex = EXCEPTION_LION_DONE scr = Zoo_Chase_Lion_ToEnd
  if ( <ObjectDistance> > 10 )
    Kill name = TRG_Chase_Effects
  endif
  Obj_SetInnerRadius 40
  Obj_SetException ex = SkaterInRadius scr = Zoo_Chase_Lion_CheckFollow
  if not Obj_AnimEquals Idle
    Obj_PlayAnim anim = Idle cycle
  endif
endscript
script Zoo_Chase_Lion_CheckFollow
  Obj_ClearExceptions
  Obj_SetOuterRadius 45
  Obj_SetException ex = EXCEPTION_LION_DONE scr = Zoo_Chase_Lion_ToEnd
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Chase_Lion_Waiting
  printf "Fuckup Area C"
  begin
    Obj_LookAtObject type = Skater time = 0.1
    Obj_WaitRotate
    Obj_GetDistanceToObject Skater
    if ( ( <ObjectDistance> - 10 ) < 0 )
       <ObjectDistance> = 10
      printf "Fuckup Area D"
    endif
    if not Obj_GetCollision height = 0.1 length = ( <ObjectDistance> - 10 )
      if not Obj_GetCollision height = -10.0 length = ( <ObjectDistance> - 10 )
        printf "Fuckup Area E"
        Obj_PlayAnim anim = Pounce
        Obj_MoveForward dist = ( ( <ObjectDistance> - 10 ) * 12 ) speed = 40 acceleration = 10000
        Obj_WaitMove
        gotopreserveparams Zoo_Chase_Lion_Follow
      endif
    endif
    wait 1 gameframe
  repeat
endscript
script Zoo_Chase_Lion_Follow
  Obj_ClearExceptions
  Obj_SetException ex = EXCEPTION_LION_DONE scr = Zoo_Chase_Lion_ToEnd
  printf "Fuckup Area F"
  if not IsAlive name = TRG_Chase_Effects
    Create name = TRG_Chase_Effects
  endif
  if not Obj_AnimEquals Run
    Obj_PlayAnim anim = Run cycle
  endif
  Obj_LookAtObject type = Skater time = 0.1
  Obj_WaitRotate
  Obj_GetDistanceToObject Skater
  Obj_FollowLeader distance = 108 name = Skater LeaveYUnAffected
  begin
    if not Obj_GetCollision height = 0.1 length = 9
      if not Obj_GetCollision height = -10.0 length = 9
        if not Obj_GetCollision height = 0.1 length = -1
          if not Obj_GetCollision side height = 0.1 length = 1
            if not Obj_GetCollision side height = 0.1 length = -1
              if not Obj_GetCollision height = -10.0 length = -1
                if not Obj_GetCollision side height = -10 length = 1
                  if not Obj_GetCollision side height = -10 length = -1
                    printf "Fuckup Area G"
                    Skater:Obj_GetSpeed
                    if ( <speed> < 25 )
                      printf "Fuckup Area H"
                      Obj_FollowLeader off
                      gotopreserveparams Zoo_Chase_Lion_Kill
                    endif
                  else
                    Obj_FollowLeader off
                    printf "Fuckup Area I"
                    if ( <ObjectDistance> > 10 )
                      Kill name = TRG_Chase_Effects
                    endif
                    gotopreserveparams Zoo_Chase_Lion_Waiting
                  endif
                else
                  Obj_FollowLeader off
                  printf "Fuckup Area I"
                  if ( <ObjectDistance> > 10 )
                    Kill name = TRG_Chase_Effects
                  endif
                  gotopreserveparams Zoo_Chase_Lion_Waiting
                endif
              else
                Obj_FollowLeader off
                printf "Fuckup Area I"
                if ( <ObjectDistance> > 10 )
                  Kill name = TRG_Chase_Effects
                endif
                gotopreserveparams Zoo_Chase_Lion_Waiting
              endif
            else
              Obj_FollowLeader off
              printf "Fuckup Area I"
              if ( <ObjectDistance> > 10 )
                Kill name = TRG_Chase_Effects
              endif
              gotopreserveparams Zoo_Chase_Lion_Waiting
            endif
          else
            Obj_FollowLeader off
            printf "Fuckup Area I"
            if ( <ObjectDistance> > 10 )
              Kill name = TRG_Chase_Effects
            endif
            gotopreserveparams Zoo_Chase_Lion_Waiting
          endif
        else
          Obj_FollowLeader off
          printf "Fuckup Area I"
          if ( <ObjectDistance> > 10 )
            Kill name = TRG_Chase_Effects
          endif
          gotopreserveparams Zoo_Chase_Lion_Waiting
        endif
      else
        Obj_FollowLeader off
        printf "Fuckup Area I"
        if ( <ObjectDistance> > 10 )
          Kill name = TRG_Chase_Effects
        endif
        gotopreserveparams Zoo_Chase_Lion_Waiting
      endif
    else
      printf "Fuckup Area J"
      Obj_FollowLeader off
      if ( <ObjectDistance> > 10 )
        Kill name = TRG_Chase_Effects
      endif
      gotopreserveparams Zoo_Chase_Lion_Waiting
    endif
    wait 1 gameframe
  repeat
endscript
script Zoo_Chase_Lion_Kill
  Obj_ClearExceptions
  Obj_SetException ex = EXCEPTION_LION_DONE scr = Zoo_Chase_Lion_ToEnd
  printf "Fuckup Area K"
  Obj_LookAtObject type = Skater time = 0.1
  Obj_WaitRotate
  Obj_GetDistanceToObject Skater
  if ( ( <ObjectDistance> - 1 ) < 0 )
     <ObjectDistance> = 1
  endif
  printstruct <...>
  if not Obj_GetCollision height = 0.1 length = <ObjectDistance>
    if not Obj_GetCollision height = -10.0 length = <ObjectDistance>
      printf "Fuckup Area L"
      Obj_MoveForward dist = ( ( <ObjectDistance> -1 ) * 12 ) speed = 40 acceleration = 10000
      Obj_PlayAnim anim = Pounce
      MakeSkaterGoto PedKnockDown
      Obj_WaitMove
      Obj_PlayAnim anim = Idle cycle
      wait 2 seconds
      Skater:sk3_killskater nodename = TRG_G_TS4_RestartNode { message1 = "Cat Food!"
        message2 = "When Animals Attack!"
        message3 = "Nice Kitty!"
        message4 = "To The Lions!"
        r = 0 g = 0 b = 155
      }
    else
      printf "Fuckup Area M"
      Obj_PlayAnim anim = Idle cycle
      gotopreserveparams Zoo_Chase_Lion_Waiting
    endif
  else
    printf "Fuckup Area N"
    Obj_PlayAnim anim = Idle cycle
    gotopreserveparams Zoo_Chase_Lion_Waiting
  endif
  gotopreserveparams Zoo_Chase_Lion_Waiting
endscript
script Zoo_KillSkaterLion
  TeleportSkaterToNode nodename = TRG_G_TS4_RestartNode
  MakeSkaterGoto SkaterInit
endscript
script Zoo_Tram_Sign_Knock
  if IsAlive name = Zoo_Tram_Sign_Move
  else
    Create name = Zoo_Tram_Sign_Move
    Playsound HitFlimsyWood_11
  endif
  Kill name = Zoo_Tram_Sign_Start
endscript
script Zoo_Tram_Sign
  Obj_RotX angle = -71 speed = 80
  Obj_WaitRotate
  Create name = Zoo_Tram_Sign_Stop
  Die
endscript
script Zoo_Door_Rotate
  Obj_RotZ angle = 90 speed = 80
  Obj_WaitRotate
  Die
endscript
script Zoo_Door_Fly
  Obj_RotX speed = random( @180 @-180 ) 
  Obj_RotY speed = random( @180 @-180 ) 
  Obj_RotZ speed = random( @180 @-180 ) 
  Obj_MoveToLink speed = 30
  Obj_WaitMove
  Die
endscript
script Zoo_Tram_Script
  TeleportSkaterToNode nodename = TRG_Restart01
  if GoalManager_GoalIsActive name = zoo_goal_race
    create_panel_message id = goal_message text = "He got away!" style = panel_message_generic_loss
    GoalManager_LoseGoal name = zoo_goal_race
  endif
endscript
script Zoo_Tram_Script2
  TeleportSkaterToNode nodename = TRG_Restart03
  if GoalManager_GoalIsActive name = zoo_goal_race
    create_panel_message id = goal_message text = "He got away!" style = panel_message_generic_loss
    GoalManager_LoseGoal name = zoo_goal_race
  endif
endscript
script Zoo_LoseHighCombo2
  if GoalManager_GoalIsActive name = zoo_goal_highcombo2
    create_panel_message id = goal_message Text = "You left the cage!" style = panel_message_generic_loss
    GoalManager_LoseGoal name = zoo_goal_highcombo2
  endif
endscript
script Zoo_BreakawayCage
  Playsound BonkMetal_11
  ShatterAndDie name = <name> area = 5000 variance = 4 vel_x = 50 vel_y = 50 vel_z = 50 spread = 1
endscript
script Zoo_Test_Object
  begin
    Obj_MoveToRelPos (0, 30, 0) speed = 3 acceleration = 2
    Obj_WaitMove
    Obj_MoveToRelPos (0, -30, 0) speed = 3 acceleration = 2
    Obj_WaitMove
  repeat
endscript
script Zoo_Hippo_Island
  if not InNetGame
    if IsAlive name = Hippo_bridge_up_cw
    else
      Kill name = Hippo_bridge_down_cw
      Create name = Hippo_bridge_up_cw
      PlayStream metalbridge
      Kill name = Zoo_HippoCollision
      Kill name = TRG_Hippo02
      Kill name = TRG_Hippo03
      if not IsAlive name = TRG_Hippo06
        Create name = TRG_Hippo06
      endif
      Create prefix = "TRG_RailHippoBridge"
    endif
  endif
endscript
script Zoo_Ped_Security_Alert
  Obj_PlayAnim anim = Ped_BP_GuardPlayer cycle
endscript
script Zoo_Ped_Stroller_Walk
  Obj_ClearExceptions
  Obj_StoreNode
  Obj_LookAtNodeStored time = 0.5
  Obj_WaitRotate
  Obj_PathHeading On
  Obj_StartAlongPath
  Obj_SetException ex = SkaterInRadius scr = Zoo_Ped_Stroller_Knock params = <...>
  Obj_SetInnerRadius 5
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathVelocity 3 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 1 mphps
  Obj_SetPathDeceleration 1 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Ped_ST_Walk cycle
endscript
script Zoo_Ped_Stroller_Knock
  Obj_ClearExceptions
  Obj_PathHeading off
  Obj_StopAlongPath
  Obj_LookAtObject type = Skater time = 0.5
  MakeSkaterGoto PedKnockDown
  Obj_CycleAnim anim = Ped_ST_Knock
  Obj_CycleAnim anim = Ped_ST_Idle
  gotopreserveparams Zoo_Ped_Stroller_Walk
endscript
script Zoo_Ped_Worker
  Obj_ClearExceptions
  setup_ped_speech { ped_id = TRG_Ped_Vendor01
    display_name = "Zoo Worker"
    activation_script = Zoo_Worker_Activate
    Text = [ "Zoo Worker:\n Welcome to the Safari Snack Bar.  Can I take your order? " ]
  }
  Obj_PlayAnim anim = Ped_M_Idle1 cycle
endscript
script Zoo_Worker_Activate
  PlayStream snackworker_Welcome
endscript
script Zoo_Ped_Worker2
  Obj_ClearExceptions
  setup_ped_speech { ped_id = TRG_Ped_Vendor02
    speed = 2
    inner_radius = 7
    outer_radius = 10
    activation_script = Zoo_Vendor_Activate
    display_name = "Zoo Worker"
    pad_choose_script = Zoo_Vendor_Pad_Choose
    Text = [ "Zoo Worker:\n Move along, nothing to see here. " ]
  }
  Obj_PlayAnim anim = Ped_M_Idle1 cycle
endscript
script Zoo_Vendor_Activate
  PlaySkaterCamAnim name = CAM_SNACKBAR play_hold
  PlayStream snackworker_MoveAlong
  if not IsAlive name = TRG_SnackMonkey
    Create name = TRG_SnackMonkey
  endif
endscript
script Zoo_Vendor_Pad_Choose
  UnPauseSkaters
  speech_box_exit
  Kill name = TRG_SnackMonkey
  PlaySkaterCamAnim Skater = 0 stop
  MakeSkaterGoto SkaterInit
endscript
script Zoo_Ped_Elephant
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = Zoo_Ped_BailWhenSkaterClose
  Obj_SetInnerRadius 5
  Obj_SetException ex = ZOO_ELEPHANT_SCARED scr = Zoo_Ped_Stampede
  wait random( @5 frames @10 frames @15 frames ) 
  begin
    Obj_CycleAnim anim = Ped_M_Idle1 numcycles = random( @2 @4 @7 @9 ) 
    Obj_CycleAnim anim = Ped_M_Idle1toIdle2
    Obj_CycleAnim anim = Ped_M_Idle2 numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim anim = Ped_M_Idle2toIdle3
    Obj_CycleAnim anim = Ped_M_Idle3 numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim anim = Ped_M_Idle3toIdle1
  repeat
endscript
script Zoo_Ped_BailWhenSkaterClose
  Obj_ClearExceptions
  Playsound bail04
  random( @
  Obj_CycleAnim anim = Ped_M_FalldownA
  Obj_PlayAnim anim = Ped_M_LayIdleA cycle
  SetTags bail = a
  @Obj_CycleAnim anim = Ped_M_FalldownB
  Obj_PlayAnim anim = Ped_M_LayIdleB cycle
  SetTags bail = b
  @Obj_CycleAnim anim = Ped_M_FalldownC
  Obj_PlayAnim anim = Ped_M_LayIdleC cycle
  SetTags bail = C
  @Obj_CycleAnim anim = Ped_M_FalldownD
  Obj_PlayAnim anim = Ped_M_LayIdleD cycle
  SetTags bail = D
  @Obj_CycleAnim anim = Ped_M_FalldownE
  Obj_PlayAnim anim = Ped_M_LayIdleE cycle
  SetTags bail = E ) 
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Ped_GetUpFromBail
  Obj_SetOuterRadius 10
endscript
script Zoo_Ped_GetUpFromBail
  Obj_ClearExceptions
  GetTags
  Obj_SetAnimCycleMode off
  Obj_WaitAnimFinished
  switch <bail>
  case a
    Obj_CycleAnim anim = Ped_M_GetUpA
  case b
    Obj_CycleAnim anim = Ped_M_GetUpB
  case C
    Obj_CycleAnim anim = Ped_M_GetUpC
  case D
    Obj_CycleAnim anim = Ped_M_GetUpD
  case E
    Obj_CycleAnim anim = Ped_M_GetUpE
  default
  endswitch
  Goto Zoo_Ped_Elephant
endscript
script Zoo_ElephantTrainer_Shoot
  Obj_CycleAnim anim = Ped_ET_Shoot numcycles = 3
  Obj_CycleAnim anim = Ped_ET_ShootToGunIdle
  Obj_CycleAnim anim = Ped_ET_GunIdle
  Die
endscript
script Zoo_Ped_Stampede
  Obj_ClearExceptions
  Obj_PlayAnim anim = Ped_M_Run cycle
  Obj_SetPathVelocity 15 mph
  Obj_SetPathAcceleration 20 mphps
  Obj_SetPathDeceleration 10 mphps
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_WaitMove
  Obj_CycleAnim anim = Ped_M_RunToIdle
  Goto Zoo_Ped_Elephant
endscript
script Zoo_Scare_Elephant
  if not GetFlag flag = ZOO_ELEPHANT_SCARED
    Kill name = TRG_Elephant_Standing
    Kill name = TRGP_ElephantStampede
    Kill name = TRG_Ped_Trainer01
    PlayStream random( @elephant_trainer_after_hit01 @elephant_trainer_after_hit02 @elephant_trainer_after_hit03 @elephant_trainer_after_hit04 ) 
    Create prefix = "TRG_Rail_PicnicDamage_"
    Create prefix = "TRGP_GapStart_BridgeHole"
    SendException ZOO_ELEPHANT_SCARED prefix = "TRG_Ped_Elephant"
    Kill prefix = "TRG_Rail_PicnicNormal_"
    SetFlag flag = ZOO_ELEPHANT_SCARED
    Create name = TRG_Elephant_Stampede
    TeleportSkaterUp
    PlaySkaterCamAnim Skater = 0 name = CAM_ELEPHANT
    PauseSkaters
    PauseClock
    wait 395 frames
    Create name = Zoo_PicnicDamage01
    Kill prefix = "Zoo_PicnicNormal"
    Playsound HitMetalPlexiglass_11
    begin
      if SkaterCamAnimFinished name = CAM_ELEPHANT
        break
      endif
      wait 2 frames
    repeat
    Create name = TRG_Elephant_Rearing
    Create name = TRG_Elephant_Trainer_Shoot
    PlaySkaterCamAnim Skater = 0 name = CAM_ELEPHANT2
    Kill prefix = "Bridge_Normal"
    Kill prefix = "Zoo_BridgeFloor"
    Create prefix = "Bridge_Damaged"
    Create prefix = "Zoo_BridgeDestroyed"
    Kill prefix = "TRG_Rail_Bridge"
    Create prefix = "TRG_Rail_Damage"
    wait 80 frames
    Create name = Damage_Boards
    Create prefix = "DoorRotate"
    Create prefix = "BounceDoor"
    Kill name = BOARDED_01
    Playsound HitFlimsyWood_11
    begin
      if SkaterCamAnimFinished name = CAM_ELEPHANT2
        UnPauseClock
        UnPauseSkaters
        TeleportSkaterDown
        break
      endif
      wait 2 frames
    repeat
    Kill name = Damage_Boards
    Create name = Damage_boards02
    Create prefix = "FallenDoor"
  endif
endscript
script Zoo_Elephant_Stampede
  Playsound ElephantBlast
  Obj_CycleAnim anim = Rearing from = start to = 95
  Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
  Obj_CycleAnim anim = Rearing from = 96 to = 100
  Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
  Obj_CycleAnim anim = Rearing from = 100
  Obj_CycleAnim anim = IdleToRun BlendPeriod = 0.5
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathVelocity 40 mph
  Obj_SetPathTurnDist 1
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 10 mphps
  Obj_SetPathDeceleration 10 mphps
  Obj_SetPathMinStopVel 5
  Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
  Obj_CycleAnim anim = Run from = start to = 13 BlendPeriod = 0.5
  begin
    Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Run from = 14 to = 26
    Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Run from = 27 to = 42
    Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Run from = 43 to = end
    if not Obj_IsMoving
      Die
    endif
    Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Run from = start to = 13
  repeat
endscript
script Zoo_Elephant_Rearing
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathVelocity 40 mph
  Obj_SetPathTurnDist 1
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 10 mphps
  Obj_SetPathDeceleration 10 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Run cycle
  begin
    if Obj_IsMoving
    else
      Playsound ElephantBlast
      Obj_CycleAnim anim = Rearing
      Obj_CycleAnim anim = Idle
      Die
    endif
    wait 10 frames
  repeat
endscript
script Zoo_Elephant_Chillin
  Obj_PlayAnim anim = InclineIdle cycle
endscript
script ZOO_Skitch_Checker
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = ZOO_Skitch_Checker_Near
  Obj_SetInnerRadius 60
  begin
    wait 10 seconds
  repeat
endscript
script ZOO_Skitch_Checker_Near
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = ZOO_Skitch_Checker
  Obj_SetOuterRadius 65
  begin
    if Skater:animequals SkitchRange
      SendException OBJ_ELEPHANT_SKITCH name = TRG_Elephant_Collision
      SendException OBJ_ELEPHANT_SKITCH name = TRG_Elephant01
    else
      SendException OBJ_ELEPHANT_NOSKITCH name = TRG_Elephant_Collision
      SendException OBJ_ELEPHANT_NOSKITCH name = TRG_Elephant01
      if ObjectExists id = Elephant_Skitch
        RunScriptOnScreenElement id = Elephant_Skitch kill_panel_message
      endif
    endif
    wait 30 frames
  repeat
endscript
script Zoo_Elephant_Walk
  Obj_ClearExceptions
  Obj_SetException ex = OBJ_ELEPHANT_SKITCH scr = Zoo_Elephant_Walk_Fast
  Obj_SetPathVelocity 2 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 10 mphps
  Obj_SetPathDeceleration 10 mphps
  Obj_SetPathMinStopVel 5
  begin
    Obj_CycleAnim anim = Walk from = 0 to = 5
    Obj_Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 50 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Walk from = 5 to = 30
    Obj_Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 50 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Walk from = 30 to = 60
    Obj_Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 50 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Walk from = 60 to = 85
    Obj_Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 50 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Walk from = 85
  repeat
endscript
script Zoo_Elephant_Walk_Fast
  Obj_ClearExceptions
  Obj_SetException ex = OBJ_ELEPHANT_NOSKITCH scr = Zoo_Elephant_Walk
  Obj_SetPathVelocity 30 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 10 mphps
  Obj_SetPathDeceleration 10 mphps
  Obj_SetPathMinStopVel 5
  Playsound ElephantBlast
  begin
    Obj_Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Run from = start to = 13
    Obj_Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Run from = 14 to = 26
    Obj_Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Run from = 27 to = 42
    Obj_Playsound random( @StompyStep01 @StompyStep02 @StompyStep03 @StompyStep04  ) pitch = 100 vol = 100 dropoff = 5
    Obj_CycleAnim anim = Run from = 43 to = end
  repeat
endscript
script Zoo_Elephant_Turd_Creator_Wait
  Obj_ClearExceptions
  Obj_SetInnerRadius 5
  Obj_SetException ex = SkaterInRadius scr = Zoo_Elephant_Turd_Creator_Create params = <...>
  printf "Waiting to turd"
endscript
script Zoo_Elephant_Turd_Creator_Create
  Obj_ClearExceptions
  Obj_SetOuterRadius 7
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Elephant_Turd_Creator_Wait params = <...>
  printf "Turd Create"
  TRG_Elephant01:Obj_GetSpeed
  if ( <speed> > 15 )
    if Skater:animequals SkitchRange
      random( @
      
      Skater:AdjustBalance TimeAdd = 4 SpeedMult = 1.5 LeanMult = 1.5
      printf "Turds Away"
      Create name = <turd>
      @
      wait 1
       ) 
    endif
  endif
endscript
script Zoo_Elephant_Turd
  Obj_SetPathAcceleration 100 mphps
  Obj_SetPathVelocity 45 mph
  Obj_FollowPathLinked
  Obj_Playstream random( @ElephantPoo1 @ElephantPoo2  ) random( @pitch = 60 @pitch = 70  ) vol = 200
  Obj_WaitMove
  Die
endscript
script Zoo_Goal_Trickspot3_Intro
  Create prefix = "TRG_Elephant_Turd_"
endscript
script Zoo_Goal_Trickspot3_Deactivate
  if ObjectExists id = Elephant_Skitch
    RunScriptOnScreenElement id = Elephant_Skitch kill_panel_message
  endif
  Kill prefix = "TRG_Elephant_Turd_"
  MakeSkaterGoto SkaterInit
endscript
script Zoo_Elephant_Collision
  Obj_ClearExceptions
  Obj_SetException ex = OBJ_ELEPHANT_SKITCH scr = Zoo_Elephant_Collision_Fast
  Obj_SetPathVelocity 2 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 10 mphps
  Obj_SetPathDeceleration 10 mphps
  Obj_SetPathMinStopVel 5
endscript
script Zoo_Elephant_Collision_Fast
  Obj_ClearExceptions
  Obj_SetException ex = OBJ_ELEPHANT_NOSKITCH scr = Zoo_Elephant_Collision
  Obj_SetPathVelocity 30 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 10 mphps
  Obj_SetPathDeceleration 10 mphps
  Obj_SetPathMinStopVel 5
  if GoalManager_GoalIsActive name = zoo_goal_trickspot3
    create_panel_block id = Elephant_Skitch Text = "30 Seconds" style = panel_message_goal time = 1500
    wait 1 second
    if ObjectExists id = Elephant_Skitch
      RunScriptOnScreenElement id = Elephant_Skitch kill_panel_message
    endif
    wait 9 seconds
    create_panel_block id = Elephant_Skitch Text = "20 Seconds" style = panel_message_goal time = 1500
    wait 1 second
    if ObjectExists id = Elephant_Skitch
      RunScriptOnScreenElement id = Elephant_Skitch kill_panel_message
    endif
    wait 4 seconds
    create_panel_block id = Elephant_Skitch Text = "15 Seconds" style = panel_message_goal time = 1500
    wait 1 second
    if ObjectExists id = Elephant_Skitch
      RunScriptOnScreenElement id = Elephant_Skitch kill_panel_message
    endif
    wait 4 seconds
    create_panel_block id = Elephant_Skitch Text = "10 Seconds" style = panel_message_goal time = 1500
    wait 1 second
    if ObjectExists id = Elephant_Skitch
      RunScriptOnScreenElement id = Elephant_Skitch kill_panel_message
    endif
    wait 4 seconds
    create_panel_block id = Elephant_Skitch Text = "5" style = panel_message_goal time = 1500
    wait 1 second
    if ObjectExists id = Elephant_Skitch
      RunScriptOnScreenElement id = Elephant_Skitch kill_panel_message
    endif
    create_panel_block id = Elephant_Skitch Text = "4" style = panel_message_goal time = 1500
    wait 1 second
    if ObjectExists id = Elephant_Skitch
      RunScriptOnScreenElement id = Elephant_Skitch kill_panel_message
    endif
    create_panel_block id = Elephant_Skitch Text = "3" style = panel_message_goal time = 1500
    wait 1 second
    if ObjectExists id = Elephant_Skitch
      RunScriptOnScreenElement id = Elephant_Skitch kill_panel_message
    endif
    create_panel_block id = Elephant_Skitch Text = "2" style = panel_message_goal time = 1500
    wait 1 second
    if ObjectExists id = Elephant_Skitch
      RunScriptOnScreenElement id = Elephant_Skitch kill_panel_message
    endif
    create_panel_block id = Elephant_Skitch Text = "1" style = panel_message_goal time = 1500
    wait 1 second
    if ObjectExists id = Elephant_Skitch
      RunScriptOnScreenElement id = Elephant_Skitch kill_panel_message
    endif
    if GoalManager_SetGoalFlag name = zoo_goal_trickspot3 got_1 1
    endif
  endif
endscript
script Zoo_Seal
  wait random( @10 frames @20 frames @30 frames ) 
  begin
    Obj_CycleAnim anim = Idle numcycles = random( @2 @3 @4 ) 
    Obj_CycleAnim anim = Bark
    Obj_CycleAnim anim = Idle numcycles = random( @2 @3 @4 ) 
    Obj_CycleAnim anim = Clap
  repeat
endscript
script Zoo_Seal_Swim
  Obj_ShadowOff
  Obj_StickToGround off
  Obj_SetPathVelocity 5 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 1 mphps
  Obj_SetPathDeceleration 1 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Swim cycle
  begin
    <pitch1> = random( @80 @90 @100 )
    <pitch2> = random( @80 @90 @100 )
    <pitch3> = random( @80 @90 @100 )
    Obj_Playstream random(
      @Sealbark pitch = <pitch1>
      @Sealbark3 pitch = <pitch2>
      @Sealhappy3 pitch = <pitch3>
    )
    wait random(
      @0.125 seconds
      @1.5 seconds
      @1.75 seconds
      @2 seconds
    )
    <pitch4> = random( @80 @85 @90 @95 @100 )
    <pitch5> = random( @80 @85 @90 @95 @100 )
    Obj_Playstream random(
      @Sealbark4 pitch = <pitch4>
      @Sealhappy pitch = <pitch5>
    )
    wait random(
      @0.125 seconds
      @1.5 seconds
      @1.75 seconds
      @2 seconds
    )
  repeat
endscript
script Zoo_Giraffe_Walk
  Obj_SetPathVelocity 2 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 3 mphps
  Obj_SetPathDeceleration 3 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Walk cycle
  begin
    wait random( @3 seconds @5 seconds @7 seconds ) 
    Obj_CycleAnim anim = WalkToIdle
    Obj_StopAlongPath
    Obj_PlayAnim anim = GroundEatFromIdle
    Obj_Playstream giraffe_rd
    Obj_WaitAnimFinished
    Obj_CycleAnim anim = GroundEat numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim anim = GroundEatToIdle
    Obj_StartAlongPath
    Obj_CycleAnim anim = WalkFromIdle
    Obj_PlayAnim anim = Walk cycle
  repeat
endscript
script Zoo_Giraffe_Tree
  Obj_PlayAnim anim = Idle cycle
endscript
script Zoo_Hippo_Lovin_Wait
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = Zoo_Hippo_Lovin_Close
  Obj_SetInnerRadius 3
endscript
script Zoo_Hippo_Lovin_Close
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Hippo_Lovin_Wait
  Obj_SetOuterRadius 15
  if SkaterSpeedLessThan 1
    if not GoalManager_HasActiveGoals
      PauseSkaters
      PauseClock
      PlaySkaterCamAnim Skater = 0 name = CAM_HIPPO
      wait 25 frames
      Create name = Zoo_TelescopeCover
      begin
        if SkaterCamAnimFinished name = CAM_HIPPO
          UnPauseClock
          UnPauseSkaters
          break
        endif
        wait 2 frames
      repeat
      Kill name = Zoo_TelescopeCover
    endif
  else
    Goto Zoo_Hippo_Lovin_Wait
  endif
endscript
script Zoo_Hippo_Noisy
  Obj_ShadowOff
  Obj_PlayAnim anim = SwimIdle cycle
  begin
    Obj_MoveToRelPos (0, -20, 0) speed = random( @1 @2  ) acceleration = 2
    Obj_WaitMove
    wait random( @30 frames @60 frames @90 frames ) 
    Obj_MoveToRelPos (0, 20, 0) speed = random( @1 @2  ) acceleration = 1
    Obj_WaitMove
    wait random( @150 frames @180 frames @210 frames ) 
    Obj_PlayAnim anim = Roar
    Obj_Playsound Hippo1 pitch = random( @80 @85 @90 ) 
    Obj_WaitAnimFinished
    Obj_PlayAnim anim = SwimIdle cycle
  repeat
endscript
script Zoo_Hippo2
  wait 20 frames
  Obj_PlayAnim anim = SwimIdle cycle
  begin
    Obj_MoveToRelPos (0, -20, 0) speed = random( @1 @2  ) acceleration = 2
    Obj_WaitMove
    Obj_CycleAnim anim = Roar numcycles = 1
    Obj_PlayAnim anim = SwimIdle cycle
    wait random( @45 frames @75 frames @105 frames ) 
    Obj_MoveToRelPos (0, 20, 0) speed = random( @1 @2  ) acceleration = 1
    Obj_WaitMove
    wait random( @105 frames @120 frames @135 frames ) 
  repeat
endscript
script Zoo_Shark_Swim
  Obj_ShadowOff
  Obj_SetPathVelocity 5 mph
  Obj_SetPathTurnDist 20
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 1 mphps
  Obj_SetPathDeceleration 1 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Swim cycle
endscript
script Zoo_Shark_Swim_Big
  Obj_ShadowOff
  Obj_ApplyScaling x = 2.0 y = 2.0 z = 2.0
  Obj_SetPathVelocity 5 mph
  Obj_SetPathTurnDist 20
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 1 mphps
  Obj_SetPathDeceleration 1 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Swim cycle
endscript
script Zoo_Hippo_Swim
  Obj_ShadowOff
  Obj_SetPathVelocity 4 mph
  Obj_SetPathTurnDist 20
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 1 mphps
  Obj_SetPathDeceleration 1 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Swim cycle
endscript
script Zoo_Hippo_Eat
  Obj_PlayAnim anim = Eat cycle
endscript
script Zoo_Hippo_Aquarium
  begin
    Obj_CycleAnim anim = Idle numcycles = random( @1 @2 ) 
    Obj_CycleAnim anim = IdleToEat
    Obj_CycleAnim anim = Eat
    Obj_CycleAnim anim = EatToIdle
  repeat
endscript
script Zoo_GiantGator
  Obj_ApplyScaling x = 3.0 y = 3.0 z = 3.0
  begin
    Obj_CycleAnim anim = Idle numcycles = random( @2 @3 @4 ) 
    Obj_CycleAnim anim = Chomp speed = 0.3
  repeat
endscript
script Zoo_Monkey
  wait random( @10 frames @20 frames @30 frames ) 
  begin
    Obj_CycleAnim anim = UpAndDown numcycles = random( @2 @3 @4 ) 
    Obj_CycleAnim anim = Idle numcycles = random( @1 @2 @3 ) 
  repeat
endscript
script Zoo_Monkey_Fling
  Obj_ShadowOff
  wait random( @10 frames @20 frames @30 frames ) 
  begin
    Obj_CycleAnim anim = UpAndDown numcycles = random( @2 @3 @4 ) 
    Kill name = <poop>
    Obj_CycleAnim anim = Idle numcycles = random( @1 @2 @3 ) 
    Obj_PlayAnim anim = Fling
    wait 80 frames
    Obj_Playstream monkeypoo_splat1
    Create name = <poop>
    Obj_WaitAnimFinished
  repeat
endscript
script Zoo_Poo_Drip
  Obj_MoveToRelPos (0, -50, 0) speed = 2 acceleration = 1
  Obj_WaitMove
  Die
endscript
script Zoo_Monkey_Walk
  Obj_SetPathVelocity 15 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 10 mphps
  Obj_SetPathDeceleration 10 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Run cycle
endscript
script Zoo_Monkey_Race
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathVelocity 35 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 20 mphps
  Obj_SetPathDeceleration 20 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Run cycle
  Obj_WaitMove
  Die
endscript
script Zoo_Monkey_Stop_Fling
  random( @
  
  begin
    Obj_StopAlongPath
    Obj_PathHeading off
    Obj_LookAtObject type = Skater time = 0.5
    Obj_PlayAnim anim = Fling
    wait 80 frames
    Obj_Playstream monkeypoo_splat1
    Create name = <PoopNode>
    Obj_WaitAnimFinished
    Obj_PathHeading On
    Obj_StartAlongPath
    Obj_PlayAnim anim = Run cycle
  repeat 1
  @
  begin
    Obj_PlayAnim anim = Run cycle
  repeat 1
   ) 
endscript
script Zoo_Penguin_Idle
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = Zoo_Penguin_Idle_Fall
  Obj_SetInnerRadius 5
  Obj_CycleAnim anim = GetUp
  begin
    Obj_CycleAnim anim = Idle numcycles = random( @1 @2 ) 
    Obj_CycleAnim anim = Idle2 numcycles = random( @1 @2 ) 
  repeat
endscript
script Zoo_Penguin_Idle_Fall
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Penguin_Idle
  Obj_SetOuterRadius 10
  PlayStream HitPenguin
  Obj_CycleAnim anim = KnockDown
  Obj_PlayAnim anim = Struggling cycle
endscript
script Zoo_Penguin_Waddle
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = Zoo_Penguin_Waddle_Fall
  Obj_SetInnerRadius 5
  Obj_StopAlongPath
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathVelocity 3 mph
  Obj_SetPathTurnDist 1
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 1 mphps
  Obj_SetPathDeceleration 1 mphps
  Obj_SetPathMinStopVel 5
  Obj_CycleAnim anim = SlideToIdle
  Obj_StartAlongPath
  Obj_PlayAnim anim = Walk cycle
endscript
script Zoo_Penguin_Waddle_Fall
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Penguin_Waddle
  Obj_SetOuterRadius 10
  Obj_StopAlongPath
  PlayStream HitPenguin
  Obj_CycleAnim anim = KnockDown
  Obj_PlayAnim anim = Struggling cycle
endscript
script Zoo_Penguin_Slide
  Obj_ClearExceptions
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathVelocity 15 mph
  Obj_SetPathTurnDist 1
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 5 mphps
  Obj_SetPathDeceleration 5 mphps
  Obj_SetPathMinStopVel 5
  Obj_CycleAnim anim = SlideFromIdle
  Obj_PlayAnim anim = Slide cycle
endscript
script Zoo_Penguin_Walk
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = Zoo_Penguin_Fall params = <...>
  Obj_SetInnerRadius 5
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathVelocity 2 mph
  Obj_SetPathTurnDist 1
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 1 mphps
  Obj_SetPathDeceleration 1 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Walk cycle
endscript
script Zoo_Penguin_Fall
  Obj_ClearExceptions
  if GoalManager_SetGoalFlag name = Zoo_Goal_Collect <flag> 1
    Playsound GapSound vol = 100
    PlayStream HitPenguin
    GoalManager_GetGoalParams name = Zoo_Goal_Collect
    if not GoalManager_AllFlagsSet name = Zoo_Goal_Collect
      FormatText TextName = collect_text "%c of %n %t" C = <num_flags_set> t = <collect_type> n = <num_flags>
      create_panel_message Text = <collect_text> style = goal_collect_text
    endif
    Obj_StopAlongPath
    Obj_CycleAnim anim = KnockDown
    Obj_PlayAnim anim = Struggling cycle
  endif
endscript
script Zoo_Gorilla_Init
  if IsAlive name = TRG_G_TS2_PhotoGuy
  else
    Kill name = TRG_CatchGorillaLoose
    Create name = TRG_GorillaCaught
  endif
  Die
endscript
script Zoo_Tram
  Car_Generic01 DefaultSpeed = 20 skitchspeed = 40 carloopSFX = TramEngineLoop
endscript
script Zoo_TramDriver
  Obj_LockToObject ObjectName = <myTram> (-15, 2, 25)
  begin
    begin
      random( @
      Obj_CycleAnim anim = Ped_Ranger_DriveEasy1
      @Obj_CycleAnim anim = Ped_Ranger_DriveEasy2
       ) 
      if <myTram>:Obj_FlagSet FLAG_CAR_SOUND_FRANTICSTOP
        break
      endif
    repeat
    begin
      random( @
      Obj_CycleAnim anim = Ped_Ranger_DriveManic3
      @Obj_CycleAnim anim = Ped_Ranger_DriveManic4
      @Obj_CycleAnim anim = Ped_Ranger_DriveManic5
      @Obj_CycleAnim anim = Ped_Ranger_DriveManic6
       ) 
      if not <myTram>:Obj_FlagSet FLAG_CAR_SOUND_FRANTICSTOP
        Obj_CycleAnim anim = Ped_Ranger_DriveEasyFromDriveManic
        break
      endif
    repeat
  repeat
endscript
script Zoo_Gorilla_Tram
  Obj_LockToObject ObjectName = TRG_Tram (13, 37, 1)
  Obj_ApplyScaling x = 0.5 y = 0.5 z = 0.5
  begin
    Obj_CycleAnim anim = Sit numcycles = random( @3 @5 @7 ) 
    Obj_CycleAnim anim = SittingScratch
  repeat
endscript
script Zoo_Gorilla_Walk
  Obj_SetPathVelocity 2 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 3 mphps
  Obj_SetPathDeceleration 3 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Walk cycle
  begin
    wait random( @3 seconds @5 seconds @7 seconds ) 
    Obj_CycleAnim anim = WalkToIdle
    Obj_StopAlongPath
    Obj_PlayAnim anim = Roar
    Obj_Playstream Gorilla vol = 300 dropoff = 150
    Obj_WaitAnimFinished
    Obj_StartAlongPath
    Obj_CycleAnim anim = WalkFromIdle
    Obj_PlayAnim anim = Walk cycle
  repeat
endscript
script Zoo_Gorilla_Walk_Big
  Obj_ApplyScaling x = 1.3 y = 1.3 z = 1.3
  Obj_SetPathVelocity 2 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 3 mphps
  Obj_SetPathDeceleration 3 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Walk cycle
  begin
    wait random( @3 seconds @5 seconds @7 seconds ) 
    Obj_CycleAnim anim = WalkToIdle
    Obj_StopAlongPath
    Obj_PlayAnim anim = Roar
    Obj_Playstream Gorilla vol = 300 dropoff = 150
    Obj_WaitAnimFinished
    Obj_StartAlongPath
    Obj_CycleAnim anim = WalkFromIdle
    Obj_PlayAnim anim = Walk cycle
  repeat
endscript
script Zoo_Gorilla
  begin
    Obj_CycleAnim anim = Sit numcycles = 2
    Obj_CycleAnim anim = SittingScratch numcycles = 1
    Obj_CycleAnim anim = Sit numcycles = 1
    Obj_CycleAnim anim = SitToIdle numcycles = 1
    Obj_CycleAnim anim = Idle numcycles = 1
    Obj_PlayAnim anim = Roar
    Obj_Playstream Gorilla vol = 300 dropoff = 150
    Obj_WaitAnimFinished
    Obj_CycleAnim anim = SitFromIdle numcycles = 1
  repeat
endscript
script Zoo_Gorilla_Catch_Left
  if Triggertype [ TRIGGER_LIP_ON ]
    if IsAlive name = TRG_GorillaCaught
    else
      if GoalManager_GoalIsActive name = Zoo_Goal_trickspot2
        wait 3 seconds
        if Triggertype [ TRIGGER_LIP_ON ]
          if IsAlive name = TRG_CatchGorillaPODLeft
            Goto Zoo_GorillaCaught
          endif
          Create prefix = "Zoo_GorillaGrate"
          Kill name = Zoo_GorillaGrate01
          Kill prefix = "TRG_CatchGorilla"
          Create name = TRG_CatchGorillaPODRight
          Playsound LA_GratesOpen
          wait 45 frames
          PauseSkaters
          PauseClock
          PlaySkaterCamAnim Skater = 0 name = CAM_GORILLA
          begin
            if SkaterCamAnimFinished name = CAM_GORILLA
              UnPauseClock
              UnPauseSkaters
              break
            endif
            wait 2 frames
          repeat
        else
          create_panel_block id = Gorilla_Switch Text = "Its a bit rusty.  Stay on longer!" style = panel_message_goal time = 1500
          wait 1 second
          RunScriptOnScreenElement id = Gorilla_Switch kill_panel_message
        endif
      endif
    endif
  endif
endscript
script Zoo_Gorilla_Catch_Right
  if Triggertype [ TRIGGER_LIP_ON ]
    if IsAlive name = TRG_GorillaCaught
    else
      if GoalManager_GoalIsActive name = Zoo_Goal_trickspot2
        wait 3 seconds
        if Triggertype [ TRIGGER_LIP_ON ]
          if IsAlive name = TRG_CatchGorillaPODRight
            Goto Zoo_GorillaCaught
          endif
          Create prefix = "Zoo_GorillaGrate"
          Kill name = Zoo_GorillaGrate02
          Kill prefix = "TRG_CatchGorilla"
          Create name = TRG_CatchGorillaPODLeft
          Playsound LA_GratesOpen
          wait 45 frames
          PauseSkaters
          PauseClock
          PlaySkaterCamAnim Skater = 0 name = CAM_GORILLA
          begin
            if SkaterCamAnimFinished name = CAM_GORILLA
              UnPauseClock
              UnPauseSkaters
              break
            endif
            wait 2 frames
          repeat
        else
          create_panel_block id = Gorilla_Switch Text = "Its a bit rusty.  Stay on longer!" style = panel_message_goal time = 1500
          wait 1 second
          RunScriptOnScreenElement id = Gorilla_Switch kill_panel_message
        endif
      endif
    endif
  endif
endscript
script Zoo_GorillaPOD
  Obj_ApplyScaling x = 1.5 y = 1.5 z = 1.5
  Obj_PlayAnim anim = Roar cycle
  Obj_Playstream Gorilla vol = 300 dropoff = 150
  wait 15 seconds
  Create prefix = "Zoo_GorillaGrate"
  Create name = TRG_CatchGorillaLoose
  Playsound LA_GratesOpen
  Die
endscript
script Zoo_GorillaCaught
  Create name = TRG_GorillaCaught
  Kill prefix = "Zoo_GorillaGrate"
  Kill prefix = "TRG_CatchGorilla"
  Playsound LA_GratesOpen
  wait 45 frames
  PauseSkaters
  PauseClock
  PlaySkaterCamAnim Skater = 0 name = CAM_GORILLA
  begin
    if SkaterCamAnimFinished name = CAM_GORILLA
      UnPauseClock
      UnPauseSkaters
      break
    endif
    wait 2 frames
  repeat
  if GoalManager_SetGoalFlag name = Zoo_Goal_trickspot2 got_1 1
  endif
endscript
script Zoo_LionTamerWaiting
  begin
    Obj_CycleAnim anim = Ped_LT_Scared numcycles = random( @1 @2 ) 
    Obj_CycleAnim anim = Ped_LT_ScaredWave numcycles = random( @1 @2 ) 
  repeat
endscript
script Zoo_Lion_Outro
  Obj_SetPathVelocity 5
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 10 mphps
  Obj_SetPathDeceleration 10 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Walk cycle
  begin
    wait 5 frames
    if Obj_IsMoving
    else
      printf "Come on Kill me"
      Die
    endif
  repeat
endscript
script Zoo_Lion_Walk
  Kill name = TRGP_LionKill
  Obj_StoreNode
  Obj_LookAtNodeStored time = 0.5
  Obj_WaitRotate
  Obj_PathHeading On
  Obj_StartAlongPath
  Obj_ClearExceptions
  Obj_SetInnerRadius 5
  Obj_SetException ex = SkaterInRadius scr = Zoo_Lion_Eat params = <...>
  Obj_SetException ex = SkaterLanded scr = Zoo_Lion_Keep_Walking params = <...>
  Obj_SetException ex = SkaterBailed scr = Zoo_Lion_Keep_Walking params = <...>
  Obj_SetPathVelocity <speed>
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 1 mphps
  Obj_SetPathDeceleration 1 mphps
  Obj_SetPathMinStopVel 5
  Obj_CycleAnim anim = WalkFromIdle
  Obj_PlayAnim anim = Walk cycle
  begin
    if SkaterCurrentScorePotGreaterThan <score>
      Obj_StopAlongPath
      Obj_StoreNode
      Obj_PathHeading off
      Obj_LookAtObject type = Skater time = 0.5
      Obj_CycleAnim anim = WalkToIdle
      Obj_PlayAnim anim = Idle cycle
    endif
    wait 1 second
  repeat
endscript
script Zoo_Lion_Keep_Walking
  Kill name = TRGP_LionKill
  Obj_StoreNode
  Obj_LookAtNodeStored time = 0.5
  Obj_WaitRotate
  Obj_PathHeading On
  Obj_StartAlongPath
  Obj_ClearExceptions
  Obj_SetInnerRadius 5
  Obj_SetException ex = SkaterInRadius scr = Zoo_Lion_Eat params = <...>
  Obj_SetException ex = SkaterLanded scr = Zoo_Lion_Walk params = <...>
  Obj_SetException ex = SkaterBailed scr = Zoo_Lion_Walk params = <...>
  Obj_PathHeading On
  Obj_StartAlongPath
  Obj_CycleAnim anim = WalkFromIdle
  Obj_PlayAnim anim = Walk cycle
  begin
    if SkaterCurrentScorePotGreaterThan <score>
      Obj_StopAlongPath
      Obj_PathHeading off
      Obj_LookAtObject type = Skater time = 0.5
      Obj_CycleAnim anim = WalkToIdle
      Obj_PlayAnim anim = Idle cycle
    endif
    wait 1 second
  repeat
endscript
script Zoo_Lion_Eat
  Obj_ClearExceptions
  Obj_SetOuterRadius 1
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Lion_Walk params = <...>
  Create name = TRGP_LionKill
  begin
    wait 10 seconds
  repeat
endscript
script Zoo_KillSkater_Lions
  PlayStream HitLion
  DoFlash duration = 0.9 start_r = 180 start_g = 50 start_b = 50 start_a = 50 end_r = 90 end_g = 0 end_b = 0 end_a = 0
  sk3_killskater { message1 = "Cat Food!"
    message2 = "When Animals Attack!"
    message3 = "Nice Kitty!"
    message4 = "To The Lions!"
    r = 0 g = 0 b = 155
  }
endscript
script Zoo_Meerkat
  Obj_ShadowOff
  wait random( @10 frames @20 frames @30 frames ) 
  begin
    Obj_CycleAnim anim = UpIdle numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim anim = UpToDown
    Obj_CycleAnim anim = DownIdle numcycles = random( @1 @2 @3 ) 
    Obj_CycleAnim anim = DownToUp
  repeat
endscript
script Zoo_Elephant_Standing
  Obj_PlayAnim anim = Idle cycle
endscript
script Zoo_RhinoBonk
  if Triggertype trigger_BONK
    StopStream HitRhino
    PlayStream HitRhino
  endif
endscript
script Zoo_Rhino_Standing
  wait random( @10 frames @20 frames @30 frames @40 frames ) 
  begin
    Obj_CycleAnim anim = Idle numcycles = random( @1 @2 ) 
    Obj_PlayAnim anim = Stomp
    Obj_Playsound rhino pitch = random( @80 @85 @90 ) 
    Obj_WaitAnimFinished
    Obj_CycleAnim anim = Stomp numcycles = random( @1 @2 ) 
  repeat
endscript
script Zoo_Rhino_Charging
  Obj_PlayAnim anim = Run cycle
  Obj_MoveToLink speed = 30 acceleration = 10
  Obj_WaitMove
  Obj_CycleAnim anim = Impact
  Create name = TRG_RhinoManager
  Obj_PlayAnim anim = Idle cycle
  Obj_PlayAnim anim = Stomp cycle
endscript
script Zoo_Rhino_Charging2
  PlayStream rhinoclash
  Obj_PlayAnim anim = Run cycle
  Obj_MoveToLink speed = 30 acceleration = 10
  Obj_CycleAnim anim = Impact
  Obj_WaitMove
  Obj_PlayAnim anim = Idle cycle
  wait 10 frames
  Obj_PlayAnim anim = Stomp cycle
endscript
script Zoo_RhinoDown
  Obj_PlayAnim anim = Fall
  PlayStream rhinofall
  Obj_WaitAnimFinished
  Obj_PlayAnim anim = FallenIdle cycle
endscript
script Zoo_RhinoManager
  Obj_ClearFlag ALL
  random( @
  
  begin
    Create name = TRG_RhinoDown01
    Create name = RhinoDown01_Collsion
    Create name = TRG_RhinoStopCollision02
    wait 2 frames
    Kill name = TRG_RhinoCharging01
  repeat 1
  @
  begin
    Create name = TRG_RhinoDown02
    Create name = RhinoDown02_Collsion
    Create name = TRG_RhinoStopCollision01
    wait 2 frames
    Kill name = TRG_RhinoCharging02
  repeat 1
  @
  begin
    Create name = TRG_RhinoDown01
    Create name = RhinoDown01_Collsion
    Create name = TRG_RhinoDown02
    Create name = RhinoDown02_Collsion
    wait 2 frames
    Kill name = TRG_RhinoCharging01
    Kill name = TRG_RhinoCharging02
  repeat 1
   ) 
  Die
endscript
script Zoo_Elephant_Keeper
  Obj_PlayAnim anim = Ped_M_Idle1 cycle
  Obj_ClearExceptions
  if IsCareerMode
    attach_arrow_to_object object_id = TRG_Ped_Trainer01
    setup_ped_speech { ped_id = TRG_Ped_Trainer01
      speed = 2
      display_name = "Elephant Trainer"
      activation_script = Zoo_ET_VO
      Text = [ "Elephant Trainer:\n Be careful around old Stompy here! "
        "Skate too close to her head, and there's no "
        "telling what she'll do!"
      ]
    }
  endif
endscript
script Zoo_ET_VO
  PlayStream elephant_trainer
endscript
script Zoo_Elephant_Keeper_Talk
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Elephant_Keeper
  Obj_SetOuterRadius 150
  Create_Speech_box Text = [ "Elephant Trainer:\n Be careful around old Stompy here! "
    "Skate too close to her head, and there's no "
    "telling what she'll do!"
  ]
endscript
script Zoo_Kenny
  Obj_ClearExceptions
  Obj_SetInnerAvoidRadius 3
  Obj_SetException ex = SkaterInAvoidRadius scr = goal_pro_bounce_skater
  Obj_PlayAnim anim = Ped_ZM_Idle cycle
  if IsCareerMode
    if not GoalManager_GoalIsActive name = zoo_goal_trickspot
      setup_ped_speech {
        ped_id = TRG_Ped_Kenny
        speed = 2
        display_name = "Kenny"
        activation_script = Zoo_Kenny_VO
        Text = [ "Kenny The Koala:\n Welcome to the Zoo! "
          "Sorry, but the aquarium is closed today. "
          "Now Stop Bothering Me!"
        ]
      }
    endif
  endif
endscript
script Zoo_Kenny_VO
  PlayStream Kenny_Talk01
endscript
script Zoo_Kenny_Close
  Obj_ClearExceptions
  Obj_SetOuterRadius 150
  Obj_SetInnerRadius 5
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Kenny
  Obj_SetException ex = SkaterInRadius scr = Zoo_Kenny_Fall
  if GoalManager_GoalIsActive name = zoo_goal_trickspot
  else
    Create_Speech_box Text = [ "Kenny The Koala:\n Welcome to the Zoo! "
      "Sorry, but the aquarium is closed today. "
      "Now Stop Bothering Me!"
    ]
  endif
endscript
script Zoo_Kenny_Fall
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Kenny
  Obj_SetOuterRadius 20
  Obj_PlayAnim anim = Ped_M_FalldownA
  Playsound bail04
endscript
script Zoo_Kenny_Run
  Obj_ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = Zoo_Kenny_Run_Fall
  Obj_SetInnerRadius 4
  Obj_PathHeading On
  Obj_StartAlongPath
  Obj_StickToGround distAbove = 3 distBelow = 6
  Obj_SetPathVelocity 18 mph
  Obj_SetPathTurnDist 10
  Obj_FollowPathLinked
  Obj_SetPathAcceleration 15 mphps
  Obj_SetPathDeceleration 15 mphps
  Obj_SetPathMinStopVel 5
  Obj_PlayAnim anim = Ped_ZM_Run cycle
  begin
    wait random( @4 seconds @6 seconds @8 seconds ) 
    Obj_Playstream random( @kenny_run01 @kenny_run02 ) 
  repeat
endscript
script Zoo_Kenny_Run_Fall
  Obj_ClearExceptions
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_Kenny_Getup
  Obj_SetOuterRadius 10
  Playsound bail04
  Obj_StopAlongPath
  Obj_PlayAnim anim = Ped_M_FalldownA
endscript
script Zoo_Kenny_Getup
  Obj_ClearExceptions
  Obj_CycleAnim anim = Ped_M_GetUpA
  Goto Zoo_Kenny_Run
endscript
script Zoo_Kenny_FinishGoal_Heelflip
  begin
    if Obj_ObjectInRect dist = 8 width = 8 height = 40 type = [ Skater ] offset = (0, 0, 0)
      if Skater:animequals [ heelflip ]
        begin
          if Skater:InAir
          else
            if Skater:IsInBail
              break
            else
              wait 20 frames
              GoalManager_SetGoalFlag name = zoo_goal_trickspot got_2 1
              printf "Heel I think"
              break
            endif
          endif
          wait 1 frame
        repeat
      endif
    endif
    wait 2 frame
  repeat
endscript
script Zoo_Kenny_FinishGoal_Hardflip
  begin
    if Obj_ObjectInRect dist = 8 width = 8 height = 40 type = [ Skater ] offset = (0, 0, 0)
      if Skater:animequals [ hardflip ]
        begin
          if Skater:InAir
          else
            if Skater:IsInBail
              break
            else
              wait 20 frames
              GoalManager_SetGoalFlag name = zoo_goal_trickspot got_2 1
              printf "Hard I think"
              break
            endif
          endif
          wait 1 frame
        repeat
      endif
    endif
    wait 2 frame
  repeat
endscript
script zoo_crap
  begin
    wait 10 seconds
  repeat
endscript
script Zoo_Kenny_Gap
  if GoalManager_GoalIsActive name = zoo_goal_trickspot
    StartGap GapID = KennyHard flags = [ CANCEL_GROUND ] TrickText = "Hardflip" trickscript = zoo_goal_trickspot_got_Gap1Hard
    StartGap GapID = KennyHeel flags = [ CANCEL_GROUND ] TrickText = "Heelflip" trickscript = zoo_goal_trickspot_got_Gap1Heel
    wait 5 frames
    EndGap GapID = KennyHard
    EndGap GapID = KennyHeel
  endif
endscript
script HippoPlant
  ClearExceptions
  InAirExceptions
  ClearException Carplant
  PlayStream HippoPlant
  DoCarPlantBoost
  SpawnSkaterScript Zoo_Skater_Boost
  SetTrickName "Hippo Plant"
  SetTrickScore 400
  Display
  if DoingTrick
  else
    PlayAnim anim = Beanplant BlendPeriod = 0.3
    WaitAnimWhilstChecking
    Goto Airborne
  endif
endscript
script Zoo_Skater_Boost
  Move y = 50
endscript
script Zoo_Floating_Log
  begin
    Obj_RotY angle = 20 speed = 3 acceleration = 4
    Obj_WaitRotate
    Obj_RotY angle = -20 speed = 3 acceleration = 4
    Obj_WaitRotate
  repeat
endscript
script Zoo_Floating_Log2
  begin
    Obj_RotY angle = -20 speed = 3 acceleration = 4
    Obj_WaitRotate
    Obj_RotY angle = 20 speed = 3 acceleration = 4
    Obj_WaitRotate
  repeat
endscript
script Zoo_Penguin
endscript
script ZOO_goal_special_StartGap
  if GoalManager_GoalIsActive name = Zoo_Goal_Special
    StartGap GapID = ZooSpecial flags = [ PURE_AIR ] TrickText = "Sit Down Air" trickscript = zoo_goal_special_got_gap1
  else
    StartGap GapID = ZooSpecial flags = [ PURE_AIR ]
  endif
endscript
script ZOO_goal_special_EndGap
  EndGap GapID = ZooSpecial Text = "Lions Den Hop" score = 1000
endscript
script zoo_goal_special_got_gap1
  GoalManager_WinGoal name = Zoo_Goal_Special
endscript
script Zoo_ElephantRockGap
  StartGap flags = CANCEL_GROUND trickscript = zoo_goal_gaps2_got_1
  wait 1 frame
  EndGap Text = "Over Elephant Rock" score = 1000
endscript
script Zoo_BannerGap1
  if GoalManager_GoalIsActive name = Zoo_Goal_Gaps
    StartGap flags = CANCEL_GROUND trickscript = zoo_goal_gaps_got_1
  else
    StartGap flags = CANCEL_GROUND
  endif
  wait 1 frame
  EndGap Text = "Banner Gap 1!" score = 100
endscript
script Zoo_BannerGap2
  if GoalManager_GoalIsActive name = Zoo_Goal_Gaps
    StartGap flags = CANCEL_GROUND trickscript = zoo_goal_gaps_got_2
  else
    StartGap flags = CANCEL_GROUND
  endif
  wait 1 frame
  EndGap Text = "Banner Gap 2!" score = 100
endscript
script Zoo_BannerGap3
  if GoalManager_GoalIsActive name = Zoo_Goal_Gaps
    StartGap flags = CANCEL_GROUND trickscript = zoo_goal_gaps_got_3
  else
    StartGap flags = CANCEL_GROUND
  endif
  wait 1 frame
  EndGap Text = "Banner Gap 3!" score = 100
endscript
script Zoo_BannerGap4
  if GoalManager_GoalIsActive name = Zoo_Goal_Gaps
    StartGap flags = CANCEL_GROUND trickscript = zoo_goal_gaps_got_4
  else
    StartGap flags = CANCEL_GROUND
  endif
  wait 1 frame
  EndGap Text = "Banner Gap 4!" score = 100
endscript
script zoo_goal_gaps_got_1
  if GoalManager_SetGoalFlag name = Zoo_Goal_Gaps got_1 1
  endif
endscript
script zoo_goal_gaps_got_2
  if GoalManager_SetGoalFlag name = Zoo_Goal_Gaps got_2 1
  endif
endscript
script zoo_goal_gaps_got_3
  if GoalManager_SetGoalFlag name = Zoo_Goal_Gaps got_3 1
  endif
endscript
script zoo_goal_gaps_got_4
  if GoalManager_SetGoalFlag name = Zoo_Goal_Gaps got_4 1
  endif
endscript
script zoo_goal_gaps2_got_1
  if GoalManager_GoalIsActive name = zoo_goal_gaps2
    if GoalManager_SetGoalFlag name = zoo_goal_gaps2 got_1 1
    endif
  endif
endscript
script Zoo_Goal_collect2_got_1
  if GoalManager_GoalIsActive name = zoo_goal_collect2
    if GoalManager_SetGoalFlag name = zoo_goal_collect2 got_1 1
      Playsound smashcake
      Kill name = Pumpkin_01
    endif
  endif
endscript
script Zoo_Goal_collect2_got_2
  if GoalManager_GoalIsActive name = zoo_goal_collect2
    if GoalManager_SetGoalFlag name = zoo_goal_collect2 got_2 1
      Playsound smashcake
      Kill name = Pumpkin_02
    endif
  endif
endscript
script Zoo_Goal_collect2_got_3
  if GoalManager_GoalIsActive name = zoo_goal_collect2
    if GoalManager_SetGoalFlag name = zoo_goal_collect2 got_3 1
      Playsound smashcake
      Kill name = Pumpkin_03
    endif
  endif
endscript
script Zoo_Goal_collect2_got_4
  if GoalManager_GoalIsActive name = zoo_goal_collect2
    if GoalManager_SetGoalFlag name = zoo_goal_collect2 got_4 1
      Playsound smashcake
      Kill name = Pumpkin_04
    endif
  endif
endscript
script Zoo_LionLipGapStart
  StartGap GapID = LionLip flags = [ CANCEL_GROUND ]
endscript
script Zoo_LionLipGapEnd
  if Triggertype [ TRIGGER_LIP_ON ]
    EndGap GapID = LionLip Text = "Hold On! Lions Below" score = 500
  endif
endscript
script Zoo_GapStart_Wave
  StartGap GapID = WaveLow flags = [ CANCEL_GROUND ]
  StartGap GapID = WaveMid flags = [ CANCEL_GROUND ]
  StartGap GapID = WaveHigh flags = [ CANCEL_GROUND ]
endscript
script Zoo_GapEnd_WaveLow
  if Triggertype [ TRIGGER_LIP_ON ]
    EndGap GapID = WaveLow Text = "Low Tide" score = 100
  endif
endscript
script Zoo_GapEnd_WaveMid
  if Triggertype [ TRIGGER_LIP_ON ]
    EndGap GapID = WaveMid Text = "Big Surf" score = 500
  endif
endscript
script Zoo_GapEnd_WaveHigh
  if Triggertype [ TRIGGER_LIP_ON ]
    EndGap GapID = WaveHigh Text = "Tidal Wave" score = 1000
  endif
endscript
script Zoo_Gap_PicnicPop2_1_3
  StartGap GapID = Picnic2 flags = [ CANCEL_GROUND , CANCEL_RAIL ]
  EndGap GapID = Picnic1 Text = "Picnic Pop" score = 50
  EndGap GapID = Picnic3 Text = "Picnic Pop" score = 50
endscript
script Zoo_Gap_Picnic1_2_3
  StartGap GapID = Picnic1 flags = [ CANCEL_GROUND , CANCEL_RAIL ]
  EndGap GapID = Picnic2 Text = "Picnic Pop" score = 50
  EndGap GapID = Picnic3 Text = "Picnic Pop" score = 50
endscript
script Zoo_Gap_Picnic3_1_2
  StartGap GapID = Picnic3 flags = [ CANCEL_GROUND , CANCEL_RAIL ]
  EndGap GapID = Picnic1 Text = "Picnic Pop" score = 50
  EndGap GapID = Picnic2 Text = "Picnic Pop" score = 50
endscript
script Zoo_Gap_HandrailHopStart
  StartGap GapID = Handrail01 flags = [ CANCEL_GROUND ]
endscript
script Zoo_Gap_HandrailHopEnd
  EndGap GapID = Handrail01 Text = "Handrail Hop" score = 100
endscript
script Zoo_Gap_Wave2Wave
  StartGap flags = [ PURE_AIR ]
  wait 1 frame
  EndGap Text = "Wave 2 Wave" score = 100
endscript
script Zoo_Gap_BridgeTransfer
  StartGap flags = [ PURE_AIR ]
  wait 1 frame
  EndGap Text = "Bridge Transfer" score = 100
endscript
script Zoo_Gap_WelcomeToTheZoo
  StartGap flags = [ CANCEL_GROUND ]
  EndGap Text = "Welcome to the Zoo" score = 100
endscript
script Zoo_Gap_ExhibitsOpen
  StartGap flags = [ CANCEL_GROUND ]
  EndGap Text = "All Exhibits Open" score = 100
endscript
script Zoo_Gap_GrindPlanter
  StartGap flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap Text = "Grind The Whole Planter" score = 100
endscript
script Zoo_Gap_TakeBridge
  StartGap flags = [ PURE_AIR ]
  EndGap Text = "Take it to the bridge" score = 500
endscript
script Zoo_Gap_GrindOver
  StartGap flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap Text = "Grind Over It" score = 100
endscript
script Zoo_Gap_ManualOver
  StartGap flags = [ CANCEL_GROUND , CANCEL_RAIL ]
  EndGap Text = "Manual Over It" score = 100
endscript
script Zoo_Gap_SnackBarHop
  EndGap Text = "Snack Bar Hop" score = 100
endscript
script Zoo_Gap_BirdhouseRail
  StartGap flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap Text = "Birdhouse Rail" score = 100
endscript
script Zoo_Gap_HearNoEvil
  StartGap flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap Text = "Hear No Evil" score = 100
endscript
script Zoo_Gap_SeeNoEvil
  StartGap flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap Text = "See No Evil" score = 100
endscript
script Zoo_Gap_SpeakNoEvil
  StartGap flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap Text = "Speak No Evil" score = 100
endscript
script Zoo_Gap_BridgeRoof
  StartGap flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap Text = "Bridge Roof Grind" score = 500
endscript
script Zoo_Gap_LongPlanter
  StartGap flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap Text = "What a long planter!" score = 100
endscript
script Zoo_Gap_BackwoodsStart
  StartGap GapID = BackWoods flags = [ CANCEL_GROUND ]
endscript
script Zoo_Gap_BackwoodsEnd
  EndGap GapID = BackWoods Text = "Backwoods Path" score = 100
endscript
script Zoo_Gap_PopRock
  StartGap flags = [ CANCEL_GROUND ]
  EndGap Text = "Pop Rock" score = 50
endscript
script Zoo_Gap_HippoPool
  EndGap Text = "Hungry, Hungry Hippo Pool" score = 100
endscript
script Zoo_Gap_Fries
  StartGap flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
  EndGap Text = "You want fries with that?" score = 100
endscript
script Zoo_Gap_LongNeck
  StartGap flags = [ PURE_AIR ]
  EndGap Text = "Long Neck Gap" score = 100
endscript
script Zoo_Gap_BigMoat
  EndGap Text = "Big Moat Transfer" score = 100
endscript
script Zoo_Gap_StartElephant
  StartGap GapID = Elephant flags = PURE_AIR
endscript
script Zoo_Gap_StartLions
  StartGap GapID = Lion01 flags = [ CANCEL_GROUND ]
endscript
script Zoo_Gap_ZooRoof
  StartGap GapID = zOOrOOf flags = [ CANCEL_GROUND ]
endscript
script Zoo_Gap_ZooRoofEnd
  EndGap GapID = zOOrOOf Text = "zOOrOOfgAp" score = 100
endscript
script Zoo_Gap_SharkTank
  EndGap Text = "Shark Tank Trip" score = 100
endscript
script Zoo_Gap_ArfArf
  EndGap Text = "Arf! Arf! Arf!" score = 100
endscript
script Zoo_Gap_BankGap
  EndGap Text = "Bank Gap" score = 100
endscript
script Zoo_Gap_Ape
  EndGap Text = "You Drive Me Ape!" score = 100
endscript
script Zoo_Gap_Gorilla
  EndGap Text = "You Big Gorilla!" score = 100
endscript
script Zoo_Gap_ElephantHop
  if Triggertype trigger_BONK
    PlayStream HitElephant
  else
    if not GoalManager_HasActiveGoals
      EndGap GapID = Elephant Text = "Elephant Hop" score = 500 GapScript = Zoo_Scare_Elephant
    endif
  endif
endscript
script Zoo_Gap_BoxOffice
  StartGap GapID = BoxOffice flags = [ CANCEL_GROUND ]
endscript
script Zoo_Gap_OverHills
  EndGap Text = "Over The Hills" score = 500
endscript
script Zoo_Gap_LikeMonkey
  StartGap GapID = LikeMonkey flags = [ PURE_AIR ]
endscript
script Zoo_Gap_LikeMonkeyEnd
  EndGap GapID = LikeMonkey Text = "Move Like a Monkey!" score = 100
endscript
script Zoo_Gap_Start_PureAir
  StartGap flags = [ PURE_AIR ]
endscript
script Zoo_Gap_Start_CancelGround
  StartGap flags = [ CANCEL_GROUND ]
endscript
script Zoo_Gap_Start_CancelGroundManual
  StartGap flags = [ CANCEL_GROUND , CANCEL_MANUAL ]
endscript
script Zoo_Gap_Start_CancelGroundRail
  StartGap flags = [ CANCEL_GROUND , CANCEL_RAIL ]
endscript
script zoo_horse_spot01
  create_panel_block id = current_horse_spot Text = "40,000 points" style = panel_message_new_horse_spot
endscript
script zoo_horse_spot02
  create_panel_block id = current_horse_spot Text = "50,000 points" style = panel_message_new_horse_spot
endscript
script zoo_horse_spot03
  create_panel_block id = current_horse_spot Text = "60,000 points" style = panel_message_new_horse_spot
endscript
OBJFLAG_BOB_PROCHALLENGE_TRICK1 = 0
OBJFLAG_BOB_PROCHALLENGE_TRICK2 = 1
OBJFLAG_BOB_PROCHALLENGE_TRICK3 = 2
OBJFLAG_BOB_PROCHALLENGE_TRICK1_DONE = 3
OBJFLAG_BOB_PROCHALLENGE_TRICK2_DONE = 4
OBJFLAG_BOB_PROCHALLENGE_TRICK3_DONE = 5
script Zoo_Goal_Counter_Intro
  Create prefix = "BobChallenge1_"
  Kill prefix = "TRG_G_COMPNOT_"
  Kill prefix = "G_COMPNOT_"
  Create prefix = "G_COMPNOT_Bob_"
  Kill name = TRG_Ped_TramRider01
  Kill name = TRG_Ped_TramDriver
  Kill name = TRG_Tram
endscript
script Zoo_Goal_Counter_Deactivate
  Kill prefix = "BobChallenge"
  Kill prefix = "MovingLoop"
  Create prefix = "TRG_G_COMPNOT_"
  Create prefix = "G_COMPNOT_"
  if not IsAlive name = TRG_Tram
    Create name = TRG_Tram
    Create name = TRG_Ped_TramRider01
    Create name = TRG_Ped_TramDriver
  endif
  MakeSkaterGoto Zoo_ProChallengeBob_MoveToRestart
endscript
script Zoo_BobChallenge1_Gaps1_1
  printf "Zoo_BobChallenge1_Gaps1_1"
  EndGap GapID = BobChallenge0_2 Text = "Loop Hole" score = 500
  EndGap GapID = BobChallenge1_2
  EndGap GapID = BobChallenge2_2
  EndGap GapID = BobChallenge3_2
  StartGap GapID = BobChallenge0_1
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t1"
  StartGap GapID = BobChallenge1_1 flags = [ REQUIRE_GROUND ] TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK1
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t2"
  StartGap GapID = BobChallenge2_1 flags = [ REQUIRE_GROUND ] TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK2
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t3"
  StartGap GapID = BobChallenge3_1 flags = [ REQUIRE_GROUND ] TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK3
endscript
script Zoo_BobChallenge1_Gaps1_2
  printf "Zoo_BobChallenge1_Gaps1_2"
  EndGap GapID = BobChallenge0_1 Text = "Loop Hole" score = 500
  EndGap GapID = BobChallenge1_1
  EndGap GapID = BobChallenge2_1
  EndGap GapID = BobChallenge3_1
  StartGap GapID = BobChallenge0_2
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t1"
  StartGap GapID = BobChallenge1_2 flags = [ REQUIRE_GROUND ] TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK1
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t2"
  StartGap GapID = BobChallenge2_2 flags = [ REQUIRE_GROUND ] TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK2
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t3"
  StartGap GapID = BobChallenge3_2 flags = [ REQUIRE_GROUND ] TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK3
endscript
script Zoo_BobChallenge2_Gaps1_1
  printf "Zoo_BobChallenge2_Gaps1_1"
  EndGap GapID = BobChallenge0_2 Text = "Loop Hole" score = 500
  EndGap GapID = BobChallenge1_2
  EndGap GapID = BobChallenge2_2
  EndGap GapID = BobChallenge3_2
  StartGap GapID = BobChallenge0_1
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t4"
  StartGap GapID = BobChallenge1_1 TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK1
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t5"
  StartGap GapID = BobChallenge2_1 TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK2
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t6"
  StartGap GapID = BobChallenge3_1 TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK3
endscript
script Zoo_BobChallenge2_Gaps1_2
  printf "Zoo_BobChallenge2_Gaps1_2"
  EndGap GapID = BobChallenge0_1 Text = "Loop Hole" score = 500
  EndGap GapID = BobChallenge1_1
  EndGap GapID = BobChallenge2_1
  EndGap GapID = BobChallenge3_1
  StartGap GapID = BobChallenge0_2
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t4"
  StartGap GapID = BobChallenge1_2 TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK1
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t5"
  StartGap GapID = BobChallenge2_2 TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK2
  GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\t6"
  StartGap GapID = BobChallenge3_2 TrickText = <TrickText> trickscript = Zoo_ProChallengeBob_GotTRICK3
endscript
script Zoo_BobChallenge3_Gaps1_1
  printf "Zoo_BobChallenge3_Gaps1_1"
  EndGap GapID = BobChallenge0_2 Text = "Loop Hole" score = 500
  EndGap GapID = BobChallenge1_2
  EndGap GapID = BobChallenge2_2
  EndGap GapID = BobChallenge3_2
  StartGap GapID = BobChallenge0_1
  StartGap GapID = BobChallenge1_1 TrickText = "Method" trickscript = Zoo_ProChallengeBob_GotTRICK1
  StartGap GapID = BobChallenge2_1 TrickText = "Samba Flip" trickscript = Zoo_ProChallengeBob_GotTRICK2
  StartGap GapID = BobChallenge3_1 TrickText = "Sit Down Air" trickscript = Zoo_ProChallengeBob_GotTRICK3
endscript
script Zoo_BobChallenge3_Gaps1_2
  printf "Zoo_BobChallenge3_Gaps1_2"
  EndGap GapID = BobChallenge0_1 Text = "Loop Hole" score = 500
  EndGap GapID = BobChallenge1_1
  EndGap GapID = BobChallenge2_1
  EndGap GapID = BobChallenge3_1
  StartGap GapID = BobChallenge0_2
  StartGap GapID = BobChallenge1_2 TrickText = "Method" trickscript = Zoo_ProChallengeBob_GotTRICK1
  StartGap GapID = BobChallenge2_2 TrickText = "Samba Flip" trickscript = Zoo_ProChallengeBob_GotTRICK2
  StartGap GapID = BobChallenge3_2 TrickText = "Sit Down Air" trickscript = Zoo_ProChallengeBob_GotTRICK3
endscript
script Zoo_ProChallengeBob_GotTRICK1
  Kill name = TRG_SkaterLanded
  Kill name = TRG_SkaterBailed
  begin
    if IsAlive name = TRG_SkaterBailed
      printf "skaterbailed"
      break
    endif
    if IsAlive name = TRG_SkaterLanded
      printf "skaterlanded"
      StartGap GapID = ProChallengeBob_TRICK1
      EndGap GapID = ProChallengeBob_TRICK1 Text = "Bob's Pro Challenge TRICK 1" score = 500
      SendFlag name = TRG_G_COUNTER_Loop_ChallengeObj OBJFLAG_BOB_PROCHALLENGE_TRICK1
      break
    endif
    wait 2 frames
    printf "waiting..."
  repeat
  Kill name = TRG_SkaterLanded
  Kill name = TRG_SkaterBailed
endscript
script Zoo_ProChallengeBob_GotTRICK2
  Kill name = TRG_SkaterLanded
  Kill name = TRG_SkaterBailed
  begin
    if IsAlive name = TRG_SkaterBailed
      printf "skaterbailed"
      break
    endif
    if IsAlive name = TRG_SkaterLanded
      printf "skaterlanded"
      StartGap GapID = ProChallengeBob_TRICK1
      EndGap GapID = ProChallengeBob_TRICK1 Text = "Bob's Pro Challenge TRICK 2" score = 500
      SendFlag name = TRG_G_COUNTER_Loop_ChallengeObj OBJFLAG_BOB_PROCHALLENGE_TRICK2
      break
    endif
    wait 2 frames
    printf "waiting..."
  repeat
  Kill name = TRG_SkaterLanded
  Kill name = TRG_SkaterBailed
endscript
script Zoo_ProChallengeBob_GotTRICK3
  Kill name = TRG_SkaterLanded
  Kill name = TRG_SkaterBailed
  begin
    if IsAlive name = TRG_SkaterBailed
      printf "skaterbailed"
      break
    endif
    if IsAlive name = TRG_SkaterLanded
      printf "skaterlanded"
      StartGap GapID = ProChallengeBob_TRICK1
      EndGap GapID = ProChallengeBob_TRICK1 Text = "Bob's Pro Challenge TRICK 3" score = 500
      SendFlag name = TRG_G_COUNTER_Loop_ChallengeObj OBJFLAG_BOB_PROCHALLENGE_TRICK3
      break
    endif
    wait 2 frames
    printf "waiting..."
  repeat
  Kill name = TRG_SkaterLanded
  Kill name = TRG_SkaterBailed
endscript
script Zoo_BobChallengeManager
   <trickindex> = 1
  begin
    if not Obj_FlagSet OBJFLAG_BOB_PROCHALLENGE_TRICK1_DONE
      if Obj_FlagSet OBJFLAG_BOB_PROCHALLENGE_TRICK1
        GoalManager_GotCounterObject name = zoo_goal_counter
        Obj_ClearFlag OBJFLAG_BOB_PROCHALLENGE_TRICK1
        Obj_SetFlag OBJFLAG_BOB_PROCHALLENGE_TRICK1_DONE
        printf "Got trick1"
      endif
    endif
    if not Obj_FlagSet OBJFLAG_BOB_PROCHALLENGE_TRICK2_DONE
      if Obj_FlagSet OBJFLAG_BOB_PROCHALLENGE_TRICK2
        GoalManager_GotCounterObject name = zoo_goal_counter
        Obj_ClearFlag OBJFLAG_BOB_PROCHALLENGE_TRICK2
        Obj_SetFlag OBJFLAG_BOB_PROCHALLENGE_TRICK2_DONE
        printf "Got trick2"
      endif
    endif
    if not Obj_FlagSet OBJFLAG_BOB_PROCHALLENGE_TRICK3_DONE
      if Obj_FlagSet OBJFLAG_BOB_PROCHALLENGE_TRICK3
        GoalManager_GotCounterObject name = zoo_goal_counter
        Obj_ClearFlag OBJFLAG_BOB_PROCHALLENGE_TRICK3
        Obj_SetFlag OBJFLAG_BOB_PROCHALLENGE_TRICK3_DONE
        printf "Got trick3"
      endif
    endif
    if Obj_FlagSet OBJFLAG_BOB_PROCHALLENGE_TRICK1_DONE
      if Obj_FlagSet OBJFLAG_BOB_PROCHALLENGE_TRICK2_DONE
        if Obj_FlagSet OBJFLAG_BOB_PROCHALLENGE_TRICK3_DONE
          Obj_ClearFlag ALL
           <trickindex> = ( <trickindex> + 1 )
          if ( <trickindex> = 2 )
            GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "Lets move the loop a bit!"
            create_panel_block id = current_goal Text = <TrickText> style = panel_message_goal
            GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "\n\t4 \k4 \n\t5 \k5 \n\t6 \k6"
            SpawnScript goal_wait_and_show_key_combo_text params = { Text = <TrickText> }
            Kill prefix = "BobChallenge1_"
            Create name = MovingLoop01
            MakeSkaterGoto Zoo_ProChallengeBob_MoveToRestart
            PlaySkaterCamAnim Skater = 0 name = G_COUNTER_CameraMid
            PauseSkaters
            PauseClock
            begin
              if SkaterCamAnimFinished Skater = 0
                UnPauseClock
                UnPauseSkaters
                break
              endif
              wait 1 gameframe
            repeat
            MakeSkaterGoto Zoo_ProChallengeBob_MoveToRestart
            Create prefix = "BobChallenge2_"
            Kill name = MovingLoop01
          endif
          if ( <trickindex> = 3 )
            GoalManager_ReplaceTrickText name = zoo_goal_counter Text = "Even further now!"
            create_panel_block id = current_goal Text = <TrickText> style = panel_message_goal
            GetKeyComboArrayFromTrickArray tricks = [ Trick_Melon Trick_SambaFlip Trick_SitDownAir ]
             <combo_1> = ( ( goal_tetris_trick_text.( <keycombos> [ 0 ] ) ) )
             <combo_2> = ( ( goal_tetris_trick_text.( <keycombos> [ 1 ] ) ) )
             <combo_3> = ( ( goal_tetris_trick_text.( <keycombos> [ 2 ] ) ) )
            FormatText TextName = tricks "\n\nMethod %a + \b2 \nSamba Flip %b \nSitDown Air %c" a = <combo_1> b = <combo_2> C = <combo_3>
            GoalManager_ReplaceTrickText name = zoo_goal_counter Text = <tricks>
            SpawnScript goal_wait_and_show_key_combo_text params = { Text = <TrickText> }
            Kill prefix = "BobChallenge2_"
            Create name = MovingLoop02
            PlaySkaterCamAnim Skater = 0 name = G_COUNTER_CameraMid
            PauseSkaters
            PauseClock
            begin
              if SkaterCamAnimFinished Skater = 0
                UnPauseClock
                UnPauseSkaters
                break
              endif
              wait 1 gameframe
            repeat
            MakeSkaterGoto Zoo_ProChallengeBob_MoveToRestart
            Create prefix = "BobChallenge3_"
            Kill name = MovingLoop02
          endif
        endif
      endif
    endif
    wait 1 frame
  repeat
endscript
script Zoo_ProChallengeBob_MoveToRestart
  Obj_MoveToNode name = TRG_G_COUNTER_RestartNode orient
  MakeSkaterGoto SkaterInit
endscript
script Zoo_MovingLoop
  Obj_MoveToNode name = <nodename> speed = 5
endscript
script Bob_Challenge_Success
  if GoalManager_IsPro
    if not IsAlive name = TRG_CatchGorillaLoose
      Create name = TRG_CatchGorillaLoose
    endif
    Kill name = TRG_GorillaCaught
  endif
endscript
script Zoo_MG_EggDrop
  if IsCareerMode
    setup_ped_speech {
      ped_id = TRG_MG_Kaboom
      display_name = "Birdman"
      speed = 200
      activation_script = Zoo_Birdman_Talk
      outer_radius = 10
      inner_radius = 5
      Text = [
        "Birdman:\n"
        "Wanna help me collect eggs?\n"
        "Press \b3 to Accept\nPress \m1 to Decline"
      ]
      pad_choose_script = Zoo_MG_EggdropClose
      pad_back_script = Zoo_MG_EggdropDecline
    }
  endif
endscript
script Zoo_Birdman_Talk
endscript
script Zoo_AddMinigame_Eggdrop
  AddMinigame_Generic {
    career_only
    activate_script = zoo_eggdrop_activate
    deactivate_script = zoo_eggdrop_deactivate
  }
endscript
script Zoo_MG_EggdropClose
  speech_box_exit
  if GoalManager_HasActiveGoals
    GoalManager_DeactivateAllGoals
  endif
  wait 1 frame
  GoalManager_ActivateGoal name = zoo_goal_minigame_generic
endscript
script Zoo_MG_EndGame
  GoalManager_DeActivateGoal name = zoo_goal_minigame_generic
endscript
script Zoo_MG_EggdropDecline
  UnPauseSkaters
  speech_box_exit
  MakeSkaterGoto SkaterInit
endscript
script zoo_eggdrop_activate
  MakeSkaterGoto Kaboom_OnGround
endscript
script zoo_eggdrop_deactivate
  UnPauseSkaters
  speech_box_exit
  MakeSkaterGoto SkaterInit
  wait 3 frame
  PlaySkaterCamAnim Skater = 0 stop
  Skater:SetRollingFriction 1
  Skater:Enableplayerinput
endscript
KABOOM_SUCCESS = 13
KABOOM_GOT_EGG = 14
script Zoo_MG_Kaboom
  if IsCareerMode
    Obj_SetException ex = SkaterInRadius scr = Zoo_MG_KaboomClose
    Obj_SetInnerRadius 10
    Obj_SetOuterRadius 0
  endif
endscript
script Zoo_MG_KaboomClose
  Obj_SetException ex = SkaterOutOfRadius scr = Zoo_MG_Kaboom
  Obj_SetOuterRadius 10
  Obj_SetInnerRadius 0
  begin
    if SkaterSpeedLessThan 1
      MakeSkaterGoto Kaboom_OnGround
      break
    endif
    wait 1 frame
  repeat
endscript
script Kaboom_OnGround_Pad_Choose
  speech_box_exit
  printf "X Pressed"
  if not IsAlive name = TRG_Kaboom_EggCreator
    Create name = TRG_Kaboom_EggCreator
  endif
endscript
script Kaboom_OnGround
  UnPauseSkaters
  Create prefix = "TRG_EggLayer"
  Kill prefix = "TRG_Bird"
  PlaySkaterCamAnim name = CAM_MG_Kaboom play_hold allow_pause = 1
  Create_Speech_box { Text = "Catch 10 eggs! \b3 to Start, \m1 to Quit. " style = speech_box_style
    pad_choose_script = Kaboom_OnGround_Pad_Choose
  }
  ClearExceptions
  ClearTrickQueue
  ClearEventBuffer
  SetRollingFriction 1000
  Obj_MoveToNode name = TRG_MG_KaboomNav01 orient
  Disableplayerinput
  wait 30 frames
  UnsetFlag flag = KABOOM_GOT_EGG
   <Boundary> = 0
  begin
    if Held Left
      if ( <Boundary> > 12 )
      else
        PlayAnim anim = Ped_Egg_Run
        Move x = 10
        printf "Left Pressed"
         <Boundary> = ( <Boundary> + 1 )
      endif
    endif
    if Held Right
      if ( <Boundary> < -12 )
      else
        PlayAnim anim = Ped_Egg_Run
        Move x = -10
        printf "Right Pressed"
         <Boundary> = ( <Boundary> - 1 )
      endif
    endif
    if IsXbox
      if Held Circle
        Kill name = TRG_Kaboom_EggCreator
        Kill prefix = "TRG_EggLayer"
        if not IsAlive name = TRG_Bird01
          Create prefix = "TRG_Bird"
        endif
        Kill prefix = "TRG_Egg"
        SpawnScript Zoo_MG_EndGame
      endif
    else
      if IsNGC
        if Held Square
          Kill name = TRG_Kaboom_EggCreator
          Kill prefix = "TRG_EggLayer"
          if not IsAlive name = TRG_Bird01
            Create prefix = "TRG_Bird"
          endif
          Kill prefix = "TRG_Egg"
          SpawnScript Zoo_MG_EndGame
        endif
      else
        if Held Triangle
          Kill name = TRG_Kaboom_EggCreator
          Kill prefix = "TRG_EggLayer"
          if not IsAlive name = TRG_Bird01
            Create prefix = "TRG_Bird"
          endif
          Kill prefix = "TRG_Egg"
          SpawnScript Zoo_MG_EndGame
          break
        endif
      endif
    endif
    if GetFlag flag = KABOOM_SUCCESS
      Kill name = TRG_Kaboom_EggCreator
      Kill prefix = "TRG_EggLayer"
      Create prefix = "TRG_Bird"
      UnsetFlag flag = KABOOM_SUCCESS
      Playsound GoalDone
      Kill prefix = "TRG_Egg"
      printf "Success!"
      GoalManager_AwardMinigameCash name = zoo_goal_minigame_generic 500
      SpawnScript Zoo_MG_EndGame
      break
    endif
    if GetFlag flag = KABOOM_GOT_EGG
      UnsetFlag flag = KABOOM_GOT_EGG
      PlayAnim anim = Ped_CatchEgg
    endif
    wait 1 frame
    if AnimFinished
      PlayAnim anim = Ped_Egg_Idle cycle
    endif
  repeat
endscript
script Kaboom_Make_Eggs
  Obj_VarSet var = 0 value = 0
  begin
    if not IsAlive name = TRG_Egg01
      if not IsAlive name = TRG_Egg02
        if not IsAlive name = TRG_Egg03
          Create name = random( @TRG_Egg01 @TRG_Egg02 @TRG_Egg03 ) 
        endif
      endif
    endif
    if Obj_VarEq var = 0 value = 0
      wait 90 frames
    endif
    if Obj_VarEq var = 0 value = 1
      wait 75 frames
    endif
    if Obj_VarEq var = 0 value = 2
      wait 55 frames
    endif
    if Obj_VarEq var = 0 value = 3
      wait 40 frames
    endif
    if Obj_VarGE var = 0 value = 4
      wait 30 frames
    endif
    if not IsAlive name = TRG_Egg04
      if not IsAlive name = TRG_Egg05
        if not IsAlive name = TRG_Egg06
          Create name = random( @TRG_Egg04 @TRG_Egg05 @TRG_Egg06 ) 
        endif
      endif
    endif
    if Obj_VarEq var = 0 value = 0
      wait 90 frames
    endif
    if Obj_VarEq var = 0 value = 1
      wait 75 frames
    endif
    if Obj_VarEq var = 0 value = 2
      wait 55 frames
    endif
    if Obj_VarEq var = 0 value = 3
      wait 40 frames
    endif
    if Obj_VarGE var = 0 value = 4
      wait 30 frames
    endif
    if Obj_VarEq var = 0 value = 4
      wait 30 frames
      SetFlag flag = KABOOM_SUCCESS
      printf "You got 10 eggs fucker"
    endif
    Obj_VarInc var = 0
  repeat
endscript
script Kaboom_Egg
  ClearExceptions
  Obj_SetInnerRadius 7
  Obj_SetException ex = SkaterInRadius scr = Kaboom_Egg_Caught
  Obj_MoveToRelPos (0, -350, 0) speed = 32
  Obj_WaitMove
  PlayStream monkeypoo_splat1
  MakeSkaterGoto Kaboom_Egg_Dropped
  Die
endscript
script Kaboom_Egg_Dropped
  Kill name = TRG_Kaboom_EggCreator
  Kill name = TRG_MG_Kaboom
  Kill prefix = "TRG_EggLayer"
  if not IsAlive name = TRG_Bird01
    Create prefix = "TRG_Bird"
  endif
  printf "Kill the eggs bitches!"
  create_panel_message id = goal_message Text = "You Dropped an Egg!" style = panel_message_generic_loss
  wait 5 frames
  if not IsAlive name = TRG_MG_Kaboom
    Create name = TRG_MG_Kaboom
  endif
  SpawnScript Zoo_MG_EndGame
endscript
script Kaboom_Egg_Caught
  Obj_Playsound GapSound
  SetFlag flag = KABOOM_GOT_EGG
  Die
endscript
script Zoo_MG_RhinoBet
  Obj_PlayAnim anim = Ped_M_Idle1 cycle
  if IsCareerMode
    setup_ped_speech {
      ped_id = TRG_Rhino_Keeper
      display_name = "Rhino Keeper"
      speed = 200
      inner_radius = 20
      outer_radius = 80
      outer_radius_script = Zoo_Reset_Rhinos
      Text = [
        "Rhino Keeper:\n"
        "Care to wager on these rhinos charging?\n"
        "Press \b3 to Accept\nPress \m1 to Decline"
      ]
      pad_choose_script = Zoo_MG_RhinoBetClose
      pad_back_script = Zoo_MG_RhinoBetDecline
    }
  endif
endscript
script Zoo_AddMinigame_RhinoBet
  AddMinigame_Generic2 {
    career_only
    activate_script = zoo_rhinobet_activate
    deactivate_script = zoo_rhinobet_deactivate
  }
endscript
script Zoo_MG_RhinoBetClose
  speech_box_exit
  if GoalManager_HasActiveGoals
    GoalManager_DeactivateAllGoals
  endif
  wait 1 frame
  GoalManager_ActivateGoal name = zoo_goal_minigame_generic2
endscript
script Zoo_MG2_EndGame
  GoalManager_DeActivateGoal name = zoo_goal_minigame_generic2
endscript
script Zoo_MG_RhinoBetDecline
  UnPauseSkaters
  speech_box_exit
  UnPauseSkaters
endscript
script zoo_rhinobet_activate
  Zoo_MG_RhinoBet_Start
endscript
script zoo_rhinobet_deactivate
  UnPauseSkaters
  speech_box_exit
  MakeSkaterGoto SkaterInit
  wait 3 frame
  PlaySkaterCamAnim Skater = 0 stop
  Skater:SetRollingFriction 1
  Skater:Enableplayerinput
endscript
script Zoo_Rhino_Keeper_New
  Obj_PlayAnim anim = Ped_M_Idle1 cycle
  setup_ped_speech {
    ped_id = TRG_Rhino_Keeper
    speed = 2
    outer_radius = 80
    activation_script = Zoo_Bet_Start
    outer_radius_script = Zoo_Reset_Rhinos
    display_name = "Rhino Trainer"
    pad_choose_script = Zoo_Bet_X
    pad_left_script = Zoo_Bet_Left
    pad_up_script = Zoo_Bet_Both
    pad_right_script = Zoo_Bet_Right
    Text = [ "Rhino Trainer:\n Wanna bet which rhino gets knocked out? "
      "Press \b6  for Left, \b5 for Right, \b7 for both,  or "
      "\b3 to continue without betting."
    ]
  }
endscript
script Zoo_MG_RhinoBet_Start
  SpawnScript Zoo_Bet_Start
  Create_Speech_box {
    pad_left_script = Zoo_Bet_Left
    pad_up_script = Zoo_Bet_Both
    pad_right_script = Zoo_Bet_Right
    pad_choose_script = Zoo_Bet_X
    pad_back_script = Zoo_Bet_X
    Text = [ "Rhino Trainer:\n Wanna bet which rhino gets knocked out? "
      "Press \b6  for Left, \b5 for Right, \b7 for both,  or "
      "\m1 to continue without betting."
    ]
  }
endscript
script Zoo_Reset_Rhinos
  if IsAlive name = TRG_RhinoStanding01
  else
    Create name = TRG_RhinoStanding01
    Create name = RhinoStartCollision01
  endif
  if IsAlive name = TRG_RhinoStanding02
  else
    Create name = TRG_RhinoStanding02
    Create name = RhinoStartCollision02
  endif
  Kill prefix = "TRG_RhinoDown"
  Kill prefix = "RhinoDown"
  Kill prefix = "TRG_RhinoStopCollision"
  Kill prefix = "TRG_RhinoCharging"
endscript
script Zoo_Bet_Start
  PlayStream rhinobet
  PlaySkaterCamAnim Skater = 0 name = CAM_RHINO play_hold
endscript
script Zoo_Bet_Left
  Kill prefix = "TRG_RhinoStanding"
  Create prefix = "TRG_RhinoCharging"
  Kill prefix = "RhinoStartCollision"
  speech_box_exit
  wait 5 seconds
  MakeSkaterGoto SkaterInit
  if IsAlive name = TRG_RhinoDown01
    if IsAlive name = TRG_RhinoDown02
      create_panel_block id = Rhino_Bet Text = "You Lose!" style = panel_message_goal time = 1500
      PlayStream random( @rhinobet_lose01 @rhinobet_lose02 ) 
    else
      create_panel_block id = Rhino_Bet Text = "You Win!" style = panel_message_goal time = 1500
      PlayStream random( @rhinobet_win01 @rhinobet_win02 @rhinobet_win03 ) 
      GoalManager_AwardMinigameCash name = zoo_goal_minigame_generic2 100
    endif
  else
    create_panel_block id = Rhino_Bet Text = "You Lose!" style = panel_message_goal time = 1500
    PlayStream random( @rhinobet_lose01 @rhinobet_lose02 ) 
  endif
  PlaySkaterCamAnim Skater = 0 stop
  UnPauseSkaters
  wait 1.5 seconds
  if ObjectExists id = Rhino_Bet
    RunScriptOnScreenElement id = Rhino_Bet kill_panel_message
  endif
  SpawnScript Zoo_MG2_EndGame
endscript
script Zoo_Bet_Both
  Kill prefix = "TRG_RhinoStanding"
  Create prefix = "TRG_RhinoCharging"
  Kill prefix = "RhinoStartCollision"
  speech_box_exit
  wait 5 seconds
  MakeSkaterGoto SkaterInit
  if IsAlive name = TRG_RhinoDown01
    if IsAlive name = TRG_RhinoDown02
      create_panel_block id = Rhino_Bet Text = "You Win!" style = panel_message_goal
      PlayStream random( @rhinobet_win01 @rhinobet_win02 @rhinobet_win03 ) 
      GoalManager_AwardMinigameCash name = zoo_goal_minigame_generic2 100
    else
      create_panel_block id = Rhino_Bet Text = "You Lose!" style = panel_message_goal
      PlayStream random( @rhinobet_lose01 @rhinobet_lose02 ) 
    endif
  else
    create_panel_block id = Rhino_Bet Text = "You Lose!" style = panel_message_goal
    PlayStream random( @rhinobet_lose01 @rhinobet_lose02 ) 
  endif
  PlaySkaterCamAnim Skater = 0 stop
  UnPauseSkaters
  wait 1.5 seconds
  if ObjectExists id = Rhino_Bet
    RunScriptOnScreenElement id = Rhino_Bet kill_panel_message
  endif
  SpawnScript Zoo_MG2_EndGame
endscript
script Zoo_Bet_Right
  Kill prefix = "TRG_RhinoStanding"
  Create prefix = "TRG_RhinoCharging"
  Kill prefix = "RhinoStartCollision"
  speech_box_exit
  wait 5 seconds
  MakeSkaterGoto SkaterInit
  if IsAlive name = TRG_RhinoDown02
    if IsAlive name = TRG_RhinoDown01
      create_panel_block id = Rhino_Bet Text = "You Lose!" style = panel_message_goal
      PlayStream random( @rhinobet_lose01 @rhinobet_lose02 ) 
    else
      create_panel_block id = Rhino_Bet Text = "You Win!" style = panel_message_goal
      PlayStream random( @rhinobet_win01 @rhinobet_win02 @rhinobet_win03 ) 
      GoalManager_AwardMinigameCash name = zoo_goal_minigame_generic2 100
    endif
  else
    create_panel_block id = Rhino_Bet Text = "You Lose!" style = panel_message_goal
    PlayStream random( @rhinobet_lose01 @rhinobet_lose02 ) 
  endif
  PlaySkaterCamAnim Skater = 0 stop
  UnPauseSkaters
  wait 1.5 seconds
  if ObjectExists id = Rhino_Bet
    RunScriptOnScreenElement id = Rhino_Bet kill_panel_message
  endif
  SpawnScript Zoo_MG2_EndGame
endscript
script Zoo_Bet_X
  Kill prefix = "TRG_RhinoStanding"
  Create prefix = "TRG_RhinoCharging"
  Kill prefix = "RhinoStartCollision"
  speech_box_exit
  wait 2 seconds
  UnPauseSkaters
  MakeSkaterGoto SkaterInit
  PlaySkaterCamAnim Skater = 0 stop
  SpawnScript Zoo_MG2_EndGame
endscript
script Zoo_MG_MonkeyPoo
  if IsCareerMode
    setup_ped_speech {
      ped_id = TRG_MG_Poopie
      display_name = "Monkeyman"
      speed = 200
      inner_radius = 5
      Text = [
        "Monkeyman:\n"
        "Wanna play dodgeball with monkey feces?\n"
        "Press \b3 to Accept\nPress \m1 to Decline"
      ]
      pad_choose_script = Zoo_MG_MonkeyPooClose
      pad_back_script = Zoo_MG_MonkeyPooDecline
    }
  endif
endscript
script Zoo_AddMinigame_MonkeyPoo
  AddMinigame_Generic3 {
    career_only
    activate_script = zoo_MonkeyPoo_activate
    deactivate_script = zoo_MonkeyPoo_deactivate
  }
endscript
script Zoo_MG_MonkeyPooClose
  speech_box_exit
  if GoalManager_HasActiveGoals
    GoalManager_DeactivateAllGoals
  endif
  wait 1 frame
  GoalManager_ActivateGoal name = zoo_goal_minigame_generic3
endscript
script Zoo_MG_EndGame_Poo
  GoalManager_DeActivateGoal name = zoo_goal_minigame_generic3
endscript
script Zoo_MG_MonkeyPooDecline
  UnPauseSkaters
  speech_box_exit
  MakeSkaterGoto SkaterInit
endscript
script zoo_MonkeyPoo_activate
  MakeSkaterGoto Zoo_Invaders_OnGround
endscript
script zoo_MonkeyPoo_deactivate
  UnPauseSkaters
  speech_box_exit
  MakeSkaterGoto SkaterInit
  wait 3 frame
  PlaySkaterCamAnim Skater = 0 stop
  Skater:SetRollingFriction 1
  Skater:Enableplayerinput
endscript
script Zoo_MG_Invaders
  if IsCareerMode
    Kill name = Zoo_Poo_Wall
    Playsound LA_GratesOpen
    GoalManager_DeactivateAllGoals
    MakeSkaterGoto Zoo_Invaders_OnGround
  endif
endscript
script MonkeyPoo_OnGround_Pad_Choose
  speech_box_exit
  printf "X Pressed"
  if IsAlive name = TRG_Poop_Controller
  else
    Create name = TRG_Poop_Controller
    Create prefix = "TRG_Invader_"
  endif
endscript
script Zoo_Invaders_OnGround
  UnPauseSkaters
  PlaySkaterCamAnim name = CAM_MG_Invaders play_hold allow_pause = 1
  Create_Speech_box { Text = "Dodge poo for 30 seconds! \n\b6 and \b5 to Dodge \n\b3 to Start, \m1 to Quit. " style = speech_box_style
    pad_choose_script = MonkeyPoo_OnGround_Pad_Choose
  }
  ClearExceptions
  ClearTrickQueue
  ClearEventBuffer
  SetRollingFriction 1000
  Kill name = Zoo_Poo_Wall
  Obj_MoveToNode name = TRG_MG_InvadersNav01 orient
  Disableplayerinput
  wait 30 frames
   <Boundary> = 0
  begin
    if Held Up
      printf "Up Pressed"
    endif
    if Held Down
      printf "Down Pressed"
    endif
    if Held Left
      if ( <Boundary> > 13 )
      else
        PlayAnim anim = Ped_Egg_Run
        Move x = 10
        printf "Left Pressed"
         <Boundary> = ( <Boundary> + 1 )
      endif
    endif
    if Held Right
      if ( <Boundary> < -13 )
      else
        PlayAnim anim = Ped_Egg_Run
        Move x = -10
        printf "Right Pressed"
         <Boundary> = ( <Boundary> - 1 )
      endif
    endif
    if IsXbox
      if Held Circle
        Kill prefix = "TRG_Invader_"
        Kill name = TRG_Poop_Controller
        Create name = Zoo_Poo_Wall
        Playsound LA_GratesOpen
        SpawnScript Zoo_MG_EndGame_Poo
        break
      endif
    else
      if IsNGC
        if Held Square
          Kill prefix = "TRG_Invader_"
          Kill name = TRG_Poop_Controller
          Create name = Zoo_Poo_Wall
          Playsound LA_GratesOpen
          SpawnScript Zoo_MG_EndGame_Poo
          break
        endif
      else
        if Held Triangle
          Kill prefix = "TRG_Invader_"
          Kill name = TRG_Poop_Controller
          Create name = Zoo_Poo_Wall
          Playsound LA_GratesOpen
          SpawnScript Zoo_MG_EndGame_Poo
          break
        endif
      endif
    endif
    wait 1 frame
    if AnimFinished
      PlayAnim anim = Ped_Egg_Idle cycle
    endif
  repeat
endscript
script Zoo_Monkey_Invader
  Obj_PlayAnim anim = Fling cycle
  begin
    Obj_MoveToRelPos (-200, 0, 0) time = 1
    Obj_WaitMove
    Obj_MoveToRelPos (0, 0, 35) time = 1
    Obj_WaitMove
    Obj_MoveToRelPos (200, 0, 0) time = 1
    Obj_WaitMove
    Obj_MoveToRelPos (0, 0, 35) time = 1
    Obj_WaitMove
  repeat 4
  Die
endscript
script Zoo_Poop_Controller
  begin
    wait 1 second
    if GoalManager_HasActiveGoals
      Kill prefix = "TRG_Invader_"
      Create name = Zoo_Poo_Wall
      Die
    endif
  repeat 30
  MakeSkaterGoto Zoo_Poopie_Success
  Die
endscript
script Zoo_Poopie
  ClearExceptions
  Obj_SetException ex = SkaterInRadius scr = Zoo_Poopie_Close
  Obj_SetInnerRadius 4
  Obj_MoveToNode name = random( @TRG_PoopieNav01 @TRG_PoopieNav02 @TRG_PoopieNav03 @TRG_PoopieNav04 @TRG_PoopieNav05 @TRG_PoopieNav06 @TRG_PoopieNav07  ) speed = 45
  Obj_WaitMove
  Die
endscript
script Zoo_Poopie_Close
  Obj_Playsound GapSound
  printf "Huh"
  MakeSkaterGoto Zoo_Poopie_Hit
  Die
endscript
script Zoo_Poopie_Hit
  printf "Die Fucker"
  Create name = Zoo_Poo_Wall
  Playsound LA_GratesOpen
  Kill name = TRG_Poop_Controller
  Kill prefix = "TRG_Invader"
  create_panel_message id = goal_message Text = "You Got Poop On You!" style = panel_message_generic_loss
  PlaySkaterCamAnim Skater = 0 stop
  SpawnScript Zoo_MG_EndGame_Poo
endscript
script Zoo_Poopie_Success
  Kill prefix = "TRG_Poopie"
  Kill prefix = "TRG_Invader"
  Create name = Zoo_Poo_Wall
  Playsound LA_GratesOpen
  Playsound GoalDone
  GoalManager_AwardMinigameCash name = zoo_goal_minigame_generic3 500
  SpawnScript Zoo_MG_EndGame_Poo
endscript
