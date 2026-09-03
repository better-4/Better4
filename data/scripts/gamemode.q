
script gameoptions_menu_create
  CreateMenu {
    type = verticalmenu id = gameoptions_menu x = 160.0 y = 56.0 w = 320.0 h = 336.0
    just_center_x
    just_center_y
    drawer = viewertext
    children = [
    ]
  }
  AttachChild parent = contain1 child = gameoptions_menu
endscript
mode_info = [
  { name = "Free Skate"
    checksum = freeskate
    definition = "mode_freeskate"
  }
  { name = "2 Player Free Skate"
    checksum = freeskate2p
    definition = "mode_freeskate2p"
  }
  { name = "Single Session"
    checksum = singlesession
    definition = "mode_singlesession"
  }
  { name = "Trick Attack"
    checksum = trickattack
    definition = "mode_trickattack"
  }
  { name = "Score Challenge"
    checksum = scorechallenge
    definition = "mode_scorechallenge"
  }
  { name = "Combo Mambo"
    checksum = combomambo
    definition = "mode_combomambo"
  }
  { name = "Graffiti"
    checksum = graffiti
    definition = "mode_graffiti"
  }
  { name = "Slap!"
    checksum = slap
    definition = "mode_slap"
  }
  { name = "King of the Hill"
    checksum = king
    definition = "mode_king"
  }
  { name = "Horse"
    checksum = horse
    definition = "mode_horse"
  }
  {
    name = "Horse"
    checksum = nethorse
    definition = "mode_nethorse"
  }
  { name = "Hamburger"
    checksum = hamburger
    definition = "mode_hamburger"
  }
  { name = "Strip Skate"
    checksum = stripskate
    definition = "mode_stripskate"
  }
  { name = "Career"
    checksum = career
    definition = "mode_career"
  }
  {
    name = "Net"
    checksum = net
    definition = "mode_net"
  }
  { name = "Contest"
    checksum = contest
    definition = "mode_contest"
  }
  { name = "Lobby"
    checksum = netlobby
    definition = "mode_netlobby"
  }
  { name = "Trick Attack"
    checksum = nettrickattack
    definition = "mode_nettrickattack"
  }
  { name = "Score Challenge"
    checksum = netscorechallenge
    definition = "mode_netscorechallenge"
  }
  { name = "Combo Mambo"
    checksum = netcombomambo
    definition = "mode_netcombomambo"
  }
  { name = "Graffiti"
    checksum = netgraffiti
    definition = "mode_netgraffiti"
  }
  {
    name = "Goal Attack"
    checksum = netgoalattack
    definition = "mode_netgoalattack"
  }
  { name = "Slap!"
    checksum = netslap
    definition = "mode_netslap"
  }
  { name = "King of the Hill"
    checksum = netking
    definition = "mode_netking"
  }
  { name = "Capture the Flag"
    checksum = netctf
    definition = "mode_netctf"
  }
  { name = "Skate Shop"
    checksum = skateshop
    definition = "mode_skateshop"
  }
  { name = "Park Editor"
    checksum = parkeditor
    definition = "mode_parkeditor"
  }
]
mode_freeskate = {
  name = freeskate
  initial_players = 1
  max_players = 2
  time_limit_type = fixed
  default_time_limit = 0
  victory_condition_type = fixed
  score_frozen = 0
  accumulate_score = 0
  track_trick_score = 1
  degrade_score = 0
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  should_run_intro_camera = 1
  should_run_intro_camera_noncd = 1
  show_ranking_screen = 0
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 0
  num_teams = 0
  is_net = 0
  is_freeskate = 1
}
mode_freeskate2p = {
  name = freeskate
  initial_players = 2
  max_players = 2
  time_limit_type = fixed
  default_time_limit = 0
  victory_condition_type = fixed
  score_frozen = 0
  accumulate_score = 0
  track_trick_score = 1
  degrade_score = 0
  is_lobby = 1
  is_frontend = 0
  screenmode = splitscreen
  should_run_intro_camera = 1
  should_run_intro_camera_noncd = 1
  show_ranking_screen = 0
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 0
  num_teams = 0
  is_net = 0
  is_freeskate = 1
}
mode_singlesession = {
  name = singlesession
  initial_players = 1
  max_players = 1
  time_limit_type = fixed
  default_time_limit = 120
  victory_condition_type = fixed
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 0
  is_career = 0
  is_singlesession = 1
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 1
  num_teams = 0
  is_net = 0
  is_freeskate = 0
}
mode_career = {
  name = career
  initial_players = 1
  max_players = 1
  time_limit_type = fixed
  default_time_limit = 120
  victory_condition_type = fixed
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  should_run_intro_camera = 1
  should_run_intro_camera_noncd = 1
  show_ranking_screen = 0
  is_career = 1
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 1
  num_teams = 0
  is_net = 0
  is_freeskate = 0
}
mode_net = {
  name = net
  initial_players = 1
  max_players = 1
  time_limit_type = fixed
  default_time_limit = 120
  victory_condition_type = fixed
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  should_run_intro_camera = 1
  should_run_intro_camera_noncd = 1
  show_ranking_screen = 0
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 1
  num_teams = 0
  is_net = 1
  is_freeskate = 0
}
mode_trickattack = {
  name = trickattack
  initial_players = 2
  max_players = 2
  time_limit_type = config
  default_time_limit = 120
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = splitscreen
  victory_conditions = [
    { type = highest_score }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 1
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 1
  num_teams = 0
  is_net = 0
  is_freeskate = 0
}
mode_nettrickattack = {
  name = nettrickattack
  initial_players = 1
  max_players = 8
  time_limit_type = config
  default_time_limit = 90
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  victory_conditions = [
    { type = highest_score }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 1
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 1
  timer_beeps = 1
  num_teams = 0
  is_net = 1
  is_freeskate = 0
}
mode_scorechallenge = {
  name = scorechallenge
  initial_players = 2
  max_players = 2
  time_limit_type = config
  default_time_limit = 0
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = splitscreen
  victory_conditions = [
    { type = target_score score = 10000 }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 1
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 1
  num_teams = 0
  is_net = 0
  is_freeskate = 0
}
mode_netscorechallenge = {
  name = netscorechallenge
  initial_players = 1
  max_players = 8
  time_limit_type = config
  default_time_limit = 0
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  victory_conditions = [
    { type = target_score score = 10000 }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 1
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 1
  timer_beeps = 1
  num_teams = 0
  is_net = 1
  is_freeskate = 0
}
mode_combomambo = {
  name = combomambo
  initial_players = 2
  max_players = 2
  time_limit_type = config
  default_time_limit = 120
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 0
  track_best_combo = 1
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = splitscreen
  victory_conditions = [
    { type = highest_score }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 1
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 1
  num_teams = 0
  is_net = 0
  is_freeskate = 0
}
mode_netcombomambo = {
  name = netcombomambo
  initial_players = 1
  max_players = 8
  time_limit_type = config
  default_time_limit = 90
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 0
  track_best_combo = 1
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  victory_conditions = [
    { type = highest_score }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 1
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 1
  timer_beeps = 1
  num_teams = 0
  is_net = 1
  is_freeskate = 0
}
mode_graffiti = {
  name = graffiti
  initial_players = 2
  max_players = 2
  time_limit_type = config
  default_time_limit = 120
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = splitscreen
  victory_conditions = [
    { type = highest_score }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 1
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 1
  num_teams = 0
  is_net = 0
  is_freeskate = 0
}
mode_netgraffiti = {
  name = netgraffiti
  initial_players = 1
  max_players = 8
  time_limit_type = config
  default_time_limit = 90
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  victory_conditions = [
    { type = highest_score }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 1
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 1
  timer_beeps = 1
  num_teams = 0
  is_net = 1
  is_freeskate = 0
}
mode_netgoalattack = {
  name = netgoalattack
  initial_players = 1
  max_players = 8
  time_limit_type = config
  default_time_limit = 0
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 0
  track_trick_score = 1
  degrade_score = 1
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  victory_conditions = [
    { type = complete_goals }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 1
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 0
  num_teams = 0
  is_net = 1
  is_freeskate = 0
}
mode_slap = {
  name = slap
  initial_players = 2
  max_players = 2
  time_limit_type = config
  default_time_limit = 120
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 0
  degrade_score = 0
  is_lobby = 0
  is_frontend = 0
  screenmode = splitscreen
  victory_conditions = [
    { type = highest_score }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 1
  num_teams = 0
  is_net = 0
  is_freeskate = 0
}
mode_netslap = {
  name = netslap
  initial_players = 1
  max_players = 8
  time_limit_type = config
  default_time_limit = 90
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 0
  degrade_score = 0
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  victory_conditions = [
    { type = highest_score }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 1
  timer_beeps = 1
  num_teams = 0
  is_net = 1
  is_freeskate = 0
}
mode_netking = {
  name = netking
  initial_players = 1
  max_players = 8
  time_limit_type = config
  default_time_limit = 0
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 0
  degrade_score = 0
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  victory_conditions = [
    { type = target_score score = 10000 }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 1
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 1
  timer_beeps = 0
  num_teams = 0
  is_net = 1
  is_freeskate = 0
}
mode_king = {
  name = king
  initial_players = 2
  max_players = 2
  time_limit_type = config
  default_time_limit = 0
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 0
  degrade_score = 0
  is_lobby = 0
  is_frontend = 0
  screenmode = splitscreen
  victory_conditions = [
    { type = target_score score = 120000 }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 1
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 0
  num_teams = 0
  is_net = 0
  is_freeskate = 0
}
mode_netctf = {
  name = netctf
  initial_players = 1
  max_players = 8
  time_limit_type = config
  default_time_limit = 0
  victory_condition_type = config
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 0
  degrade_score = 0
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  victory_conditions = [
    { type = target_score score = 5 }
  ]
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_ctf = 1
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  show_leader_messages = 1
  timer_beeps = 0
  num_teams = 0
  is_net = 1
  is_freeskate = 0
}
targetScoreArray = [
  { type = target_score score = 10000 }
]
mode_netlobby = {
  name = netlobby
  initial_players = 1
  max_players = 8
  time_limit_type = fixed
  default_time_limit = 0
  victory_condition_type = fixed
  score_frozen = 0
  accumulate_score = 0
  track_trick_score = 1
  degrade_score = 0
  is_lobby = 1
  is_frontend = 0
  screenmode = single
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 0
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 0
  num_teams = 0
  is_freeskate = 0
  is_net = 1
}
mode_skateshop = {
  name = skateshop
  initial_players = 2
  max_players = 2
  time_limit_type = fixed
  default_time_limit = 0
  victory_condition_type = fixed
  score_frozen = 0
  accumulate_score = 0
  track_trick_score = 0
  degrade_score = 0
  is_lobby = 0
  is_frontend = 1
  screenmode = single
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 0
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 0
  num_teams = 0
  is_freeskate = 0
  is_net = 0
}
mode_parkeditor = {
  name = parkeditor
  initial_players = 1
  max_players = 0
  time_limit_type = fixed
  default_time_limit = 0
  victory_condition_type = fixed
  score_frozen = 0
  accumulate_score = 0
  track_trick_score = 1
  degrade_score = 0
  is_lobby = 0
  is_frontend = 0
  screenmode = single
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 0
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 1
  should_modulate_color = 0
  is_horse = 0
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 0
  num_teams = 0
  is_freeskate = 0
  is_net = 0
}
mode_horse = {
  name = horse
  initial_players = 2
  max_players = 2
  time_limit_type = config
  default_time_limit = 10
  victory_condition_type = fixed
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 1
  degrade_score = 0
  is_lobby = 0
  is_frontend = 0
  screenmode = horse
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 0
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 1
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 0
  num_teams = 0
  is_freeskate = 0
  is_net = 0
}
mode_nethorse = {
  name = nethorse
  initial_players = 1
  max_players = 8
  time_limit_type = config
  default_time_limit = 10
  victory_condition_type = fixed
  score_frozen = 0
  accumulate_score = 1
  track_trick_score = 1
  degrade_score = 0
  is_lobby = 0
  is_frontend = 0
  screenmode = horse
  should_run_intro_camera = 0
  should_run_intro_camera_noncd = 0
  show_ranking_screen = 1
  is_career = 0
  is_singlesession = 0
  is_parkeditor = 0
  should_modulate_color = 0
  is_horse = 1
  is_king = 0
  is_trick_attack = 0
  is_combo_mambo = 0
  is_goal_attack = 0
  is_ctf = 0
  show_leader_messages = 0
  timer_beeps = 0
  num_teams = 0
  is_freeskate = 0
  is_net = 1
}
script force_close_rankings
  Printf "************************* FORCE CLOSING RANKINGS ******************************"
  SetScreenElementProps {
    id = root_window
    event_handlers = [
      { pad_start handle_start_pressed }
    ]
    replace_handlers
  }
  SetButtonEventMappings unblock_menu_input
  if ObjectExists id = rankings_list_anchor
    RunScriptOnScreenElement id = current_menu_anchor menu_offscreen
    remove_rankings_menu_textures_from_vram
    if GameIsOver
      if not GotParam dont_retry
        do_backend_retry
      endif
    endif
  endif
endscript
script close_rankings
  Printf "************************* CLOSING RANKINGS ******************************"
  restore_start_key_binding
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    SetScreenElementProps id = root_window tags = { menu_state = off }
  endif
  Wait 1 frame
  remove_rankings_menu_textures_from_vram
  if GameModeEquals is_singlesession
    create_pause_menu no_exit
  else
    if not GameModeEquals is_lobby
      if InSplitScreenGame
        add_pause_menu_textures_to_vram
        create_end_run_menu
      else
        do_backend_retry
      endif
    endif
  endif
endscript
script wait_then_force_close_rankings
  Wait 5 seconds
  force_close_rankings
  do_backend_retry
endscript
script wait_then_create_rankings
  begin
    if CalculateFinalScores
      break
    endif
    Wait 1 gameframe
  repeat
  create_rankings <...>
endscript
script create_rankings score_title_text = "SCORE"
  EnableHUD
  destroy_observer_ui
  restore_rank_screen_events // Also adds restart game event on square
  Printf "create_rankings"
  if ObjectExists id = dialog_box_anchor
    return
  endif
  pause_trick_text
  exit_pause_menu
  Printf "****************** CREATING RANKINGS!!!! ********************"
  if IsAutoServing
    SpawnScript wait_then_force_close_rankings
  endif
  add_rankings_menu_textures_to_vram
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = rankings_anchor
    pos = (320, 240)
    dims = (640, 480)
  }
  AssignAlias id = rankings_anchor alias = current_menu_anchor
  create_helper_text rank_screen_helper_text
  CreateScreenElement {
    type = ContainerElement
    parent = rankings_anchor
    id = player_list_anchor
    pos = (320, 240)
    dims = (640, 480)
  }
  CreateScreenElement {
    type = SpriteElement
    parent = rankings_anchor
    texture = options_bg
    pos = (87, 71)
    just = [ left top ]
    z_priority = -2
  }
  CreateScreenElement {
    type = SpriteElement
    parent = rankings_anchor
    texture = PA_goals
    pos = (97, 89)
    just = [ center center ]
    rgba = [ 127 102 0 128 ]
  }
  CreateScreenElement {
    type = TextElement
    parent = rankings_anchor
    font = testtitle
    text = "RANKINGS"
    pos = (125, 70)
    scale = 1.4
    rgba = [ 128 128 128 85 ]
    just = [ left top ]
  }
  CreateScreenElement {
    type = VMenu
    parent = player_list_anchor
    id = player_list_menu
    font = small
    just = [ left top ]
    pos = (105, 100)
    internal_just = [ left top ]
  }
  CreateScreenElement {
    type = ContainerElement
    parent = player_list_menu
    dims = (256, 21)
    not_focusable
  }
  CreateScreenElement {
    type = TextElement
    parent = <id>
    font = small
    text = "PLAYER"
    pos = (128, 0)
    just = [ center top ]
    rgba = [ 127 102 0 85 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = player_list_anchor
    texture = black
    pos = (94, 99)
    rgba = [ 0 0 0 90 ]
    scale = (116.08, 6.1)
    just = [ left top ]
    z_priority = -1
  }
  CreateScreenElement {
    type = SpriteElement
    parent = player_list_anchor
    texture = black
    pos = (94, 118)
    rgba = [ 127 102 0 65 ]
    scale = (116.08, 0.7)
    just = [ left top ]
    z_priority = 20
  }
  CreateScreenElement {
    type = SpriteElement
    parent = player_list_anchor
    texture = black
    pos = (111, 98)
    rgba = [ 46 73 113 55 ]
    scale = (112.08, 0.6)
    just = [ left top ]
    z_priority = 0
  }
  CreateScreenElement {
    type = ContainerElement
    parent = rankings_anchor
    id = rankings_list_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  CreateScreenElement {
    type = VMenu
    parent = rankings_list_anchor
    id = rankings_list_menu
    just = [ left top ]
    pos = (375, 100)
    internal_just = [ left top ]
  }
  CreateScreenElement {
    type = ContainerElement
    parent = rankings_list_menu
    dims = (205, 21)
    not_focusable
  }
  CreateScreenElement {
    type = TextElement
    parent = <id>
    font = dialog
    text = <score_title_text>
    pos = (85, 0)
    just = [ center top ]
    rgba = [ 127 102 0 85 ]
    not_focusable
  }
  kill_start_key_binding
  FillRankingScreen
  CreateScreenElement {
    type = ContainerElement
    parent = rankings_anchor
    id = rankings_done_anchor
    dims = (640, 480)
    pos = (320, 240)
  }
  SetScreenElementLock id = player_list_menu on
  GetStackedScreenElementPos y id = player_list_menu offset = (210, 20)
  SetScreenElementLock id = player_list_menu off
  CreateScreenElement {
    type = TextElement
    parent = rankings_done_anchor
    id = rankings_done_button
    font = small
    text = "Done"
    pos = <pos>
    rgba = [ 127 102 0 128 ]
    just = [ center top ]
    event_handlers = [ { focus do_scale_up }
      { unfocus do_scale_down }
      { pad_choose close_rankings }
      { pad_start close_rankings }
    ]
  }
  AssignAlias id = rankings_done_button alias = current_menu
  CreateScreenElement {
    type = SpriteElement
    parent = rankings_done_anchor
    texture = black
    pos = ( <pos> - (5, 0) )
    z_priority = 0
    scale = (18, 5)
    just = [ center top ]
    rgba = [ 0 0 0 100 ]
  }
  GetStackedScreenElementPos x id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = rankings_done_anchor
    texture = goal_right
    pos = ( <pos> - (11, 0) )
    z_priority = 0
    scale = (0.6, 0.07)
    just = [ left top ]
    rgba = [ 0 0 0 90 ]
  }
  GetStackedScreenElementPos x id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = rankings_done_anchor
    texture = stats_notch
    pos = ( <pos> - (78, -3) )
    scale = (4.1, 1.1)
    just = [ left top ]
    rgba = [ 100 100 100 30 ]
  }
  RunScriptOnScreenElement id = current_menu_anchor dialog_box_delay_input params = { delay_input_time = 2000 }
  RunScriptOnScreenElement id = current_menu_anchor menu_onscreen
  FireEvent type = focus target = rankings_done_button
endscript
script player_menu_add_item font = small
  Printf "player_menu_add_item"
  SetScreenElementLock id = <parent> off
  if GotParam team_score
     <text_just> = [ right top ]
     <text_pos> = (230, 0)
     <container_dims> = (256, 24)
     <end_cap_scale> = (1, 5)
  else
     <text_just> = [ left top ]
     <text_pos> = (0, 0)
     <container_dims> = (256, 21)
     <end_cap_scale> = (1, 5.25)
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    dims = <container_dims>
    not_focusable
  }
   <container_id> = <id>
  CreateScreenElement {
    type = TextElement
    parent = <container_id>
    font = <font>
    text = <text>
    pos = <text_pos>
    just = <text_just>
    rgba = [ 85 85 85 128 ]
  }
  Printf "creating bg element"
  CreateScreenElement {
    type = SpriteElement
    parent = <container_id>
    texture = stats_bg
    pos = (-10, 0)
    just = [ left top ]
    rgba = [ 20 20 30 70 ]
    z_priority = -1
  }
  GetStackedScreenElementPos x id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = <container_id>
    texture = black
    pos = <pos>
    just = [ left top ]
    scale = <end_cap_scale>
    rgba = [ 0 0 0 98 ]
  }
  if GotParam team_score
    CreateScreenElement {
      type = SpriteElement
      parent = <container_id>
      texture = black
      rgba = [ 127 102 0 88 ]
      scale = (116.25, 0.55)
      pos = (-10, 21)
      just = [ left top ]
    }
  endif
  SetScreenElementLock id = <parent> on
endscript
script score_menu_add_item
  if GotParam team_score
     <container_dims> = (205, 24)
  else
     <container_dims> = (205, 21)
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    dims = <container_dims>
    not_focusable
  }
   <container_id> = <id>
  CreateScreenElement {
    type = TextElement
    parent = <container_id>
    font = dialog
    text = <text>
    pos = (85, 0)
    rgba = [ 85 85 85 128 ]
    just = [ center top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <container_id>
    texture = stats_bg
    pos = (-20, 0)
    scale = (0.8, 1)
    rgba = [ 128 128 128 80 ]
    just = [ left top ]
  }
endscript
script add_rankings_menu_textures_to_vram
  AddTextureToVram "stats_bg"
  AddTextureToVram "goal_right"
  AddTextureToVram "stats_notch"
  AddTextureToVram "pa_goals"
endscript
script remove_rankings_menu_textures_from_vram
  RemoveTextureFromVram "stats_bg"
  RemoveTextureFromVram "stats_notch"
  RemoveTextureFromVram "goal_right"
  RemoveTextureFromVram "pa_goals"
endscript
