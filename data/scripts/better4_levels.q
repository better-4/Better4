// THPS4 LevelNums end with 10 for CAP, leave 11 for MotoX

LevelNum_LA = 12
LevelNum_Aus = 13
LevelNum_Airport = 14

thps3_level_info = [
  { text = "Los Angeles" level_num = LevelNum_LA points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_SCH level = Load_LA taxi_id = Cab_sign_10_Custom }
  { text = "Australia" level_num = LevelNum_Aus points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_SCH level = Load_Aus taxi_id = Cab_sign_10_Custom }
  { text = "Airport" level_num = LevelNum_Airport points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_SCH level = Load_AP taxi_id = Cab_sign_10_Custom }
]

script Load_LA
  load_level level_la
endscript

level_la = {
  structure_name = level_la
  load_script = Load_LA
  name = "LA"
  ambient_track = "music\amb_alc"
  loading_screen = "better4\loadscrn_LA"
  loading_time = 15
  pre = "la.pre"
  scnpre = "lascn.pre"
  level = "LA"
  sky = "Alc_Sky"
  qb = "levels\la\la.qb"
  level_qb = "levels\la\la_scripts.qb"
  colpre = "lacol.pre"
  pedpre = "laped.pre"
  startup_script = LA_Startup
  goals_script = la_goals
  setup_script = la_setup
  default_stats = 10
  level_number = LevelNum_LA
  temp_script = load_cameras_and_terrains
  // extranetanimsscript = load_level_anims
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.5
  heading_0 = 90.0
  pitch_0 = -60.0
  red_0 = 75
  green_0 = 75
  blue_0 = 75
  mod_factor_0 = 0.7
  heading_1 = 0.0
  pitch_1 = -90.0
  red_1 = 0
  green_1 = 0
  blue_1 = 0
  mod_factor_1 = 1.0
}

script Load_Aus
  load_level level_aus
endscript

level_aus = {
  structure_name = level_aus
  load_script = Load_Aus
  name = "Australia"
  ambient_track = "music\amb_alc"
  loading_screen = "loadscrn_generic"
  loading_time = 15
  pre = "aus.pre"
  scnpre = "ausscn.pre"
  level = "Aus"
  sky = "Alc_Sky"
  qb = "levels\aus\aus.qb"
  level_qb = "levels\aus\aus_scripts.qb"
  colpre = "auscol.pre"
  pedpre = "ausped.pre"
  // startup_script = Aus_Startup
  // goals_script = aus_goals
  // setup_script = aus_setup
  default_stats = 10
  level_number = LevelNum_Aus
  // temp_script = load_cameras_and_terrains
  // extranetanimsscript = load_level_anims
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.5
  heading_0 = 90.0
  pitch_0 = -60.0
  red_0 = 75
  green_0 = 75
  blue_0 = 75
  mod_factor_0 = 0.7
  heading_1 = 0.0
  pitch_1 = -90.0
  red_1 = 0
  green_1 = 0
  blue_1 = 0
  mod_factor_1 = 1.0
}

script Load_AP
  load_level level_ap
endscript

level_ap = {
  structure_name = level_ap
  load_script = Load_AP
  name = "Airport"
  ambient_track = "music\amb_alc"
  loading_screen = "loadscrn_generic"
  loading_time = 15
  pre = "ap.pre"
  scnpre = "apscn.pre"
  level = "AP"
  sky = "Alc_Sky"
  qb = "levels\ap\ap.qb"
  level_qb = "levels\ap\ap_scripts.qb"
  colpre = "apcol.pre"
  pedpre = "apped.pre"
  // startup_script = AP_Startup
  // goals_script = ap_goals
  // setup_script = ap_setup
  default_stats = 10
  level_number = LevelNum_Airport
  // temp_script = load_cameras_and_terrains
  // extranetanimsscript = load_level_anims
  ambient_red = 72
  ambient_green = 72
  ambient_blue = 72
  ambient_mod_factor = 0.5
  heading_0 = 90.0
  pitch_0 = -60.0
  red_0 = 75
  green_0 = 75
  blue_0 = 75
  mod_factor_0 = 0.7
  heading_1 = 0.0
  pitch_1 = -90.0
  red_1 = 0
  green_1 = 0
  blue_1 = 0
  mod_factor_1 = 1.0
}
