script Game_Update
  GoalManager_UpdateAllGoals
endscript
script WaitFrameLoop
  begin
    Wait 1 gameframe
  repeat
endscript
script SetGameState
  SetCurrentGameType
  cleanup_before_loading_level
  LaunchGame
endscript
script load_requested_level // zed TODO: Look at later for possible trick font and special bar toggle fix
  GetCurrentLevel
  LoadLevel level = <level>
endscript
script InitializeGameFlow
  load_requested_level
  StandardGameFlow
endscript
script ChangeLevelGameFlow // zed TODO: Look at later for possible trick font and special bar toggle fix
  Change FirstTimeInSplitScreen = 1
  if not IsObserving
    Skater:SetCustomRestart clear
  endif
  load_requested_level
  ResetSkaters
  if InNetGame
    if not GameModeEquals is_lobby
      SetGameType netlobby
      SetCurrentGameType
    endif
    if OnServer
      GetPreferenceChecksum pref_type = network team_mode
      switch <checksum>
      case teams_none
        SetNumTeams 0
        Printf "Team mode off"
      case teams_two
        SetNumTeams 2
        Printf "2 Teams"
      case teams_three
        SetNumTeams 3
        Printf "3 Teams"
      case teams_four
        SetNumTeams 4
        Printf "4 Teams"
      endswitch
    endif
  endif
  begin
    if SkatersAreReady
      break
    endif
    Wait 1 gameframe
  repeat
  SetScreenModeFromGameMode
  StandardGameFlow
endscript
script pause_game_flow
  Printf "Pausing game flow"
  PauseGameFlow
  Wait 1 gameframe
endscript
script unpause_game_flow
  Printf "Unpausing game flow"
  UnpauseGameFlow
endscript
script GameFlow_Startup
  DisablePause
  begin
    Wait 1 gameframe
    if SkatersAreReady
      break
    endif
  repeat
  RestartLevel
  InitializeSkaters
  KillMessages
  TogglePanel 0
  PauseStream 0
  if InNetGame
    if GameModeEquals is_lobby
      if OnServer
        server_enter_free_skate
      else
        if IsHost
          server_enter_free_skate
        endif
        client_enter_free_skate
      endif
      if InInternetMode
        if OnServer
          PostGame
        endif
      endif
    endif
  endif
  if not InNetGame
    ReinsertSkaters
  endif
  SetScreenModeFromGameMode
  if InMultiplayerGame
    destroy_panel_stuff
    create_panel_stuff
  endif
  if GameModeEquals is_horse
    StartHorse
  endif
  DeallocateReplayMemory
  if not InMultiplayerGame
    if not CareerLevelIs LevelNum_Skateshop
      if not InGroupRoom
        AllocateReplayMemory
        Change EndOfReplayShouldJumpToPauseMenu = 0
        if NeedToLoadReplayBuffer
          if LoadReplayData
            view_loaded_replay
          else
            Printf "Loading replay from mem card failed !!!"
          endif
        endif
      endif
    endif
  endif
endscript
script GameFlow_StartRun
  if not LevelIs load_skateshop
    if GameModeEquals is_singlesession
      Printf "*********** SETTING END OF RUN TYPE ********"
      StartGoal_TrickAttack time = 120
      GoalManager_SetEndRunType name = TrickAttack EndOfRun
      SetScoreAccumulation 1
    endif
  endif
  if InSplitScreenGame
    GetSkaterID Skater = 0
     <ObjId>:Obj_SpawnScript CleanUp_Scuffs
    GetSkaterID Skater = 1
     <ObjId>:Obj_SpawnScript CleanUp_Scuffs
  else
    if not IsObserving
      Skater:Obj_SpawnScript CleanUp_Scuffs
    endif
  endif
  if not IsTrue Bootstrap_Build
    if not InNetGame
      toggle_geo_nomenu toggle_comp_geo_params
    endif
  endif
  toggle_geo_nomenu toggle_proset1_params
  toggle_geo_nomenu toggle_proset2_params
  toggle_geo_nomenu toggle_proset3_params
  toggle_geo_nomenu toggle_proset4_params
  toggle_geo_nomenu toggle_proset5_params
  toggle_geo_nomenu toggle_proset6_params
  toggle_geo_nomenu toggle_proset7_params
  PlaySkaterCamAnim Skater = 0 stop
  TogglePanel 1
  DisablePause
  ResetSkaters
  if IsCareerMode
    UnSetGlobalFlag flag = PROMPT_FOR_SAVE
  endif
  if CareerLevelIs LevelNum_Tutorials
    PauseMusic 1
  else
    Printf "starting a run....skip tracks and crank up the music"
    if GameModeEquals is_horse
    else
      SkipMusicTrack
    endif
    if IsCareerMode
      if IsTrue ALWAYSPLAYMUSIC
        PauseMusic 0
      else
        PauseMusic 1
      endif
    else
      PauseMusic 0
    endif
  endif
  if GameModeEquals default_time_limit
    UnSetFlag flag = GOAL_MID_GOAL
    ResetClock
    PauseClock
  else
  endif
  if GameModeEquals is_king
    SpawnCrown
  endif
  if GameModeEquals is_horse
    horse_start_run
  endif
  if InMultiplayerGame
    SpawnScript Splitscreen_StartupScript
  endif
  if InNetGame
    if OnServer
    else
      LaunchQueuedScripts
      if IsObserving
        ShowAllObjects
        GoalManager_InitializeAllSelectedGoals
      endif
    endif
  endif
  SpawnScript wait_and_check_for_unplugged_controllers
endscript
script GameFlow_PlayRun
  if IsTrue AlwaysDump
    DumpHeaps
    Change AlwaysDump = 0
  endif
  if not LevelIs load_skateshop
    if not RunningReplay
      if ScreenElementExists id = controller_unplugged_dialog_anchor
        kill_start_key_binding
      else
        Restore_Start_Key_Binding
      endif
    endif
  endif
  if IsTrue Bootstrap_Build
    if CareerLevelIs LevelNum_Sch
      if IsTrue STARTGAME_FIRST_TIME
        create_startup_menu
      endif
    endif
  endif
  Wait 3 gameframe
  HideLoadingScreen
  if InSplitScreenGame
    if IsTrue FirstTimeInSplitScreen
      ScreenElementSystemCleanup
      Change FirstTimeInSplitScreen = 0
      PauseGame
      create_end_run_menu
    endif
  endif
  if InMultiplayerGame
  else
    UseOnePadInFrontEnd
  endif
  EnableActuators
  EnablePause
  begin
    if ShouldEndRun
      Printf "************ SHOULD BREAK"
      break
    endif
    if GameModeEquals is_horse
      if FirstTrickStarted
        HideClock
        Printf "************ TRICK STARTED"
        break
      endif
    endif
    Wait 1 gameframe
    if GetFlag flag = GameFlagChangeLevelToSuburbia
      UnSetFlag flag = GameFlagChangeLevelToSuburbia
      ChangeLevelToSuburbia
    endif
  repeat
endscript
script GameFlow_WaitEnd
  Printf "************ IN GAMEFLOW_WAITEND"
  begin
    if EndRunSelected
      break
    endif
    if IsCareerMode
      if TimeUp
        TimeUpScript
      endif
    else
      if not LevelIs load_skateshop
        if AllSkatersAreIdle
          break
        endif
      endif
    endif
    Wait 1 gameframe
  repeat
  EnableActuators 0
  Printf "About to disable"
  DisablePause
  Wait 2 game frames
  if not GameModeEquals is_singlesession
    UnPauseGame
  endif
  FrontEndSetInactive
  Wait 2 game frames
  TogglePanel 0
  KillMessages
  KillSpawnedScript name = SK3_Killskater_Finish
endscript
script GameFlow_End
  Printf "************** IN GAMEFLOW END************"
  begin
    if CalculateFinalScores
      break
    endif
    Wait 1 gameframe
  repeat
  if IsCareerMode
    if GetGlobalFlag flag = SHOW_CREDITS
      UnSetGlobalFlag flag = SHOW_CREDITS
      if CD
        Wait 1 gameframe
        ingame_play_movie "movies\credits"
      endif
    endif
  else
    if IsCustomPark
    else
      if GameModeEquals is_singlesession
      endif
    endif
  endif
  if JustGotFlag flag = GOAL_STAT_POINT1
    Printf "stat point"
    SwitchToMenu menu = stats_menu
    pause_game_flow
  else
    if JustGotFlag flag = GOAL_STAT_POINT2
      Printf "stat point"
      SwitchToMenu menu = stats_menu
      pause_game_flow
    else
      if JustGotFlag flag = GOAL_STAT_POINT3
        Printf "stat point"
        SwitchToMenu menu = stats_menu
        pause_game_flow
      else
        if JustGotFlag flag = GOAL_STAT_POINT4
          Printf "stat point"
          SwitchToMenu menu = stats_menu
          pause_game_flow
        else
          if JustGotFlag flag = GOAL_STAT_POINT5
            Printf "stat point"
            SwitchToMenu menu = stats_menu
            pause_game_flow
          endif
        endif
      endif
    endif
  endif
  Change EnteringStatsMenuFromGameFlow = 0
  if InNetGame
  else
    if IsCareerMode
      if GetGlobalFlag flag = PROMPT_FOR_SAVE
        SwitchToMenu menu = savegame_yesno_menu
      else
        SwitchToMenu menu = end_run_menu
      endif
    else
      SwitchToMenu menu = end_run_menu
    endif
  endif
  if GameModeEquals show_ranking_screen
  endif
  if InNetGame
    if OnServer
      Wait 5 gameframes
      LoadPendingPlayers
    endif
  endif
endscript
script StandardGameFlow
  Printf "starting standard gameflow"
  if not IsVoluntaryObserving
    ObserveSelf
  endif
  GameFlow_Startup
  StandardGameFlowBody
endscript
script StandardGameFlowToggleView
  Printf "starting standard gameflow"
  GameFlow_Startup
  ToggleViewMode
  StandardGameFlowBody
endscript
script StandardGameFlowBody
  begin
    GameFlow_StartRun
    GameFlow_PlayRun
    GameFlow_WaitEnd
    if GameModeEquals is_horse
      if EndRunSelected
        break
      endif
      horse_end_run
      if HorseEnded
        break
      else
        InitializeSkaters
      endif
    else
      break
    endif
  repeat
  if GameModeEquals is_horse
    horse_uninit
  endif
  GameFlow_End
  WaitFrameLoop
endscript
script spawn_movie
  SpawnScript play_movie_task params = { <...> }
endscript
script play_movie_task
  playmovie_script <...>
endscript
script ShowAllObjects
endscript
script TimeUpScript
  if IsCareerMode
  endif
endscript
