better4_menu_item_scale = 0.7
script better4_main_menu_watermark
  FormatText TextName = better4_watermark "Better4 %s" s = better4_version
  CreateScreenElement {
    parent = current_menu_anchor
    Type = TextElement
    text = <better4_watermark>
    font = newtrickfont
    pos = (320, 380)
    rgba = better4_orange
    scale = 0.5
    just = [ center center ]
    z_priority = 9999
    not_focusable
  }
endscript

script better4_create_menu {
    close_script = nullscript
    menu_title = ""
    icon = PA_options
}
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  pulse_blur
  make_new_menu {
    menu_id = better4_menu
    vmenu_id = better4_vmenu
    menu_title = <menu_title>
    helper_text = generic_helper_text
    pos = (198, 59)
  }
  kill_start_key_binding
  SetScreenElementProps { id = better4_vmenu event_handlers = [
      { pad_back skateshop_transition params = { new_menu_script = <close_script> new_menu_params = <close_params> } }
    ]
  }
  set_sub_bg pos = (316, 65) scale = (1.32, 1.1)
  create_icon pos = (151, 65) id = better4_icon texture = <icon>
  draw_menu_box {
    delta_pos = (92, -20)
    middle_repeat = 16
    box_right_scale = (0.8, 1.175)
    scale = (1.2, 1.0)
    box_bottom_scale = (1.16, 1.0)
    box_right_offset = (-21, 0)
  }
  make_text_sub_menu_item text = "" not_focusable dims = (0, 10)
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript

script better4_create_menu_control {
    font = small
    child_pos = { (340, 0) relative }
    rgba = [ 88 105 112 128 ]
    child_rgba = [ 88 105 112 128 ]
    just = [ left top ]
    child_just = [ right top ]
    scale = better4_menu_item_scale
    child_scale = 1
    focus_script = do_scale_up
    unfocus_script = do_scale_down
    pad_choose_script = item_chosen
}
  <index> = <index_name>
  CreateScreenElement {
    Type = TextElement
    parent = current_menu
    id = <id>
    font = <font>
    pos = <pos>
    rgba = <rgba>
    just = <just>
    text = <text>
    scale = <scale>
    event_handlers = [
      { focus <focus_script> params = <focus_params> }
      { unfocus <unfocus_script> params = <unfocus_params> }
      { pad_left better4_menu_cycle_control_left params = <...> }
      { pad_right better4_menu_cycle_control_right params = <...> }
    ]
  }
  CastToInteger index
  <value_text> = ( ( <options> [ <index> ] ).text )
  CreateScreenElement {
    Type = TextElement
    parent = <id>
    font = <font>
    pos = <child_pos>
    rgba = <child_rgba>
    just = <child_just>
    text = <value_text>
    scale = <child_scale>
  }
endscript

script better4_options_menu
  better4_create_menu menu_title = "BETTER4 OPTIONS" icon = PA_nuke <...>
  make_text_sub_menu_item text = "In Air" scale = better4_menu_item_scale id = inair_option pad_choose_script = better4_inair_menu pad_choose_params = <...>
  make_text_sub_menu_item text = "On Ground" scale = better4_menu_item_scale id = onground_option pad_choose_script = better4_onground_menu pad_choose_params = <...>
  make_text_sub_menu_item text = "On Rail" scale = better4_menu_item_scale id = onrail_option pad_choose_script = better4_onrail_menu pad_choose_params = <...>
  make_text_sub_menu_item text = "Wallrides" scale = better4_menu_item_scale id = wallride_option pad_choose_script = better4_wallride_menu pad_choose_params = <...>
  make_text_sub_menu_item text = "Misc" scale = better4_menu_item_scale id = misc_option pad_choose_script = better4_misc_menu pad_choose_params = <...>
  make_text_sub_menu_item text = "TH3 Anim Test" scale = better4_menu_item_scale id = th3_anim_test pad_choose_script = better4_th3_anim_test pad_choose_params = <...>
  make_text_sub_menu_item text = "" not_focusable dims = (0, 10)
  make_text_sub_menu_item text = "Close" scale = better4_menu_item_scale id = close_option pad_choose_script = skateshop_transition pad_choose_params = { new_menu_script = <close_script> }
endscript

script better4_onground_menu
  better4_create_menu menu_title = "ON GROUND" icon = PA_save close_script = better4_options_menu close_params = <...>
  better4_create_menu_control better4_control_revert
  better4_create_menu_control better4_control_powerslide
  better4_create_menu_control better4_control_stancechange
  better4_create_menu_control better4_control_jumptrick
  better4_create_menu_control better4_control_manualspin
  better4_create_menu_control better4_control_manualfloat
  better4_create_menu_control better4_control_doublerevert
  better4_create_menu_control better4_control_revertrecovery
  make_text_sub_menu_item text = "" not_focusable dims = (0, 10)
  make_text_sub_menu_item text = "Back" scale = better4_menu_item_scale pad_choose_script = better4_options_menu pad_choose_params = <...>
endscript

script better4_inair_menu
  better4_create_menu menu_title = "IN AIR" icon = PA_load close_script = better4_options_menu close_params = <...>
  better4_create_menu_control better4_control_spinkeys
  better4_create_menu_control better4_control_spinetransfer
  make_text_sub_menu_item text = "" not_focusable dims = (0, 10)
  make_text_sub_menu_item text = "Back" scale = better4_menu_item_scale pad_choose_script = better4_options_menu pad_choose_params = <...>
endscript

script better4_onrail_menu
  better4_create_menu menu_title = "ON RAIL" icon = PA_lip close_script = better4_options_menu close_params = <...>
  better4_create_menu_control better4_control_dropdown
  better4_create_menu_control better4_control_liptricks
  better4_create_menu_control better4_control_railspin
  make_text_sub_menu_item text = "" not_focusable dims = (0, 10)
  make_text_sub_menu_item text = "Back" scale = better4_menu_item_scale pad_choose_script = better4_options_menu pad_choose_params = <...>
endscript

script better4_wallride_menu
  better4_create_menu menu_title = "WALLRIDES" icon = PA_connection close_script = better4_options_menu close_params = <...>
  better4_create_menu_control better4_control_wallieplant
  better4_create_menu_control better4_control_wallspin
  better4_create_menu_control better4_control_wallridebail
  make_text_sub_menu_item text = "" not_focusable dims = (0, 10)
  make_text_sub_menu_item text = "Back" scale = better4_menu_item_scale pad_choose_script = better4_options_menu pad_choose_params = <...>
endscript

script better4_misc_menu
  better4_create_menu menu_title = "MISC" icon = PA_trick close_script = better4_options_menu close_params = <...>
  better4_create_menu_control better4_control_boardscuff
  better4_create_menu_control better4_control_pauseonunfocus
  better4_create_menu_control better4_control_buttonsfont
  // better4_create_menu_control better4_trick_string
  // better4_create_menu_control better4_control_special_meter
  better4_create_menu_control better4_control_extratrick_sound
  make_text_sub_menu_item text = "" not_focusable dims = (0, 10)
  make_text_sub_menu_item text = "Back" scale = better4_menu_item_scale pad_choose_script = better4_options_menu pad_choose_params = <...>
endscript

script better4_th3_anim_test
  better4_create_menu menu_title = "TH3 ANIM TEST" icon = PA_trick close_script = better4_options_menu close_params = <...>
  make_text_sub_menu_item text = "Handspring Layout" scale = better4_menu_item_scale pad_choose_script = better4_cycle_anim pad_choose_params = { anim_script = anim_Layout }
  make_text_sub_menu_item text = "Force Grab" scale = better4_menu_item_scale pad_choose_script = better4_cycle_anim pad_choose_params = { anim_script = anim_MaulForceGrab }
  make_text_sub_menu_item text = "Rodeo Clown" scale = better4_menu_item_scale pad_choose_script = better4_cycle_anim pad_choose_params = { anim_script = anim_RodeoClown }
  make_text_sub_menu_item text = "Super Hand Clap" scale = better4_menu_item_scale pad_choose_script = better4_cycle_anim pad_choose_params = { anim_script = anim_SuperHandClap }
  make_text_sub_menu_item text = "Panhandling" scale = better4_menu_item_scale pad_choose_script = better4_cycle_anim pad_choose_params = { anim_script = anim_WorkForFood }
  make_text_sub_menu_item text = "AC Air" scale = better4_menu_item_scale pad_choose_script = better4_cycle_anim pad_choose_params = { anim_script = anim_ACAir }
  make_text_sub_menu_item text = "Pizza Guy" scale = better4_menu_item_scale pad_choose_script = better4_cycle_anim pad_choose_params = { anim_script = anim_PizzaGuy }
  make_text_sub_menu_item text = "The Berzerker" scale = better4_menu_item_scale pad_choose_script = better4_cycle_anim pad_choose_params = { anim_script = anim_Berzerker }
  make_text_sub_menu_item text = "Claw Punch" scale = better4_menu_item_scale pad_choose_script = better4_cycle_anim pad_choose_params = { anim_script = anim_ClawPunch }
  make_text_sub_menu_item text = "RoastBeef" scale = better4_menu_item_scale pad_choose_script = better4_cycle_anim pad_choose_params = { anim_script = anim_Roastbeef }
  make_text_sub_menu_item text = "Varial" scale = better4_menu_item_scale pad_choose_script = better4_cycle_anim pad_choose_params = { anim_script = anim_Varial }
  make_text_sub_menu_item text = "" not_focusable dims = (0, 10)
  make_text_sub_menu_item text = "Back" scale = better4_menu_item_scale pad_choose_script = better4_options_menu pad_choose_params = <...>
endscript

script better4_cycle_anim
  exit_pause_menu
  MakeSkaterGoto <anim_script>
endscript

script anim_Layout
  PlayAnim Anim = Maul cycle
endscript

script anim_MaulForceGrab
  begin
    PlayAnim Anim = MaulForceGrab_Init BlendPeriod = 0.3
    WaitAnimFinished
    PlayAnim Anim = MaulForceGrab_Idle cycle
    Wait 2 seconds
    PlayAnim Anim = MaulForceGrab_Out BlendPeriod = 0.2
    WaitAnimFinished
  repeat
endscript

script anim_RodeoClown
  begin
    PlayAnim Anim = RodeoClown_Init BlendPeriod = 0.3
    WaitAnimFinished
    PlayAnim Anim = RodeoClown_Idle cycle
    Wait 2 seconds
    PlayAnim Anim = RodeoClown_Out BlendPeriod = 0.2
    WaitAnimFinished
  repeat
endscript

script anim_SuperHandClap
  PlayAnim Anim = Eyeball_Init BlendPeriod = 0.3
  WaitAnimFinished
  PlayAnim Anim = Eyeball_Idle cycle
endscript

script anim_WorkForFood
  PlayAnim Anim = WorkForFood_Init BlendPeriod = 0.3
  WaitAnimFinished
  PlayAnim Anim = WorkForFood_Idle cycle
endscript

script anim_ACAir
  begin
    PlayAnim Anim = ACAir_Init BlendPeriod = 0.3
    WaitAnimFinished
    PlayAnim Anim = ACAir_Idle cycle
    Wait 2 seconds
    PlayAnim Anim = ACAir_Out BlendPeriod = 0.2
    WaitAnimFinished
  repeat
endscript

script anim_PizzaGuy
  begin
    PlayAnim Anim = PizzaGuy_Init BlendPeriod = 0.3
    WaitAnimFinished
    PlayAnim Anim = PizzaGuy_Idle cycle
    Wait 2 seconds
    PlayAnim Anim = PizzaGuy_Out BlendPeriod = 0.2
    WaitAnimFinished
  repeat
endscript

script anim_Berzerker
  PlayAnim Anim = Berzerker cycle
endscript

script anim_ClawPunch
  PlayAnim Anim = ClawPunch cycle
endscript

script anim_Roastbeef
  PlayAnim Anim = Roastbeef BlendPeriod = 0.3
  WaitAnimFinished
  PlayAnim Anim = Roastbeef_Idle cycle
endscript

script anim_Varial
  PlayAnim Anim = BigVarial cycle
endscript
