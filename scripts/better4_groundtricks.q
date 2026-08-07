script check_ground_and_jump_keys
  get_powerslide_key
  get_jumptricks
  get_nollie_key
  SetQueueTricks ( ( PowerSlideKeyTable[ <powerslide_key> ] ).table ) ( ( JumptricksTable[ <jumptrick> ] ).table ) GroundTricks ( ( ToggleNollieKeyTable[ <nollie_key> ] ).table )
endscript
script check_ground_keys
  get_powerslide_key
  get_nollie_key
  SetQueueTricks  ( ( PowerSlideKeyTable[ <powerslide_key> ] ).table ) GroundTricks ( ( ToggleNollieKeyTable[ <nollie_key> ] ).table )
endscript
script clear_ground_keys
  get_powerslide_key
  get_nollie_key
  ClearTricksFrom  ( ( PowerSlideKeyTable[ <powerslide_key> ] ).table ) GroundTricks ( ( ToggleNollieKeyTable[ <nollie_key> ] ).table )
endscript
