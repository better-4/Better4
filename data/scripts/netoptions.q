dialup_authentication_types = [
  { name = "Yes" checksum = yes }
  { name = "No" checksum = no }
]
device_types = [
  { name = "None" checksum = device_none }
  { name = "Ethernet (Network Adaptor for PS2)" checksum = device_broadband_pc }
  { name = "Ethernet (Network Adaptor for PS2) (PPPoE)" checksum = device_broadband_pc_pppoe }
  { name = "USB Ethernet Adaptor" checksum = device_broadband_usb }
  { name = "USB Ethernet Adaptor (PPPoE)" checksum = device_broadband_usb_pppoe }
  { name = "Modem (Network Adaptor for PS2)" checksum = device_sony_modem }
  { name = "USB Modem" checksum = device_usb_modem }
]
device_types_pal = [
  { name = "None" checksum = device_none }
  { name = "network adaptor (For PlayStation2)" checksum = device_broadband_pc }
  { name = "network adaptor (For PlayStation2) (PPPoE)" checksum = device_broadband_pc_pppoe }
  { name = "USB Ethernet Adaptor" checksum = device_broadband_usb }
  { name = "USB Ethernet Adaptor (PPPoE)" checksum = device_broadband_usb_pppoe }
  { name = "USB Modem" checksum = device_usb_modem }
]
broadband_types = [
  { name = "Auto-Detect (DHCP)" checksum = ip_dhcp }
  { name = "Static IP Address" checksum = ip_static }
]
boolean_types = [
  { name = "Yes" checksum = boolean_true }
  { name = "No" checksum = boolean_false }
]
on_off_types = [
  { name = "On" checksum = boolean_true }
  { name = "Off" checksum = boolean_false }
]
team_types = [
  { name = "None" checksum = teams_none }
  { name = "2" checksum = teams_two }
  { name = "3" checksum = teams_three }
  { name = "4" checksum = teams_four }
]
config_types = [
  { name = "Sony Network Configuration" checksum = config_sony }
  { name = "Manual Settings" checksum = config_manual }
]
score_players = [
  { name = "Show Players" checksum = score_players }
  { name = "Show Teams" checksum = score_teams }
]
default_master_servers = [
  { name = "205.147.4.17" }
  { name = "63.241.179.8" }
  { name = "205.147.28.3" }
]
default_taunt_preferences =
{
  no_way_string = { ui_string = "No Way" }
  your_daddy_string = { ui_string = "Who's your daddy?" }
  props_string = { ui_string = "Props" }
  get_some_string = { ui_string = "Come Get Some" }
}
default_network_preferences = {
  game_type = { ui_string = "Trick Attack" checksum = nettrickattack }
  num_players = { ui_string = "8 Players" checksum = num_8 value = 8 }
  num_observers = { ui_string = "8 Observers" checksum = num_8 broadband_only value = 8 }
  player_collision = { ui_string = "Off" checksum = boolean_false }
  team_mode = { ui_string = "None" checksum = teams_none }
  password = { ui_string = "" }
  level = { ui_string = "College" checksum = load_sch }
  server_name = { ui_string = "Better4" }
  network_id = { ui_string = "ProSkater" }
  ip_address = { ui_string = "192.168.0.10" }
  gateway = { ui_string = "192.168.0.1" }
  subnet_mask = { ui_string = "255.255.255.0" }
  auto_dns = { ui_string = "Yes" checksum = boolean_true }
  dns_server = { ui_string = "0.0.0.0" }
  dns_server2 = { ui_string = "0.0.0.0" }
  device_type = { ui_string = "None" checksum = device_none }
  broadband_type = { ui_string = "Auto-Detect (DHCP)" checksum = ip_dhcp }
  dialup_number = { ui_string = "" }
  dialup_username = { ui_string = "" }
  dialup_password = { ui_string = "" }
  time_limit = { ui_string = "2 minutes" checksum = time_120 time = 120 }
  target_score = { ui_string = "1,000,000 points" checksum = score_1000000 score = 1000000 }
  host_name = { ui_string = "" }
  domain_name = { ui_string = "" }
  dialup_authentication = { ui_string = "Yes" checksum = boolean_true }
  skill_level = { ui_string = "3: Hold My Own" checksum = num_3 }
  use_default_master_servers = { ui_string = "Yes" checksum = boolean_true }
  master_server1 = { ui_string = "0.0.0.0" }
  master_server2 = { ui_string = "0.0.0.0" }
  dialup_number2 = { ui_string = "" }
  dialup_number3 = { ui_string = "" }
  profile_email = { ui_string = "" }
  profile_password = { ui_string = "" }
  profile_password_confirm = { ui_string = "" }
  profile_success = { ui_string = "No" checksum = boolean_false }
  profile_warning_shown = { ui_string = "No" checksum = boolean_false }
  config_type = { ui_string = "Manual Settings" checksum = config_manual }
  unique_id = { ui_string = "123456789" }
  auto_brake = { ui_string = "On" checksum = boolean_true }
  show_names = { ui_string = "On" checksum = boolean_true }
  score_display = { ui_string = "Show Players" checksum = score_players }
  buddy_array = [ ]
}
script launch_network_options_menu
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_network_options_menu
endscript
script back_from_net_options_menu
  if IsTrue InNetOptionsFromNetPlay
    Change InNetOptionsFromNetPlay = 0
    GetPreferenceChecksum pref_type = network device_type
    switch <checksum>
    case device_sony_modem
    case device_usb_modem
      GetPreferenceString pref_type = network dialup_number
      if ( <ui_string> = "" )
        launch_main_menu
      else
        FormatText TextName = msg_text "***** NOT EMPTY, WAS %s *****" s = <ui_string>
        Printf <msg_text>
        if ObjectExists id = current_menu_anchor
          DestroyScreenElement id = current_menu_anchor
        endif
        remove_ss_menu_textures_from_vram
        network_selected
      endif
    case device_none
      launch_main_menu
    default
      if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
      endif
      remove_ss_menu_textures_from_vram
      network_selected
    endswitch
  else
    launch_setup_options_menu
  endif
endscript
script create_network_options_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  GetPreferenceString pref_type = network unique_id
  if ( <ui_string> = "123456789" )
    SetUniqueId
  endif
  make_new_menu menu_id = network_options_menu vmenu_id = network_options_vmenu menu_title = "" helper_text = generic_helper_text pos = (230, 109)
  SetScreenElementProps { id = network_options_vmenu event_handlers = [
      { pad_back back_from_net_options_menu }
    ]
  }
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    pos = (180, 119)
    font = testtitle
    text = "NETWORK OPTIONS"
    just = [ left top ]
    scale = 1.4
    rgba = [ 128 128 128 98 ]
    not_focusable
    z_priority = 5
  }
  main_menu_add_item text = "" not_focusable = not_focusable
  main_menu_add_item text = "Current Configuration" id = network_option_configuration pad_choose_script = launch_configuration_choices_menu highlight_bar_scale = (1.35, 1.3) highlight_bar_pos = (92, -7)
  GetPreferenceChecksum pref_type = network config_type
  GetPreferenceString pref_type = network config_type
  main_menu_add_item text = <ui_string> font = dialog id = network_option_configuration_string rgba = [ 80 80 80 128 ] scale = 0.8 not_focusable = not_focusable
  switch <checksum>
  case config_sony
    if IsPal
      main_menu_add_item text = "Choose Configuration" id = network_option_load_config pad_choose_script = launch_load_net_config highlight_bar_scale = (1.35, 1.3) highlight_bar_pos = (92, -7)
    else
      main_menu_add_item text = "Choose Combination" id = network_option_load_config pad_choose_script = launch_load_net_config highlight_bar_scale = (1.35, 1.3) highlight_bar_pos = (92, -7)
    endif
  case config_manual
    main_menu_add_item text = "Settings..." id = network_option_manual_setup pad_choose_script = launch_manual_net_setup highlight_bar_scale = (1.35, 1.3) highlight_bar_pos = (92, -7)
  endswitch
  main_menu_add_item text = "Save Settings" id = network_option_save pad_choose_script = launch_save_network_settings highlight_bar_scale = (1.35, 1.3) highlight_bar_pos = (92, -7)
  main_menu_add_item text = "Load Settings" id = network_option_load pad_choose_script = launch_load_network_settings highlight_bar_scale = (1.35, 1.3) highlight_bar_pos = (92, -7)
  set_sub_bg type = SpriteElement pos = (132, 115) scale = (1.65, 1.1) just = [ left top ]
  create_icon texture = PA_network pos = (121, 115)
  draw_menu_box delta_pos = (94, 30) scale = (1.44, 1) box_bottom_scale = (1.39, 1) box_right_offset = (-26, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = (324, 178)
    rgba = [ 0 0 0 50 ]
    scale = (85.5, 5)
    just = [ center top ]
    z_priority = 2
  }
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script launch_configuration_choices_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  DestroyScreenElement id = current_menu_anchor
  make_new_menu { menu_id = network_config_menu
    vmenu_id = network_config_vmenu
    menu_title = ""
    helper_text = generic_helper_text
  }
  SetScreenElementProps id = network_config_vmenu event_handlers = [ { pad_back launch_network_options_menu } ]
  main_menu_add_item text = "" not_focusable = not_focusable
  if IsPal
    main_menu_add_item text = "Network Configuration" id = network_config_load_config pad_choose_script = choose_sony_combination highlight_bar_scale = (1.325, 1.3)
  else
    main_menu_add_item text = "Sony Network Combination" id = network_config_load_config pad_choose_script = choose_sony_combination highlight_bar_scale = (1.325, 1.3)
  endif
  main_menu_add_item text = "Manual Settings" id = network_option_manual_setup pad_choose_script = choose_manual_setup highlight_bar_scale = (1.325, 1.3)
  set_sub_bg type = SpriteElement scale = (1.6, 1.1) pos = (328, 115)
  create_icon texture = PA_network pos = (130, 115)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "CONFIGURATION TYPE"
    scale = 1.4
    pos = (181, 120)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  draw_menu_box delta_pos = (102, 30) middle_repeat = 2 box_right_scale = (0.8, 0.31) box_right_offset = (-28, 0) scale = (1.45, 1) box_bottom_scale = (1.38, 1)
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script choose_sony_combination
  launch_load_net_config
endscript
script choose_manual_setup
  GetPreferenceChecksum pref_type = network config_type
  switch <checksum>
  case config_sony
    set_preferences_from_ui prefs = network field = "dialup_username" string = ""
    set_preferences_from_ui prefs = network field = "dialup_password" string = ""
  endswitch
  set_preferences_from_ui prefs = network field = "config_type" string = "Manual Settings" checksum = config_manual
  launch_manual_net_setup
endscript
script reset_dialup_username
  set_preferences_from_ui prefs = network field = "dialup_username" string = ""
  set_preferences_from_ui prefs = network field = "dialup_password" string = ""
endscript
script launch_load_net_config
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = _CreationOptionsLoadNetConfig
endscript
script _CreationOptionsLoadNetConfig
  SpawnScript CreationOptionsLoadNetConfig
endscript
script back_from_load_net_config
  memcard_menus_cleanup
  dialog_box_exit
  create_network_options_menu
endscript
script CreationOptionsLoadNetConfig
  Change RetryScript = CreationOptionsLoadNetConfig
  Change AbortScript = back_from_load_net_config
  Change SavingOrLoading = Loading
  check_card
  if LoadNetConfigs
    dialog_box_exit
    if NoNetConfigFiles
      create_error_box { title = "None Found"
        text = "No network configurations found!  Please use the startup disc to configure your device and ISP."
        buttons = [ { text = "ok" pad_choose_script = back_from_load_net_config }
        ]
      }
    else
      create_load_net_config_menu
    endif
  else
    dialog_box_exit
    create_error_box { title = <net_error_msg>
      text = "Your Network Configuration file was created on another PS2 and cannot be used."
      buttons = [ { text = "ok" pad_choose_script = back_from_load_net_config }
      ]
    }
  endif
endscript
script choose_net_config
  ChooseNetConfig <...>
  launch_network_options_menu
endscript
script create_load_net_config_menu
  make_new_menu menu_id = network_options_load_config_menu vmenu_id = network_options_load_config_vmenu menu_title = "LOAD CONFIG" pos = (120, 109)
  SetScreenElementProps { id = network_options_load_config_vmenu event_handlers = [
      { pad_back launch_network_options_menu }
    ]
  }
  set_sub_bg type = SpriteElement pos = (216, 115)
  create_icon texture = PA_network pos = (66, 116)
  FillNetConfigList
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script launch_manual_net_setup
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_manual_net_setup
endscript
script create_manual_net_setup
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  make_new_menu menu_id = network_setup_menu vmenu_id = network_setup_vmenu menu_title = "" helper_text = generic_helper_text
  SetScreenElementProps { id = network_setup_vmenu event_handlers = [
      { pad_back launch_network_options_menu }
    ]
  }
  main_menu_add_item text = "" not_focusable = not_focusable
  GetPreferenceString pref_type = network network_id
  main_menu_add_item text = "Network Player Name" id = network_option_player_name pad_choose_script = launch_onscreen_keyboard_from_setup_menu pad_choose_params = { field = "network_id" text = <ui_string> title = "NETWORK PLAYER NAME" min_length = 1 max_length = 15 } highlight_bar_scale = (1.375, 1.3)
  main_menu_add_item text = <ui_string> font = dialog id = network_option_player_name_string rgba = [ 80 80 80 128 ] scale = 0.8 not_focusable = not_focusable
  GetPreferenceString pref_type = network device_type
  main_menu_add_item text = "Hardware Setup" id = network_option_hardware_setup pad_choose_script = launch_hardware_setup highlight_bar_scale = (1.375, 1.3)
  main_menu_add_item text = <ui_string> font = dialog id = network_option_hardware_setup_string rgba = [ 80 80 80 128 ] scale = 0.7 not_focusable = not_focusable
  GetPreferenceChecksum pref_type = network device_type
  if ( <checksum> = device_none )
    middle_repeat = 5 box_right_scale = (0.8, 0.5)
  else
    main_menu_add_item text = "Connection Settings" id = network_option_connection_settings pad_choose_script = launch_connection_settings highlight_bar_scale = (1.375, 1.3)
    middle_repeat = 6 box_right_scale = (0.8, 0.55)
  endif
  set_sub_bg type = SpriteElement pos = (330, 115) scale = (1.75, 1.1)
  create_icon texture = PA_network pos = (115, 115)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "NETWORK SETUP"
    scale = 1.4
    pos = (171, 120)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = (150, 190)
    rgba = [ 0 0 0 60 ]
    just = [ left center ]
    scale = (88, 5)
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = black
    pos = (150, 235)
    rgba = [ 0 0 0 60 ]
    just = [ left center ]
    scale = (88, 5)
  }
  draw_menu_box delta_pos = (98, 30) middle_repeat = <middle_repeat> box_right_scale = <box_right_scale> box_right_offset = (-27, 0) scale = (1.5, 1) box_bottom_scale = (1.45, 1)
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script launch_onscreen_keyboard_from_setup_menu
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = pre_create_setup_onscreen_keyboard callback_params = { allow_cancel keyboard_cancel_script = net_setup_back_from_keyboard keyboard_done_script = set_connection_preference keyboard_title = <title> <...> }
endscript
script launch_onscreen_keyboard_from_ss_menu
  pre_create_ss_onscreen_keyboard { allow_cancel keyboard_cancel_script = ss_menu_back_from_keyboard keyboard_done_script = ss_set_connection_preference keyboard_title = <title> <...> }
endscript
script pre_create_ss_onscreen_keyboard
  remove_ss_menu_textures_from_vram
  create_onscreen_keyboard <...>
endscript
script pre_create_setup_onscreen_keyboard
  remove_pause_menu_textures_from_vram
  create_onscreen_keyboard <...>
endscript
script launch_phone_entry
  launch_onscreen_keyboard <...> allowed_characters = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "-" "," "*" "#" ]
endscript
script launch_email_keyboard
  launch_onscreen_keyboard_from_profile_menu <...> allowed_characters = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0"
    "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
    "k" "l" "m" "n" "o" "p" "q" "r" "s" "t"
    "u" "v" "w" "x" "y" "z"
    "A" "B" "C" "D" "E" "F" "G" "H" "I" "J"
    "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T"
    "U" "V" "W" "X" "Y" "Z"
    "." "-" "_" "@" ]
endscript
script launch_ip_entry
  launch_onscreen_keyboard <...> allowed_characters = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "." ]
endscript
script launch_onscreen_keyboard
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = pre_create_setup_onscreen_keyboard callback_params = { allow_cancel keyboard_cancel_script = net_options_back_from_keyboard keyboard_done_script = set_manual_connection_preference keyboard_title = <title> <...> }
endscript
script back_from_hardware_setup_refused_dialog
  dialog_box_exit
  create_manual_net_setup
endscript
script create_hardware_setup_refused_dialog
  create_dialog_box { title = net_notice_msg
    text = net_error_cant_change_device
    buttons = [ { text = "ok" pad_choose_script = back_from_hardware_setup_refused_dialog }
    ]
  }
endscript
script launch_hardware_setup
  if CanChangeDevices
    RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_hardware_setup_menu
  else
    RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_hardware_setup_refused_dialog
  endif
endscript
script launch_connection_settings
  if ObjectExists id = current_menu_anchor
    RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_connection_settings
  else
    dialog_box_exit
    create_connection_settings
  endif
endscript
script create_connection_settings
  GetPreferenceChecksum pref_type = network device_type
  switch <checksum>
  case device_broadband_pc
  case device_broadband_usb
    create_ethernet_connection_settings_menu
  case device_broadband_pc_pppoe
  case device_broadband_usb_pppoe
    create_pppoe_connection_settings_menu
  default
    create_modem_connection_settings_menu
  endswitch
endscript
script launch_connection_type_sub_menu
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_connection_type_sub_menu
endscript
script launch_connection_auto_dns_sub_menu
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_connection_auto_dns_sub_menu
endscript
script launch_connection_use_auth_sub_menu
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_connection_use_auth_sub_menu
endscript
script create_hardware_setup_menu
  make_new_menu menu_id = hardware_setup_menu vmenu_id = hardware_setup_vmenu menu_title = "" pos = (225, 129)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "HARDWARE SETUP"
    scale = 1.4
    pos = (150, 119)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  SetScreenElementProps { id = hardware_setup_vmenu event_handlers = [
      { pad_back launch_manual_net_setup }
    ]
  }
  create_hardware_setup_device_sub_menu highlight_bar_scale = (1.62, 1.3) scale = 0.7
  create_helper_text generic_helper_text
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    id = dsl_footnote
    font = small
    text = "* Most DSL users should select PPPoE devices"
    scale = 0.7
    pos = (130, 330)
    just = [ left top ]
    rgba = [ 100 100 100 80 ]
    not_focusable
  }
  set_sub_bg type = SpriteElement pos = (325, 115) scale = (1.97, 1.1)
  create_icon texture = PA_hardware pos = (85, 115)
  draw_menu_box delta_pos = (98, 30) middle_repeat = 11 box_right_scale = (0.8, 0.87) box_right_offset = (-30, 0) box_bottom_scale = (1.675, 1) scale = (1.75, 1)
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script create_ethernet_connection_settings_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  make_new_menu menu_id = connection_setup_menu vmenu_id = connection_setup_vmenu menu_title = "" pos = (230, 50)
  SetScreenElementProps { id = connection_setup_vmenu event_handlers = [
      { pad_back launch_manual_net_setup }
    ]
  }
  create_helper_text generic_helper_text
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "CONNECTION SETTINGS"
    scale = 1.4
    pos = (150, 40)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  GetPreferenceString pref_type = network broadband_type
  main_menu_add_item text = "Type" id = network_connection_type pad_choose_script = launch_connection_type_sub_menu highlight_bar_scale = (1.62, 1.3)
  main_menu_add_item text = <ui_string> id = network_connection_connection_type_string rgba = [ 80 80 80 128 ] scale = 0.8 not_focusable = not_focusable
  CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 107) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
  GetPreferenceChecksum pref_type = network broadband_type
  if ( <checksum> = ip_static )
    GetPreferenceString pref_type = network ip_address
    main_menu_add_item text = "IP Address" id = network_connection_ip pad_choose_script = launch_ip_entry pad_choose_params = { field = "ip_address" text = <ui_string> title = "IP ADDRESS" min_length = 7 max_length = 15 } highlight_bar_scale = (1.62, 1.3)
    main_menu_add_item text = <ui_string> id = network_connection_ip_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
    CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 153) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
    GetPreferenceString pref_type = network gateway
    main_menu_add_item text = "Gateway" id = network_connection_gateway pad_choose_script = launch_ip_entry pad_choose_params = { field = "gateway" text = <ui_string> title = "GATEWAY" min_length = 7 max_length = 15 } highlight_bar_scale = (1.62, 1.3)
    main_menu_add_item text = <ui_string> id = network_connection_gateway_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
    CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 199) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
    GetPreferenceString pref_type = network subnet_mask
    main_menu_add_item text = "Subnet Mask" id = network_connection_subnet pad_choose_script = launch_ip_entry pad_choose_params = { field = "subnet_mask" text = <ui_string> title = "SUBNET MASK" min_length = 7 max_length = 15 } highlight_bar_scale = (1.62, 1.3)
    main_menu_add_item text = <ui_string> id = network_connection_subnet_mask_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
    CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 245) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
    middle_repeat = 16 box_right_scale = (0.8, 1.18)
  else
    GetPreferenceString pref_type = network host_name
    main_menu_add_item text = "* Hostname" id = network_connection_hostname pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "host_name" text = <ui_string> title = "HOSTNAME" min_length = 0 max_length = 31 } highlight_bar_scale = (1.62, 1.3)
    main_menu_add_item text = <ui_string> id = network_connection_hostname_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
    CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 153) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
    GetPreferenceString pref_type = network auto_dns
    main_menu_add_item text = "Auto-Obtain DNS Servers?" id = network_connection_auto_dns pad_choose_script = launch_connection_auto_dns_sub_menu highlight_bar_scale = (1.62, 1.3)
    main_menu_add_item text = <ui_string> id = network_connection_connection_auto_dns_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
    CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 199) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
    middle_repeat = 10 box_right_scale = (0.8, 0.81)
  endif
  GetPreferenceChecksum pref_type = network auto_dns
  if ( <checksum> = boolean_false )
    GetPreferenceString pref_type = network dns_server
    main_menu_add_item text = "DNS Server 1" id = network_connection_dns_1 pad_choose_script = launch_ip_entry pad_choose_params = { field = "dns_server" text = <ui_string> title = "DNS SERVER 1" min_length = 7 max_length = 15 } highlight_bar_scale = (1.62, 1.3)
    main_menu_add_item text = <ui_string> id = network_connection_dns1_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
    GetPreferenceString pref_type = network dns_server2
    main_menu_add_item text = "DNS Server 2" id = network_connection_dns_2 pad_choose_script = launch_ip_entry pad_choose_params = { field = "dns_server2" text = <ui_string> title = "DNS SERVER 2" min_length = 7 max_length = 15 } highlight_bar_scale = (1.62, 1.3)
    main_menu_add_item text = <ui_string> id = network_connection_dns2_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
    GetPreferenceChecksum pref_type = network broadband_type
    if ( <checksum> = ip_static )
      CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 337) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
    else
      CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 245) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
    endif
    CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 291) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
    middle_repeat = 16 box_right_scale = (0.8, 1.18)
  endif
  GetPreferenceChecksum pref_type = network broadband_type
  if ( <checksum> = ip_dhcp )
    main_menu_add_item text = "" not_focusable = not_focusable scale = 0.7
    main_menu_add_item text = "* Required by some ISPs" id = hostname_footnote not_focusable = not_focusable rgba = [ 80 80 80 128 ] scale = 0.7
  endif
  set_sub_bg type = SpriteElement pos = (325, 36) scale = (1.97, 1.1)
  create_icon texture = PA_connection pos = (85, 36)
  draw_menu_box delta_pos = (100, -45) middle_repeat = <middle_repeat> box_right_scale = <box_right_scale> box_right_offset = (-31, 0) box_bottom_scale = (1.675, 1) scale = (1.75, 1)
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script create_pppoe_connection_settings_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  make_new_menu menu_id = connection_setup_menu vmenu_id = connection_setup_vmenu menu_title = "" pos = (230, 50)
  SetScreenElementProps { id = connection_setup_vmenu event_handlers = [
      { pad_back launch_manual_net_setup }
    ]
  }
  create_helper_text generic_helper_text
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "CONNECTION SETTINGS"
    scale = 1.4
    pos = (150, 40)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  GetPreferenceString pref_type = network dialup_username
  main_menu_add_item text = "Username" id = network_connection_username pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dialup_username" text = <ui_string> title = "USERNAME" min_length = 1 max_length = 47 } highlight_bar_scale = (1.62, 1.3)
  main_menu_add_item text = <ui_string> id = network_connection_connection_username_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
  GetPreferenceString pref_type = network dialup_password
  GetPreferencePassword pref_type = network dialup_password
  main_menu_add_item text = "Password" id = network_connection_password pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dialup_password" text = <ui_string> title = "PASSWORD" min_length = 1 max_length = 47 password } highlight_bar_scale = (1.62, 1.3)
  main_menu_add_item text = <password_string> id = network_connection_password_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
  GetPreferenceChecksum pref_type = network auto_dns
  GetPreferenceString pref_type = network auto_dns
  main_menu_add_item text = "Auto-Obtain DNS Servers?" id = network_connection_auto_dns pad_choose_script = launch_connection_auto_dns_sub_menu highlight_bar_scale = (1.62, 1.3)
  main_menu_add_item text = <ui_string> id = network_connection_connection_auto_dns_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
  CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 107) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
  CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 153) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
  CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 199) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
  if ( <checksum> = boolean_false )
    GetPreferenceString pref_type = network dns_server
    main_menu_add_item text = "DNS Server 1" id = network_connection_dns_1 pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dns_server" text = <ui_string> title = "DNS SERVER 1" min_length = 7 max_length = 15 } highlight_bar_scale = (1.62, 1.3)
    main_menu_add_item text = <ui_string> id = network_connection_dns1_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
    GetPreferenceString pref_type = network dns_server2
    main_menu_add_item text = "DNS Server 2" id = network_connection_dns_2 pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dns_server2" text = <ui_string> title = "DNS SERVER 2" min_length = 7 max_length = 15 } highlight_bar_scale = (1.62, 1.3)
    main_menu_add_item text = <ui_string> id = network_connection_dns2_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
    CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 245) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
    CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 291) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
    middle_repeat = 14 box_right_scale = (0.8, 1.06)
  else
    middle_repeat = 8 box_right_scale = (0.8, 0.68)
  endif
  set_sub_bg type = SpriteElement pos = (325, 36) scale = (1.97, 1.1)
  create_icon texture = PA_connection pos = (85, 36)
  draw_menu_box delta_pos = (100, -45) middle_repeat = <middle_repeat> box_right_scale = <box_right_scale> box_right_offset = (-31, 0) box_bottom_scale = (1.675, 1) scale = (1.75, 1)
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script create_modem_connection_settings_menu
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  make_new_menu menu_id = connection_setup_menu vmenu_id = connection_setup_vmenu menu_title = "" pos = (230, 40)
  SetScreenElementProps { id = connection_setup_vmenu event_handlers = [
      { pad_back launch_manual_net_setup }
    ]
  }
  create_helper_text generic_helper_text
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = "CONNECTION SETTINGS"
    scale = 1.4
    pos = (150, 30)
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
    not_focusable
  }
  GetPreferenceString pref_type = network dialup_number
  main_menu_add_item text = "ISP Phone Number" id = network_connection_isp_phone pad_choose_script = launch_phone_entry pad_choose_params = { field = "dialup_number" text = <ui_string> title = "ISP PHONE NUMBER" min_length = 7 max_length = 20 } highlight_bar_scale = (1.62, 1.3)
  main_menu_add_item text = <ui_string> id = network_connection_connection_isp_phone_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
  GetPreferenceString pref_type = network dialup_username
  main_menu_add_item text = "Username" id = network_connection_username pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dialup_username" text = <ui_string> title = "USERNAME" min_length = 1 max_length = 36 } highlight_bar_scale = (1.62, 1.3)
  main_menu_add_item text = <ui_string> id = network_connection_connection_username_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
  GetPreferenceString pref_type = network dialup_password
  GetPreferencePassword pref_type = network dialup_password
  main_menu_add_item text = "Password" id = network_connection_password pad_choose_script = launch_onscreen_keyboard pad_choose_params = { field = "dialup_password" text = <ui_string> title = "PASSWORD" min_length = 1 max_length = 36 password } highlight_bar_scale = (1.62, 1.3)
  main_menu_add_item text = <password_string> id = network_connection_password_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
  GetPreferenceChecksum pref_type = network dialup_authentication
  GetPreferenceString pref_type = network dialup_authentication
  main_menu_add_item text = "Use Authentication?" id = network_connection_use_auth pad_choose_script = launch_connection_use_auth_sub_menu highlight_bar_scale = (1.62, 1.3)
  main_menu_add_item text = <ui_string> id = network_connection_use_auth_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
  GetPreferenceString pref_type = network auto_dns
  main_menu_add_item text = "Auto-Obtain DNS Servers?" id = network_connection_auto_dns pad_choose_script = launch_connection_auto_dns_sub_menu highlight_bar_scale = (1.62, 1.3)
  main_menu_add_item text = <ui_string> id = network_connection_connection_auto_dns_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
  CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 199) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
  middle_repeat = 10 box_right_scale = (0.8, 0.81)
  GetPreferenceChecksum pref_type = network auto_dns
  if ( <checksum> = boolean_false )
    GetPreferenceString pref_type = network dns_server
    main_menu_add_item text = "DNS Server 1" id = network_connection_dns_1 pad_choose_script = launch_ip_entry pad_choose_params = { field = "dns_server" text = <ui_string> title = "DNS SERVER 1" min_length = 7 max_length = 15 } highlight_bar_scale = (1.62, 1.3)
    main_menu_add_item text = <ui_string> id = network_connection_dns1_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
    GetPreferenceString pref_type = network dns_server2
    main_menu_add_item text = "DNS Server 2" id = network_connection_dns_2 pad_choose_script = launch_ip_entry pad_choose_params = { field = "dns_server2" text = <ui_string> title = "DNS SERVER 2" min_length = 7 max_length = 15 } highlight_bar_scale = (1.62, 1.3)
    main_menu_add_item text = <ui_string> id = network_connection_dns2_string rgba = [ 80 80 80 128 ] scale = 0.8 font = dialog not_focusable = not_focusable
    middle_repeat = 19 box_right_scale = (0.8, 1.36)
  else
    middle_repeat = 14 box_right_scale = (0.8, 1.05)
  endif
  set_sub_bg type = SpriteElement pos = (325, 26) scale = (1.97, 1.1)
  create_icon texture = PA_connection pos = (85, 26)
  draw_menu_box delta_pos = (100, -55) middle_repeat = <middle_repeat> box_right_scale = <box_right_scale> box_right_offset = (-31, 0) box_bottom_scale = (1.675, 1) scale = (1.75, 1)
  CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 97) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
  CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 143) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
  CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 189) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
  CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 235) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
  CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 281) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
  if ( <checksum> = boolean_false )
    CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 327) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
    CreateScreenElement { type = SpriteElement parent = current_menu_anchor scale = (103, 5) pos = (120, 373) texture = black rgba = [ 0 0 0 60 ] just = [ left center ] }
  endif
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script select_connection_option
  set_preferences_from_ui <...>
  if ( <checksum> = ip_static )
    set_preferences_from_ui prefs = <prefs> field = "auto_dns" checksum = boolean_false string = "No"
  else
    if ( <checksum> = ip_dhcp )
      set_preferences_from_ui prefs = <prefs> field = "auto_dns" checksum = boolean_true string = "Yes"
    endif
  endif
  launch_connection_settings
endscript
script select_hardware_option
  set_preferences_from_ui <...>
  launch_manual_net_setup
endscript
script create_hardware_setup_sub_menu
  generic_array_menu_setup <...>
endscript
script create_connection_setup_sub_menu
  make_new_menu menu_id = connection_setup_sub_menu vmenu_id = conection_setup_sub_vmenu <...>
  SetScreenElementProps { id = connection_setup_sub_menu event_handlers = [
      { pad_back launch_connection_settings }
    ]
  }
  generic_array_menu_setup <...>
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
endscript
script create_hardware_setup_device_sub_menu
  if IsPal
    create_hardware_setup_sub_menu pref_type = network pref_field = "device_type" array = device_types_pal call_script = select_hardware_option highlight_bar_scale = <highlight_bar_scale> scale = <scale>
  else
    create_hardware_setup_sub_menu pref_type = network pref_field = "device_type" array = device_types call_script = select_hardware_option highlight_bar_scale = <highlight_bar_scale> scale = <scale>
  endif
endscript
script create_connection_type_sub_menu
  menu_title = "Connection Type"
  pref_type = network
  pref_field = "broadband_type"
  array = broadband_types
  call_script = select_connection_option
  create_dialog_box { title = <menu_title>
    text = "Which type of connection do you use?"
    buttons = [ { text = "Auto-Detect (DHCP)" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "Auto-Detect (DHCP)" checksum = ip_dhcp <...> } }
      { text = "Static IP Address" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "Static IP Address" checksum = ip_static <...> } }
    ]
  }
endscript
script create_connection_auto_dns_sub_menu
  menu_title = "DNS Servers"
  pref_type = network
  pref_field = "auto_dns"
  array = boolean_types
  call_script = select_connection_option
  create_dialog_box { title = <menu_title>
    text = "Do you want to auto obtain DNS servers?"
    buttons = [ { text = "Yes" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "Yes" checksum = boolean_true <...> } }
      { text = "No" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "No" checksum = boolean_false <...> } }
    ]
  }
endscript
script create_connection_use_auth_sub_menu
  menu_title = "Authentication"
  pref_type = network
  pref_field = "dialup_authentication"
  array = boolean_types
  call_script = select_connection_option
  create_dialog_box { title = <menu_title>
    text = "Use authentication?"
    buttons = [ { text = "Yes" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "Yes" checksum = boolean_true <...> } }
      { text = "No" pad_choose_script = <call_script> pad_choose_params = { prefs = <pref_type> field = <pref_field> string = "No" checksum = boolean_false <...> } }
    ]
  }
endscript
script set_connection_preference
  GetTextElementString id = keyboard_current_string
  set_preferences_from_ui prefs = network <...>
  destroy_onscreen_keyboard
  create_manual_net_setup
endscript
script ss_set_connection_preference
  GetTextElementString id = keyboard_current_string
  set_preferences_from_ui prefs = network <...>
  destroy_onscreen_keyboard
  launch_ss_menu
endscript
script set_manual_connection_preference
  GetTextElementString id = keyboard_current_string
  set_preferences_from_ui prefs = network <...>
  destroy_onscreen_keyboard
  create_connection_settings
endscript
script net_options_back_from_keyboard
  destroy_onscreen_keyboard
  create_connection_settings
endscript
script net_setup_back_from_keyboard
  destroy_onscreen_keyboard
  create_manual_net_setup
endscript
script ss_menu_back_from_keyboard
  destroy_onscreen_keyboard
  launch_ss_menu
endscript
script back_from_startup_error_dialog
  dialog_box_exit
  launch_main_menu
endscript
script create_net_startup_error_dialog
  create_dialog_box { title = net_error_msg
    text = <text>
    buttons = [ { text = "ok" pad_choose_script = back_from_startup_error_dialog }
    ]
  }
endscript
script go_to_connection_setup_from_dialog
  dialog_box_exit
  Change InNetOptionsFromNetPlay = 1
  create_network_options_menu
endscript
script create_net_startup_need_setup_dialog
  create_dialog_box { title = net_status_msg
    text = <text>
    buttons = [ { text = " Yes " pad_choose_script = go_to_connection_setup_from_dialog }
      { text = " No " pad_choose_script = back_from_startup_error_dialog }
    ]
  }
endscript
script create_testing_network_settings_dialog
  create_dialog_box { title = net_status_msg
    text = net_status_testing_settings
  }
endscript
