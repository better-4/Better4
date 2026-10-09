sp_str_unassigned = 'Unassigned'
sp_str_units = 'ft.'
sp_str_subunits = 'in.'
sp_str_pounds = 'pounds'
sp_str_unknown_weight = '---'
sp_str_none = 'None'
appearance_reset_structure_ped = {
  body = { desc_id = ped }
  body_type = male
  head = { desc_id = "None" }
  torso = { desc_id = "None" }
  legs = { desc_id = "None" }
}
test_ped_profile = appearance_reset_structure_ped
appearance_reset_structure = {
  body = { desc_id = skater }
  body_type = male
  head = { desc_id = None }
  hat = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  hair = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  jaw = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  shoes = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  torso = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  legs = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  kneepads = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  elbowpads = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  backpack = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  glasses = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  boardup = { desc_id = None }
  boarddown = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  helmet = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  hat_logo = { desc_id = None }
  helmet_logo = { desc_id = None }
  front_logo = { desc_id = None }
  back_logo = { desc_id = None }
  accessories = { desc_id = None }
  chest_tattoo = { desc_id = None }
  back_tattoo = { desc_id = None }
  left_arm_tattoo = { desc_id = None }
  right_arm_tattoo = { desc_id = None }
  socks = { desc_id = None h = 0 s = 50 v = 100 use_default_hsv = 1 }
  left_leg_tattoo = { desc_id = None }
  right_leg_tattoo = { desc_id = None }
  special_item = { desc_id = None }
  special_item_2 = { desc_id = None }
  skin = { h = 180 s = 100 v = 100 use_default_hsv = 1 }
  height_scale = 1.0
  weight_scale = 1.0
  scaling_mode = { value = apply_normal_mode }
}
script init_pro_skaters
  ForEachIn master_skater_list do = AddSkaterProfile
  AddTemporaryProfile name = credits_profile
  AddTemporaryProfile name = old_male_profile
  RememberTemporaryAppearance appearance_structure = appearance_custom_skater_male name = old_male_profile
  AddTemporaryProfile name = old_female_profile
  RememberTemporaryAppearance appearance_structure = appearance_custom_skater_female name = old_female_profile
endscript
script add_skater_profile
  AddSkaterProfile <...>
endscript
master_skater_list = [
  {
    display_name = "Tony Hawk"
    first_name = "Tony"
    default_appearance = appearance_hawk
    name = hawk
    stance = goofy
    pushstyle = never_mongo
    trickstyle = vert
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 33
    hometown = "Carlsbad, CA"
    points_available = 0
    air = 7
    hangtime = 5
    ollie = 3
    speed = 5
    spin = 8
    #"switch" = 4
    flip_speed = 4
    rail_balance = 5
    lip_balance = 6
    manual_balance = 3
    sponsors = [ birdhouse hawkshoes quiksilver hawkapp tony ]
    trick_mapping = { }
    default_trick_mapping = HawkTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpAir_R_L_Circle trickname = Trick_360VarialMcTwist }
        { trickslot = SpGrind_L_D_Triangle trickname = Trick_FroggyGrind }
        { trickslot = SpAir_R_D_Circle trickname = Trick_Indy900 }
        { trickslot = SpAir_L_D_Square trickname = Trick_BarrelRoll }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      is_hawk
    ]
  }
  {
    display_name = "Bob Burnquist"
    first_name = "Bob"
    default_appearance = appearance_burnquist
    name = burnquist
    stance = regular
    pushstyle = never_mongo
    trickstyle = vert
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 36
    hometown = "Sao Paulo, Brazil"
    points_available = 0
    air = 4
    hangtime = 5
    ollie = 4
    speed = 4
    spin = 6
    #"switch" = 8
    flip_speed = 4
    rail_balance = 5
    lip_balance = 5
    manual_balance = 5
    sponsors = [ firm es hurley ]
    trick_mapping = { }
    default_trick_mapping = BurnquistTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpLip_L_R_Triangle trickname = Trick_Burntwist }
        { trickslot = SpAir_L_D_Circle trickname = Trick_SitDownAir }
        { trickslot = SpGrind_U_D_Triangle trickname = Trick_OneFootSmith }
        { trickslot = SpAir_L_R_Circle trickname = Trick_SambaFlip }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      is_burnquist
    ]
  }
  {
    display_name = "Steve Caballero"
    first_name = "Steve"
    default_appearance = appearance_caballero
    name = caballero
    stance = goofy
    pushstyle = never_mongo
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 36
    hometown = "Campbell, CA"
    points_available = 0
    air = 5
    hangtime = 6
    ollie = 5
    speed = 4
    spin = 5
    #"switch" = 4
    flip_speed = 5
    rail_balance = 6
    lip_balance = 5
    manual_balance = 5
    sponsors = [ brigade sessions faction vans steve ]
    trick_mapping = { }
    default_trick_mapping = CaballeroTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpAir_R_U_Square trickname = Trick_KFSuperman }
        { trickslot = SpAir_L_D_Circle trickname = Trick_FS540 }
        { trickslot = SpGrind_D_U_Triangle trickname = Trick_GuitarSlide }
        { trickslot = SpGrind_U_D_Triangle trickname = Trick_DaffyBrokenGrind }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      is_cab
    ]
    no_edit_groups = [
      head_options
    ]
  }
  {
    display_name = "Kareem Campbell"
    first_name = "Kareem"
    default_appearance = appearance_campbell
    name = campbell
    stance = regular
    pushstyle = never_mongo
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 30
    hometown = "N.Y. / L.A."
    points_available = 0
    air = 6
    hangtime = 3
    ollie = 6
    speed = 5
    spin = 7
    #"switch" = 5
    flip_speed = 5
    rail_balance = 7
    lip_balance = 2
    manual_balance = 4
    sponsors = [ axion citystars ricta kareem ]
    trick_mapping = { }
    default_trick_mapping = CampbellTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpAir_U_R_Square trickname = Trick_GhettoBird }
        { trickslot = SpAir_L_D_Circle trickname = Trick_KFBackflip }
        { trickslot = SpGrind_L_R_Triangle trickname = Trick_BballSlide }
        { trickslot = SpGrind_D_U_Triangle trickname = Trick_DoubleBluntSlide }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      is_campbell
    ]
  }
  {
    display_name = "Rune Glifberg"
    first_name = "Rune"
    default_appearance = appearance_glifberg
    name = glifberg
    stance = regular
    pushstyle = never_mongo
    trickstyle = vert
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 27
    hometown = "Copenhagen, Denmark"
    points_available = 0
    air = 7
    hangtime = 7
    ollie = 5
    speed = 4
    spin = 5
    #"switch" = 6
    flip_speed = 5
    rail_balance = 4
    lip_balance = 5
    manual_balance = 2
    sponsors = [ Flip axion volcom rune ]
    trick_mapping = { }
    default_trick_mapping = GlifbergTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpAir_R_U_Circle trickname = Trick_BackFootNosegrab }
        { trickslot = SpAir_L_R_Circle trickname = Trick_HeelFlipHandflip }
        { trickslot = SpGrind_R_D_Triangle trickname = Trick_CrailSlide }
        { trickslot = SpLip_L_R_Triangle trickname = Trick_OneFootBlunt }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      is_glifberg
    ]
  }
  {
    display_name = "Eric Koston"
    first_name = "Eric"
    default_appearance = appearance_koston
    name = koston
    stance = goofy
    pushstyle = mongo_when_switch
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 25
    hometown = "San Bernardino, CA"
    points_available = 0
    air = 4
    hangtime = 3
    ollie = 7
    speed = 4
    spin = 4
    #"switch" = 7
    flip_speed = 6
    rail_balance = 6
    lip_balance = 3
    manual_balance = 6
    sponsors = [ girl es fourstar eric ]
    trick_mapping = { }
    default_trick_mapping = KostonTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpGrind_U_R_Triangle trickname = Trick_Fandangle }
        { trickslot = SpAir_R_L_Square trickname = Trick_BetweenLegsSlam }
        { trickslot = SpGrind_L_R_Triangle trickname = Trick_FalconSlide }
        { trickslot = SpAir_R_U_Circle trickname = Trick_ChompOnThis }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
  }
  {
    display_name = "Bucky Lasek"
    first_name = "Bucky"
    default_appearance = appearance_lasek
    name = lasek
    stance = regular
    pushstyle = never_mongo
    trickstyle = vert
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 28
    hometown = "Baltimore, MD"
    points_available = 0
    air = 7
    hangtime = 7
    ollie = 3
    speed = 5
    spin = 7
    #"switch" = 5
    flip_speed = 5
    rail_balance = 3
    lip_balance = 6
    manual_balance = 2
    sponsors = [ birdhouse genetic billabong bucky ]
    trick_mapping = { }
    default_trick_mapping = LasekTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpAir_L_D_Square trickname = Trick_Bodywrap540 }
        { trickslot = SpLip_R_L_Triangle trickname = Trick_HeelflipFSInvert }
        { trickslot = SpAir_R_D_Circle trickname = Trick_MistyFlip }
        { trickslot = SpGrind_U_L_Triangle trickname = Trick_BigHitter }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      is_lasek
    ]
  }
  {
    display_name = "Bam Margera"
    first_name = "Bam"
    default_appearance = appearance_margera
    name = margera
    stance = goofy
    pushstyle = never_mongo
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 22
    hometown = "Philadelphia, PA"
    points_available = 0
    air = 4
    hangtime = 4
    ollie = 6
    speed = 6
    spin = 5
    #"switch" = 6
    flip_speed = 5
    rail_balance = 7
    lip_balance = 3
    manual_balance = 4
    sponsors = [ element adio cky bam ]
    trick_mapping = { }
    default_trick_mapping = MargeraTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpMan_U_R_Triangle trickname = Trick_4thofJuly }
        { trickslot = SpAir_D_U_Square trickname = Trick_Jackass }
        { trickslot = SpGrind_D_U_Triangle trickname = Trick_FlipKickDad }
        { trickslot = SpLip_L_R_Triangle trickname = Trick_Russian }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      is_margera
    ]
    no_edit_groups = [
      head_options
      helmet_items
    ]
  }
  {
    display_name = "Rodney Mullen"
    first_name = "Rodney"
    default_appearance = appearance_mullen
    name = mullen
    stance = regular
    pushstyle = never_mongo
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 32
    hometown = "Gainsville, FL"
    points_available = 0
    air = 2
    hangtime = 2
    ollie = 6
    speed = 3
    spin = 8
    #"switch" = 7
    flip_speed = 7
    rail_balance = 5
    lip_balance = 2
    manual_balance = 8
    sponsors = [ enjoi globe tensor rodney ]
    trick_mapping = { }
    default_trick_mapping = MullenTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpAir_U_D_Square trickname = Trick_Gazelle }
        { trickslot = SpAir_L_R_Square trickname = Trick_SemiFlip }
        { trickslot = SpGrind_R_L_Triangle trickname = Trick_50Fingerflip }
        { trickslot = SpMan_R_D_Triangle trickname = Trick_RustySlide }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      is_mullen
    ]
    no_edit_groups = [
    ]
    no_edit_groups = [
      head_options
    ]
  }
  {
    display_name = "Chad Muska"
    first_name = "Chad"
    default_appearance = appearance_muska
    name = muska
    stance = regular
    pushstyle = never_mongo
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 24
    hometown = "Loraine, OH"
    points_available = 0
    air = 4
    hangtime = 4
    ollie = 8
    speed = 5
    spin = 5
    #"switch" = 5
    flip_speed = 5
    rail_balance = 8
    lip_balance = 3
    manual_balance = 3
    sponsors = [ shortys circa muskabeatz chad ]
    trick_mapping = { }
    default_trick_mapping = MuskaTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpGrind_R_D_Triangle trickname = Trick_MPCGrind }
        { trickslot = SpLip_R_L_Triangle trickname = Trick_BSNoseComply }
        { trickslot = SpGrind_L_D_Triangle trickname = Trick_SprayPaintGrind }
        { trickslot = SpGrind_D_U_Triangle trickname = Trick_Boombox }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    no_edit
  }
  {
    display_name = "Andrew Reynolds"
    first_name = "Andrew"
    default_appearance = appearance_reynolds
    name = reynolds
    stance = regular
    pushstyle = never_mongo
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 25
    hometown = "Lakeland, FL"
    points_available = 0
    air = 4
    hangtime = 2
    ollie = 8
    speed = 4
    spin = 5
    #"switch" = 7
    flip_speed = 5
    rail_balance = 8
    lip_balance = 4
    manual_balance = 3
    sponsors = [ baker emerica independent andrew ]
    trick_mapping = { }
    default_trick_mapping = ReynoldsTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpLip_L_R_Triangle trickname = Trick_DarkDisaster }
        { trickslot = SpAir_L_R_Circle trickname = Trick_BigSpinShifty }
        { trickslot = SpGrind_R_D_Triangle trickname = Trick_NoseSlideLipSlide }
        { trickslot = SpAir_U_R_Square trickname = Trick_QuadrupleHeelFlip }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      is_reynolds
    ]
    no_edit_groups = [
    ]
    no_edit_groups = [
      head_options
      helmet_items
    ]
  }
  {
    display_name = "Geoff Rowley"
    first_name = "Geoff"
    default_appearance = appearance_rowley
    name = rowley
    stance = regular
    pushstyle = never_mongo
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 25
    hometown = "Liverpool, England"
    points_available = 0
    air = 5
    hangtime = 2
    ollie = 7
    speed = 4
    spin = 3
    #"switch" = 5
    flip_speed = 6
    rail_balance = 8
    lip_balance = 7
    manual_balance = 3
    sponsors = [ Flip volcom vans geoff ]
    trick_mapping = { }
    default_trick_mapping = RowleyTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpGrind_U_R_Triangle trickname = Trick_RowleyDarkSlide }
        { trickslot = SpAir_D_R_Square trickname = Trick_AirCasperFlip }
        { trickslot = SpGrind_R_L_Triangle trickname = Trick_FerretGrind }
        { trickslot = SpMan_U_D_Triangle trickname = Trick_Sproing }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      is_rowley
    ]
  }
  {
    display_name = "Elissa Steamer"
    first_name = "Elissa"
    default_appearance = appearance_steamer
    name = steamer
    stance = regular
    pushstyle = never_mongo
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 0
    age = -1
    hometown = "Fort Myers, FL"
    points_available = 0
    air = 5
    hangtime = 5
    ollie = 5
    speed = 4
    spin = 5
    #"switch" = 5
    flip_speed = 5
    rail_balance = 6
    lip_balance = 5
    manual_balance = 5
    sponsors = [ bootleg etnies tsa elissa ]
    trick_mapping = { }
    default_trick_mapping = SteamerTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpAir_L_R_Circle trickname = Trick_JudoMadonna }
        { trickslot = SpMan_R_D_Triangle trickname = Trick_NoComplyLate360 }
        { trickslot = SpLip_R_L_Triangle trickname = Trick_BigSpinFliptoTail }
        { trickslot = SpGrind_L_R_Triangle trickname = Trick_CartwheelTo5050 }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      shows_panties
      not_with_elissa
    ]
    no_edit_groups = [
      head_options
      backpack_items
      helmet_items
      socks_items
    ]
  }
  {
    display_name = "Jamie Thomas"
    first_name = "Jamie"
    default_appearance = appearance_thomas
    name = thomas
    stance = regular
    pushstyle = never_mongo
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_male = 1
    age = 26
    hometown = "Dotham, AL"
    points_available = 0
    air = 4
    hangtime = 4
    ollie = 7
    speed = 5
    spin = 4
    #"switch" = 4
    flip_speed = 5
    rail_balance = 8
    lip_balance = 4
    manual_balance = 5
    sponsors = [ zero circa monster jamie ]
    trick_mapping = { }
    default_trick_mapping = ThomasTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpGrind_R_D_Triangle trickname = Trick_CrookedBigSpinFlip }
        { trickslot = SpMan_D_U_Triangle trickname = Trick_OneFootOneWheel }
        { trickslot = SpAir_L_U_Circle trickname = Trick_MightAsWellJump }
        { trickslot = SpGrind_L_R_Triangle trickname = Trick_AmericanHeroGrind }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
    lockout_flags = [
      is_clowny
    ]
    no_edit_groups = [
      head_options
      pad_options
    ]
  }
  {
    display_name = "Custom Skater"
    first_name = "Custom"
    file_name = "Unimplemented"
    default_appearance = appearance_custom_skater_male
    name = custom
    stance = regular
    pushstyle = never_mongo
    trickstyle = street
    is_pro = 0
    is_male = 1
    is_head_locked = 0
    is_locked = 0
    age = 16
    hometown = "Los Angeles, CA"
    points_available = 0
    air = 5
    hangtime = 5
    ollie = 5
    speed = 5
    spin = 5
    #"switch" = 5
    flip_speed = 5
    rail_balance = 5
    lip_balance = 5
    manual_balance = 5
    sponsors = [ ]
    trick_mapping = { }
    default_trick_mapping = CustomTricks
    max_specials = 4
    specials = {
      [
        { trickslot = SpAir_R_D_Circle trickname = Trick_McTwist }
        { trickslot = SpAir_L_R_Square trickname = Trick_KickFlipUnderFlip }
        { trickslot = SpAir_L_U_Square trickname = Trick_540Flip }
        { trickslot = SpGrind_R_D_Triangle trickname = Trick_Hurricane }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
  }
  {
    display_name = "Eddie"
    first_name = "Eddie"
    default_appearance = appearance_eddie
    name = eddie
    stance = regular
    pushstyle = never_mongo
    trickstyle = vert
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_hidden = 1
    is_male = 1
    is_secret
    age = -1
    hometown = "London, England"
    points_available = 0
    air = 5
    hangtime = 5
    ollie = 4
    speed = 5
    spin = 7
    #"switch" = 4
    flip_speed = 5
    rail_balance = 6
    lip_balance = 5
    manual_balance = 4
    sponsors = [ ]
    trick_mapping = { }
    default_trick_mapping = DarthMaulTricks
    unlock_flag = SKATER_UNLOCKED_EDDIE
    max_specials = 4
    no_edit
    no_edit_groups = [
      secret_options
    ]
    specials = {
      [
        { trickslot = SpAir_D_U_Circle trickname = Trick_StageDive }
        { trickslot = SpGrind_U_D_Triangle trickname = Trick_RockOutGrind }
        { trickslot = SpAir_R_L_Circle trickname = Trick_BloodyEddie }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
  }
  {
    display_name = "Jango Fett"
    first_name = "Jango"
    default_appearance = appearance_jango
    name = Jango
    stance = regular
    pushstyle = mongo_when_switch
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_hidden = 1
    is_secret
    is_male = 1
    age = -1
    hometown = "A Galaxy Far, Far Away"
    points_available = 0
    air = 7
    hangtime = 7
    ollie = 3
    speed = 7
    spin = 7
    #"switch" = 3
    flip_speed = 5
    rail_balance = 3
    lip_balance = 3
    manual_balance = 5
    sponsors = [ ]
    trick_mapping = { }
    default_trick_mapping = WolverineTricks
    unlock_flag = SKATER_UNLOCKED_JANGO
    no_edit
    no_edit_groups = [
      secret_options
    ]
    max_specials = 4
    specials = {
      [
        { trickslot = SpAir_L_R_Circle trickname = Trick_JumpJets }
        { trickslot = SpAir_R_D_Circle trickname = Trick_GrappleGrab }
        { trickslot = SpGrind_U_D_Triangle trickname = Trick_Quickdraw }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
  }
  {
    display_name = "Mike Vallely"
    first_name = "Mike"
    default_appearance = appearance_vallely
    name = vallely
    stance = goofy
    pushstyle = always_mongo
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_hidden = 1
    is_secret
    is_male = 1
    age = -1
    hometown = "Edison, NJ"
    points_available = 0
    air = 6
    hangtime = 6
    ollie = 4
    speed = 4
    spin = 5
    #"switch" = 4
    flip_speed = 5
    rail_balance = 5
    lip_balance = 5
    manual_balance = 6
    sponsors = [ vallely etnies mike ]
    trick_mapping = { }
    default_trick_mapping = VallelyTricks
    unlock_flag = SKATER_UNLOCKED_VALLELY
    max_specials = 4
    specials = {
      [
        { trickslot = SpGrind_L_R_Triangle trickname = Trick_ElbowSmash }
        { trickslot = SpMan_D_U_Triangle trickname = Trick_HoHoStreetPlant }
        { trickslot = SpAir_D_R_Circle trickname = Trick_Flamingo }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
  }
  {
    display_name = "Daisy"
    first_name = "Jenna"
    default_appearance = appearance_jenna
    name = jenna
    stance = regular
    pushstyle = never_mongo
    trickstyle = street
    is_pro = 1
    is_head_locked = 1
    is_locked = 1
    is_hidden = 1
    is_secret
    is_male = 0
    age = 27
    hometown = "Las Vegas, NV"
    points_available = 0
    air = 6
    hangtime = 5
    ollie = 6
    speed = 4
    spin = 5
    #"switch" = 5
    flip_speed = 5
    rail_balance = 4
    lip_balance = 6
    manual_balance = 4
    sponsors = [ ]
    trick_mapping = { }
    default_trick_mapping = CarreraTricks
    unlock_flag = SKATER_UNLOCKED_JENNA
    no_edit
    no_edit_groups = [
      board_options
      secret_options
    ]
    max_specials = 4
    specials = {
      [
        { trickslot = SpMan_U_D_Triangle trickname = Trick_SplitsManual }
        { trickslot = SpAir_R_D_Circle trickname = Trick_Sunbathin }
        { trickslot = SpGrind_L_R_Triangle trickname = Trick_HulaHoop }
        { trickslot = SpMan_R_L_Triangle trickname = Trick_DanceParty }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
        { trickslot = Unassigned trickname = Unassigned }
      ]
    }
  }
]
