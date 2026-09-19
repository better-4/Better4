// To add a new level:
//
// * Verify the level has a unique LevelNum assigned
// * Create a `Load_*` script and `level_*` structure
// * Add it to the appropriate `level_info` array;
//   make sure `not_focusable` is not set and `level = Load_*` is set
// * Add the level's files in Better4 repo under `data/levels/<level>`
// * Add path overrides in Better4 repo in `src/load.c` for col/scn/tex

// THPS1
LevelNum_Warehouse = 13
LevelNum_School = 14
LevelNum_Mall = 15
LevelNum_Skatepark = 16
LevelNum_Downtown = 17
LevelNum_DHJ = 18
LevelNum_Burnside = 19
LevelNum_Streets = 20
LevelNum_Roswell = 21

// THPS2
LevelNum_Hangar = 22
LevelNum_School2 = 23
LevelNum_Marseille = 24
LevelNum_NYC = 25
LevelNum_Venice = 26
LevelNum_Skatestreet = 27
LevelNum_Philly = 28
LevelNum_Bullring = 29
LevelNum_Heaven = 30
LevelNum_Chopper = 31

// THPS3
LevelNum_Foundry = 32
LevelNum_Canada = 33
LevelNum_Rio = 34
LevelNum_Suburbia = 35
LevelNum_Airport = 36
LevelNum_SkaterIsland = 37
LevelNum_LA = 12
LevelNum_Tokyo = 38
LevelNum_CruiseShip = 39

level_info_defaults = { points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_SCH taxi_id = Cab_sign_10_Custom }

thps_level_info = [
  { text = "Warehouse" not_focusable level_num = LevelNum_Warehouse level = Load_Warehouse level_info_defaults }
  { text = "School" not_focusable level_num = LevelNum_School level = Load_School level_info_defaults }
  { text = "Mall" not_focusable level_num = LevelNum_Mall level = Load_Mall level_info_defaults }
  { text = "Skatepark" not_focusable level_num = LevelNum_Skatepark level = Load_Skatepark level_info_defaults }
  { text = "Downtown" not_focusable level_num = LevelNum_Downtown level = Load_Downtown level_info_defaults }
  { text = "Downhill Jam" not_focusable level_num = LevelNum_DHJ level = Load_DHJ level_info_defaults }
  { text = "Burnside" not_focusable level_num = LevelNum_Burnside level = Load_Burnside level_info_defaults }
  { text = "Streets" not_focusable level_num = LevelNum_Streets level = Load_Streets level_info_defaults }
  { text = "Roswell" not_focusable level_num = LevelNum_Roswell level = Load_Roswell level_info_defaults }
]

thps2_level_info = [
  { text = "Hangar" not_focusable level_num = LevelNum_Hangar level = Load_Hangar level_info_defaults }
  { text = "School II" not_focusable level_num = LevelNum_School2 level = Load_School2 level_info_defaults }
  { text = "Marseille" not_focusable level_num = LevelNum_Marseille level = Load_Marseille level_info_defaults }
  { text = "New York City" not_focusable level_num = LevelNum_NYC level = Load_NYC level_info_defaults }
  { text = "Venice" not_focusable level_num = LevelNum_Venice level = Load_Venice level_info_defaults }
  { text = "Skatestreet" not_focusable level_num = LevelNum_Skatestreet level = Load_Skatestreet level_info_defaults }
  { text = "Philly" not_focusable level_num = LevelNum_Philly level = Load_Philly level_info_defaults }
  { text = "Bullring" not_focusable level_num = LevelNum_Bullring level = Load_Bullring level_info_defaults }
  { text = "Skate Heaven" not_focusable level_num = LevelNum_Heaven level = Load_Heaven level_info_defaults }
  { text = "Chopper Drop" not_focusable level_num = LevelNum_Chopper level = Load_Chopper level_info_defaults }
]

thps3_level_info = [
  { text = "Foundry" not_focusable level_num = LevelNum_Foundry level = Load_Foundry level_info_defaults }
  { text = "Canada" not_focusable level_num = LevelNum_Canada level = Load_Canada level_info_defaults }
  { text = "Rio" not_focusable level_num = LevelNum_Rio level = Load_Rio level_info_defaults }
  { text = "Suburbia" not_focusable level_num = LevelNum_Suburbia level = Load_Suburbia level_info_defaults }
  { text = "Airport" not_focusable level_num = LevelNum_Airport level = Load_Airport level_info_defaults }
  { text = "Skater Island" not_focusable level_num = LevelNum_SkaterIsland level = Load_SkaterIsland level_info_defaults }
  { text = "Los Angeles" level_num = LevelNum_LA level = Load_LA level_info_defaults  }
  { text = "Tokyo" not_focusable level_num = LevelNum_Tokyo level = Load_Tokyo level_info_defaults }
  { text = "Cruise Ship" not_focusable level_num = LevelNum_CruiseShip level = Load_CruiseShip level_info_defaults }
]

level_defaults = {
  loading_time = 1
  default_stats = 10
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

script Load_LA
  load_level level_la
endscript

level_la = {
  structure_name = level_la
  load_script = Load_LA
  name = "LA"
  level = "LA" // This value is used in filepaths, e.g. `data/levels/<level>/<level>col.dat`
  qb = "levels\better4\la\la.qb" // Path to the main level QB file containing nodearray etc.
  level_qb = "levels\better4\la\la_scripts.qb" // Path to auxiliary level QB scripts
  sky = "Alc_Sky"
  ambient_track = "music\amb_alc"
  loading_screen = "better4\loadscrn_LA"
  startup_script = LA_Startup
  goals_script = la_goals
  setup_script = la_setup
  level_number = LevelNum_LA
  temp_script = load_cameras_and_terrains
  // extranetanimsscript = load_level_anims
  level_defaults
}
