// To add a new category:
//
// * Add a new deck category under `better4_deck_categories`. Use `is_pro = 1` and any unique `name`.
// * Reserve 10 empty slots in `deck_graphic` (add `{ skater = <category_name>, hidden = 1 }` 10 times).
//
// To add a new deck graphic:
//
// * Find an applicable slot in the `deck_graphic` array to add the deck to. If an empty slot is available, use that one;
//   if the category's page is full, add another 10 slots.
// * Add its entry in the `deck_graphic` array at that slot, filling out all required fields:
//   * desc_id = <a unique id for the graphic>
//   * frontend_desc = <display name for the graphic>
//   * common_deck_graphic_params <always required>
//   * with = <path to the board graphic's texture>
//   * skater = <category name>
//   * flag = BOARD_UNLOCKED_CASB01 <whether the board is unlocked; default to CASB01 for always-unlocked>
//
// NOTE: Due to the way the THPS4 deck selector works, the size of the `deck_graphic` array must be a multiple of 10.
// Each group of 10 should share the same `skater` symbol, which must map to a deck category's `name` symbol.

better4_deck_categories = [
  {
    display_name = "Tony Hawk"
    name = hawk
    is_pro = 1
  }
  {
    display_name = "Bob Burnquist"
    name = burnquist
    is_pro = 1
  }
  {
    display_name = "Steve Caballero"
    name = caballero
    is_pro = 1
  }
  {
    display_name = "Kareem Campbell"
    name = campbell
    is_pro = 1
  }
  {
    display_name = "Rune Glifberg"
    name = glifberg
    is_pro = 1
  }
  {
    display_name = "Eric Koston"
    name = koston
    is_pro = 1
  }
  {
    display_name = "Bucky Lasek"
    name = lasek
    is_pro = 1
  }
  {
    display_name = "Bam Margera"
    name = margera
    is_pro = 1
  }
  {
    display_name = "Rodney Mullen"
    name = mullen
    is_pro = 1
  }
  {
    display_name = "Chad Muska"
    name = muska
    is_pro = 1
  }
  {
    display_name = "Andrew Reynolds"
    name = reynolds
    is_pro = 1
  }
  {
    display_name = "Geoff Rowley"
    name = rowley
    is_pro = 1
  }
  {
    display_name = "Elissa Steamer"
    name = steamer
    is_pro = 1
  }
  {
    display_name = "Jamie Thomas"
    name = thomas
    is_pro = 1
  }
  {
    display_name = "Custom Skater"
    name = custom
    is_pro = 0
  }
  {
    display_name = "Eddie"
    name = eddie
    is_pro = 1
  }
  {
    display_name = "Jango Fett"
    name = Jango
    is_pro = 1
  }
  {
    display_name = "Mike Vallely"
    name = vallely
    is_pro = 1
  }
  {
    display_name = "Daisy"
    name = jenna
    is_pro = 1
  }

  // Custom page example 1

  // {
  //   display_name = "Baker"
  //   name = baker
  //   is_pro = 1
  // }

  // Custom page example 2

  // {
  //   display_name = "Baker 2"
  //   name = baker2
  //   is_pro = 1
  // }
]

common_deck_graphic_params =
{
  replace = "CS_NH_board_default.png"
  in = board
  hidden = 0
}
deck_graphic = [
  {
    desc_id = None
    frontend_desc = 'None'
    skater = None
  }
  {
    desc_id = #"Hawk 1"
    frontend_desc = 'Falcon Egg'
    common_deck_graphic_params
    with = "textures/boards/HawkB01"
    skater = hawk
    flag = BOARD_UNLOCKED_HAWKB01
  }
  {
    desc_id = #"Hawk 2"
    frontend_desc = 'Hawk Emblem'
    common_deck_graphic_params
    with = "textures/boards/HawkB02"
    skater = hawk
    flag = BOARD_UNLOCKED_HAWKB02
  }
  {
    desc_id = #"Hawk 3"
    frontend_desc = 'Tony Ape'
    common_deck_graphic_params
    with = "textures/boards/HawkB03"
    skater = hawk
    flag = BOARD_UNLOCKED_HAWKB03
  }
  {
    desc_id = #"Hawk 4"
    frontend_desc = 'Pterodactyl - Black'
    common_deck_graphic_params
    with = "textures/boards/HawkB04"
    skater = hawk
    flag = BOARD_UNLOCKED_HAWKB04
  }
  {
    desc_id = #"Hawk 5"
    frontend_desc = 'Skele-Hawk'
    common_deck_graphic_params
    with = "textures/boards/HawkB05"
    skater = hawk
    flag = BOARD_UNLOCKED_HAWKB05
  }
  {
    desc_id = #"Hawk 6"
    frontend_desc = 'Tony Photo'
    common_deck_graphic_params
    with = "textures/boards/HawkB06"
    skater = hawk
    flag = BOARD_UNLOCKED_HAWKB06
  }
  {
    desc_id = #"Hawk 7"
    frontend_desc = 'Birdman Crest'
    common_deck_graphic_params
    with = "textures/boards/HawkB07"
    RotateDeckLeft
    skater = hawk
    flag = BOARD_UNLOCKED_HAWKB07
  }
  {
    desc_id = #"Hawk 8"
    frontend_desc = 'Water Photo'
    common_deck_graphic_params
    with = "textures/boards/HawkB08"
    skater = hawk
    flag = BOARD_UNLOCKED_HAWKB08
  }
  {
    desc_id = #"Hawk 9"
    frontend_desc = 'Birdhouse Logo'
    common_deck_graphic_params
    with = "textures/boards/HawkB09"
    skater = hawk
    flag = BOARD_UNLOCKED_HAWKB09
  }
  {
    desc_id = #"Hawk 10"
    frontend_desc = 'Pterodactyl - White'
    common_deck_graphic_params
    with = "textures/boards/HawkB10"
    skater = hawk
    flag = BOARD_UNLOCKED_HAWKB10
  }
  {
    desc_id = #"Burnquist 1"
    frontend_desc = 'Burnquist - BB Black'
    common_deck_graphic_params
    with = "textures/boards/BurnquistB01"
    skater = Burnquist
    flag = BOARD_UNLOCKED_BURNQUISTB01
  }
  {
    desc_id = #"Burnquist 2"
    frontend_desc = 'Burnquist - BB Green'
    common_deck_graphic_params
    with = "textures/boards/BurnquistB02"
    skater = Burnquist
    flag = BOARD_UNLOCKED_BURNQUISTB02
  }
  {
    desc_id = #"Burnquist 3"
    frontend_desc = 'Liquid Helium'
    common_deck_graphic_params
    with = "textures/boards/BurnquistB03"
    skater = Burnquist
    flag = BOARD_UNLOCKED_BURNQUISTB03
  }
  {
    desc_id = #"Burnquist 4"
    frontend_desc = 'Hands'
    common_deck_graphic_params
    with = "textures/boards/BurnquistB04"
    skater = Burnquist
    flag = BOARD_UNLOCKED_BURNQUISTB04
  }
  {
    desc_id = #"Burnquist 5"
    frontend_desc = 'Puppet Icon'
    common_deck_graphic_params
    with = "textures/boards/BurnquistB05"
    skater = Burnquist
    flag = BOARD_UNLOCKED_BURNQUISTB05
  }
  {
    desc_id = #"Burnquist 6"
    frontend_desc = 'Ace'
    common_deck_graphic_params
    with = "textures/boards/BurnquistB06"
    skater = Burnquist
    flag = BOARD_UNLOCKED_BURNQUISTB06
  }
  {
    desc_id = #"Burnquist 7"
    frontend_desc = 'Burnquist Space Ace'
    common_deck_graphic_params
    with = "textures/boards/BurnquistB07"
    skater = Burnquist
    flag = BOARD_UNLOCKED_BURNQUISTB07
  }
  {
    desc_id = #"Burnquist 8"
    frontend_desc = 'Rocket Man'
    common_deck_graphic_params
    with = "textures/boards/BurnquistB08"
    skater = Burnquist
    flag = BOARD_UNLOCKED_BURNQUISTB08
  }
  {
    desc_id = #"Burnquist 9"
    frontend_desc = 'Air Mocca'
    common_deck_graphic_params
    with = "textures/boards/BurnquistB09"
    skater = Burnquist
    flag = BOARD_UNLOCKED_BURNQUISTB09
  }
  {
    desc_id = #"Burnquist 10"
    frontend_desc = 'Roulette'
    common_deck_graphic_params
    with = "textures/boards/BurnquistB10"
    skater = Burnquist
    flag = BOARD_UNLOCKED_BURNQUISTB10
  }
  {
    desc_id = #"Caballero 1"
    frontend_desc = 'Chinese Dragon'
    common_deck_graphic_params
    with = "textures/boards/CaballeroB01"
    skater = Caballero
    RotateDeckRight
    flag = BOARD_UNLOCKED_CABALLEROB01
  }
  {
    desc_id = #"Caballero 2"
    frontend_desc = 'Face Series - 2000'
    common_deck_graphic_params
    with = "textures/boards/CaballeroB02"
    skater = Caballero
    flag = BOARD_UNLOCKED_CABALLEROB02
  }
  {
    desc_id = #"Caballero 3"
    frontend_desc = 'Shoe Dragon'
    common_deck_graphic_params
    with = "textures/boards/CaballeroB03"
    skater = Caballero
    flag = BOARD_UNLOCKED_CABALLEROB03
  }
  {
    desc_id = #"Caballero 4"
    frontend_desc = 'Ape'
    common_deck_graphic_params
    with = "textures/boards/CaballeroB04"
    skater = Caballero
    flag = BOARD_UNLOCKED_CABALLEROB04
  }
  {
    desc_id = #"Caballero 5"
    frontend_desc = 'Cab Guitar'
    common_deck_graphic_params
    with = "textures/boards/CaballeroB05"
    skater = Caballero
    flag = BOARD_UNLOCKED_CABALLEROB05
  }
  {
    desc_id = #"Caballero 6"
    frontend_desc = 'Dragon - 2000'
    common_deck_graphic_params
    with = "textures/boards/CaballeroB06"
    skater = Caballero
    flag = BOARD_UNLOCKED_CABALLEROB06
  }
  {
    desc_id = #"Caballero 7"
    frontend_desc = 'Classic Dragon - 1999'
    common_deck_graphic_params
    with = "textures/boards/CaballeroB07"
    skater = Caballero
    RotateDeckLeft
    flag = BOARD_UNLOCKED_CABALLEROB07
  }
  {
    desc_id = #"Caballero 8"
    frontend_desc = 'Cab Skull - Orange'
    common_deck_graphic_params
    with = "textures/boards/CaballeroB08"
    skater = Caballero
    flag = BOARD_UNLOCKED_CABALLEROB08
  }
  {
    desc_id = #"Caballero 9"
    frontend_desc = 'Cab Inkblot'
    common_deck_graphic_params
    with = "textures/boards/CaballeroB09"
    skater = Caballero
    flag = BOARD_UNLOCKED_CABALLEROB09
  }
  {
    desc_id = #"Caballero 10"
    frontend_desc = 'Ban This'
    common_deck_graphic_params
    with = "textures/boards/CaballeroB10"
    skater = Caballero
    flag = BOARD_UNLOCKED_CABALLEROB10
  }
  {
    desc_id = #"Campbell 1"
    frontend_desc = 'City Stars 1'
    common_deck_graphic_params
    with = "textures/boards/CampbellB01"
    skater = Campbell
    RotateDeckLeft
    flag = BOARD_UNLOCKED_CAMPBELLB01
  }
  {
    desc_id = #"Campbell 2"
    frontend_desc = 'City Stars 2'
    common_deck_graphic_params
    with = "textures/boards/CampbellB02"
    skater = Campbell
    flag = BOARD_UNLOCKED_CAMPBELLB02
  }
  {
    desc_id = #"Campbell 3"
    frontend_desc = 'Campbell 1'
    common_deck_graphic_params
    with = "textures/boards/CampbellB03"
    skater = Campbell
    flag = BOARD_UNLOCKED_CAMPBELLB03
  }
  {
    desc_id = #"Campbell 4"
    frontend_desc = 'Campbell 2'
    common_deck_graphic_params
    with = "textures/boards/CampbellB04"
    skater = Campbell
    RotateDeckLeft
    flag = BOARD_UNLOCKED_CAMPBELLB04
  }
  {
    desc_id = #"Campbell 5"
    frontend_desc = 'B-ball'
    common_deck_graphic_params
    with = "textures/boards/CampbellB05"
    skater = Campbell
    flag = BOARD_UNLOCKED_CAMPBELLB05
  }
  {
    desc_id = #"Campbell 6"
    frontend_desc = 'Database Overload'
    common_deck_graphic_params
    with = "textures/boards/CampbellB06"
    skater = Campbell
    RotateDeckLeft
    flag = BOARD_UNLOCKED_CAMPBELLB06
  }
  {
    desc_id = #"Campbell 7"
    frontend_desc = 'Beat Box'
    common_deck_graphic_params
    with = "textures/boards/CampbellB07"
    skater = Campbell
    RotateDeckLeft
    flag = BOARD_UNLOCKED_CAMPBELLB07
  }
  {
    desc_id = #"Campbell 8"
    frontend_desc = 'Campbell 3'
    common_deck_graphic_params
    with = "textures/boards/CampbellB08"
    skater = Campbell
    flag = BOARD_UNLOCKED_CAMPBELLB08
  }
  {
    desc_id = #"Campbell 9"
    frontend_desc = 'Chicken Heads'
    common_deck_graphic_params
    with = "textures/boards/CampbellB09"
    skater = Campbell
    flag = BOARD_UNLOCKED_CAMPBELLB09
  }
  {
    desc_id = #"Campbell 10"
    frontend_desc = 'City Stars DJ'
    common_deck_graphic_params
    with = "textures/boards/CampbellB10"
    skater = Campbell
    flag = BOARD_UNLOCKED_CAMPBELLB10
  }
  {
    desc_id = #"Glifberg 1"
    frontend_desc = 'Victory - Denmark'
    common_deck_graphic_params
    with = "textures/boards/GlifbergB01"
    skater = Glifberg
    RotateDeckRight
    flag = BOARD_UNLOCKED_GLIFBERGB01
  }
  {
    desc_id = #"Glifberg 2"
    frontend_desc = 'TV Logo 1'
    common_deck_graphic_params
    with = "textures/boards/GlifbergB02"
    skater = Glifberg
    RotateDeckRight
    flag = BOARD_UNLOCKED_GLIFBERGB02
  }
  {
    desc_id = #"Glifberg 3"
    frontend_desc = 'Buzz Bomb'
    common_deck_graphic_params
    with = "textures/boards/GlifbergB03"
    skater = Glifberg
    flag = BOARD_UNLOCKED_GLIFBERGB03
  }
  {
    desc_id = #"Glifberg 4"
    frontend_desc = 'Sorry Logo - Red'
    common_deck_graphic_params
    with = "textures/boards/GlifbergB04"
    skater = Glifberg
    flag = BOARD_UNLOCKED_GLIFBERGB04
  }
  {
    desc_id = #"Glifberg 5"
    frontend_desc = 'Pixelated'
    common_deck_graphic_params
    with = "textures/boards/GlifbergB05"
    skater = Glifberg
    RotateDeckRight
    flag = BOARD_UNLOCKED_GLIFBERGB05
  }
  {
    desc_id = #"Glifberg 6"
    frontend_desc = 'HKD'
    common_deck_graphic_params
    with = "textures/boards/GlifbergB06"
    skater = Glifberg
    RotateDeckRight
    flag = BOARD_UNLOCKED_GLIFBERGB06
  }
  {
    desc_id = #"Glifberg 7"
    frontend_desc = 'Mask'
    common_deck_graphic_params
    with = "textures/boards/GlifbergB07"
    skater = Glifberg
    flag = BOARD_UNLOCKED_GLIFBERGB07
  }
  {
    desc_id = #"Glifberg 8"
    frontend_desc = 'Sorry Logo - Blue'
    common_deck_graphic_params
    with = "textures/boards/GlifbergB08"
    skater = Glifberg
    RotateDeckRight
    flag = BOARD_UNLOCKED_GLIFBERGB08
  }
  {
    desc_id = #"Glifberg 9"
    frontend_desc = 'TV Logo 2'
    common_deck_graphic_params
    with = "textures/boards/GlifbergB09"
    skater = Glifberg
    flag = BOARD_UNLOCKED_GLIFBERGB09
  }
  {
    desc_id = #"Glifberg 10"
    frontend_desc = 'Sprite Bomb'
    common_deck_graphic_params
    with = "textures/boards/GlifbergB10"
    skater = Glifberg
    RotateDeckRight
    flag = BOARD_UNLOCKED_GLIFBERGB10
  }
  {
    desc_id = #"Koston 1"
    frontend_desc = 'Koston OG'
    common_deck_graphic_params
    with = "textures/boards/KostonB01"
    skater = Koston
    flag = BOARD_UNLOCKED_KOSTONB01
  }
  {
    desc_id = #"Koston 2"
    frontend_desc = 'Koston B-Ball'
    common_deck_graphic_params
    with = "textures/boards/KostonB02"
    skater = Koston
    flag = BOARD_UNLOCKED_KOSTONB02
  }
  {
    desc_id = #"Koston 3"
    frontend_desc = 'Koston College'
    common_deck_graphic_params
    with = "textures/boards/KostonB03"
    skater = Koston
    RotateDeckLeft
    flag = BOARD_UNLOCKED_KOSTONB03
  }
  {
    desc_id = #"Koston 4"
    frontend_desc = 'Koston OG - 98'
    common_deck_graphic_params
    with = "textures/boards/KostonB04"
    skater = Koston
    flag = BOARD_UNLOCKED_KOSTONB04
  }
  {
    desc_id = #"Koston 5"
    frontend_desc = 'Old Man Koston'
    common_deck_graphic_params
    with = "textures/boards/KostonB05"
    skater = Koston
    flag = BOARD_UNLOCKED_KOSTONB05
  }
  {
    desc_id = #"Koston 6"
    frontend_desc = 'Koston - Blue'
    common_deck_graphic_params
    with = "textures/boards/KostonB06"
    skater = Koston
    flag = BOARD_UNLOCKED_KOSTONB06
  }
  {
    desc_id = #"Koston 7"
    frontend_desc = 'Dog'
    common_deck_graphic_params
    with = "textures/boards/KostonB07"
    skater = Koston
    RotateDeckRight
    flag = BOARD_UNLOCKED_KOSTONB07
  }
  {
    desc_id = #"Koston 8"
    frontend_desc = 'Super Cock'
    common_deck_graphic_params
    with = "textures/boards/KostonB08"
    skater = Koston
    flag = BOARD_UNLOCKED_KOSTONB08
  }
  {
    desc_id = #"Koston 9"
    frontend_desc = 'Flag Deck'
    common_deck_graphic_params
    with = "textures/boards/KostonB09"
    skater = Koston
    RotateDeckLeft
    flag = BOARD_UNLOCKED_KOSTONB09
  }
  {
    desc_id = #"Koston 10"
    frontend_desc = 'Flow 2'
    common_deck_graphic_params
    with = "textures/boards/KostonB10"
    skater = Koston
    flag = BOARD_UNLOCKED_KOSTONB10
  }
  {
    desc_id = #"Lasek 1"
    frontend_desc = 'Gambler'
    common_deck_graphic_params
    with = "textures/boards/LasekB01"
    skater = Lasek
    flag = BOARD_UNLOCKED_LASEKB01
  }
  {
    desc_id = #"Lasek 2"
    frontend_desc = 'Designer Lasek'
    common_deck_graphic_params
    with = "textures/boards/LasekB02"
    skater = Lasek
    flag = BOARD_UNLOCKED_LASEKB02
  }
  {
    desc_id = #"Lasek 3"
    frontend_desc = 'Rooster'
    common_deck_graphic_params
    with = "textures/boards/LasekB03"
    skater = Lasek
    RotateDeckLeft
    flag = BOARD_UNLOCKED_LASEKB03
  }
  {
    desc_id = #"Lasek 4"
    frontend_desc = 'Bucky Photo'
    common_deck_graphic_params
    with = "textures/boards/LasekB04"
    skater = Lasek
    RotateDeckLeft
    flag = BOARD_UNLOCKED_LASEKB04
  }
  {
    desc_id = #"Lasek 5"
    frontend_desc = 'Birdhouse Logo'
    common_deck_graphic_params
    with = "textures/boards/LasekB05"
    skater = Lasek
    flag = BOARD_UNLOCKED_LASEKB05
  }
  {
    desc_id = #"Lasek 6"
    frontend_desc = 'Race Car Logo'
    common_deck_graphic_params
    with = "textures/boards/LasekB06"
    skater = Lasek
    flag = BOARD_UNLOCKED_LASEKB06
  }
  {
    desc_id = #"Lasek 7"
    frontend_desc = 'Bucky Sequence'
    common_deck_graphic_params
    with = "textures/boards/LasekB07"
    skater = Lasek
    flag = BOARD_UNLOCKED_LASEKB07
  }
  {
    desc_id = #"Lasek 8"
    frontend_desc = 'Bucky Stripes'
    common_deck_graphic_params
    with = "textures/boards/LasekB08"
    skater = Lasek
    flag = BOARD_UNLOCKED_LASEKB08
  }
  {
    desc_id = #"Lasek 9"
    frontend_desc = 'Birdhouse Toy Logo'
    common_deck_graphic_params
    with = "textures/boards/LasekB09"
    skater = Lasek
    flag = BOARD_UNLOCKED_LASEKB09
  }
  {
    desc_id = #"Lasek 10"
    frontend_desc = 'Red Throttle'
    common_deck_graphic_params
    with = "textures/boards/LasekB10"
    skater = Lasek
    flag = BOARD_UNLOCKED_LASEKB10
  }
  {
    desc_id = #"Margera 1"
    frontend_desc = 'Animalism'
    common_deck_graphic_params
    with = "textures/boards/MargeraB01"
    skater = Margera
    RotateDeckLeft
    flag = BOARD_UNLOCKED_MARGERAB01
  }
  {
    desc_id = #"Margera 2"
    frontend_desc = 'Heartogram'
    common_deck_graphic_params
    with = "textures/boards/MargeraB02"
    skater = Margera
    flag = BOARD_UNLOCKED_MARGERAB02
  }
  {
    desc_id = #"Margera 3"
    frontend_desc = 'Squared'
    common_deck_graphic_params
    with = "textures/boards/MargeraB03"
    skater = Margera
    RotateDeckLeft
    flag = BOARD_UNLOCKED_MARGERAB03
  }
  {
    desc_id = #"Margera 4"
    frontend_desc = 'Ecotone'
    common_deck_graphic_params
    with = "textures/boards/MargeraB04"
    skater = Margera
    RotateDeckLeft
    flag = BOARD_UNLOCKED_MARGERAB04
  }
  {
    desc_id = #"Margera 5"
    frontend_desc = 'Arbor'
    common_deck_graphic_params
    with = "textures/boards/MargeraB05"
    skater = Margera
    flag = BOARD_UNLOCKED_MARGERAB05
  }
  {
    desc_id = #"Margera 6"
    frontend_desc = 'Manimal'
    common_deck_graphic_params
    with = "textures/boards/MargeraB06"
    skater = Margera
    flag = BOARD_UNLOCKED_MARGERAB06
  }
  {
    desc_id = #"Margera 7"
    frontend_desc = 'Letterman'
    common_deck_graphic_params
    with = "textures/boards/MargeraB07"
    skater = Margera
    flag = BOARD_UNLOCKED_MARGERAB07
  }
  {
    desc_id = #"Margera 8"
    frontend_desc = 'Trophy'
    common_deck_graphic_params
    with = "textures/boards/MargeraB08"
    skater = Margera
    RotateDeckLeft
    flag = BOARD_UNLOCKED_MARGERAB08
  }
  {
    desc_id = #"Margera 9"
    frontend_desc = 'Instinct'
    common_deck_graphic_params
    with = "textures/boards/MargeraB09"
    skater = Margera
    flag = BOARD_UNLOCKED_MARGERAB09
  }
  {
    desc_id = #"Margera 10"
    frontend_desc = 'Welcome'
    common_deck_graphic_params
    with = "textures/boards/MargeraB10"
    skater = Margera
    flag = BOARD_UNLOCKED_MARGERAB10
  }
  {
    desc_id = #"Mullen 1"
    frontend_desc = 'Saint'
    common_deck_graphic_params
    with = "textures/boards/MullenB01"
    skater = Mullen
    flag = BOARD_UNLOCKED_MULLENB01
  }
  {
    desc_id = #"Mullen 2"
    frontend_desc = 'Paper Circles'
    common_deck_graphic_params
    with = "textures/boards/MullenB02"
    skater = Mullen
    RotateDeckLeft
    flag = BOARD_UNLOCKED_MULLENB02
  }
  {
    desc_id = #"Mullen 3"
    frontend_desc = 'Blocks'
    common_deck_graphic_params
    with = "textures/boards/MullenB03"
    skater = Mullen
    RotateDeckRight
    flag = BOARD_UNLOCKED_MULLENB03
  }
  {
    desc_id = #"Mullen 4"
    frontend_desc = 'Minimal'
    common_deck_graphic_params
    with = "textures/boards/MullenB04"
    skater = Mullen
    RotateDeckLeft
    flag = BOARD_UNLOCKED_MULLENB04
  }
  {
    desc_id = #"Mullen 5"
    frontend_desc = 'Quack Quack'
    common_deck_graphic_params
    with = "textures/boards/MullenB05"
    skater = Mullen
    RotateDeckRight
    flag = BOARD_UNLOCKED_MULLENB05
  }
  {
    desc_id = #"Mullen 6"
    frontend_desc = 'Former Brigader'
    common_deck_graphic_params
    with = "textures/boards/MullenB06"
    skater = Mullen
    RotateDeckRight
    flag = BOARD_UNLOCKED_MULLENB06
  }
  {
    desc_id = #"Mullen 7"
    frontend_desc = 'Camaro'
    common_deck_graphic_params
    with = "textures/boards/MullenB07"
    skater = Mullen
    RotateDeckRight
    flag = BOARD_UNLOCKED_MULLENB07
  }
  {
    desc_id = #"Mullen 8"
    frontend_desc = 'Thumbs Up'
    common_deck_graphic_params
    with = "textures/boards/MullenB08"
    skater = Mullen
    flag = BOARD_UNLOCKED_MULLENB08
  }
  {
    desc_id = #"Mullen 9"
    frontend_desc = 'Art'
    common_deck_graphic_params
    with = "textures/boards/MullenB09"
    skater = Mullen
    RotateDeckRight
    flag = BOARD_UNLOCKED_MULLENB09
  }
  {
    desc_id = #"Mullen 10"
    frontend_desc = 'Sinner'
    common_deck_graphic_params
    with = "textures/boards/MullenB10"
    skater = Mullen
    RotateDeckLeft
    flag = BOARD_UNLOCKED_MULLENB10
  }
  {
    desc_id = #"Muska 1"
    frontend_desc = 'Red Muskalade'
    common_deck_graphic_params
    with = "textures/boards/MuskaB01"
    skater = Muska
    flag = BOARD_UNLOCKED_MUSKAB01
  }
  {
    desc_id = #"Muska 2"
    frontend_desc = 'Black Muskalade'
    common_deck_graphic_params
    with = "textures/boards/MuskaB02"
    skater = Muska
    RotateDeckLeft
    flag = BOARD_UNLOCKED_MUSKAB02
  }
  {
    desc_id = #"Muska 3"
    frontend_desc = 'Gold Muskalade'
    common_deck_graphic_params
    with = "textures/boards/MuskaB03"
    skater = Muska
    flag = BOARD_UNLOCKED_MUSKAB03
  }
  {
    desc_id = #"Muska 4"
    frontend_desc = 'Silver Muskalade'
    common_deck_graphic_params
    with = "textures/boards/MuskaB04"
    skater = Muska
    flag = BOARD_UNLOCKED_MUSKAB04
  }
  {
    desc_id = #"Muska 5"
    frontend_desc = 'Green Muskalade'
    common_deck_graphic_params
    with = "textures/boards/MuskaB05"
    skater = Muska
    RotateDeckRight
    flag = BOARD_UNLOCKED_MUSKAB05
  }
  {
    desc_id = #"Muska 6"
    frontend_desc = 'Muska Sporty'
    common_deck_graphic_params
    with = "textures/boards/MuskaB06"
    skater = Muska
    flag = BOARD_UNLOCKED_MUSKAB06
  }
  {
    desc_id = #"Muska 7"
    frontend_desc = 'Red Silhouette'
    common_deck_graphic_params
    with = "textures/boards/MuskaB07"
    skater = Muska
    RotateDeckRight
    flag = BOARD_UNLOCKED_MUSKAB07
  }
  {
    desc_id = #"Muska 8"
    frontend_desc = 'Candyland'
    common_deck_graphic_params
    with = "textures/boards/MuskaB08"
    skater = Muska
    RotateDeckLeft
    flag = BOARD_UNLOCKED_MUSKAB08
  }
  {
    desc_id = #"Muska 9"
    frontend_desc = 'Yellow Silhouette'
    common_deck_graphic_params
    with = "textures/boards/MuskaB09"
    skater = Muska
    RotateDeckLeft
    flag = BOARD_UNLOCKED_MUSKAB09
  }
  {
    desc_id = #"Muska 10"
    frontend_desc = 'Pearl Muskalade'
    common_deck_graphic_params
    with = "textures/boards/MuskaB10"
    skater = Muska
    flag = BOARD_UNLOCKED_MUSKAB10
  }
  {
    desc_id = #"Reynolds 1"
    frontend_desc = 'OG Baker'
    common_deck_graphic_params
    with = "textures/boards/ReynoldsB01"
    skater = Reynolds
    flag = BOARD_UNLOCKED_REYNOLDSB01
  }
  {
    desc_id = #"Reynolds 2"
    frontend_desc = 'Drawing'
    common_deck_graphic_params
    with = "textures/boards/ReynoldsB02"
    skater = Reynolds
    flag = BOARD_UNLOCKED_REYNOLDSB02
  }
  {
    desc_id = #"Reynolds 3"
    frontend_desc = 'Andrew 3000'
    common_deck_graphic_params
    with = "textures/boards/ReynoldsB03"
    skater = Reynolds
    RotateDeckLeft
    flag = BOARD_UNLOCKED_REYNOLDSB03
  }
  {
    desc_id = #"Reynolds 4"
    frontend_desc = 'Swashbuckle - White'
    common_deck_graphic_params
    with = "textures/boards/ReynoldsB04"
    skater = Reynolds
    flag = BOARD_UNLOCKED_REYNOLDSB04
  }
  {
    desc_id = #"Reynolds 5"
    frontend_desc = 'Swashbuckle - Black'
    common_deck_graphic_params
    with = "textures/boards/ReynoldsB05"
    skater = Reynolds
    flag = BOARD_UNLOCKED_REYNOLDSB05
  }
  {
    desc_id = #"Reynolds 6"
    frontend_desc = 'Choice Brand - Blue'
    common_deck_graphic_params
    with = "textures/boards/ReynoldsB06"
    skater = Reynolds
    flag = BOARD_UNLOCKED_REYNOLDSB06
  }
  {
    desc_id = #"Reynolds 7"
    frontend_desc = 'Choice Brand - Green'
    common_deck_graphic_params
    with = "textures/boards/ReynoldsB07"
    skater = Reynolds
    flag = BOARD_UNLOCKED_REYNOLDSB07
  }
  {
    desc_id = #"Reynolds 8"
    frontend_desc = 'Pirate Flag'
    common_deck_graphic_params
    with = "textures/boards/ReynoldsB08"
    skater = Reynolds
    flag = BOARD_UNLOCKED_REYNOLDSB08
  }
  {
    desc_id = #"Reynolds 9"
    frontend_desc = 'Red Baker Logo'
    common_deck_graphic_params
    with = "textures/boards/ReynoldsB09"
    skater = Reynolds
    flag = BOARD_UNLOCKED_REYNOLDSB09
  }
  {
    desc_id = #"Reynolds 10"
    frontend_desc = 'Pirate Scene'
    common_deck_graphic_params
    with = "textures/boards/ReynoldsB10"
    skater = Reynolds
    RotateDeckLeft
    flag = BOARD_UNLOCKED_REYNOLDSB10
  }
  {
    desc_id = #"Rowley 1"
    frontend_desc = 'Hellcat'
    common_deck_graphic_params
    with = "textures/boards/RowleyB01"
    skater = Rowley
    RotateDeckRight
    flag = BOARD_UNLOCKED_ROWLEYB01
  }
  {
    desc_id = #"Rowley 2"
    frontend_desc = 'One Way Logo'
    common_deck_graphic_params
    with = "textures/boards/RowleyB02"
    skater = Rowley
    RotateDeckRight
    flag = BOARD_UNLOCKED_ROWLEYB02
  }
  {
    desc_id = #"Rowley 3"
    frontend_desc = 'Spring Heel Jack'
    common_deck_graphic_params
    with = "textures/boards/RowleyB03"
    skater = Rowley
    flag = BOARD_UNLOCKED_ROWLEYB03
  }
  {
    desc_id = #"Rowley 4"
    frontend_desc = 'TV Logo 2'
    common_deck_graphic_params
    with = "textures/boards/RowleyB04"
    skater = Rowley
    RotateDeckRight
    flag = BOARD_UNLOCKED_ROWLEYB04
  }
  {
    desc_id = #"Rowley 5"
    frontend_desc = 'Victory UK'
    common_deck_graphic_params
    with = "textures/boards/RowleyB05"
    skater = Rowley
    flag = BOARD_UNLOCKED_ROWLEYB05
  }
  {
    desc_id = #"Rowley 6"
    frontend_desc = 'Script Logo'
    common_deck_graphic_params
    with = "textures/boards/RowleyB06"
    skater = Rowley
    RotateDeckRight
    flag = BOARD_UNLOCKED_ROWLEYB06
  }
  {
    desc_id = #"Rowley 7"
    frontend_desc = 'Heshman'
    common_deck_graphic_params
    with = "textures/boards/RowleyB07"
    skater = Rowley
    RotateDeckRight
    flag = BOARD_UNLOCKED_ROWLEYB07
  }
  {
    desc_id = #"Rowley 8"
    frontend_desc = 'Sorry Logo - Yellow'
    common_deck_graphic_params
    with = "textures/boards/RowleyB08"
    skater = Rowley
    RotateDeckRight
    flag = BOARD_UNLOCKED_ROWLEYB08
  }
  {
    desc_id = #"Rowley 9"
    frontend_desc = 'HKD - Black'
    common_deck_graphic_params
    with = "textures/boards/RowleyB09"
    skater = Rowley
    flag = BOARD_UNLOCKED_ROWLEYB09
  }
  {
    desc_id = #"Rowley 10"
    frontend_desc = 'Pixelated'
    common_deck_graphic_params
    with = "textures/boards/RowleyB10"
    skater = Rowley
    flag = BOARD_UNLOCKED_ROWLEYB10
  }
  {
    desc_id = #"Steamer 1"
    frontend_desc = 'Dove'
    common_deck_graphic_params
    with = "textures/boards/SteamerB01"
    skater = Steamer
    flag = BOARD_UNLOCKED_STEAMERB01
  }
  {
    desc_id = #"Steamer 2"
    frontend_desc = 'Steamer Drawing'
    common_deck_graphic_params
    with = "textures/boards/SteamerB02"
    skater = Steamer
    flag = BOARD_UNLOCKED_STEAMERB02
  }
  {
    desc_id = #"Steamer 3"
    frontend_desc = 'Bootleg - Black'
    common_deck_graphic_params
    with = "textures/boards/SteamerB03"
    skater = Steamer
    RotateDeckRight
    flag = BOARD_UNLOCKED_STEAMERB03
  }
  {
    desc_id = #"Steamer 4"
    frontend_desc = 'Ripoff - Red'
    common_deck_graphic_params
    with = "textures/boards/SteamerB04"
    skater = Steamer
    flag = BOARD_UNLOCKED_STEAMERB04
  }
  {
    desc_id = #"Steamer 5"
    frontend_desc = 'Bootleg - Blue'
    common_deck_graphic_params
    with = "textures/boards/SteamerB05"
    skater = Steamer
    flag = BOARD_UNLOCKED_STEAMERB05
  }
  {
    desc_id = #"Steamer 6"
    frontend_desc = 'Censored - Yellow'
    common_deck_graphic_params
    with = "textures/boards/SteamerB06"
    skater = Steamer
    flag = BOARD_UNLOCKED_STEAMERB06
  }
  {
    desc_id = #"Steamer 7"
    frontend_desc = 'Censored - Orange'
    common_deck_graphic_params
    with = "textures/boards/SteamerB07"
    skater = Steamer
    flag = BOARD_UNLOCKED_STEAMERB07
  }
  {
    desc_id = #"Steamer 8"
    frontend_desc = 'Real B - Grey'
    common_deck_graphic_params
    with = "textures/boards/SteamerB08"
    skater = Steamer
    RotateDeckRight
    flag = BOARD_UNLOCKED_STEAMERB08
  }
  {
    desc_id = #"Steamer 9"
    frontend_desc = 'Real B - Red'
    common_deck_graphic_params
    with = "textures/boards/SteamerB09"
    skater = Steamer
    flag = BOARD_UNLOCKED_STEAMERB09
  }
  {
    desc_id = #"Steamer 10"
    frontend_desc = 'Bootleg - Grey'
    common_deck_graphic_params
    with = "textures/boards/SteamerB10"
    skater = Steamer
    RotateDeckRight
    flag = BOARD_UNLOCKED_STEAMERB10
  }
  {
    desc_id = #"Thomas 1"
    frontend_desc = 'Cross'
    common_deck_graphic_params
    with = "textures/boards/ThomasB01"
    skater = Thomas
    flag = BOARD_UNLOCKED_THOMASB01
  }
  {
    desc_id = #"Thomas 2"
    frontend_desc = 'Zero Or Die'
    common_deck_graphic_params
    with = "textures/boards/ThomasB02"
    skater = Thomas
    RotateDeckLeft
    flag = BOARD_UNLOCKED_THOMASB02
  }
  {
    desc_id = #"Thomas 3"
    frontend_desc = 'Freebird'
    common_deck_graphic_params
    with = "textures/boards/ThomasB03"
    skater = Thomas
    flag = BOARD_UNLOCKED_THOMASB03
  }
  {
    desc_id = #"Thomas 4"
    frontend_desc = 'Spikes'
    common_deck_graphic_params
    with = "textures/boards/ThomasB04"
    skater = Thomas
    RotateDeckLeft
    flag = BOARD_UNLOCKED_THOMASB04
  }
  {
    desc_id = #"Thomas 5"
    frontend_desc = 'Thomas Smith'
    common_deck_graphic_params
    with = "textures/boards/ThomasB05"
    skater = Thomas
    flag = BOARD_UNLOCKED_THOMASB05
  }
  {
    desc_id = #"Thomas 6"
    frontend_desc = 'Single Skull'
    common_deck_graphic_params
    with = "textures/boards/ThomasB06"
    skater = Thomas
    flag = BOARD_UNLOCKED_THOMASB06
  }
  {
    desc_id = #"Thomas 7"
    frontend_desc = 'Jesus'
    common_deck_graphic_params
    with = "textures/boards/ThomasB07"
    skater = Thomas
    flag = BOARD_UNLOCKED_THOMASB07
  }
  {
    desc_id = #"Thomas 8"
    frontend_desc = 'Skeleton'
    common_deck_graphic_params
    with = "textures/boards/ThomasB08"
    skater = Thomas
    RotateDeckRight
    flag = BOARD_UNLOCKED_THOMASB08
  }
  {
    desc_id = #"Thomas 9"
    frontend_desc = 'Priest'
    common_deck_graphic_params
    with = "textures/boards/ThomasB09"
    skater = Thomas
    flag = BOARD_UNLOCKED_THOMASB09
  }
  {
    desc_id = #"Thomas 10"
    frontend_desc = '3 Skull with Blood'
    common_deck_graphic_params
    with = "textures/boards/ThomasB10"
    skater = Thomas
    flag = BOARD_UNLOCKED_THOMASB10
  }
  {
    desc_id = #"Eddie 1"
    frontend_desc = 'Iron Maiden'
    common_deck_graphic_params
    with = "textures/boards/EddieB01"
    skater = Eddie
    RotateDeckRight
    flag = BOARD_UNLOCKED_EDDIEB01
  }
  {
    desc_id = #"Eddie 2"
    frontend_desc = 'Killers'
    common_deck_graphic_params
    with = "textures/boards/EddieB02"
    skater = Eddie
    flag = BOARD_UNLOCKED_EDDIEB02
  }
  {
    desc_id = #"Eddie 3"
    frontend_desc = 'Piece of Mind'
    common_deck_graphic_params
    with = "textures/boards/EddieB03"
    skater = Eddie
    flag = BOARD_UNLOCKED_EDDIEB03
  }
  {
    desc_id = #"Eddie 4"
    frontend_desc = 'Powerslave'
    common_deck_graphic_params
    with = "textures/boards/EddieB04"
    skater = Eddie
    flag = BOARD_UNLOCKED_EDDIEB04
  }
  {
    desc_id = #"Eddie 5"
    frontend_desc = 'Trooper'
    common_deck_graphic_params
    with = "textures/boards/EddieB05"
    skater = Eddie
    flag = BOARD_UNLOCKED_EDDIEB05
  }
  {
    desc_id = #"Eddie 6"
    frontend_desc = 'Somewhere in Time'
    common_deck_graphic_params
    with = "textures/boards/EddieB06"
    skater = Eddie
    flag = BOARD_UNLOCKED_EDDIEB06
  }
  {
    desc_id = #"Eddie 7"
    frontend_desc = 'Seventh Son'
    common_deck_graphic_params
    with = "textures/boards/EddieB07"
    skater = Eddie
    flag = BOARD_UNLOCKED_EDDIEB07
  }
  {
    desc_id = #"Eddie 8"
    frontend_desc = 'Purgatory'
    common_deck_graphic_params
    with = "textures/boards/EddieB08"
    skater = Eddie
    RotateDeckRight
    flag = BOARD_UNLOCKED_EDDIEB08
  }
  {
    desc_id = #"Eddie 9"
    frontend_desc = 'Fear of the Dark'
    common_deck_graphic_params
    with = "textures/boards/EddieB09"
    skater = Eddie
    flag = BOARD_UNLOCKED_EDDIEB09
  }
  {
    desc_id = #"Eddie 10"
    frontend_desc = 'IM Logo'
    common_deck_graphic_params
    with = "textures/boards/EddieB10"
    skater = Eddie
    RotateDeckLeft
    flag = BOARD_UNLOCKED_EDDIEB10
  }
  {
    desc_id = #"Jango 1"
    frontend_desc = 'Jango 1'
    common_deck_graphic_params
    with = "textures/boards/jangoB01"
    skater = jango
    flag = BOARD_UNLOCKED_JANGOB01
  }
  {
    desc_id = #"Jango 2"
    frontend_desc = 'Jango 2'
    common_deck_graphic_params
    with = "textures/boards/jangoB02"
    skater = jango
    flag = BOARD_UNLOCKED_JANGOB02
  }
  {
    desc_id = #"Jango 3"
    frontend_desc = 'Jango 3'
    common_deck_graphic_params
    with = "textures/boards/jangoB03"
    skater = jango
    flag = BOARD_UNLOCKED_JANGOB03
  }
  {
    desc_id = #"Jango 4"
    frontend_desc = 'Jango 4'
    common_deck_graphic_params
    with = "textures/boards/jangoB04"
    skater = jango
    RotateDeckLeft
    flag = BOARD_UNLOCKED_JANGOB04
  }
  {
    desc_id = #"Jango 5"
    frontend_desc = 'Jango 5'
    common_deck_graphic_params
    with = "textures/boards/jangoB05"
    skater = jango
    RotateDeckRight
    flag = BOARD_UNLOCKED_JANGOB05
  }
  {
    desc_id = #"Jango 6"
    frontend_desc = 'Jango 6'
    common_deck_graphic_params
    with = "textures/boards/jangoB06"
    skater = jango
    flag = BOARD_UNLOCKED_JANGOB06
  }
  {
    desc_id = #"Jango 7"
    frontend_desc = 'Jango 7'
    common_deck_graphic_params
    with = "textures/boards/jangoB07"
    skater = jango
    flag = BOARD_UNLOCKED_JANGOB07
  }
  {
    desc_id = #"Jango 8"
    frontend_desc = 'Jango 8'
    common_deck_graphic_params
    with = "textures/boards/jangoB08"
    skater = jango
    RotateDeckRight
    flag = BOARD_UNLOCKED_JANGOB08
  }
  {
    desc_id = #"Jango 9"
    frontend_desc = 'Jango 9'
    common_deck_graphic_params
    with = "textures/boards/jangoB09"
    skater = jango
    flag = BOARD_UNLOCKED_JANGOB09
  }
  {
    desc_id = #"Jango 10"
    frontend_desc = 'Jango 10'
    common_deck_graphic_params
    with = "textures/boards/jangoB10"
    skater = jango
    flag = BOARD_UNLOCKED_JANGOB10
  }
  {
    desc_id = #"Vallely 1"
    frontend_desc = 'Bolt'
    common_deck_graphic_params
    with = "textures/boards/vallelyB01"
    skater = vallely
    flag = BOARD_UNLOCKED_vallelyB01
  }
  {
    desc_id = #"Vallely 2"
    frontend_desc = 'Elephant Red'
    common_deck_graphic_params
    with = "textures/boards/vallelyB02"
    skater = vallely
    RotateDeckLeft
    flag = BOARD_UNLOCKED_vallelyB02
  }
  {
    desc_id = #"Vallely 3"
    frontend_desc = 'Fists'
    common_deck_graphic_params
    with = "textures/boards/vallelyB03"
    skater = vallely
    flag = BOARD_UNLOCKED_vallelyB03
  }
  {
    desc_id = #"Vallely 4"
    frontend_desc = 'Elephant Signature'
    common_deck_graphic_params
    with = "textures/boards/vallelyB04"
    skater = vallely
    flag = BOARD_UNLOCKED_vallelyB04
  }
  {
    desc_id = #"Vallely 5"
    frontend_desc = 'Hero'
    common_deck_graphic_params
    with = "textures/boards/vallelyB05"
    skater = vallely
    flag = BOARD_UNLOCKED_vallelyB05
  }
  {
    desc_id = #"Vallely 6"
    frontend_desc = 'Storm'
    common_deck_graphic_params
    with = "textures/boards/vallelyB06"
    skater = vallely
    flag = BOARD_UNLOCKED_vallelyB06
  }
  {
    desc_id = #"Vallely 7"
    frontend_desc = 'Multi Bolt'
    common_deck_graphic_params
    with = "textures/boards/vallelyB07"
    skater = vallely
    flag = BOARD_UNLOCKED_vallelyB07
  }
  {
    desc_id = #"Vallely 8"
    frontend_desc = 'Elephant Eyes'
    common_deck_graphic_params
    with = "textures/boards/vallelyB08"
    skater = vallely
    RotateDeckLeft
    flag = BOARD_UNLOCKED_vallelyB08
  }
  {
    desc_id = #"Vallely 9"
    frontend_desc = 'Elephant Large'
    common_deck_graphic_params
    with = "textures/boards/vallelyB09"
    skater = vallely
    flag = BOARD_UNLOCKED_vallelyB09
  }
  {
    desc_id = #"Vallely 10"
    frontend_desc = 'City Bolt'
    common_deck_graphic_params
    with = "textures/boards/vallelyB10"
    skater = vallely
    flag = BOARD_UNLOCKED_vallelyB10
  }
  {
    desc_id = #"CAS 1"
    frontend_desc = 'Yellow Baker Logo'
    common_deck_graphic_params
    with = "textures/boards/casB01"
    skater = custom
    flag = BOARD_UNLOCKED_CASB01
  }
  {
    desc_id = #"CAS 2"
    frontend_desc = 'Birdhouse Blue Logo'
    common_deck_graphic_params
    with = "textures/boards/casB02"
    skater = custom
    RotateDeckLeft
    flag = BOARD_UNLOCKED_CASB02
  }
  {
    desc_id = #"CAS 3"
    frontend_desc = 'Birdhouse Red Logo'
    common_deck_graphic_params
    with = "textures/boards/casB03"
    skater = custom
    flag = BOARD_UNLOCKED_CASB03
  }
  {
    desc_id = #"CAS 4"
    frontend_desc = 'Bootleg Red Logo'
    common_deck_graphic_params
    with = "textures/boards/casB04"
    skater = custom
    flag = BOARD_UNLOCKED_CASB04
  }
  {
    desc_id = #"CAS 5"
    frontend_desc = 'City Stars'
    common_deck_graphic_params
    with = "textures/boards/casB05"
    skater = custom
    flag = BOARD_UNLOCKED_CASB05
  }
  {
    desc_id = #"CAS 6"
    frontend_desc = 'Element - Nature'
    common_deck_graphic_params
    with = "textures/boards/casB06"
    skater = custom
    flag = BOARD_UNLOCKED_CASB06
  }
  {
    desc_id = #"CAS 7"
    frontend_desc = 'Enjoi - Panda'
    common_deck_graphic_params
    with = "textures/boards/casB07"
    skater = custom
    flag = BOARD_UNLOCKED_CASB07
  }
  {
    desc_id = #"CAS 8"
    frontend_desc = 'The Firm - Red'
    common_deck_graphic_params
    with = "textures/boards/casB08"
    skater = custom
    RotateDeckLeft
    flag = BOARD_UNLOCKED_CASB08
  }
  {
    desc_id = #"CAS 9"
    frontend_desc = 'Flip - b&w'
    common_deck_graphic_params
    with = "textures/boards/casB09"
    skater = custom
    flag = BOARD_UNLOCKED_CASB09
  }
  {
    desc_id = #"CAS 10"
    frontend_desc = 'Flip - Sorry'
    common_deck_graphic_params
    with = "textures/boards/casB10"
    skater = custom
    flag = BOARD_UNLOCKED_CASB10
  }
  {
    desc_id = #"CAS 11"
    frontend_desc = 'Girl - Wrestler'
    common_deck_graphic_params
    with = "textures/boards/casB11"
    skater = custom
    flag = BOARD_UNLOCKED_CASB11
  }
  {
    desc_id = #"CAS 12"
    frontend_desc = 'Powell - Dragon'
    common_deck_graphic_params
    with = "textures/boards/casB12"
    skater = custom
    flag = BOARD_UNLOCKED_CASB12
  }
  {
    desc_id = #"CAS 13"
    frontend_desc = 'Shorty\'s Surf Punk'
    common_deck_graphic_params
    with = "textures/boards/casB13"
    skater = custom
    flag = BOARD_UNLOCKED_CASB13
  }
  {
    desc_id = #"CAS 14"
    frontend_desc = 'Zero - Black'
    common_deck_graphic_params
    with = "textures/boards/casB14"
    skater = custom
    flag = BOARD_UNLOCKED_CASB14
  }
  {
    desc_id = #"CAS 15"
    frontend_desc = 'THPS4 Logo'
    common_deck_graphic_params
    with = "textures/boards/casB15"
    skater = custom
    flag = BOARD_UNLOCKED_CASB15
  }
  {
    desc_id = #"CAS 16"
    frontend_desc = 'Glen Eye'
    common_deck_graphic_params
    with = "textures/boards/casB16"
    skater = custom
    flag = BOARD_UNLOCKED_CASB16
  }
  {
    desc_id = #"CAS 17"
    frontend_desc = 'Never Graf'
    common_deck_graphic_params
    with = "textures/boards/casB17"
    skater = custom
    flag = BOARD_UNLOCKED_CASB17
  }
  {
    desc_id = #"CAS 18"
    frontend_desc = 'Skate 4 Food'
    common_deck_graphic_params
    with = "textures/boards/casB18"
    skater = custom
    flag = BOARD_UNLOCKED_CASB18
  }
  {
    desc_id = #"CAS 19"
    frontend_desc = 'Elephant Small'
    common_deck_graphic_params
    with = "textures/boards/casB19"
    skater = custom
    flag = BOARD_UNLOCKED_CASB19
  }
  {
    desc_id = #"CAS 20"
    frontend_desc = 'Family Values'
    common_deck_graphic_params
    with = "textures/boards/casB20"
    skater = custom
    flag = BOARD_UNLOCKED_CASB20
  }

  // Custom page example 1

  // {
  //   desc_id = #"CAS 21"
  //   frontend_desc = 'Yellow Baker Logo (2)'
  //   common_deck_graphic_params
  //   with = "textures/boards/casB01"
  //   skater = baker
  //   flag = BOARD_UNLOCKED_CASB01
  // }
  // {
  //   skater = baker
  //   hidden = 1
  // }
  // {
  //   skater = baker
  //   hidden = 1
  // }
  // {
  //   skater = baker
  //   hidden = 1
  // }
  // {
  //   skater = baker
  //   hidden = 1
  // }
  // {
  //   skater = baker
  //   hidden = 1
  // }
  // {
  //   skater = baker
  //   hidden = 1
  // }
  // {
  //   skater = baker
  //   hidden = 1
  // }
  // {
  //   skater = baker
  //   hidden = 1
  // }
  // {
  //   skater = baker
  //   hidden = 1
  // }

  // Custom page example 2

  // {
  //   desc_id = #"Reynolds 9"
  //   frontend_desc = 'Red Baker Logo'
  //   common_deck_graphic_params
  //   with = "textures/boards/ReynoldsB09"
  //   skater = baker2
  //   flag = BOARD_UNLOCKED_REYNOLDSB09
  // }
  // {
  //   skater = baker2
  //   hidden = 1
  // }
  // {
  //   skater = baker2
  //   hidden = 1
  // }
  // {
  //   skater = baker2
  //   hidden = 1
  // }
  // {
  //   skater = baker2
  //   hidden = 1
  // }
  // {
  //   skater = baker2
  //   hidden = 1
  // }
  // {
  //   skater = baker2
  //   hidden = 1
  // }
  // {
  //   skater = baker2
  //   hidden = 1
  // }
  // {
  //   skater = baker2
  //   hidden = 1
  // }
  // {
  //   skater = baker2
  //   hidden = 1
  // }
]
