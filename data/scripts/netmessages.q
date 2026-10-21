script NewScoreLeaderYou
  if InNetGame
    create_net_panel_message text = "You have taken the lead!" style = net_team_panel_message
  endif
endscript
script NewScoreLeaderOther
  if InNetGame
    FormatText TextName = msg_text "%s has taken the lead!" s = <String0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
  endif
endscript
script NewKingYou
  if InNetGame
    create_net_panel_message text = net_message_new_king_you style = net_team_panel_message
  endif
endscript
script NewKingOther
  if InNetGame
    FormatText TextName = msg_text "%s is king of the hill!" s = <String0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
  endif
endscript
script NewScoreLeaderYourTeam
  if InNetGame
    create_net_panel_message text = "Your team has taken the lead!" style = net_team_panel_message
  endif
endscript
script NewScoreLeaderOtherTeam
  if InNetGame
    FormatText TextName = msg_text "Team %s has taken the lead!" s = <String0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
  endif
endscript
script timer_runout_beep
  PlaySound TimeoutA Vol = 75 pitch = 110
endscript
script GraffitiStealYou
  if InNetGame
    FormatText TextName = msg_text "You stole from %s!" s = <String0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
  endif
endscript
script GraffitiStealOther
  if InNetGame
    FormatText TextName = msg_text "%s stole from you!" s = <String0>
    create_net_panel_message text = <msg_text> style = net_team_panel_message
  endif
endscript
script SkaterCollideBail
  InBail
  PlaySound HUDtrickslopC
  if InNetGame
    if not GameModeEquals is_ctf
      FormatText TextName = msg_text s = <String0> random( @
      "You got smacked by %s"
      @"%s just dropped the hammer on you"
      @"%s is taking all comers"
      @"%s caught you wankin'"
      @"%s shows you to the kiddie park "
      @"%s says this is THPS4, not THP YOU SUCK"
      @"Sorry, %s meant to kick your face"
      @"Another classic neck breaker by %s"
      @"%s is SO much better than you, it's sick"
      @"%s says stick to scooters"
      @"You gonna let %s treat you like that?"
      @"Hint, stay away from %s"
      @"Face plant, courtesy of %s"
      @"%s set you up the bomb"
      @"All your base are belong to %s"
      @"%s wipes you off their shoe"
      @"%s rejected you like a baboon heart"
      @"%s wipes you off their shoe"
      @"%s offers you some inline skates"
      @"%s served you up a backhand"
      @"%s shanked you coldblooded"
      @"%s 1, you 0"
      @"Head slap, compliments of %s"
      @"%s kicked your ass. Plain and simple"
      @"%s is never soft"
       ) 
      create_net_panel_message text = <msg_text> style = net_team_panel_message
    endif
  endif
  PlaySound bodysmackA
  if InSlapGame
    ClearPanel_Bailed
    MoveToRandomRestart
  endif
  Goto NoseManualBail
endscript
script MadeOtherSkaterBail
  SetTrickName "Head Smack"
  SetTrickScore 2000
  if InNetGame
    if not GameModeEquals is_ctf
      if ProfileEquals is_named = maul
        FormatText TextName = msg_text s = <String0> random( @
        "You force pushed %s"
        @"Lightsaber attack on %s"
         ) 
      else
        GetCurrentSkaterProfileIndex
        GetSkaterProfileInfo player = <currentSkaterProfileIndex>
        if ( <is_male> = 1 )
            <collision_message_which_implies_parental_responsibility> = "You are %s's daddy"
        else
            <collision_message_which_implies_parental_responsibility> = "You are %s's mommy"
        endif
        FormatText TextName = msg_text s = <String0> random( @
        "You smacked %s"
        @"You punked %s"
        @"You shanked %s"
        @"You slapped %s silly"
        @"You showed the door to %s"
        @"You dropped %s like a bad habit"
        @"You made %s lick the floor"
        @<collision_message_which_implies_parental_responsibility>
         ) 
      endif
      create_net_panel_message text = <msg_text> style = net_team_panel_message
    endif
  endif
  Display Blockspin
  OnGroundExceptions
  ClearException Ex = RunHasEnded
  ClearException Ex = GoalHasEnded
  SetQueueTricks Jumptricks
  PlayAnim Anim = SlapRight Blendperiod = 0.3
  PlaySound bitchslap2
  WaitAnimWhilstChecking AndManuals
  CheckGapTricks
  ClearGapTricks
  ClearPanel_Landed
  Goto OnGroundAi
endscript
script MadeOtherSkaterBailAir
  SetTrickName "Head Smack"
  SetTrickScore 2000
  if InNetGame
    if not GameModeEquals is_ctf
      if ProfileEquals is_named = maul
        FormatText TextName = msg_text s = <String0> random( @
        "You force pushed %s"
        @"Lightsaber attack on %s"
         ) 
        create_net_panel_message text = <msg_text>
      else
        FormatText TextName = msg_text "Airborne face smack to %s!" s = <String0>
        create_net_panel_message text = <msg_text> style = net_team_panel_message
      endif
    endif
  else
  endif
  Display Blockspin
  if DoingTrick
  else
    InAirExceptions
    PlayAnim Anim = SlapAir Blendperiod = 0.3
    PlaySound bodysmackA
    WaitAnimWhilstChecking
    Goto Airborne
  endif
endscript
script MadeOtherSkaterBail_Called
  SetTrickName "Head Smack"
  SetTrickScore 2000
  if InNetGame
    if not GameModeEquals is_ctf
      FormatText TextName = msg_text "Face smack to %s!" s = <String0>
      create_net_panel_message text = <msg_text> style = net_team_panel_message
    endif
  else
  endif
  Display Blockspin
endscript
script NetIdle
  if ShouldMongo
    Printf "******************* PLAYING MONGO BRAKE IDLE ****************************"
    PlayAnim Anim = MongoBrakeIdle Blendperiod = 0.0 Cycle NoRestart
  else
    Printf "******************* PLAYING BRAKE IDLE ****************************"
    PlayAnim Anim = NewBrakeIdle Blendperiod = 0.0 Cycle NoRestart
  endif
endscript
script ChooseTeamMessage
  create_net_panel_message text = "Teams have been created. Choose a team by grabbing its flag." style = generic_net_panel_message
endscript
script server_enter_free_skate
  if InTeamGame
    create_net_panel_message text = "Choose a team by grabbing a flag. Press \b8 to Begin Game" style = generic_net_panel_message
  else
    create_net_panel_message text = "Entering Free Skate. Press \b8 to Begin Game" style = generic_net_panel_message
  endif
  if OnServer
    LoadPendingPlayers
  endif
endscript
script client_enter_free_skate
  if InTeamGame
    create_net_panel_message text = "Choose a team by grabbing a flag" style = generic_net_panel_message
  else
    create_net_panel_message text = "Entering Free Skate" style = generic_net_panel_message
  endif
endscript
netmessageprops = {
  font = "small.fnt"
  just = (0, 0)
  dims = (600, 112)
  colors = [
    { (50, 80, 128) alpha = 128 }
    { (128, 128, 128) alpha = 75 }
    { (110, 50, 50) alpha = 75 }
    { (180, 160, 0) alpha = 75 }
  ]
  key_points = [
    { pos = (320, 250) alpha = 0 scale = 0.2 time = 0 }
    { alpha = 128 scale = 1.01 time = 0.09 }
    { alpha = 128 scale = 1.01 time = 5 }
    { alpha = 0 scale = 0.2 time = 5.09 }
  ]
}
netstatusprops = {
  font = "small.fnt"
  just = (0, 0)
  dims = (600, 112)
  colors = [
    { (128, 128, 128) alpha = 128 }
    { (50, 80, 128) alpha = 75 }
    { (110, 50, 50) alpha = 75 }
    { (180, 160, 0) alpha = 75 }
  ]
  key_points = [
    { pos = (320, 285) alpha = 0 scale = 0.2 time = 0 }
    { alpha = 128 scale = 1.01 time = 0.09 }
    { alpha = 128 scale = 1.01 time = 5 }
    { alpha = 0 scale = 0.2 time = 5.09 }
  ]
}
netexceptionprops = {
  font = "small.fnt"
  just = (0, 0)
  dims = (600, 112)
  colors = [
    { (128, 128, 128) alpha = 128 }
    { (50, 80, 128) alpha = 75 }
    { (110, 50, 50) alpha = 75 }
    { (180, 160, 0) alpha = 75 }
  ]
  key_points = [
    { pos = (320, 305) alpha = 0 scale = 0.2 time = 0 }
    { alpha = 128 scale = 1.01 time = 0.09 }
    { alpha = 128 scale = 1.01 time = 5 }
    { alpha = 0 scale = 0.2 time = 5.09 }
  ]
}
chat1props = {
  font = "small.fnt"
  just = (0, 0)
  dims = (600, 112)
  colors = [
    { (50, 80, 128) alpha = 128 }
    { (180, 160, 0) alpha = 75 }
    { (110, 50, 50) alpha = 75 }
    { (128, 128, 128) alpha = 75 }
  ]
  key_points = [
    { pos = (320, 150) alpha = 0 scale = 0.2 time = 0 }
    { alpha = 128 scale = 1.01 time = 0.09 }
    { alpha = 128 scale = 1.01 time = 5 }
    { alpha = 0 scale = 0.2 time = 5.09 }
  ]
}
chat2props = {
  font = "small.fnt"
  just = (0, 0)
  dims = (600, 112)
  colors = [
    { (50, 80, 128) alpha = 128 }
    { (180, 160, 0) alpha = 75 }
    { (110, 50, 50) alpha = 75 }
    { (128, 128, 128) alpha = 75 }
  ]
  key_points = [
    { pos = (320, 170) alpha = 0 scale = 0.2 time = 0 }
    { alpha = 128 scale = 1.01 time = 0.09 }
    { alpha = 128 scale = 1.01 time = 5 }
    { alpha = 0 scale = 0.2 time = 5.09 }
  ]
}
chat3props = {
  font = "small.fnt"
  just = (0, 0)
  dims = (600, 112)
  colors = [
    { (50, 80, 128) alpha = 128 }
    { (180, 160, 0) alpha = 75 }
    { (110, 50, 50) alpha = 75 }
    { (128, 128, 128) alpha = 75 }
  ]
  key_points = [
    { pos = (320, 190) alpha = 0 scale = 0.2 time = 0 }
    { alpha = 128 scale = 1.01 time = 0.09 }
    { alpha = 128 scale = 1.01 time = 5 }
    { alpha = 0 scale = 0.2 time = 5.09 }
  ]
}
chat4props = {
  font = "small.fnt"
  just = (0, 0)
  dims = (600, 112)
  colors = [
    { (50, 80, 128) alpha = 128 }
    { (180, 160, 0) alpha = 75 }
    { (110, 50, 50) alpha = 75 }
    { (128, 128, 128) alpha = 75 }
  ]
  key_points = [
    { pos = (320, 210) alpha = 0 scale = 0.2 time = 0 }
    { alpha = 128 scale = 1.01 time = 0.09 }
    { alpha = 128 scale = 1.01 time = 5 }
    { alpha = 0 scale = 0.2 time = 5.09 }
  ]
}
chat5props = {
  font = "small.fnt"
  just = (0, 0)
  dims = (600, 112)
  colors = [
    { (50, 80, 128) alpha = 128 }
    { (180, 160, 0) alpha = 75 }
    { (110, 50, 50) alpha = 75 }
    { (128, 128, 128) alpha = 75 }
  ]
  key_points = [
    { pos = (320, 230) alpha = 0 scale = 0.2 time = 0 }
    { alpha = 128 scale = 1.01 time = 0.09 }
    { alpha = 128 scale = 1.01 time = 5 }
    { alpha = 0 scale = 0.2 time = 5.09 }
  ]
}
net_error_msg = "Error"
net_notice_msg = 'Notice'
net_status_msg = "Status"
net_refused_msg = "Refused"
net_error_not_connected = "Your network device is not properly connected to the network. Check your cables or contact your network administrator."
net_error_not_detected = "Could not detect any compatible network devices. Check your connections. See the THPS4 manual for troubleshooting."
net_error_dhcp_error = "Could not automatically detect network settings. Check connections and DHCP server or choose a static IP."
net_error_changed_device = "You have changed network device settings and must restart your system for this change to take effect."
net_error_general_error = "Your network device is not configured properly or may not be properly connected. See the THPS4 manual for troubleshooting."
net_error_cant_change_device = "You must restart your system before changing this option."
net_error_unplugged = 'Your system link has been disconnected. To continue system link play, please reconnect it.'
net_error_unplugged_front_end = 'Your system link has been disconnected. Select Ok to return to the main menu.'
net_reason_full_observers = "The server will not allow any more observers at this time."
net_reason_banned = 'You have been banned from this server.'
net_reason_full = 'The server is full.'
net_reason_wrong_password = 'Incorrect password.'
net_reason_version = 'Incompatible version.'
net_reason_serial = 'Serial check failed.'
net_reason_general = 'Connection refused.'
net_message_game_in_progress = "This game is in progress. Would you like to observe the remainder of this game and join automatically afterwards?"
net_message_game_in_progress_refused = "This game is in progress.  You must wait until it finishes to join."
net_message_waiting_for_players = "Waiting for some players to fully load... Would you like to wait for them?"
net_message_server_removed_you = "The server has chosen to remove you from this game. Press \m0 to return to the main menu."
net_message_server_moved_on = "The server decided to start the game without you. Press \m0 to return to the main menu."
net_message_no_servers_found = 'No Servers Found'
net_message_new_king_other = "%s0 is king of the hill!"
net_message_new_king_you = "You are king of the hill!"
net_message_new_player = '%s0 is joining the game'
net_message_dropped_crown_you = 'You dropped the crown!'
net_message_dropped_crown_other = 'The king has dropped the crown!'
net_message_changing_levels = 'Get Ready! Changing levels to %s0....'
net_message_game_will_start = "The game will start when all players are fully-loaded."
net_message_join_pending = '%s0 is waiting to join.'
net_message_observing = '%s0 is now observing the game.'
net_message_joining = '%s0 is joining the game.'
net_message_starting_game = 'Get Ready! Starting a %s0 game....'
net_message_auto_starting_game = 'Get Ready! Auto-Server starting a %s0 game....'
net_message_player_quit = '%s0 has left the game.'
net_message_player_timed_out = '%s0 has timed out.'
net_message_player_now_observing = '%s0 has chosen to observe.'
net_message_player_kicked = 'Server has removed %s0 from the game.'
net_message_player_banned = 'Server has banned %s0 from the game.'
net_message_player_left_out = 'Server has dropped %s0 from the game.'
net_message_player_dropped = '%s0 had a bad connection and was dropped.'
net_status_connecting = "Connecting to Server...."
net_status_joining = "Joining game...."
net_status_trying_password = "Trying password...."
net_status_lost_connection = 'You have lost connection to the server. Press X to return to main menu.'
net_status_server_quit = 'The server has quit. Press X to return to main menu.'
net_status_join_timeout = "Timed out joining server. Refresh your server list or try again."
net_status_not_posted = "Your game was not posted on GameSpy. Check your network cables as well as any Firewall settings you may have."
net_status_checking_motd = "Connecting to master server...."
net_status_retry_motd = 'Reattempting to Connect to master server....'
net_status_getting_lobbies = "Getting lobby list...."
net_status_connecting_chat = "Connecting to chat server..."
net_status_gamespy_no_dns = "Failed to connect to GameSpy. Check your Gateway and/or Firewall settings. See the THPS4 manual for troubleshooting."
net_status_gamespy_no_connect = "Failed to connect to GameSpy. Check your connection and settings. See the THPS4 manual for troubleshooting."
net_status_gamespy_lost_connection = "You have lost connection to GameSpy. Check your network cables or try reconnecting."
net_status_motd_failed = "Failed to connect to master server."
net_status_buddy_login_failed = "Failed to connect to server."
net_status_testing_settings = "Testing network settings...."
net_status_need_to_setup = "You have yet to set up your network device and connection. Would you like to do so now?"
net_status_need_to_setup_dialup = "You have yet to set up your connection settings. Would you like to do so now?"
net_modem_state_dialing = "Dialing"
net_modem_state_connected = "Connected. Logging in...."
net_modem_state_logged_in = "Connected"
net_modem_state_disconnecting = "Disconnecting...."
net_modem_state_hanging_up = "Hanging up...."
net_modem_state_disconnected = "Disconnected."
net_modem_state_conencting = "Connecting to ISP"
net_modem_error_no_modem = "No compatible modems are attached."
net_modem_error_timeout = "Timed out connecting to service provider. Check your connection settings."
net_modem_error_busy = "The phone number you dialed is busy,"
net_modem_error_no_connect = "Could not connect to ISP. Please check your ISP phone number."
net_modem_error_no_dialtone = "No dialtone detected. Make sure your phone line is properly connected."
net_modem_error_during_connect = "Connected, but could not log in. Check your username and password in your connection settings."
homie_status_online = "Online"
homie_status_logging_in = "Logging in..."
homie_status_offline = "Offline"
homie_status_chatting = "Chatting"
homie_status_observing = "Observing"
homie_status_playing = "Playing"
lobby_status_joined = "joined the room"
lobby_status_left = "left the room"
score_title_trick_attack = 'Score'
score_title_graffiti = 'Tags'
score_title_king = 'Time'
score_title_slap = 'Slaps'
net_lobby_full = "FULL"
sort_title_list = 'Server List'
sort_title_name = 'Name'
sort_title_ping = 'Ping'
sort_title_players = 'Players'
sort_title_observers = 'Observers'
sort_title_mode = 'Mode'
sort_title_level = 'Level'
sort_title_skill = 'Skill'
lobby_full_title = 'Full'
lobby_lan_title = 'LAN Games'
net_lobby_chat_msg = '%s0'
team_1_name = "Red"
team_2_name = "Blue"
team_3_name = "Green"
team_4_name = "Yellow"
total_str = "Total"
manual_settings_str = "Manual Settings"
script joined_team_you
  Printf "join team you"
  FormatText TextName = msg_text "You have joined the %s team." s = <String0>
  create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript
script net_team_panel_message
  PlaySound HUD_specialtrickAA Vol = 100
  DoMorph pos = (320, 204) scale = 0 time = 0 alpha = 0
  DoMorph pos = (320, 204) scale = 1.5 time = 0.1 alpha = 0.9
  DoMorph pos = (320, 204) scale = 0.7 time = 0.1
  DoMorph pos = (320, 204) scale = 1.1 time = 0.1
  DoMorph pos = (320, 204) scale = 0.9 time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (319, 203) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph alpha = 0 time = 0.3
  Die
endscript
script generic_net_panel_message
  DoMorph pos = (320, 204) scale = 0 time = 0 alpha = 0
  DoMorph pos = (320, 204) scale = 1.5 time = 0.1 alpha = 0.9
  DoMorph pos = (320, 204) scale = 0.7 time = 0.1
  DoMorph pos = (320, 204) scale = 1.1 time = 0.1
  DoMorph pos = (320, 204) scale = 0.9 time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (319, 203) time = 0.1
  DoMorph pos = (321, 201) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (319, 203) time = 0.1
  DoMorph pos = (324, 205) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (319, 203) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (321, 207) time = 0.1
  DoMorph pos = (319, 203) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (317, 203) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph pos = (319, 203) time = 0.1
  DoMorph pos = (321, 205) time = 0.1
  DoMorph alpha = 0 time = 0.6
  Die
endscript
script joined_team_other
  FormatText TextName = msg_text "%s has joined the %w team." s = <String0> w = <String1>
  create_net_panel_message text = <msg_text> style = net_team_panel_message
endscript
