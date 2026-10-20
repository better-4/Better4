better4_skater_f_torso_categories = [
    better4_skater_f_torso_thps4
    better4_skater_f_torso_beta
]

better4_skater_f_torso_thps4 = {
  label = "THPS4"
  items = [
    {
      desc_id = None
      frontend_desc = 'None'
    }
    {
      desc_id = #"T-shirt"
      frontend_desc = 'T-Shirt'
    }
    {
      desc_id = #"Camo T-shirt"
      frontend_desc = 'Camo T-Shirt'
    }
    {
      desc_id = #"Sport T-shirt"
      frontend_desc = 'Sport T-Shirt'
    }
    {
      desc_id = #"Tanktop short"
      frontend_desc = 'Tanktop Short'
    }
    {
      desc_id = Tanktop
      frontend_desc = 'Tanktop'
    }
    {
      desc_id = #"Dip-Dye Tank1"
      frontend_desc = 'Dip-dye Tank 1'
    }
    {
      desc_id = #"Dip-Dye Tank2"
      frontend_desc = 'Dip-dye Tank 2'
    }
    {
      desc_id = #"Floral Tank"
      frontend_desc = 'Floral Tank'
    }
    {
      desc_id = #"V-Neck"
      frontend_desc = 'V-Neck'
    }
    {
      desc_id = #"V-Neck Tie-Die"
      frontend_desc = 'V-Neck Tie-Dye'
    }
    {
      desc_id = #"V-Neck Dip-Dye"
      frontend_desc = 'V-Neck Dip-Dye'
    }
    {
      desc_id = #"V-Neck Floral"
      frontend_desc = 'V-Neck Floral'
    }
    {
      desc_id = #"V-Neck Stripes"
      frontend_desc = 'V-Neck Stripes'
    }
    {
      desc_id = #"V-Neck Flower"
      frontend_desc = 'V-Neck Flower'
    }
    {
      desc_id = Jersey
      frontend_desc = 'Jersey'
    }
    {
      desc_id = #"RS Blouse"
      frontend_desc = 'RS Blouse'
    }
    {
      desc_id = #"RS Blouse Plaid"
      frontend_desc = 'RS Blouse Plaid'
    }
    {
      desc_id = #"LS Blouse"
      frontend_desc = 'LS Blouse'
    }
    {
      desc_id = #"LS Blouse Plaid"
      frontend_desc = 'LS Blouse Plaid'
    }
    {
      desc_id = #"Denim Jacket"
      frontend_desc = 'Denim Jacket'
    }
    {
      desc_id = #"Baggy Vest"
      frontend_desc = 'Baggy Vest'
    }
    {
      desc_id = #"Sniper Vest"
      frontend_desc = 'Sniper Vest'
    }
    {
      desc_id = #"Leather Vest"
      frontend_desc = 'Leather Vest'
    }
    {
      desc_id = #"Padded Vest"
      frontend_desc = 'Padded Vest'
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
      desc_id = #"Steamer shirt"
      frontend_desc = 'Steamer Shirt'
    }
    {
      desc_id = #"Tube Top"
      frontend_desc = 'Tube Top'
    }
    {
      desc_id = #"Campbell Shirt F"
      frontend_desc = 'Campbell Shirt'
    }
    {
      desc_id = #"Rowley Jacket"
      frontend_desc = 'Rowley Jacket'
    }
  ]
}

better4_skater_f_torso_beta = {
  label = "Beta"
  items = [
    {
      desc_id = #"Steamer shirt beta"
      frontend_desc = 'Steamer Shirt'
    }
    {
      desc_id = #"Koston Shirt beta F"
      frontend_desc = 'Koston Shirt'
    }
    {
      desc_id = #"Hawk Shirt beta F"
      frontend_desc = 'Hawk Shirt'
    }
    {
      desc_id = #"Glifberg Shirt beta F"
      frontend_desc = 'Glifberg Shirt'
    }
    {
      desc_id = #"Campbell Shirt beta F"
      frontend_desc = 'Campbell Shirt'
    }
  ]
}

skater_f_torso = [
  {
    desc_id = None
    frontend_desc = 'None'
    only_with = [ JENNA ]
    no_color
  }
  {
    desc_id = #"T-shirt"
    frontend_desc = 'T-Shirt'
    mesh = "models/better4/skater_f/shirt_tshirt.skin"
    supports_logo
    multicolor
  }
  {
    desc_id = #"Camo T-shirt"
    frontend_desc = 'Camo T-Shirt'
    mesh = "models/better4/skater_f/shirt_tshirt.skin"
    replace = "CS_JB_F_shirt_tshirt.png"
    with = "textures/skater_m/CS_JB_F_shirt_tshirt_camo"
    replace1 = "CS_JB_F_sleeve_tshirt.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_tshirt_camo"
    multicolor
  }
  {
    desc_id = #"Sport T-shirt"
    frontend_desc = 'Sport T-Shirt'
    mesh = "models/better4/skater_f/shirt_tshirt.skin"
    replace = "CS_JB_F_sleeve_tshirt.png"
    with = "textures/skater_m/CS_JB_F_sleeve_tshirt_sport"
    multicolor
  }
  {
    desc_id = #"Tanktop short"
    frontend_desc = 'Tanktop Short'
    mesh = "models/skater_f/shirt_tanktop_2.skin"
    supports_logo
    no_back_logo
    shows_panties
  }
  {
    desc_id = Tanktop
    frontend_desc = 'Tanktop'
    mesh = "models/skater_f/shirt_tanktop.skin"
    supports_logo
    no_back_logo
    shows_panties
  }
  {
    desc_id = #"Dip-Dye Tank1"
    frontend_desc = 'Dip-dye Tank 1'
    mesh = "models/skater_f/shirt_tanktop.skin"
    replace = "CS_NH_female_tanktop.png"
    with = "textures/skater_m/CS_NH_female_tanktop_dye"
    shows_panties
  }
  {
    desc_id = #"Dip-Dye Tank2"
    frontend_desc = 'Dip-dye Tank 2'
    mesh = "models/skater_f/shirt_tanktop.skin"
    replace = "CS_NH_female_tanktop.png"
    with = "textures/skater_m/CS_JB_F_shirt_tanktop_dye"
    shows_panties
  }
  {
    desc_id = #"Floral Tank"
    frontend_desc = 'Floral Tank'
    mesh = "models/skater_f/shirt_tanktop.skin"
    replace = "CS_NH_female_tanktop.png"
    with = "textures/skater_m/CS_JB_F_shirt_tanktop_floral"
    shows_panties
  }
  {
    desc_id = #"V-Neck"
    frontend_desc = 'V-Neck'
    mesh = "models/better4/skater_f/shirt_SSVneck.skin"
    shows_panties
    multicolor
  }
  {
    desc_id = #"V-Neck Tie-Die"
    frontend_desc = 'V-Neck Tie-Dye'
    mesh = "models/better4/skater_f/shirt_SSVneck.skin"
    replace = "CS_JB_F_shirt_vneck.png"
    with = "textures/skater_m/CS_JB_F_shirt_vneck_tiedye"
    replace1 = "CS_JB_F_sleeve_vneck.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_vneck_tiedye"
    shows_panties
    multicolor
  }
  {
    desc_id = #"V-Neck Dip-Dye"
    frontend_desc = 'V-Neck Dip-Dye'
    mesh = "models/better4/skater_f/shirt_SSVneck.skin"
    replace = "CS_JB_F_shirt_vneck.png"
    with = "textures/skater_m/CS_JB_F_shirt_vneck_dye"
    replace1 = "CS_JB_F_sleeve_vneck.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_vneck_dye"
    shows_panties
    multicolor
  }
  {
    desc_id = #"V-Neck Floral"
    frontend_desc = 'V-Neck Floral'
    mesh = "models/better4/skater_f/shirt_SSVneck.skin"
    replace = "CS_JB_F_shirt_vneck.png"
    with = "textures/skater_m/CS_JB_F_shirt_vneck_floral"
    replace1 = "CS_JB_F_sleeve_vneck.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_vneck_floral"
    shows_panties
    multicolor
  }
  {
    desc_id = #"V-Neck Stripes"
    frontend_desc = 'V-Neck Stripes'
    mesh = "models/better4/skater_f/shirt_SSVneck.skin"
    replace = "CS_JB_F_shirt_vneck.png"
    with = "textures/skater_m/CS_JB_F_shirt_vneck_stripes"
    replace1 = "CS_JB_F_sleeve_vneck.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_vneck_stripes"
    shows_panties
    multicolor
  }
  {
    desc_id = #"V-Neck Flower"
    frontend_desc = 'V-Neck Flower'
    mesh = "models/better4/skater_f/shirt_SSVneck.skin"
    replace = "CS_JB_F_shirt_vneck.png"
    with = "textures/skater_m/CS_JB_F_shirt_vneck_flower"
    shows_panties
    multicolor
  }
  {
    desc_id = Jersey
    frontend_desc = 'Jersey'
    mesh = "models/better4/skater_f/shirt_jersey.skin"
    shows_panties
    multicolor
  }
  {
    desc_id = #"RS Blouse"
    frontend_desc = 'RS Blouse'
    mesh = "models/skater_f/shirt_RSbutton.skin"
    is_long_sleeve
  }
  {
    desc_id = #"RS Blouse Plaid"
    frontend_desc = 'RS Blouse Plaid'
    mesh = "models/skater_f/shirt_RSbutton.skin"
    replace = "CS_JB_F_shirt_buttondwn.png"
    with = "textures/skater_m/CS_JB_F_shirt_buttondwn_plaid"
    replace1 = "CS_JB_F_sleeve_buttondwn.png"
    with1 = "textures/skater_m/CS_JB_F_sleeve_buttondwn_plaid"
    is_long_sleeve
  }
  {
    desc_id = #"LS Blouse"
    frontend_desc = 'LS Blouse'
    mesh = "models/skater_f/shirt_LSbutton.skin"
    is_long_sleeve
  }
  {
    desc_id = #"LS Blouse Plaid"
    frontend_desc = 'LS Blouse Plaid'
    mesh = "models/skater_f/shirt_LSbutton.skin"
    replace = "CS_JB_F_shirt_buttondwn.png"
    with = "textures/skater_m/CS_JB_shirt_buttonflannel"
    replace1 = "CS_JB_F_sleeve_buttondwn.png"
    with1 = "textures/skater_m/CS_JB_sleeve_longflannel"
    is_long_sleeve
  }
  {
    desc_id = #"Denim Jacket"
    frontend_desc = 'Denim Jacket'
    mesh = "models/better4/skater_f/shirt_denimjacket.skin"
    shows_panties
    is_long_sleeve
    multicolor
  }
  {
    desc_id = #"Baggy Vest"
    frontend_desc = 'Baggy Vest'
    mesh = "models/better4/skater_f/shirt_baggyvest.skin"
    shows_panties
    multicolor
  }
  {
    desc_id = #"Sniper Vest"
    frontend_desc = 'Sniper Vest'
    mesh = "models/better4/skater_f/shirt_baggyvest.skin"
    replace = "CS_NH_baggyvest.png"
    with = "textures/skater_m/CS_NH_baggyvest_flak"
    shows_panties
    multicolor
  }
  {
    desc_id = #"Leather Vest"
    frontend_desc = 'Leather Vest'
    mesh = "models/better4/skater_f/shirt_baggyvest.skin"
    replace = "CS_NH_baggyvest.png"
    with = "textures/skater_m/CS_NH_leathervest"
    shows_panties
    multicolor
  }
  {
    desc_id = #"Padded Vest"
    frontend_desc = 'Padded Vest'
    mesh = "models/better4/skater_f/shirt_baggyvest.skin"
    replace = "CS_NH_baggyvest.png"
    with = "textures/skater_m/CS_NH_baggyvest_padded"
    shows_panties
    multicolor
  }
  {
    desc_id = #"Snow Jacket"
    frontend_desc = 'Snow Jacket'
    mesh = "models/better4/skater_f/shirt_snowjacket.skin"
    is_long_sleeve
    multicolor
  }
  {
    desc_id = #"Padded Jacket"
    frontend_desc = 'Padded Jacket'
    mesh = "models/better4/skater_f/shirt_snowjacket.skin"
    replace = "CS_JB_F_shirt_snowjacket.png"
    with = "textures/skater_m/CS_NH_snowjacket_padded"
    is_long_sleeve
    multicolor
  }
  {
    desc_id = #"Hoody Up"
    frontend_desc = 'Hoody Up'
    mesh = "models/skater_f/shirt_lshoodup.skin"
    supports_logo
    no_back_logo
    is_long_sleeve
  }
  {
    desc_id = #"Hoody Up Stripe"
    frontend_desc = 'Hoody Up Stripe'
    mesh = "models/skater_f/shirt_lshoodup.skin"
    replace = "CS_JB_shirt_hoodyup1.png"
    with = "textures/skater_m/CS_JB_shirt_hoodyupstripe1"
    replace1 = "CS_JB_shirt_hoodyup2.png"
    with1 = "textures/skater_m/CS_JB_shirt_hoodyupstripe2"
    replace2 = "CS_JB_sleeve_hoodyup.png"
    with2 = "textures/skater_m/CS_JB_sleeve_hoodyupstripe"
    is_long_sleeve
  }
  {
    desc_id = #"Hoody Down"
    frontend_desc = 'Hoody Down'
    mesh = "models/skater_f/shirt_lshooddown.skin"
    supports_logo
    no_back_logo
    is_long_sleeve
  }
  {
    desc_id = #"Hoody Down Stripe"
    frontend_desc = 'Hoody Down Stripe'
    mesh = "models/skater_f/shirt_lshooddown.skin"
    replace = "CS_JB_shirt_hoodydown.png"
    with = "textures/skater_m/CS_JB_shirt_hoodydownstripe"
    replace1 = "CS_JB_sleeve_hoodydown.png"
    with1 = "textures/skater_m/CS_JB_sleeve_hoodydownstripe"
    is_long_sleeve
  }
  {
    desc_id = #"Steamer shirt"
    frontend_desc = 'Steamer Shirt'
    mesh = "models/skater_f/shirt_steamer.skin"
  }
  {
    desc_id = #"Steamer shirt beta"
    frontend_desc = 'Steamer Shirt (Beta)'
    mesh = "models/better4/skater_f/shirt_steamer_beta.skin"
  }
  {
    desc_id = #"Tube Top"
    frontend_desc = 'Tube Top'
    mesh = "models/skater_f/shirt_jennatube.skin"
  }
  {
    desc_id = #"Koston Shirt beta F"
    frontend_desc = 'Koston Shirt (Beta)'
    mesh = "models/better4/skater_f/shirt_koston_beta.skin"
  }  
  {
    desc_id = #"Hawk Shirt beta F"
    frontend_desc = 'Hawk Shirt (Beta)'
    mesh = "models/better4/skater_f/shirt_hawk_beta.skin"
  }  
  {
    desc_id = #"Glifberg Shirt beta F"
    frontend_desc = 'Glifberg Shirt (Beta)'
    mesh = "models/better4/skater_f/shirt_glifberg_beta.skin"
  }  
  {
    desc_id = #"Campbell Shirt F"
    frontend_desc = 'Campbell Shirt'
    mesh = "models/better4/skater_f/shirt_campbell_F.skin"
  }
  {
    desc_id = #"Campbell Shirt beta F"
    frontend_desc = 'Campbell Shirt (Beta)'
    mesh = "models/better4/skater_f/shirt_campbell_beta.skin"
  }  
  {
    desc_id = #"Rowley Jacket"
    frontend_desc = 'Rowley Jacket'
    mesh = "models/better4/skater_f/THPS4_Rowley_Jacket_F.skin"
    is_long_sleeve
    multicolor
  }
]
