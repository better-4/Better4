VERSION_OPTIONSANDPROS = 24
VERSION_NETWORKSETTINGS = 9
VERSION_CAS = 13
VERSION_PARK = 3
VERSION_REPLAY = 30
MAX_MEMCARD_FILENAME_LENGTH = 15
NGCMemCardHeader = 'NGCE'
SaveSize_OptionsAndPros = 40000
SaveSize_NetworkSettings = 1100
SaveSize_Cas = 2000
SaveSize_Park = 16000
SaveSize_Replay = 300000
CASIconSpaceRequired = 11
ReplayIconSpaceRequired = 19
ParkIconSpaceRequired = 11
OptionsProsIconSpaceRequired = 21
NetworkSettingsIconSpaceRequired = 21
BadVersionNumber = 'BAD VERSION NUMBER !'
DamagedFile = 'DAMAGED FILE !'
NGCDamagedFile = 'CORRUPT FILE !'
TotalGoals = 190
SavingOrLoading = Saving
script GetFileTypeName
  switch <file_type>
  case OptionsAndPros
    return filetype_name = 'CAREER'
  case NetworkSettings
    if IsXBOX
      return filetype_name = 'SYSTEM LINK SETTINGS'
    else
      return filetype_name = 'NETWORK SETTINGS'
    endif
  case Cas
    return filetype_name = 'SKATER'
  case Park
    return filetype_name = 'PARK'
  case Replay
    return filetype_name = 'REPLAY'
  default
    return filetype_name = ''
  endswitch
endscript
script QuitToDashboard
  GetPlatform
  switch <Platform>
  case PS2
    ResetPS2
  case Xbox
    if IsDemo
      DisplayEndScreen "DemoScreen1"
    endif
    QuitGame
  case NGC
    ResetToIPL
  endswitch
endscript
script destroy_pause_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 gameframe
  endif
  remove_pause_menu_textures_from_vram
  kill_start_key_binding
endscript
script destroy_main_menu
  KillSpawnedScript name = Skateshop_Slideshow
  KillSkaterCamAnim all
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 gameframe
  endif
  remove_main_menu_textures_from_vram
endscript
script destroy_files_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  remove_files_menu_textures_from_vram
endscript
script destroy_net_settings_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 gameframe
  endif
endscript
script destroy_internet_options_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 gameframe
  endif
  remove_ss_menu_textures_from_vram
endscript
script destroy_level_select
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  remove_level_select_menu_textures_from_vram
endscript
script ResetAbortAndDoneScripts
  Change DoneScript = DefaultDoneScript
  Change AbortScript = DefaultAbortScript
  Change RetryScript = DefaultRetryScript
  Change SavingOrLoading = Saving
endscript
DoneScript = DefaultDoneScript
script DefaultDoneScript
  Printf "DefaultDoneScript called !!!"
endscript
AbortScript = DefaultAbortScript
script DefaultAbortScript
  Printf "DefaultAbortScript called !!!"
endscript
script memcard_menus_cleanup
  EnableReset
  dialog_box_exit no_pad_start
  destroy_files_menu
  destroy_onscreen_keyboard
  if not ( LevelIs load_skateshop )
    GoalManager_ShowPoints
    if not GoalManager_HasActiveGoals
      GoalManager_ShowGoalPoints
    endif
  endif
endscript
script back_to_main_menu
  memcard_menus_cleanup
  ResetAbortAndDoneScripts
  create_main_menu
endscript
script back_to_pause_menu
  memcard_menus_cleanup
  ResetAbortAndDoneScripts
  restore_start_key_binding
  if ( save_successful = 1 )
    Printf "save complete ========================="
    parked_quit level = load_skateshop
  else
    Printf "save aborted ========================="
    create_pause_menu
  endif
  Change save_successful = 2
endscript
script back_to_end_replay_menu
  memcard_menus_cleanup
  ResetAbortAndDoneScripts
  create_in_game_end_replay_menu
endscript
script back_to_net_settings_menu
  memcard_menus_cleanup
  ResetAbortAndDoneScripts
  create_network_options_menu
endscript
script back_to_beat_goal
  memcard_menus_cleanup
  ResetAbortAndDoneScripts
  FireEvent type = goal_wait_for_save
endscript
script back_to_select_skater
  memcard_menus_cleanup
  ResetAbortAndDoneScripts
  launch_select_skater_menu
endscript
script back_to_options_menu
  memcard_menus_cleanup
  ResetAbortAndDoneScripts
  create_setup_options_menu
endscript
script back_to_career_options_menu
  memcard_menus_cleanup
  ResetAbortAndDoneScripts
  create_career_options_menu
endscript
script back_to_created_park_menu
  memcard_menus_cleanup
  ResetAbortAndDoneScripts
  if ( still_in_net_area = 1 )
    back_to_net_host_options
  else
    launch_level_select_menu
    level_select_created_park_menu
  endif
endscript
script load_loaded_created_park
  dialog_box_exit
  if ( still_in_net_area = 1 )
    back_to_net_host_options
  else
    if LevelIs load_Sk4Ed_gameplay
      if ( created_park_warning = 1 )
        Change created_park_warning = 0
        level_select_change_level level = load_Sk4Ed_gameplay <...> show_warning
      else
        level_select_change_level level = load_Sk4Ed_gameplay <...>
      endif
    else
      launch_level_select_menu
      level_select_created_park_menu
    endif
  endif
endscript
script back_to_net_host_options
  prefs = network
  field = "level"
  string = "Created Park"
  checksum = load_Sk4Ed_gameplay
  select_host_option <...>
  Change still_in_net_area = 0
  KillSkaterCamAnim all
  PlaySkaterCamAnim name = SS_MenuCam play_hold
  if ObjectExists id = host_options_menu
    DestroyScreenElement id = host_options_menu
  endif
  create_network_host_options_menu
endscript
script back_to_internet_options_menu
  memcard_menus_cleanup
  ResetAbortAndDoneScripts
  if ( load_successful = 1 )
    upload_content
  else
    create_internet_options
  endif
  Change load_successful = 2
endscript
RetryScript = DefaultRetryScript
script DefaultRetryScript
  Printf "DefaultRetryScript called !!!"
endscript
script mem_card_message_pause
  DisableReset
  if not GotParam NoTimerReset
    ResetTimer
  endif
   <CardCheckCounter> = 0
  begin
    if CustomParkMode editing
      if ScreenElementExists id = controller_unplugged_dialog_anchor
        Goto nullscript
      endif
    endif
    if not GotParam NoCardRemovalCheck
      if ( <CardCheckCounter> = 10 )
        DisableReset
        if not CardIsInSlot
          Goto mcmess_ErrorNoCardInSlot
        endif
         <CardCheckCounter> = 0
      else
         <CardCheckCounter> = ( <CardCheckCounter> + 1 )
      endif
    endif
    if TimeGreaterThan 0
      break
    endif
    Wait 1 gameframe
  repeat
endscript
script check_card
  DisableReset
  if not CardIsInSlot
    Goto mcmess_ErrorNoCardInSlot
  endif
  if BadDevice
    Goto mcmess_BadDevice
  endif
  if CardIsDamaged
    Goto mcmess_DamagedCard
  endif
  if not SectorSizeOK
    if CardIsDamaged
      Goto mcmess_DamagedCard
    else
      Goto mcmess_BadSectorSize
    endif
  endif
  if not CardIsFormatted
    if CardIsDamaged
      Goto mcmess_DamagedCard
    else
      if GotParam Save
        Goto mcmess_ErrorNotFormatted
      else
        Goto mcmess_ErrorNotFormattedNoFormatOption
      endif
    endif
  endif
  if not IsXBOX
    mcmess_CheckingCard
    mem_card_message_pause
    dialog_box_exit no_pad_start
  endif
endscript
StopCheckingForCardRemoval = 0
script CheckForCardRemoval
  DisableReset
  Change StopCheckingForCardRemoval = 0
   <CardCheckCounter> = 0
  begin
    if ( <CardCheckCounter> = 10 )
      DisableReset
      if not CardIsInSlot
        Goto mcmess_ErrorNoCardInSlot
      endif
       <CardCheckCounter> = 0
    else
       <CardCheckCounter> = ( <CardCheckCounter> + 1 )
    endif
    if not ObjectExists id = <menu_id>
      break
    endif
    if IsTrue StopCheckingForCardRemoval
      break
    endif
    Wait 1 gameframe
  repeat
endscript
script DoFormatCard
  DisableReset
  if CardIsFormatted
    Goto DoneScript
  endif
  ResetTimer
  mcmess_FormattingCard
  DisableReset
  if FormatCard
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    Goto mcmess_FormatSuccessful
  else
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    Goto mcmess_FormatFailed
  endif
endscript
script launch_files_menu
  DebugFn 766
  memcard_menus_cleanup
  create_files_menu <...>
endscript
script create_files_menu pos_tweak = (-20, -45)
  if CustomParkMode editing
    if ScreenElementExists id = controller_unplugged_dialog_anchor
      return
    endif
  endif
  DisableReset
  if GotParam Save
    Change SavingOrLoading = Saving
  else
    Change SavingOrLoading = Loading
  endif
  if not CardIsInSlot
    Goto mcmess_ErrorNoCardInSlot
  endif
  add_files_menu_textures_to_vram
  SetScreenElementLock id = root_window off
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  if GotParam Save
    menu_title = '  SAVE FILE'
    helper_text = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
        { text = "\m1 = Back" }
        { text = "\m0 = Accept" }
        { text = "\md = Delete" }
      ]
    }
  else
    menu_title = '  LOAD FILE'
    helper_text = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
        { text = "\m1 = Back" }
        { text = "\m0 = Accept" }
      ]
    }
  endif
  make_new_menu { menu_title = <menu_title>
    padding_scale = 1
    menu_id = files_menu
    vmenu_id = files_vmenu
    pos = ( (75, 82) + <pos_tweak> )
    dims = (500, 216)
    just = [ center top ]
    type = VScrollingMenu
    scrolling_menu_id = files_scrolling_menu
    scrolling_menu_title_id = files_scrolling_menu_title
    scrolling_menu_offset = (0, 32)
    dont_allow_wrap = dont_allow_wrap
    helper_text = <helper_text>
  }
  SetScreenElementProps {
    id = current_menu
    event_handlers = [ { pad_back AbortScript }
      { pad_down menu_vert_blink_arrow params = { id = files_menu_down_arrow } }
      { pad_up menu_vert_blink_arrow params = { id = files_menu_up_arrow } }
    ]
  }
  set_sub_bg pos = ( (207, 90) + <pos_tweak> )
  if GotParam Save
     <icon_texture> = PA_save
  else
     <icon_texture> = PA_Load
  endif
  create_icon texture = <icon_texture> pos = ( (55, 90) + <pos_tweak> )
  files_menu_add_top_bar
  if GotParam Save
    GetMemCardDirectoryListing
    GetMemCardSpaceAvailable
    GetMemCardSpaceRequired <FileType>
    RemoveParameter add_createnew_option
    if ( <TotalTHPS4FilesOnCard> = 0 )
      if ( <SpaceAvailable> < <SpaceRequired> )
        Goto mcmess_ErrorNotEnoughRoomNoTHPSFilesExist params = {
          FileType = <FileType>
          SpaceRequired = <SpaceRequired>
          SpaceAvailable = <SpaceAvailable>
        }
      else
         <add_createnew_option> = 1
      endif
    else
      if ( ( <SpaceAvailable> < <SpaceRequired> ) or ( <FilesLeft> < 1 ) )
        if not GotParam DoNotShowNotEnoughRoomMessage
          Goto mcmess_ErrorNotEnoughRoomButTHPSFilesExist params = { FileType = <FileType> SpaceRequired = <SpaceRequired> }
        endif
      else
        if not GotParam FilesLimitReached
           <add_createnew_option> = 1
        endif
      endif
    endif
    if GotParam add_createnew_option
      files_menu_add_item { file_type = <FileType>
        filename = '              Create new'
        file_size = ''
        pad_choose_script = CreateNew
        font = small
        icon_alpha = 0.0
      }
    endif
  else
    GetMemCardDirectoryListing FileType = <FileType>
  endif
  if GotParam DirectoryListing
    if GotParam Save
      if GotParam add_createnew_option
        ForEachIn <DirectoryListing> do = files_menu_add_item params = { pad_choose_script = OKToOverwrite MenuFileType = <FileType> Save }
      else
        ForEachIn <DirectoryListing> do = files_menu_add_item params = { pad_choose_script = OKToOverwrite MenuFileType = <FileType> Save ListAllTypes }
      endif
    else
      ForEachIn <DirectoryListing> do = files_menu_add_item params = { pad_choose_script = Load }
    endif
  else
    if not GotParam Save
      Goto mcmess_NoFiles params = { MenuFileType = <FileType> }
    endif
  endif
  RemoveParameter DirectoryListing
  RemoveParameter add_createnew_option
  files_menu_add_bottom_bar <...>
  if ScreenElementExists id = controller_unplugged_dialog_anchor
    DoScreenElementMorph id = current_menu_anchor scale = 0
  else
    RunScriptOnScreenElement id = current_menu_anchor animate_in
  endif
  Wait 2 gameframe
  SetScreenElementProps id = files_scrolling_menu reset_window_top
  CheckForCardRemoval menu_id = files_menu
endscript
script files_menu_add_item pad_choose_script = nullscript font = dialog icon_alpha = 1.0
  if GotParam Save
    if not GotParam ListAllTypes
      if not ( <MenuFileType> = <file_type> )
        return
      endif
    endif
  endif
  RemoveParameter ListAllTypes
  if IsNGC
    heap = topdown
  else
    heap = #"Default"
  endif
  if IsNGC
    CreateScreenElement {
      type = ContainerElement
      parent = current_menu
      dims = (550, 24)
      event_handlers = [ { focus files_menu_focus }
        { unfocus files_menu_unfocus }
        { pad_choose <pad_choose_script> }
        { pad_choose generic_menu_pad_choose_sound }
        { pad_start <pad_choose_script> }
        { pad_circle files_menu_delete }
      ]
      heap = <heap>
    }
  else
    CreateScreenElement {
      type = ContainerElement
      parent = current_menu
      dims = (550, 24)
      event_handlers = [ { focus files_menu_focus }
        { unfocus files_menu_unfocus }
        { pad_choose <pad_choose_script> }
        { pad_start <pad_choose_script> }
        { pad_square files_menu_delete }
      ]
    }
  endif
   <container_id> = <id>
  RemoveParameter Year
  RemoveParameter Month
  RemoveParameter Day
  RemoveParameter Hour
  RemoveParameter Minutes
  RemoveParameter seconds
   <container_id>:SetTags <...>
  if IsXBOX
    if GotParam Corrupt
      GetFileTypeName file_type = <file_type>
      FormatText TextName = filename 'DAMAGED %s' s = <filetype_name>
    endif
  endif
  if GotParam Save
    if ( <MenuFileType> = <file_type> )
      rgba = [ 88 105 112 128 ]
    else
      rgba = [ 44 52 56 64 ]
    endif
  else
    rgba = [ 88 105 112 128 ]
  endif
  CreateScreenElement {
    type = TextElement
    parent = <container_id>
    font = <font>
    text = <filename>
    pos = (45, 0)
    just = [ left center ]
    rgba = <rgba>
    z_priority = 6
    heap = <heap>
  }
  if GotParam total_file_size
    GetPlatform
    switch <Platform>
    case PS2
      FormatText TextName = file_size_text '%d KB' d = ( <total_file_size> -1 )
    case Xbox
      FormatText TextName = file_size_text '%d kbs' d = <total_file_size>
    case NGC
      FormatText TextName = file_size_text '%d kbs' d = <total_file_size>
    endswitch
  else
     <file_size_text> = ""
  endif
  CreateScreenElement {
    type = TextElement
    parent = <container_id>
    font = small
    text = <file_size_text>
    pos = (500, 2)
    just = [ right center ]
    rgba = <rgba>
    z_priority = 6
    heap = <heap>
  }
  switch <file_type>
  case OptionsAndPros
     <file_type_icon> = mem_career
  case NetworkSettings
     <file_type_icon> = mem_net
  case Park
     <file_type_icon> = mem_park
  case Replay
     <file_type_icon> = mem_replay
  case Cas
     <file_type_icon> = mem_skater
  default
     <file_type_icon> = mem_bad
  endswitch
  CreateScreenElement {
    type = SpriteElement
    parent = <container_id>
    texture = <file_type_icon>
    pos = (25, 0)
    just = [ center center ]
    rgba = [ 50 50 50 128 ]
    scale = 0.72
    z_priority = 1
    alpha = <icon_alpha>
    heap = <heap>
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <container_id>
    texture = highlight_bar
    pos = (5, 0)
    just = [ left center ]
    scale = (2, 1.2)
    rgba = [ 128 128 128 0 ]
    heap = <heap>
  }
  files_menu_add_bg parent = <container_id>
endscript
script files_menu_add_top_bar
  GetStackedScreenElementPos Y id = files_scrolling_menu_title offset = (0, 8)
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    dims = (550, 24)
    pos = <pos>
    just = [ left top ]
  }
   <container_id> = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = <container_id>
    id = files_menu_up_arrow
    texture = up_arrow
    pos = (250, 0)
    just = [ center center ]
  }
  GetStackedScreenElementPos Y id = <id> offset = (-231, 2)
  CreateScreenElement {
    type = SpriteElement
    parent = <container_id>
    texture = black
    pos = <pos>
    just = [ left top ]
    scale = (129, 0.5)
    rgba = [ 128 128 128 60 ]
  }
  files_menu_add_bg parent = <container_id> cap_texture = grungeframe_top
endscript
script files_menu_add_bottom_bar
  GetStackedScreenElementPos Y id = files_scrolling_menu
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    dims = (550, 24)
    pos = <pos>
    just = [ left top ]
    not_focusable
  }
   <container_id> = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = <container_id>
    texture = black
    scale = (129, 0.5)
    pos = (3, -3)
    just = [ left center ]
    rgba = [ 128 128 128 60 ]
  }
  GetStackedScreenElementPos Y id = <id> offset = (225, 3)
  CreateScreenElement {
    type = SpriteElement
    parent = <container_id>
    id = files_menu_down_arrow
    texture = down_arrow
    pos = <pos>
    just = [ left top ]
  }
  files_menu_add_bg parent = <container_id>
  GetStackedScreenElementPos Y id = <container_id>
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    dims = (550, 24)
    pos = <pos>
    just = [ left top ]
  }
   <info_section_id> = <id>
  files_menu_add_bg parent = <info_section_id>
  CreateScreenElement {
    type = TextElement
    parent = <id>
    id = files_menu_file_info
    font = small
    text = ''
    pos = (10, 0)
    scale = 0.8
    just = [ left center ]
  }
  GetStackedScreenElementPos Y id = <info_section_id>
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    dims = (550, 24)
    pos = <pos>
    just = [ left top ]
  }
   <mem_info_id> = <id>
  files_menu_add_bg parent = <mem_info_id> cap_texture = grungeframe_bot
  GetPlatform
  if GotParam Save
    GetMemCardSpaceRequired <FileType>
    switch <Platform>
    case Xbox
    case NGC
      FormatText {
        TextName = LeftText
        'Needed: %n kbs'
        n = <SpaceRequired>
      }
    case PS2
      FormatText {
        TextName = LeftText
        'Needed: %n KB'
        n = ( <SpaceRequired> -1 )
      }
    endswitch
  endif
  DisableReset
  GetMemCardSpaceAvailable
  switch <Platform>
  case Xbox
    if ( <SpaceAvailable> > 49999 )
      MiddleText = 'Free: 50000+'
    else
      FormatText {
        TextName = MiddleText
        'Free: %f kbs'
        f = <SpaceAvailable>
      }
    endif
  case NGC
    FormatText {
      TextName = MiddleText
      'Free: %f kbs'
      f = <SpaceAvailable>
    }
  case PS2
    if ( <SpaceAvailable> < 3 )
      displayed_space_available = 0
    else
      displayed_space_available = ( <SpaceAvailable> -2 )
    endif
    FormatText {
      TextName = MiddleText
      'Free: %f KB'
      f = <displayed_space_available>
    }
  endswitch
  GetMaxTHPS4FilesAllowed
  FormatText {
    TextName = RightText
    'Files: %t/%m'
    t = <TotalTHPS4FilesOnCard>
    m = <MaxTHPS4FilesAllowed>
  }
   <text_bg_rgba> = [ 0 0 0 50 ]
   <text_offset> = (5, 2)
  if GotParam Save
    CreateScreenElement {
      type = TextElement
      parent = <mem_info_id>
      font = small
      pos = ( (5, -11) + <text_offset> )
      just = [ left top ]
      rgba = [ 88 105 112 128 ]
      scale = 0.75
      text = <LeftText>
    }
  endif
  CreateScreenElement {
    type = SpriteElement
    parent = <mem_info_id>
    texture = black
    scale = (49, 5)
    pos = (5, -11)
    just = [ left top ]
    rgba = <text_bg_rgba>
  }
  GetStackedScreenElementPos X id = <id> offset = (3, 0)
  CreateScreenElement {
    type = TextElement
    parent = <mem_info_id>
    font = small
    pos = ( <pos> + <text_offset> )
    just = [ left top ]
    rgba = [ 88 105 112 128 ]
    scale = 0.75
    text = <MiddleText>
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <mem_info_id>
    texture = black
    scale = (47, 5)
    pos = <pos>
    just = [ left top ]
    rgba = <text_bg_rgba>
  }
  GetStackedScreenElementPos X id = <id> offset = (3, 0)
  CreateScreenElement {
    type = TextElement
    parent = <mem_info_id>
    font = small
    pos = ( <pos> + <text_offset> )
    just = [ left top ]
    rgba = [ 88 105 112 128 ]
    scale = 0.75
    text = <RightText>
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <mem_info_id>
    texture = black
    scale = (31, 5)
    pos = <pos>
    just = [ left top ]
    rgba = <text_bg_rgba>
  }
endscript
script files_menu_add_bg { cap_texture = grungeframe_mid
    pos = (0, -7)
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <parent>
    texture = black
    scale = (130, 6)
    pos = <pos>
    rgba = [ 0 0 0 85 ]
    just = [ left top ]
    z_priority = -1
  }
  GetStackedScreenElementPos X id = <id> offset = (-15, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = <parent>
    texture = <cap_texture>
    scale = (1, 0.75)
    pos = <pos>
    just = [ left top ]
    rgba = [ 128 128 128 85 ]
    z_priority = -1
  }
endscript
script files_menu_focus
  GetTags
   <files_menu_file_info_text> = ''
  if not GotParam index
    GetSummaryInfo <file_type>
  endif
  if not ( ( GotParam BadVersion ) or ( GotParam Corrupt ) )
    switch <file_type>
    case OptionsAndPros
      FormatText {
        TextName = files_menu_file_info_text
        '\c3CAREER: %p\% done, %g/%t goals done, $%m'
        p = ( ( 100 * <NumGoalsBeaten> ) / TotalGoals )
        g = <NumGoalsBeaten>
        t = TotalGoals
        m = <cash>
      }
    case NetworkSettings
      FormatText {
        TextName = files_menu_file_info_text
        '\c3NETWORK SETTINGS: ID=\'%i\''
        i = <network_id>
      }
    case Cas
       <files_menu_file_info_text> = '\c3Create-a-Skater'
    case Park
       <files_menu_file_info_text> = '\c3Park'
    case Replay
      FormatText {
        TextName = files_menu_file_info_text
        '\c3Replay: %l'
        l = <LevelName>
      }
    endswitch
  endif
  SetScreenElementProps {
    id = files_menu_file_info
    text = <files_menu_file_info_text>
  }
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = [ 128 118 0 128 ]
  }
  SetScreenElementProps {
    id = { <id> child = 2 }
    rgba = [ 128 118 0 128 ]
    z_priority = 7
  }
  DoScreenElementMorph {
    id = { <id> child = 2 }
    scale = 1
  }
  SetScreenElementProps {
    id = { <id> child = 3 }
    rgba = [ 128 128 128 50 ]
  }
  GetScreenElementDims id = files_vmenu
  if ( <height> > 216 )
    SetScreenElementProps {
      id = files_menu_up_arrow
      rgba = [ 128 128 128 0 ]
    }
    SetScreenElementProps {
      id = files_menu_down_arrow
      rgba = [ 128 128 128 0 ]
    }
  else
    generic_menu_update_arrows {
      menu_id = files_vmenu
      up_arrow_id = files_menu_up_arrow
      down_arrow_id = files_menu_down_arrow
    }
  endif
endscript
script files_menu_unfocus
  GetTags
  if GotParam Save
    if ( <MenuFileType> = <file_type> )
      rgba = [ 88 105 112 128 ]
    else
      rgba = [ 44 52 56 64 ]
    endif
  else
    rgba = [ 88 105 112 128 ]
  endif
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down params = { rgba = <rgba> }
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = <rgba>
  }
  SetScreenElementProps {
    id = { <id> child = 2 }
    rgba = [ 50 50 50 128 ]
    z_priority = 6
  }
  DoScreenElementMorph {
    id = { <id> child = 2 }
    scale = 0.72
  }
  SetScreenElementProps {
    id = { <id> child = 3 }
    rgba = [ 128 128 128 0 ]
  }
endscript
script add_files_menu_textures_to_vram
  AddTextureToVram "mem_career"
  AddTextureToVram "mem_net"
  AddTextureToVram "mem_park"
  AddTextureToVram "mem_replay"
  AddTextureToVram "mem_skater"
  AddTextureToVram "mem_bad"
  AddTextureToVram "down_arrow"
  AddTextureToVram "up_arrow"
  AddTextureToVram "grungeframe_top"
  AddTextureToVram "grungeframe_mid"
  AddTextureToVram "grungeframe_bot"
  AddTextureToVram "PA_Save"
  AddTextureToVram "PA_Load"
endscript
script remove_files_menu_textures_from_vram
  RemoveTextureFromVram "mem_career"
  RemoveTextureFromVram "mem_net"
  RemoveTextureFromVram "mem_park"
  RemoveTextureFromVram "mem_replay"
  RemoveTextureFromVram "mem_skater"
  RemoveTextureFromVram "mem_bad"
  RemoveTextureFromVram "down_arrow"
  RemoveTextureFromVram "up_arrow"
  RemoveTextureFromVram "grungeframe_top"
  RemoveTextureFromVram "grungeframe_mid"
  RemoveTextureFromVram "grungeframe_bot"
  RemoveTextureFromVram "PA_Save"
  RemoveTextureFromVram "PA_Load"
endscript
script files_menu_delete
  GetTags
  if GotParam index
    if GotParam Save
      memcard_menus_cleanup
      GetFileTypeName file_type = <file_type>
      FormatText {
        TextName = DeleteText
        'Delete the %t file\n\'%s\' ?'
        t = <filetype_name>
        s = <filename>
      }
      create_snazzy_dialog_box {
        title = 'Delete'
        text = <DeleteText>
        pad_back_script = launch_files_menu
        pad_back_params = { FileType = <MenuFileType> Save }
        buttons = [
          { font = small text = 'No' pad_choose_script = launch_files_menu pad_choose_params = { FileType = <MenuFileType> Save } }
          { font = small text = 'Yes' pad_choose_script = delete_file pad_choose_params = <...> }
        ]
      }
      CheckForCardRemoval menu_id = dialog_box_anchor
    endif
  endif
endscript
script delete_file
  memcard_menus_cleanup
  Change StopCheckingForCardRemoval = 1
  ResetTimer
  mcmess_DeletingFile FileType = <file_type>
  DisableReset
  if DeleteMemCardFile CardFileName = <actual_file_name> XBoxDirectoryName = <xbox_directory_name>
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    create_snazzy_dialog_box {
      title = 'File Deleted'
      text = 'Delete successful'
      pad_back_script = launch_files_menu
      pad_back_params = { FileType = <MenuFileType> Save }
      buttons = [
        { font = small text = 'OK' pad_choose_script = launch_files_menu pad_choose_params = { FileType = <MenuFileType> Save } }
      ]
    }
    CheckForCardRemoval menu_id = dialog_box_anchor
  else
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    Goto mcmess_ErrorDeleteFailed
  endif
endscript
script delete_bad_file
  memcard_menus_cleanup
  ResetTimer
  mcmess_DeletingFile FileType = <file_type>
  DisableReset
  if DeleteMemCardFile {
      CardFileName = <actual_file_name>
      XBoxDirectoryName = <xbox_directory_name>
      UserFileName = <filename>
      type = <file_type>
    }
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    if GotParam GoBackToFilesMenu
      create_snazzy_dialog_box {
        title = 'File Deleted'
        text = 'Delete successful'
        pad_back_script = launch_files_menu
        pad_back_params = { FileType = <MenuFileType> }
        buttons = [
          { font = small text = 'OK' pad_choose_script = launch_files_menu pad_choose_params = { FileType = <file_type> } }
        ]
      }
    else
      create_snazzy_dialog_box {
        title = 'File Deleted'
        text = 'Delete successful'
        pad_back_script = AbortScript
        buttons = [
          { font = small text = 'OK' pad_choose_script = AbortScript }
        ]
      }
    endif
    CheckForCardRemoval menu_id = dialog_box_anchor
  else
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    Goto mcmess_ErrorDeleteFailed
  endif
endscript
script NGC_delete_bad_file
  memcard_menus_cleanup
  ResetTimer
  mcmess_DeletingFile
  DisableReset
  if DeleteMemCardFile {
      CardFileName = <actual_file_name>
      UserFileName = <filename>
      type = <file_type>
    }
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    create_snazzy_dialog_box {
      title = 'File Deleted'
      text = 'Delete successful'
      pad_back_script = launch_files_menu
      pad_back_params = { FileType = <MenuFileType> Save }
      buttons = [
        { font = small text = 'OK' pad_choose_script = launch_files_menu pad_choose_params = { FileType = <MenuFileType> Save } }
      ]
    }
    CheckForCardRemoval menu_id = dialog_box_anchor
  else
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    Goto mcmess_ErrorDeleteFailed
  endif
endscript
script OKToOverwrite
  if GotParam NoGetTags
  else
    GetTags
  endif
  if not ( <MenuFileType> = <file_type> )
    return
  endif
  if ( ( GotParam BadVersion ) or ( GotParam Corrupt ) )
    if IsNGC
      Goto mcmess_NGCDeleteCorruptFile params = <...>
    endif
    return
  endif
  DisableReset
  GetMemCardSpaceRequired <MenuFileType>
  GetMemCardSpaceAvailable
  if ( <SpaceRequired> > <SpaceAvailable> + <total_file_size> )
    Goto mcmess_ErrorNotEnoughRoomButTHPSFilesExist params = {
      Overwrite
      FileType = <MenuFileType>
      SpaceRequired = <SpaceRequired>
      SpaceAvailable = ( <SpaceAvailable> + <total_file_size> )
    }
  endif
  memcard_menus_cleanup
  DisableReset
  GetFileTypeName file_type = <file_type>
  FormatText {
    TextName = OverwriteText
    'OK to overwrite the existing %t file\n\'%s\' ?'
    t = <filetype_name>
    s = <filename>
  }
  DebugFn 765
  create_snazzy_dialog_box {
    title = 'Overwrite'
    text = <OverwriteText>
    pad_back_script = launch_files_menu
    pad_back_params = { FileType = <MenuFileType> Save }
    buttons = [
      { font = small text = 'No' pad_choose_script = launch_files_menu pad_choose_params = { FileType = <MenuFileType> Save } }
      {
        font = small text = 'Yes'
        pad_choose_script = DeleteOldSaveNewOk
        pad_choose_params =
        {
          filename = <filename>
          old_file_type = <file_type>
          new_file_type = <MenuFileType>
          actual_file_name = <actual_file_name>
        }
      }
    ]
  }
  CheckForCardRemoval menu_id = dialog_box_anchor
endscript
script DeleteOldSaveNew
  memcard_menus_cleanup
  Change StopCheckingForCardRemoval = 1
  DisableReset
  ResetTimer
  DisableReset
  if MemCardFileExists name = <filename> type = <new_file_type>
    OKToOverwrite NoGetTags filename = <filename> file_type = <new_file_type> MenuFileType = <new_file_type> total_file_size = <total_file_size>
  else
    Save filename = <filename> file_type = <new_file_type>
  endif
endscript
script DeleteOldSaveNewOk
  DebugFn 766
  memcard_menus_cleanup
  Change StopCheckingForCardRemoval = 1
  ResetTimer
  Save filename = <filename> file_type = <new_file_type>
endscript
script retry_launch_save_network_settings
  memcard_menus_cleanup
  Goto launch_save_network_settings
endscript
script launch_save_network_settings
  destroy_net_settings_menu
  remove_main_menu_textures_from_vram
  Change RetryScript = retry_launch_save_network_settings
  Change AbortScript = back_to_net_settings_menu
  Change DoneScript = back_to_net_settings_menu
  Change SavingOrLoading = Saving
  check_card FileType = NetworkSettings Save
  launch_files_menu Save FileType = NetworkSettings
endscript
script retry_launch_save_internet_settings
  memcard_menus_cleanup
  Goto launch_save_internet_settings
endscript
script launch_save_internet_settings
  destroy_internet_options_menu
  remove_main_menu_textures_from_vram
  Change RetryScript = retry_launch_save_internet_settings
  Change AbortScript = back_to_internet_options_menu
  Change DoneScript = back_to_internet_options_menu
  Change SavingOrLoading = Saving
  check_card FileType = NetworkSettings Save
  launch_files_menu Save FileType = NetworkSettings
endscript
script retry_launch_pause_menu_save_game_sequence
  memcard_menus_cleanup
  Goto launch_pause_menu_save_game_sequence
endscript
script launch_pause_menu_save_game_sequence
  destroy_pause_menu
  Change RetryScript = retry_launch_pause_menu_save_game_sequence
  Change AbortScript = back_to_pause_menu
  Change DoneScript = back_to_pause_menu
  Change SavingOrLoading = Saving
  check_card FileType = OptionsAndPros Save
  MaybeSaveCustomSkater
  launch_files_menu Save FileType = OptionsAndPros
endscript
script retry_launch_end_replay_menu_save_replay_sequence
  memcard_menus_cleanup
  Goto launch_end_replay_menu_save_replay_sequence
endscript
script launch_end_replay_menu_save_replay_sequence
  destroy_pause_menu
  Change RetryScript = retry_launch_end_replay_menu_save_replay_sequence
  Change AbortScript = back_to_end_replay_menu
  Change DoneScript = back_to_end_replay_menu
  Change SavingOrLoading = Saving
  check_card FileType = Replay Save
  launch_files_menu Save FileType = Replay
endscript
save_successful = 2
script retry_launch_pause_menu_save_park_sequence
  memcard_menus_cleanup
  Goto launch_pause_menu_save_park_sequence
endscript
script launch_pause_menu_save_park_sequence
  destroy_pause_menu
  Change RetryScript = retry_launch_pause_menu_save_park_sequence
  Change AbortScript = back_to_pause_menu
  Change DoneScript = back_to_pause_menu
  Change SavingOrLoading = Saving
  check_card FileType = Park Save
  launch_files_menu Save FileType = Park
endscript
script retry_launch_park_editor_save_park_sequence
  memcard_menus_cleanup
  Goto launch_park_editor_save_park_sequence
endscript
script launch_park_editor_save_park_sequence
  destroy_pause_menu
  Change RetryScript = retry_launch_park_editor_save_park_sequence
  Change AbortScript = back_to_pause_menu
  Change DoneScript = back_to_pause_menu
  Change SavingOrLoading = Saving
  Change save_successful = 0
  check_card FileType = Park Save
  launch_files_menu Save FileType = Park
endscript
script retry_launch_pause_menu_load_park_sequence
  memcard_menus_cleanup
  Goto launch_pause_menu_load_park_sequence
endscript
script launch_pause_menu_load_park_sequence
  destroy_pause_menu
  Change RetryScript = retry_launch_pause_menu_load_park_sequence
  Change AbortScript = back_to_pause_menu
  Change DoneScript = back_to_pause_menu
  Change SavingOrLoading = Loading
  check_card FileType = Park Load
  launch_files_menu Load FileType = Park
endscript
script retry_launch_level_select_load_park_sequence
  memcard_menus_cleanup
  Goto launch_level_select_load_park_sequence
endscript
script launch_level_select_load_park_sequence
  destroy_level_select
  Change RetryScript = retry_launch_level_select_load_park_sequence
  Change AbortScript = back_to_created_park_menu
  Change DoneScript = load_loaded_created_park
  Change SavingOrLoading = Loading
  check_card FileType = Park Load
  launch_files_menu Load FileType = Park
endscript
load_successful = 2
script retry_launch_upload_park_load_park_sequence
  memcard_menus_cleanup
  Goto launch_upload_park_load_park_sequence
endscript
script launch_upload_park_load_park_sequence
  Change load_successful = 0
  Change RetryScript = retry_launch_upload_park_load_park_sequence
  Change AbortScript = back_to_internet_options_menu
  Change DoneScript = back_to_internet_options_menu
  Change SavingOrLoading = Loading
  check_card FileType = Park Load
  launch_files_menu Load FileType = Park
endscript
script retry_launch_download_park_save_sequence
  memcard_menus_cleanup
  Goto launch_download_park_save_sequence
endscript
script launch_download_park_save_sequence
  Change RetryScript = retry_launch_download_park_save_sequence
  Change AbortScript = back_from_transfer_succeeded_dialog
  Change DoneScript = back_from_transfer_succeeded_dialog
  Change SavingOrLoading = Saving
  check_card FileType = Park Save
  launch_files_menu Save FileType = Park
endscript
script retry_launch_save_cas_sequence
  memcard_menus_cleanup
  Goto launch_save_cas_sequence
endscript
script launch_save_cas_sequence
  destroy_main_menu
  PlaySkaterCamAnim name = SS_menucam_credits play_hold
  Change RetryScript = retry_launch_save_cas_sequence
  Change AbortScript = back_to_main_menu
  Change DoneScript = back_to_main_menu
  Change SavingOrLoading = Saving
  check_card FileType = Cas Save
  launch_files_menu Save FileType = Cas
endscript
script retry_launch_options_menu_save_game_sequence
  memcard_menus_cleanup
  Goto launch_options_menu_save_game_sequence
endscript
script launch_options_menu_save_game_sequence
  destroy_main_menu
  PlaySkaterCamAnim name = SS_menucam_options play_hold
  Change RetryScript = retry_launch_options_menu_save_game_sequence
  Change AbortScript = back_to_options_menu
  Change DoneScript = back_to_options_menu
  Change SavingOrLoading = Saving
  check_card Save FileType = OptionsAndPros
  MaybeSaveCustomSkater
  launch_files_menu Save FileType = OptionsAndPros
endscript
script retry_launch_beat_goal_save_game_sequence
  memcard_menus_cleanup
  Goto launch_beat_goal_save_game_sequence
endscript
script launch_beat_goal_save_game_sequence
  Change RetryScript = retry_launch_beat_goal_save_game_sequence
  Change AbortScript = back_to_beat_goal
  Change DoneScript = back_to_beat_goal
  Change SavingOrLoading = Saving
  check_card FileType = OptionsAndPros Save
  MaybeSaveCustomSkater
  launch_files_menu Save FileType = OptionsAndPros
endscript
script AppendDigitsToFilenameUntilNoClash
  PauseMusic 1
  PauseStream 1
   <newfilename> = <filename>
   <i> = 2
  begin
    DisableReset
    if not MemCardFileExists name = <newfilename> type = <file_type>
      PauseMusic -1
      PauseStream -1
      return filename = <newfilename>
      break
    endif
    FormatText TextName = newfilename "%s%d" s = <filename> d = <i>
     <i> = ( <i> + 1 )
  repeat
  PauseMusic -1
  PauseStream -1
endscript
script CreateNew
  GetTags
  memcard_menus_cleanup
  switch <file_type>
  case OptionsAndPros
     <filename> = 'Career'
  case NetworkSettings
    if IsXBOX
       <filename> = 'Sys Lnk Set'
    else
       <filename> = 'Net settings'
    endif
  case Cas
    GetCurrentProDisplayInfo
     <filename> = <string>
  case Park
    GetCustomParkName
     <filename> = <name>
  case Replay
     <filename> = 'Replay'
  default
     <filename> = 'Dooby Doo'
  endswitch
  AppendDigitsToFilenameUntilNoClash file_type = <file_type> filename = <filename>
  create_onscreen_keyboard {
    allow_cancel
    keyboard_cancel_script = launch_files_menu
    keyboard_cancel_params = { FileType = <file_type> Save }
    keyboard_done_script = CreateNew_Done
    keyboard_title = 'SAVE NAME'
    text = <filename>
    min_length = 1
    max_length = MAX_MEMCARD_FILENAME_LENGTH
    FileType = <file_type>
  }
  CheckForCardRemoval menu_id = keyboard_anchor
endscript
script CreateNew_Done
  GetTextElementString id = keyboard_current_string
  memcard_menus_cleanup
  switch <FileType>
  case Cas
    SetCustomSkaterFilename <string>
  case Park
    SetCustomParkName name = <string>
    SetParkName <string>
  endswitch
  check_card FileType = <FileType> Save
  DisableReset
  if MemCardFileExists name = <string> type = <FileType>
    OKToOverwrite NoGetTags filename = <string> file_type = <FileType> MenuFileType = <FileType> total_file_size = <total_file_size>
  else
    Save filename = <string> file_type = <FileType>
  endif
endscript
script Save
  memcard_menus_cleanup
  switch <file_type>
  case Park
    SetCustomParkName name = <filename>
    SetParkName <filename>
  case Cas
    SetCustomSkaterFilename <filename>
  endswitch
  DisableReset
  ResetTimer
  mcmess_SavingData FileType = <file_type>
  DisableReset
  if SaveToMemoryCard name = <filename> type = <file_type>
    mem_card_message_pause NoTimerReset NoCardRemovalCheck
    if ( save_successful = 0 )
      Change save_successful = 1
      Goto AbortScript
    else
      Goto mcmess_SaveSuccessful
    endif
  else
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    Goto mcmess_ErrorSaveFailed
  endif
endscript
script MaybeSaveCustomSkater_Cancel
  memcard_menus_cleanup
  Goto AbortScript
endscript
script MaybeSaveCustomSkater
  Change SavingOrLoading = Saving
  if not CurrentSkaterIsPro
    if CustomSkaterFilenameDefined
      GetCustomSkaterFilename
      ResetTimer
      mcmess_AutoSavingCas filename = <CASFileName>
      DisableReset
      DeleteMemCardFile UserFileName = <CASFileName> type = Cas
      SaveToMemoryCard name = <CASFileName> type = Cas
      mem_card_message_pause XSkips NoTimerReset
    else
      memcard_menus_cleanup
      ResetTimer
      mcmess_PleaseEnterCasFilename
      mem_card_message_pause XSkips NoTimerReset
      memcard_menus_cleanup
      Change DoneScript = PostAutoSaveCas
      launch_files_menu Save FileType = Cas
      Goto nullscript
    endif
  endif
endscript
script PostAutoSaveCas
  Change DoneScript = AbortScript
  Change SavingOrLoading = Saving
  launch_files_menu Save FileType = OptionsAndPros
endscript
DoAutoload = 1
goto_secret_shop = 0
script maybe_auto_load_from_memory_card
  if ( DoAutoload = 0 )
    if InGroupRoom
      SetNetworkMode INTERNET_MODE
      change_gamemode_net
      SetQuietMode off
      create_network_select_games_menu
    else
      if ( goto_secret_shop = 1 )
        create_secrets_menu
      else
        if ( goto_secret_shop = 2 )
          launch_select_skater_menu
        else
          launch_main_menu
        endif
      endif
    endif
  else
    Change DoAutoload = 0
    if IsInternetGameHost
      CheckForCardOnBootup
    else
      if IsJoiningInternetGame
        CheckForCardOnBootup
      else
        if IsXBOX
          Wait 3 gameframes
          if not PadsPluggedIn
            Goto back_to_main_menu
          endif
        endif
        CheckForCardOnBootup
      endif
    endif
  endif
endscript
script CheckForCardOnBootup
  ResetAbortAndDoneScripts
  DisableReset
  if CardIsInSlot
    if BadDevice
      Change RetryScript = CheckForCardOnBootup
      Change AbortScript = back_to_main_menu
      Goto mcmess_BadDevice
    else
      if SectorSizeOK
        Goto auto_load
      else
        Change RetryScript = CheckForCardOnBootup
        Change AbortScript = back_to_main_menu
        if CardIsDamaged
          Goto mcmess_DamagedCard
        else
          Goto mcmess_BadSectorSize
        endif
      endif
    endif
  else
    Change RetryScript = CheckForCardOnBootup
    Change AbortScript = back_to_main_menu
    Goto mcmess_ErrorNoCardOnBootup
  endif
endscript
script auto_load
  memcard_menus_cleanup
  if IsInternetGameHost
    Change AbortScript = start_internet_game
    Change DoneScript = start_internet_game
  else
    if IsJoiningInternetGame
      Change AbortScript = start_internet_game
      Change DoneScript = start_internet_game
    else
      Change AbortScript = back_to_main_menu
      Change DoneScript = back_to_main_menu
    endif
  endif
  Change RetryScript = auto_load
  Change SavingOrLoading = Loading
  StopMusic
  DisableReset
  if not CardIsInSlot
    Goto mcmess_ErrorNoCardOnBootup
  endif
  ResetTimer
  mcmess_CheckingCard
  DisableReset
  if BadDevice
    mem_card_message_pause NoTimerReset NoCardRemovalCheck
    Goto mcmess_BadDevice
  endif
  if CardIsDamaged
    mem_card_message_pause NoTimerReset NoCardRemovalCheck
    Goto mcmess_DamagedCard
  endif
  if not SectorSizeOK
    if CardIsDamaged
      mem_card_message_pause NoTimerReset NoCardRemovalCheck
      Goto mcmess_DamagedCard
    else
      mem_card_message_pause NoTimerReset NoCardRemovalCheck
      Goto mcmess_BadSectorSize
    endif
  endif
  DisableReset
  if not CardIsFormatted
    if CardIsDamaged
      Goto mcmess_DamagedCard
    else
      mem_card_message_pause NoTimerReset NoCardRemovalCheck
      Goto mcmess_ErrorNotFormatted params = { QuitText = 'Continue without formatting' BackScript = nullscript }
    endif
  endif
  DisableReset
  GetMemCardDirectoryListing
  GetMostRecentSave <DirectoryListing> NetworkSettings
  mem_card_message_pause NoTimerReset NoCardRemovalCheck
  if not CardIsInSlot
    Goto mcmess_ErrorNoCardOnBootup
  endif
   <did_load> = 0
  if GotParam MostRecentSave
    ResetTimer
    mcmess_LoadingData FileType = NetworkSettings
    DisableReset
    if LoadFromMemoryCard name = ( <MostRecentSave>.filename ) type = NetworkSettings
      GetPreferenceChecksum pref_type = network config_type
      switch <checksum>
      case config_sony
        LoadNetConfigs
        GetPreferenceString pref_type = network config_type
        ChooseNetConfig name = <ui_string>
      endswitch
    else
      mem_card_message_pause NoTimerReset NoCardRemovalCheck
      Goto mcmess_ErrorLoadFailed params = {
        <...>
        filename = ( <MostRecentSave>.filename )
        file_type = NetworkSettings
      }
    endif
     <did_load> = 1
  endif
  DisableReset
  GetMostRecentSave <DirectoryListing> OptionsAndPros
  if GotParam MostRecentSave
    if ( <did_load> = 0 )
      ResetTimer
      mcmess_LoadingData FileType = OptionsAndPros
    endif
    DisableReset
    if not LoadFromMemoryCard name = ( <MostRecentSave>.filename ) type = OptionsAndPros
      mem_card_message_pause NoTimerReset NoCardRemovalCheck
      Goto mcmess_ErrorLoadFailed params = {
        <...>
        filename = ( <MostRecentSave>.filename )
        file_type = OptionsAndPros
      }
    endif
     <did_load> = 1
  endif
  if ( <did_load> = 1 )
    mem_card_message_pause NoTimerReset
  endif
  MaybeLoadCustomSkater
  DisableReset
  GetMemCardSpaceAvailable
  GetMemCardSpaceRequired OptionsAndPros
   <TotalSpaceRequired> = <SpaceRequired>
  if IsPS2
    GetMemCardSpaceRequired NetworkSettings
     <TotalSpaceRequired> = ( <TotalSpaceRequired> + <SpaceRequired> )
  endif
  GetMemCardSpaceRequired Cas
   <TotalSpaceRequired> = ( <TotalSpaceRequired> + <SpaceRequired> )
   <TotalSpaceRequired> = ( <TotalSpaceRequired> + <SpaceRequired> )
  GetMemCardSpaceRequired Park
   <TotalSpaceRequired> = ( <TotalSpaceRequired> + <SpaceRequired> )
  if ( <FilesLeft> < 2 )
    mem_card_message_pause XSkips NoTimerReset
    Goto mcmess_ErrorNotEnoughSpaceToSaveAllTypes
  endif
  if ( <SpaceAvailable> < <TotalSpaceRequired> )
    mem_card_message_pause XSkips NoTimerReset
    Goto mcmess_ErrorNotEnoughSpaceToSaveAllTypes
  endif
  if IsInternetGameHost
    start_internet_game
  else
    if IsJoiningInternetGame
      start_internet_game
    else
      Goto back_to_main_menu
    endif
  endif
endscript
script retry_launch_load_network_settings
  memcard_menus_cleanup
  Goto launch_load_network_settings
endscript
script launch_load_network_settings
  destroy_net_settings_menu
  remove_main_menu_textures_from_vram
  Change RetryScript = retry_launch_load_network_settings
  Change AbortScript = back_to_net_settings_menu
  Change DoneScript = back_to_net_settings_menu
  Change SavingOrLoading = Loading
  check_card FileType = NetworkSettings
  launch_files_menu FileType = NetworkSettings
endscript
script retry_launch_options_menu_load_game_sequence
  memcard_menus_cleanup
  Goto launch_options_menu_load_game_sequence
endscript
script launch_options_menu_load_game_sequence
  destroy_main_menu
  PlaySkaterCamAnim name = SS_menucam_options play_hold
  Change RetryScript = retry_launch_options_menu_load_game_sequence
  if GotParam from_career
    Change AbortScript = back_to_career_options_menu
    Change DoneScript = back_to_career_options_menu
  else
    Change AbortScript = back_to_options_menu
    Change DoneScript = back_to_options_menu
  endif
  Change SavingOrLoading = Loading
  check_card FileType = OptionsAndPros
  launch_files_menu FileType = OptionsAndPros
endscript
script retry_launch_options_menu_load_replay_sequence
  memcard_menus_cleanup
  Goto launch_options_menu_load_replay_sequence
endscript
script launch_options_menu_load_replay_sequence
  destroy_main_menu
  PlaySkaterCamAnim name = SS_menucam_options play_hold
  Change RetryScript = retry_launch_options_menu_load_replay_sequence
  Change AbortScript = back_to_options_menu
  Change DoneScript = back_to_options_menu
  Change SavingOrLoading = Loading
  check_card FileType = Replay
  launch_files_menu FileType = Replay
endscript
script retry_launch_load_cas_sequence
  memcard_menus_cleanup
  Goto launch_load_cas_sequence
endscript
script launch_load_cas_sequence
  destroy_main_menu
  PlaySkaterCamAnim name = SS_menucam_credits play_hold
  Change AbortScript = back_to_main_menu
  Change DoneScript = jump_to_edit_skater
  Change RetryScript = retry_launch_load_cas_sequence
  Change SavingOrLoading = Loading
  check_card FileType = Cas
  launch_files_menu FileType = Cas
endscript
script retry_launch_load_cas_from_select_sequence
  memcard_menus_cleanup
  Goto launch_load_cas_from_select_sequence
endscript
script launch_load_cas_from_select_sequence
  destroy_main_menu
  PlaySkaterCamAnim name = SS_menucam_credits play_hold
  Change AbortScript = back_to_select_skater
  Change DoneScript = back_to_select_skater
  Change RetryScript = retry_launch_load_cas_from_select_sequence
  Change SavingOrLoading = Loading
  check_card FileType = Cas
  launch_files_menu FileType = Cas
endscript
script Load
  GetTags
  if ( ( GotParam BadVersion ) or ( GotParam Corrupt ) )
    if IsNGC
      memcard_menus_cleanup
      Goto mcmess_ErrorLoadFailed params = { <...> CorruptedData GoBackToFilesMenu }
    else
      return
    endif
  endif
  memcard_menus_cleanup
  ResetTimer
  mcmess_LoadingData FileType = <file_type>
  DisableReset
  if LoadFromMemoryCard name = <filename> type = <file_type>
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    switch <file_type>
    case OptionsAndPros
      MaybeLoadCustomSkater
      career_post_load
    case Replay
      memcard_menus_cleanup
      Wait 1 gameframe
      change_level level = <load_script>
      return
    case Park
      SetCustomParkName name = <filename>
      SetParkName <filename>
    case Cas
      if not IsDemo
        load_pro_skater name = custom
        cas_post_load
      endif
    endswitch
    if ( load_successful = 0 )
      Change load_successful = 1
      Goto AbortScript
    else
      Goto mcmess_LoadSuccessful
    endif
  else
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    Goto mcmess_ErrorLoadFailed params = { <...> GoBackToFilesMenu }
  endif
endscript
script MaybeLoadCustomSkater
  if not CurrentSkaterIsPro
    if CustomSkaterFilenameDefined
      GetCustomSkaterFilename
      DisableReset
      if MemCardFileExists name = <CASFileName> type = Cas
        ResetTimer
        mcmess_AutoLoadingCas filename = <CASFileName>
        DisableReset
        LoadFromMemoryCard name = <CASFileName> type = Cas
        mem_card_message_pause XSkips NoTimerReset
      else
        SetCustomSkaterFilename "Unimplemented"
      endif
    endif
  endif
endscript
script post_load_from_memory_card
  if not GotParam type
    PrintStruct <...>
    script_assert "Expected to find parameter 'type'!"
  endif
  switch <type>
  case OptionsAndPros
    career_post_load
  case Cas
    cas_post_load
  endswitch
endscript
