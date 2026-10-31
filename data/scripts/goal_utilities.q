
points_to_pro_challenge = 90
generic_pro_name = "peds/PedPros/PedPro_Neversoft/PedPro_Neversoft.skin"
generic_pro_first_name = "Neversoft"
generic_pro_full_name = "Neversoft Skater"

script goal_start
  ResetScore
  KillAllTextureSplats
  destroy_goal_panel_messages
  KillSpawnedScript name = goal_wait_and_kill_trigger
  KillSpawnedScript name = goal_wait_and_show_key_combo_text
  GoalManager_GetGoalParams name = <goal_id>
  if not IsAlive name = <trigger_obj_id>
    GoalManager_EditGoal name = <goal_id> params = { force_create_trigger = 1 }
    GoalManager_InitializeGoal name = <goal_id>
    GoalManager_EditGoal name = <goal_id> params = { force_create_trigger = 0 }
    GoalManager_GetGoalParams name = <goal_id>
  endif
  if InNetGame
    if InTeamGame
      GoalManager_AnnounceGoalStarted name = <goal_id>
    endif
  endif
   <trigger_obj_id>:Obj_ClearExceptions
  if GotParam custom_score_record
    GoalManager_EditGoal name = <goal_id> params = { custom_score_record = 0 }
  endif
  if ObjectExists id = goal_start_dialog
    speech_box_exit anchor_id = goal_start_dialog
  endif
  if ObjectExists id = goal_retry_anchor
    DestroyScreenElement id = goal_retry_anchor
  endif
  FormatText ChecksumName = arrow_id "%s_ped_arrow" s = <goal_name>
  if ScreenElementExists id = <arrow_id>
    DestroyScreenElement id = <arrow_id>
  endif
  KillSpawnedScript name = goal_init_after_end_of_run
  GetSkaterID
  KillSkaterCamAnim skaterId = <ObjId> all
  GoalManager_HideGoalPoints
  GoalManager_GetGoalParams name = <goal_id>
  MakeSkaterGoto SkaterInit
  if GotParam quick_start
    ResetSkaters node_name = <restart_node>
    Debounce x time = 0.3
  else
    if GotParam intro_node
      ResetSkaters node_name = <intro_node>
    else
      ResetSkaters node_name = <restart_node>
    endif
  endif
  if GotParam goal_intro_script
     <goal_intro_script> <goal_intro_script_params>
  endif
  GoalManager_GetGoalParams name = <goal_id>
  if not GoalManager_HasSeenGoal name = <goal_id>
    create_panel_message id = new_goal_message text = "New Goal" style = panel_message_new_goal
    create_panel_sprite id = new_goal_sprite texture = GO_new style = panel_sprite_new_goal
  endif
  if GotParam geo_prefix
    Create Prefix = <geo_prefix>
    FormatText TextName = geo_trigger_prefix "TRG_%p" p = <geo_prefix>
    Create Prefix = <geo_trigger_prefix>
    GoalManager_GetProsetNotPrefix <geo_prefix>
    Kill Prefix = <proset_not_prefix>
    FormatText TextName = geo_not_trigger_prefix "TRG_%p" p = <proset_not_prefix>
    Kill Prefix = <geo_not_trigger_prefix>
  endif
  if not InNetGame
    goal_create_proset_geom <...>
  endif
  SetScoreAccumulation 1
  SetScoreDegradation 1
  if GotParam trigger_prefix
    Create Prefix = <trigger_prefix>
  endif
  if GotParam quick_start
    StartRecordingAfresh
    if GotParam use_hud_counter
      goal_create_counter goal_id = <goal_id> hud_counter_caption = <hud_counter_caption>
    endif
    create_panel_block id = current_goal text = <goal_text> style = panel_message_goal
    if GotParam key_combo_text
      SpawnScript goal_wait_and_show_key_combo_text params = { text = <key_combo_text> }
    endif
    if GotParam Goal_Start_Script
       <Goal_Start_Script> <goal_start_script_params>
    endif
    if not GoalManager_HasWonGoal name = <goal_id>
      SpawnScript goal_show_tips params = { goal_id = <goal_id> }
    endif
    goal_pro_stop_anim_scripts <...>
    if not GotParam trigger_wait_script
       <trigger_wait_script> = GenericProWaiting
    endif
    RunScriptOnObject id = <trigger_obj_id> <trigger_wait_script> params = { type = "midgoal" goal_id = <goal_id> pro = <pro> }
  else
    goal_pro_stop_anim_scripts <...>
    if GotParam goal_start_trigger_script
      RunScriptOnObject id = <trigger_obj_id> <goal_start_trigger_script> params = { goal_id = <goal_id> type = "talking" pro = <pro> }
    else
      RunScriptOnObject id = <trigger_obj_id> GenericProTalking params = { goal_id = <goal_id> type = "talking" pro = <pro> }
    endif
    GetValueFromVolume cdvol
    if not InNetGame
      if ( <value> > 0 )
         <volume> = <value>
        SetMusicVolume 20
      endif
    endif
    if not GotParam trigger_wait_script
       <trigger_wait_script> = GenericProWaiting
    endif
    if GotParam goal_start_movie_script
       <goal_start_movie_script> <goal_start_movie_script_params>
    endif
    if GotParam no_play_hold
       <no_play_hold> = no_play_hold
    endif
    if GotParam start_cam_anim
      SpawnScript goal_play_cam_anim id = new_goal_cam_anim params = { next_trigger_script = <trigger_wait_script>
        type = "midgoal"
        goal_id = <goal_id>
        Anim = <start_cam_anim>
         <no_play_hold>
        dont_unpause = <dont_unpause>
        volume = <volume>
      }
    else
      SpawnScript goal_play_cam_anim id = new_goal_cam_anim params = { next_trigger_script = <trigger_wait_script>
        type = "midgoal"
        goal_id = <goal_id>
        virtual_cam
         <no_play_hold>
        dont_unpause = <dont_unpause>
        volume = <volume>
      }
    endif
  endif
  if GotParam kill_radius
     <trigger_obj_id>:Obj_SetOuterRadius <kill_radius>
     <trigger_obj_id>:Obj_SetException ex = SkaterOutOfRadius scr = goal_crossed_kill_radius params = { goal_id = <goal_id> }
  endif
  RunScriptOnScreenElement id = the_time clock_morph
endscript

script goal_create_proset_geom
  if GotParam proset_prefix
    FormatText ChecksumName = proset_flag "FLAG_%pGEO_ON" p = <proset_prefix>
    SetFlag flag = <proset_flag>
    Create Prefix = <proset_prefix>
    FormatText TextName = proset_trigger_prefix "TRG_%p" p = <proset_prefix>
    Create Prefix = <proset_trigger_prefix>
    GoalManager_GetProsetNotPrefix <proset_prefix>
    Kill Prefix = <proset_not_prefix>
    FormatText TextName = proset_not_trigger_prefix "TRG_%p" p = <proset_not_prefix>
    Kill Prefix = <proset_not_trigger_prefix>
  endif
endscript

script goal_kill_proset_geom
  if not InNetGame
    if GotParam proset_prefix
      FormatText ChecksumName = proset_flag "FLAG_%pGEO_ON" p = <proset_prefix>
      UnSetFlag flag = <proset_flag>
      Kill Prefix = <proset_prefix>
      FormatText TextName = proset_trigger_prefix "TRG_%p" p = <proset_prefix>
      Kill Prefix = <proset_trigger_prefix>
      GoalManager_GetProsetNotPrefix <proset_prefix>
      Create Prefix = <proset_not_prefix>
      FormatText TextName = proset_not_trigger_prefix "TRG_%p" p = <proset_not_prefix>
      Create Prefix = <proset_not_trigger_prefix>
    endif
  endif
endscript

script goal_crossed_kill_radius
  create_panel_message id = goal_message text = "You left the goal area!" style = panel_message_generic_loss
  Obj_ClearException SkaterOutOfRadius
  GoalManager_LoseGoal name = <goal_id>
endscript

script goal_expire
  destroy_goal_panel_messages
  Printf "goal_expire"
  create_panel_message id = goal_message text = "Out of time!" style = panel_message_generic_loss
  if GoalManager_EndRunCalled name = <goal_id>
    if GoalManager_StartedEndOfRun name = <goal_id>
      SpawnSkaterScript goal_init_after_end_of_run params = { goal_id = <goal_id> }
    else
      GoalManager_ClearEndRun name = <goal_id>
    endif
  endif
endscript

script goal_success goal_text = "Default goal success text"
  Printf "goal_success"
  SwitchToReplayIdleMode
  destroy_goal_panel_messages
  goal_destroy_counter
  if not InMultiplayerGame
    SetButtonEventMappings block_menu_input
    GetSkaterID
     <ObjId>:DisablePlayerInput
    SetScreenElementProps {
      id = root_window
      event_handlers = [ { pad_start nullscript } ]
      replace_handlers
    }
    SpawnScript TemporarilyDisableInput params = { time = 100 }
    PauseSkaters
  endif
  GoalManager_GetGoalParams name = <goal_id>
  GetValueFromVolume cdvol
  if not InNetGame
    if ( <value> > 0 )
       <volume> = <value>
      SetMusicVolume 10
    endif
  endif
  if GotParam goal_outro_script
     <goal_outro_script> <goal_outro_script_params>
  endif
  if ObjectExists id = goal_message
    RunScriptOnScreenElement id = goal_message kill_panel_message
  endif
  goal_pro_stop_anim_scripts <...>
  if GotParam trigger_success_script
    RunScriptOnObject id = <trigger_obj_id> <trigger_success_script> params = { goal_id = <goal_id> pro = <pro> }
  else
    RunScriptOnObject id = <trigger_obj_id> GenericProSuccess params = { goal_id = <goal_id> pro = <pro> }
  endif
  if not GotParam trigger_wait_script
     <trigger_wait_script> = GenericProWaiting
  endif
  if GoalManager_HasWonGoal name = <goal_id>
     <already_beat_goal> = 1
  endif
  if not InMultiplayerGame
    if GotParam success_cam_anim
      SpawnScript goal_play_cam_anim params = { goal_id = <goal_id>
        Anim = <success_cam_anim>
        volume = <volume>
        just_won_goal = 1
        already_beat_goal = <already_beat_goal>
        gonna_show_message
      }
    else
      SpawnScript goal_play_cam_anim params = { goal_id = <goal_id>
        just_won_goal = 1
        already_beat_goal = <already_beat_goal>
        volume = <volume>
        virtual_cam
        gonna_show_message
      }
    endif
    GoalManager_PlayGoalWinStream name = <goal_id>
    SpawnScript goal_success_messages params = <...>
  endif
  if GotParam pro_specific_challenge
    PlayStream ProChallengeComplete vol = 150
    if ( <pro_challenge_pro_name> = "Custom" )
       <skater> = custom
    else
      FormatText ChecksumName = skater "%s" s = <pro_challenge_pro_name>
       <last_name> = ( goal_pro_last_names.<skater> )
      FormatText ChecksumName = skater "%s" s = <last_name>
    endif
    GoalManager_MarkProSpecificChallengeBeaten skater = <skater>
  else
  endif
endscript

script goal_success_messages
  Printf "goal_success_messages"
  if GotParam view_goals_text
    create_panel_block id = goal_complete text = <view_goals_text> style = panel_message_goalcomplete
  else
    create_panel_block id = goal_complete text = <goal_text> style = panel_message_goalcomplete
  endif
  create_panel_sprite id = goal_complete_sprite texture = GO_done style = panel_sprite_goalcomplete
  create_panel_message id = goal_complete_line2 text = "Complete!" style = panel_message_goalcompleteline2
endscript

script already_in_goal
  create_panel_message id = goal_message text = "Already in goal run" style = panel_message_goal
endscript

script goal_fail
  Printf "goal_fail"
  destroy_goal_panel_messages
  PlaySound GoalFail vol = 200
  GoalManager_GetGoalParams name = <goal_id>
  if GotParam goal_fail_script
     <goal_fail_script> <goal_fail_script_params>
  endif
  create_panel_sprite id = goalfail_sprite texture = GO_fail style = panel_sprite_goalfail
  create_panel_block dims = (640, 0) id = GoalFail text = <goal_text> style = panel_message_goalfail
  create_panel_message id = goalfailedline2 text = "Failed!" style = panel_message_goalfailline2
  if IsXBOX
    retry_text = "Press \b8 to retry goal"
  else
    retry_text = "Press START (\b8) to retry goal"
  endif
  create_speech_box {
    anchor_id = goal_retry_anchor
    text = <retry_text>
    style = goal_fail_retry_box_style
    no_pad_start
    no_pad_choose
    z_priority = 10
  }
endscript

script goal_fail_retry_box_style
  Wait 4000
  Die
endscript

script goal_deactivate
  Printf "goal_deactivate"
  KillAllTextureSplats
  KillSpawnedScript name = goal_wait_and_kill_trigger
  KillSpawnedScript name = goal_show_tips
  KillSpawnedScript name = goal_wait_and_show_key_combo_text
  goal_destroy_counter
  if GoalManager_EndRunCalled name = <goal_id>
    if GoalManager_StartedEndOfRun name = <goal_id>
      SpawnSkaterScript goal_init_after_end_of_run params = { goal_id = <goal_id> }
    else
      GoalManager_ClearEndRun name = <goal_id>
    endif
  endif
  SetScoreAccumulation 0
  SetScoreDegradation 0
  GoalManager_GetGoalParams name = <goal_id>
  if GotParam goal_intro_script
    KillSpawnedScript name = goal_intro_script
  endif
  if GotParam Goal_Deactivate_Script
     <Goal_Deactivate_Script> <goal_deactivate_script_params>
  endif
  KillSpawnedScript name = goal_description_and_speech
  KillSpawnedScript name = goal_wait_for_cam_anim
  if ObjectExists id = current_goal
    DestroyScreenElement id = current_goal
  endif
  if ObjectExists id = current_goal_description
    DestroyScreenElement id = current_goal_description
  endif
  if not GotParam quick_start
    if not GotParam just_won_goal
      goal_pro_stop_anim_scripts <...>
      if GotParam trigger_wait_script
        RunScriptOnObject id = <trigger_obj_id> <trigger_wait_script> params = { goal_id = <goal_id> pro = <pro> }
      else
        RunScriptOnObject id = <trigger_obj_id> GenericProWaiting params = { goal_id = <goal_id> type = "wait" pro = <pro> }
      endif
    endif
  endif
  if GotParam geo_prefix
    Kill Prefix = <geo_prefix>
    FormatText TextName = geo_trigger_prefix "TRG_%p" p = <geo_prefix>
    Kill Prefix = <geo_trigger_prefix>
    GoalManager_GetProsetNotPrefix <geo_prefix>
    Create Prefix = <proset_not_prefix>
    FormatText TextName = geo_not_trigger_prefix "TRG_%p" p = <proset_not_prefix>
    Create Prefix = <geo_not_trigger_prefix>
  endif
  if GotParam trigger_prefix
    Kill Prefix = <trigger_prefix>
  endif
  if not GotParam quick_start
    GoalManager_ShowGoalPoints
    if not IsTrue ALWAYSPLAYMUSIC
      if not GoalManager_HasWonGoal name = <goal_id>
        PauseMusic 0
      endif
    endif
  endif
  if not GotParam just_won_goal
    if not GotParam quick_start
      if not GoalManager_HasWonGoal name = <goal_id>
        goal_add_ped_arrow goal_id = <goal_id>
      endif
    endif
  endif
  if GoalManager_HasWonGoal name = <goal_id>
    if not GotParam quick_start
      if GotParam just_won_goal
        SpawnScript goal_wait_and_kill_trigger params = { trigger_obj_id = <trigger_obj_id> }
      else
        Kill name = <trigger_obj_id>
      endif
    endif
  else
    if GotParam pro_specific_challenge
      if not GotParam just_won_goal
        GetCurrentSkaterProfileIndex
        GetSkaterProfileInfo player = <currentSkaterProfileIndex>
        FormatText ChecksumName = pro_name_checksum "%s" s = <pro_challenge_pro_name>
         <last_name_test> = ( goal_pro_last_name_checksums.<pro_name_checksum> )
        if GotParam last_name_test
          if not ( <last_name_test> = <name> )
            Kill name = <trigger_obj_id>
          endif
        endif
      endif
    endif
  endif
endscript

script goal_wait_and_kill_trigger
  GetSkaterID
  Wait 2 gameframe
  begin
    if SkaterCamAnimFinished skaterId = <ObjId> name = <success_cam_anim>
      Kill name = <trigger_obj_id>
      break
    endif
    Wait 1 gameframe
  repeat
endscript

script SetCurrentGoal
  Obj_VarSet var = 0 value = <value>
endscript

script RetryCurrentGoal
  if GoalManager_CanRetryGoal
    if GoalManager_GetLastGoalId
      if InNetGame
        if GoalManager_HasWonGoal name = <goal_id>
          return
        endif
      endif
      goal_check_for_required_tricks goal_id = <goal_id>
      if ( <found_unmapped_trick> = 1 )
        return
      endif
    endif
    GoalManager_DeactivateAllGoals
    GoalManager_RestartLastGoal
  else
    create_panel_message id = goal_message text = "No Goal to retry" style = panel_message_goal
  endif
endscript

script goal_retry_stage
endscript

script end_current_goal_run
  Wait 1 gameframe
  if ObjectExists id = goal_message
    RunScriptOnScreenElement id = goal_message kill_panel_message
  endif
  if GoalManager_HasActiveGoals
    GoalManager_DeactivateCurrentGoal
  endif
endscript

script goal_play_cam_anim
  Printf "goal_play_cam_anim"
  GoalManager_PauseAllGoals
  GoalManager_GetGoalParams name = <goal_id>
  skater:DisablePlayerInput
  GoalManager_SetCanStartGoal 0
   <trigger_obj_id>:Obj_LookAtObject type = skater AngleThreshold = 15 speed = 50600 time = 0
  pause_trick_text
  SetButtonEventMappings block_menu_input
  GetSkaterID
   <ObjId>:DisablePlayerInput
  SetScreenElementProps {
    id = root_window
    event_handlers = [ { pad_start nullscript } ]
    replace_handlers
  }
  If GotParam goal_start_movie_script // This is mainly for the Free Stompy Goal cause I could not find a way to skip the cutscenes before they start playing, so this works as a buffer till the first camera activates.
    SpawnScript TemporarilyDisableInput params = { time = 2000 }
    else
    SpawnScript TemporarilyDisableInput
  endif
  if GotParam just_won_goal
    skater:Obj_SetFlag FLAG_SKATER_INGOALINIT
    PauseSkaters
    if not GotParam dont_hide_skater
      skater:RemoveSkaterFromWorld
    endif
  endif
  GetSkaterID
   <skaterId> = <ObjId>
  if GotParam virtual_cam
     <Anim> = <goal_id>
     <trigger_obj_id>:Obj_GetId
     <targetId> = <ObjId>
    if GotParam no_play_hold
      PlaySkaterCamAnim { name = <Anim>
        skaterId = <skaterId>
        targetId = <targetId>
        targetOffset = (0, 47, 0)
        positionOffset = (10, 11, 75)
        frames = 120
        skippable = 0
        virtual_cam
      }
    else
      PlaySkaterCamAnim { name = <Anim>
        skaterId = <skaterId>
        targetId = <targetId>
        targetOffset = (0, 47, 0)
        positionOffset = (10, 11, 75)
        frames = 120
        play_hold
        skippable = 0
        virtual_cam
      }
    endif
  else
    if GotParam no_play_hold
      PlaySkaterCamAnim skaterId = <skaterId> name = <Anim> skippable = 0
    else
      PlaySkaterCamAnim skaterId = <skaterId> name = <Anim> play_hold skippable = 0
    endif
  endif
  if GotParam just_won_goal
    if not GotParam pro_specific_challenge
      PlaySound GoalGood vol = 200
    endif
    if GotParam success_movie_wait_frames
      Wait <success_movie_wait_frames> gameframe
    endif
    root_window:SetTags giving_rewards = 1
    if GotParam reward_params
      if not InNetGame
        if GotParam pro_specific_challenge
           <show_movie> = 1
          GetArraySize movie_info
           <index> = 0
          begin
            if ( ( ( movie_info [ <index> ] ).first_name ) = <pro_challenge_pro_name> )
               <movie_file> = ( ( movie_info [ <index> ] ).file )
              SetGlobalFlag flag = ( ( movie_info [ <index> ] ).flag )
              break
            endif
             <index> = ( <index> + 1 )
          repeat <array_size>
        else
           <show_movie> = 0
        endif
        if GotParam gonna_show_message
          goal_give_rewards {
             <reward_params>
            gonna_show_message
            show_movie = <show_movie>
            pro_challenge_pro_name = <pro_challenge_pro_name>
            volume = <volume>
          }
        else
          goal_give_rewards {
             <reward_params>
            show_movie = <show_movie>
            pro_challenge_pro_name = <pro_challenge_pro_name>
            volume = <volume>
          }
        endif
      endif
      KillSkaterCamAnim skaterId = <skaterId> all
    else
      if GotParam set_new_record
        create_panel_message {
          id = goal_new_record
          text = "You set a new record!"
          style = panel_message_new_record
        }
      endif
      create_speech_box {
        text = "Press \m0 to continue"
        pad_choose_script = goal_description_and_speech_continue
        pad_choose_params = { anim = <anim> }
      }
    endif
  else
    if not GotParam pro_specific_challenge
      SetSkaterCamAnimSkippable skaterId = <skaterId> name = <Anim> skippable = 1
    endif
  endif
  if not GotParam just_won_goal
    MakeSkaterGoto Skater_GoalInit
    KillSpawnedScript name = goal_description_and_speech
    KillSpawnedScript name = goal_description_and_speech2
    SpawnScript goal_description_and_speech params = <...>
    Wait 1 gameframe
  endif
  Wait 1 gameframe
  begin
    pause_trick_text
    if SkaterCamAnimFinished skaterId = <skaterId> name = <Anim>
      skater:EnablePlayerInput
      if GotParam just_won_goal
        skater:Obj_ClearFlag FLAG_SKATER_INGOALINIT
        if not GotParam dont_hide_skater
          skater:AddSkaterToWorld
        endif
      endif
      if not GotParam just_won_goal
        if GotParam use_hud_counter
          goal_create_counter goal_id = <goal_id> hud_counter_caption = <hud_counter_caption>
        endif
      endif
      if not GotParam dont_unpause
        GoalManager_UnPauseAllGoals
      endif
      GoalManager_SetCanStartGoal
      if GotParam just_won_goal
        root_window:SetTags giving_rewards = 0
        KillSpawnedScript name = goal_success_messages
        if ObjectExists id = goal_complete_sprite
          DestroyScreenElement id = goal_complete_sprite
        endif
        if ObjectExists id = goal_complete
          DestroyScreenElement id = goal_complete
        endif
        if ObjectExists id = goal_complete_line2
          DestroyScreenElement id = goal_complete_line2
        endif
        if ObjectExists id = goal_new_record
          DestroyScreenElement id = goal_new_record
        endif
      else
        MakeSkaterGoto SkaterInit
        ResetSkaters node_name = <restart_node>
        if GotParam Goal_Start_Script
           <Goal_Start_Script> <goal_start_script_params>
        endif
      endif
      if not GotParam just_won_goal
        if IsAlive name = <trigger_obj_id>
           <trigger_obj_id>:Obj_StopStream
        endif
      endif
      PauseMusic 0
      if GotParam volume
        SetMusicVolume ( <volume> * 10 )
      endif
      if ObjectExists id = speech_box_anchor
        DestroyScreenElement id = speech_box_anchor
      endif
      if GotParam just_won_goal
        SpawnScript PauseThenStartRecording
      else
        StartRecordingAfresh
      endif
      break
    endif
    Wait 5 once_per_frame
    Debounce x time = 0.3
  repeat
  UnPauseSkaters
  unpause_trick_text
  if IsAlive name = <trigger_obj_id>
     <trigger_obj_id>:Obj_StopStream
  endif
  if IsAlive name = <trigger_obj_id>
    if GotParam next_trigger_script
      goal_pro_stop_anim_scripts <...>
      RunScriptOnObject id = <trigger_obj_id> <next_trigger_script> params = { type = <type> goal_id = <goal_id> pro = <pro> }
      GoalManager_EditGoal name = <goal_id> params = { current_trigger_script = <UniqueID> }
    endif
  endif
  if GotParam just_won_goal
    if IsAlive name = <trigger_obj_id>
      Kill name = <trigger_obj_id>
    endif
    if GotParam goal_success_script
       <goal_success_script> <goal_success_params>
    endif
  endif
  restore_start_key_binding
  FireEvent type = goal_cam_anim_done
  if GotParam show_movie
    if ( <show_movie> = 1 )
      if GotParam movie_file
        ingame_play_movie <movie_file>
      endif
    endif
  endif
endscript

script PauseThenStartRecording
  Wait 2 seconds
  StartRecordingAfresh
endscript

script TemporarilyDisableInput time = 1500
  SetButtonEventMappings block_menu_input
  GetSkaterID
   <ObjId>:DisablePlayerInput
  Wait <time>
  SetButtonEventMappings unblock_menu_input
   <ObjId>:EnablePlayerInput
endscript
script goal_wait_and_show_key_combo_text
  WaitForEvent type = panel_message_goal_done2
  SetScreenElementLock id = current_goal On
  SetScreenElementLock id = current_goal off
  GetScreenElementDims id = current_goal
  CreateScreenElement {
    type = TextBlockElement
    parent = current_goal
    dims = (300, 0)
    allow_expansion
    font = small
    scale = 1
    rgba = [ 128 128 128 110 ]
    text = <text>
    pos = ( (120, 0) + ( (0, 1) * <height> / 0.78 ) )
    just = [ center top ]
    internal_just = [ center top ]
  }
endscript

script goal_description_and_speech
  if ObjectExists id = current_goal
    DestroyScreenElement id = current_goal
  endif
  SpawnScript goal_wait_for_cam_anim params = <...>
  if GotParam pro_specific_challenge
    PauseGame
    create_pro_challenge_menu goal_id = <goal_id>
    WaitForEvent type = pro_challenge_menu_done
    UnPauseGame
    SetSkaterCamAnimSkippable skaterId = <skaterId> name = <Anim> skippable = 1
  endif
   <pro_name_text> = ""
  if GotParam full_name
    FormatText TextName = pro_name_text "\c7%s :\c0\n" s = <full_name>
  else
    if GotParam pro
      FormatText ChecksumName = pro_checksum "%s" s = <pro>
      if StructureContains structure = goal_pro_last_names <pro_checksum>
         <pro_last_name> = ( goal_pro_last_names.<pro_checksum> )
        FormatText TextName = pro_name_text "\c7%s %l :\c0\n" s = <pro> l = <pro_last_name>
      endif
    endif
  endif
  if IsArray <goal_description>
    GetArraySize <goal_description>
     <index> = 0
    begin
      FormatText TextName = pro_name_text "%s%n" s = <pro_name_text> n = ( <goal_description> [ <index> ] )
       <index> = ( <index> + 1 )
    repeat <array_size>
  else
    FormatText TextName = pro_name_text "%s%n" s = <pro_name_text> n = <goal_description>
  endif
  FormatText TextName = pro_name_text "%s\nPress \d3 to continue." s = <pro_name_text>
  if not GotParam just_won_goal
    if GotParam goal_description
      GetSkaterID
      if not SkaterCamAnimFinished skaterId = <ObjId> name = <Anim>
        if ObjectExists id = speech_box_anchor
          DestroyScreenElement id = speech_box_anchor
        endif
        create_speech_box {
          anchor_id = goal_description_anchor
          text = <pro_name_text>
          style = speech_box_style
          bg_x_scale = 1.3
          pad_choose_script = goal_description_and_speech_continue
          pad_choose_params = { Anim = <Anim> }
        }
        goal_description_anchor:SetTags Anim = <Anim>
        AssignAlias id = goal_description_anchor alias = current_goal_description
        Wait 60 frame
        if not SkaterCamAnimFinished skaterId = <ObjId> name = <Anim>
          GoalManager_PlayGoalStartStream name = <goal_id>
        endif
      endif
    endif
  endif
endscript

script goal_description_and_speech_continue
  if GotParam Anim
    GetSkaterID
    KillSkaterCamAnim skaterId = <ObjId> name = <Anim>
    endif
  KillSpawnedScript ID = sf2_special
  Kill ID = TRG_G_SPECIALTrick_Husband // This and the above line are needed to actually end the cutscene correctly for the mission Darkslide the Waterslide Railing in SanFran
  speech_box_exit anchor_id = goal_description_anchor
endscript

script goal_wait_for_cam_anim
  GetSkaterID
  begin
    if SkaterCamAnimFinished skaterId = <ObjId> name = <Anim>
      create_panel_block id = current_goal text = <goal_text> style = panel_message_goal params = <...>
      SpawnScript goal_show_tips params = { goal_id = <goal_id> }
      if GotParam key_combo_text
        SpawnScript goal_wait_and_show_key_combo_text params = { text = <key_combo_text> }
      endif
      break
    endif
    Wait 10 one_per_frame
  repeat
endscript

script goal_description_and_speech2 blink_time = 0.05
  SetProps just = [ center top ] internal_just = [ center center ] rgba = [ 128 128 128 128 ]
  DoMorph pos = (320, 114) scale = 0
  DoMorph pos = (320, 114) scale = 1.2 time = 0.1
  DoMorph pos = (320, 114) scale = 0.8 time = 0.1
  DoMorph pos = (320, 114) scale = 1 time = 0.1
  DoMorph pos = (320, 114) scale = 0.9 time = 0.05
  DoMorph pos = (321, 116) time = 0.1
  DoMorph pos = (319, 113) time = 0.1
  DoMorph pos = (321, 115) time = 0.1
  DoMorph pos = (318, 113) time = 0.1
  DoMorph pos = (321, 115) time = 0.1
  DoMorph pos = (319, 113) time = 0.1
  DoMorph pos = (321, 117) time = 0.1
  DoMorph pos = (319, 113) time = 0.1
  DoMorph pos = (320, 120) scale = 1.25 time = 0.1
  SetProps internal_just = [ center top ] rgba = [ 128 128 128 110 ] just = [ right top ]
  DoMorph pos = (625, 15) scale = 0.78 time = 0.05
  RunScriptOnScreenElement id = current_goal blink_current_goal params = { blink_time = <blink_time> }
endscript

script blink_current_goal
  begin
    DoMorph alpha = 0
    Wait <blink_time> seconds
    DoMorph alpha = 1
    Wait <blink_time> seconds
  repeat 6
endscript

script GoalManager_InitGoalTrigger
  GoalManager_GetGoalParams name = <name>
  if GotParam pro_specific_challenge
    if GotParam force_create_trigger
      if ( <force_create_trigger> = 0 )
        if not GoalManager_ProSpecificChallengesUnlocked
          return
        endif
        GetCurrentSkaterProfileIndex
        GetSkaterProfileInfo player = <currentSkaterProfileIndex>
        FormatText ChecksumName = pro_name_checksum "%s" s = <pro_challenge_pro_name>
         <last_name_test> = ( goal_pro_last_name_checksums.<pro_name_checksum> )
        if GotParam last_name_test
          if not ( <last_name_test> = <name> )
            return
          endif
        endif
      endif
    else
      if not GoalManager_ProSpecificChallengesUnlocked
        return
      endif
      GetCurrentSkaterProfileIndex
      GetSkaterProfileInfo player = <currentSkaterProfileIndex>
      FormatText ChecksumName = pro_name_checksum "%s" s = <pro_challenge_pro_name>
       <last_name_test> = ( goal_pro_last_name_checksums.<pro_name_checksum> )
      if GotParam last_name_test
        if not ( <last_name_test> = <name> )
          return
        endif
      endif
    endif
  endif
  if not IsAlive name = <trigger_obj_id>
    Create name = <trigger_obj_id>
  endif
   <trigger_obj_id>:SetTags goal_id = <goal_id>
  if not GotParam quick_start
    goal_add_ped_arrow goal_id = <goal_id>
  endif
  goal_pro_stop_anim_scripts <...>
  if GotParam trigger_wait_script
    RunScriptOnObject id = <trigger_obj_id> <trigger_wait_script> params = { goal_id = <goal_id> pro = <pro> }
  else
    RunScriptOnObject id = <trigger_obj_id> GenericProWaiting params = { goal_id = <goal_id> type = "wait" pro = <pro> }
  endif
  RunScriptOnObject id = <trigger_obj_id> goal_set_trigger_exceptions params = { goal_id = <goal_id> }
endscript

script goal_add_ped_arrow
  GoalManager_GetGoalParams name = <goal_id>
  if not IsAlive name = <trigger_obj_id>
    return
  endif
  if not GotParam goal_ped_arrow_height
     <goal_ped_arrow_height> = 100
  endif
   <goal_arrow_pos> = ( (0, 1, 0) * <goal_ped_arrow_height> )
  if GotParam pro_specific_challenge
     <arrow> = "Super_Pro_Arrow"
  else
    if GotParam pro_goal
       <arrow> = "Ped_Pro_Arrow"
    else
       <arrow> = "arrow"
    endif
  endif
  FormatText ChecksumName = arrow_id "%s_ped_arrow" s = <goal_name>
  if ScreenElementExists id = <arrow_id>
    DestroyScreenElement id = <arrow_id>
  endif
  SetScreenElementLock id = root_window off
  if not IsTrue no_arrows
    CreateScreenElement {
      parent = root_window
      type = Element3D
      id = <arrow_id>
      model = <arrow>
      HoverParams = { Amp = 9.5 Freq = 2.5 }
      AngVelY = 0.16
      ParentParams = { name = <trigger_obj_id> <goal_arrow_pos> IgnoreParentsYRotation }
    }
  endif
endscript

script goal_set_trigger_exceptions trigger_radius = 16 avoid_radius = 3
  if ObjectExists id = goal_start_dialog
    speech_box_exit anchor_id = goal_start_dialog
  endif
  Obj_ClearException SkaterOutOfRadius
  Obj_SetInnerRadius <trigger_radius>
  Obj_SetException ex = SkaterInRadius scr = goal_got_trigger params = { goal_id = <goal_id> }
  Obj_SetInnerAvoidRadius <avoid_radius>
  Obj_SetException ex = SkaterInAvoidRadius scr = goal_pro_bounce_skater params = { avoid_radius = <avoid_radius> goal_id = <goal_id> }
endscript

script goal_pro_bounce_skater speed = 350
  GetSkaterState
  if not ( <state> = skater_onground )
    return
  endif
  root_window:GetTags
  if GotParam giving_rewards
    if ( <giving_rewards> = 1 )
      return
    endif
  endif
  Obj_ClearException SkaterInAvoidRadius
  Obj_SpawnScript goal_pro_wait_and_reset_avoid_exception params = { goal_id = <goal_id> avoid_radius = <avoid_radius> }
  if skater:SpeedGreaterThan 200
    if GotParam goal_id
      GoalManager_PlayGoalStream name = <goal_id> type = "avoid" play_random
    endif
    return
  endif
  skater:GetTags
  if not ( <racemode> = None )
    return
  endif
  GetTags
  skater:Obj_GetOrientationToObject <id>
  if ( <dotProd> < 0.0 )
    if ( <dotProd> > -0.1 )
       <speed> = 500
       <Heading> = 180
    else
       <Heading> = 90.0
    endif
  else
    if ( <dotProd> < 0.1 )
       <speed> = 500
       <Heading> = 180
    else
       <Heading> = -90
    endif
  endif
  MakeSkaterGoto SkaterAvoidGoalPed params = { Heading = <Heading> speed = <speed> }
endscript

script goal_pro_wait_and_reset_avoid_exception
  Wait 20 gameframe
  Obj_SetInnerAvoidRadius <avoid_radius>
  Obj_SetException ex = SkaterInAvoidRadius scr = goal_pro_bounce_skater params = { avoid_radius = <avoid_radius> goal_id = <goal_id> }
endscript

script goal_got_trigger
  GetSkaterID
   <skaterId> = <ObjId>
  if GoalManager_HasWonGoal name = <goal_id>
    return
  endif
  if GoalManager_GoalIsActive name = <goal_id>
    return
  endif
  if ObjectExists id = goal_start_dialog
     <should_destroy> = 0
    if <skaterId>:IsInBail
       <should_destroy> = 1
    endif
    if SkaterCurrentScorePotGreaterThan 0
       <should_destroy> = 1
    endif
    if not GoalManager_CanStartGoal
       <should_destroy> = 1
    endif
    if ( <should_destroy> = 1 )
      DestroyScreenElement id = goal_start_dialog
    endif
  else
    if ObjectExists id = root_window
      root_window:GetTags
      if GotParam menu_state
        if ( <menu_state> = On )
          return
        endif
      endif
    endif
    if GoalManager_CanStartGoal name = <goal_id>
      if <skaterId>:OnGround
        if not <skaterId>:IsInBail
          if not SkaterCurrentScorePotGreaterThan 0
            GoalManager_GetGoalParams name = <goal_id>
             <trigger_obj_id>:Obj_SetOuterRadius 20
             <trigger_obj_id>:Obj_SetException ex = SkaterOutOfRadius scr = goal_trigger_refuse params = { goal_id = <goal_id> }
            if ( InNetGame )
               <quick_start_text> = "\n\m7 to quick start."
               <pad_square_script> = goal_accept_trigger
               <pad_square_params> = { goal_id = <goal_id> quick_start }
            else
               <quick_start_text> = ""
            endif
            if GotParam full_name
              FormatText TextName = accept_text "%f: \m5 to talk.%q" f = <full_name> q = <quick_start_text>
            else
              if GotParam pro
                FormatText ChecksumName = name_checksum "%s" s = <pro>
                 <last_name> = ( goal_pro_last_names.<name_checksum> )
                if GotParam last_name
                  FormatText TextName = accept_text "%s %l: \m5 to talk.%q" s = <pro> l = <last_name> q = <quick_start_text>
                else
                  FormatText TextName = accept_text "%s: \m5 to talk.%q" s = <pro> q = <quick_start_text>
                endif
              else
                FormatText TextName = accept_text "\m5 to talk.%q" q = <quick_start_text>
              endif
            endif
            create_speech_box {
              anchor_id = goal_start_dialog
              text = <accept_text>
              no_pad_choose
              no_pad_start
              pad_circle_script = goal_accept_trigger
              pad_circle_params = { goal_id = <goal_id> }
              pad_square_script = <pad_square_script>
              pad_square_params = <pad_square_params>
              bg_rgba = [ 100 100 100 128 ]
              text_rgba = [ 128 128 128 128 ]
              font = small
              z_priority = 5
            }
          endif
        endif
      endif
    endif
  endif
endscript

script goal_trigger_refuse anchor_id = goal_start_dialog
  Obj_ClearException SkaterOutOfRadius
  speech_box_exit anchor_id = <anchor_id>
  GoalManager_ResetGoalTrigger name = <goal_id>
endscript

script goal_accept_trigger
  Debounce x time = 0.5
  speech_box_exit anchor_id = goal_start_dialog
  goal_check_for_required_tricks goal_id = <goal_id>
  if ( <found_unmapped_trick> = 1 )
    GoalManager_GetGoalParams name = <goal_id>
    if IsAlive name = <trigger_obj_id>
       <trigger_obj_id>:Obj_ClearException SkaterInRadius
    endif
    return
  endif
  if GotParam force_start
    GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
    if IsAlive name = <trigger_obj_id>
       <trigger_obj_id>:Obj_ClearException SkaterInRadius
    endif
    GoalManager_DeactivateAllGoals
    GoalManager_ActivateGoal name = <goal_id> <...>
    return
  endif
  if not SkaterCurrentScorePotGreaterThan 0
    if GoalManager_CanStartGoal name = <goal_id>
      GetSkaterID
      if <ObjId>:OnGround
        Wait 5 frame
        if SkaterCurrentScorePotLessThan 1
          if <ObjId>:OnGround
            GoalManager_GetGoalParams name = <goal_id>
            GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
            if IsAlive name = <trigger_obj_id>
               <trigger_obj_id>:Obj_ClearException SkaterInRadius
            endif
            GoalManager_DeactivateAllGoals
            if GotParam quick_start
              GoalManager_QuickStartGoal name = <goal_id>
            else
              GoalManager_ActivateGoal name = <goal_id> <...>
            endif
          else
            if not <ObjId>:RightPressed
              if not <ObjId>:LeftPressed
                if not <ObjId>:UpPressed
                  if not <ObjId>:DownPressed
                    GoalManager_GetGoalParams name = <goal_id>
                    GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
                    if IsAlive name = <trigger_obj_id>
                       <trigger_obj_id>:Obj_ClearException SkaterInRadius
                    endif
                    GoalManager_DeactivateAllGoals
                    if GotParam quick_start
                      GoalManager_QuickStartGoal name = <goal_id>
                    else
                      GoalManager_ActivateGoal name = <goal_id> <...>
                    endif
                  endif
                endif
              endif
            endif
          endif
        endif
      else
        if not <ObjId>:RightPressed
          if not <ObjId>:LeftPressed
            if not <ObjId>:UpPressed
              if not <ObjId>:DownPressed
                GoalManager_GetGoalParams name = <goal_id>
                GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
                if IsAlive name = <trigger_obj_id>
                   <trigger_obj_id>:Obj_ClearException SkaterInRadius
                endif
                GoalManager_DeactivateAllGoals
                if GotParam quick_start
                  GoalManager_QuickStartGoal name = <goal_id>
                else
                  GoalManager_ActivateGoal name = <goal_id> <...>
                endif
              endif
            endif
          endif
        endif
      endif
    endif
  endif
endscript

script GoalManager_ResetGoalTrigger
  if GotParam goal_id
    GoalManager_GetGoalParams name = <goal_id>
  else
    GoalManager_GetGoalParams name = <name>
  endif
  if IsAlive name = <trigger_obj_id>
     <trigger_obj_id>:Obj_ClearException SkaterInRadius
    if not GotParam no_new_exceptions
      if not GotParam just_won_goal
        RunScriptOnObject id = <trigger_obj_id> goal_set_trigger_exceptions params = { goal_id = <goal_id> }
      endif
    endif
  endif
endscript

script goal_check_for_required_tricks
   <found_unmapped_trick> = 0
  GoalManager_GetGoalParams name = <goal_id>
  if GotParam required_tricks
    FormatText TextName = warning_string "You do not have all the tricks you will need to complete this goal. You will need to assign:"
    GetArraySize <required_tricks>
     <index> = 0
    begin
      if not GetKeyComboBoundToTrick trick = ( <required_tricks> [ <index> ] )
        if not GetKeyComboBoundToTrick trick = ( <required_tricks> [ <index> ] ) special
           <trick_name> = ( <required_tricks> [ <index> ] )
           <trick_params> = ( <trick_name>.params )
           <trick_string> = ( <trick_params>.name )
          if ( <found_unmapped_trick> = 0 )
            FormatText TextName = warning_string "%s\n%t" s = <warning_string> t = <trick_string>
          else
            FormatText TextName = warning_string "%s, %t" s = <warning_string> t = <trick_string>
          endif
           <found_unmapped_trick> = 1
        endif
      endif
       <index> = ( <index> + 1 )
    repeat <array_size>
  endif
  if ( <found_unmapped_trick> = 1 )
    PauseGame
    create_error_box { title = "WARNING!"
      text = <warning_string>
      text_dims = (400, 0)
      bg_scale = 1.2
      buttons = [ { text = "Edit Tricks" pad_choose_script = goal_unmapped_tricks_box_accept }
        { text = "Skip this challenge" pad_choose_script = goal_unmapped_tricks_box_exit pad_choose_params = { goal_id = <goal_id> } }
      ]
    }
  endif
  return found_unmapped_trick = <found_unmapped_trick>
endscript

script goal_unmapped_tricks_box_accept
  dialog_box_exit
  create_edit_tricks_menu
endscript

script goal_unmapped_tricks_box_exit
  GoalManager_ResetGoalTrigger name = <goal_id>
  dialog_box_exit
  UnPauseGame
endscript

script goal_got_trickslot
  create_panel_message {
    id = goal_current_reward
    text = "You got a new special trick slot"
    style = goal_message_got_trickslot
    params = { sound = HUDTrickPerfect }
  }
endscript

script goal_got_stat
  if ( <reward_stat> = 1 )
    create_panel_message {
      text = "You got a stat point"
      style = goal_message_got_stat
      params = { sound = HUDTrickPerfect }
    }
  else
    FormatText TextName = goal_got_stat_message "You got %i stat points" i = <reward_stat>
    create_panel_message {
      text = <goal_got_stat_message>
      style = goal_message_got_stat
      params = { sound = HUDTrickPerfect }
    }
  endif
endscript

script goal_got_cash
  FormatText TextName = message "You got $%i!" i = <amount>
  create_panel_message {
    id = goal_current_reward
    text = <message>
    style = goal_message_got_stat
    params = { sound = cash }
  }
endscript

script goal_got_all_goals
  StopStream
  PlayStream FoundAllGaps vol = 150
   <text> = "Incredible! You beat all 190 goals in the game!\nBut there's probably more to do. Did you clear all 9 minigames? Get all gaps? Cash? We're holding the final secret character hostage until you do...Good luck!"
  create_dialog_box { title = "All Goals"
    text = <text>
    pos = (310, 183)
    just = [ center center ]
    text_rgba = [ 88 105 112 128 ]
    buttons = [ { font = small text = "OK" pad_choose_script = goal_got_all_goals_accept } ]
    delay_input
  }
endscript

script goal_got_all_goals_accept
  dialog_box_exit
  FireEvent type = goal_got_all_goals_done
endscript

script goal_play_stream
  Obj_StopStream
  Obj_PlayStream <stream_checksum> vol = 150 dropoff = 400 use_pos_info = <use_pos_info>
endscript

script goal_turn_pro
  create_panel_block text = "You just turned pro\n"
endscript

script goal_init_after_end_of_run
  if not GoalManager_GoalExists name = <goal_id>
    return
  endif
  GoalManager_GetGoalParams name = <goal_id>
  if GotParam competition
    return
  endif
  GetSkaterID
  begin
    if GoalManager_GoalExists name = <goal_id>
      if GoalManager_FinishedEndOfRun name = <goal_id>
        GoalManager_ClearEndRun name = <goal_id>
        MakeSkaterGoto OnGroundAI
         <ObjId>:EnablePlayerInput
        break
      endif
    else
      break
    endif
    Wait 1 frame
  repeat
endscript

script create_pro_challenge_menu pro_challenge_title = "A Day in the Life" pro_challenge_tag_line = "All in a day's hard work..."
  GoalManager_GetGoalParams name = <goal_id>
  PlayStream ProChallengeIntro vol = 150
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  kill_start_key_binding
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  FormatText ChecksumName = pro_first_name_checksum "%s" s = <pro_challenge_pro_name>
  if ( <pro_first_name_checksum> = custom )
     <last_name_string> = "Custom"
  else
     <last_name_string> = ( goal_pro_last_names.<pro_first_name_checksum> )
  endif
  FormatText TextName = icon_texture "pro_%s" s = <last_name_string>
  add_pro_challenge_textures_to_vram icon_texture = <icon_texture>
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = pro_challenge_anchor
    dims = (640, 480)
    pos = (320, 240)
    event_handlers = [ { pad_choose destroy_pro_challenge_menu params = { icon_texture = <icon_texture> } }
      { pad_start destroy_pro_challenge_menu params = { icon_texture = <icon_texture> } }
    ]
  }
  AssignAlias id = pro_challenge_anchor alias = current_menu_anchor
  create_helper_text helper_text_elements = [ { text = "\m0 = Continue" } ]
  CreateScreenElement {
    type = ContainerElement
    parent = pro_challenge_anchor
    id = pro_challenge_bg_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
   <scale> = (1.8, 1)
   <root_pos> = (320, 80)
   <num_middle_pieces> = 16
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_bg_anchor
    id = pro_challenge_box_top
    texture = level_top_piece
    pos = <root_pos>
    rgba = [ 128 128 128 100 ]
    scale = <scale>
    just = [ center top ]
    z_priority = 1
  }
  begin
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = pro_challenge_bg_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 100 ]
      just = [ left top ]
      z_priority = 1
    }
  repeat <num_middle_pieces>
  GetStackedScreenElementPos y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_bg_anchor
    id = pro_challenge_bg_bottom
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 100 ]
    scale = (1.74, 1)
    just = [ left top ]
    z_priority = 1
  }
  GetStackedScreenElementPos x id = pro_challenge_box_top offset = (-25, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_bg_anchor
    texture = goal_right
    scale = (0.8, 1.18)
    rgba = [ 30 30 30 80 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 0
  }
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_bg_anchor
    texture = white2
    pos = ( <pos> - (419, -61) )
    just = [ center top ]
    rgba = [ 127 102 0 80 ]
    scale = (1, 24.5)
    z_priority = 0
  }
  CreateScreenElement {
    type = ContainerElement
    parent = pro_challenge_anchor
    id = pro_challenge_icon_anchor
    dims = (640, 480)
    pos = (320, 238)
  }
  FormatText ChecksumName = icon_texture_checksum "%s" s = <icon_texture>
  GetStackedScreenElementPos y id = pro_challenge_box_top offset = (0, -18)
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_icon_anchor
    id = pro_challenge_icon
    texture = <icon_texture_checksum>
    pos = <pos>
    just = [ center top ]
    rgba = [ 127 102 0 128 ]
    scale = 1.1
    z_priority = 4
  }
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    id = pro_challenge_title_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  GetStackedScreenElementPos y id = pro_challenge_box_top offset = (60, 0)
  CreateScreenElement {
    type = TextElement
    parent = pro_challenge_title_anchor
    id = pro_challenge_title
    text = <pro_challenge_title>
    font = dialog
    scale = 1.5
    pos = <pos>
    just = [ left top ]
    rgba = [ 127 102 0 125 ]
    z_priority = 4
  }
  CreateScreenElement {
    type = TextElement
    parent = pro_challenge_title_anchor
    text = <pro_challenge_title>
    font = dialog
    scale = 1.53
    pos = ( <pos> - (-5, 0) )
    just = [ left top ]
    rgba = [ 127 102 0 20 ]
    z_priority = 3
  }
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_title_anchor
    texture = black
    pos = ( <pos> - (-161, -15) )
    just = [ center top ]
    rgba = [ 0 0 0 60 ]
    scale = (105, 4)
    z_priority = 4
  }
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_title_anchor
    texture = black
    pos = ( <pos> - (-161, -224) )
    just = [ center top ]
    rgba = [ 0 0 0 60 ]
    scale = (105, 4)
    z_priority = -10
  }
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_title_anchor
    texture = black
    pos = ( <pos> - (-166, -25) )
    just = [ center top ]
    rgba = [ 127 102 0 60 ]
    scale = (102, 0.6)
    z_priority = 4
  }
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    id = pro_challenge_name_anchor
    dims = (640, 480)
    pos = (300, 245)
  }
  GetStackedScreenElementPos y id = pro_challenge_title offset = (-5, -20)
  FormatText ChecksumName = first_name_checksum "%f" f = <pro_challenge_pro_name>
  if ( <first_name_checksum> = custom )
     <full_name> = "create-a-skater"
  else
    FormatText TextName = full_name "%f %l" f = <pro_challenge_pro_name> l = ( goal_pro_last_names.<first_name_checksum> )
  endif
  GetUpperCaseString <full_name>
  CreateScreenElement {
    type = TextElement
    parent = pro_challenge_name_anchor
    text = <UpperCaseString>
    font = testtitle
    pos = <pos>
    just = [ left top ]
    scale = 1.6
    rgba = [ 88 105 112 95 ]
    z_priority = 5
  }
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    id = pro_challenge_text_anchor
    dims = (640, 480)
    pos = (335, 272)
  }
  if not GotParam pro_challenge_text
     <pro_challenge_text> = <goal_description>
  endif
  GetStackedScreenElementPos XY id = pro_challenge_icon offset = (0, -30)
   <text_scale> = 0.8
  CreateScreenElement {
    type = TextBlockElement
    parent = pro_challenge_text_anchor
    text = <pro_challenge_text>
    font = small
    pos = <pos>
    just = [ left top ]
    internal_just = [ left top ]
    rgba = [ 17 64 106 128 ]
    scale = <text_scale>
    z_priority = 5
    dims = ( (380, 155) * ( 1 / <text_scale> ) )
  }
  GetStackedScreenElementPos y id = <id>
   <alpha> = 50.0
  begin
    CreateScreenElement {
      type = SpriteElement
      parent = pro_challenge_bg_anchor
      texture = <icon_texture_checksum>
      pos = <pos>
      just = [ left top ]
      rgba = [ 100 100 128 28 ]
      alpha = ( <alpha> / 20.0 )
      z_priority = 4
      scale = 0.75
    }
    GetStackedScreenElementPos x id = <id> offset = (7, 0)
     <alpha> = ( <alpha> - 10 )
    if ( <alpha> = 0 )
       <alpha> = 2
    endif
  repeat 6
  GetScreenElementDims id = pro_challenge_bg_bottom
   <offset> = ( <height> * (0, -1) + (27, -10) )
  GetStackedScreenElementPos y id = pro_challenge_bg_bottom offset = <offset>
  CreateScreenElement {
    type = TextElement
    parent = pro_challenge_bg_anchor
    text = <pro_challenge_tag_line>
    font = small
    pos = <pos>
    just = [ left bottom ]
    rgba = [ 127 102 0 65 ]
    z_priority = 4
    scale = 0.9
    event_handlers = [ { pad_choose nullscript } ]
  }
  RunScriptOnScreenElement id = <id> do_scale_up
  RunScriptOnScreenElement id = pro_challenge_bg_anchor pro_challenge_animate_bg
  SpawnScript TemporarilyDisableInput params = { time = 50 }
  FireEvent type = focus target = current_menu_anchor
endscript

script pro_challenge_animate_bg
  DoScreenElementMorph {
    id = pro_challenge_icon_anchor
    pos = { (-200, 0) relative }
    alpha = 0
  }
  DoScreenElementMorph {
    id = pro_challenge_title_anchor
    scale = 0
    alpha = 0
  }
  DoScreenElementMorph {
    id = pro_challenge_name_anchor
    pos = { (300, 0) relative }
    alpha = 0
  }
  DoScreenElementMorph {
    id = pro_challenge_text_anchor
    scale = (1, 0)
    relative_scale
    alpha = 0
  }
  DoMorph time = 0 scale = 0 relative_scale alpha = 0
  DoMorph time = 0.2 scale = 1.1 pos = (320, 240) relative_scale alpha = 1
  DoMorph time = 0.08 scale = 0.95 pos = (320, 240) relative_scale
  DoMorph time = 0.07 scale = 1.0 pos = (320, 240) relative_scale
  RunScriptOnScreenElement id = pro_challenge_icon_anchor pro_challenge_animate_icon
endscript

script pro_challenge_animate_icon
  DoMorph time = 0 alpha = 0
  DoMorph time = 0.25 pos = { (215, 0) relative }
  DoMorph time = 0.2 pos = { (-1, 0) relative } alpha = 0.8
  DoMorph time = 0.1 pos = { (1, 0) relative }
  RunScriptOnScreenElement id = pro_challenge_title_anchor pro_challenge_animate_title
endscript

script pro_challenge_animate_title
  DoMorph time = 0 alpha = 0
  DoMorph time = 0.09 scale = 1.0
  begin
    DoMorph time = 0.05 pos = { (2, 2) relative } alpha = 1
    DoMorph time = 0.05 pos = { (-2, -2) relative } scale = 1.03
    DoMorph time = 0.05 pos = { (1, 1) relative } alpha = 0.3
    DoMorph time = 0.05 pos = { (-1, -1) relative }
    DoMorph time = 0.05 alpha = 1 scale = 1.01
  repeat 4
  RunScriptOnScreenElement id = pro_challenge_name_anchor pro_challenge_animate_name
endscript

script pro_challenge_animate_text
  DoMorph time = 0.2
  DoMorph time = 0 scale = (4, 2) relative_scale alpha = 0
  DoMorph time = 0.15 scale = (1, 1) relative_scale alpha = 1
endscript

script pro_challenge_animate_name
  DoMorph time = 0.2 alpha = 0
  DoMorph time = 0.15 pos = { (-300, 0) relative } alpha = 1
  RunScriptOnScreenElement id = pro_challenge_text_anchor pro_challenge_animate_text
endscript

script destroy_pro_challenge_menu
  if ObjectExists id = pro_challenge_anchor
    DestroyScreenElement id = pro_challenge_anchor
    Wait 1 frame
  endif
  remove_pro_challenge_textures_from_vram icon_texture = <icon_texture>
  GoalManager_ShowPoints
  if not GoalManager_HasActiveGoals
    GoalManager_ShowGoalPoints
  endif
  FireEvent type = pro_challenge_menu_done
endscript

script add_pro_challenge_textures_to_vram
  if GotParam icon_texture
    AddTextureToVram <icon_texture>
  endif
  AddTextureToVram "stats_notch"
  AddTextureToVram "level_top_piece"
  AddTextureToVram "level_repeat_mid"
  AddTextureToVram "level_bottom_piece"
  AddTextureToVram "goal_right"
endscript

script remove_pro_challenge_textures_from_vram
  if GotParam icon_texture
    RemoveTextureFromVram <icon_texture>
  endif
  RemoveTextureFromVram "stats_notch"
  RemoveTextureFromVram "level_top_piece"
  RemoveTextureFromVram "level_repeat_mid"
  RemoveTextureFromVram "level_bottom_piece"
  RemoveTextureFromVram "goal_right"
endscript

script goal_give_rewards
  Printf "goal_give_rewards"
  pause_trick_text
  if GotParam gonna_show_message
    Wait 1 gameframe
  endif
  pause_trick_text
   <gave_reward_with_menu> = 0
  kill_start_key_binding
  if GotParam set_new_record
    create_panel_message {
      id = goal_new_record
      text = "You set a new record!"
      style = panel_message_new_record
    }
    pause_trick_text
  endif
  GoalManager_GetNumberOfGoalPoints total
  if ( <goal_points> = 190 )
    if not GetGlobalFlag flag = GOT_ALL_GOALS
      SetGlobalFlag flag = GOT_ALL_GOALS
      goal_got_all_goals
      WaitForEvent type = goal_got_all_goals_done
    endif
  endif
  if GotParam cash
    GoalManager_AddCash <cash>
    goal_got_cash amount = <cash>
    pause_trick_text
  endif
  if GotParam reward_trickslot
    if not GotParam already_added_trickslot
      AwardSpecialTrickSlot all
    endif
    goal_got_trickslot
  endif
  if ( ( GotParam cash ) or ( GotParam reward_trickslot ) )
    create_speech_box {
      text = "Press \m0 to continue"
      pad_choose_script = goal_rewards_continue_box
    }
    WaitForEvent type = goal_rewards_continue_box_done
    Wait 1 frame
    kill_start_key_binding
    pause_trick_text
  endif
  if GotParam reward_stat
     <gave_reward_with_menu> = 1
    begin
      ForEachIn master_skater_list do = goal_award_stat_point
    repeat <reward_stat>
    goal_got_stat reward_stat = <reward_stat>
    if ( better4_control_skipstats_value = off ) // Better4 setting param that skips the stats screen when you get a stat point. Message still appears regardless.
      WaitForEvent type = goal_got_reward_done
      DebugFn 765
      add_pause_menu_textures_to_vram
      create_stats_menu {
        pad_start = goal_stats_menu_exit
        pad_back_script = goal_stats_menu_exit
        done_button_pad_choose_script = goal_stats_menu_exit
        update_all_skaters = update_all_skaters
      }
      kill_start_key_binding
      SetScreenElementProps {
        id = stats_menu
        event_handlers = [ { pad_back goal_stats_menu_exit } ]
        replace_handlers
      }
      WaitForEvent type = goal_stats_menu_done
      DebugFn 766
    endif
  endif
  if GotParam awarded_goal_point
    GoalManager_GetNumberOfGoalPoints total
    if ( <goal_points> > ( points_to_pro_challenge - 1 ) )
      if GoalManager_ProSpecificChallengesUnlocked
        if not GoalManager_IsPro
          if GotParam pro_specific_challenge
            GoalManager_TurnPro
             <just_turned_pro> = 1
          endif
        endif
      else
         <just_unlocked_pro_specific_challenges> = 1
        GoalManager_UnlockProSpecificChallenges
      endif
    endif
  endif
  PauseMusic 0
  if GotParam volume
    SetMusicVolume ( <volume> * 10 )
  endif
  if ( better4_control_skipsave_value = off ) // Better4 setting param that skips the save prompt when you complete a goal
    goal_want_to_save
    WaitForEvent type = goal_wait_for_save
  endif
  if ( Bootstrap_build = 0 )
    if GotParam awarded_goal_point
      if GotParam just_turned_pro
        if ( <just_turned_pro> = 1 )
           <gave_reward_with_menu> = 1
          create_pro_challenge_screen ok_button accept_text = "Newer, hardcore goals enabled in every level.  Look for the new guys with RED arrows. They're worth extra cash. Good luck!" subtitle_text = "Your challenge is complete."
          WaitForEvent type = goal_pro_challenges_unlocked_done
        endif
      endif
      if GotParam just_unlocked_pro_specific_challenges
        if ( <just_unlocked_pro_specific_challenges> = 1 )
           <gave_reward_with_menu> = 1
          begin
            if not ObjectExists id = goal_complete_line2
              break
            endif
            Wait 1 gameframe
          repeat
          goal_pro_challenges_unlocked
          WaitForEvent type = goal_pro_challenges_unlocked_done
        endif
      endif
      if not IsDemo
        if not ( ALL_LEVELS_UNLOCKED = 1 )
          GetArraySize level_select_menu_level_info
           <levels_array_size> = <array_size>
           <index> = 0
           <running_total> = 0
          GoalManager_GetNumberOfGoalPoints
          begin
            if not GetGlobalFlag flag = ( ( level_select_menu_level_info [ <index> ] ).flag )
               <points_to_unlock> = ( ( level_select_menu_level_info [ <index> ] ).points_to_unlock )
              if ( <points_to_unlock> > 0 )
                 <running_total> = ( <running_total> + <points_to_unlock> )
                if ( <goal_points> = <running_total> )
                   <can_unlock_level> = 1
                  if StructureContains structure = ( level_select_menu_level_info [ <index> ] ) PreReq_flags
                    GetArraySize ( ( level_select_menu_level_info [ <index> ] ).PreReq_flags )
                     <flags_index> = 0
                    begin
                      if not GetGlobalFlag flag = ( ( ( level_select_menu_level_info [ <index> ] ).PreReq_flags )
                          [ <flags_index> ] )
                         <can_unlock_level> = 0
                        break
                      endif
                       <flags_index> = ( <flags_index> + 1 )
                    repeat <array_size>
                  endif
                  if ( <can_unlock_level> = 1 )
                     <gave_reward_with_menu> = 1
                    goal_new_level_unlocked ( level_select_menu_level_info [ <index> ] )
                    WaitForEvent type = goal_new_level_unlocked_done
                    break
                  endif
                endif
              endif
            endif
             <index> = ( <index> + 1 )
          repeat <levels_array_size>
        endif
      endif
    endif
  endif
  restore_start_key_binding
  SetScreenElementProps {
    id = root_window
    tags = { menu_state = off }
  }
  return gave_reward_with_menu = <gave_reward_with_menu>
endscript

script goal_award_stat_point
  if GetSkaterProfileInfoByName name = <name>
     <points_available> = ( <points_available> + 1 )
    SetSkaterProfileInfoByName name = <name> params = { points_available = <points_available> }
  else
    script_assert "couldn't get skater profile info!"
  endif
endscript

script goal_rewards_continue_box
  speech_box_exit
  if ObjectExists id = goal_current_reward
    DestroyScreenElement id = goal_current_reward
  endif
  KillSpawnedScript ID = sf2_special
  FireEvent type = goal_rewards_continue_box_done
endscript

script goal_stats_menu_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    SetScreenElementProps {
      id = root_window
      tags = { menu_state = off }
    }
    Wait 1 frame
  endif
  remove_pause_menu_textures_from_vram
  restore_start_key_binding
  GoalManager_ShowPoints
  GoalManager_ShowGoalPoints
  FireEvent type = goal_stats_menu_done
endscript

script goal_new_level_unlocked
  Debounce x time = 0.3
  FormatText TextName = dialog_box_text "You have enough goal points to go to a new level."
  PlayStream UnlockLevel vol = 150
  create_snazzy_dialog_box { text = <dialog_box_text>
    title = "Congratulations!"
    buttons = [ { text = "Change Level" pad_choose_script = goal_new_level_accept }
      { text = "Keep Playing" pad_choose_script = goal_new_level_reject }
    ]
  }
endscript

script goal_new_level_accept
  dialog_box_exit
  launch_level_select_menu chose_same_level_script = goal_new_level_reject pad_back_script = goal_new_level_reject no_cam_anim
endscript

script goal_new_level_reject
  dialog_box_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_level_select_menu_textures_from_vram
  SetScreenElementProps {
    id = root_window
    tags = { menu_state = off }
  }
  FireEvent type = goal_new_level_unlocked_done
endscript

script goal_want_to_save
  Debounce x time = 0.3
  FormatText TextName = dialog_box_text "Do you want to save now?"
  create_snazzy_dialog_box { text = <dialog_box_text>
    title = ""
    buttons = [ { text = "Yes" pad_choose_script = goal_save_accept pad_choose_params = { volume = <volume> } }
      { text = "No" pad_choose_script = goal_save_reject }
    ]
    pad_back_script = goal_save_reject
  }
  AssignAlias id = dialog_box_anchor alias = current_menu_anchor
  create_helper_text generic_helper_text
endscript

script goal_save_accept
  dialog_box_exit
  kill_start_key_binding
  launch_beat_goal_save_game_sequence pad_back_script = goal_save_reject no_cam_anim
endscript

script goal_save_reject
  dialog_box_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  SetScreenElementProps {
    id = root_window
    tags = { menu_state = off }
  }
  FireEvent type = goal_wait_for_save
endscript

script goal_pro_challenges_unlocked
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  PlayStream UnlockProChallenges vol = 125
  GetArraySize goal_pro_specific_challenges_level_map
   <in_this_level> = 0
   <found_a_pro_challenge> = 0
   <index> = 0
  begin
    if ( ( ( goal_pro_specific_challenges_level_map [ <index> ] ).name ) = <name> )
       <pro_challenge_level> = ( ( goal_pro_specific_challenges_level_map [ <index> ] ).level )
       <pro_challenge_text> = ( ( goal_pro_specific_challenges_level_map [ <index> ] ).text )
       <found_a_pro_challenge> = 1
      if LevelIs <pro_challenge_level>
         <in_this_level> = 1
         <accept_text> = "You've unlocked the Pro Challenges for all pro skaters in the game.  Explore this level to find your challenge."
        break
      endif
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
  if ( <found_a_pro_challenge> = 0 )
    create_pro_challenge_screen {
      ok_button
      accept_text = "You've unlocked the Pro Challenges for all pro skaters in the game."
      subtitle_text = "You've made it to the top"
    }
  else
    if ( <in_this_level> = 1 )
      create_pro_challenge_screen {
        ok_button
        accept_text = <accept_text>
        subtitle_text = "You've made it to the top"
      }
    else
      FormatText TextName = accept_text "You've unlocked the Pro Challenges for all pro skaters in the game. Your specific challenge awaits in %s. Go there now?" s = <pro_challenge_text>
      create_pro_challenge_screen {
        accept_text = <accept_text>
        subtitle_text = "You've made it to the top"
        pro_challenge_level = <pro_challenge_level>
      }
    endif
  endif
endscript

script goal_pro_challenges_unlocked_subtitle_blur
  DoMorph time = 0 blur_alpha_pair = (4, 0) blur_bottom_scales = (1, 1) blur_max_displacement = (0, 0) scale = (0.9, 0.9) scale = (1, 1) relative_scale
  DoMorph time = 0.15 blur_alpha_pair = (0, 0) blur_bottom_scales = (2, 0) scale = (1, 1) relative_scale
  DoMorph time = 0.15 blur_alpha_pair = (4, 0) blur_bottom_scales = (1, 1) scale = (1, 1) relative_scale
  SetProps no_blur_effect
endscript

script goal_pro_challenges_unlocked_accept
  GetArraySize level_select_menu_level_info
   <index> = 0
  begin
    if ( ( ( level_select_menu_level_info [ <index> ] ).level ) = <level> )
      AddParams ( level_select_menu_level_info [ <index> ] )
      break
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
  if GotParam flag
    if not GetGlobalFlag flag = <flag>
      GoalManager_SpendGoalPoints <points_to_unlock>
      SetGlobalFlag flag = <flag>
    endif
    level_select_change_level <...>
  else
    script_assert "couldn't find the level flag"
  endif
endscript

script goal_pro_challenges_unlocked_reject
  if ObjectExists id = pro_challenge_anchor
    DestroyScreenElement id = pro_challenge_anchor
    Wait 1 gameframe
    remove_pro_challenge_textures_from_vram
  endif
  unpause_trick_text
  FireEvent type = goal_pro_challenges_unlocked_done
endscript
goal_pro_specific_challenges_level_map = [
  { name = Hawk level = load_sch text = "the College" }
  { name = Thomas level = load_sch text = "the College" }
  { name = Campbell level = load_sf2 text = "San Francisco" }
  { name = Muska level = load_sf2 text = "San Francisco" }
  { name = Steamer level = load_alc text = "Alcatraz" }
  { name = Glifberg level = load_alc text = "Alcatraz" }
  { name = Mergera level = load_alc text = "Alcatraz" }
  { name = Mullen level = load_kon text = "Kona" }
  { name = Caballero level = load_kon text = "Kona" }
  { name = Lasek level = load_jnk text = "the Shipyard" }
  { name = custom level = load_jnk text = "the Shipyard" }
  { name = Rowley level = load_lon text = "London" }
  { name = Reynolds level = load_sf2 text = "San Francisco" }
  { name = Burnquist level = load_zoo text = "the Zoo" }
]

script create_pro_challenge_screen
  add_pro_challenge_textures_to_vram
  SetScreenElementLock id = root_window off
  kill_start_key_binding
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = pro_challenge_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  create_helper_text parent = pro_challenge_anchor helper_text_elements = [ { text = "\m0 = Continue" } ]
  CreateScreenElement {
    type = ContainerElement
    parent = pro_challenge_anchor
    id = pro_challenge_bg_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
   <scale> = (1.8, 1)
   <root_pos> = (320, 80)
   <num_middle_pieces> = 13
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_bg_anchor
    id = pro_challenge_box_top
    texture = level_top_piece
    pos = <root_pos>
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
    z_priority = 1
  }
  begin
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = pro_challenge_bg_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
      z_priority = 1
    }
  repeat <num_middle_pieces>
  GetStackedScreenElementPos y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_bg_anchor
    id = pro_challenge_bg_bottom
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (1.74, 1)
    just = [ left top ]
    z_priority = 1
  }
  GetStackedScreenElementPos x id = pro_challenge_box_top offset = (-25, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_bg_anchor
    texture = goal_right
    scale = (0.8, 0.99)
    rgba = [ 30 30 30 80 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 0
  }
  CreateScreenElement {
    type = ContainerElement
    parent = pro_challenge_anchor
    id = pro_challenge_title_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  CreateScreenElement {
    type = TextElement
    parent = pro_challenge_title_anchor
    id = pro_challenge_title
    text = "CONGRATULATIONS!"
    font = dialog
    scale = 1.7
    pos = ( <root_pos> + (-3, 20) )
    just = [ center top ]
    rgba = [ 127 102 0 125 ]
    z_priority = 4
  }
  CreateScreenElement {
    type = TextElement
    parent = pro_challenge_title_anchor
    text = "CONGRATULATIONS!"
    font = dialog
    scale = 1.73
    pos = ( <root_pos> + (-3, 18) )
    just = [ center top ]
    rgba = [ 127 102 0 20 ]
    z_priority = 3
  }
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_title_anchor
    texture = black
    pos = ( <pos> - (210, -55) )
    just = [ center top ]
    rgba = [ 50 50 50 60 ]
    scale = (105, 0.6)
    z_priority = 4
  }
  CreateScreenElement {
    type = SpriteElement
    parent = pro_challenge_title_anchor
    texture = black
    pos = ( <pos> - (210, -50) )
    just = [ center top ]
    rgba = [ 0 0 0 60 ]
    scale = (105, 4)
    z_priority = 4
  }
  CreateScreenElement {
    type = ContainerElement
    parent = pro_challenge_anchor
    id = pro_challenge_subtitle_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  CreateScreenElement {
    type = TextElement
    parent = pro_challenge_subtitle_anchor
    id = pro_challenge_subtitle
    pos = ( <root_pos> + (0, 65) )
    just = [ center top ]
    font = dialog
    text = <subtitle_text>
    scale = 1.1
  }
  RunScriptOnScreenElement id = <id> goal_pro_challenges_unlocked_subtitle_blur
  CreateScreenElement {
    type = ContainerElement
    parent = pro_challenge_anchor
    id = pro_challenge_text_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  CreateScreenElement {
    type = TextBlockElement
    parent = pro_challenge_text_anchor
    id = pro_challenge_text
    font = small
    text = <accept_text>
    dims = (400, 0)
    pos = ( <root_pos> + (0, 100) )
    just = [ center top ]
    rgba = [ 17 64 116 100 ]
    scale = 0.9
    allow_expansion
  }
  CreateScreenElement {
    type = ContainerElement
    parent = pro_challenge_anchor
    id = pro_challenge_hmenu_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  CreateScreenElement {
    type = HMenu
    parent = pro_challenge_hmenu_anchor
    id = pro_challenge_hmenu
    pos = ( <root_pos> + (0, 220) )
    just = [ center top ]
    spacing_between = 50
  }
  if GotParam ok_button
    CreateScreenElement {
      type = TextElement
      parent = pro_challenge_hmenu
      font = dialog
      text = "OK"
      rgba = [ 88 105 112 128 ]
      scale = 1.1
      event_handlers = [ { focus do_scale_up }
        { unfocus do_scale_down }
        { pad_choose goal_pro_challenges_unlocked_reject }
        { pad_start goal_pro_challenges_unlocked_reject }
      ]
    }
  else
    CreateScreenElement {
      type = TextElement
      parent = pro_challenge_hmenu
      font = dialog
      text = "Yes"
      rgba = [ 88 105 112 128 ]
      scale = 1.1
      event_handlers = [ { focus do_scale_up }
        { unfocus do_scale_down }
        { pad_choose goal_pro_challenges_unlocked_accept params = { level = <pro_challenge_level> } }
        { pad_start goal_pro_challenges_unlocked_accept params = { level = <pro_challenge_level> } }
      ]
    }
    CreateScreenElement {
      type = TextElement
      parent = pro_challenge_hmenu
      id = pro_challenge_hmenu_no
      font = dialog
      text = "No"
      rgba = [ 88 105 112 128 ]
      scale = 1.1
      event_handlers = [ { focus do_scale_up }
        { unfocus do_scale_down }
        { pad_choose goal_pro_challenges_unlocked_reject }
        { pad_start goal_pro_challenges_unlocked_reject }
      ]
    }
  endif
  RunScriptOnScreenElement id = <id> do_scale_up
  RunScriptOnScreenElement id = pro_challenge_bg_anchor pro_challenge_animate_bg_1
  SpawnScript TemporarilyDisableInput params = { time = 1 }
  FireEvent type = focus target = pro_challenge_hmenu data = { child_id = pro_challenge_hmenu_no }
endscript

script pro_challenge_animate_bg_1
  DoScreenElementMorph {
    id = pro_challenge_bg_anchor
    pos = { (0, 0) relative }
    alpha = 0
  }
  DoScreenElementMorph {
    id = pro_challenge_title_anchor
    pos = { (600, 0) relative }
    alpha = 0
  }
  DoScreenElementMorph {
    id = pro_challenge_subtitle_anchor
    pos = { (0, -400) relative }
    alpha = 0
    scale = 0
  }
  DoScreenElementMorph {
    id = pro_challenge_text_anchor
    pos = { (0, 300) relative }
    just = [ center top ]
    alpha = 0
    scale = 5
  }
  DoScreenElementMorph {
    id = pro_challenge_hmenu_anchor
    pos = { (0, 300) relative }
    alpha = 0
    scale = 0
  }
  DoMorph time = 0 scale = 0 relative_scale alpha = 0
  DoMorph time = 0.07 scale = 1.4 pos = (320, 240) relative_scale alpha = 1
  DoMorph time = 0.08 scale = 0.85 pos = (320, 240) relative_scale
  DoMorph time = 0.09 scale = 1.1 pos = (320, 240) relative_scale
  DoMorph time = 0.1 scale = 0.95 pos = (320, 240) relative_scale
  DoMorph time = 0.11 scale = 1 pos = (320, 240) relative_scale
  RunScriptOnScreenElement id = pro_challenge_title_anchor pro_challenge_title_animate
endscript

script pro_challenge_title_animate
  DoMorph time = 0.2 pos = (320, 240) alpha = 1 scale = 1
  DoMorph time = 0.05 alpha = 0.35
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0.45
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0.55
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0.4
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0.55
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0.25
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0.55
  DoMorph time = 0.05 alpha = 1
  RunScriptOnScreenElement id = pro_challenge_subtitle_anchor pro_challenge_subtitle_animate
endscript

script pro_challenge_subtitle_animate
  DoMorph time = 0.5 pos = { (0, 400) relative } scale = 1 alpha = 1
  Wait 0.25 second
  RunScriptOnScreenElement id = pro_challenge_text_anchor pro_challenge_text_animate
endscript

script pro_challenge_text_animate
  DoMorph time = 0.4 pos = { (0, -310) relative } alpha = 1 scale = 1
  RunScriptOnScreenElement id = pro_challenge_hmenu_anchor pro_challenge_hmenu_animate
endscript

script pro_challenge_hmenu_animate
  DoMorph time = 0.4 pos = { (0, -310) relative } alpha = 1 scale = 1
endscript

script goal_create_counter
  SetScreenElementLock id = root_window off
  goal_destroy_counter
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = goal_counter_anchor
    dims = (640, 480)
    pos = (305, 320)
  }
  if ( ( French ) or ( German ) )
     <root_pos> = (550, 120)
  else
     <root_pos> = (550, 90)
  endif
  CreateScreenElement {
    type = TextElement
    parent = goal_counter_anchor
    id = goal_counter_number_collected
    font = small
    text = "0"
    pos = <root_pos>
    just = [ center top ]
    scale = 0.9
    rgba = [ 127 102 0 100 ]
  }
  if GoalManager_GetNumberOfFlags name = <goal_id>
     <total_number> = <number_of_flags>
  else
    GoalManager_GetGoalParams name = <goal_id>
    if GotParam number
       <total_number> = <number>
    else
      script_assert "couldn't find number"
    endif
  endif
  FormatText TextName = total_number "%i" i = <total_number>
  CreateScreenElement {
    type = TextElement
    parent = goal_counter_anchor
    id = goal_counter_number_total
    font = small
    text = <total_number>
    pos = ( <root_pos> + (47, 0) )
    just = [ center top ]
    scale = 0.9
  }
  CreateScreenElement {
    type = SpriteElement
    parent = goal_counter_anchor
    texture = mini_score_hud
    pos = ( <root_pos> - (25, 6) )
    just = [ left top ]
    scale = (1.47, 1)
    rgba = [ 128 128 128 100 ]
  }
  if GotParam hud_counter_caption
    GetStackedScreenElementPos y id = <id> offset = (48, -12)
    CreateScreenElement {
      type = TextBlockElement
      parent = goal_counter_anchor
      id = goal_counter_caption
      font = small
      text = <hud_counter_caption>
      rgba = [ 85 106 126 100 ]
      pos = ( <pos> - (0, -3) )
      just = [ center top ]
      scale = 0.8
      dims = (117.5, 0)
      allow_expansion
    }
  endif
  goal_update_counter <...>
endscript

script goal_update_counter
  GoalManager_GetNumberCollected name = <goal_id>
  if not ScreenElementExists id = goal_counter_number_collected
    return
  endif
  FormatText TextName = new_number_collected "%i" i = <number_collected>
  SetScreenElementProps {
    id = goal_counter_number_collected
    text = <new_number_collected>
  }
  GoalManager_GetGoalParams name = <goal_id>
  if GotParam hud_counter_caption
    if ScreenElementExists id = goal_counter_caption
      SetScreenElementProps {
        id = goal_counter_caption
        text = <hud_counter_caption>
      }
    endif
  endif
  KillSpawnedScript name = mini_hud_anim
  RunScriptOnScreenElement id = goal_counter_number_collected mini_hud_anim
endscript

script goal_destroy_counter
  if ObjectExists id = goal_counter_anchor
    DestroyScreenElement id = goal_counter_anchor
  endif
endscript

script mini_hud_anim
  DoMorph time = 0.08 scale = 0 alpha = 0
  DoMorph time = 0.12 scale = 1.3 alpha = 1
  DoMorph time = 0.14 scale = 0.7
  DoMorph time = 0.16 scale = 0.9
endscript

script goal_got_flag_sound
  PlaySound GoalMidGood vol = 200
endscript
goal_panel_message_ids = [
  current_goal
  goal_complete
  goal_message
  GoalFail
  goalfail_sprite
  goalfailedline2
  goal_tip
  new_goal_message
  new_goal_sprite
  tetris_menu_anchor
  current_horse_spot
  goal_counter_anchor
  goal_instruction1
]

script hide_goal_panel_messages
  GetArraySize goal_panel_message_ids
   <index> = 0
  begin
    hide_panel_message id = ( goal_panel_message_ids [ <index> ] )
     <index> = ( <index> + 1 )
  repeat <array_size>
endscript

script show_goal_panel_messages
  GetArraySize goal_panel_message_ids
   <index> = 0
  begin
    show_panel_message id = ( goal_panel_message_ids [ <index> ] )
     <index> = ( <index> + 1 )
  repeat <array_size>
endscript

script destroy_goal_panel_messages
  GetArraySize goal_panel_message_ids
   <index> = 0
  begin
    destroy_panel_message id = ( goal_panel_message_ids [ <index> ] )
     <index> = ( <index> + 1 )
  repeat <array_size>
endscript

script GoalManager_HidePoints
  DoScreenElementMorph {
    id = the_score_sprite
    alpha = 0
  }
  DoScreenElementMorph {
    id = the_score
    alpha = 0
  }
  if ScreenElementExists id = player2_panel_container
    DoScreenElementMorph id = player2_panel_container time = 0 scale = 0
  endif
endscript

script GoalManager_ShowPoints
  if CustomParkMode editing
  else
    DoScreenElementMorph {
      id = the_score_sprite
      alpha = 1
    }
    DoScreenElementMorph {
      id = the_score
      alpha = 1
    }
    if ScreenElementExists id = player2_panel_container
      DoScreenElementMorph id = player2_panel_container time = 0 scale = 1
    endif
  endif
endscript

script GoalManager_HideGoalPoints
  DoScreenElementMorph {
    id = cash_goal_sprite
    alpha = 0
  }
  DoScreenElementMorph {
    id = cash_text
    alpha = 0
  }
  DoScreenElementMorph {
    id = goal_points_text
    alpha = 0
  }
endscript

script GoalManager_ShowGoalPoints
  if CustomParkMode editing
    return
  endif
  if InMultiplayerGame
    return
  endif
  if GameModeEquals is_singlesession
    return
  endif
  if GameModeEquals is_freeskate
    return
  endif
  DoScreenElementMorph {
    id = cash_goal_sprite
    alpha = 1
  }
  GoalManager_GetCash
  FormatText TextName = cash "%i" i = <cash>
  SetScreenElementProps {
    id = cash_text
    text = <cash>
  }
  DoScreenElementMorph {
    id = cash_text
    alpha = 1
  }
  GoalManager_GetNumberOfGoalPoints total
  FormatText TextName = goal_points "%i" i = <goal_points>
  SetScreenElementProps {
    id = goal_points_text
    text = <goal_points>
  }
  DoScreenElementMorph {
    id = goal_points_text
    alpha = 1
  }
endscript

script goal_show_tips
  WaitForEvent type = panel_message_goal_done
  GoalManager_GetGoalParams name = <goal_id>
   <tip_pos> = (320, 140)
  if not GotParam goal_tips
    return
  endif
  if not GotParam goal_tip_interval
    goal_tip_interval = 5
  endif
  GoalManager_GetNumberOfTimesGoalStarted name = <goal_id>
  GetArraySize <goal_tips>
  if ( <array_size> = 0 )
    return
  endif
  tips_index = ( <array_size> - 1 )
  current_multiple = ( <goal_tip_interval> * <array_size> )
  if ( <times_started> = 0 )
    return
  endif
  if not ( ( ( <times_started> / <goal_tip_interval> ) * <goal_tip_interval> ) = <times_started> )
    return
  endif
  times_started = ( <times_started> - ( <times_started> / <current_multiple> ) * <current_multiple> )
  begin
    if ( ( ( <times_started> / <current_multiple> ) * <current_multiple> ) = <times_started> )
      create_panel_block id = goal_tip text = ( <goal_tips> [ <tips_index> ] ) pos = <tip_pos> style = panel_message_tips just = [ center top ]
      break
    else
      tips_index = ( <tips_index> - 1 )
      current_multiple = ( <current_multiple> - <goal_tip_interval> )
    endif
  repeat <array_size>
endscript

script goal_no_valid_key_combos
  create_speech_box text = "You don't know enough tricks!  Come back when you've learned something."
  GoalManager_DeactivateGoal name = <goal_id>
endscript

script AddGoal_Combo
  GoalManager_CreateGoalName Goal_Type = "Combo"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_amateurCOMBOline_genericParams
      <...>
    }
  }
endscript

script AddGoal_ProCombo
  GoalManager_CreateGoalName Goal_Type = "ProCombo"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_ProCOMBOline_genericParams
      <...>
    }
  }
endscript

script AddGoal_MedCombo
  GoalManager_CreateGoalName Goal_Type = "MedCombo"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_MedCOMBOline_genericParams
      <...>
    }
  }
endscript

script AddGoal_Skate
  GoalManager_CreateGoalName Goal_Type = "Skate"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_SkateLetters_genericParams
      <...>
    }
  }
endscript

script AddGoal_HighScore
  GoalManager_CreateGoalName Goal_Type = "HighScore"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_HighScore_genericParams
      <...>
    }
  }
endscript

script AddGoal_ProScore
  GoalManager_CreateGoalName Goal_Type = "ProScore"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_ProScore_GenericParams
      <...>
    }
  }
endscript

script AddGoal_SickScore
  GoalManager_CreateGoalName Goal_Type = "SickScore"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_SickScore_GenericParams
      <...>
    }
  }
endscript

script AddGoal_Collect
  if GotParam CAREER_ONLY
    if InNetGame
      return
    endif
  endif
  GoalManager_CreateGoalName Goal_Type = "Collect"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Collect_GenericParams
      <...>
    }
  }
endscript

script AddGoal_Collect2
  if GotParam CAREER_ONLY
    if InNetGame
      return
    endif
  endif
  GoalManager_CreateGoalName Goal_Type = "Collect2"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Collect2_GenericParams
      <...>
    }
  }
endscript

script AddGoal_Competition
  if GotParam CAREER_ONLY
    if InNetGame
      return
    endif
  endif
  GoalManager_CreateGoalName Goal_Type = "Comp"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Comp_GenericParams
      <...>
    }
  }
endscript

script AddGoal_Competition2
  if GotParam CAREER_ONLY
    if InNetGame
      return
    endif
  endif
  GoalManager_CreateGoalName Goal_Type = "Comp2"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Comp2_GenericParams
      <...>
    }
  }
endscript

script AddGoal_Trickspot
  GoalManager_CreateGoalName Goal_Type = "Trickspot"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_trickspot_genericParams
      <...>
    }
  }
endscript

script AddGoal_Trickspot2
  GoalManager_CreateGoalName Goal_Type = "Trickspot2"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_trickspot2_genericParams
      <...>
    }
  }
endscript

script AddGoal_Trickspot3
  GoalManager_CreateGoalName Goal_Type = "Trickspot3"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_trickspot3_genericParams
      <...>
    }
  }
endscript

script AddGoal_Trickspot4
  GoalManager_CreateGoalName Goal_Type = "Trickspot4"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_trickspot4_genericParams
      <...>
    }
  }
endscript

script AddGoal_Trickspot5
  GoalManager_CreateGoalName Goal_Type = "Trickspot5"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_trickspot5_genericParams
      <...>
    }
  }
endscript

script AddGoal_Gaps
  GoalManager_CreateGoalName Goal_Type = "Gaps"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Gaps_genericParams
      <...>
    }
  }
endscript

script AddGoal_Gaps2
  GoalManager_CreateGoalName Goal_Type = "Gaps2"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Gaps2_genericParams
      <...>
    }
  }
endscript

script AddGoal_Gaps3
  GoalManager_CreateGoalName Goal_Type = "Gaps3"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Gaps3_genericParams
      <...>
    }
  }
endscript

script AddGoal_Gaps4
  GoalManager_CreateGoalName Goal_Type = "Gaps4"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Gaps4_genericParams
      <...>
    }
  }
endscript

script AddGoal_Gaps5
  GoalManager_CreateGoalName Goal_Type = "Gaps5"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Gaps5_genericParams
      <...>
    }
  }
endscript

script AddGoal_Gaps6
  GoalManager_CreateGoalName Goal_Type = "Gaps6"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Gaps6_genericParams
      <...>
    }
  }
endscript

script AddGoal_Race
  GoalManager_CreateGoalName Goal_Type = "Race"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Race_GenericParams
      <...>
    }
  }
endscript

script AddGoal_Race2
  GoalManager_CreateGoalName Goal_Type = "Race2"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Race2_GenericParams
      <...>
    }
  }
endscript

script AddGoal_Race3
  GoalManager_CreateGoalName Goal_Type = "Race3"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Race3_GenericParams
      <...>
    }
  }
endscript

script AddGoal_Race4
  GoalManager_CreateGoalName Goal_Type = "Race4"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Race4_GenericParams
      <...>
    }
  }
endscript

script AddGoal_Horse
  GoalManager_CreateGoalName Goal_Type = "Horse"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_horse_genericParams
      <...>
    }
  }
endscript

script AddGoal_Horse2
  GoalManager_CreateGoalName Goal_Type = "Horse2"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_horse2_genericParams
      <...>
    }
  }
endscript

script AddGoal_HighCombo
  GoalManager_CreateGoalName Goal_Type = "HighCombo"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_highcombo_genericParams
      <...>
    }
  }
endscript

script AddGoal_HighCombo2
  GoalManager_CreateGoalName Goal_Type = "HighCombo2"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_highcombo2_genericParams
      <...>
    }
  }
endscript

script AddGoal_Kill
  GoalManager_CreateGoalName Goal_Type = "Kill"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_kill_genericParams
      <...>
    }
  }
endscript

script AddGoal_Special
  GoalManager_CreateGoalName Goal_Type = "Special"
  GoalManager_AddGoal name = <goal_id> {
    params = { Goal_Special_GenericParams
      <...>
    }
  }
endscript

script AddGoal_Tetris
  GoalManager_CreateGoalName Goal_Type = "Tetris"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_tetris_genericParams
      <...>
    }
  }
endscript

script AddGoal_Tetris2
  GoalManager_CreateGoalName Goal_Type = "Tetris2"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_tetris2_genericParams
      <...>
    }
  }
endscript

script AddGoal_Counter
  GoalManager_CreateGoalName Goal_Type = "Counter"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_counter_genericParams
      <...>
    }
  }
endscript

script AddGoal_Counter2
  GoalManager_CreateGoalName Goal_Type = "Counter2"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_counter2_genericParams
      <...>
    }
  }
endscript

script AddGoal_Counter3
  GoalManager_CreateGoalName Goal_Type = "Counter3"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_counter3_genericParams
      <...>
    }
  }
endscript

script AddGoal_Counter4
  GoalManager_CreateGoalName Goal_Type = "Counter4"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_counter4_genericParams
      <...>
    }
  }
endscript

script AddGoal_CounterCombo
  GoalManager_CreateGoalName Goal_Type = "CounterCombo"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_countercombo_genericParams
      <...>
    }
  }
endscript

script AddGoal_CounterCombo2
  GoalManager_CreateGoalName Goal_Type = "CounterCombo2"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_countercombo2_genericParams
      <...>
    }
  }
endscript

script AddGoal_SkateTheLine
  GoalManager_CreateGoalName Goal_Type = "SkateTheLine"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_SkateTheLine_genericparams
      <...>
    }
  }
endscript

script AddGoal_Tour
  GoalManager_CreateGoalName Goal_Type = "Tour"
  GoalManager_AddGoal name = <goal_id> {
    params = { goal_tour_genericParams
      <...>
    }
  }
endscript

script AddMinigame_TimedCombo
  GoalManager_CreateGoalName Goal_Type = "minigame_TimedCombo"
  GoalManager_AddGoal name = <goal_id> {
    params = { minigame_TimedCombo_GenericParams
      <...>
    }
  }
endscript

script AddMinigame_Fountain
  GoalManager_CreateGoalName Goal_Type = "minigame_fountain"
  GoalManager_AddGoal name = <goal_id> {
    params = { minigame_fountain_genericParams
      <...>
    }
  }
endscript

script AddMinigame_Fountain2
  GoalManager_CreateGoalName Goal_Type = "minigame_fountain2"
  GoalManager_AddGoal name = <goal_id> {
    params = { minigame_fountain2_genericParams
      <...>
    }
  }
endscript

script AddMinigame_Height
  GoalManager_CreateGoalName Goal_Type = "minigame_height"
  GoalManager_AddGoal name = <goal_id> {
    params = { minigame_Height_GenericParams
      <...>
    }
  }
endscript

script AddBettingGuy
  GoalManager_CreateGoalName Goal_Type = "betting_guy"
  GoalManager_AddGoal name = <goal_id> {
    params = { betting_guy_GenericParams
      CAREER_ONLY
      <...>
    }
  }
endscript

script AddMinigame_trickspot
  GoalManager_CreateGoalName Goal_Type = "minigame_trickspot"
  GoalManager_AddGoal name = <goal_id> {
    params = { minigame_trickspot_genericParams
      <...>
    }
  }
endscript

script AddMinigame_Timer
  GoalManager_CreateGoalName Goal_Type = "minigame_timer"
  GoalManager_AddGoal name = <goal_id> {
    params = { minigame_timer_GenericParams
      <...>
    }
  }
endscript

script AddMinigame_Generic
  GoalManager_CreateGoalName Goal_Type = "minigame_generic"
  GoalManager_AddGoal name = <goal_id> {
    params = { minigame_generic_GenericParams
      <...>
    }
  }
endscript

script AddMinigame_Generic2
  GoalManager_CreateGoalName Goal_Type = "minigame_generic2"
  GoalManager_AddGoal name = <goal_id> {
    params = { minigame_generic2_GenericParams
      <...>
    }
  }
endscript

script AddMinigame_Generic3
  GoalManager_CreateGoalName Goal_Type = "minigame_generic3"
  GoalManager_AddGoal name = <goal_id> {
    params = { minigame_generic3_GenericParams
      <...>
    }
  }
endscript

script AddMinigame_Generic4
  GoalManager_CreateGoalName Goal_Type = "minigame_generic4"
  GoalManager_AddGoal name = <goal_id> {
    params = { minigame_generic4_GenericParams
      <...>
    }
  }
endscript

script panel_message_goalfail
  SetProps just = [ center bottom ] rgba = [ 115 26 26 128 ]
  RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = 1500 }
  DoMorph pos = (320, 82) time = 0 scale = 0
  DoMorph time = 0.3 scale = 1
endscript

script panel_sprite_goalfail time = 1500
  SetProps just = [ center center ] rgba = [ 115 26 26 128 ]
  RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> }
  DoMorph time = 0 scale = 0 pos = (320, 104)
  DoMorph time = 0.1 scale = 2.4
  DoMorph time = 0.18 scale = 0.6
  DoMorph time = 0.16 scale = 1.2
  DoMorph time = 0.14 scale = 0.8
  DoMorph time = 0.12 scale = 1
endscript

script panel_message_goalfailline2 time = 1500
  SetProps font = small just = [ center center ] rgba = [ 115 26 26 128 ]
  RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> }
  DoMorph pos = (320, 137) scale = 0.2 alpha = 0
  DoMorph time = 0.1 scale = 2.4 alpha = 1
  DoMorph time = 0.18 scale = 0.6
  DoMorph time = 0.16 scale = 1.2
  DoMorph time = 0.14 scale = 0.8
  DoMorph time = 0.12 scale = 1.0
endscript

script panel_message_goalcomplete time = 1500
  GetTags
  RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> }
  SetProps just = [ center bottom ] rgba = [ 127 102 0 128 ]
  DoMorph time = 0 pos = (320, 302) scale = 0 alpha = 0
  DoMorph time = 0.15 scale = 1.8 alpha = 1
  DoMorph time = 0.1 scale = 0.9
  DoMorph time = 0.1 scale = 1.3
  DoMorph time = 0.1 scale = 1.0
  DoMorph time = 0.1 scale = 1.1
  DoMorph time = 0.1 pos = (318, 300)
  DoMorph time = 0.1 pos = (322, 300)
  DoMorph time = 0.1 pos = (320, 304)
  DoMorph time = 0.1 pos = (318, 300)
  DoMorph time = 0.1 pos = (322, 300)
  DoMorph time = 0.1 pos = (318, 300)
  DoMorph time = 0.1 pos = (322, 300)
  DoMorph time = 0.2 pos = (320, 302) scale = 0 alpha = 0
endscript

script panel_sprite_goalcomplete time = 1500
  SetProps just = [ center center ] rgba = [ 127 102 0 128 ]
  DoMorph pos = (0, 330) scale = 0 alpha = 0 time = 0
  DoMorph pos = (264, 330) scale = 1 alpha = 1 time = 0.1
  Wait 1 frame
  DoMorph pos = (258, 330) time = 0.1
  Wait 1 frame
  DoMorph pos = (260, 330) time = 0.1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph pos = (0, 330) scale = 0.5 alpha = 0 time = 0.2
  FireEvent type = panel_sprite_goalcomplete_done
endscript

script panel_message_goalcompleteline2 time = 1500
  SetProps font = small just = [ center center ] rgba = [ 128 128 128 128 ]
  DoMorph pos = (343, 328) scale = 6 alpha = 0 time = 0
  DoMorph pos = (343, 328) scale = 0.75 alpha = 1 time = 0.1
  Wait 1 frame
  DoMorph pos = (343, 328) scale = 1.2 alpha = 1 time = 0.1
  Wait 1 frame
  DoMorph pos = (343, 328) scale = 1 alpha = 1 time = 0.1
  Wait 1 frame
  SetProps blur_effect
  do_blur_effect
  SetProps no_blur_effect
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 alpha = 0.4
  DoMorph time = 0.1 alpha = 1
  DoMorph pos = (700, 328) scale = 0.5 alpha = 0 time = 0.2
  Die
  FireEvent type = panel_message_goalcompleteline2_done
endscript

script panel_message_new_record
  SetProps font = small just = [ center center ] rgba = [ 125 123 7 128 ]
  DoMorph time = 0 pos = (320, 100) scale = 0 alpha = 0 // Moves the new record text lower to prevent it from overlapping with other reward text, as they now all appear at the same time.
  DoMorph time = 0.5 alpha = 1
  if GotParam sound
    PlaySound <sound> vol = 150
  endif
  DoMorph time = 0.1 scale = 1.7
  DoMorph time = 0.1 scale = 0.8
  DoMorph time = 0.1 scale = 1.2
  DoMorph time = 0.1 scale = 0.9
  DoMorph time = 0.1 scale = 1.0
  DoMorph pos = (321, 101) time = 0.1
  DoMorph pos = (319, 99) time = 0.1
  DoMorph pos = (321, 101) time = 0.1
  DoMorph pos = (319, 99) time = 0.1
  DoMorph time = 0.1 scale = 1.4
  DoMorph time = 0.15 scale = 0 alpha = 0
  FireEvent type = panel_message_new_record_done
  Die
endscript

script panel_message_debug // Unused, likely just me testing and using this as a visual signal something triggered
  SetProps font = large just = [ center center ] rgba [ 255 0 0 128]
endscript

script panel_message_goal blink_time = 0.05 final_pos = (620, 27)
  if not GotParam dont_animate
    SetProps just = [ center top ] internal_just = [ center center ] rgba = [ 128 128 128 128 ]
    DoMorph pos = (320, 114) scale = 0
    DoMorph pos = (320, 114) scale = 1.2 time = 0.1
    DoMorph pos = (320, 114) scale = 0.8 time = 0.1
    DoMorph pos = (320, 114) scale = 1 time = 0.1
    DoMorph pos = (320, 114) scale = 0.9 time = 0.1
    DoMorph pos = (321, 116) time = 0.1
    DoMorph pos = (319, 113) time = 0.1
    DoMorph pos = (321, 115) time = 0.1
    DoMorph pos = (318, 113) time = 0.1
    DoMorph pos = (321, 115) time = 0.1
    DoMorph pos = (319, 113) time = 0.1
    DoMorph pos = (321, 117) time = 0.1
    DoMorph pos = (319, 113) time = 0.1
    DoMorph pos = (320, 120) scale = 1.25 time = 0.1
  endif
  SetProps internal_just = [ center top ] rgba = [ 128 128 128 110 ] just = [ right top ]
  DoMorph pos = <final_pos> scale = 0.78 time = 0.05
  begin
    DoMorph alpha = 0
    Wait <blink_time> seconds
    DoMorph alpha = 1
    Wait <blink_time> seconds
  repeat 6
  FireEvent type = panel_message_goal_done
  FireEvent type = panel_message_goal_done2
endscript

script panel_message_new_goal
  SetProps font = small just = [ center center ] rgba = [ 128 128 128 128 ]
  DoMorph pos = (320, 184) time = 0
  DoMorph pos = (320, 184) scale = 0 time = 0
  DoMorph pos = (320, 184) scale = 1.5 time = 0.1
  DoMorph pos = (320, 184) scale = 0.9 time = 0.1
  DoMorph pos = (320, 184) scale = 1.2 time = 0.1
  DoMorph pos = (320, 184) scale = 1.1 time = 0.1
  DoMorph pos = (321, 185) time = 0.1
  DoMorph pos = (319, 183) time = 0.1
  DoMorph pos = (321, 185) time = 0.1
  DoMorph pos = (319, 183) time = 0.1
  DoMorph pos = (321, 185) time = 0.1
  DoMorph pos = (319, 183) time = 0.1
  DoMorph pos = (321, 185) time = 0.1
  DoMorph pos = (319, 183) time = 0.1
  DoMorph pos = (321, 185) time = 0.1
  DoMorph alpha = 0 time = 0.5
  Die
endscript

script panel_sprite_new_goal time = 1500
  SetProps just = [ center center ] rgba = [ 128 128 128 128 ]
  RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = <time> }
  DoMorph time = 0.1 scale = 0 pos = (320, 150)
  DoMorph time = 0.1 scale = 1.5
  DoMorph time = 0.1 scale = 0.6
  DoMorph time = 0.1 scale = 1.3
  DoMorph time = 0.1 scale = 0.8
  DoMorph time = 0.1 scale = 1
  DoMorph pos = (321, 155) time = 0.1
  DoMorph pos = (319, 153) time = 0.1
  DoMorph pos = (321, 155) time = 0.1
  DoMorph pos = (319, 153) time = 0.1
  DoMorph pos = (321, 155) time = 0.1
  DoMorph pos = (319, 153) time = 0.1
  Wait 0.95 second
  DoMorph alpha = 0 time = 2
endscript

script panel_message_generic_loss
  SetProps just = [ center center ] rgba = [ 128 128 128 100 ]
  RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = { time = 1500 }
  DoMorph pos = (320, 165) time = 0 scale = 0
  DoMorph time = 0.3 scale = 1
  DoMorph pos = (319, 164) time = 0.1
  DoMorph pos = (321, 166) time = 0.1
  DoMorph pos = (319, 164) time = 0.1
  DoMorph pos = (322, 166) time = 0.1
  DoMorph pos = (319, 164) time = 0.1
  DoMorph pos = (321, 166) time = 0.1
  DoMorph pos = (319, 162) time = 0.1
  DoMorph pos = (321, 166) time = 0.1
  DoMorph pos = (319, 164) time = 0.1
  DoMorph pos = (321, 166) time = 0.1
  DoMorph pos = (318, 164) time = 0.1
  DoMorph pos = (321, 167) time = 0.1
endscript

script panel_message_goal_description
  SetProps rgba = [ 128 128 128 128 ] just = [ center center ]
  DoMorph time = 0 scale = 1 pos = (320, 120)
endscript

script panel_message_tips blink_time = 0.05
  SetProps just = [ center top ] internal_just = [ center center ] rgba = [ 127 102 0 100 ]
  DoMorph scale = 0
  DoMorph scale = 1.2 time = 0.1
  DoMorph scale = 0.8 time = 0.1
  DoMorph scale = 1 time = 0.1
  DoMorph scale = 0.9 time = 0.1
  DoMorph pos = { (1, 2) relative } time = 0.1
  DoMorph pos = { (-2, -3) relative } time = 0.1
  DoMorph pos = { (2, 2) relative } time = 0.1
  DoMorph pos = { (-3, -2) relative } time = 0.1
  DoMorph pos = { (3, 2) relative } time = 0.1
  DoMorph pos = { (-2, -2) relative } time = 0.1
  DoMorph pos = { (2, 4) relative } time = 0.1
  DoMorph pos = { (-2, -4) relative } time = 0.1
  DoMorph pos = { (1, 7) relative } scale = 1.25 time = 0.1
  SetProps internal_just = [ center top ] rgba = [ 127 102 0 90 ] just = [ right top ]
  DoMorph pos = { (155, -40) relative } scale = 0.78 time = 0.05
  begin
    DoMorph alpha = 0
    Wait <blink_time> seconds
    DoMorph alpha = 1
    Wait <blink_time> seconds
  repeat 6
endscript

script panel_message_kongoal blink_time = 0.05 final_pos = (620, 100) // This is the text animation that's used when the goal requirements for King of Kona and Bullseye Launch, allowing the goals to be completed early without waiting for the timer or use the rest of your ramp attempts
  SetProps internal_just = [ center top ] rgba = [ 128 64 128 100 ] just = [ right top ]
  DoMorph pos = <final_pos> scale = 0.78 time = 0.05
  begin
    DoMorph alpha = 0
    Wait <blink_time> seconds
    DoMorph alpha = 1
    Wait <blink_time> seconds
  repeat 6
  Wait 2 seconds
  DoMorph alpha = 0 time = 5
  die
endscript

script clock_morph
  DoMorph scale = 0 alpha = 0 time = 0.1
  DoMorph scale = 2.0 alpha = 1 time = 0.15
  DoMorph scale = 0.8 alpha = 0.5 time = 0.16
  DoMorph scale = 1.3 alpha = 1 time = 0.17
  DoMorph scale = 0.9 alpha = 0.7 time = 0.19
  DoMorph scale = 1.0 alpha = 1 time = 0.2
endscript

script goal_message_got_trickslot
  SetProps rgba = [ 43 95 53 128 ]
  DoMorph time = 0 pos = (320, 200) scale = 0 alpha = 0 // text moved to prevent overlapping as all reward texts now show at the same time
  DoMorph time = 0.1 alpha = 1
  if GotParam sound
    PlaySound <sound> vol = 150
  endif
  DoMorph time = 0.1 scale = 1.7
  DoMorph time = 0.1 scale = 0.8
  DoMorph time = 0.1 scale = 1.2
  DoMorph time = 0.1 scale = 0.9
  DoMorph time = 0.1 scale = 1.0
  DoMorph pos = (321, 201) time = 0.1
  DoMorph pos = (319, 199) time = 0.1
  DoMorph pos = (321, 201) time = 0.1
  DoMorph pos = (319, 199) time = 0.1
  DoMorph time = 0.1 scale = 1.4
  DoMorph time = 0.15 scale = 0 alpha = 0
  Die
  FireEvent type = goal_got_reward_done
endscript

script goal_message_got_stat
  SetProps rgba = [ 43 95 53 128 ]
  DoMorph time = 0 pos = (320, 214) scale = 0 alpha = 0
  DoMorph time = 0.5 alpha = 1
  if GotParam sound
    PlaySound <sound> vol = 150
  endif
  DoMorph time = 0.1 scale = 1.7
  DoMorph time = 0.1 scale = 0.8
  DoMorph time = 0.1 scale = 1.2
  DoMorph time = 0.1 scale = 0.9
  DoMorph time = 0.1 scale = 1.0
  DoMorph pos = (321, 215) time = 0.1
  DoMorph pos = (319, 213) time = 0.1
  DoMorph pos = (321, 215) time = 0.1
  DoMorph pos = (319, 213) time = 0.1
  DoMorph time = 0.1 scale = 1.4
  DoMorph time = 0.15 scale = 0 alpha = 0
  Die
  FireEvent type = goal_got_reward_done
endscript

script goal_message_got_bigbucks
  SetProps rgba = [ 43 95 53 128 ]
  DoMorph time = 0 pos = (320, 214) scale = 0 alpha = 0
  DoMorph time = 0.5 alpha = 1
  if GotParam sound
    PlaySound <sound> vol = 150
  endif
  DoMorph time = 0.1 scale = 1.7
  DoMorph time = 0.1 scale = 0.8
  DoMorph time = 0.1 scale = 1.2
  DoMorph time = 0.1 scale = 0.9
  DoMorph time = 0.1 scale = 1.0
  DoMorph pos = (321, 215) time = 0.1
  DoMorph pos = (319, 213) time = 0.1
  DoMorph pos = (321, 215) time = 0.1
  DoMorph pos = (319, 213) time = 0.1
  DoMorph pos = (321, 215) time = 0.1
  DoMorph pos = (319, 213) time = 0.1
  DoMorph pos = (321, 215) time = 0.1
  DoMorph pos = (319, 213) time = 0.1
  DoMorph pos = (321, 215) time = 0.1
  DoMorph pos = (319, 213) time = 0.1
  DoMorph pos = (321, 215) time = 0.1
  DoMorph pos = (319, 213) time = 0.1
  DoMorph time = 0.1 scale = 1.4
  DoMorph time = 0.15 scale = 0 alpha = 0
  Die
  FireEvent type = goal_got_reward_done
endscript

script goal_message_got_money
  SetProps rgba = [ 36 125 24 128 ]
  DoMorph time = 0 pos = (320, 114) scale = 0 alpha = 0
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 scale = 1.7
  DoMorph time = 0.1 scale = 0.9
  DoMorph time = 0.1 scale = 1.0
  DoMorph alpha = 0.4 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.6 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.3 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.6 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph time = 0.1 scale = 1.4
  DoMorph time = 0.1 scale = 0 alpha = 0
  Die
  FireEvent type = goal_got_reward_done
endscript

script goal_message_got_money2
  SetProps rgba = [ 36 125 24 128 ]
  DoMorph time = 0 pos = (320, 114) scale = 0 alpha = 0
  DoMorph time = 0.1 alpha = 1
  DoMorph time = 0.1 scale = 1.7
  DoMorph time = 0.1 scale = 0.9
  DoMorph time = 0.1 scale = 1.0
  DoMorph alpha = 0.4 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.6 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.3 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.6 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.6 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.3 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.6 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.3 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.6 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.6 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.3 time = 0.07
  DoMorph alpha = 1 time = 0.07
  DoMorph alpha = 0.6 time = 0.07
  DoMorph alpha = 1 time = 0.07 scale = 1.0
  DoMorph time = 0.1 scale = 1.4
  DoMorph time = 0.1 scale = 0 alpha = 0
  Die
  FireEvent type = goal_got_reward_done
endscript

script goal_got_goal_point
  SetProps rgba = [ 43 95 53 128 ]
  DoMorph time = 0 pos = (320, 214) scale = 0 alpha = 0
  DoMorph time = 0.5 alpha = 1
  DoMorph time = 0.1 scale = 1.7
  DoMorph time = 0.1 scale = 0.8
  DoMorph time = 0.1 scale = 1.2
  DoMorph time = 0.1 scale = 0.9
  DoMorph time = 0.1 scale = 1.0
  DoMorph pos = (321, 215) time = 0.1
  DoMorph pos = (319, 213) time = 0.1
  DoMorph time = 0.5 alpha = 0 pos = (320, 384) rgb = [ 50 50 50 ]
  Die
  FireEvent type = goal_got_goal_point_done
endscript

script panel_message_current_goal_key_combo
  SetProps just = [ right top ] rgba = [ 128 128 128 128 ]
  DoMorph pos = (445, 175)
  DoMorph pos = (445, 175) time = 1.2
  DoMorph pos = (630, 63) scale = 1.3 time = 0.1
  DoMorph pos = (630, 63) scale = 0.8 time = 0.11
  begin
    DoMorph alpha = 0
    Wait <blink_time> seconds
    DoMorph alpha = 1
    Wait <blink_time> seconds
  repeat 6
endscript
goal_pro_last_names = {
  tony = "Hawk"
  bam = "Margera"
  bucky = "Lasek"
  chad = "Muska"
  jamie = "Thomas"
  rodney = "Mullen"
  eric = "Koston"
  rune = "Glifberg"
  geoff = "Rowley"
  andrew = "Reynolds"
  steve = "Caballero"
  elissa = "Steamer"
  bob = "Burnquist"
  kareem = "Campbell"
}
goal_pro_last_name_checksums = {
  tony = Hawk
  bam = Margera
  bucky = Lasek
  chad = Muska
  jamie = Thomas
  rodney = Mullen
  eric = Koston
  rune = Glifberg
  geoff = Rowley
  andrew = Reynolds
  steve = Caballero
  elissa = Steamer
  bob = Burnquist
  kareem = Campbell
  custom = custom
  jenna = jameson
  jango = fett
  eddie = eddie
  mike = vallely
}
goal_pro_specific_challenges_beaten = {
  Hawk = 0
  Margera = 0
  Lasek = 0
  Muska = 0
  Thomas = 0
  Mullen = 0
  Koston = 0
  Glifberg = 0
  Rowley = 0
  Reynolds = 0
  Caballero = 0
  Steamer = 0
  Burnquist = 0
  Campbell = 0
  custom = 0
}
