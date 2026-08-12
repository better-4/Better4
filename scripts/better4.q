better4_version = "v0.5"
better4_options_text = 'Better4 Options'
better4_orange = [ 164 95 26 100 ]

script quit_observing
  if not GoalManager_HasActiveGoals
    RequestExitObserverMode
    if IsHost
      exit_pause_menu
      Wait 60 gameframe
      ToggleOurPendingPlayersFlag
      LoadPendingPlayers
      Wait 120 gameframe
      ToggleOurPendingPlayersFlag
    endif
  endif
endscript

script host_process_remote_exit_observer
  Wait 60 gameframe
  ToggleOurPendingPlayersFlag
  LoadPendingPlayers
  Wait 120 gameframe
  ToggleOurPendingPlayersFlag
endscript

script destroy_mod_menu
  ClearEventBuffer
  SetQueueTricks Ground
  restore_start_key_binding
  DestroyScreenElement id = current_menu_anchor
  UnPauseGame
endscript
