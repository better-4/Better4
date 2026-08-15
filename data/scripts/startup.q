lock_framerate = 0
display_framerate_box = 1
DEMO_BUILD = 0
script load_permanent_prefiles
  LoadPreFile "permtex.pre"
  LoadPreFile "casfiles.pre"
  if IsNGC
    LoadPreFile "gcmemicons.pre"
  endif
endscript
script load_permanent_assets
  // better4_controls_init
  SetDefaultPermanent 1
  SetReferenceChecksum 0
  LoadPreFile "anims.pre"
  LoadPreFile "skeletons.pre"
  LoadPreFile "bits.pre"
  InitAnimCompressTable "anims\standardkeyq.bin" q48
  InitAnimCompressTable "anims\standardkeyt.bin" t48
  LoadStreamHeader "streams\streams"
  PushMemProfile "Permanent Anims"
  load_permanent_anims
  PopMemProfile
  skeletonload_all
  PushMemProfile "Permanent Models"
  LoadAsset "models\arrow\arrow.mdl"
  LoadAsset "models\Ped_Pro_Arrow\Ped_Pro_Arrow.mdl"
  LoadAsset "models\Super_Pro_Arrow\Super_Pro_Arrow.mdl"
  LoadAsset "models\HUD_arrow\HUD_arrow.mdl"
  LoadAsset "models\ped_shadow\ped_shadow.mdl"
  LoadAsset "models\goalarrow\goalarrow.mdl"
  load_special_items
  PopMemProfile
  PushMemProfile "Permanent Textures"
  LoadParticleTexture "bits\wheel_01"
  LoadParticleTexture "bits\particle_test01"
  LoadParticleTexture "bits\particle_test02"
  LoadParticleTexture "bits\blood_01"
  if IsXBOX
    LoadParticleTexture "bits\skidtrail"
  else
    LoadParticleTexture "bits\skidtrail_ps2"
  endif
  LoadParticleTexture "bits\water_spray"
  PopMemProfile
  UnloadPreFile "skeletons.pre"
  UnloadPreFile "anims.pre"
  UnloadPreFile "bits.pre"
  SetDefaultPermanent 0
endscript
script load_special_items
  LoadAsset "models\specialitems\Flag\flag.skin"
  SetReferenceChecksum animload_SI_flag
  animload_SI_flag
  SetReferenceChecksum 0
  LoadAsset "models\specialitems\Grapplehook\grapplehook.skin"
  SetReferenceChecksum animload_SI_grapplehook
  animload_SI_grapplehook
  SetReferenceChecksum 0
  LoadAsset "models\specialitems\bustedboard\bustedboard.skin"
  SetReferenceChecksum animload_SI_bustedboard
  animload_SI_bustedboard
  SetReferenceChecksum 0
  LoadAsset "models\specialitems\pizzabox\pizzabox.skin"
  SetReferenceChecksum animload_SI_Pizza
  animload_SI_Pizza
  SetReferenceChecksum 0
  LoadAsset "models\specialitems\ferret\ferret.skin"
  SetReferenceChecksum animload_SI_ferret
  animload_SI_ferret
  SetReferenceChecksum 0
  LoadAsset "models\specialitems\Pistol\Pistol.skin"
  SetReferenceChecksum animload_SI_pistol
  animload_SI_pistol
  SetReferenceChecksum 0
  LoadAsset "models\specialitems\guitar\guitar.skin"
  LoadAsset "models\specialitems\mpc\mpc.skin"
  LoadAsset "models\specialitems\BoomBox\BoomBox.skin"
  LoadAsset "models\specialitems\Basketball\Basketball.skin"
  LoadAsset "models\specialitems\HulaHoop\HulaHoop.skin"
  LoadAsset "models\specialitems\BloodyGuts\BloodyGuts.skin"
  LoadAsset "models\specialitems\gun\gun.skin"
  SetReferenceChecksum animload_SI_Gun
  animload_SI_Gun
  SetReferenceChecksum 0
  LoadAsset "models\specialitems\spraycan\spraycan.skin"
  SetReferenceChecksum animload_SI_Generic
  animload_SI_Generic
  SetReferenceChecksum 0
endscript
script load_permanent_anims
  SetReferenceChecksum animload_human
  animload_human
  SetReferenceChecksum 0
endscript
script init_loading_bar
  SetLoadingBarPos x = 258 y = 400
  SetLoadingBarSize width = 140 height = 8
  SetLoadingBarStartColor r = 0 g = 76 b = 129
  SetLoadingBarEndColor r = 176 g = 211 b = 115
  SetLoadingBarBorder width = 5 height = 5
  SetLoadingBarBorderColor r = 40 g = 40 b = 40
endscript
script startup_loading_screen
  if not Bootstrap
    if IsPS2
      if CD
        PlayMovie "movies\atvi"
        PlayMovie "movies\nslogo"
        PlayMovie "movies\intro"
      endif
    endif
  endif
  if IsXBOX
    if CD
      PlayMovie "movies\atvi"
      PlayMovie "movies\aspyr"
      PlayMovie "movies\nslogo"
      PlayMovie "movies\intro"
    endif
  endif
  if IsNGC
    if CD
      PlayMovie "movies\atvi"
      PlayMovie "movies\nslogo"
      PlayMovie "movies\intro"
    endif
  endif
  if Bootstrap
    DisplayLoadingScreen "loadscrn_demo"
  else
    if IsXBOX
      if IsDemo
        DisplayLoadingScreen "DemoScreen0"
      else
        DisplayLoadingScreen "AspyrScreen"
      endif
    endif
    if IsNGC
      DisplayLoadingScreen "loadscrn_ngc"
    endif
    if IsPS2
      DisplayLoadingScreen "loadscrn"
    endif
  endif
endscript
All_Levels_Unlocked = 1
bootstrap_build = 0
UseLevelOverrideStats = 0
script default_system_startup
  PushMemProfile "script default_system_startup before autolaunch"
  SetGlobalFlag flag = LEVEL_UNLOCKED_SCH
  if not IsDemo
    SetGlobalFlag flag = LEVEL_UNLOCKED_CPK
  endif
  unlock_initial_boards
  if IsTrue DEMO_BUILD
    SetGlobalFlag flag = LEVEL_UNLOCKED_SF2
    SetGlobalFlag flag = LEVEL_UNLOCKED_ZOO
  endif
  SetSfxVolume 100
  SetMusicVolume 50
  if CD
    if not IsDemo
      Change UsePreFilesForLevelLoading = 1
    endif
    Change All_Levels_Unlocked = 0
  endif
  if IsNGC
    Change UsePreFilesForLevelLoading = 1
  endif
  new_screen_element_test
  SetScreenElementProps id = root_window event_handlers = [ { pad_start nullscript } ] replace_handlers
  Printf "replace_handlers to take away start key in load_level"
  SetServerMode on
  SetJoinMode JOIN_MODE_PLAY
  StartServer
  JoinServer <...>
  PopMemProfile
  if Bootstrap
    Change bootstrap_build = 1
    Change STARTGAME_FIRST_TIME = 1
    Change UseLevelOverrideStats = 1
    Change All_Levels_Unlocked = 0
    autolaunch level = load_sch game = career
  else
    if CD
      if not IsXBOX
        LaunchViewer
      endif
      if IsTrue DEMO_BUILD
        Change UseLevelOverrideStats = 1
      else
        Change UseLevelOverrideStats = 0
      endif
      autolaunch level = load_skateshop game = career
    else
      autolaunch level = load_skateshop game = career
    endif
  endif
endscript
STARTGAME_FIRST_TIME = 0
script create_startup_menu
  HideLoadingScreen
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 game frame
  endif
  remove_pause_menu_textures_from_vram
  add_main_menu_textures_to_vram
  KillSkaterCamAnim all
  PlaySkaterCamAnim name = SS_MenuCam play_hold
  SetMemThreadSafe off
  make_new_skateshop_menu {
    pos = (205, 109)
    internal_just = [ center center ]
    menu_id = startup_menu
    vmenu_id = startup_vmenu
    menu_title = ""
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = THPS4
    pos = (320, 132)
    scale = (1.4, 1)
    z_priority = 2
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = options_bg
    draw_behind_parent
    pos = (321, 115)
    scale = (1.17, 1.1)
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 0
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = startup_menu_blue_bar
    texture = stats_notch
    pos = (312, 369)
    rgba = [ 42 48 77 50 ]
    scale = (14, 0.2)
    just = [ center top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = startup_menu_box_top
    texture = level_top_piece
    pos = (321, 145)
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
  }
  begin
    GetStackedScreenElementPos y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
    }
  repeat 5
  GetStackedScreenElementPos y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (0.96, 1)
    just = [ left top ]
  }
  GetStackedScreenElementPos x id = startup_menu_box_top offset = (-20, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    scale = (0.8, 0.5)
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
  }
  create_icon texture = PA_Model pos = (170, 115)
  CreateScreenElement {
    type = TextElement
    parent = current_menu
    font = small
    text = ""
    not_focusable
  }
  SetScreenElementProps {
    id = root_window
    event_handlers = [ { pad_start continue_career } ]
    replace_handlers
  }
  main_menu_add_item text = "Start Game" pad_choose_script = continue_career
  main_menu_add_item {
    text = "Controls"
    pad_choose_script = bootstrap_displayscreen
    pad_choose_params = { screen = "loadscrn_demo_controls" }
  }
  main_menu_add_item {
    text = "More Info"
    pad_choose_script = bootstrap_displayscreen
    pad_choose_params = { screen = "loadscrn_marketing" }
  }
  Printf "create_Startup_menu"
  RunScriptOnScreenElement id = startup_menu menu_onscreen
  Printf "step2"
  CreateScreenElement {
    parent = root_window
    type = TextElement
    id = ns_rules
    text = "Neversoft and Activision 2002"
    font = newtrickfont
    pos = (320, 420)
    rgba = [ 140 128 128 55 ]
    scale = 0.6
    just = [ center center ]
    not_focusable
  }
  startup_camera_playback
  Change STARTGAME_FIRST_TIME = 0
  Printf "step3"
endscript
script bootstrap_displayscreen screen = "loadscrn_demo_controls"
  if ObjectExists id = startup_menu
    DestroyScreenElement id = startup_menu
  endif
  if ObjectExists id = ns_rules
    DestroyScreenElement id = ns_rules
  endif
  make_new_menu menu_id = screen_menu
  SetScreenElementProps {
    id = root_window
    event_handlers = [ { pad_start exit_screen_menu } ]
    replace_handlers
  }
  SetScreenElementProps {
    id = screen_menu
    event_handlers = [ { pad_start exit_screen_menu }
      { pad_choose exit_screen_menu }
      { pad_back exit_screen_menu }
      { pad_circle exit_screen_menu }
      { pad_square exit_screen_menu }
    ]
    replace_handlers
  }
  FireEvent type = focus target = screen_menu
  DisplayLoadingScreen <screen>
endscript
script exit_screen_menu
  if ObjectExists id = screen_menu
    DestroyScreenElement id = screen_menu
  endif
  HideLoadingScreen
  create_startup_menu
endscript
script startup_main_menu
  SetScreenElementProps {
    id = root_window
    event_handlers = [ { pad_start handle_start_pressed } ]
    replace_handlers
  }
  if ObjectExists id = ns_rules
    DestroyScreenElement id = ns_rules
  endif
  level_select_change_level level = load_skateshop
endscript
script startup_camera_playback
  KillSkaterCamAnim all
  UnPauseGame
  PauseSkaters
  PlaySkaterCamAnim skater = 0 name = sch_overview_camera loop
endscript
script continue_career
  SetScreenElementProps {
    id = root_window
    event_handlers = [ { pad_start handle_start_pressed } ]
    replace_handlers
  }
  if ObjectExists id = ns_rules
    DestroyScreenElement id = ns_rules
  endif
  KillSkaterCamAnim all
  GoalManager_ShowPoints
  GoalManager_ShowGoalPoints
  MakeSkaterGoto StartSkating1
  UnPauseSkaters
  skiptrack
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 gameframe
    remove_main_menu_textures_from_vram
  endif
  SetScreenElementProps {
    id = root_window
    tags = { menu_state = off }
  }
endscript
script morph_ns_rules
  begin
    fadein_fadeout text = "Copyright Neversoft 2002"
  repeat
endscript
script fadein_fadeout text = "you forgot the text"
  SetProps text = <text>
  DoMorph time = 0 alpha = 0
  DoMorph time = 2 alpha = 1
  Wait 5 seconds
  DoMorph time = 2 alpha = 0
  DoMorph time = 2 alpha = 0
endscript
