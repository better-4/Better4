better4_version = "v0.3"
better4_options_text = 'Better4 Options'
better4_orange = [ 164 95 26 100 ]

script quit_observing
  if not GoalManager_HasActiveGoals
    DebugRenderIgnore
    if IsHost
      exit_pause_menu
      Wait 60 gameframe
      debugrendermode
      LoadPendingPlayers
      Wait 120 gameframe
      debugrendermode
    endif
  endif
endscript

script host_process_remote_exit_observer
  Wait 60 gameframe
  debugrendermode
  LoadPendingPlayers
  Wait 120 gameframe
  debugrendermode
endscript

script destroy_mod_menu
  ClearEventBuffer
  SetQueueTricks Ground
  restore_start_key_binding
  DestroyScreenElement id = current_menu_anchor
  UnPauseGame
endscript
