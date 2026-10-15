
script Kon_Setup
endscript
script Kon_Startup
  LoadSound "Shared\Animal\Pigeon" Vol = 100 Dropoff = 150
  LoadSound "Lon\PigeonFly" Vol = 100 Dropoff = 150
  LoadSound "Shared\Misc\AirConditionerHum" Vol = 100 Dropoff = 200 PosUpdateWithDoppler
  LoadSound "Shared\Hits\HitOrangeCone" Vol = 100 Dropoff = 150
endscript
script Kon_Goals
  if InMultiplayerGame
    Add_MultiPlayer_Mode_Goals
  endif
  if not InSplitScreenGame
    if not GameModeEquals is_singlesession
    endif
    if not InSplitScreenGame
      if not GameModeEquals is_singlesession
        Kon_AddGoal_HighScore
        Kon_AddGoal_Skate
        Kon_AddGoal_Combo
        Kon_AddGoal_Competition
        Kon_AddGoal_Collect
        Kon_AddGoal_Tetris2
        Kon_AddGoal_Race
        Kon_AddGoal_Gaps4
        Kon_AddGoal_Special
        Kon_AddGoal_Horse
        Kon_AddGoal_ProScore
        Kon_AddGoal_Counter2
        Kon_AddGoal_Competition2
        Kon_AddGoal_Gaps2
        Kon_AddGoal_Gaps3
        Kon_AddGoal_HighCombo
        Kon_AddGoal_SickScore
        Kon_AddGoal_ProCombo
        Kon_AddGoal_Tour
        Kon_AddGoal_Tetris
        Kon_AddGoal_Gaps
        Kon_AddGoal_Gaps5
        Kon_AddGoal_Counter
      endif
    endif
  endif
endscript
script Kon_AddGoal_HighScore
  AddGoal_HighScore {
    Goal_Text = Kon_HighScore_Text
    View_Goals_Text = "Get a High Score"
    Score = Kon_HighScore_Score
    Pro = "Bucky"
    Alternate_Pro = "Jamie"
    Reward_Goal = Kon_Goal_ProScore
    record_type = Score
    Goal_Description = Kon_HighScore_Desc
    View_Goals_Text = Kon_HighScore_Text }
endscript
script Kon_AddGoal_ProScore
  AddGoal_ProScore {
    Unlocked_By_Another
    Goal_Text = Kon_ProScore_Text
    View_Goals_Text = "Get a Pro Score"
    Score = Kon_ProScore_Score
    Pro = "Bucky"
    Alternate_Pro = "Jamie"
    record_type = Score
    Goal_Description = Kon_ProScore_Desc
    View_Goals_Text = Kon_ProScore_Text }
endscript
script Kon_AddGoal_SickScore
  AddGoal_SickScore {
    Pro_Goal
    Goal_Text = Kon_SickScore_Text
    View_Goals_Text = "Get a Sick Score"
    Score = Kon_SickScore_Score
    Pro = "Bucky"
    Alternate_Pro = "Jamie"
    record_type = Score
    Goal_Description = Kon_SickScore_Desc
    View_Goals_Text = Kon_SickScore_Text }
endscript
script Kon_AddGoal_Combo
  AddGoal_Combo {
    Goal_Text = "Collect the C-O-M-B-O letters"
    View_Goals_Text = "Collect the C-O-M-B-O letters"
    Pro = "local"
    record_type = Score
    Goal_Description = Kon_Combo_Desc }
endscript
script Kon_AddGoal_ProCombo
  AddGoal_ProCombo {
    Pro_Goal
    Goal_Text = "Collect Pro C-O-M-B-O"
    View_Goals_Text = "Collect Pro C-O-M-B-O"
    Pro = "local"
    Full_Name = "Local Skater"
    record_type = Score
    Goal_Description = Kon_ProCombo_Desc }
endscript
script Kon_AddGoal_Skate
  AddGoal_Skate {
    Goal_Text = "Collect the S-K-A-T-E letters"
    View_Goals_Text = "Collect the S-K-A-T-E letters"
    Pro = "local2"
    Full_Name = "Local Skater"
    record_type = time
    Goal_Description = Kon_Skate_Desc
    Reward_Goal = Kon_Goal_Gaps2 }
endscript
script Kon_AddGoal_Competition
  AddGoal_Competition {
    CAREER_ONLY
    Goal_Text = "3rd or better in the Street Comp."
    View_Goals_Text = "Place 3rd or better - Street Competition"
    Geo_Prefix = "G_COMP_GEO"
    Pro = "Steve"
    Full_Name = "Steve Caballero"
    Goal_Description = Kon_Competition_Desc
    Gold = 95
    Silver = 87
    Bronze = 80
    time = 60
    Gold_Score = Kon_Comp_Gold
    Silver_Score = Kon_Comp_Silver
    Bronze_Score = Kon_Comp_Bronze
    Bail = 8
    record_type = Score
    Reward_Goal = Kon_Goal_Comp2 }
endscript
script Kon_AddGoal_Competition2
  AddGoal_Competition2 {
    CAREER_ONLY
    Unlocked_By_Another
    Goal_Text = "3rd or better in the Vert Comp."
    View_Goals_Text = "Place 3rd or better - Vert Competition"
    Geo_Prefix = "G_COMP2_GEO"
    Pro = "Steve"
    Goal_Intro_Script = Kon_Comp2_Setup
    Goal_Deactivate_Script = Kon_Comp2_Breakdown
    Goal_Description = Kon_Competition2_Desc
    Gold = 97
    Silver = 89
    Bronze = 84
    time = 60
    Gold_Score = Kon_Comp2_Gold
    Silver_Score = Kon_Comp2_Silver
    Bronze_Score = Kon_Comp2_Bronze
    Bail = 8
    record_type = Score }
endscript
script Kon_Comp2_Setup
  Create Prefix = "TRG_G_COMP2_Ped"
endscript
script Kon_Comp2_Breakdown
  Kill Prefix = "TRG_G_COMP2_Ped"
endscript
script Kon_AddGoal_Collect
  AddGoal_Collect {
    Goal_Text = "Find the Missing Rental Gear"
    View_Goals_Text = "Find the 4 Missing Rental Gear Items"
    Pro = "MomRamos"
    Full_Name = "Mrs. Ramos"
    Trigger_Prefix = "TRG_G_COLLECT_Pads"
    Goal_Flags = [
      Got_Pads_Knees
      Got_Pads_Helmet
      Got_Pads_Helmet_2
      Got_Pads_Elbows
    ]
    Collect_Type = "Rental Pads"
    Num_Flags = 3
    Use_Hud_Counter
    Hud_Counter_Caption = "Rental Pads"
    record_type = time
    Goal_Description = Kon_Collect_Desc
    Reward_Goal = Kon_Goal_Counter2 }
endscript
script Kon_AddGoal_Tetris
  AddGoal_Tetris {
    Pro_Goal
    Goal_Text = "Hit the tricks they yell out."
    View_Goals_Text = "Show off for the locals at the tombstone"
    Trick_Flag = 0
    Intro_Node = TRG_G_TETRIS_Intro_Node
    Goal_Intro_Script = Kon_Tetris_Setup
    Goal_Deactivate_Script = Kon_Tetris_Deactivate
    Start_Cam_Anim = G_TETRIS_CameraStart
    Pro = "Employee"
    Full_Name = "Kona Worker"
    Goal_Description = Kon_Tetris_Desc
    Goal_Tetris_Key_Combos = [
      Lip_TriangleL
      Lip_TriangleR
      Lip_TriangleU
      Lip_TriangleD
      Lip_TriangleUL
      Lip_TriangleUR
      Lip_TriangleDL
      Lip_TriangleDR
    ]
    time = 60
    Acceleration_Interval = 6
    Acceleration_Percent = 0.01
    Time_To_Stop_Adding_Tricks = 15
    Kill_Radius = 140
    record_type = none }
endscript
script Kon_StartGap_Tombstone
  StartGap GapID = Tombstone01
  Printf "CR---CR---CR---FIRED START GAP FOR BIG GRAY!"
endscript
script Kon_EndGap_Tombstone
  if TriggerType [ TRIGGER_LIP_ON ]
    EndGap GapID = Tombstone01 Text = "Tombstone Extension" Score = 25
    if GoalManager_GoalIsActive Name = Kon_Goal_Tetris
      GoalManager_EditGoal Name = Kon_Goal_Tetris Params = { Trick_Flag = 1 }
    endif
  endif
endscript
script Kon_Tetris_Setup
  Create Prefix = "TRG_G_Tetris_Spectator"
endscript
script Kon_Tetris_Deactivate
  Kill Prefix = "TRG_G_Tetris_Spectator"
endscript
script Kon_AddGoal_HighCombo
  AddGoal_HighCombo {
    Unlocked_By_Another
    Goal_Text = "50,000 Point Combo. Don't hit the bottles!"
    View_Goals_Text = "50k combo the bowl - No hitting bottles"
    Pro = "Martin"
    Full_Name = "Martin Ramos"
    Score = 50000
    Goal_Intro_Script = Kon_HighCombo_Setup
    Goal_Deactivate_Script = Kon_HighCombo_Breakdown
    record_type = time
    Goal_Description = Kon_HighCombo_Desc }
endscript
script Kon_HighCombo_Setup
  Create Prefix = "HighCombo_Geo"
endscript
script Kon_HighCombo_Breakdown
  Kill Prefix = "HighCombo_Geo"
endscript
script Kon_LoseHighCombo_Leave
  if GoalManager_GoalIsActive Name = Kon_Goal_HighCombo
    Create_Panel_Message ID = Goal_Message Text = "You left the bowl!" Style = Panel_Message_Generic_Loss
    GoalManager_LoseGoal Name = Kon_Goal_HighCombo
  endif
endscript
script Kon_LoseHighCombo_Bottles
  if GoalManager_GoalIsActive Name = Kon_Goal_HighCombo
    Create_Panel_Message ID = Goal_Message Text = "You hit the bottles!" Style = Panel_Message_Generic_Loss
    GoalManager_LoseGoal Name = Kon_Goal_HighCombo
  endif
endscript
script Kon_AddGoal_Special
  AddGoal_Special {
    CAREER_ONLY
    time = 60
    Special_Gap
    Goal_Text = "Get Special and\nMisty Flip (\k1) over the Big Hut Gap"
    View_Goals_Text = "Misty Flip over the Big Hut Gap"
    Pro = "Rick"
    Full_Name = "Rick Thorne"
    Goal_Success_Script = Kon_Special_Success
    Goal_Intro_Script = Kon_Goal_Special_Intro
    Goal_Deactivate_Script = Kon_Special_Deactivate
    Trick_Name = Trick_MistyFlip
    Trick_Type = Air
    record_type = none
    Goal_Description = Kon_Special_Desc }
endscript
script Kon_Special_Bike
  if IsAlive Name = TRG_G_Special_Pro
    Obj_ShadowOff
    Obj_LockToObject ObjectName = TRG_G_Special_Pro (0, 0, 0)
  else
    Die
  endif
endscript
script Kon_Special_Success
  Kill Name = TRG_G_Special_Bike
endscript
script Kon_Goal_Special_Intro
  Kill Prefix = "TRG_G_Special_B"
  Create Prefix = "TRG_G_Special_B"
endscript
script Kon_Special_Deactivate
  if GoalManager_HasWonGoal Name = Kon_Goal_Special
    Kill Prefix = "TRG_G_Special_B"
  else
  endif
endscript
script Kon_AddGoal_Horse
  AddGoal_Horse {
    Goal_Text = "Impress the bums!"
    Current_Goal_Text = "Impress the bums!"
    View_Goals_Text = "Impress Ollie and the bums with combos"
    Goal_Deactivate_Script = Kon_Goal_Horse_Deactivate
    Start_Cam_Anim = G_Horse_CameraStart
    Intro_Node = TRG_G_HORSE_Intro_Node
    Pro = "Ollie"
    Full_Name = "Ollie the Magic Bum"
    Goal_Flags = [
      Impress_Bum_1
      Impress_Bum_2
      Impress_Bum_3
    ]
    Horse_Spots = [
      { ID = TRG_G_HORSE_Spot01 Scr = Kon_Horse_Spot01 Flag = Impress_Bum_1 Score = Kon_Horse_Score_1 time = 30 }
      { ID = TRG_G_HORSE_Spot02 Scr = Kon_Horse_Spot02 Flag = Impress_Bum_2 Score = Kon_Horse_Score_2 time = 30 }
      { ID = TRG_G_HORSE_Spot03 Scr = Kon_Horse_Spot03 Flag = Impress_Bum_3 Score = Kon_Horse_Score_3 time = 30 }
    ]
    Goal_Description = Kon_Horse_Desc
    record_type = Score }
endscript
script Kon_Horse_Spot01
  Create_Panel_Block ID = Current_Horse_Spot Text = Kon_Horse_Text_1 Style = Panel_Message_New_Horse_Spot
endscript
script Kon_Horse_Spot02
  Create_Panel_Block ID = Current_Horse_Spot Text = Kon_Horse_Text_2 Style = Panel_Message_New_Horse_Spot
endscript
script Kon_Horse_Spot03
  Create_Panel_Block ID = Current_Horse_Spot Text = Kon_Horse_Text_3 Style = Panel_Message_New_Horse_Spot
endscript
script Kon_Goal_Horse_Deactivate
  Create_Panel_Block ID = Current_Goal_Text Text = " " Style = Panel_Message_New_Horse_Spot
endscript
script Kon_AddGoal_Counter2
  AddGoal_Counter2 {
    Unlocked_By_Another
    time = 30
    Goal_Text = "Collect all 15 waivers!"
    View_Goals_Text = "Collect the Skate Camp waivers"
    Pro = "MomRamos"
    Full_Name = "Mrs. Ramos"
    Number = 15
    Use_Hud_Counter
    Hud_Counter_Caption = "Skate Waivers"
    Geo_Prefix = "G_COUNTER2_Waiver"
    Goal_Description = Kon_Counter2_Desc
    record_type = time }
endscript
script Kon_AddGoal_Tetris2
  AddGoal_Tetris2 {
    time = 60
    Goal_Text = "Hit the tricks they call out."
    View_Goals_Text = "Show off for the locals at the mini spine"
    Trick_Flag = 0
    Geo_Prefix = "TRGP_Gap_Mini_Spine"
    Pro = "Employee"
    Full_Name = "Kona Worker"
    Goal_Description = Kon_Tetris2_Desc
    Goal_Tetris_Key_Combos = [
      Air_CircleU
      Air_CircleD
      Air_CircleL
      Air_CircleR
      Air_SquareU
      Air_SquareD
      Air_SquareL
      Air_SquareR
    ]
    Acceleration_Interval = 5
    Acceleration_Percent = 0.05
    Time_To_Stop_Adding_Tricks = 10
    Kill_Radius = 140
    Reward_Goal = Kon_Goal_Gaps3
    record_type = none }
endscript
script Kon_StartGap_MiniSpine
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_MiniSpine
  if GoalManager_GoalIsActive Name = Kon_Goal_Tetris2
    EndGap GapID = <ID1> GapScript = Kon_Goal_Tetris2_Got1
  else
    EndGap GapID = <ID1>
  endif
endscript
script Kon_Goal_Tetris2_Got1
  GoalManager_EditGoal Name = Kon_Goal_Tetris2 Params = { Trick_Flag = 1 }
endscript
script Kon_AddGoal_Race
  AddGoal_Race {
    Goal_Text = "Snake Run Slalom!"
    View_Goals_Text = "Snake Run Slalom"
    Pro = "Martin"
    Full_Name = "Martin Ramos"
    Goal_Start_Script = Kon_Goal_Race_Start
    Goal_Deactivate_Script = Kon_Goal_Race_Deactivate
    Goal_Description = Kon_Race_Desc
    Goal_Flags = [
      Gate01
      Gate02
      Gate03
      Gate04
      Gate05
      Gate06
      Gate07
      Gate08
      Gate09
      Gate10
      Gate11
      Gate12
      Gate13
      Gate14
      Gate15
      Gate16
      Gate17
      Gate18
      Gate19
      Gate20
      Gate21
      Gate22
    ]
    Race_Waypoints = [
      { ID = G_RACE_Geo1_CHECKPOINT_01 Scr = Nullscript Flag = Gate01 time = 90 }
      { ID = G_RACE_Geo1_CHECKPOINT_02 Scr = Nullscript Flag = Gate02 time = 0 }
      { ID = G_RACE_Geo1_CHECKPOINT_03 Scr = Nullscript Flag = Gate03 time = 0 }
      { ID = G_RACE_Geo1_CHECKPOINT_04 Scr = Nullscript Flag = Gate04 time = 0 }
      { ID = G_RACE_Geo1_CHECKPOINT_05 Scr = Nullscript Flag = Gate05 time = 0 }
      { ID = G_RACE_Geo2_CHECKPOINT_01 Scr = Nullscript Flag = Gate06 time = 0 }
      { ID = G_RACE_Geo2_CHECKPOINT_02 Scr = Nullscript Flag = Gate07 time = 0 }
      { ID = G_RACE_Geo2_CHECKPOINT_03 Scr = Nullscript Flag = Gate08 time = 0 }
      { ID = G_RACE_Geo2_CHECKPOINT_04 Scr = Nullscript Flag = Gate09 time = 0 }
      { ID = G_RACE_Geo2_CHECKPOINT_05 Scr = Nullscript Flag = Gate10 time = 0 }
      { ID = G_RACE_Geo2_CHECKPOINT_06 Scr = Nullscript Flag = Gate11 time = 0 }
      { ID = G_RACE_Geo2_CHECKPOINT_07 Scr = Nullscript Flag = Gate12 time = 0 }
      { ID = G_RACE_Geo3_CHECKPOINT_01 Scr = Nullscript Flag = Gate13 time = 0 }
      { ID = G_RACE_Geo3_CHECKPOINT_02 Scr = Nullscript Flag = Gate14 time = 0 }
      { ID = G_RACE_Geo3_CHECKPOINT_03 Scr = Nullscript Flag = Gate15 time = 0 }
      { ID = G_RACE_Geo3_CHECKPOINT_04 Scr = Nullscript Flag = Gate16 time = 0 }
      { ID = G_RACE_Geo3_CHECKPOINT_05 Scr = Nullscript Flag = Gate17 time = 0 }
      { ID = G_RACE_Geo3_CHECKPOINT_06 Scr = Nullscript Flag = Gate18 time = 0 }
      { ID = G_RACE_Geo3_CHECKPOINT_07 Scr = Nullscript Flag = Gate19 time = 0 }
      { ID = G_RACE_Geo3_CHECKPOINT_08 Scr = Nullscript Flag = Gate20 time = 0 }
      { ID = G_RACE_Geo3_CHECKPOINT_09 Scr = Nullscript Flag = Gate21 time = 0 }
      { ID = G_RACE_Geo3_CHECKPOINT_10 Scr = Nullscript Flag = Gate22 time = 0 }
    ]
    Reward_Goal = Kon_Goal_HighCombo
    record_type = time }
endscript
FLAG_RACE_LEG_1 = 0
FLAG_RACE_LEG_2 = 1
FLAG_RACE_LEG_3 = 2
script Kon_Goal_Race_Start
  Create_Panel_Message ID = Goal_Message Text = "Here we go! Run #1" Style = Panel_Message_Generic_Loss
  Create Prefix = "G_RACE_GEO1"
  Create Name = TRG_G_Race_BailCheck
  SetFlag Flag = FLAG_RACE_LEG_1
  MakeSkater_StartSlalom
endscript
script Kon_Race_Checkpoint
  if GotParam Race_Prev_Flag
    if GoalManager_GoalFlagSet Name = Kon_Goal_Race Flag = <Race_Prev_Flag>
      GoalManager_SetGoalFlag Name = Kon_Goal_Race <Race_Flag> 1
      GoalManager_NextRaceWaypoint Name = Kon_Goal_Race
      if ( <Race_Flag> = Gate05 )
        Kon_Goal_Race_Leg2
      endif
      if ( <Race_Flag> = Gate12 )
        Kon_Goal_Race_Leg3
      endif
      if ( <Race_Flag> = Gate22 )
        Kon_Goal_Race_Finish
      endif
    else
      Create_Panel_Message ID = Goal_Message Text = "You Missed a Gate!!!" Style = Panel_Message_Generic_Loss
      if GetFlag Flag = FLAG_RACE_LEG_1
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate01 0
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate02 0
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate03 0
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate04 0
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate05 0
      else
        if GetFlag Flag = FLAG_RACE_LEG_2
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate06 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate07 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate08 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate09 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate10 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate11 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate12 0
        else
          if GetFlag Flag = FLAG_RACE_LEG_3
            GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate13 0
            GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate14 0
            GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate15 0
            GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate16 0
            GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate17 0
            GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate18 0
            GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate19 0
            GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate20 0
            GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate21 0
            GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate22 0
          endif
        endif
      endif
      SpawnScript Kon_Race_MissedGate_Restart ID = Race_MissedGate
    endif
  else
    GoalManager_SetGoalFlag Name = Kon_Goal_Race <Race_Flag> 1
    GoalManager_NextRaceWaypoint Name = Kon_Goal_Race
  endif
endscript
script Kon_Goal_Race_Leg2
  MakeSkaterGoto SlalomBrake
  SpawnScript Kon_Race_Leg2_LastGate ID = LastGate
endscript
script Kon_Race_Leg2_LastGate
  Wait 1 Second
  Create_Panel_Message ID = Goal_Message Text = "Here we go! Run #2" Style = Panel_Message_Generic_Loss
  Kill Prefix = "G_RACE_GEO1"
  Create Prefix = "G_RACE_GEO2"
  UnSetFlag Flag = FLAG_RACE_LEG_1
  SetFlag Flag = FLAG_RACE_LEG_2
  Skater:Obj_MoveToNode Name = TRG_G_Race_RestartNode orient
  MakeSkater_StartSlalom
endscript
script Kon_Goal_Race_Leg3
  MakeSkaterGoto SlalomBrake
  SpawnScript Kon_Race_Leg3_LastGate ID = LastGate
endscript
script Kon_Race_Leg3_LastGate
  Wait 1 Second
  Create_Panel_Message ID = Goal_Message Text = "Here we go! Run #3" Style = Panel_Message_Generic_Loss
  Kill Prefix = "G_RACE_GEO2"
  Create Prefix = "G_RACE_GEO3"
  UnSetFlag Flag = FLAG_RACE_LEG_2
  SetFlag Flag = FLAG_RACE_LEG_3
  Skater:Obj_MoveToNode Name = TRG_G_Race_RestartNode orient
  MakeSkater_StartSlalom
endscript
script Kon_Goal_Race_Finish
  MakeSkaterGoto SlalomBrake
  Kill Prefix = "G_RACE_GEO3"
  UnSetFlag Flag = FLAG_RACE_LEG_3
endscript
script Kon_Race_BailCheck
  Obj_SetException EX = SkaterBailed Scr = Kon_Race_BailCheckBailed Params = { <...> }
endscript
script Kon_Race_BailCheckBailed
  if GoalManager_GoalIsActive Name = Kon_Goal_Race
    Create_Panel_Message ID = Goal_Message Text = "OUCH!!! Try Again!" Style = Panel_Message_Generic_Loss
    if GetFlag Flag = FLAG_RACE_LEG_1
      GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate01 0
      GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate02 0
      GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate03 0
      GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate04 0
      GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate05 0
    else
      if GetFlag Flag = FLAG_RACE_LEG_2
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate06 0
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate07 0
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate08 0
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate09 0
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate10 0
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate11 0
        GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate12 0
      else
        if GetFlag Flag = FLAG_RACE_LEG_3
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate13 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate14 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate15 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate16 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate17 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate18 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate19 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate20 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate21 0
          GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate22 0
        endif
      endif
    endif
    SpawnScript Kon_Race_Bailed_Restart ID = Race_Bailed
  endif
endscript
script Kon_Race_Bailed_Restart
  Wait 0.25 Seconds
  KillSpawnedScript ID = Race_MissedGate
  KillSpawnedScript ID = LastGate
  Skater:Obj_MoveToNode Name = TRG_G_Race_RestartNode orient
  MakeSkater_StartSlalom
endscript
script Kon_Race_MissedGate_Restart
  Wait 0.25 Seconds
  KillSpawnedScript ID = Race_Bailed
  KillSpawnedScript ID = LastGate
  Skater:Obj_MoveToNode Name = TRG_G_Race_RestartNode orient
  MakeSkater_StartSlalom
endscript
script MakeSkater_StartSlalom
  MakeSkaterGoto ShoppingCart_Start Params = { racemode = slalom CarMode Turn_Friction = 0 StartSpeed = 20 Accelerate_To = 450 }
  Skater:CanBrakeOff
endscript
script Kon_Goal_Race_Deactivate
  KillSpawnedScript ID = Race_MissedGate
  KillSpawnedScript ID = Race_Bailed
  KillSpawnedScript ID = LastGate
  Kill Prefix = "G_RACE_GEO"
  Kill Name = TRG_G_Race_BailCheck
  UnSetFlag Flag = FLAG_RACE_LEG_1
  UnSetFlag Flag = FLAG_RACE_LEG_2
  UnSetFlag Flag = FLAG_RACE_LEG_3
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate01 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate02 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate03 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate04 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate05 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate06 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate07 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate08 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate09 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate10 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate11 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate12 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate13 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate14 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate15 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate16 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate17 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate18 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate19 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate20 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate21 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Race Gate22 0
  Create_Panel_Message ID = Goal_Message Text = " " Style = Panel_Message_Generic_Loss
  MakeSkaterGoto SkaterInit
endscript
script Kon_AddGoal_Gaps
  AddGoal_Gaps {
    Pro_Goal
    time = 180
    Goal_Text = "Find and get all 7 Channel Gaps!"
    View_Goals_Text = "Find and get all 7 Channel Gaps"
    Pro = "Martin"
    Full_Name = "Martin Ramos"
    Goal_Start_Script = Kon_Goal_Gaps_Start
    Goal_Deactivate_Script = Kon_Goal_Gaps_Deactivate
    Goal_Flags = [
      Got_Channel_1
      Got_Channel_2
      Got_Channel_3
      Got_Channel_4
      Got_Channel_6
      Got_Channel_7
      Got_Channel_8
    ]
    Use_Hud_Counter
    Hud_Counter_Caption = "Channel Gaps"
    Goal_Description = Kon_Gaps_Desc
    record_type = time }
endscript
script Kon_Gaps_Got_Gap_1
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps
    Create_Panel_Message ID = Goal_Message Text = "Channel Gap!" Style = Panel_Message_Generic_Loss
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_1 1
  endif
endscript
script Kon_Gaps_Got_Gap_2
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps
    Create_Panel_Message ID = Goal_Message Text = "Channel Gap!" Style = Panel_Message_Generic_Loss
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_2 1
  endif
endscript
script Kon_Gaps_Got_Gap_3
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps
    Create_Panel_Message ID = Goal_Message Text = "Channel Gap!" Style = Panel_Message_Generic_Loss
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_3 1
  endif
endscript
script Kon_Gaps_Got_Gap_4
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps
    Create_Panel_Message ID = Goal_Message Text = "Channel Gap!" Style = Panel_Message_Generic_Loss
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_4 1
  endif
endscript
script Kon_Gaps_Got_Gap_6
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps
    Create_Panel_Message ID = Goal_Message Text = "Channel Gap!" Style = Panel_Message_Generic_Loss
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_6 1
  endif
endscript
script Kon_Gaps_Got_Gap_7
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps
    Create_Panel_Message ID = Goal_Message Text = "Channel Gap!" Style = Panel_Message_Generic_Loss
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_7 1
  endif
endscript
script Kon_Gaps_Got_Gap_8
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps
    Create_Panel_Message ID = Goal_Message Text = "Channel Gap!" Style = Panel_Message_Generic_Loss
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_8 1
  endif
endscript
script Kon_EndGap_Channel01
  EndGap GapID = <ID1> Text = "Channel - Kidney Roll-In!" Score = 25 GapScript = Kon_Gaps_Got_Gap_1
endscript
script Kon_EndGap_Channel02
  EndGap GapID = <ID1> Text = "Channel - Triple Roll-In!" Score = 150 GapScript = Kon_Gaps_Got_Gap_2
endscript
script Kon_EndGap_Channel03
  EndGap GapID = <ID1> Text = "Channel - Monster Pipe Roll-In!" Score = 50 GapScript = Kon_Gaps_Got_Gap_3
endscript
script Kon_EndGap_Channel04
  EndGap GapID = <ID1> Text = "Channel - Single Wedge!" Score = 50 GapScript = Kon_Gaps_Got_Gap_4
endscript
script Kon_EndGap_Channel06
  EndGap GapID = <ID1> Text = "Channel - HUGE Bank n' Roll!!!" Score = 200 GapScript = Kon_Gaps_Got_Gap_6
endscript
script Kon_EndGap_Channel07
  EndGap GapID = <ID1> Text = "Channel - Ramp 2 Ramp!" Score = 50 GapScript = Kon_Gaps_Got_Gap_7
endscript
script Kon_EndGap_Channel08
  EndGap GapID = <ID1> Text = "Channel - Double Roll-In!" Score = 50 GapScript = Kon_Gaps_Got_Gap_8
endscript
script Kon_Goal_Gaps_Start
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_1 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_2 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_3 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_4 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_6 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_7 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_8 0
endscript
script Kon_Goal_Gaps_Deactivate
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_1 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_2 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_3 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_4 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_6 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_7 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps Got_Channel_8 0
endscript
script Kon_AddGoal_Gaps2
  AddGoal_Gaps2 {
    CAREER_ONLY
    Unlocked_By_Another
    time = 120
    Goal_Text = "Ollie the Magic Bum 5x...again!"
    View_Goals_Text = "Ollie the Magic Bum 5x...again"
    Pro = "Tony"
    Full_Name = "Tony Hawk"
    Goal_Start_Script = Kon_Goal_Gaps2_Start
    Goal_Deactivate_Script = Kon_Goal_Gaps2_Deactivate
    Goal_Flags = [
      Ollied_Bum_1
      Ollied_Bum_2
      Ollied_Bum_3
      Ollied_Bum_4
      Ollied_Bum_5
    ]
    Use_Hud_Counter
    Hud_Counter_Caption = "Bum Ollies"
    Goal_Description = Kon_Gaps2_Desc
    record_type = time }
endscript
EX_OLLIED_BUM = 1
FLAG_BEEN_TO_SPOT01 = 0
FLAG_BEEN_TO_SPOT02 = 1
FLAG_BEEN_TO_SPOT03 = 2
FLAG_BEEN_TO_SPOT04 = 3
FLAG_BEEN_TO_SPOT05 = 4
script Kon_Goal_Gaps2_Start
  Create Name = TRG_G_Gap2_Ped_MagicBum
  Create Name = TRGP_Goal_Gap2_StartGap01
  Create Name = TRGP_Goal_Gap2_EndGap01
  SetFlag Flag = FLAG_BEEN_TO_SPOT01
endscript
script Kon_Goal_Gaps2_Deactivate
  Kill Prefix = "TRG_G_Gap2_Ped_MagicBum"
  Kill Prefix = "TRGP_Goal_Gap2_StartGap"
  Kill Prefix = "TRGP_Goal_Gap2_EndGap"
  UnSetFlag Flag = FLAG_BEEN_TO_SPOT01
  UnSetFlag Flag = FLAG_BEEN_TO_SPOT02
  UnSetFlag Flag = FLAG_BEEN_TO_SPOT03
  UnSetFlag Flag = FLAG_BEEN_TO_SPOT04
  UnSetFlag Flag = FLAG_BEEN_TO_SPOT05
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps2 Ollied_Bum_1 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps2 Ollied_Bum_2 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps2 Ollied_Bum_3 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps2 Ollied_Bum_4 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps2 Ollied_Bum_5 0
endscript
script Kon_Goal_Gaps2_Ped_MagicBum
  Obj_ClearExceptions
  Obj_SetException EX = EX_OLLIED_BUM Scr = Kon_Goal_Gaps2_Move_Bum
  Obj_ShadowOff
  Obj_Hover Amp = 5 Freq = 1
  Obj_PlayAnim Anim = random( @
  Ped_Mec_Idle1 Cycle
  @Ped_Mec_Idle3 Cycle
   ) 
endscript
script Kon_Goal_Gaps2_Move_Bum
  Printf "CR---CR---CR---Where is the bum sound???"
  PlayStream random( @
  Ollie_Avoid01
  @Ollie_Avoid03
  @Ollie_Avoid06
   ) 
  if GetFlag Flag = FLAG_BEEN_TO_SPOT01
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps2 Ollied_Bum_1 1
    Obj_MoveToNode Name = TRG_G_Gap2_BumSpot02
    UnSetFlag Flag = FLAG_BEEN_TO_SPOT01
    SetFlag Flag = FLAG_BEEN_TO_SPOT02
  else
    if GetFlag Flag = FLAG_BEEN_TO_SPOT02
      GoalManager_SetGoalFlag Name = Kon_Goal_Gaps2 Ollied_Bum_2 1
      Obj_MoveToNode Name = TRG_G_Gap2_BumSpot03
      UnSetFlag Flag = FLAG_BEEN_TO_SPOT02
      SetFlag Flag = FLAG_BEEN_TO_SPOT03
    else
      if GetFlag Flag = FLAG_BEEN_TO_SPOT03
        GoalManager_SetGoalFlag Name = Kon_Goal_Gaps2 Ollied_Bum_3 1
        Obj_MoveToNode Name = TRG_G_Gap2_BumSpot04
        UnSetFlag Flag = FLAG_BEEN_TO_SPOT03
        SetFlag Flag = FLAG_BEEN_TO_SPOT04
      else
        if GetFlag Flag = FLAG_BEEN_TO_SPOT04
          GoalManager_SetGoalFlag Name = Kon_Goal_Gaps2 Ollied_Bum_4 1
          Obj_MoveToNode Name = TRG_G_Gap2_BumSpot05
          UnSetFlag Flag = FLAG_BEEN_TO_SPOT04
        else
          GoalManager_SetGoalFlag Name = Kon_Goal_Gaps2 Ollied_Bum_5 1
        endif
      endif
    endif
  endif
  Goto Kon_Goal_Gaps2_Ped_MagicBum
endscript
script Kon_EndGap_MagicBum01
  EndGap GapID = MagicBum_Gap01 Text = "Bum Ollie!" GapScript = Kon_Gap2_Ollied_Bum_1
endscript
script Kon_EndGap_MagicBum02
  EndGap GapID = MagicBum_Gap02 Text = "Bum Ollie!" GapScript = Kon_Gap2_Ollied_Bum_2
endscript
script Kon_EndGap_MagicBum03
  EndGap GapID = MagicBum_Gap03 Text = "Bum Ollie!" GapScript = Kon_Gap2_Ollied_Bum_3
endscript
script Kon_EndGap_MagicBum04
  EndGap GapID = MagicBum_Gap04 Text = "Bum Ollie!" GapScript = Kon_Gap2_Ollied_Bum_4
endscript
script Kon_EndGap_MagicBum05
  EndGap GapID = MagicBum_Gap05 Text = "Bum Ollie!" GapScript = Kon_Gap2_Ollied_Bum_5
endscript
script Kon_Gap2_Ollied_Bum_1
  Create_Panel_Message ID = Goal_Message Text = "Found Him! 4 More Times!" Style = Panel_Message_Generic_Loss
  SendException EX_OLLIED_BUM Name = TRG_G_Gap2_Ped_MagicBum
  Kill Name = TRGP_Goal_Gap2_StartGap01
  Kill Name = TRGP_Goal_Gap2_EndGap01
  Create Name = TRGP_Goal_Gap2_StartGap02
  Create Name = TRGP_Goal_Gap2_EndGap02
endscript
script Kon_Gap2_Ollied_Bum_2
  Create_Panel_Message ID = Goal_Message Text = "Found Him! 3 More Times!" Style = Panel_Message_Generic_Loss
  SendException EX_OLLIED_BUM Name = TRG_G_Gap2_Ped_MagicBum
  Kill Name = TRGP_Goal_Gap2_StartGap02
  Kill Name = TRGP_Goal_Gap2_EndGap02
  Create Name = TRGP_Goal_Gap2_StartGap03
  Create Name = TRGP_Goal_Gap2_EndGap03
endscript
script Kon_Gap2_Ollied_Bum_3
  Create_Panel_Message ID = Goal_Message Text = "Found Him! 2 More Times!" Style = Panel_Message_Generic_Loss
  SendException EX_OLLIED_BUM Name = TRG_G_Gap2_Ped_MagicBum
  Kill Name = TRGP_Goal_Gap2_StartGap03
  Kill Name = TRGP_Goal_Gap2_EndGap03
  Create Name = TRGP_Goal_Gap2_StartGap04
  Create Name = TRGP_Goal_Gap2_EndGap04
endscript
script Kon_Gap2_Ollied_Bum_4
  Create_Panel_Message ID = Goal_Message Text = "Found Him! 1 More Time!" Style = Panel_Message_Generic_Loss
  SendException EX_OLLIED_BUM Name = TRG_G_Gap2_Ped_MagicBum
  Kill Name = TRGP_Goal_Gap2_StartGap04
  Kill Name = TRGP_Goal_Gap2_EndGap04
  Create Name = TRGP_Goal_Gap2_StartGap05
  Create Name = TRGP_Goal_Gap2_EndGap05
endscript
script Kon_Gap2_Ollied_Bum_5
  Create_Panel_Message ID = Goal_Message Text = "Back To Venice!" Style = Panel_Message_Generic_Loss
  SendException EX_OLLIED_BUM Name = TRG_G_Gap2_Ped_MagicBum
endscript
script Kon_AddGoal_Tour
  AddGoal_Tour {
    CAREER_ONLY
    Pro_Goal
    Goal_Text = "King of Kona! Score to beat: 1,000,000"
    View_Goals_Text = "Become the King of Kona"
    Pro = "Tony"
    Full_Name = "Tony Hawk"
    Goal_Deactivate_Script = Kon_Goal_Tour_Deactivate
    Expire = Kon_Goal_Tour_Spot_Expire
    Active = Nullscript
    Restart_Node = TRG_G_TOUR_Spot01
    Goal_Flags = [
      KofK_Spot_1
      KofK_Spot_2
      KofK_Spot_3
      KofK_Spot_4
      KofK_Spot_5
    ]
    Tour_Spots = [
      { ID = TRG_G_TOUR_Spot01 Scr = Kon_TOUR_Spot01 Flag = KofK_Spot_1 time = 30 }
      { ID = TRG_G_TOUR_Spot02 Scr = Kon_TOUR_Spot02 Flag = KofK_Spot_2 time = 30 }
      { ID = TRG_G_TOUR_Spot03 Scr = Kon_TOUR_Spot03 Flag = KofK_Spot_3 time = 30 }
      { ID = TRG_G_TOUR_Spot04 Scr = Kon_TOUR_Spot04 Flag = KofK_Spot_4 time = 30 }
      { ID = TRG_G_TOUR_Spot05 Scr = Kon_TOUR_Spot05 Flag = KofK_Spot_5 time = 30 }
    ]
    Goal_Description = Kon_Tour_Desc
    record_type = Score }
endscript
script Kon_TOUR_Spot01
  GoalManager_EditGoal Name = <goal_id> params = { is_tour_goal = 1 }
  KillSpawnedScript Name = Kon_Goal_Tour_Expire_2
  GoalManager_SetShouldDeactivateOnExpire Name = kon_goal_tour 0
  Kon_Goal_Tour_Clear_Exceptions
  GoalManager_SetGoalFlag Name = kon_goal_tour KofK_Spot_1 1
  Create Name = TRGP_Tour_Exit_Park
  Wait 1.5 Second
  Create_Panel_Message ID = Spot_Message Text = "SPOT 1 - Street Park" Style = Panel_Message_Generic_Loss 
  Wait 2.2 Seconds
  Create_Panel_Block ID = Skip_Goal_reminder Text = "Option to skip\nRest of goal now in the pause menu!" Style = panel_message_kongoal
endscript
script Kon_TOUR_Spot02
  Kon_Goal_Tour_Clear_Exceptions
  GoalManager_SetGoalFlag Name = kon_goal_tour KofK_Spot_2 1
  Kill Name = TRGP_Tour_Exit_Park
  Create Name = TRGP_Tour_Exit_Kidney
  Wait 1.5 Second
  Create_Panel_Message ID = Spot_Message Text = "SPOT 2 - Kidney Bowl" Style = Panel_Message_Generic_Loss
endscript
script Kon_TOUR_Spot03
  Kon_Goal_Tour_Clear_Exceptions
  GoalManager_SetGoalFlag Name = kon_goal_tour KofK_Spot_3 1
  Kill Name = TRGP_Tour_Exit_Kidney
  Create Name = TRGP_Tour_Exit_Monster
  Wait 1.5 Second
  Create_Panel_Message ID = Spot_Message Text = "SPOT 3 - Monster Half Pipe" Style = Panel_Message_Generic_Loss
endscript
script Kon_TOUR_Spot04
  Kon_Goal_Tour_Clear_Exceptions
  GoalManager_SetGoalFlag Name = kon_goal_tour KofK_Spot_4 1
  Kill Name = TRGP_Tour_Exit_Monster
  Create Name = TRGP_Tour_Exit_Snake
  Wait 1.5 Second
  Create_Panel_Message ID = Spot_Message Text = "SPOT 4 - Snake Run" Style = Panel_Message_Generic_Loss
endscript
script Kon_TOUR_Spot05
  Kon_Goal_Tour_Clear_Exceptions
  GoalManager_SetGoalFlag Name = kon_goal_tour KofK_Spot_5 1
  Kill Name = TRGP_Tour_Exit_Snake
  Create Name = TRGP_Tour_Exit_Crusty
  Wait 1.5 Second
  Create_Panel_Message ID = Spot_Message Text = "SPOT 5 - Crusty Half Pipe" Style = Panel_Message_Generic_Loss
endscript
script Kon_Goal_Tour_Spot_Expire
  Printf "Kon_Goal_Tour_Spot_Expire"
  GoalManager_PauseGoal Name = kon_goal_tour
  RunScriptOnObject ID = <trigger_obj_id> kon_goal_tour_next_spot
endscript
script Kon_Goal_Tour_Clear_Exceptions
  KillSpawnedScript Kon_Goal_Tour_Expire_2
   <trigger_obj_id>:Obj_ClearException SkaterLanded
   <trigger_obj_id>:Obj_ClearException SkaterBailed
endscript
script kon_goal_tour_next_spot
  Obj_ClearExceptions
  MakeSkaterGoto EndOfRun
  SpawnScript Kon_Goal_Tour_Expire_2
endscript
script Kon_Goal_Tour_Expire_2
  WaitForEvent Type = EndOfRunDone
  MakeSkaterGoto SkaterInit
  if GoalManager_AllFlagsSet Name = kon_goal_tour Flag = KofK_Spot_1
    if SkaterTotalScoreGreaterThan 1000000
      GoalManager_WinGoal Name = kon_goal_tour
    else
      GoalManager_LoseGoal Name = kon_goal_tour
    endif
  else
    Kon_Goal_Tour_Clear_Exceptions
    GoalManager_NextTourSpot Name = kon_goal_tour
  endif
endscript
script Kon_Goal_Tour_Expire_3 // Menu selction script to complete the goal early if at the required score
  IF ObjectExists id = current_menu_anchor
    exit_pause_menu 
  ENDIF
  KillSpawnedScript panel_message_kongoal
  if SkaterTotalScoreGreaterThan 1000000
    GoalManager_WinGoal Name = kon_goal_tour
    else
    GoalManager_LoseGoal Name = kon_goal_tour
  endif
endscript
script Kofk_Exit_Area
  if ( <SpotID> = Park )
    Sk3_Killskater Message1 = "Stay in the Street Park!" Message2 = "Stay in the Street Park!" Message3 = "Stay in the Street Park!" Message4 = "Stay in the Street Park!" DeathSound = HitBody02
  else
    if ( <SpotID> = Kidney )
      Sk3_Killskater Message1 = "Stay in the Bowl!" Message2 = "Stay in the Bowl!" Message3 = "Stay in the Bowl!" Message4 = "Stay in the Bowl!" DeathSound = HitBody02
    else
      if ( <SpotID> = Monster )
        Sk3_Killskater Message1 = "Stay on the Monster Pipe!" Message2 = "Stay on the Monster Pipe!" Message3 = "Stay on the Monster Pipe!" Message4 = "Stay on the Monster Pipe!" DeathSound = HitBody02
      else
        if ( <SpotID> = Snake )
          Sk3_Killskater Message1 = "Stay in the Snake Run!" Message2 = "Stay in the Snake Run!" Message3 = "Stay in the Snake Run!" Message4 = "Stay in the Snake Run!" DeathSound = HitBody02
        else
          if ( <SpotID> = Crusty )
            Sk3_Killskater Message1 = "Stay on the Crusty Pipe!" Message2 = "Stay on the Crusty Pipe!" Message3 = "Stay on the Crusty Pipe!" Message4 = "Stay on the Crusty Pipe!" DeathSound = HitBody02
          else
          endif
        endif
      endif
    endif
  endif
endscript
script Kon_Goal_Tour_Deactivate
  Kill Prefix = "TRGP_Tour_Exit"
endscript
script Kon_AddGoal_Gaps3
  AddGoal_Gaps3 {
    Unlocked_By_Another
    time = 120
    Goal_Text = "Manual challenge on the box!"
    View_Goals_Text = "Show off your tech on the manual box"
    Pro = "Employee"
    Full_Name = "Kona Employee"
    Intro_Node = TRG_G_GAP3_Intro_Node
    Start_Cam_Anim = G_GAP3_CameraStart
    ProSet_Prefix = "ProSet1_"
    Goal_Start_Script = Kon_Goal_Gaps3_Start
    Goal_Intro_Script = Kon_Goal_Gaps3_Intro
    Goal_Deactivate_Script = Kon_Goal_Gaps3_Deactivate
    Goal_Flags = [
      Got_Part_1
      Got_Part_2
      Got_Part_3
    ]
    Use_Hud_Counter
    Hud_Counter_Caption = "Manual Box Lines"
    Goal_Description = Kon_Gaps3_Desc
    Kill_Radius = 300
    record_type = none }
endscript
script Kon_Goal_Gaps3_Intro
  Create Prefix = "G_Gaps3_Geo"
  Create Prefix = "TRG_Ledge_G_GAP3"
endscript
script Kon_Goal_Gaps3_Start
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps3 Got_Part_1 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps3 Got_Part_2 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps3 Got_Part_3 0
  UnSetFlag Flag = FLAG_PROG_MANUAL_3
  UnSetFlag Flag = FLAG_PROG_MANUAL_2
  UnSetFlag Flag = FLAG_RESETING_PLAYER
  SetFlag Flag = FLAG_PROG_MANUAL_1
  Create Name = TRG_Obj_G_GAP3_BailCheck
  TRG_Obj_G_GAP3_BailCheck:Obj_ClearExceptions
endscript
script Kon_Goal_Gaps3_Deactivate
  KillSpawnedScript Name = Kon_Gaps3_Reset
  Reset_Gaps3_Scripts
  Kill Prefix = "G_Gaps3_Geo"
  Kill Prefix = "TRG_Ledge_G_GAP3"
  Kill Prefix = "TRG_Obj_G_GAP3"
  Kill Prefix = "TRGP_Gaps3"
  KillSpawnedScript Name = Kon_Gaps3_Got_Part_1
  KillSpawnedScript Name = Kon_Gaps3_Got_Part_2
  KillSpawnedScript Name = Kon_Gaps3_Got_Part_3
  Printf "CR---CR---CR---Killed Bail Checker Object at Deactivate"
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps3 Got_Part_1 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps3 Got_Part_2 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps3 Got_Part_3 0
  UnSetFlag Flag = FLAG_PROG_MANUAL_3
  UnSetFlag Flag = FLAG_PROG_MANUAL_2
  UnSetFlag Flag = FLAG_PROG_MANUAL_1
  UnSetFlag Flag = FLAG_RESETING_PLAYER
  if ScreenElementExists ID = Goal_Instruction1
    DestroyScreenElement ID = Goal_Instruction1
  endif
  if ScreenElementExists ID = Goal_Instruction2
    DestroyScreenElement ID = Goal_Instruction2
  endif
  Create_Panel_Message ID = Goal_Message Text = " " Style = Panel_Message_Generic_Loss
  Create_Panel_Block ID = Goal_Instruction Text = " " Style = Panel_Message_New_Horse_Spot
  GoalManager_GetGoalParams Name = Kon_Goal_Gaps3
  if GotParam CalledEndOfRun
    if ( <CalledEndOfRun> = 1 )
      MakeSkaterGoto SkaterInit
    endif
  endif
  GoalManager_EditGoal Name = Kon_Goal_Gaps3 Params = { CalledEndOfRun = 0 }
endscript
FLAG_PROG_MANUAL_1 = 4
FLAG_PROG_MANUAL_2 = 5
FLAG_PROG_MANUAL_3 = 6
FLAG_RESETING_PLAYER = 7
script Kon_Gaps3_FlipIn_StartGap
  if not GoalManager_GoalIsActive Name = Kon_Goal_Gaps3
    return
  endif
  TRG_Obj_G_GAP3_BailCheck:Obj_SetException EX = SkaterBailed Scr = Kon_Gaps3_BailLand Params = { Text = "OUCH!!! Try again!" }
  TRG_Obj_G_GAP3_BailCheck:Obj_SetException EX = SkaterLanded Scr = Kon_Gaps3_BailLand Params = { Text = "Landed early! Try again!" }
  Create Name = TRGP_Gaps3_OffBox
  if TriggerType [ TRIGGER_JUMP_OFF ]
    if GoalManager_GoalIsActive Name = Kon_Goal_Gaps3
      if GetFlag Flag = FLAG_PROG_MANUAL_2
        Printf "FLAG2 IS SET"
        StartGap GapID = Gaps3_FlipIn Flags = [ PURE_AIR ]
      else
        if GetFlag Flag = FLAG_PROG_MANUAL_3
          Printf "FLAG3 IS SET"
          StartGap GapID = Gaps3_FlipIn Flags = [ PURE_AIR ]
        else
          Printf "NO FLAGS ARE SET"
        endif
      endif
    endif
  endif
endscript
script Kon_Gaps3_FlipIn_EndGap
  if TriggerType [ TRIGGER_LAND_ON ]
    if GetFlag Flag = FLAG_PROG_MANUAL_1
      StartGap GapID = Gaps3_Manual Flags = [ PURE_MANUAL ]
      Printf "CR---CR---CR---Created bail checker and Off Box TRGP and started 1st manual gap"
    else
      if GetFlag Flag = FLAG_PROG_MANUAL_2
        GetNumberOfTrickOccurrences TrickText = "Kickflip"
        PrintStruct <...>
        if ( <Number_Of_Occurrences> = 0 )
          Goto Kon_Gaps3_Missed_Kickflip
        else
          EndGap GapID = Gaps3_FlipIn Continue = { GapID = Gaps3_Manual Flags = [ PURE_MANUAL ] }
          Printf "CR---CR---CR---Created bail checker and Off Box TRGP...Ended kickflip gap and started 2nd manual gap"
        endif
      else
        if GetFlag Flag = FLAG_PROG_MANUAL_3
          GetNumberOfTrickOccurrences TrickText = "Kickflip"
          PrintStruct <...>
          if ( <Number_Of_Occurrences> = 0 )
            Goto Kon_Gaps3_Missed_Kickflip
          else
            EndGap GapID = Gaps3_FlipIn Continue = { GapID = Gaps3_Manual Flags = [ PURE_MANUAL ] }
            Printf "CR---CR---CR---Created bail checker and Off Box TRGP...Ended kickflip gap and started 3rd manual gap"
          endif
        endif
      endif
    endif
  endif
endscript
script Kon_Gaps3_Manual_EndGap
  if TriggerType [ TRIGGER_SKATE_ONTO ]
    if GoalManager_GoalIsActive Name = Kon_Goal_Gaps3
      TRG_Obj_G_GAP3_BailCheck:Obj_ClearExceptions
      Kill Name = TRGP_Gaps3_OffBox
      Printf "CHECKING FLAG 1"
      if GetFlag Flag = FLAG_PROG_MANUAL_1
        Printf "NO NO NO NO NO FLAG 1"
        EndGap GapID = Gaps3_Manual GapScript = Kon_Gaps3_Got_Part_1
        Printf "CR---CR---CR---Killed bail checker and Off Box TRGP...Ended 1st manual gap"
      else
        if GetFlag Flag = FLAG_PROG_MANUAL_2
          EndGap GapID = Gaps3_Manual GapScript = Kon_Gaps3_Got_Part_2
          Printf "CR---CR---CR---Killed bail checker and Off Box TRGP...Ended 2nd manual gap"
        else
          if GetFlag Flag = FLAG_PROG_MANUAL_3
            Create_Panel_Message ID = Goal_Message Text = "Now Heelflip out!" Style = Panel_Message_Generic_Loss
            EndGap GapID = Gaps3_Manual Continue = { GapID = Gaps3_FlipOut TrickText = "Heelflip" TrickScript = Kon_Gaps3_Got_Part_3 }
            Printf "CR---CR---CR---Bail checker still alive...Ended 3rd manual gap and started flip out gap"
          endif
        endif
      endif
    endif
  endif
endscript
script Kon_Gaps3_FlipOut_EndGap
  EndGap GapID = Gaps3_FlipOut
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps3
    if not GetFlag Flag = FLAG_RESETING_PLAYER
      if GetFlag Flag = FLAG_PROG_MANUAL_3
        GoalManager_EditGoal Name = Kon_Goal_Gaps3 Params = { CalledEndOfRun = 1 }
        MakeSkaterGoto EndOfRun
        WaitForEvent Type = EndOfRunDone
        Create_Panel_Message ID = Goal_Message Text = "You missed the Heelflip!" Style = Panel_Message_Generic_Loss
        Printf "A"
        SpawnScript Kon_Gaps3_Reset Params = { }
      endif
    endif
  endif
endscript
script Kon_Gaps3_Got_Part_1
  Printf "FUCKETY FUCK STIX"
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps3
    UnSetFlag Flag = FLAG_PROG_MANUAL_1
    GoalManager_EditGoal Name = Kon_Goal_Gaps3 Params = { CalledEndOfRun = 1 }
    MakeSkaterGoto EndOfRun
    Skater:Vibrate off
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps3 Got_Part_1 1
    Create_Panel_Message ID = Goal_Message Text = "Nice! Next Test!" Style = Panel_Message_Generic_Loss
    Wait 2 Seconds
    Create_Panel_Message ID = Goal_Message Text = " " Style = Panel_Message_Generic_Loss
    Create_Panel_Block ID = Goal_Instruction1 Text = "Kickflip to Manual\non the box!" Style = Panel_Message_New_Horse_Spot
    Printf "B"
    SpawnScript Kon_Gaps3_Reset Params = { GotPart1 }
  endif
endscript
script Kon_Gaps3_Got_Part_2
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps3
    UnSetFlag Flag = FLAG_PROG_MANUAL_2
    Printf "CLEARING FLAG 2 ---------------------------------"
    GoalManager_EditGoal Name = Kon_Goal_Gaps3 Params = { CalledEndOfRun = 1 }
    MakeSkaterGoto EndOfRun
    Skater:Vibrate off
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps3 Got_Part_2 1
    Create_Panel_Message ID = Goal_Message Text = "Nice! Final Test!" Style = Panel_Message_Generic_Loss
    Wait 2 Seconds
    Create_Panel_Message ID = Goal_Message Text = " " Style = Panel_Message_Generic_Loss
    Create_Panel_Block ID = Goal_Instruction1 Text = " " Style = Panel_Message_New_Horse_Spot
    Create_Panel_Block ID = Goal_Instruction2 Text = " " Style = Panel_Message_New_Horse_Spot
    Create_Panel_Block ID = Goal_Instruction1 Text = "Kickflip to Manual\non the box!\nThen Heelflip out at the end!" Style = Panel_Message_New_Horse_Spot
    Printf "GOT PART 2 --------------------------------"
    SpawnScript Kon_Gaps3_Reset Params = { GotPart2 }
  endif
endscript
script Kon_Gaps3_Got_Part_3
  Printf "GOT TO END HEELFLIP"
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps3
    UnSetFlag Flag = FLAG_PROG_MANUAL_3
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps3 Got_Part_3 1
  endif
endscript
script Reset_Gaps3_Scripts
  KillSpawnedScript Name = Kon_Gaps3_Missed_Kickflip
  KillSpawnedScript Name = Kon_Gaps3_BailCheck
  KillSpawnedScript Name = Kon_Gaps3_BailLand
  KillSpawnedScript Name = Kon_Gaps3_Grinding
  KillSpawnedScript Name = Kon_Gaps3_FallOff
  KillSpawnedScript Name = Kon_Gaps3_FlipOut_EndGap
  KillSpawnedScript Name = Kon_Gaps3_FlipIn_EndGap
  KillSpawnedScript Name = Kon_Gaps3_Manual_EndGap
  KillSpawnedScript Name = Kon_Gaps3_FlipOut_EndGap
  Printf "KILL ALL FUCKING SCRIPTS"
endscript
script Kon_Gaps3_Missed_Kickflip
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps3
    if GetFlag Flag = FLAG_PROG_MANUAL_2
      Create_Panel_Message ID = Goal_Message Text = "Oops! You missed the Kickflip!" Style = Panel_Message_Generic_Loss
      Printf "C"
      SpawnScript Kon_Gaps3_Reset Params = { }
    else
      if GetFlag Flag = FLAG_PROG_MANUAL_3
        Create_Panel_Message ID = Goal_Message Text = "Oops! You missed the Kickflip!" Style = Panel_Message_Generic_Loss
        Printf "D"
        SpawnScript Kon_Gaps3_Reset Params = { }
      endif
    endif
  endif
endscript
script Kon_Gaps3_BailCheck
endscript
script Kon_Gaps3_BailLand
  Obj_ClearExceptions
  if not GetFlag Flag = FLAG_RESETING_PLAYER
    if GoalManager_GoalIsActive Name = Kon_Goal_Gaps3
      Kill Name = TRGP_Gaps3_OffBox
      Create_Panel_Message ID = Goal_Message Text = <Text> Style = Panel_Message_Generic_Loss
      Printf "CR---CR---CR---Bailed or Landed. Going to reset"
      Printf "E"
      SpawnScript Kon_Gaps3_Reset Params = { }
    endif
  endif
endscript
script Kon_Gaps3_Grinding
  if not GetFlag Flag = FLAG_RESETING_PLAYER
    if GoalManager_GoalIsActive Name = Kon_Goal_Gaps3
      Kill Name = TRGP_Gaps3_OffBox
      Create_Panel_Message ID = Goal_Message Text = "No Grinding! Try again!" Style = Panel_Message_Generic_Loss
      Printf "F"
      SpawnScript Kon_Gaps3_Reset Params = { }
    endif
  endif
endscript
script Kon_Gaps3_FallOff
  if not GetFlag Flag = FLAG_RESETING_PLAYER
    if GoalManager_GoalIsActive Name = Kon_Goal_Gaps3
      TRG_Obj_G_GAP3_BailCheck:Obj_ClearExceptions
      Create_Panel_Message ID = Goal_Message Text = "Stay on the box! Try again" Style = Panel_Message_Generic_Loss
      Printf "G"
      SpawnScript Kon_Gaps3_Reset Params = { }
    endif
  endif
endscript
script Kon_Gaps3_Reset
  Printf "CR---CR---CR---Got to generic reset"
  Reset_Gaps3_Scripts
  if not GetFlag Flag = FLAG_RESETING_PLAYER
    Printf "1"
    SetFlag Flag = FLAG_RESETING_PLAYER
    if IsAlive Name = TRG_Obj_G_GAP3_BailCheck
      TRG_Obj_G_GAP3_BailCheck:Obj_ClearExceptions
    endif
    Kill Prefix = "TRGP_Gaps3_OffBox"
    Wait 1 Second
    Printf "2"
    if GotParam GotPart1
      SetFlag Flag = FLAG_PROG_MANUAL_2
      Printf "SETTING FLAG 2 - you did part 1 ----------------------------------"
    endif
    if GotParam GotPart2
      SetFlag Flag = FLAG_PROG_MANUAL_3
      Printf "SETTING FLAG 3 - you did part 2 ----------------------------------"
    endif
    Skater:Obj_MoveToNode Name = TRG_G_GAP3_RestartNode orient
    GoalManager_EditGoal Name = Kon_Goal_Gaps3 Params = { CalledEndOfRun = 0 }
    Skater:ClearPanel_Landed
    Skater:ClearTrickQueues
    Skater:SetQueueTricks NoTricks
    MakeSkaterGoto SkaterInit
    Wait 1 game frame
    UnSetFlag Flag = FLAG_RESETING_PLAYER
  endif
endscript
script Kon_AddGoal_Gaps4
  AddGoal_Gaps4 {
    CAREER_ONLY
    time = 120
    Goal_Text = "Hold lip tricks to scatter the birds!"
    View_Goals_Text = "Save the birds on the power lines"
    Pro = "Bum"
    Full_Name = "Kona Bum"
    Intro_Node = TRG_G_GAP4_Intro_Node
    Goal_Start_Script = Kon_Goal_Gaps4_Start
    Goal_Deactivate_Script = Kon_Goal_Gaps4_Deactivate
    Goal_Flags = [
      Got_Hawk_1
      Got_Hawk_2
      Got_Hawk_3
      Got_Hawk_4
      Got_Hawk_5
      Got_Hawk_6
      Got_Hawk_7
    ]
    Use_Hud_Counter
    Hud_Counter_Caption = "Birds Saved"
    Goal_Description = Kon_Gaps4_Desc
    record_type = time }
endscript
script Kon_Goal_Gaps4_Start
  Create Prefix = "Waypoint_Bird"
  Create Prefix = "TRG_Bird"
  Create Prefix = "G_Gaps4_Poop"
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_1 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_2 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_3 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_4 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_5 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_6 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_7 0
endscript
script Kon_Goal_Gaps4_Deactivate
  Kill Prefix = "Waypoint_Bird"
  Kill Prefix = "TRG_Bird"
  Kill Prefix = "G_Gaps4_Poop"
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_1 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_2 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_3 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_4 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_5 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_6 0
  GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 Got_Hawk_7 0
endscript
script Kon_Hawk
  Obj_ShadowOff
  Obj_ClearExceptions
  Obj_SetException EX = SkaterInRadius Scr = Kon_Hawk_Move Params = <...>
  Obj_SetInnerRadius 7
  Wait random( @
  5 Frames
  @15 Frames
  @30 Frames
  @45 Frames
   ) 
  Obj_PlaySound Pigeon
  begin
    Obj_CycleAnim Anim = Idle NumCycles = random( @
    1
    @2
    @3
     ) 
    Obj_CycleAnim Anim = Preen NumCycles = random( @
    1
    @2
     ) 
  repeat
endscript
script Kon_Hawk_Move
  Obj_ClearExceptions
  Obj_PlayAnim Anim = FlyFromIdle
  Obj_PlaySound PigeonFly
  Obj_MoveToNode Name = <Hover_Node> Speed = 4
  Obj_WaitAnimFinished
  Goto Kon_Hawk_Wait Params = <...>
endscript
script Kon_Hawk_Wait
  Obj_ClearExceptions
  Obj_PlayAnim Anim = Fly Cycle
  Obj_LookAtObject Type = Skater
  Wait 0.5 Seconds
  Obj_MoveToNode Name = <Hover_Next_Node> Speed = 4
  Wait 0.25 Seconds
  Obj_LookAtObject Type = Skater
  Wait 0.25 Seconds
  Obj_LookAtObject Type = Skater
  Wait 0.5 Seconds
  Obj_MoveToNode Name = <Hover_Node> Speed = 4
  Wait 0.25 Seconds
  Obj_LookAtObject Type = Skater
  Wait 0.25 Seconds
  Obj_LookAtObject Type = Skater
  Wait 0.5 Seconds
  Obj_MoveToNode Name = <Hover_Next_Node> Speed = 4
  Wait 0.25 Seconds
  Obj_LookAtObject Type = Skater
  Wait 0.25 Seconds
  Obj_LookAtObject Type = Skater
  Obj_SetException EX = SkaterInRadius Scr = Kon_Hawk_Leave Params = <...>
  Obj_SetException EX = SkaterOutOfRadius Scr = Kon_Hawk_Return Params = <...>
  Obj_SetInnerRadius 10
  Obj_SetOuterRadius 10
endscript
script Kon_Hawk_Leave
  Printf "CR-------CR--------Skater still near Hawk after 3 seconds. Leaving the area."
  Obj_ClearExceptions
  if GoalManager_GoalIsActive Name = Kon_Goal_Gaps4
    GoalManager_SetGoalFlag Name = Kon_Goal_Gaps4 <Goal_Flag> 1
    Create_Panel_Message ID = Goal_Message Text = "Good job! Keep it up!" Style = Panel_Message_Generic_Loss
  endif
  Obj_LookAtNode Name = <Leave_Node>
  Obj_PlaySound PigeonFly
  Obj_MoveToNode Name = <Leave_Node> Speed = 12
  Obj_WaitMove
  Die
endscript
script Kon_Hawk_Return
  Printf "CR-------CR--------Skater not near Hawk after 3 seconds. Returning to wire."
  Obj_ClearExceptions
  Obj_PlayAnim Anim = Fly Cycle
  Obj_MoveToNode Name = <Home_Node> Speed = 8 orient
  Obj_WaitMove
  Obj_CycleAnim Anim = FlyToIdle
  Goto Kon_Hawk Params = <...>
endscript
Hawk01Params = {
  Home_Node = Waypoint_Bird01_Home
  Hover_Node = Waypoint_Bird01_Hover
  Hover_Next_Node = Waypoint_Bird01_Hover_Next
  Leave_Node = Waypoint_Bird01_Leave
  Goal_Flag = Got_Hawk_1 }
Hawk02Params = {
  Home_Node = Waypoint_Bird02_Home
  Hover_Node = Waypoint_Bird02_Hover
  Hover_Next_Node = Waypoint_Bird02_Hover_Next
  Leave_Node = Waypoint_Bird02_Leave
  Goal_Flag = Got_Hawk_2 }
Hawk03Params = {
  Home_Node = Waypoint_Bird03_Home
  Hover_Node = Waypoint_Bird03_Hover
  Hover_Next_Node = Waypoint_Bird03_Hover_Next
  Leave_Node = Waypoint_Bird03_Leave
  Goal_Flag = Got_Hawk_3 }
Hawk04Params = {
  Home_Node = Waypoint_Bird04_Home
  Hover_Node = Waypoint_Bird04_Hover
  Hover_Next_Node = Waypoint_Bird04_Hover_Next
  Leave_Node = Waypoint_Bird04_Leave
  Goal_Flag = Got_Hawk_4 }
Hawk05Params = {
  Home_Node = Waypoint_Bird05_Home
  Hover_Node = Waypoint_Bird05_Hover
  Hover_Next_Node = Waypoint_Bird05_Hover_Next
  Leave_Node = Waypoint_Bird05_Leave
  Goal_Flag = Got_Hawk_5 }
Hawk06Params = {
  Home_Node = Waypoint_Bird06_Home
  Hover_Node = Waypoint_Bird06_Hover
  Hover_Next_Node = Waypoint_Bird06_Hover_Next
  Leave_Node = Waypoint_Bird06_Leave
  Goal_Flag = Got_Hawk_6 }
Hawk07Params = {
  Home_Node = Waypoint_Bird07_Home
  Hover_Node = Waypoint_Bird07_Hover
  Hover_Next_Node = Waypoint_Bird07_Hover_Next
  Leave_Node = Waypoint_Bird07_Leave
  Goal_Flag = Got_Hawk_7 }
script Kon_Counter2_Waiver
  Obj_SetInnerRadius 10
  Obj_SetException EX = SkaterInRadius Scr = Kon_Counter2_Waiver_Got
  Obj_RotZ Speed = 100 FLAG_MAX_COORDS
  Obj_Hover Amp = 10 Freq = 1.5
endscript
script Kon_Counter2_Waiver_Got
  GoalManager_GotCounterObject Name = Kon_Goal_Counter2
  PlaySound GapSound
  Die
endscript
script Kon_Goal_Special_StartGap
  if GoalManager_GoalIsActive Name = Kon_Goal_Special
    StartGap GapID = OverHut01 Flags = [ CANCEL_GROUND CANCEL_RAIL ] TrickText = "Misty Flip" TrickScript = Kon_Goal_Special_Got
  else
    StartGap GapID = OverHut01 Flags = [ CANCEL_GROUND CANCEL_RAIL ]
  endif
endscript
script Kon_Goal_Special_Got
  GoalManager_WinGoal Name = Kon_Goal_Special
endscript
script Kon_Bike
  if not IsAlive Name = TRG_G_Special_Pro
    Die
  else
    Obj_LockToObject ObjectName = TRG_G_Special_Pro (0, 0, 0)
  endif
endscript
script Kon_AddGoal_Counter
  AddGoal_Counter {
    CAREER_ONLY
    Unlocked_By_Another
    pro_specific_challenge
    pro_challenge_title = "BMX Doubles"
    pro_challenge_text = "Cab and Pro BMX rider Rick Thorne have been good friends for a long time. While on tour together, they've been known to throw down a doubles routine when the crowd calls for it."
    pro_challenge_tag_line = "Time to put on a show..."
    pro_challenge_pro_name = "Steve"
    Goal_Text = "\t1 \k1"
    Number = 12
    Use_Hud_Counter
    Hud_Counter_Caption = "Tricks"
    key_combos = [
      Air_SquareD
      Air_SquareU
      Air_CircleR
      Lip_TriangleL
      Lip_TriangleR
      Lip_TriangleD
      Air_CircleDL
      Air_CircleUR
      Air_CircleDR
      Lip_TriangleUR
      Lip_TriangleDL
      Lip_TriangleDR
      Lip_TriangleUL
    ]
    Pro = "rick"
    Full_Name = "Rick Thorne"
    Goal_Start_Script = Cab_Challenge_Start
    Goal_Deactivate_Script = Cab_Challenge_Deactivate
    Goal_Success_Script = Cab_Challenge_Success
    Goal_Description = Kon_Counter_Desc
    time = 120
    View_Goals_Text = "Steve's Pro Specific Challenge"
  }
endscript
FLAG_TRICK_NOW = 0
FLAG_SWITCH_SIDES = 1
FLAG_TRICK_OVER = 2
FLAG_GO_TO_NEXT_TRICK = 3
script Cab_Challenge_Start
  Create Prefix = "TRG_BMX_"
  Create Prefix = "Cab_Challenge_"
  Create Name = TRGP_EndGap_Cab01
  TRG_G_COUNTER_Pro:Obj_MoveToNode Name = TRG_Cab_Pro_EndNode
endscript
script Cab_Challenge_Deactivate
  Kill Prefix = "TRG_BMX_"
  Kill Prefix = "Cab_Challenge_"
  Kill Prefix = "TRG_Cab_LipArrow"
  Kill Name = TRGP_EndGap_Cab01
  if IsAlive Name = TRG_G_COUNTER_Pro
    TRG_G_COUNTER_Pro:Obj_MoveToNode Name = TRG_Cab_Pro_StartNode
  endif
endscript
script Cab_Challenge_Success
  if IsAlive Name = TRG_G_COUNTER_Pro
    TRG_G_COUNTER_Pro:Obj_MoveToNode Name = TRG_Cab_Pro_StartNode
  endif
endscript
script Cab_Challenge_AirGap
endscript
script ALF_Play_BMX_Anim_Over1_1
  TRG_BMX_Rider:Obj_PlayAnim Anim = Backflip Speed = 1.15
  TRG_BMX_Bike:Obj_PlayAnim Anim = BMX_Backflip Speed = 1.15
endscript
script ALF_Play_BMX_Anim_Over1_2
  TRG_BMX_Rider:Obj_PlayAnim Anim = BS_Stall Speed = 1.15
  TRG_BMX_Bike:Obj_PlayAnim Anim = BMX_BS_Stall Speed = 1.15
endscript
script ALF_Play_BMX_Anim_Under1_1
  TRG_BMX_Rider:Obj_PlayAnim Anim = _540 from = 0 to = 45 Speed = 0.9
  TRG_BMX_Bike:Obj_CycleAnim Anim = BMX_540 from = 0 to = 45 Speed = 0.9
  TRG_BMX_Rider:Obj_MoveLeft dist = -300 Speed = 12
  TRG_BMX_Bike:Obj_MoveLeft dist = -300 Speed = 12
  TRG_BMX_Rider:Obj_PlayAnim Anim = _540 from = 46
  TRG_BMX_Bike:Obj_PlayAnim Anim = BMX_540 from = 46
endscript
script ALF_Play_BMX_Anim_Under1_2
  TRG_BMX_Rider:Obj_PlayAnim Anim = _540 from = 0 to = 45 Speed = 0.9
  TRG_BMX_Bike:Obj_CycleAnim Anim = BMX_540 from = 0 to = 45 Speed = 0.9
  TRG_BMX_Rider:Obj_MoveLeft dist = -300 Speed = 12
  TRG_BMX_Bike:Obj_MoveLeft dist = -300 Speed = 12
  TRG_BMX_Rider:Obj_PlayAnim Anim = _540 from = 46 Speed = 0.9
  TRG_BMX_Bike:Obj_PlayAnim Anim = BMX_540 from = 46 Speed = 0.9
endscript
script ALF_Play_BMX_Anim_Under2_1
  TRG_BMX_Rider:Obj_PlayAnim Anim = OneFooter from = 0 to = 45 Speed = 0.9
  TRG_BMX_Bike:Obj_CycleAnim Anim = BMX_OneFooter from = 0 to = 45 Speed = 0.9
  TRG_BMX_Rider:Obj_MoveLeft dist = -300 Speed = 12
  TRG_BMX_Bike:Obj_MoveLeft dist = -300 Speed = 12
  TRG_BMX_Rider:Obj_PlayAnim Anim = OneFooter from = 46 Speed = 0.9
  TRG_BMX_Bike:Obj_PlayAnim Anim = BMX_OneFooter from = 46 Speed = 0.9
endscript
script ALF_Play_BMX_Anim_Under2_2
  TRG_BMX_Rider:Obj_PlayAnim Anim = OneFooter from = 0 to = 45 Speed = 0.9
  TRG_BMX_Bike:Obj_CycleAnim Anim = BMX_OneFooter from = 0 to = 45 Speed = 0.9
  TRG_BMX_Rider:Obj_MoveLeft dist = -300 Speed = 12
  TRG_BMX_Bike:Obj_MoveLeft dist = -300 Speed = 12
  TRG_BMX_Rider:Obj_PlayAnim Anim = OneFooter from = 46 Speed = 0.9
  TRG_BMX_Bike:Obj_PlayAnim Anim = BMX_OneFooter from = 46 Speed = 0.9
endscript
script ALF_AI_BMX_Rider
  Obj_SetBoundingSphere 500000
  Obj_GetId
   <objID>:CreateSpecialItem index = 0 Params = bmx_collision_details bone = pelvis
   <trickcounter> = 0
  TRG_BMX_Rider:Obj_ShadowOff
  TRG_BMX_Bike:Obj_ShadowOff
  TRG_BMX_Rider:Obj_PlayAnim Anim = Backflip to = 0
  TRG_BMX_Bike:Obj_PlayAnim Anim = BMX_Backflip to = 0
  Wait 0.5 Seconds
  begin
    SendFlag FLAG_TRICK_OVER Name = TRG_BMX_Checker
    ALF_Play_BMX_Anim_Over1_1
    Obj_WaitAnimFinished
    TRG_BMX_Rider:Obj_Rotate relative = (0, 180, 0)
    TRG_BMX_Bike:Obj_Rotate relative = (0, 180, 0)
    SendFlag FLAG_SWITCH_SIDES Name = TRG_BMX_Checker
    ALF_Play_BMX_Anim_Over1_1
    Obj_WaitAnimFinished
    TRG_BMX_Rider:Obj_Rotate relative = (0, 180, 0)
    TRG_BMX_Bike:Obj_Rotate relative = (0, 180, 0)
    SendFlag FLAG_SWITCH_SIDES Name = TRG_BMX_Checker
    GoalManager_GetNumberCollected Name = kon_goal_counter
    if ( <number_collected> = 3 )
      break
    endif
  repeat
  Create_Panel_Block ID = cab_challenge Text = "You go low!" panel_message_MG_2
  Create Prefix = "TRG_Cab_LipArrow"
  PlayStream rick_kon_goal_counter_midsuccess02
  begin
    ClearFlag FLAG_TRICK_OVER Name = TRG_BMX_Checker
    random( @
    ALF_Play_BMX_Anim_Under1_1
    @ALF_Play_BMX_Anim_Under2_1
     ) 
    Obj_WaitAnimFinished
    TRG_BMX_Rider:Obj_Rotate relative = (0, 180, 0)
    TRG_BMX_Bike:Obj_Rotate relative = (0, 180, 0)
    SendFlag FLAG_SWITCH_SIDES Name = TRG_BMX_Checker
    random( @
    ALF_Play_BMX_Anim_Under1_2
    @ALF_Play_BMX_Anim_Under2_2
     ) 
    Obj_WaitAnimFinished
    TRG_BMX_Rider:Obj_Rotate relative = (0, 180, 0)
    TRG_BMX_Bike:Obj_Rotate relative = (0, 180, 0)
    SendFlag FLAG_SWITCH_SIDES Name = TRG_BMX_Checker
    GoalManager_GetNumberCollected Name = kon_goal_counter
    if ( <number_collected> = 6 )
      break
    endif
  repeat
  Create_Panel_Block ID = cab_challenge Text = "You go High!" panel_message_MG_2
  Kill Prefix = "TRG_Cab_LipArrow"
  PlayStream rick_kon_goal_counter_midsuccess01
  begin
    SendFlag FLAG_TRICK_OVER Name = TRG_BMX_Checker
    ALF_Play_BMX_Anim_Over1_1
    Obj_WaitAnimFinished
    TRG_BMX_Rider:Obj_Rotate relative = (0, 180, 0)
    TRG_BMX_Bike:Obj_Rotate relative = (0, 180, 0)
    SendFlag FLAG_SWITCH_SIDES Name = TRG_BMX_Checker
    ALF_Play_BMX_Anim_Over1_1
    Obj_WaitAnimFinished
    TRG_BMX_Rider:Obj_Rotate relative = (0, 180, 0)
    TRG_BMX_Bike:Obj_Rotate relative = (0, 180, 0)
    SendFlag FLAG_SWITCH_SIDES Name = TRG_BMX_Checker
    GoalManager_GetNumberCollected Name = kon_goal_counter
    if ( <number_collected> = 9 )
      break
    endif
  repeat
  Create_Panel_Block ID = cab_challenge Text = "You go low!" panel_message_MG_2
  Create Prefix = "TRG_Cab_LipArrow"
  PlayStream rick_kon_goal_counter_midsuccess02
  begin
    ClearFlag FLAG_TRICK_OVER Name = TRG_BMX_Checker
    random( @
    ALF_Play_BMX_Anim_Under1_1
    @ALF_Play_BMX_Anim_Under2_1
     ) 
    Obj_WaitAnimFinished
    TRG_BMX_Rider:Obj_Rotate relative = (0, 180, 0)
    TRG_BMX_Bike:Obj_Rotate relative = (0, 180, 0)
    SendFlag FLAG_SWITCH_SIDES Name = TRG_BMX_Checker
    random( @
    ALF_Play_BMX_Anim_Under1_2
    @ALF_Play_BMX_Anim_Under2_2
     ) 
    Obj_WaitAnimFinished
    TRG_BMX_Rider:Obj_Rotate relative = (0, 180, 0)
    TRG_BMX_Bike:Obj_Rotate relative = (0, 180, 0)
    SendFlag FLAG_SWITCH_SIDES Name = TRG_BMX_Checker
  repeat
endscript
script BMX_Trick_Manager
  GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t1 \k1"
  Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
  Create_Panel_Block ID = cab_challenge Text = "Go high!" panel_message_MG_2
  Kill Prefix = "TRG_Cab_LipArrow"
  PlayStream rick_kon_goal_counter_midsuccess01
  begin
    GoalManager_GetNumberCollected Name = kon_goal_counter
     <temptext> = <TrickText>
    switch <number_collected>
    case 1
      GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t2 \k2"
      if not ( <temptext> = <TrickText> )
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    case 2
      GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t3 \k3"
      if not ( <temptext> = <TrickText> )
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    case 3
      GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t4 \k4"
      if not ( <temptext> = <TrickText> )
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    case 4
      GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t5 \k5"
      if not ( <temptext> = <TrickText> )
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    case 5
      GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t6 \k6"
      if not ( <temptext> = <TrickText> )
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    case 6
      GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t7 \k7"
      if not ( <temptext> = <TrickText> )
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    case 7
      GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t8 \k8"
      if not ( <temptext> = <TrickText> )
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    case 8
      GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t9 \k9"
      if not ( <temptext> = <TrickText> )
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    case 9
      GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t10 \k10"
      if not ( <temptext> = <TrickText> )
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    case 10
      GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t11 \k11"
      if not ( <temptext> = <TrickText> )
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    case 11
      GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t12 \k12"
      if not ( <temptext> = <TrickText> )
        Create_Panel_Block ID = current_goal Text = <TrickText> Style = panel_message_goal
      endif
    default
    endswitch
    Wait 1 frame
  repeat
endscript
script ALF_AI_BMX_Bike
  Obj_SetBoundingSphere 500000
endscript
script BMX_Checker
  begin
    begin
      if Obj_FlagSet FLAG_TRICK_NOW
        if Obj_FlagSet FLAG_TRICK_OVER
          if not IsAlive Name = TRGP_CAB_StallGap2_1
            Create Prefix = "TRGP_CAB_StallGap2_"
          endif
        endif
      else
        Kill Prefix = "TRGP_CAB_"
      endif
      Wait 1 frame
      if Obj_FlagSet FLAG_SWITCH_SIDES
        Obj_ClearFlag FLAG_SWITCH_SIDES
        Kill Prefix = "TRGP_CAB_"
        break
      endif
    repeat
    begin
      if Obj_FlagSet FLAG_TRICK_NOW
        if Obj_FlagSet FLAG_TRICK_OVER
          if not IsAlive Name = TRGP_CAB_StallGap1_1
            Create Prefix = "TRGP_CAB_StallGap1_"
          endif
        endif
      else
        Kill Prefix = "TRGP_CAB_"
      endif
      Wait 1 frame
      if Obj_FlagSet FLAG_SWITCH_SIDES
        Obj_ClearFlag FLAG_SWITCH_SIDES
        Kill Prefix = "TRGP_CAB_"
        break
      endif
    repeat
    Wait 1 frame
  repeat
endscript
script Cab_Challenge_LipRails
  if TriggerType [ TRIGGER_LIP_ON ]
    if not IsAlive Name = <dummy>
      Create Name = <dummy>
    endif
  else
    Kill Name = <dummy>
  endif
endscript
script Cab_Challenge_Dummyscript
  begin
    if Obj_ObjectInRadius radius = 5 Name = TRG_BMX_Checker
      Printf "Give Lip trick"
      GoalManager_GetNumberCollected Name = kon_goal_counter
      switch <number_collected>
      case 3
        GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t4"
        Skater:ALF_GetGap_Wait Score = 1000 Text = "Lip Under" TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
      case 4
        GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t5"
        Skater:ALF_GetGap_Wait Score = 1000 Text = "Lip Under" TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
      case 5
        GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t6"
        Skater:ALF_GetGap_Wait Score = 1000 Text = "Lip Under" TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
      case 9
        GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t10"
        Skater:ALF_GetGap_Wait Score = 1000 Text = "Lip Under" TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
      case 10
        GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t11"
        Skater:ALF_GetGap_Wait Score = 1000 Text = "Lip Under" TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
      case 11
        GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t12"
        Skater:ALF_GetGap_Wait Score = 1000 Text = "Lip Under" TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
      endswitch
      Die
    endif
    Wait 1 frame
  repeat
endscript
script ALF_GetGap_Wait
  StartGap GapID = GetGap_DefaultID Flags = <Flags> TrickText = <TrickText> TrickScript = <TrickScript>
  Wait 45 Frames
  EndGap GapID = GetGap_DefaultID Score = <Score> Text = <Text> GapScript = <GapScript>
endscript
script Cab_LipTrick
endscript
script Cab_Gap
  GoalManager_GetNumberCollected Name = kon_goal_counter
  switch <number_collected>
  case 0
    GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t1"
    StartGap GapID = CabAir Flags = [ PURE_AIR ] TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
  case 1
    Printf "case fucking 1"
    GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t2"
    StartGap GapID = CabAir Flags = [ PURE_AIR ] TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
  case 2
    GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t3"
    StartGap GapID = CabAir Flags = [ PURE_AIR ] TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
  case 6
    GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t7"
    StartGap GapID = CabAir Flags = [ PURE_AIR ] TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
  case 7
    Printf "case fucking 1"
    GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t8"
    StartGap GapID = CabAir Flags = [ PURE_AIR ] TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
  case 8
    GoalManager_ReplaceTrickText Name = kon_goal_counter Text = "\t9"
    StartGap GapID = CabAir Flags = [ PURE_AIR ] TrickText = <TrickText> TrickScript = Cab_Challenge_Got_Counter_Object
  endswitch
endscript
script Cab_Challenge_Got_Counter_Object
  GoalManager_GotCounterObject Name = kon_goal_counter
  Printf "give it to me fucker"
endscript
script Kon_StartGap_Rail2Rail
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_Rail2Rail
  EndGap GapID = <ID1> Text = "Rail 2 Rail" Score = 25
endscript
script Kon_StartGap_Rail2Ledge
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_Rail2Ledge
  EndGap GapID = <ID1> Text = "Rail 2 Ledge" Score = 25
endscript
script Kon_StartGap_Ledge2Rail
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_Ledge2Rail
  EndGap GapID = <ID1> Text = "Ledge 2 Rail" Score = 25
endscript
script Kon_StartGap_Ledge2Ledge
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_Ledge2Ledge
  EndGap GapID = <ID1> Text = "Ledge 2 Ledge" Score = 25
endscript
script Kon_StartGap_CrustyGrinds
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_CrustyGrinds
  EndGap GapID = <ID1> Text = "Crusty Connections" Score = 25
endscript
script Kon_StartGap_Robot
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_Robot
  EndGap GapID = <ID1> Text = "Robot Line Gaps!" Score = 25
endscript
script Kon_StartGap_LedgeLip
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_LedgeLip
  EndGap GapID = <ID1> Text = "Ledge 2 Lip" Score = 25
endscript
script Kon_StartGap_HighWire
  StartGap GapID = <ID1>
endscript
script Kon_EndGap_HighWire
  EndGap GapID = <ID1> Text = "Highwire Act" Score = 50
endscript
script Kon_StartGap_BigGray
  StartGap GapID = BigGray01
  Printf "CR---CR---CR---FIRED START GAP FOR BIG GRAY!"
endscript
script Kon_EndGap_BigGray
  if TriggerType [ TRIGGER_LIP_ON ]
    EndGap GapID = BigGray01 Text = "Big Block Extension" Score = 25
  endif
endscript
script Kon_StartGap_LampLip
  StartGap GapID = LampLip
endscript
script Kon_EndGap_LampLip
  if TriggerType [ TRIGGER_LIP_ON ]
    EndGap GapID = LampLip Text = "Lamp Extension" Score = 50
  endif
endscript
script Kon_StartGap_TCLip
  StartGap GapID = TCLip
endscript
script Kon_EndGap_TCLip
  if TriggerType [ TRIGGER_LIP_ON ]
    EndGap GapID = TCLip Text = "TC's Fat Lip" Score = 25
  endif
endscript
script Kon_StartGap_Way
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_Way
  EndGap GapID = <ID1> Text = "Way Transfer" Score = 50
endscript
script Kon_StartGap_Crusty
  StartGap GapID = Crusty Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_Crusty
  EndGap GapID = Crusty Text = "The Crusty Transfer!" Score = 50
endscript
script Kon_StartGap_WildMan
  StartGap GapID = WildMan Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_WildMan
  EndGap GapID = WildMan Text = "Wild Man's Bomb Drop" Score = 25
endscript
script Kon_StartGap_TCDeck
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_TCDeck
  EndGap GapID = <ID1> Text = "TC's Deck Gap" Score = 50
endscript
script Kon_EndGap_Channel05
  EndGap GapID = <ID1> Text = "Double Wedge!" Score = 100
endscript
script Kon_StartGap_SnakeJump
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_SnakeJump
  EndGap GapID = <ID1> Text = "Sidestep the Snake" Score = 25
endscript
script Kon_StartGap_TenPoint
  StartGap GapID = TenPoint Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_TenPoint
  EndGap GapID = TenPoint Text = "10 Point Landing!!" Score = 100
endscript
script Kon_StartGap_SnakeAll
  StartGap GapID = SnakeAll Flags = [ PURE_RAIL ]
endscript
script Kon_EndGap_SnakeAll
  EndGap GapID = SnakeAll Text = "Snake - Head 2 Tail!" Score = 100
endscript
script Kon_StartGap_Rail2KidLip
  StartGap GapID = Rail2KidLip Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_Rail2KidLip
  EndGap GapID = Rail2KidLip Text = "Redline 2 Kidney Coping!" Score = 50
endscript
script Kon_StartGap_TearDrop
  StartGap GapID = <ID1> Flags = [ PURE_AIR ]
endscript
script Kon_EndGap_TearDrop
  EndGap GapID = <ID1> Text = "Tear Drop Hop" Score = 25
endscript
script Kon_StartGap_SnakeManual
  if TriggerType [ TRIGGER_LAND_ON TRIGGER_SKATE_ONTO ]
    StartGap GapID = SnakeManualStart Flags = [ PURE_MANUAL ]
    Printf "CR---CR---CR---Fired Start Gap SnakeManual"
  endif
endscript
script Kon_EndGap_SnakeManual_Turn01
  if TriggerType [ TRIGGER_SKATE_ONTO ]
    EndGap GapID = SnakeManualStart Text = "Blue Line Turn 1" Score = 25 Continue = { GapID = SnakeManualTurn01 Flags = [ PURE_MANUAL ] }
    Printf "CR---CR---CR---Fired Turn 1 gap stuff"
  endif
endscript
script Kon_EndGap_SnakeManual_Turn02
  EndGap GapID = SnakeManualTurn01 Text = "Blue Line Turn 2!" Score = 50 Continue = { GapID = SnakeManualTurn02 Flags = [ PURE_MANUAL ] }
endscript
script Kon_EndGap_SnakeManual_Turn03
  EndGap GapID = SnakeManualTurn02 Text = "Blue Line Turn 3!!" Score = 75 Continue = { GapID = SnakeManualEnd Flags = [ PURE_MANUAL ] }
endscript
script Kon_EndGap_SnakeManual_End
  EndGap GapID = SnakeManualEnd Text = "2 Wheelin' the Blue Line!!!" Score = 100
endscript
script Kon_EndGap_SnakeManual_Lose
  EndGap GapID = SnakeManualStart
  EndGap GapID = SnakeManualTurn01
  EndGap GapID = SnakeManualTurn02
  EndGap GapID = SnakeManualTurn03
  EndGap GapID = SnakeManualEnd
endscript
script Kon_StartGap_LongPad
  StartGap GapID = <ID1> Flags = [ PURE_MANUAL ]
endscript
script Kon_EndGap_LongPad
  EndGap GapID = <ID1> Text = "The Long Pad Manual" Score = 25
endscript
script Kon_Spectator
  if ( <Sex> = Male )
    begin
      random( @
      Obj_PlayAnim Anim = Ped_M_Cheering
      @Obj_PlayAnim Anim = Ped_M_ThumbUp
      @Obj_PlayAnim Anim = Ped_M_Clap
       ) 
      Obj_LookAtObject Type = Skater time = 0.3
      Obj_WaitAnimFinished
    repeat
  else
    if ( <Sex> = Female )
      begin
        random( @
        Obj_PlayAnim Anim = Ped_F_Wave
        @Obj_PlayAnim Anim = Ped_F_Talk3
        @Obj_PlayAnim Anim = Ped_F_Talk1
         ) 
        Obj_LookAtObject Type = Skater time = 0.3
        Obj_WaitAnimFinished
      repeat
    endif
  endif
endscript
script Kon_Shop_RoofTop_Kill
  Sk3_Killskater Message1 = "Off the Roof!!!" Message2 = "Off the Roof!!!" Message3 = "Off the Roof!!!" Message4 = "Off the Roof!!!" DeathSound = HitBody02
endscript
