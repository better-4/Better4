better4_version = "v0.5"
better4_options_text = 'Better4 Options'
better4_orange = [ 164 95 26 100 ]
script EnterBetterObserve
  BetterObserve
  exit_pause_menu
  if IsBetterObserving
    DisableLocalPlayerInput
  else
    Create_Panel_Message id = goal_message text = "No players available to observe!" style = panel_message_generic_loss
  endif
endscript
script QuitBetterObservivng
  ObserveSelf
  exit_pause_menu
  EnableLocalPlayerInput
endscript
script destroy_mod_menu
  ClearEventBuffer
  SetQueueTricks Ground
  restore_start_key_binding
  DestroyScreenElement id = current_menu_anchor
  UnPauseGame
endscript
