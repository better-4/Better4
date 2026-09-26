script better4_create_game_modifiers_menu
  <close_script> = better4_exit_game_modifiers_menu
  better4_create_menu menu_title = "GAME MODIFIERS" icon = PA_nuke slow_close <...>
  better4_menu_spacer
  better4_create_menu_modifier better4_modifier_disablerevert
  better4_create_menu_modifier better4_modifier_disablemanual
  better4_create_menu_modifier better4_modifier_disableboostplant
  better4_create_menu_modifier better4_modifier_disablewallpush
  better4_create_menu_modifier better4_modifier_disablespacewalk
  better4_create_menu_modifier better4_modifier_alwaysspecial
  better4_create_menu_modifier better4_modifier_perfectrail
  better4_create_menu_modifier better4_modifier_perfectmanual
  better4_menu_spacer
  better4_create_menu_item text = "Back" id = back_option pad_choose_script = skateshop_transition pad_choose_params = { new_menu_script = <close_script> }
endscript

script better4_exit_game_modifiers_menu
  if InNetGame
    if ObjectExists id = current_menu_anchor
      DestroyScreenElement id = current_menu_anchor
    endif
    create_network_host_options_menu
  else
    create_options_menu
  endif
endscript
