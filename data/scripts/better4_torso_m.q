// How to categorize a new part:
//
// 1. In `master_editable_list` (cas_parts.q), find the part you want to add a category for, and add a
// `categories = ...` field. This field must be the name of an array containing multiple categories.
// This must be set for both M and F parts of the same type, since they will use the same part options (see #2).
//
// 2. In part options (skateshop.q, e.g. `edit_skater_torso_options`), set the `categorized` flag.
// This tells the menu to use the new category menu layout instead of the original scrolling menu.
//
// How to add an item to a category:
//
// 1. Add it to the base part list (e.g. `skater_m_torso`), then add its `desc_id` and `frontend_desc` as a new
// entry in the correct category (or add a new category).
//
// 2. See below for an example of what categories look like. Note that THPS4 should always be the first category,
// and changing categories left goes to the last entry in the list. Therefore, for it to maintain series order,
// the order should be something like `[thps4, thug, thug2, thps3, thps4 beta]` etc. It is backwards-compatibility safe to
// move the categories around, so don't worry too much.

better4_skater_m_torso_categories = [
    better4_skater_m_torso_thps4
    better4_skater_m_torso_beta
]

better4_skater_m_torso_thps4 = {
  label = "THPS4"
  items = [
    {
      desc_id = Shirtless
      frontend_desc = 'Shirtless'
    }
    {
      desc_id = #"T-shirt"
      frontend_desc = 'T-shirt'
    }
    {
      desc_id = #"Camo Shirt"
      frontend_desc = 'Camo Shirt'
    }
    {
      desc_id = #"Plaid Shirt"
      frontend_desc = 'Plaid Shirt'
    }
    {
      desc_id = #"Stripe Shirt 1"
      frontend_desc = 'Stripe Shirt 1'
    }
    {
      desc_id = #"Stripe Shirt 2"
      frontend_desc = 'Stripe Shirt 2'
    }
    {
      desc_id = #"Stripe Shirt 3"
      frontend_desc = 'Stripe Shirt 3'
    }
    {
      desc_id = #"Tie Dye"
      frontend_desc = 'Tie Dye'
    }
    {
      desc_id = #"Button Shirt"
      frontend_desc = 'Button Shirt'
    }
    {
      desc_id = #"Open Shirt"
      frontend_desc = 'Open Shirt'
    }
    {
      desc_id = #"Long Sleeve"
      frontend_desc = 'Long Sleeve'
    }
    {
      desc_id = #"Long Sleeve Stripe"
      frontend_desc = 'Long Sleeve Stripe'
    }
    {
      desc_id = #"LS Button Shirt"
      frontend_desc = 'LS Button Shirt'
    }
    {
      desc_id = #"LS Open Shirt"
      frontend_desc = 'LS Open Shirt'
    }
    {
      desc_id = #"LS Shirtless"
      frontend_desc = 'LS Shirtless'
    }
    {
      desc_id = #"LS Flannel Shirt"
      frontend_desc = 'LS Flannel Shirt'
    }
    {
      desc_id = #"Flannel Shirtless"
      frontend_desc = 'Flannel Shirtless'
    }
    {
      desc_id = Tanktop
      frontend_desc = 'Tanktop'
    }
    {
      desc_id = #"Basketball Jersey"
      frontend_desc = 'Basketball Jersey'
    }
    {
      desc_id = #"Hoody Up"
      frontend_desc = 'Hoody Up'
    }
    {
      desc_id = #"Hoody Up Stripe"
      frontend_desc = 'Hoody Up Stripe'
    }
    {
      desc_id = #"Hoody Down"
      frontend_desc = 'Hoody Down'
    }
    {
      desc_id = #"Hoody Down Stripe"
      frontend_desc = 'Hoody Down Stripe'
    }
    {
      desc_id = #"Denim Vest"
      frontend_desc = 'Denim Vest'
    }
    {
      desc_id = #"Leather Vest"
      frontend_desc = 'Leather Vest'
    }
    {
      desc_id = #"Baggy Vest"
      frontend_desc = 'Baggy Vest'
    }
    {
      desc_id = #"Camo Vest"
      frontend_desc = 'Camo Vest'
    }
    {
      desc_id = #"Padded Vest"
      frontend_desc = 'Padded Vest'
    }
    {
      desc_id = #"Flak Vest"
      frontend_desc = 'Flak Vest'
    }
    {
      desc_id = #"Snow Jacket"
      frontend_desc = 'Snow Jacket'
    }
    {
      desc_id = #"Padded Jacket"
      frontend_desc = 'Padded Jacket'
    }
    {
      desc_id = #"Leather Jacket"
      frontend_desc = 'Leather Jacket'
    }
    {
      desc_id = Windbreaker
      frontend_desc = 'Windbreaker'
    }
    {
      desc_id = Sweater
      frontend_desc = 'Sweater'
    }
    {
      desc_id = #"Football Jersey"
      frontend_desc = 'Football Jersey'
    }
    {
      desc_id = #"Officer Dick Shirt"
      frontend_desc = 'Officer Dick Shirt'
    }
    {
      desc_id = #"Ollie Coat"
      frontend_desc = 'Ollie Coat'
    }
    {
      desc_id = #"Burnquist Shirt"
      frontend_desc = 'Burnquist Shirt'
    }
    {
      desc_id = #"Caballero Shirt"
      frontend_desc = 'Caballero Shirt'
    }
    {
      desc_id = #"Campbell Shirt"
      frontend_desc = 'Campbell Shirt'
    }
    {
      desc_id = #"Glifberg Shirt"
      frontend_desc = 'Glifberg Shirt'
    }
    {
      desc_id = #"Koston Shirt"
      frontend_desc = 'Koston Shirt'
    }
    {
      desc_id = #"Hawk Shirt"
      frontend_desc = 'Hawk Shirt'
    }
    {
      desc_id = #"Lasek Shirt"
      frontend_desc = 'Lasek Shirt'
    }
    {
      desc_id = #"Margera Shirt"
      frontend_desc = 'Margera Shirt'
    }
    {
      desc_id = #"mullen shirt"
      frontend_desc = 'Mullen Shirt'
    }
    {
      desc_id = #"Muska Tanktop"
      frontend_desc = 'Muska Tanktop'
    }
    {
      desc_id = #"Reynolds Jacket"
      frontend_desc = 'Reynolds Jacket'
    }
    {
      desc_id = #"Rowley Jacket"
      frontend_desc = 'Rowley Jacket'
    }
    {
      desc_id = #"Thomas Shirt"
      frontend_desc = 'Thomas Shirt'
    }
    {
      desc_id = #"Vallely Shirt"
      frontend_desc = 'Vallely Shirt'
    }
    {
      desc_id = #"Neversoft Shirt"
      frontend_desc = 'Neversoft Shirt'
    }
    {
      desc_id = #"ATVI Shirt"
      frontend_desc = 'ATVI Shirt'
    }
  ]
}

better4_skater_m_torso_beta = {
  label = "Beta"
  items = [
    {
      desc_id = Shirtless
      frontend_desc = 'Shirtless'
    }
    {
      desc_id = #"Burnquist Shirt beta"
      frontend_desc = 'Burnquist Shirt'
    }
    {
      desc_id = #"Campbell Shirt beta"
      frontend_desc = 'Campbell Shirt'
    }
    {
      desc_id = #"Glifberg Shirt beta"
      frontend_desc = 'Glifberg Shirt'
    }
    {
      desc_id = #"Koston Shirt beta"
      frontend_desc = 'Koston Shirt'
    }
    {
      desc_id = #"Hawk Shirt beta"
      frontend_desc = 'Hawk Shirt'
    }
    {
      desc_id = #"Hawk Shirt Alt. beta"
      frontend_desc = 'Hawk Alt Shirt'
    }
    {
      desc_id = #"Lasek Shirt beta"
      frontend_desc = 'Lasek Shirt'
    }
    {
      desc_id = #"Thomas Shirt beta"
      frontend_desc = 'Thomas Shirt'
    }
  ]
}

skater_m_torso = [
  {
    desc_id = Shirtless
    frontend_desc = 'Shirtless'
    no_color
    is_clowny
  }
  {
    desc_id = #"T-shirt"
    frontend_desc = 'T-shirt'
    mesh = "models/better4/skater_m/shirt_tshirt.skin"
    supports_logo
    multicolor
  }
  {
    desc_id = #"Camo Shirt"
    frontend_desc = 'Camo Shirt'
    mesh = "models/better4/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_shirt.png"
    with = "textures/skater_m/CS_NH_shirt_camo"
    replace1 = "CS_NH_sleeve_short.png"
    with1 = "textures/skater_m/CS_NH_sleeve_short_camo"
    multicolor
  }
  {
    desc_id = #"Plaid Shirt"
    frontend_desc = 'Plaid Shirt'
    mesh = "models/better4/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_shirt.png"
    with = "textures/skater_m/CS_JB_shirt_plaid"
    replace1 = "CS_NH_sleeve_short.png"
    with1 = "textures/skater_m/CS_JB_sleeve_short_plaid"
    multicolor
  }
  {
    desc_id = #"Stripe Shirt 1"
    frontend_desc = 'Stripe Shirt 1'
    mesh = "models/better4/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_shirt.png"
    with = "textures/skater_m/CS_NH_shirt_stripe"
    multicolor
  }
  {
    desc_id = #"Stripe Shirt 2"
    frontend_desc = 'Stripe Shirt 2'
    mesh = "models/better4/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_shirt.png"
    with = "textures/skater_m/CS_JB_shirt_stripe2"
    replace1 = "CS_NH_sleeve_short.png"
    with1 = "textures/skater_m/CS_JB_sleeve_short_stripe2"
    multicolor
  }
  {
    desc_id = #"Stripe Shirt 3"
    frontend_desc = 'Stripe Shirt 3'
    mesh = "models/better4/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_shirt.png"
    with = "textures/skater_m/CS_JB_shirt_stripe3"
    replace1 = "CS_NH_sleeve_short.png"
    with1 = "textures/skater_m/CS_JB_sleeve_short_stripe3"
    multicolor
  }
  {
    desc_id = #"Tie Dye"
    frontend_desc = 'Tie Dye'
    mesh = "models/better4/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_shirt.png"
    with = "textures/skater_m/CS_JB_shirt_tiedye"
    replace1 = "CS_NH_sleeve_short.png"
    with1 = "textures/skater_m/CS_JB_sleeve_short_tiedye"
    multicolor
  }
  {
    desc_id = #"Button Shirt"
    frontend_desc = 'Button Shirt'
    mesh = "models/skater_m/shirt_ssbutton.skin"
    is_long_sleeve
  }
  {
    desc_id = #"Open Shirt"
    frontend_desc = 'Open Shirt'
    mesh = "models/skater_m/shirt_ssopen.skin"
    is_long_sleeve
  }
  {
    desc_id = #"Long Sleeve"
    frontend_desc = 'Long Sleeve'
    mesh = "models/better4/skater_m/shirt_T_longsleeve.skin"
    supports_logo
    is_long_sleeve
    multicolor
  }
  {
    desc_id = #"Long Sleeve Stripe"
    frontend_desc = 'Long Sleeve Stripe'
    mesh = "models/better4/skater_m/shirt_T_longsleeve.skin"
    replace = "CS_JB_shirt_Tlongsleeve.png"
    with = "textures/skater_m/CS_JB_shirt_TLSstripe"
    is_long_sleeve
    multicolor
  }
  {
    desc_id = #"LS Button Shirt"
    frontend_desc = 'LS Button Shirt'
    mesh = "models/skater_m/shirt_LSbutton.skin"
    is_long_sleeve
  }
  {
    desc_id = #"LS Open Shirt"
    frontend_desc = 'LS Open Shirt'
    mesh = "models/skater_m/shirt_lsopen.skin"
    is_long_sleeve
  }
  {
    desc_id = #"LS Shirtless"
    frontend_desc = 'LS Shirtless'
    mesh = "models/skater_m/shirt_thomas.skin"
    replace = "CS_NH_Thomas_shirt.png"
    with = "textures/skater_m/CS_NH_lasek_shirt"
    replace1 = "CS_NH_Thomas_sleeve.png"
    with1 = "textures/skater_m/CS_NH_lasek_sleeve"
    is_cab
    is_long_sleeve
  }
  {
    desc_id = #"LS Flannel Shirt"
    frontend_desc = 'LS Flannel Shirt'
    mesh = "models/skater_m/shirt_LSbutton.skin"
    replace = "CS_JB_shirt_buttoncollar.png"
    with = "textures/skater_m/CS_JB_shirt_buttonflannel"
    replace1 = "CS_JB_sleeve_long.png"
    with1 = "textures/skater_m/CS_JB_sleeve_longflannel"
    is_long_sleeve
  }
  {
    desc_id = #"Flannel Shirtless"
    frontend_desc = 'Flannel Shirtless'
    mesh = "models/skater_m/shirt_thomas.skin"
    replace = "CS_NH_Thomas_shirt.png"
    with = "textures/skater_m/CS_JB_shirt_buttonflannel"
    replace1 = "CS_NH_Thomas_sleeve.png"
    with1 = "textures/skater_m/CS_JB_sleeve_longflannel"
    is_cab
    is_long_sleeve
  }
  {
    desc_id = Tanktop
    frontend_desc = 'Tanktop'
    mesh = "models/skater_m/shirt_tanktop.skin"
    supports_logo
  }
  {
    desc_id = #"Basketball Jersey"
    frontend_desc = 'Basketball Jersey'
    mesh = "models/skater_m/shirt_basketball.skin"
  }
  {
    desc_id = #"Hoody Up"
    frontend_desc = 'Hoody Up'
    mesh = "models/skater_m/shirt_lshoodup.skin"
    is_hawk
    is_cab
    is_glifberg
    is_burnquist
    is_clowny
    is_lasek
    is_margera
    is_mullen
    is_reynolds
    supports_logo
    no_back_logo
    is_long_sleeve
  }
  {
    desc_id = #"Hoody Up Stripe"
    frontend_desc = 'Hoody Up Stripe'
    mesh = "models/skater_m/shirt_lshoodup.skin"
    replace = "CS_JB_shirt_hoodyup1.png"
    with = "textures/skater_m/CS_JB_shirt_hoodyupstripe1"
    replace1 = "CS_JB_shirt_hoodyup2.png"
    with1 = "textures/skater_m/CS_JB_shirt_hoodyupstripe2"
    replace2 = "CS_JB_sleeve_hoodyup.png"
    with2 = "textures/skater_m/CS_JB_sleeve_hoodyupstripe"
    is_hawk
    is_cab
    is_glifberg
    is_burnquist
    is_clowny
    is_lasek
    is_margera
    is_mullen
    is_reynolds
    is_long_sleeve
  }
  {
    desc_id = #"Hoody Down"
    frontend_desc = 'Hoody Down'
    mesh = "models/skater_m/shirt_lshooddown.skin"
    supports_logo
    no_back_logo
    is_long_sleeve
  }
  {
    desc_id = #"Hoody Down Stripe"
    frontend_desc = 'Hoody Down Stripe'
    mesh = "models/skater_m/shirt_lshooddown.skin"
    replace = "CS_JB_shirt_hoodydown.png"
    with = "textures/skater_m/CS_JB_shirt_hoodydownstripe"
    replace1 = "CS_JB_sleeve_hoodydown.png"
    with1 = "textures/skater_m/CS_JB_sleeve_hoodydownstripe"
    is_long_sleeve
  }
  {
    desc_id = #"Denim Vest"
    frontend_desc = 'Denim Vest'
    mesh = "models/skater_m/shirt_rockervest.skin"
  }
  {
    desc_id = #"Leather Vest"
    frontend_desc = 'Leather Vest'
    mesh = "models/skater_m/shirt_rockervest.skin"
    replace = "CS_NN_Shirt_rockervest01.png"
    with = "textures/skater_m/CS_JB_shirt_leathervest"
  }
  {
    desc_id = #"Baggy Vest"
    frontend_desc = 'Baggy Vest'
    mesh = "models/skater_m/shirt_baggyvest.skin"
    replace = "CS_NH_baggyvest_camo.png"
    with = "textures/skater_m/CS_JB_shirt_bagvest"
  }
  {
    desc_id = #"Camo Vest"
    frontend_desc = 'Camo Vest'
    mesh = "models/skater_m/shirt_baggyvest.skin"
  }
  {
    desc_id = #"Padded Vest"
    frontend_desc = 'Padded Vest'
    mesh = "models/skater_m/shirt_baggyvest.skin"
    replace = "CS_NH_baggyvest_camo.png"
    with = "textures/skater_m/CS_JB_shirt_bagvest_padded"
  }
  {
    desc_id = #"Flak Vest"
    frontend_desc = 'Flak Vest'
    mesh = "models/skater_m/shirt_baggyvest.skin"
    replace = "CS_NH_baggyvest_camo.png"
    with = "textures/skater_m/CS_JB_shirt_bagvest_flak"
  }
  {
    desc_id = #"Snow Jacket"
    frontend_desc = 'Snow Jacket'
    mesh = "models/better4/skater_m/shirt_snowjacket.skin"
    is_long_sleeve
    multicolor
  }
  {
    desc_id = #"Padded Jacket"
    frontend_desc = 'Padded Jacket'
    mesh = "models/better4/skater_m/shirt_snowjacket.skin"
    replace = "CS_JB_shirt_snowjacket.png"
    with = "textures/skater_m/CS_JB_shirt_snowjacket_padded"
    replace1 = "CS_JB_sleeve_snowjacket.png"
    with1 = "textures/skater_m/CS_JB_sleeve_snowjacket_padded"
    is_long_sleeve
    multicolor
  }
  {
    desc_id = #"Leather Jacket"
    frontend_desc = 'Leather Jacket'
    mesh = "models/better4/skater_m/shirt_leatherjacket.skin"
    is_long_sleeve
    multicolor
  }
  {
    desc_id = Windbreaker
    frontend_desc = 'Windbreaker'
    mesh = "models/skater_m/shirt_windbreaker.skin"
    is_long_sleeve
  }
  {
    desc_id = Sweater
    frontend_desc = 'Sweater'
    mesh = "models/skater_m/shirt_sweater.skin"
    is_long_sleeve
  }
  {
    desc_id = #"Football Jersey"
    frontend_desc = 'Football Jersey'
    mesh = "models/skater_m/shirt_football.skin"
    is_long_sleeve
  }
  {
    desc_id = #"Officer Dick Shirt"
    frontend_desc = 'Officer Dick Shirt'
    mesh = "models/skater_m/shirt_officer.skin"
    unlock_flag = CAS_UNLOCK_11
    is_clowny
    is_long_sleeve
  }
  {
    desc_id = #"Ollie Coat"
    frontend_desc = 'Ollie Coat'
    mesh = "models/skater_m/shirt_ollie.skin"
    unlock_flag = CAS_UNLOCK_12
    is_long_sleeve
  }
  {
    desc_id = #"Burnquist Shirt"
    frontend_desc = 'Burnquist Shirt'
    mesh = "models/skater_m/shirt_LSbutton.skin"
    replace = "CS_JB_shirt_buttoncollar.png"
    with = "textures/skater_m/CS_NH_burnquist_shirt"
    replace1 = "CS_JB_sleeve_long.png"
    with1 = "textures/skater_m/CS_NH_burnquist_sleeve"
    is_long_sleeve
  }
  {
    desc_id = #"Burnquist Shirt beta"
    frontend_desc = 'Burnquist Shirt (Beta)'
    mesh = "models/better4/skater_m/shirt_burnquist_beta.skin"
  }
  {
    desc_id = #"Caballero Shirt"
    frontend_desc = 'Caballero Shirt'
    mesh = "models/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_shirt.png"
    with = "textures/skater_m/CS_NH_Hawk_shirt"
    replace1 = "CS_NH_sleeve_short.png"
    with1 = "textures/skater_m/CS_NH_hawk_sleeve"
    replace2 = "CS_NH_logo_none.png"
    with2 = "textures/logos/Sht_faction02"
    replace3 = "CS_NH_logo_none2.png"
    with3 = "textures/logos/Sht_faction01"
  }
  {
    desc_id = #"Campbell Shirt"
    frontend_desc = 'Campbell Shirt'
    mesh = "models/skater_m/shirt_campbell.skin"
  }
  {
    desc_id = #"Campbell Shirt beta"
    frontend_desc = 'Campbell Shirt (Beta)'
    mesh = "models/better4/skater_m/shirt_campbell_beta.skin"
  }
  {
    desc_id = #"Glifberg Shirt"
    frontend_desc = 'Glifberg Shirt'
    mesh = "models/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_shirt.png"
    with = "textures/skater_m/CS_NH_glifberg_shirt"
    replace1 = "CS_NH_sleeve_short.png"
    with1 = "textures/skater_m/CS_NH_glifberg_sleeve"
    replace2 = "CS_NH_logo_none.png"
    with2 = "textures/logos/sht_flip01"
  }
  {
    desc_id = #"Glifberg Shirt beta"
    frontend_desc = 'Glifberg Shirt (Beta)'
    mesh = "models/better4/skater_m/shirt_glifberg_beta.skin"
  }
  {
    desc_id = #"Koston Shirt"
    frontend_desc = 'Koston Shirt'
    mesh = "models/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_logo_none.png"
    with = "textures/logos/Sht_KostonF02"
    replace1 = "CS_NH_logo_none2.png"
    with1 = "textures/logos/Sht_KostonF01"
  }
  {
    desc_id = #"Koston Shirt beta"
    frontend_desc = 'Koston Shirt (Beta)'
    mesh = "models/better4/skater_m/shirt_koston_Beta.skin"
  }  
  {
    desc_id = #"Hawk Shirt"
    frontend_desc = 'Hawk Shirt'
    mesh = "models/better4/skater_m/shirt_hawk.skin"
    is_long_sleeve
    multicolor
  }
  {
    desc_id = #"Hawk Shirt beta"
    frontend_desc = 'Hawk Shirt (Beta)'
    mesh = "models/better4/skater_m/shirt_hawk_beta.skin"
  }
  {
    desc_id = #"Hawk Shirt Alt. beta"
    frontend_desc = 'Hawk Alt Shirt (Beta)'
    mesh = "models/better4/skater_m/shirt_hawkalt_beta.skin"
    is_long_sleeve
  }
  {
    desc_id = #"Lasek Shirt"
    frontend_desc = 'Lasek Shirt'
    mesh = "models/skater_m/shirt_lsopen.skin"
    replace = "CS_NH_buttoncollar.png"
    with = "textures/skater_m/CS_NH_lasek_shirt"
    replace1 = "CS_NH_sleeve_long.png"
    with1 = "textures/skater_m/CS_NH_lasek_sleeve"
    replace2 = "CS_NH_undershirt.png"
    with2 = "textures/skater_m/CS_NN_lasek_ushirt"
    is_long_sleeve
  }
  {
    desc_id = #"Lasek Shirt beta"
    frontend_desc = 'Lasek Shirt (Beta)'
    mesh = "models/better4/skater_m/shirt_lasek_beta.skin"
  }
  {
    desc_id = #"Margera Shirt"
    frontend_desc = 'Margera Shirt'
    mesh = "models/skater_m/shirt_margera.skin"
    is_long_sleeve
  }
  {
    desc_id = #"mullen shirt"
    frontend_desc = 'Mullen Shirt'
    mesh = "models/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_shirt.png"
    with = "textures/skater_m/CS_NH_mullen_shirt"
    replace1 = "CS_NH_sleeve_short.png"
    with1 = "textures/skater_m/CS_NH_mullen_sleeve"
    replace2 = "CS_NH_logo_none.png"
    with2 = "textures/logos/CS_NH_logo_college"
  }
  {
    desc_id = #"Muska Tanktop"
    frontend_desc = 'Muska Tanktop'
    mesh = "models/skater_m/shirt_muska.skin"
  }
  {
    desc_id = #"Reynolds Jacket"
    frontend_desc = 'Reynolds Jacket'
    mesh = "models/better4/skater_m/shirt_reynolds_jacket.skin"
    is_long_sleeve
    multicolor
  }
  {
    desc_id = #"Rowley Jacket"
    frontend_desc = 'Rowley Jacket'
    mesh = "models/better4/skater_m/shirt_rowley_jacket.skin"
    is_long_sleeve
    multicolor
  }
  {
    desc_id = #"Thomas Shirt"
    frontend_desc = 'Thomas Shirt'
    mesh = "models/skater_m/shirt_thomas.skin"
    is_long_sleeve
  }
  {
    desc_id = #"Thomas Shirt beta"
    frontend_desc = 'Thomas Shirt (Beta)'
    mesh = "models/better4/skater_m/shirt_thomas_beta.skin"
    is_long_sleeve
  }
  {
    desc_id = #"Vallely Shirt"
    frontend_desc = 'Vallely Shirt'
    mesh = "models/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_shirt.png"
    with = "textures/skater_m/CS_NH_koston_shirt"
    replace1 = "CS_NH_sleeve_short.png"
    with1 = "textures/skater_m/CS_NH_koston_sleeve"
    replace2 = "CS_NH_logo_none.png"
    with2 = "textures/logos/Sht_vallely01small"
    replace3 = "CS_NH_logo_none2.png"
    with3 = "textures/logos/Sht_vallely01"
    only_if_unlocked = Vallely
  }
  {
    desc_id = #"Neversoft Shirt"
    frontend_desc = 'Neversoft Shirt'
    mesh = "models/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_shirt.png"
    with = "textures/skater_m/CS_NH_Hawk_shirt"
    replace1 = "CS_NH_sleeve_short.png"
    with1 = "textures/skater_m/CS_NH_hawk_sleeve"
    replace2 = "CS_NH_logo_none.png"
    with2 = "textures/logos/Sht_neversoft01"
    replace3 = "CS_NH_logo_none2.png"
    with3 = "textures/logos/Sht_thps401"
  }
  {
    desc_id = #"ATVI Shirt"
    frontend_desc = 'ATVI Shirt'
    mesh = "models/skater_m/shirt_tshirt.skin"
    replace = "CS_NH_logo_none.png"
    with = "textures/logos/Sht_activision01"
  }
]
