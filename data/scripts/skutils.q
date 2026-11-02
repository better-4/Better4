check_for_unplugged_controllers = 0
script PrintState
  if InAir
    Printf "In air"
  endif
  if OnGround
    Printf "On ground"
  endif
  if OnWall
    Printf "On wall"
  endif
  if OnLip
    Printf "On lip"
  endif
  if OnRail
    Printf "OnRail"
  endif
endscript
script DefaultGapScript
  PlaySound HUD_jumpgap
endscript
script SetAllStats value = 3
  Printf "Overriding Stats to %d" d = <value>
  SetStatOverride <value>
endscript
script ToggleMinMetrics
  ToggleMetricItem item = METRIC_TIME
  ToggleMetricItem item = METRIC_TOTALPOLYS
  ToggleMetricItem item = METRIC_VERTS
  ToggleMetricItem item = METRIC_RESOURCEALLOCS
  ToggleMetricItem item = METRIC_TEXTUREUPLOADS
  ToggleMetricItem item = METRIC_VU1
  ToggleMetricItem item = METRIC_DMA1
  ToggleMetricItem item = METRIC_DMA2
  ToggleMetricItem item = METRIC_IHANDLERTIME
  ToggleMetricItem item = METRIC_SKYCACHE
  ToggleMetricItem item = METRIC_VIDEOMODE
  ToggleMetricItem item = METRIC_MEMFREE
  ToggleMetricItem item = METRIC_REGIONINFO
endscript
script MaybePause Button = r1
  if Held <Button>
    begin
    repeat 800000
  endif
endscript
script WaitOneGameFrame
  Wait 1 gameframes
endscript
script WaitAnimFinished
  begin
    if AnimFinished
      break
    endif
    WaitOneGameFrame
  repeat
endscript
script WaitAnimWhilstChecking
  begin
    DoNextTrick
    if GotParam AndManuals
      DoNextManualTrick
    endif
    if AnimFinished
      break
    endif
    WaitOneGameFrame
  repeat
endscript
script WaitForever
  begin
    WaitOneGameFrame
  repeat
endscript
script Reverse
  PlayAnim Anim = Current From = Current To = 0
endscript
script Obj_WaitForFlag
  begin
    if Obj_FlagSet <...>
      break
    endif
    WaitOneGameFrame
  repeat
endscript
script PollUntilFinished
  if GotParam Func
    begin
      if <Func> <...>
        break
      endif
      Wait 1 gameframe
    repeat
  else
    begin
      Printf "AAAAAAAARGH !!!!  PollUntilFinished needs a Func parameter !"
      Wait 1 gameframe
    repeat
  endif
endscript
script autolaunch
  if GotParam game
    SetGameType <game>
  else
    SetGameType career
  endif
  SetCurrentGameType
  request_level level = <level>
  cleanup_before_loading_level
  load_requested_level
  GameFlow StandardGameFlow
endscript
script change_level
  ResetScore
  Change check_for_unplugged_controllers = 0
  if not IsObserving
    Skater:ClearPanel_Landed
  endif
  if not GotParam no_levelUnload
    Printf "performing LevelUnload"
    GoalManager_LevelUnload
  endif
  ResetScore
  ResetScorePot
  GoalManager_LevelUnload
  GoalManager_DeactivateAllGoals
  if not InNetGame
    ScreenElementSystemCleanup
  endif
  kill_blur
  if InSplitScreenGame
    launch_two_player
  endif
  ChangeLevel <...>
endscript
script ReloadScene
  if GotParam scene
    UnloadScene <...>
    LoadScene <...>
  else
    script_assert "No scene param specified for autolaunching"
  endif
endscript
script AddToScene
  if GotParam add
  else
    add "update"
  endif
  if GotParam scene
    AddScene scene = <scene> add = <add>
    AddCollision scene = <scene> add = <add>
  else
    script_assert "No scene param specified for autolaunching"
  endif
endscript
script LoadLevelGeometry
  if GotParam sky
    LoadScene scene = <sky>
  endif
  if GotParam level
    LoadScene scene = <level>
    LoadCollision scene = <level>
  endif
endscript
script QuickStart scene = "default" sky = "sf2_sky"
  LoadScene scene = <sky>
  LoadScene scene = <scene>
  GameFlow StandardGameFlowToggleView
endscript
script VerifyParam
  if GotParam <param>
  else
    Printf "Required param not found in script function:"
    Printf <param>
    Printf <Func>
    script_assert "Terminating..."
  endif
endscript
TRIGGER_THROUGH = 0
TRIGGER_SKATE_OFF_EDGE = 1
TRIGGER_JUMP_OFF = 2
TRIGGER_LAND_ON = 3
TRIGGER_SKATE_OFF = 4
TRIGGER_SKATE_ONTO = 5
TRIGGER_BONK = 6
TRIGGER_LIP_ON = 7
TRIGGER_LIP_OFF = 8
TRIGGER_LIP_JUMP = 9
CANCEL_GROUND = 1
CANCEL_AIR = 2
CANCEL_RAIL = 4
CANCEL_WALL = 8
CANCEL_LIP = 16
CANCEL_MANUAL = 32
CANCEL_COMBOEND = 64
CANCEL_COMBOSTART = 128
CANCEL_COMBO = 256
CANCEL_NOTCOMBO = 512
PURE_GROUND = 62
PURE_AIR = 61
PURE_RAIL = 59
PURE_WALL = 55
PURE_LIP = 47
PURE_MANUAL = 31
REQUIRE_GROUND = 65536
REQUIRE_AIR = 131072
REQUIRE_RAIL = 262144
REQUIRE_WALL = 524288
REQUIRE_LIP = 1048576
REQUIRE_MANUAL = 2097152
REQUIRE_FLIPTRICK = 4194304
REQUIRE_GRABTRICK = 8388608
script StartAirGap
  StartGap <...> flags = [ CANCEL_GROUND CANCEL_WALL CANCEL_MANUAL CANCEL_LIP CANCEL_RAIL ]
endscript
script StartRailGap
  StartGap <...> flags = [ CANCEL_GROUND CANCEL_WALL CANCEL_MANUAL CANCEL_LIP CANCEL_AIR ]
endscript
script StartManualGap
  StartGap <...> flags = [ CANCEL_GROUND CANCEL_WALL CANCEL_LIP CANCEL_RAIL CANCEL_AIR ]
endscript
script StartWallGap
  StartGap <...> flags = [ CANCEL_GROUND CANCEL_MANUAL CANCEL_LIP CANCEL_RAIL CANCEL_AIR ]
endscript
script CareerRestartLevel
  CareerStartLevel level = -1
endscript
script DefaultHiScoreScript
endscript
script DefaultProScoreScript
endscript
script DisablePause
  AllowPause off
endscript
script EnablePause
  AllowPause
endscript
script LaunchLocalMessage
  LaunchLocalPanelMessage message_prop_default <...>
endscript
default_box_props = {
  box_color = { (40, 40, 40) alpha = 100 }
  box_pos_rel = (0, -1)
  box_w = 180
  box_h = 18
}
blue_box_props = {
  default_box_props
  box_color = { (40, 40, 140) alpha = 100 }
}
tricktip_props = {
  font = "small.fnt"
  just = (0, -1)
  dims = (640, 448)
  colors = [
    { (255, 245, 0) alpha = 128 }
    { (110, 20, 20) alpha = 255 }
  ]
  key_points = [
    { pos = (-200, 50) alpha = 0 time = 0 }
    { pos = (140, 50) scale = 1 alpha = 90 time = 0.75 }
    { time = 7 }
    { pos = (-200, 50) alpha = 0 scale = 1 time = 8 }
  ]
}
script TrickTip
  SpawnScript TrickTipTask params = { line1 = "" line2 = "" line3 = "" line4 = "" line5 = "" <...> }
endscript
script TrickTipTask
  LaunchLocalMessage id = mess1 <line1> base_pos = (0, 100) tricktip_props blue_box_props
  Wait 0.2 seconds
  LaunchLocalMessage id = mess2 <line2> base_pos = (0, 120) tricktip_props default_box_props
  Wait 0.2 seconds
  LaunchLocalMessage id = mess3 <line3> base_pos = (0, 140) tricktip_props default_box_props
  Wait 0.2 seconds
  LaunchLocalMessage id = mess4 <line4> base_pos = (0, 160) tricktip_props default_box_props
  Wait 0.2 seconds
  LaunchLocalMessage id = mess5 <line5> base_pos = (0, 180) tricktip_props default_box_props
endscript
script tt_test1
  TrickTip line1 = "use speed" line2 = "as an enemy" line3 = "of time" line4 = "to overcome" line5 = "defficency"
endscript
script tt_test2
  TrickTip line1 = "skate over people" line2 = "as they would" line3 = "walk all over you"
endscript
default_create_box_props = {
  box_color = { (40, 40, 40) alpha = 100 }
  box_pos_rel = (0, 0)
  box_w = 100
  box_h = 100
  key_points = [
    { pos = (0, 0) time = 0 }
    { time = 100000000 } ]
  just = (-1, -1)
}
default_destroy_box_props = {
  key_points = [
    { time = 0 } ]
}
script CreateBox
  LaunchLocalMessage "" id = default_box_id default_create_box_props <...>
endscript
script DestroyBox
  ChangeLocalMessage id = default_box_id default_destroy_box_props <...>
endscript
script AddLine
  DestroyElement <...>
  CreateMenu type = textmenuelement <...>
  AttachChild child = <id> <...>
endscript
script SimpleMenuWithDefaults
  DestroyElement id = <menu_id>
  CreateMenu {
    type = verticalmenu
    id = <menu_id> x = <x> y = <y> w = <w> h = <h>
    just_center_x
    just_center_y
    blue_top
    eventhandler = <eventhandler>
    EventHandlers = <EventHandlers>
    children = [
      { type = textmenuelement auto_id text = <header>
        static dont_gray
        drawer = title
      }
    ]
  }
  AttachChild parent = contain1 child = <menu_id>
endscript
script AddSimpleLine
  AddLine parent = simple_menu <...>
endscript
script CreateSimpleMenu
  SimpleMenuWithDefaults menu_id = simple_menu x = 150 y = 70.0 w = 320.0 h = 336.0 header = "menu" <...>
endscript
script CreateSimpleMenuLines
  CreateSimpleMenu <...>
  ForEachIn <lines> do = AddSimpleLine params = <...>
endscript
script SwitchToSimpleMenu2
  SwitchToMenu DoNotMakeRoot menu = <menu_id>
endscript
script SwitchToSimpleMenu
  SwitchToSimpleMenu2 menu_id = simple_menu <...>
endscript
script LaunchSimpleMenu
  CreateSimpleMenuLines <...>
  SwitchToSimpleMenu menu_id = simple_menu <...>
endscript
script SelectElement
  LaunchEvent type = deselect target = contain1
  LaunchEvent type = select target = <id>
endscript
script AJC_FormatCard
  LaunchSimpleMenu {
    x = 95 y = 80
    w = 450
    lines = [
      { id = AJC_line1 text = "" static dont_gray }
      { id = AJC_line2 text = "FORMAT memory card?" static dont_gray }
      { id = AJC_line2A text = "(ALL memory will be lost!)" static dont_gray }
      { id = AJC_line3 text = "" static dont_gray }
      { id = AJC_line5 text = "No" params = { EndScr = <EndScr> } }
      { id = AJC_line4 text = "Yes" target = "AJC_KillCard" params = { <...> } }
    ]
  }
endscript
script AJC_KillCard
  if FormatCard
    LaunchConsoleMessage "FORMAT SUCCEEDED"
    LaunchConsoleMessage "FORMAT SUCCEEDED"
    LaunchConsoleMessage "FORMAT SUCCEEDED"
    LaunchConsoleMessage "FORMAT SUCCEEDED"
    LaunchConsoleMessage "FORMAT SUCCEEDED"
  else
    LaunchConsoleMessage "FORMAT FAILED"
    LaunchConsoleMessage "FORMAT FAILED"
    LaunchConsoleMessage "FORMAT FAILED"
    LaunchConsoleMessage "FORMAT FAILED"
    LaunchConsoleMessage "FORMAT FAILED"
  endif
endscript
mFD_SKATABLE = 1
mFD_NOT_SKATABLE = 2
mFD_WALL_RIDABLE = 4
mFD_VERT = 8
mFD_NON_COLLIDABLE = 16
mFD_DECAL = 32
mFD_TRIGGER = 64
mFD_CAMERA_COLLIDABLE = 128
mFD_NO_SKATER_SHADOW = 256
mFD_SKATER_SHADOW = 512
mFD_NO_SKATER_SHADOW_WALL = 1024
mFD_UNDER_OK = 2048
mFD_INVISIBLE = 4096
mFD_CASFACEFLAGSEXIST = 8192
mFD_PASS_1_DISABLED = 16384
mFD_PASS_2_ENABLED = 32768
mFD_PASS_3_ENABLED = 65536
mFD_PASS_4_ENABLED = 131072
mFD_RENDER_SEPARATE = 262144
script show_all
  DebugRenderIgnore
endscript
script show_vert
  DebugRenderIgnore ignore_0 = mFD_VERT
endscript
script show_wallride
  DebugRenderIgnore ignore_0 = mFD_WALL_RIDABLE
endscript
script show_wall_ridable
  DebugRenderIgnore ignore_0 = mFD_WALL_RIDABLE
endscript
script show_trigger
  DebugRenderIgnore ignore_0 = mFD_TRIGGER
endscript
script show_invisible
  DebugRenderIgnore ignore_0 = mFD_INVISIBLE
endscript
script show_triggers
  show_trigger
endscript
script show_CAMERA
  DebugRenderIgnore ignore_0 = mFD_CAMERA_COLLIDE
endscript
script show_CAMERA_COLLIDE
  DebugRenderIgnore ignore_0 = mFD_CAMERA_COLLIDE
endscript
script show_skatable
  DebugRenderIgnore ignore_0 = mFD_SKATABLE
endscript
script show_not_skatable
  DebugRenderIgnore ignore_0 = mFD_NOT_SKATABLE
endscript
script show_no_skater_shadow
  DebugRenderIgnore ignore_0 = mFD_NO_SKATER_SHADOW
endscript
script show_skater_shadow
  DebugRenderIgnore ignore_0 = mFD_SKATER_SHADOW
endscript
script show_no_skater_shadow_wall
  DebugRenderIgnore ignore_0 = mFD_NO_SKATER_SHADOW_WALL
endscript
script show_non_collidable
  DebugRenderIgnore ignore_0 = mFD_NON_COLLIDABLE
endscript
script show_collidable
  DebugRenderIgnore ignore_1 = mFD_NON_COLLIDABLE
endscript
script frame_advance
  SpawnScript s_frame_advance
  ToggleViewMode
  UnPauseGame
  UnPauseSkaters
endscript
script s_frame_advance
  ToggleViewMode
  ToggleViewMode
  PauseGame
  PauseSkaters
endscript
script JumpSkaterToNode
  GoalManager_DeactivateAllMinigames
  MakeSkaterGoto JumpToNode params = { NodeName = <NodeName> <...> }
endscript
script JumpToNode
  if NodeExists <NodeName>
    StopBalanceTrick
    SetSpeed 0
    if GotParam MoveUpABit
      Move y = 10
    endif
    Obj_MoveToNode name = <NodeName> Orient NoReset
    Goto GroundGone
  endif
endscript
script ScreenElementSystemCleanup
  Printf "************ CLEANING UP SYSTEM ***************"
  if ObjectExists id = root_window
    DestroyScreenElement id = root_window
    ScreenElementSystemInit
    SetScreenElementProps {
      id = root_window
      event_handlers = [
        { pad_start handle_start_pressed }
      ]
      replace_handlers
      tags = { menu_state = off }
    }
    FireEvent type = focus target = root_window
    create_panel_stuff
  endif
endscript
script CreateLocal
  Create <...>
endscript
script KillLocal
  Kill <...>
endscript
script KillElement3d
  Wait 1 gameframe
  Die
endscript
script attach_arrow_to_object model = "Arrow"
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    parent = root_window
    type = Element3D
    id = <arrow_id>
    model = <model>
    HoverParams = { Amp = 10 Freq = 2 }
    AngVelY = 0.16
    ParentParams = { name = <object_id> (0, 100, 0) IgnoreParentsYRotation }
  }
endscript
script attach_arrow_to_node model = "GoalArrow" offset = (0, 100, 0)
  SetScreenElementLock id = root_window off
  PrintStruct <...>
  CreateScreenElement {
    parent = root_window
    type = Element3D
    id = <arrow_id>
    model = <model>
    HoverParams = { Amp = 10 Freq = 2 }
    AngVelY = 0.16
    ParentParams = { node = <node> <offset> IgnoreParentsYRotation }
  }
endscript
script setup_ped_speech {
    inner_radius = 8
    outer_radius = 24
    speed = 20
    pad_choose_script = ped_speech_exit
  }
   <ped_id>:Obj_ClearException SkaterInRadius
   <ped_id>:Obj_ClearException SkaterOutOfRadius
   <ped_id>:Obj_SetInnerRadius <inner_radius>
   <ped_id>:Obj_SetException ex = SkaterInRadius scr = ped_speech_got_trigger params = <...>
endscript
script ped_speech_got_trigger
  if ObjectExists id = ped_speech_dialog
     <should_destroy> = 0
    if Skater:IsInBail
       <should_destroy> = 1
    endif
    if not GoalManager_CanStartGoal
       <should_destroy> = 1
    endif
    if GoalManager_IsInCompetition
       <should_destroy> = 1
    endif
    if ( <should_destroy> = 1 )
      DestroyScreenElement id = ped_speech_dialog
    endif
  else
    if ObjectExists id = root_window
      root_window:GetTags
      if GotParam menu_state
        if ( <menu_state> = on )
          return
        endif
      endif
    endif
    if not GoalManager_CanStartGoal
      return
    endif
    if GoalManager_IsInCompetition
      return
    endif
    if Skater:OnGround
      if not Skater:IsInBail
        Obj_SetOuterRadius <outer_radius>
        Obj_SetException ex = SkaterOutOfRadius scr = ped_speech_refuse params = <...>
        if not GotParam display_name
           <display_name> = "Ped"
        endif
        FormatText TextName = accept_text "%s: \m5 to talk." s = <display_name>
        if ObjectExists id = ped_speech_dialog
          DestroyScreenElement id = ped_speech_dialog
        endif
        create_speech_box {
          anchor_id = ped_speech_dialog
          text = <accept_text>
          no_pad_choose
          no_pad_start
          pad_circle_script = ped_speech_accept
          pad_circle_params = <...>
          bg_rgba = [ 100 100 100 128 ]
          text_rgba = [ 128 128 128 128 ]
          pos = (320, 400)
          font = small
          z_priority = 5
        }
      endif
    endif
  endif
endscript
script ped_speech_accept
  speech_box_exit
  if not ObjectExists <ped_id>
    return
  endif
  Debounce x time = 0.5
  if Skater:OnGround
    if not SkaterCurrentScorePotGreaterThan 0
      Wait 5 frame
      if Skater:OnGround
        ped_speech_accept2 <...>
      else
        if not Skater:RightPressed
          if not Skater:LeftPressed
            if not Skater:UpPressed
              if not Skater:DownPressed
                ped_speech_accept2 <...>
              endif
            endif
          endif
        endif
      endif
    endif
  else
    if not Skater:RightPressed
      if not Skater:LeftPressed
        if not Skater:UpPressed
          if not Skater:DownPressed
            ped_speech_accept2 <...>
          endif
        endif
      endif
    endif
  endif
endscript
script ped_speech_accept2
  if not GameModeEquals is_singlesession
    GoalManager_DeactivateAllGoals
  endif
  PauseSkaters
   <ped_id>:Obj_ClearException SkaterInRadius
  if ObjectExists id = ped_speech_dialog
    DestroyScreenElement id = ped_speech_dialog
  endif
  if GotParam activation_script
    Skater:Obj_SpawnScript <activation_script> params = <activation_script_params>
  endif
  if GotParam cam_anim
    PlaySkaterCamAnim name = <cam_anim>
  endif
  create_speech_box <...>
endscript
script ped_speech_refuse
  Obj_ClearException SkaterOutOfRadius
  speech_box_exit anchor_id = ped_speech_dialog
  ped_speech_reset <...>
endscript
script ped_speech_set_outer_trigger_radius
  Obj_ClearException SkaterInRadius
  Obj_SetOuterRadius <outer_radius>
  Obj_SetException ex = SkaterOutOfRadius scr = ped_speech_reset params = <...>
endscript
script ped_speech_reset
  if GotParam outer_radius_script
     <outer_radius_script> <outer_radius_params>
  endif
  if not GotParam no_repeat
    setup_ped_speech <...>
  endif
endscript
script ped_speech_exit
  UnPauseSkaters
  speech_box_exit
endscript
script GetStackedScreenElementPos
  if GotParam XY
    GetStackedScreenElementPosOnXY <...>
  else
    if GotParam x
      if GotParam y
        GetStackedScreenElementPosOnXY <...>
      else
        GetStackedScreenElementPosOnX <...>
      endif
    else
      if GotParam y
        GetStackedScreenElementPosOnY <...>
      else
        script_assert "GetStackedScreenElementPos called without an axis"
      endif
    endif
  endif
  return pos = <pos>
endscript
script GetStackedScreenElementPosOnX
  GetScreenElementPosition id = <id>
  GetScreenElementDims id = <id>
   <unit_pair> = (1, 0)
  if GotParam negative
     <unit_pair> = (-1, 0)
  endif
  if GotParam offset
    return pos = ( <ScreenElementPos> + ( <unit_pair> * <width> + <offset> ) )
  else
    return pos = ( <ScreenElementPos> + ( <unit_pair> * <width> ) )
  endif
endscript
script GetStackedScreenElementPosOnY
  GetScreenElementPosition id = <id>
  GetScreenElementDims id = <id>
   <unit_pair> = (0, 1)
  if GotParam negative
     <unit_pair> = (0, -1)
  endif
  if GotParam offset
    return pos = ( <ScreenElementPos> + ( <unit_pair> * <height> + <offset> ) )
  else
    return pos = ( <ScreenElementPos> + ( <unit_pair> * <height> ) )
  endif
endscript
script GetStackedScreenElementPosOnXY
  GetScreenElementPosition id = <id>
  GetScreenElementDims id = <id>
   <x_unit_pair> = (1, 0)
   <y_unit_pair> = (0, 1)
  if GotParam negative
     <x_unit_pair> = (-1, 0)
     <y_unit_pair> = (0, -1)
  endif
  if GotParam offset
    return pos = ( <ScreenElementPos> + ( <y_unit_pair> * <height> + <x_unit_pair> * <width> + <offset> ) )
  else
    return pos = ( <ScreenElementPos> + ( <y_unit_pair> * <height> + <x_unit_pair> * <width> ) )
  endif
endscript
script kill_blur
  if not InSplitScreenGame
    KillSpawnedScript name = pulse_blur_script_down
    KillSpawnedScript name = pulse_blur_script_up
    SetScreenBlur <start>
  endif
endscript
script pulse_blur start = 200 end = 0 speed = 4
  KillSpawnedScript name = pulse_blur_script_down
  KillSpawnedScript name = pulse_blur_script_up
  if ( <start> > <end> )
    SpawnScript pulse_blur_script_down params = <...>
  else
    SpawnScript pulse_blur_script_up params = <...>
  endif
endscript
script pulse_blur_script_down
  if not InSplitScreenGame
    begin
      if ( <start> < <end> )
        SetScreenBlur <end>
        break
      endif
      SetScreenBlur <start>
       <start> = ( <start> - <speed> )
      Wait 1 gameframe
    repeat
  endif
endscript
script pulse_blur_script_up
  if not InSplitScreenGame
    begin
      if ( <start> > <end> )
        SetScreenBlur <end>
        break
      endif
      SetScreenBlur <start>
       <start> = ( <start> + <speed> )
      Wait 1 gameframe
    repeat
  endif
endscript
script NullScript
endscript
script BloodOff
endscript
script wait_and_check_for_unplugged_controllers time = 50
  Wait <time>
  Change check_for_unplugged_controllers = 1
endscript
script controller_unplugged
  Change HIDEHUD = 0
  unhide_root_window
  console_hide
  pause_trick_text
  kill_blur
  PauseStream 1
  DisableKeyboard
  if CustomParkMode editing
    memcard_menus_cleanup
    AddTextureToVram "left_arrow"
    AddTextureToVram "right_arrow"
    SetParkEditorPauseMode pause
  endif
  if LevelIs load_skateshop
    if ScreenElementExists id = main_vmenu
      StopSecondControllerCheck
    endif
  endif
  if RunningReplay
    PauseReplay
  endif
  if ScreenElementExists id = current_menu_anchor
    DoScreenElementMorph {
      id = current_menu_anchor
      scale = 0
    }
    FireEvent type = unfocus target = current_menu_anchor
  endif
  if ScreenElementExists id = current_menu
    FireEvent type = unfocus target = current_menu
  endif
  if not InNetGame
    GoalManager_PauseAllGoals
    PauseGame
  else
    MakeSkaterGoto NetBrake
  endif
  if IsNGC
    FormatText TextName = text "Please reconnect the controller to Controller Socket %i and press START to continue." i = ( <device_num> + 1 )
  else
    FormatText TextName = text "Please reconnect the controller to controller port %i and press the START button to continue." i = ( <device_num> + 1 )
  endif
  if ScreenElementExists id = dialog_box_anchor
    FireEvent type = unfocus target = dialog_box_anchor
    DoScreenElementMorph id = dialog_box_anchor scale = 0
  endif
  if ScreenElementExists id = speech_box_anchor
    FireEvent type = unfocus target = speech_box_anchor
    DoScreenElementMorph id = speech_box_anchor scale = 0
  endif
  if ScreenElementExists id = goal_start_dialog
    FireEvent type = unfocus target = goal_start_dialog
    DoScreenElementMorph id = goal_start_dialog scale = 0
  endif
  if ScreenElementExists id = goal_description_anchor
    FireEvent type = unfocus target = goal_description_anchor
    DoScreenElementMorph id = goal_description_anchor scale = 0
  endif
  if IsXBOX
    error_title = ''
  else
    error_title = 'Error'
  endif
  create_error_box {
    anchor_id = controller_unplugged_dialog_anchor
    menu_id = controller_disconnected_menu
    vmenu_id = controller_disconnected_vmenu
    helper_text_anchor_id = controller_disconnected_helper_text_anchor
    title = <error_title>
    text = <text>
    buttons = [ { text = "OK" pad_choose_script = controller_refresh pad_choose_params = { original_device_num = <device_num> } } ]
    z_priority = 100
    helper_text_bg_rgba = [ 0 0 0 128 ]
  }
  kill_start_key_binding
endscript
script controller_refresh
  if ( <original_device_num> = <device_num> )
    controller_reconnected controller = <device_num>
    if CustomParkMode editing
      parked_continue_editing
      restore_start_key_binding
      dialog_box_exit no_pad_start
      ResetAbortAndDoneScripts
    endif
  endif
endscript
script controller_reconnected
  Debounce x time = 0.3
  PauseStream 0
  console_unhide
  EnableKeyboard
  dialog_box_exit anchor_id = controller_unplugged_dialog_anchor no_pad_start
  if LevelIs load_skateshop
    if not ScreenElementExists id = skateshop_pause_menu
      UnPauseGame
      if ScreenElementExists id = main_vmenu
        SpawnSecondControllerCheck
      endif
    endif
  else
    if InNetGame
      if not GameIsOver
        restore_start_key_binding
      endif
    else
      PauseGame
    endif
  endif
   <found_menu> = 0
  if ScreenElementExists id = current_menu_anchor
    if not ScreenElementExists id = dialog_box_anchor
       <found_menu> = 1
      DoScreenElementMorph {
        id = current_menu_anchor
        scale = 1
      }
      if ( current_lobby_focus = 0 )
        FireEvent type = focus target = current_menu_anchor
      endif
      if not ObjectExists id = actions_menu_anchor
        if ObjectExists id = console_message_vmenu
          DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
        endif
      endif
      if ( current_lobby_focus = 1 )
        if ObjectExists id = console_message_vmenu
          DoScreenElementMorph id = console_message_vmenu time = 0 scale = 0
        endif
      endif
    endif
  endif
  if ScreenElementExists id = current_menu
    if not ScreenElementExists id = dialog_box_vmenu
       <found_menu> = 1
      FireEvent type = focus target = current_menu
    endif
  endif
  if ScreenElementExists id = speech_box_anchor
    UnPauseGame
     <found_menu> = 1
    DoScreenElementMorph id = speech_box_anchor scale = 1
    FireEvent type = focus target = speech_box_anchor
  endif
  if ScreenElementExists id = goal_start_dialog
    UnPauseGame
     <found_menu> = 1
    DoScreenElementMorph id = goal_start_dialog scale = 1
    FireEvent type = focus target = goal_start_dialog
  endif
  if ScreenElementExists id = goal_description_anchor
    UnPauseGame
     <found_menu> = 1
    DoScreenElementMorph id = goal_description_anchor scale = 1
    FireEvent type = focus target = goal_description_anchor
    goal_description_anchor:GetTags
    SetScreenElementProps {
      id = root_window
      event_handlers = [ { pad_start goal_description_and_speech_continue params = { Anim = <Anim> } } ]
      replace_handlers
    }
  endif
  if ScreenElementExists id = dialog_box_anchor
     <found_menu> = 1
    DoScreenElementMorph id = dialog_box_anchor scale = 1
  endif
  if ScreenElementExists id = dialog_box_vmenu
    FireEvent type = pad_up target = dialog_box_vmenu
    FireEvent type = pad_down target = dialog_box_vmenu
    FireEvent type = focus target = dialog_box_vmenu
  endif
  if LevelIs load_skateshop
    if not ScreenElementExists id = current_menu_anchor
      if not ScreenElementExists id = dialog_box_anchor
        SetScreenElementProps { id = root_window
          event_handlers = [ { pad_start skateshop_practice_start_pressed } ]
          replace_handlers
        }
      endif
    endif
  else
    root_window:GetTags
    if GotParam giving_rewards
      if ( <giving_rewards> = 1 )
        if not InNetGame
          GoalManager_UnPauseAllGoals
        endif
        unpause_trick_text
        UnPauseGame
        PauseSkaters
      else
        if ( <found_menu> = 0 )
          controller_reconnected_no_menu_finish <...>
        endif
      endif
    else
      if ( <found_menu> = 0 )
        controller_reconnected_no_menu_finish <...>
      endif
    endif
  endif
  Change check_for_unplugged_controllers = 0
  SpawnScript wait_and_check_for_unplugged_controllers params = { time = 250 }
endscript
script controller_reconnected_no_menu_finish
  Printf "no menu"
  if RunningReplay
    Printf "running replay"
    create_interrupt_replay_menu
  else
    if SkaterCamAnimFinished
      root_window:SetTags pause_controller = <controller>
      create_pause_menu
    else
      UnPauseGame
    endif
  endif
endscript
script mark_first_input_received
  Printf "mark_first_input_received"
  GetCurrentSkaterProfileIndex
  GetSkaterID
  if GotParam device_num
     <controller_index> = <device_num>
  else
     <controller_index> = <controller>
  endif
  BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <controller_index>
  FirstInputReceived
endscript
