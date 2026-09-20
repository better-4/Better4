// To add a new level:
//
// * Verify the level has a unique LevelNum assigned
// * Create a `Load_*` script and `level_*` structure
// * Add it to the appropriate `level_info` array;
//   make sure `not_focusable` is not set and `level = Load_*` is set
// * Add the level's files in Better4 repo under `data/levels/<level>`
// * Add path overrides in Better4 repo in `src/load.c` for col/scn/tex

// THPS1
LevelNum_Warehouse = 0
LevelNum_School = 0
LevelNum_Mall = 0
LevelNum_Vans = 13
LevelNum_Downtown = 0
LevelNum_DHJ = 0
LevelNum_Burnside = 0
LevelNum_Streets = 0
LevelNum_Roswell = 0

// THPS2
LevelNum_Hangar = 0
LevelNum_School2 = 0
LevelNum_Marseille = 0
LevelNum_NYC = 0
LevelNum_Venice = 0
LevelNum_Skatestreet = 0
LevelNum_Philly = 0
LevelNum_Bullring = 0
LevelNum_Heaven = 0
LevelNum_Chopper = 0

// THPS3
LevelNum_Foundry = 0
LevelNum_Canada = 0
LevelNum_Rio = 0
LevelNum_Suburbia = 0
LevelNum_Airport = 0
LevelNum_SkaterIsland = 0
LevelNum_LA = 12
LevelNum_Tokyo = 0
LevelNum_CruiseShip = 0

level_info_defaults = { points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_SCH taxi_id = Cab_sign_10_Custom }

thps_level_info = [
  { text = "Warehouse" not_focusable level_num = LevelNum_Warehouse level = Load_Warehouse level_info_defaults }
  { text = "School" not_focusable level_num = LevelNum_School level = Load_School level_info_defaults }
  { text = "Mall" not_focusable level_num = LevelNum_Mall level = Load_Mall level_info_defaults }
  { text = "Skatepark" level_num = LevelNum_Vans level = Load_Vans level_info_defaults }
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

// THPS

script Load_Vans
  load_level level_vans
endscript

level_vans = {
  structure_name = level_vans
  load_script = Load_Vans
  name = "Skatepark"
  level = "Vans"
  qb = "levels\better4\vans\vans.qb"
  level_qb = "levels\better4\vans\vans_scripts.qb"
  sky = "Alc_Sky"
  ambient_track = "music\amb_alc"
  loading_screen = "loadscrn_generic"
  startup_script = Vans_Startup
  goals_script = vans_goals
  setup_script = vans_setup
  level_number = LevelNum_Vans
  temp_script = load_cameras_and_terrains
  // extranetanimsscript = load_level_anims
  level_defaults
}

// THPS3

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
