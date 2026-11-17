// basic idea is that in vanilla, game builds array and is sent back to script containing multiple params per entry, each entry gets fed to script which displays list (foreach)
// very similar approach here, but list is built in c and each parameter is manually fed from cfunc in loop which returns needed params
// also some modifications done such as no save cap, page system

script better4_launch_files_menu
  GetFileTypeName file_type = <FileType>  
  // BuildSaveDirectory also returns save count as <proper_file_count>
  if GotParam NextPage 
    BuildSaveDirectory FileType = <filetype_name> PageCycle = 1 
    RemoveParameter NextPage
  else 
    if GotParam LastPage
      BuildSaveDirectory FileType = <filetype_name> PageCycle = -1 
      RemoveParameter LastPage
    else // first page/no page change
      BuildSaveDirectory FileType = <filetype_name> PageCycle = 0
    endif
  endif
  DebugFn 766
  memcard_menus_cleanup
  better4_create_files_menu <...>
endscript

script better4_create_files_menu pos_tweak = (-20, -45)
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
    //GetMemCardDirectoryListing
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
        <add_createnew_option> = 1
      endif
    endif
    if GotParam add_createnew_option
        better4_files_menu_add_item { file_type = <FileType>
        filename = '              Create new'
        file_size = ''
        pad_choose_script = CreateNew
        font = small
        icon_alpha = 0.0
      }
    endif
  else
    //GetMemCardDirectoryListing FileType = <FileType>
  endif
  if not( <proper_file_count> = 0)
    if GotParam Save
      if GotParam add_createnew_option
        begin
          if (GetSaveDirectoryListing)
            //printf "from script before listed file name : %s" s =  <save_filename>
            better4_files_menu_add_item { pad_choose_script = OKToOverwrite  filename = <save_filename> actual_file_name = <save_filename> file_type = <FileType> MenuFileType = <FileType> Save }
          else
            //better4_files_menu_add_item { pad_choose_script = OKToOverwrite  filename = <save_filename> actual_file_name = <save_filename> file_type = <FileType> MenuFileType = <FileType> Save }
            break
          endif
        repeat
      else
        begin
          if (GetSaveDirectoryListing)
            //printf "from script before listed file name : %s" s =  <save_filename>
            better4_files_menu_add_item { pad_choose_script = OKToOverwrite  filename = <save_filename> actual_file_name = <save_filename> file_type = <FileType> MenuFileType = <FileType> Save }
          else
            //better4_files_menu_add_item { pad_choose_script = OKToOverwrite  filename = <save_filename> actual_file_name = <save_filename> file_type = <FileType> MenuFileType = <FileType> Save }
            break
          endif
        repeat
      endif
    else
      begin
        if (GetSaveDirectoryListing)
          //printf "from script before listed file name : %s" s =  <save_filename>
          better4_files_menu_add_item { pad_choose_script = Load filename = <save_filename> actual_file_name = <save_filename> file_type = <FileType> }
        else
          //better4_files_menu_add_item { pad_choose_script = Load filename = <save_filename> actual_file_name = <save_filename> file_type = <FileType> }
          break
        endif
      repeat
    endif
  else
    if not GotParam Save
      Goto mcmess_NoFiles params = { MenuFileType = <FileType> }
    endif
  endif
  RemoveParameter DirectoryListing
  RemoveParameter add_createnew_option
  better4_files_menu_add_bottom_bar <...>
  if ScreenElementExists id = controller_unplugged_dialog_anchor
    DoScreenElementMorph id = current_menu_anchor scale = 0
  else
    RunScriptOnScreenElement id = current_menu_anchor animate_in
  endif
  Wait 2 gameframe
  SetScreenElementProps id = files_scrolling_menu reset_window_top
  CheckForCardRemoval menu_id = files_menu
endscript

script better4_files_menu_add_item pad_choose_script = nullscript font = dialog icon_alpha = 1.0
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
        { pad_circle better4_files_menu_delete }
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
        { pad_square better4_files_menu_delete }
      ]
    }
  endif
  <container_id> = <id>
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
  //printf "from script file name : %s" s =  <filename>
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


script better4_files_menu_add_bottom_bar
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
  //GetMaxTHPS4FilesAllowed
  GetFileTypeName file_type = <FileType>
  //GetProperSaveFileCount FileType = <filetype_name>
  FormatText {
    TextName = LeftText
    '%s Files: %t/200'
    t = <proper_file_count>
    s = <filetype_name>
  }
   <text_bg_rgba> = [ 0 0 0 50 ]
   <text_offset> = (5, 2)
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
  GetStackedScreenElementPos X id = <id> offset = (3, 0)
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
endscript

script better4_files_menu_delete
  GetTags
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
      pad_back_script = better4_launch_files_menu
      pad_back_params = { FileType = <MenuFileType> Save }
      buttons = [
        { font = small text = 'No' pad_choose_script = better4_launch_files_menu pad_choose_params = { FileType = <MenuFileType> Save } }
        { font = small text = 'Yes' pad_choose_script = better4_delete_file pad_choose_params = <...> }
      ]
    }
    CheckForCardRemoval menu_id = dialog_box_anchor
  endif
endscript

script better4_delete_file
  memcard_menus_cleanup
  Change StopCheckingForCardRemoval = 1
  ResetTimer
  //mcmess_DeletingFile FileType = <file_type>
  DisableReset
  if DeleteSaveFile save_filename = <filename>
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    create_snazzy_dialog_box {
      title = 'File Deleted'
      text = 'Delete successful'
      pad_back_script = better4_launch_files_menu
      pad_back_params = { FileType = <MenuFileType> Save }
      buttons = [
        { font = small text = 'OK' pad_choose_script = better4_launch_files_menu pad_choose_params = { FileType = <MenuFileType> Save } }
      ]
    }
    CheckForCardRemoval menu_id = dialog_box_anchor
  else
    mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
    Goto mcmess_ErrorDeleteFailed
  endif
endscript
