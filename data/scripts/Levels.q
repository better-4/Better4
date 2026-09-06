
UsePreFilesForLevelLoading = 0
AlwaysDump = 0
script cleanup_before_loading_level
  Printf "*********************** cleanup_before_loading_level"
  Cleanup
  StopMusic
  PauseMusic
  ClearMusicTrackList
endscript
script PreLevelLoad
endscript
script DisplayProperLoadingScreen
  if EnteringNetGame
    if OnServer
      if IsXBOX
        DisplayLoadingScreen "loadscrn_system_link_x"
      else
        DisplayLoadingScreen "loadscrn_Online"
      endif
    else
      if IsXBOX
        DisplayLoadingScreen "loadscrn_system_x"
      else
        DisplayLoadingScreen "loadscrn_Online2"
      endif
    endif
  else
    if IsTrue FirstTimeFromSkateshop
      DisplayLoadingScreen "loadscrn_2player"
    else
      if GameModeEquals is_horse
        DisplayLoadingScreen "loadscrn_horse"
      else
        if GameModeEquals is_king
          DisplayLoadingScreen "loadscrn_koth"
        else
          if InSlapGame
            DisplayLoadingScreen "loadscrn_slap"
          else
            if GameModeEquals should_modulate_color
              DisplayLoadingScreen "loadscrn_Graffiti"
            else
              if GameModeEquals is_trick_attack
                DisplayLoadingScreen "loadscrn_trick_attack"
              else
                if InSplitScreenGame
                  DisplayLoadingScreen "loadscrn_2player"
                else
                  DisplayLoadingScreen <...>
                endif
              endif
            endif
          endif
        endif
      endif
    endif
  endif
endscript
script PostLevelLoad
endscript
script script_assert <...>
  Printf "ASSERT MESSAGE:"
  ScriptAssert <...>
endscript
script request_level
  if GotParam level
    RequestLevel <level>
  else
    script_assert "request_level needs a level param"
  endif
endscript
script LoadLevel
  MemPushContext 0
  PreLevelLoad
  ScreenElementSystemCleanup
  remove_temp_textures_from_vram
  LaunchLevel <...>
  PostLevelLoad
  MemPopContext
endscript
LevelNum_Skateshop = 0
LevelNum_Sch = 1
LevelNum_SF2 = 2
LevelNum_Alc = 3
LevelNum_Kon = 4
LevelNum_Jnk = 5
LevelNum_Lon = 6
LevelNum_Zoo = 7
LevelNum_Cnv = 8
LevelNum_Hof = 9
LevelNum_Sk4ed = 10
LevelNum_Airport = 1
LevelNum_Canada = 2
LevelNum_Rio = 3
LevelNum_Suburbia = 4
LevelNum_Foundry = 5
LevelNum_SkaterIsland = 6
LevelNum_LA = 7
LevelNum_Tokyo = 8
LevelNum_Ship = 9
LevelNum_Oil = 10
LevelNum_Tutorials = 11
LevelNum_Warehouse = 12
LevelNum_Burnside = 13
LevelNum_Roswell = 14
LevelNum_Rooftops = 15
script LoadLevelPreFile
  if IsTrue UsePreFilesForLevelLoading
    LoadPreFile <...>
  endif
endscript
script set_level_lights
  SetLightAmbientColor r = <ambient_red> g = <ambient_green> b = <ambient_blue>
  SetLightDirection index = 0 heading = <heading_0> pitch = <pitch_0>
  SetLightDiffuseColor index = 0 r = <red_0> g = <green_0> b = <blue_0>
  SetLightDirection index = 1 heading = <heading_1> pitch = <pitch_1>
  SetLightDiffuseColor index = 1 r = <red_1> g = <green_1> b = <blue_1>
  SetDynamicLightModulationFactor ambient value = <ambient_mod_factor>
  SetDynamicLightModulationFactor directional = 0 value = <mod_factor_0>
  SetDynamicLightModulationFactor directional = 1 value = <mod_factor_1>
endscript
script load_level level_number = 0
  RememberLevelStructureNameForReplays level_structure_name = <structure_name>
  if ( ( CD ) or ( IsTrue TestMusicFromHost ) )
    if GotParam ambient_track
      AddMusicTrack <ambient_track>
    endif
  endif
  kill_start_key_binding
  Printf "replace_handlers to take away start key in load_level"
  set_level_lights <...>
  SetScoreAccumulation 0
  if GameModeEquals is_singlesession
    Printf "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS"
    Printf "setting score degradation to 1"
    Printf "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS"
    SetScoreDegradation 1
  else
    Printf "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS"
    Printf "setting score degradation to 0"
    Printf "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS"
    SetScoreDegradation 0
  endif
  if InSplitScreenGame
    UnSetGlobalFlag flag = CHEAT_DISCO
  endif
  if IsTrue Bootstrap_build
    DisplayLoadingScreen "loadscrn_demo_controls" 27
  else
    if GotParam loading_screen
      if EnteringNetGame
        if OnServer
          if IsXBOX
            DisplayLoadingScreen <loading_screen> <loading_time>
          else
            DisplayLoadingScreen <loading_screen> <loading_time>
          endif
        else
          if IsXBOX
            DisplayLoadingScreen <loading_screen> <loading_time>
          else
            DisplayLoadingScreen <loading_screen> <loading_time>
          endif
        endif
      else
        if InSplitScreenGame
          DisplayLoadingScreen <loading_screen> <loading_time>
        else
          DisplayLoadingScreen <loading_screen> <loading_time>
        endif
      endif
    else
      DisplayLoadingScreen "loadscrn_generic"
    endif
  endif
  CareerStartLevel level = <level_number>
  ResetLevelFlags
  if ( <level_number> = LevelNum_Skateshop )
  endif
  if GotParam scnpre
    LoadLevelPreFile <scnpre>
  endif
  if GotParam sky
    LoadScene scene = <sky>
  endif
  if GotParam park_editor
    if IsNGC
      Ngc_ReduceColors 0
    endif
    LoadScene scene = <level> is_dictionary
    if GotParam outer_shell
      LoadScene scene = <outer_shell> no_supersectors
    endif
    if IsNGC
      Ngc_ReduceColors 1
    endif
  else
    LoadScene scene = <level>
  endif
  if GotParam level_name
    SetLevelName <level_name>
  else
    SetLevelName <level>
  endif
  if GotParam scnpre
    UnloadPreFile <scnpre> dont_assert
  endif
  if not IsPS2
    if GotParam pre
      LoadLevelPreFile <pre>
    endif
  endif
  if GotParam qb
    if GotParam park_editor
      LoadNodeArray <qb> park_editor
    else
      LoadNodeArray <qb>
    endif
  endif
  if IsPS2
    if GotParam pre
      LoadLevelPreFile <pre>
    endif
  endif
  if GotParam park_editor
  else
    PreloadModels
  endif
  if GotParam level_qb
    LoadQB <level_qb> LevelSpecific
  endif
  preselect_random_parts <...>
  if GotParam park_editor
    LoadSound "Shared\Hits\FallPungee_11"
    LoadSound "Shared\Water\FallWater"
    LoadTerrain_parked
  else
    LoadTerrain
  endif
  if IsTrue UseLevelOverrideStats
    if GotParam default_stats
      SetAllStats value = <default_stats>
    endif
  endif
  if GotParam temp_script
     <temp_script> <...>
    if GotParam extranetanimsscript
      if InNetGame
        Printf "                    WE'RE IN A NET GAME!!!!!!!!!!!!!"
        PushMemProfile "Level Specific Anims"
         <extranetanimsscript>
        PopMemProfile
      endif
    endif
  endif
  if GotParam park_editor
  else
    if GotParam startup_script
       <startup_script>
    endif
  endif
  if GotParam pre
    UnloadPreFile <pre> dont_assert
  endif
  if not InNetGame
    if GotParam pedpre
      LoadPreFile <pedpre> dont_assert
    endif
  endif
  if not InNetGame
    if not GotParam park_editor
      PreloadPedestrians
    endif
  endif
  if not InNetGame
    if InMultiplayerGame
      PreloadModel name = "crown"
    endif
  endif
  if not InNetGame
    if GotParam pedpre
      UnloadPreFile <pedpre> dont_assert
    endif
  endif
  if ( <level_number> = LevelNum_Skateshop )
    if not IsTrue cas_artist
      LoadPreFile "skaterparts.pre"
    endif
  endif
  PushMemProfile "Level Collision decompressed PIP + Supersectors"
  if IsTrue UsePreFilesForLevelLoading
    if GotParam colpre
      LoadPipPre <colpre> heap = topdown
    endif
  endif
  LoadCollision scene = <level>
  if GotParam park_editor
    if GotParam outer_shell
      if IsTrue UsePreFilesForLevelLoading
         <extension> = "col.pre"
        LoadPipPre ( <outer_shell> + <extension> ) heap = topdown
      endif
      LoadCollision scene = <outer_shell>
    endif
  endif
  PopMemProfile
  if GotParam park_editor
    if GotParam startup_script
       <startup_script>
    endif
  else
    ParseNodeArray
  endif
  if GotParam goals_script
     <goals_script>
  endif
  if GameModeEquals is_singlesession
    AddGoal_TrickAttack
  endif
  if GameModeEquals is_career
    if not ( <level_number> = 0 )
      SetGlobalFlag flag = CAREER_STARTED
      Printf "CAREER_STARTED"
    endif
  endif
  init_goal_manager
  initialize_cash_icons
  if GotParam setup_script
     <setup_script>
  endif
  UnPauseGame
endscript
script LoadTerrain_parked
  SetTerrainDefault
  SetTerrainConcSmooth
  SetTerrainConcRough
  SetTerrainMetalSmooth
  SetTerrainMetalRough
  SetTerrainMetalGrating
  SetTerrainMetalTin
  SetTerrainWood
  SetTerrainWoodMasonite
  SetTerrainWoodPlywood
  SetTerrainWoodPier
  SetTerrainBrick
  SetTerrainTile
  SetTerrainAsphalt
  SetTerrainRock
  SetTerrainGravel
  SetTerrainGrass
  SetTerrainDirt
  SetTerrainWater
  SetTerrainPlexiglass
  SetTerrainChainlink
  SetTerrainGlass
endscript
script init_goal_manager
  GoalManager_LevelLoad
  if InNetGame
    GoalManager_InitializeAllMinigames
    UnSetFlag flag = FLAG_PROSET1_GEO_ON
    UnSetFlag flag = FLAG_PROSET2_GEO_ON
    UnSetFlag flag = FLAG_PROSET3_GEO_ON
    UnSetFlag flag = FLAG_PROSET4_GEO_ON
    UnSetFlag flag = FLAG_PROSET5_GEO_ON
    UnSetFlag flag = FLAG_PROSET6_GEO_ON
    UnSetFlag flag = FLAG_PROSET7_GEO_ON
  else
    GoalManager_InitializeAllGoals
  endif
  GoalManager_ReplaceTrickText all
  GoalManager_SetCanStartGoal 1
  if CareerLevelIs LevelNum_Skateshop
    GoalManager_HideGoalPoints
    GoalManager_HidePoints
  else
    if not InMultiplayerGame
      GoalManager_ShowGoalPoints
    endif
    GoalManager_ShowPoints
  endif
endscript
script load_cameras_and_terrains
  if not InNetGame
    PushMemProfile "Level Specific Anims"
    load_level_anims
    PopMemProfile
  endif
  PushMemProfile "Level Cameras"
  LoadCameras
  if ScriptExists LoadObjectAnims
    LoadObjectAnims
  endif
  PopMemProfile
endscript
script Load_Alc
  load_level Level_Alc
endscript
Level_Alc = {
  structure_name = Level_Alc
  load_script = Load_Alc
  name = "Alcatraz"
  ambient_track = "music\amb_alc"
  loading_screen = "loadscrn_alcatraz"
  loading_time = 9.5
  pre = "alc.pre"
  scnpre = "alcscn.pre"
  level = "alc"
  sky = "alc_Sky"
  qb = "levels\alc\alc.qb"
  colpre = "alccol.pre"
  pedpre = "alcped.pre"
  level_qb = "levels\alc\alc_scripts.qb"
  startup_script = ALC_Startup
  goals_script = alc_goals
  setup_script = alc_setup
  default_stats = 6
  level_number = LevelNum_Alc
  temp_script = load_cameras_and_terrains
  ambient_red = 69
  ambient_green = 72
  ambient_blue = 79
  ambient_mod_factor = 0.3
  heading_0 = 120.0
  pitch_0 = -127.0
  red_0 = 130
  green_0 = 120
  blue_0 = 97
  mod_factor_0 = 1.4
  heading_1 = -45.0
  pitch_1 = -110.0
  red_1 = 58
  green_1 = 62
  blue_1 = 66
  mod_factor_1 = 0.1
  num_m_heads = 4
  num_m_torsos = 4
  num_m_legs = 4
}
script Load_Cnv
  load_level Level_Cnv
endscript
Level_Cnv = {
  structure_name = Level_Cnv
  load_script = Load_Cnv
  name = "Carnival"
  ambient_track = "music\amb_carn"
  loading_screen = "loadscrn_Carnival"
  loading_time = 9.5
  pre = "cnv.pre"
  scnpre = "cnvscn.pre"
  level = "cnv"
  sky = "cnv_Sky"
  qb = "levels\cnv\cnv.qb"
  colpre = "cnvcol.pre"
  pedpre = "cnvped.pre"
  level_qb = "levels\cnv\cnv_scripts.qb"
  startup_script = Cnv_Startup
  goals_script = cnv_goals
  setup_script = cnv_setup
  default_stats = 10
  level_number = LevelNum_Cnv
  temp_script = load_cameras_and_terrains
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.5
  heading_0 = 90.0
  pitch_0 = -60.0
  red_0 = 75
  green_0 = 75
  blue_0 = 75
  mod_factor_0 = 0.7
  heading_1 = 0.0
  pitch_1 = -90.0
  red_1 = 0
  green_1 = 0
  blue_1 = 0
  mod_factor_1 = 1.0
  num_m_heads = 5
  num_m_torsos = 5
}
script Load_Jnk
  load_level Level_Jnk
endscript
Level_Jnk = {
  structure_name = Level_Jnk
  load_script = Load_Jnk
  name = "Shipyard"
  ambient_track = "music\amb_ship"
  loading_screen = "loadscrn_shipyard"
  loading_time = 10
  pre = "jnk.pre"
  scnpre = "jnkscn.pre"
  level = "jnk"
  sky = "jnk_Sky"
  qb = "levels\jnk\jnk.qb"
  colpre = "jnkcol.pre"
  pedpre = "jnkped.pre"
  level_qb = "levels\jnk\jnk_scripts.qb"
  startup_script = JNK_Startup
  goals_script = jnk_goals
  default_stats = 7
  level_number = LevelNum_Jnk
  temp_script = load_cameras_and_terrains
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.5
  heading_0 = 90.0
  pitch_0 = -60.0
  red_0 = 75
  green_0 = 75
  blue_0 = 75
  mod_factor_0 = 0.7
  heading_1 = 0.0
  pitch_1 = -90.0
  red_1 = 0
  green_1 = 0
  blue_1 = 0
  mod_factor_1 = 1.0
}
script Load_Kon
  load_level Level_Kon
endscript
Level_Kon = {
  structure_name = Level_Kon
  load_script = Load_Kon
  name = "Kona"
  ambient_track = "music\amb_kona"
  loading_screen = "loadscrn_Kona"
  loading_time = 7
  pre = "kon.pre"
  scnpre = "konscn.pre"
  level = "kon"
  sky = "Kon_Sky"
  qb = "levels\kon\kon.qb"
  colpre = "koncol.pre"
  pedpre = "konped.pre"
  level_qb = "levels\kon\kon_scripts.qb"
  startup_script = KON_Startup
  goals_script = kon_goals
  default_stats = 7
  level_number = LevelNum_Kon
  temp_script = load_cameras_and_terrains
  extranetanimsscript = animload_skater_slalom
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.2
  heading_0 = -30
  pitch_0 = -60
  red_0 = 110
  green_0 = 110
  blue_0 = 105
  mod_factor_0 = 0.8
  heading_1 = 200
  pitch_1 = 33
  red_1 = 23
  green_1 = 24
  blue_1 = 30
  mod_factor_1 = 0.1
  num_m_heads = 4
  num_m_torsos = 5
}
script Load_Lon
  load_level Level_lon
endscript
Level_lon = {
  structure_name = Level_lon
  load_script = Load_Lon
  name = "London"
  ambient_track = "music\amb_lon"
  loading_screen = "loadscrn_london"
  loading_time = 9.5
  pre = "lon.pre"
  scnpre = "lonscn.pre"
  level = "lon"
  sky = "lon_Sky"
  qb = "levels\lon\lon.qb"
  colpre = "loncol.pre"
  pedpre = "lonped.pre"
  level_qb = "levels\lon\lon_scripts.qb"
  startup_script = Lon_Startup
  goals_script = lon_goals
  default_stats = 8
  level_number = LevelNum_Lon
  temp_script = load_cameras_and_terrains
  ambient_red = 73
  ambient_green = 73
  ambient_blue = 73
  ambient_mod_factor = 0.2
  heading_0 = -30
  pitch_0 = -60
  red_0 = 110
  green_0 = 110
  blue_0 = 105
  mod_factor_0 = 0.8
  heading_1 = 200
  pitch_1 = 33
  red_1 = 22
  green_1 = 23
  blue_1 = 30
  mod_factor_1 = 0.1
}
script Load_Sch
  load_level level_Sch
  SetGlobalFlag flag = LEVEL_UNLOCKED_SCH
  if not IsDemo
    SetGlobalFlag flag = LEVEL_UNLOCKED_CPK
  endif
endscript
level_Sch = {
  structure_name = level_Sch
  load_script = Load_Sch
  name = "College"
  ambient_track = "music\amb_col"
  loading_screen = "loadscrn_col"
  loading_time = 9
  pre = "sch.pre"
  scnpre = "schscn.pre"
  colpre = "schcol.pre"
  pedpre = "schped.pre"
  level = "sch"
  sky = "Sch_Sky"
  qb = "levels\sch\sch.qb"
  level_qb = "levels\sch\sch_scripts.qb"
  startup_script = sch_Startup
  goals_script = sch_goals
  setup_script = sch_setup
  extranetanimsscript = animload_skater_luge
  default_stats = 5
  level_number = LevelNum_Sch
  temp_script = load_cameras_and_terrains
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.2
  heading_0 = -30
  pitch_0 = -60
  red_0 = 110
  green_0 = 110
  blue_0 = 105
  mod_factor_0 = 0.8
  heading_1 = 200
  pitch_1 = 33
  red_1 = 23
  green_1 = 24
  blue_1 = 30
  mod_factor_1 = 0.1
}
script Load_SF2
  load_level level_sf2
endscript
level_sf2 = {
  structure_name = level_sf2
  load_script = Load_SF2
  name = "San Francisco"
  ambient_track = "music\amb_sf"
  loading_screen = "loadscrn_sanfran"
  loading_time = 9.5
  pre = "sf2.pre"
  scnpre = "sf2scn.pre"
  level = "sf2"
  sky = "sf2_Sky"
  qb = "levels\sf2\sf2.qb"
  colpre = "sf2col.pre"
  pedpre = "sf2ped.pre"
  level_qb = "levels\sf2\sf2_scripts.qb"
  startup_script = sf2_Startup
  goals_script = sf2_goals
  setup_script = sf2_setup
  default_stats = 6
  level_number = LevelNum_SF2
  temp_script = load_cameras_and_terrains
  ambient_red = 69
  ambient_green = 72
  ambient_blue = 79
  ambient_mod_factor = 0.3
  heading_0 = -50.0
  pitch_0 = -127.0
  red_0 = 130
  green_0 = 120
  blue_0 = 97
  mod_factor_0 = 1.4
  heading_1 = 50.0
  pitch_1 = -117.0
  red_1 = 55
  green_1 = 58
  blue_1 = 61
  mod_factor_1 = 0.2
}
script Load_Zoo
  load_level level_zoo
endscript
level_zoo = {
  structure_name = level_zoo
  load_script = Load_Zoo
  name = "Zoo"
  ambient_track = "music\amb_zoo"
  loading_screen = "loadscrn_zoo"
  loading_time = 9.5
  pre = "zoo.pre"
  scnpre = "zooscn.pre"
  level = "zoo"
  sky = "zoo_Sky"
  qb = "levels\zoo\zoo.qb"
  level_qb = "levels\zoo\zoo_scripts.qb"
  colpre = "zoocol.pre"
  pedpre = "zooped.pre"
  startup_script = zoo_Startup
  goals_script = zoo_goals
  default_stats = 8
  level_number = LevelNum_Zoo
  temp_script = load_cameras_and_terrains
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.2
  heading_0 = -30
  pitch_0 = -60
  red_0 = 110
  green_0 = 110
  blue_0 = 105
  mod_factor_0 = 0.8
  heading_1 = 200
  pitch_1 = 33
  red_1 = 24
  green_1 = 25
  blue_1 = 30
  mod_factor_1 = 0.1 }
script Load_SkateShop
  load_level level_SkateShop
endscript
level_SkateShop = {
  structure_name = level_SkateShop
  load_script = Load_SkateShop
  name = "Skateshop"
  ambient_track = "music\amb_skate"
  loading_screen = "loadscrn_generic"
  loading_time = 8.5
  pre = "skateshop.pre"
  scnpre = "skateshopscn.pre"
  level = "skateshop"
  sky = "skateshop_Sky"
  qb = "levels\skateshop\skateshop.qb"
  colpre = "skateshopcol.pre"
  pedpre = "skateshopped.pre"
  level_qb = "levels\skateshop\skateshop_scripts.qb"
  startup_script = skateshop_startup
  goals_script = skateshop_goals
  default_stats = 8
  level_number = LevelNum_Skateshop
  temp_script = load_cameras_and_terrains
  ambient_red = 66
  ambient_green = 67
  ambient_blue = 68
  ambient_mod_factor = 0.0
  heading_0 = -220.0
  pitch_0 = -40.0
  red_0 = 100
  green_0 = 97
  blue_0 = 92
  mod_factor_0 = 0.0
  heading_1 = -180.0
  pitch_1 = 100.0
  red_1 = 37
  green_1 = 34
  blue_1 = 26
  mod_factor_1 = 0.0
}
script Load_Hof
  load_level level_hof
endscript
level_hof = {
  structure_name = level_hof
  load_script = Load_Hof
  name = "Hoffman"
  ambient_track = "music\amb_hof"
  loading_screen = "loadscrn_chicago"
  loading_time = 8
  pre = "hof.pre"
  scnpre = "hofscn.pre"
  level = "hof"
  sky = "Hof_Sky"
  qb = "levels\hof\hof.qb"
  level_qb = "levels\hof\hof_scripts.qb"
  colpre = "hofcol.pre"
  pedpre = "hofped.pre"
  startup_script = hof_Startup
  goals_script = hof_goals
  setup_script = hof_setup
  default_stats = 5
  level_number = LevelNum_Hof
  temp_script = load_cameras_and_terrains
  extranetanimsscript = load_level_anims
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.5
  heading_0 = 90.0
  pitch_0 = -60.0
  red_0 = 75
  green_0 = 75
  blue_0 = 75
  mod_factor_0 = 0.7
  heading_1 = 0.0
  pitch_1 = -90.0
  red_1 = 0
  green_1 = 0
  blue_1 = 0
  mod_factor_1 = 1.0
}
script Load_Motox
  load_level level_motox
endscript
level_motox = {
  structure_name = level_motox
  load_script = Load_Motox
  name = "Motox"
  loading_screen = "loadscrn_generic"
  loading_time = 30
  pre = "motox.pre"
  scnpre = "motoxscn.pre"
  level = "motox"
  sky = "hof_Sky"
  qb = "levels\motox\motox.qb"
  level_qb = "levels\motox\motox_scripts.qb"
  startup_script = motox_Startup
  goals_script = motox_goals
  default_stats = 5
  level_number = LevelNum_Motox
  temp_script = load_cameras_and_terrains
  colpre = "motoxcol.pre"
  pedpre = "motoxped.pre"
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.5
  heading_0 = 90.0
  pitch_0 = -60.0
  red_0 = 75
  green_0 = 75
  blue_0 = 75
  mod_factor_0 = 0.7
  heading_1 = 0.0
  pitch_1 = -90.0
  red_1 = 0
  green_1 = 0
  blue_1 = 0
  mod_factor_1 = 1.0
}
script Load_Default
  SetUpBasicLights
  LoadNodeArray "levels\Default\Default.qb"
  quickview
endscript
script Load_Sk4Ed_kona
  load_level Level_Sk4Ed outer_shell = "kona"
endscript
script Load_Sk4Ed_kona_gameplay
  load_level Level_Sk4Ed startup_script = Sk4Ed_Startup_gameplay outer_shell = "kona"
endscript
script Load_Sk4Ed
  GetEditorTheme
  if IsXBOX
    if IntegerEquals a = <theme> b = 0
      load_level Level_Sk4Ed loading_screen = "loadscrn_editor_x"
    else
      load_level Level_Sk4Ed2 loading_screen = "loadscrn_editor_x"
    endif
  endif
  if IsNGC
    if IntegerEquals a = <theme> b = 0
      load_level Level_Sk4Ed loading_screen = "loadscrn_editor_ngc"
    else
      load_level Level_Sk4Ed2 loading_screen = "loadscrn_editor_ngc"
    endif
  endif
  if IsPS2
    if IntegerEquals a = <theme> b = 0
      load_level Level_Sk4Ed loading_screen = "loadscrn_editor"
    else
      load_level Level_Sk4Ed2 loading_screen = "loadscrn_editor"
    endif
  endif
endscript
script Load_Sk4Ed_gameplay
  GetEditorTheme
  if IntegerEquals a = <theme> b = 0
    load_level Level_Sk4Ed startup_script = Sk4Ed_Startup_gameplay loading_screen = "loadscrn_created"
  else
    load_level Level_Sk4Ed2 startup_script = Sk4Ed_Startup_gameplay loading_screen = "loadscrn_created"
  endif
endscript
Level_Sk4Ed = {
  structure_name = Level_Sk4Ed
  load_script = Load_Sk4Ed
  name = "Created Park"
  loading_screen = "loadscrn_editor_play"
  loading_time = 8
  pre = "sk4ed.pre"
  scnpre = "sk4edscn.pre"
  level = "sk4ed"
  level_name = "sk4ed"
  sky = "sk4ed_Sky"
  outer_shell = "sk4ed_shell"
  qb = "levels\sk4ed\sk4ed.qb"
  colpre = "sk4edcol.pre"
  pedpre = "sk4edped.pre"
  level_qb = "levels\sk4ed\sk4ed_scripts.qb"
  startup_script = Sk4Ed_Startup
  goals_script = Sk4Ed_goals
  default_stats = 10
  level_number = LevelNum_Sk4ed
  park_editor
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.5
  heading_0 = 90.0
  pitch_0 = -60.0
  red_0 = 75
  green_0 = 75
  blue_0 = 75
  mod_factor_0 = 0.7
  heading_1 = 0.0
  pitch_1 = -90.0
  red_1 = 0
  green_1 = 0
  blue_1 = 0
  mod_factor_1 = 1.0
}
Level_Sk4Ed2 = {
  structure_name = Level_Sk4Ed2
  load_script = Load_Sk4Ed
  name = "Created Park"
  loading_screen = "loadscrn_editor_play"
  loading_time = 7
  pre = "sk4ed2.pre"
  scnpre = "sk4ed2scn.pre"
  level = "sk4ed2"
  level_name = "sk4ed2"
  sky = "sk4ed2_Sky"
  outer_shell = "sk4ed2_shell"
  qb = "levels\sk4ed2\sk4ed2.qb"
  colpre = "sk4ed2col.pre"
  pedpre = "sk4ed2ped.pre"
  level_qb = "levels\sk4ed\sk4ed_scripts.qb"
  startup_script = Sk4Ed_Startup
  goals_script = Sk4Ed_goals
  default_stats = 10
  level_number = LevelNum_Sk4ed
  park_editor
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.5
  heading_0 = 90.0
  pitch_0 = -60.0
  red_0 = 75
  green_0 = 75
  blue_0 = 75
  mod_factor_0 = 0.7
  heading_1 = 0.0
  pitch_1 = -90.0
  red_1 = 0
  green_1 = 0
  blue_1 = 0
  mod_factor_1 = 1.0
}
master_level_list = [
  {
    level_name = "Foundry"
    load_script = Load_Foun
    level_id = foundry_id
    regular_level
  }
  {
    level_name = "Canada"
    load_script = Load_Can
    level_id = canada_id
    regular_level
    unlock_flag = LEVEL_UNLOCKED_CANADA
  }
  {
    level_name = "Rio"
    load_script = Load_Rio
    level_id = rio_id
    regular_level
    unlock_flag = LEVEL_UNLOCKED_RIO
  }
  {
    level_name = "Suburbia"
    load_script = Load_Sub
    level_id = suburbia_id
    regular_level
    unlock_flag = LEVEL_UNLOCKED_SUBURBIA
  }
  {
    level_name = "California College"
    load_script = Load_Ap
    level_id = school_id
    regular_level
    unlock_flag = LEVEL_UNLOCKED_AIRPORT
  }
  {
    level_name = "Skater Island"
    load_script = Load_Si
    level_id = skatersisland_id
    regular_level
    unlock_flag = LEVEL_UNLOCKED_SKATERISLAND
  }
  {
    level_name = "Los Angeles"
    load_script = Load_La
    level_id = la_id
    regular_level
    unlock_flag = LEVEL_UNLOCKED_LOSANGELES
  }
  {
    level_name = "Tokyo"
    load_script = Load_Tok
    level_id = tokyo_id
    regular_level
    unlock_flag = LEVEL_UNLOCKED_TOKYO
  }
  {
    level_name = "Cruise Ship"
    load_script = Load_Shp
    level_id = ship_id
    regular_level
    unlock_flag = LEVEL_UNLOCKED_SHIP
    special_flag = SPECIAL_HAS_SEEN_SHIP
  }
  {
    level_name = "Warehouse"
    load_script = Load_Ware
    level_id = warehouse_id
    regular_level
    unlock_flag = LEVEL_UNLOCKED_WAREHOUSE
    nocareer
    secret_level
  }
  {
    level_name = "Burnside"
    load_script = Load_Burn
    level_id = burnside_id
    regular_level
    nocareer
    unlock_flag = LEVEL_UNLOCKED_BURNSIDE
    secret_level
  }
  {
    level_name = "Roswell"
    load_script = Load_Ros
    level_id = roswell_id
    nocareer
    unlock_flag = LEVEL_UNLOCKED_ROSWELL
    regular_level
    secret_level
  }
  {
    level_name = "Tutorials"
    load_script = Load_Tut
    level_id = tutorials_id
    nocareer
  }
  {
    level_name = "Foo"
    load_script = Load_Foo
    level_id = foo_id
    debug_level
  }
  {
    level_name = "zoo"
    load_script = Load_Zoo
    level_id = zoo_id
    debug_level
  }
  {
    level_name = "Oil"
    load_script = Load_Oil
    level_id = oil_id
    regular_level
    nocareer
    notPS2_level
  }
  {
    level_name = "Rooftops"
    load_script = Load_Roof
    level_id = rooftops_id
    regular_level
    nocareer
    notPS2_level
  }
  {
    level_name = "Play custom park"
    load_script = custom_park
    level_id = custom_park
    debug_level
  }
  {
    level_name = "Skate Shop"
    load_script = Load_SkateShop
    level_id = skateshop_id
    debug_level
  }
  {
    level_name = "Cars driving in circle"
    load_script = Load_foo_circcars
    level_id = foo_circcars_id
    debug_level
  }
  {
    level_name = "Car with wheels rotating"
    load_script = Load_foo_car
    level_id = foo_carwheels_id
    debug_level
  }
  {
    level_name = "Foo2 25 Peds"
    load_script = Load_Foo2
    level_id = foo2_25peds_id
    debug_level
  }
]
