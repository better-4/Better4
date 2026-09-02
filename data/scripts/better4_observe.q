script EnterBetterObserve
  exit_pause_menu
  skater:SkaterInit ReturnControl
  BetterObserve
  kill_start_key_binding
  create_observer_ui
  Wait 15 gameframes
  restore_start_key_binding
  if IsBetterObserving
    skater:NetDisablePlayerInput
    skater:PausePhysics
  endif
endscript

script QuitBetterObservivng
   if GoalManager_HasActiveGoals
    QueueObserveSelf
    exit_pause_menu
  else
    exit_pause_menu
    ObserveSelf
    skater:UnPausePhysics
    skater:NetEnablePlayerInput
    destroy_observer_ui
    EnablePlayerNames
    EnableHUD
  endif
endscript

script ObserveActionEnter
  if not IsBetterObserving
    ObserveAfter0
    create_observer_ui
  endif
endscript

script ObserveActionNext
  ObserveNext
  update_obs_player_name
endscript

script ObserveActionPrev
  ObservePrev
  update_obs_player_name
endscript

script ObserveActionToggleHUD
  if ( HIDEHUD = 0)
    Change HIDEHUD = 1
    hide_root_window
  else
    Change HIDEHUD = 0
    unhide_root_window
  endif
endscript

script EnableHUD
  if ( HIDEHUD = 1)
    Change HIDEHUD = 0
    unhide_root_window
  endif
endscript

script ObserveActionToggleNames
  GetTags
  GetPreferenceString pref_type = network show_names
  if ( <ui_string> = "Off" )
    text = "On"
    set_preferences_from_ui prefs = network field = "show_names" checksum = boolean_true string = "On"
  else
    text = "Off"
    set_preferences_from_ui prefs = network field = "show_names" checksum = boolean_false string = "Off"
    destroy_all_player_names
  endif
  
endscript

script EnablePlayerNames
  GetTags
  GetPreferenceString pref_type = network show_names
  if ( <ui_string> = "Off" )
    text = "On"
    set_preferences_from_ui prefs = network field = "show_names" checksum = boolean_true string = "On"
  endif
endscript

script display_obs_player_name
  if not ObjectExists id = observe_player_name
    GetObsPlayerName
    CreateScreenElement {
      type = TextElement
      parent = root_window
      id = observe_player_name
      font = dialog
      text = <player_name>
      pos = (320, 380)
      just = [ center bottom ]
      rgba = [ 127 127 127 128 ]
      scale = 1.1
      not_focusable
    }
  else
    update_obs_player_name
  endif
endscript

script update_obs_player_name
  GetObsPlayerName
  SetScreenElementProps {
    id = observe_player_name
    text = <player_name>
  }
endscript

script destroy_obs_player_name
  if ObjectExists id = observe_player_name
    DestroyScreenElement id = observe_player_name
  endif
endscript

script create_observer_ui
  SetScreenElementProps {
    id = root_window
    event_handlers = [
      { pad_left    ObserveActionPrev        params = { } }
      { pad_right   ObserveActionNext        params = { } }
      { pad_square  ObserveActionToggleHUD  params = { } }
      { pad_space  ObserveActionToggleNames  params = { } }
      { pad_choose  ObserveActionNext        params = { } }
    ]
  }
   create_helper_text_observe { 
     helper_text_elements = [ 
       { text = "\b6/\b5 = Cycle Camera" }
       { text = "\b1 = Toggle HUD" }
       { text = "\b0 = Toggle Player Names" }
     ]
     parent = root_window
  }
  display_obs_player_name
endscript

script set_observe_prompt_event
  SetScreenElementProps {
    id = root_window
    event_handlers = [
      { pad_choose ObserveActionEnter params = { } }
    ]
  }
endscript

script destroy_observer_ui
  create_helper_text_no_bg { 
    helper_text_elements = [ 
    ]
    parent = root_window
 }
  SetScreenElementProps {
    id = root_window
    event_handlers = [
      { pad_left    null_script }
      { pad_right   null_script }
      { pad_square  null_script }
      { pad_space  null_script }
      { pad_choose  null_script }
    ]
    replace_handlers
  }
  destroy_obs_player_name
endscript

script restore_rank_screen_choose
  SetScreenElementProps {
    id = root_window
    event_handlers = [
      { pad_left    null_script }
      { pad_right   null_script }
      { pad_square  null_script }
      { pad_space  null_script }
      { pad_choose  close_rankings }
    ]
    replace_handlers
  }
endscript