helmet = [
  {
    desc_id = None
    frontend_desc = 'None'
    null_item
    is_burnquist
    is_lasek
  }
  {
    desc_id = #"Skate Helmet 1"
    frontend_desc = 'Skate Helmet 1'
    mesh = "models/skater_m/hat_helmet.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
      ClearPart part = hat
    endscript
    supports_logo
    is_reynolds
    is_margera
    is_cab
  }
  {
    desc_id = #"Skate Helmet 2"
    frontend_desc = 'Skate Helmet 2'
    mesh = "models/skater_m/hat_helmet2.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
      ClearPart part = hat
    endscript
    supports_logo
    is_reynolds
    is_margera
    is_cab
  }
  {
    desc_id = #"Cab Helmet 1"
    frontend_desc = 'Skate Helmet'
    mesh = "models/skater_m/hat_helmet_cab.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
      ClearPart part = hat
    endscript
    supports_logo
    is_reynolds
    is_margera
  }
]

accessoriesM = [
  {
    desc_id = None
    frontend_desc = 'None'
    no_color
  }
  {
    desc_id = #"Bull Ring"
    frontend_desc = 'Bull Ring'
    mesh = "models/better4/shared/miscitems/extra_bullring_thug2.skin"
  }
]

accessoriesM_f = [
  {
    desc_id = None
    frontend_desc = 'None'
    no_color
  }
  {
    desc_id = #"Bull Ring F"
    frontend_desc = 'Bull Ring'
    mesh = "models/better4/shared/miscitems/extra_bullring_thug2F.skin"
  }
]

accessoriesL = [
  {
    desc_id = None
    frontend_desc = 'None'
    no_color
  }
  {
    desc_id = #"Wrist Band L"
    frontend_desc = 'Wrist Band'
    mesh = "models/skater_m/extra_wristbandL.skin"
  }
  {
    desc_id = #"Koston band L"
    frontend_desc = 'Koston band'
    mesh = "models/skater_m/extra_wristbandL.skin"
    replace = "CS_NN_extra_Wristband01.png"
    with = "textures/skater_m/CS_NH_koston_extras"
  }
  {
    desc_id = #"Wrist Watch L"
    frontend_desc = 'Wrist Watch'
    mesh = "models/skater_m/extra_watchL.skin"
  }
  {
    desc_id = #"Gold Watch L"
    frontend_desc = 'Gold Watch L'
    mesh = "models/skater_m/extra_watchL.skin"
    replace = "CS_NN_Watch.png"
    with = "textures/skater_m/CS_NN_Watch04"
  }
  {
    desc_id = #"Rocker Watch L"
    frontend_desc = 'Rocker Watch'
    mesh = "models/skater_m/extra_wristbandL.skin"
    replace = "CS_NN_extra_Wristband01.png"
    with = "textures/skater_m/CS_NN_extra_rockerwatch"
  }
  {
    desc_id = #"Wrist Tape L"
    frontend_desc = 'Wrist Tape'
    mesh = "models/better4/shared/accessories/extra_wristape_L.skin"
  }
]

accessoriesR = [
  {
    desc_id = None
    frontend_desc = 'None'
    no_color
  }
  {
    desc_id = #"Wrist Band R"
    frontend_desc = 'Wrist Band'
    mesh = "models/skater_m/extra_wristbandR.skin"
  }
  {
    desc_id = #"Koston band R"
    frontend_desc = 'Koston band'
    mesh = "models/skater_m/extra_wristbandR.skin"
    replace = "CS_NN_extra_Wristband01.png"
    with = "textures/skater_m/CS_NH_koston_extras"
  }
  {
    desc_id = #"Wrist Watch R"
    frontend_desc = 'Wrist Watch'
    mesh = "models/skater_m/extra_watch.skin"
  }
  {
    desc_id = #"Gold Watch R"
    frontend_desc = 'Gold Watch'
    mesh = "models/skater_m/extra_watch.skin"
    replace = "CS_NN_Watch.png"
    with = "textures/skater_m/CS_NN_Watch04"
  }
  {
    desc_id = #"Rocker Watch R"
    frontend_desc = 'Rocker Watch'
    mesh = "models/skater_m/extra_wristbandR.skin"
    replace = "CS_NN_extra_Wristband01.png"
    with = "textures/skater_m/CS_NN_extra_rockerwatch"
  }
  {
    desc_id = #"Bracelet 1"
    frontend_desc = 'Bracelet 1'
    mesh = "models/skater_m/extra_bracelet.skin"
    replace = "CS_NN_Watch01.png"
    with = "textures/skater_m/MLS_CAS_bracelet02"
  }
  {
    desc_id = #"Bracelet 2"
    frontend_desc = 'Bracelet 2'
    mesh = "models/skater_m/extra_bracelet.skin"
    replace = "CS_NN_Watch01.png"
    with = "textures/skater_m/MLS_CAS_bracelet03"
  }
  {
    desc_id = #"Bracelet 3"
    frontend_desc = 'Bracelet 3'
    mesh = "models/skater_m/extra_bracelet.skin"
    replace = "CS_NN_Watch01.png"
    with = "textures/skater_m/MLS_CAS_bracelet04"
  }
  {
    desc_id = #"Bracelet 4"
    frontend_desc = 'Bracelet 4'
    mesh = "models/skater_m/extra_bracelet.skin"
  }
  {
    desc_id = #"Wrist Tape R"
    frontend_desc = 'Wrist Tape'
    mesh = "models/skater_m/extra_wristape_R.skin"
  }
]

left_bicep_tattoo = [
  {
    desc_id = None
    frontend_desc = 'None'
  }
  {
    desc_id = #"Tattoo 1"
    frontend_desc = 'Tattoo 1'
    replace = "CS_NH_tat_arm0L.png"
    with = "textures/skater_m/CS_DM_Tat_BArm1"
    in = body
  }
  {
    desc_id = #"Tattoo 2"
    frontend_desc = 'Tattoo 2'
    replace = "CS_NH_tat_arm0L.png"
    with = "textures/skater_m/CS_DM_Tat_BArm2"
    in = body
  }
  {
    desc_id = #"Tattoo 3"
    frontend_desc = 'Tattoo 3'
    replace = "CS_NH_tat_arm0L.png"
    with = "textures/skater_m/CS_DM_Tat_BArm3"
    in = body
  }
  {
    desc_id = #"Tattoo 4"
    frontend_desc = 'Tattoo 4'
    replace = "CS_NH_tat_arm0L.png"
    with = "textures/skater_m/CS_DM_Tat_BArm4"
    in = body
  }
  {
    desc_id = #"Tattoo 5"
    frontend_desc = 'Tattoo 5'
    replace = "CS_NH_tat_arm0L.png"
    with = "textures/skater_m/CS_DM_Tat_BArm5"
    in = body
  }
  {
    desc_id = #"Tattoo 6"
    frontend_desc = 'Tattoo 6'
    replace = "CS_NH_tat_arm0L.png"
    with = "textures/skater_m/CS_DM_Tat_BArm6"
    in = body
  }
  {
    desc_id = #"Tattoo 7"
    frontend_desc = 'Tattoo 7'
    replace = "CS_NH_tat_arm0L.png"
    with = "textures/skater_m/CS_DM_Tat_BArm7"
    in = body
  }
  {
    desc_id = #"Tattoo 8"
    frontend_desc = 'Tattoo 8'
    replace = "CS_NH_tat_arm0L.png"
    with = "textures/skater_m/CS_DM_Tat_BArm8"
    in = body
  }
  {
    desc_id = #"Tattoo 9"
    frontend_desc = 'Tattoo 9'
    replace = "CS_NH_tat_arm0L.png"
    with = "textures/skater_m/CS_DM_Tat_BArm9"
    in = body
  }
  {
    desc_id = #"Tattoo 10"
    frontend_desc = 'Tattoo 10'
    replace = "CS_NH_tat_arm0L.png"
    with = "textures/skater_m/CS_DM_Tat_BArm10"
    in = body
  }
]
right_bicep_tattoo = [
  {
    desc_id = None
    frontend_desc = 'None'
  }
  {
    desc_id = #"Tattoo 1"
    frontend_desc = 'Tattoo 1'
    replace = "CS_NH_tat_arm0.png"
    with = "textures/skater_m/CS_DM_Tat_BArm1"
    in = body
  }
  {
    desc_id = #"Tattoo 2"
    frontend_desc = 'Tattoo 2'
    replace = "CS_NH_tat_arm0.png"
    with = "textures/skater_m/CS_DM_Tat_BArm2"
    in = body
  }
  {
    desc_id = #"Tattoo 3"
    frontend_desc = 'Tattoo 3'
    replace = "CS_NH_tat_arm0.png"
    with = "textures/skater_m/CS_DM_Tat_BArm3"
    in = body
  }
  {
    desc_id = #"Tattoo 4"
    frontend_desc = 'Tattoo 4'
    replace = "CS_NH_tat_arm0.png"
    with = "textures/skater_m/CS_DM_Tat_BArm4"
    in = body
  }
  {
    desc_id = #"Tattoo 5"
    frontend_desc = 'Tattoo 5'
    replace = "CS_NH_tat_arm0.png"
    with = "textures/skater_m/CS_DM_Tat_BArm5"
    in = body
  }
  {
    desc_id = #"Tattoo 6"
    frontend_desc = 'Tattoo 6'
    replace = "CS_NH_tat_arm0.png"
    with = "textures/skater_m/CS_DM_Tat_BArm6"
    in = body
  }
  {
    desc_id = #"Tattoo 7"
    frontend_desc = 'Tattoo 7'
    replace = "CS_NH_tat_arm0.png"
    with = "textures/skater_m/CS_DM_Tat_BArm7"
    in = body
  }
  {
    desc_id = #"Tattoo 8"
    frontend_desc = 'Tattoo 8'
    replace = "CS_NH_tat_arm0.png"
    with = "textures/skater_m/CS_DM_Tat_BArm8"
    in = body
  }
  {
    desc_id = #"Tattoo 9"
    frontend_desc = 'Tattoo 9'
    replace = "CS_NH_tat_arm0.png"
    with = "textures/skater_m/CS_DM_Tat_BArm9"
    in = body
  }
  {
    desc_id = #"Tattoo 10"
    frontend_desc = 'Tattoo 10'
    replace = "CS_NH_tat_arm0.png"
    with = "textures/skater_m/CS_DM_Tat_BArm10"
    in = body
  }
]
left_forearm_tattoo = [
  {
    desc_id = None
    frontend_desc = 'None'
  }
  {
    desc_id = #"Tattoo 1"
    frontend_desc = 'Tattoo 1'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_FArm1"
    in = body
  }
  {
    desc_id = #"Tattoo 2"
    frontend_desc = 'Tattoo 2'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_FArm2"
    in = body
  }
  {
    desc_id = #"Tattoo 3"
    frontend_desc = 'Tattoo 3'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_FArm3"
    in = body
  }
  {
    desc_id = #"Tattoo 4"
    frontend_desc = 'Tattoo 4'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm1"
    in = body
  }
  {
    desc_id = #"Tattoo 5"
    frontend_desc = 'Tattoo 5'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm2"
    in = body
  }
  {
    desc_id = #"Tattoo 6"
    frontend_desc = 'Tattoo 6'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm3"
    in = body
  }
  {
    desc_id = #"Tattoo 7"
    frontend_desc = 'Tattoo 7'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm4"
    in = body
  }
  {
    desc_id = #"Tattoo 8"
    frontend_desc = 'Tattoo 8'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm5"
    in = body
  }
  {
    desc_id = #"Tattoo 9"
    frontend_desc = 'Tattoo 9'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm6"
    in = body
  }
  {
    desc_id = #"Tattoo 10"
    frontend_desc = 'Tattoo 10'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm7"
    in = body
  }
  {
    desc_id = #"Tattoo 11"
    frontend_desc = 'Tattoo 11'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm8"
    in = body
  }
  {
    desc_id = #"Tattoo 12"
    frontend_desc = 'Tattoo 12'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm9"
    in = body
  }
  {
    desc_id = #"Tattoo 13"
    frontend_desc = 'Tattoo 13'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm10"
    in = body
  }
  {
    desc_id = #"Tattoo 14"
    frontend_desc = 'Tattoo 14'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm11"
    in = body
  }
  {
    desc_id = #"Tattoo 15"
    frontend_desc = 'Tattoo 15'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm12"
    in = body
  }
  {
    desc_id = #"Tattoo 16"
    frontend_desc = 'Tattoo 16'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm13"
    in = body
  }
  {
    desc_id = #"Tattoo 17"
    frontend_desc = 'Tattoo 17'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm14"
    in = body
  }
  {
    desc_id = #"Tattoo 18"
    frontend_desc = 'Tattoo 18'
    replace = "CS_NH_tat_fore0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm15"
    in = body
  }
]
right_forearm_tattoo = [
  {
    desc_id = None
    frontend_desc = 'None'
  }
  {
    desc_id = #"Tattoo 1"
    frontend_desc = 'Tattoo 1'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_FArm1"
    in = body
  }
  {
    desc_id = #"Tattoo 2"
    frontend_desc = 'Tattoo 2'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_FArm2"
    in = body
  }
  {
    desc_id = #"Tattoo 3"
    frontend_desc = 'Tattoo 3'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_FArm3"
    in = body
  }
  {
    desc_id = #"Tattoo 4"
    frontend_desc = 'Tattoo 4'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm1"
    in = body
  }
  {
    desc_id = #"Tattoo 5"
    frontend_desc = 'Tattoo 5'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm2"
    in = body
  }
  {
    desc_id = #"Tattoo 6"
    frontend_desc = 'Tattoo 6'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm3"
    in = body
  }
  {
    desc_id = #"Tattoo 7"
    frontend_desc = 'Tattoo 7'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm4"
    in = body
  }
  {
    desc_id = #"Tattoo 8"
    frontend_desc = 'Tattoo 8'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm5"
    in = body
  }
  {
    desc_id = #"Tattoo 9"
    frontend_desc = 'Tattoo 9'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm6"
    in = body
  }
  {
    desc_id = #"Tattoo 10"
    frontend_desc = 'Tattoo 10'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm7"
    in = body
  }
  {
    desc_id = #"Tattoo 11"
    frontend_desc = 'Tattoo 11'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm8"
    in = body
  }
  {
    desc_id = #"Tattoo 12"
    frontend_desc = 'Tattoo 12'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm9"
    in = body
  }
  {
    desc_id = #"Tattoo 13"
    frontend_desc = 'Tattoo 13'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm10"
    in = body
  }
  {
    desc_id = #"Tattoo 14"
    frontend_desc = 'Tattoo 14'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm11"
    in = body
  }
  {
    desc_id = #"Tattoo 15"
    frontend_desc = 'Tattoo 15'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm12"
    in = body
  }
  {
    desc_id = #"Tattoo 16"
    frontend_desc = 'Tattoo 16'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm13"
    in = body
  }
  {
    desc_id = #"Tattoo 17"
    frontend_desc = 'Tattoo 17'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm14"
    in = body
  }
  {
    desc_id = #"Tattoo 18"
    frontend_desc = 'Tattoo 18'
    replace = "CS_NH_tat_fore0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm15"
    in = body
  }
]
head_tattoo = [
  {
    desc_id = None
    frontend_desc = 'None'
  }
  {
    desc_id = #"Tattoo 1"
    frontend_desc = 'Tattoo 1'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_07"
    in = body
  }
  {
    desc_id = #"Tattoo 2"
    frontend_desc = 'Tattoo 2'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_2"
    in = body
  }
  {
    desc_id = #"Tattoo 3"
    frontend_desc = 'Tattoo 3'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_3"
    in = body
  }
  {
    desc_id = #"Tattoo 4"
    frontend_desc = 'Tattoo 4'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_4"
    in = body
  }
  {
    desc_id = #"Tattoo 5"
    frontend_desc = 'Tattoo 5'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_32"
    in = body
  }
  {
    desc_id = #"Tattoo 6"
    frontend_desc = 'Tattoo 6'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_2"
    in = body
  }
  {
    desc_id = #"Tattoo 7"
    frontend_desc = 'Tattoo 7'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_11"
    in = body
  }
  {
    desc_id = #"Tattoo 8"
    frontend_desc = 'Tattoo 8'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_15"
    in = body
  }
  {
    desc_id = #"Tattoo 9"
    frontend_desc = 'Tattoo 9'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_21"
    in = body
  }
  {
    desc_id = #"Tattoo 10"
    frontend_desc = 'Tattoo 10'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_36"
    in = body
  }
  {
    desc_id = #"Tattoo 11"
    frontend_desc = 'Tattoo 11'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_41"
    in = body
  }
  {
    desc_id = #"Tattoo 12"
    frontend_desc = 'Tattoo 12'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_NN_tat_head02"
    in = body
  }
  {
    desc_id = #"Tattoo 13"
    frontend_desc = 'Tattoo 13'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_NN_tat_head03"
    in = body
  }
  {
    desc_id = #"Tattoo 14"
    frontend_desc = 'Tattoo 14'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_tat_head_5"
    in = body
  }
  {
    desc_id = #"Tattoo 15"
    frontend_desc = 'Tattoo 15'
    replace = "CS_NN_tat_head00.png"
    with = "textures/skater_m/CS_DM_tat_head_6"
    in = body
  }
]
chest_tattoo = [
  {
    desc_id = None
    frontend_desc = 'None'
  }
  {
    desc_id = #"Tattoo 1"
    frontend_desc = 'Tattoo 1'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_1"
    in = body
  }
  {
    desc_id = #"Tattoo 2"
    frontend_desc = 'Tattoo 2'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_2"
    in = body
  }
  {
    desc_id = #"Tattoo 3"
    frontend_desc = 'Tattoo 3'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_4"
    in = body
  }
  {
    desc_id = #"Tattoo 4"
    frontend_desc = 'Tattoo 4'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_6"
    in = body
  }
  {
    desc_id = #"Tattoo 5"
    frontend_desc = 'Tattoo 5'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_07"
    in = body
  }
  {
    desc_id = #"Tattoo 6"
    frontend_desc = 'Tattoo 6'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_10"
    in = body
  }
  {
    desc_id = #"Tattoo 7"
    frontend_desc = 'Tattoo 7'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_9"
    in = body
  }
  {
    desc_id = #"Tattoo 8"
    frontend_desc = 'Tattoo 8'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_11"
    in = body
  }
  {
    desc_id = #"Tattoo 9"
    frontend_desc = 'Tattoo 9'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_13"
    in = body
  }
  {
    desc_id = #"Tattoo 10"
    frontend_desc = 'Tattoo 10'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_14"
    in = body
  }
  {
    desc_id = #"Tattoo 11"
    frontend_desc = 'Tattoo 11'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_15"
    in = body
  }
  {
    desc_id = #"Tattoo 12"
    frontend_desc = 'Tattoo 12'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_18"
    in = body
  }
  {
    desc_id = #"Tattoo 13"
    frontend_desc = 'Tattoo 13'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_06"
    in = body
  }
  {
    desc_id = #"Tattoo 14"
    frontend_desc = 'Tattoo 14'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_25"
    in = body
  }
  {
    desc_id = #"Tattoo 15"
    frontend_desc = 'Tattoo 15'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_26"
    in = body
  }
  {
    desc_id = #"Tattoo 16"
    frontend_desc = 'Tattoo 16'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_29"
    in = body
  }
  {
    desc_id = #"Tattoo 17"
    frontend_desc = 'Tattoo 17'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_30"
    in = body
  }
  {
    desc_id = #"Tattoo 18"
    frontend_desc = 'Tattoo 18'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_34"
    in = body
  }
  {
    desc_id = #"Tattoo 19"
    frontend_desc = 'Tattoo 19'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_36"
    in = body
  }
  {
    desc_id = #"Tattoo 20"
    frontend_desc = 'Tattoo 20'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_41"
    in = body
  }
  {
    desc_id = #"Tattoo 21"
    frontend_desc = 'Tattoo 21'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_42"
    in = body
  }
  {
    desc_id = #"Tattoo 22"
    frontend_desc = 'Tattoo 22'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_43"
    in = body
  }
  {
    desc_id = #"Tattoo 23"
    frontend_desc = 'Tattoo 23'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_44"
    in = body
  }
  {
    desc_id = #"Tattoo 24"
    frontend_desc = 'Tattoo 24'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_NN_tat_head02"
    in = body
  }
  {
    desc_id = #"Tattoo 25"
    frontend_desc = 'Tattoo 25'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_NN_tat_head03"
    in = body
  }
  {
    desc_id = #"Thomas 1"
    frontend_desc = 'Thomas 1'
    replace = "CS_NN_tat_chest00.png"
    with = "textures/skater_m/CS_NN_Thomas_Tat_chest01"
    in = body
  }
]
back_tattoo = [
  {
    desc_id = None
    frontend_desc = 'None'
  }
  {
    desc_id = #"Tattoo 1"
    frontend_desc = 'Tattoo 1'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_1"
    in = body
  }
  {
    desc_id = #"Tattoo 2"
    frontend_desc = 'Tattoo 2'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_39"
    in = body
  }
  {
    desc_id = #"Tattoo 3"
    frontend_desc = 'Tattoo 3'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_4"
    in = body
  }
  {
    desc_id = #"Tattoo 4"
    frontend_desc = 'Tattoo 4'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_6"
    in = body
  }
  {
    desc_id = #"Tattoo 5"
    frontend_desc = 'Tattoo 5'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_07"
    in = body
  }
  {
    desc_id = #"Tattoo 6"
    frontend_desc = 'Tattoo 6'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_10"
    in = body
  }
  {
    desc_id = #"Tattoo 7"
    frontend_desc = 'Tattoo 7'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Chest_9"
    in = body
  }
  {
    desc_id = #"Tattoo 8"
    frontend_desc = 'Tattoo 8'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_11"
    in = body
  }
  {
    desc_id = #"Tattoo 9"
    frontend_desc = 'Tattoo 9'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_head_Chest_21"
    in = body
  }
  {
    desc_id = #"Tattoo 10"
    frontend_desc = 'Tattoo 10'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_32"
    in = body
  }
  {
    desc_id = #"Tattoo 11"
    frontend_desc = 'Tattoo 11'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_15"
    in = body
  }
  {
    desc_id = #"Tattoo 12"
    frontend_desc = 'Tattoo 12'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_31"
    in = body
  }
  {
    desc_id = #"Tattoo 13"
    frontend_desc = 'Tattoo 13'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_06"
    in = body
  }
  {
    desc_id = #"Tattoo 14"
    frontend_desc = 'Tattoo 14'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_25"
    in = body
  }
  {
    desc_id = #"Tattoo 15"
    frontend_desc = 'Tattoo 15'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_26"
    in = body
  }
  {
    desc_id = #"Tattoo 16"
    frontend_desc = 'Tattoo 16'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_29"
    in = body
  }
  {
    desc_id = #"Tattoo 17"
    frontend_desc = 'Tattoo 17'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_30"
    in = body
  }
  {
    desc_id = #"Tattoo 18"
    frontend_desc = 'Tattoo 18'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_34"
    in = body
  }
  {
    desc_id = #"Tattoo 19"
    frontend_desc = 'Tattoo 19'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_36"
    in = body
  }
  {
    desc_id = #"Tattoo 20"
    frontend_desc = 'Tattoo 20'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_41"
    in = body
  }
  {
    desc_id = #"Tattoo 21"
    frontend_desc = 'Tattoo 21'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_42"
    in = body
  }
  {
    desc_id = #"Tattoo 22"
    frontend_desc = 'Tattoo 22'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_43"
    in = body
  }
  {
    desc_id = #"Tattoo 23"
    frontend_desc = 'Tattoo 23'
    replace = "CS_NN_tat_back00.png"
    with = "textures/skater_m/CS_DM_Tat_Head_Chest_12"
    in = body
  }
]
left_leg_tattoo = [
  {
    desc_id = None
    frontend_desc = 'None'
  }
  {
    desc_id = #"Tattoo 1"
    frontend_desc = 'Tattoo 1'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm1"
    in = body
  }
  {
    desc_id = #"Tattoo 2"
    frontend_desc = 'Tattoo 2'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm2"
    in = body
  }
  {
    desc_id = #"Tattoo 3"
    frontend_desc = 'Tattoo 3'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm3"
    in = body
  }
  {
    desc_id = #"Tattoo 4"
    frontend_desc = 'Tattoo 4'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm4"
    in = body
  }
  {
    desc_id = #"Tattoo 5"
    frontend_desc = 'Tattoo 5'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm5"
    in = body
  }
  {
    desc_id = #"Tattoo 6"
    frontend_desc = 'Tattoo 6'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm6"
    in = body
  }
  {
    desc_id = #"Tattoo 7"
    frontend_desc = 'Tattoo 7'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm7"
    in = body
  }
  {
    desc_id = #"Tattoo 8"
    frontend_desc = 'Tattoo 8'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm8"
    in = body
  }
  {
    desc_id = #"Tattoo 9"
    frontend_desc = 'Tattoo 9'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm9"
    in = body
  }
  {
    desc_id = #"Tattoo 10"
    frontend_desc = 'Tattoo 10'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm10"
    in = body
  }
  {
    desc_id = #"Tattoo 11"
    frontend_desc = 'Tattoo 11'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm12"
    in = body
  }
  {
    desc_id = #"Tattoo 12"
    frontend_desc = 'Tattoo 12'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm13"
    in = body
  }
  {
    desc_id = #"Tattoo 13"
    frontend_desc = 'Tattoo 13'
    replace = "CS_NH_tat_leg0L.png"
    with = "textures/skater_m/CS_DM_Tat_Arm14"
    in = body
  }
]
right_leg_tattoo = [
  {
    desc_id = None
    frontend_desc = 'None'
  }
  {
    desc_id = #"Tattoo 1"
    frontend_desc = 'Tattoo 1'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm1"
    in = body
  }
  {
    desc_id = #"Tattoo 2"
    frontend_desc = 'Tattoo 2'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm2"
    in = body
  }
  {
    desc_id = #"Tattoo 3"
    frontend_desc = 'Tattoo 3'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm3"
    in = body
  }
  {
    desc_id = #"Tattoo 4"
    frontend_desc = 'Tattoo 4'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm4"
    in = body
  }
  {
    desc_id = #"Tattoo 5"
    frontend_desc = 'Tattoo 5'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm5"
    in = body
  }
  {
    desc_id = #"Tattoo 6"
    frontend_desc = 'Tattoo 6'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm6"
    in = body
  }
  {
    desc_id = #"Tattoo 7"
    frontend_desc = 'Tattoo 7'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm7"
    in = body
  }
  {
    desc_id = #"Tattoo 8"
    frontend_desc = 'Tattoo 8'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm8"
    in = body
  }
  {
    desc_id = #"Tattoo 9"
    frontend_desc = 'Tattoo 9'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm9"
    in = body
  }
  {
    desc_id = #"Tattoo 10"
    frontend_desc = 'Tattoo 10'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm10"
    in = body
  }
  {
    desc_id = #"Tattoo 11"
    frontend_desc = 'Tattoo 11'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm12"
    in = body
  }
  {
    desc_id = #"Tattoo 12"
    frontend_desc = 'Tattoo 12'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm13"
    in = body
  }
  {
    desc_id = #"Tattoo 13"
    frontend_desc = 'Tattoo 13'
    replace = "CS_NH_tat_leg0.png"
    with = "textures/skater_m/CS_DM_Tat_Arm14"
    in = body
  }
]

sleeves = [
  {
    desc_id = #"None"
    frontend_desc = 'None'
  }
]

shoelaces = [
  {
    desc_id = #"None"
    frontend_desc = 'None'
  }
]
