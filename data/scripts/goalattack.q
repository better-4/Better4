goal_goalattack_genericParams = {
  goal_text = "You must complete all of the goals to win!"
  unlimited_time
  no_restart
  net
  init = goal_goalattack_init
  activate = goal_goalattack_activate
  deactivate = goal_goalattack_deactivate
  expire = goal_goalattack_expire
}
script goal_goalattack_init
endscript
script goal_goalattack_activate
  ResetScore
  GoalManager_ClearLastGoal
  GoalManager_SetCanStartGoal 1
endscript
script goal_goalattack_deactivate
  if ScreenElementExists id = goal_retry_anchor
    DestroyScreenElement id = goal_retry_anchor
  endif
endscript
script goalattack_done
  dialog_box_exit
  do_backend_retry
endscript
script goal_goalattack_expire
  if ObjectExists id = goal_message
    DestroyScreenElement id = goal_message
  endif
  Printf "goal_goalattack_expire"
  GoalManager_LoseGoal name = <goal_id>
  if OnServer
    SpawnScript wait_then_create_rankings params = { score_title_text = "GOALS" }
  else
    create_rankings score_title_text = "GOALS"
  endif
endscript
script AddGoal_GoalAttack
  GoalManager_AddGoal name = goalattack {
    params = { goal_goalattack_genericParams
      <...>
    }
  }
endscript
script StartGoal_GoalAttack
  GoalManager_EditGoal name = goalattack params = <...>
  GoalManager_ActivateGoal name = goalattack
endscript
script back_to_game_options
  dialog_box_exit
  create_network_game_options_menu
endscript
script create_choose_goals_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  GoalManager_HidePoints
  hide_net_player_names
  if not GoalManager_HasGoalsToSelect
    create_dialog_box { title = "No Goals To Select"
      text = "You haven't unlocked any goals. Play Career Mode to unlock goals for Goal Attack."
      buttons = [ { text = "ok" pad_choose_script = back_to_game_options }
      ]
    }
  else
    make_new_menu menu_id = choose_goals_menu vmenu_id = choose_goals_vmenu padding_scale = 0.7 menu_title = "CHOOSE GOALS" pos = (150, 58)
    SetScreenElementProps { id = choose_goals_menu
      event_handlers = [
        { pad_back create_network_game_options_menu }
      ]
    }
    make_text_sub_menu_item text = "" not_focusable
    GoalManager_AddGoalChoices
    set_sub_bg_goal goal_mid_scale = (15, 1.2) pos = (250, 60) goal_end_scale = (1, 1.2)
    create_icon texture = PA_view pos = (100, 55)
    create_helper_text generic_helper_text
    RunScriptOnScreenElement id = current_menu_anchor animate_in
  endif
endscript
script hide_net_player_names
  if GotParam on
    scale = 0.9
  else
    scale = 0
  endif
  index = 0
  begin
    if ScreenElementExists id = { net_score_menu child = <index> }
      DoScreenElementMorph id = { net_score_menu child = <index> } scale = ( <scale> * better4_control_playerlist_value ) time = 0
    endif
  repeat 8
endscript
script choose_goals_menu_set_events
  if GoalManager_GoalIsSelected name = <goal_id>
    SetProps rgba = [ 88 105 112 128 ] font = dialog
    DoMorph time = 0 scale = 0.8
    SetScreenElementProps {
      id = <goal_id>
      event_handlers = [
        { focus choose_goals_menu_focus }
        { unfocus choose_goals_menu_unfocus params = { name = <goal_id> } }
        { pad_choose generic_menu_pad_choose_sound }
        { pad_choose toggle_selection params = { name = <goal_id> } }
      ]
      replace_handlers
    }
  else
    SetProps rgba = [ 42 42 38 128 ] font = dialog
    DoMorph time = 0 scale = 0.8
    SetScreenElementProps {
      id = <goal_id>
      event_handlers = [
        { focus choose_goals_menu_focus }
        { unfocus choose_goals_menu_unfocus params = { name = <goal_id> } }
        { pad_choose generic_menu_pad_choose_sound }
        { pad_choose toggle_selection params = { name = <goal_id> } }
      ]
      replace_handlers
    }
  endif
endscript
script view_selected_goals_menu_set_events
  if GoalManager_HasWonGoal name = <goal_id>
    SetProps rgba = [ 25 83 67 128 ] font = dialog
    DoMorph time = 0 scale = 0.8
    SetScreenElementProps {
      id = <goal_id>
      not_focusable
    }
    GetTags
    GetScreenElementDims id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = <id>
      texture = goal_line
      pos = (-8, 13)
      just = [ left center ]
      rgba = [ 128 128 128 108 ]
      scale = ( ( (1, 0) * ( <width> * 1.25 ) / 32 ) + (0.3, 0.4) )
    }
  else
    SetProps rgba = [ 88 105 112 128 ] font = dialog
    DoMorph time = 0 scale = 0.8
    SetScreenElementProps {
      id = <goal_id>
      not_focusable
    }
  endif
endscript
script choose_goals_menu_focus
  DoMorph time = 0 scale = 0.85
  SetProps rgba = [ 127 102 0 128 ]
  GetTags
  RunScriptOnScreenElement id = <id> do_random_effect params = { id = <id> }
endscript
script choose_goals_menu_unfocus
  KillSpawnedScript name = do_random_effect
  DoMorph time = 0 scale = 0.75
  SetProps rgba = [ 88 105 112 128 ]
  choose_goals_menu_set_events goal_id = <name>
endscript
script toggle_selection
  if OnServer
    GoalManager_ToggleGoalSelection <...>
  else
    GoalManager_ToggleGoalSelection <...>
    FCFSRequestToggleGoalSelection <...>
  endif
endscript
script wait_and_create_view_selected_goals_menu
  Wait 120 frames
  create_view_selected_goals_menu <...>
endscript
script create_view_selected_goals_menu
  destroy_onscreen_keyboard
  dialog_box_exit
  add_pause_menu_textures_to_vram
  kill_start_key_binding
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  if GotParam goal_summary
    make_new_menu menu_id = view_goals_menu vmenu_id = view_goals_vmenu padding_scale = 0.7 menu_title = "GOAL LIST" pos = (150, 88)
  else
    make_new_menu menu_id = view_goals_menu vmenu_id = view_goals_vmenu padding_scale = 0.7 menu_title = "VIEW GOALS" pos = (150, 88)
  endif
  if GotParam goal_summary
    SetScreenElementProps { id = view_goals_menu
      event_handlers = [
        { pad_back close_goals_menu }
        { pad_choose close_goals_menu }
        { pad_start close_goals_menu }
      ]
    }
  else
    SetScreenElementProps { id = view_goals_menu
      event_handlers = [
        { pad_back create_pause_menu }
        { pad_choose create_pause_menu }
        { pad_start create_pause_menu }
      ]
    }
  endif
  GoalManager_AddGoalChoices selected_only
  set_sub_bg_goal goal_mid_scale = (15, 1) pos = (250, 90) goal_end_scale = (1, 1)
  create_icon texture = PA_view pos = (100, 85)
  create_helper_text helper_text_elements = [ { text = "\m1 = Back" } ]
  RunScriptOnScreenElement id = current_menu_anchor animate_in params = { final_pos = (220, 145) }
endscript
script close_goals_menu
  if ObjectExists id = view_goals_menu
    exit_pause_menu
  endif
endscript
script goal_attack_completed_goal
  FormatText TextName = msg_text "Goal Completed! %i to go!" i = <NumGoalsLeft>
  create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript
script goal_attack_completed_goal_other
  FormatText TextName = msg_text "%n Completed %t! %i to go!" n = <PlayerName> t = <GoalText> i = <NumGoalsLeft>
  create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript
script goal_attack_started_goal_other
  FormatText TextName = msg_text "%n Started %t!" n = <PlayerName> t = <GoalText>
  create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript
