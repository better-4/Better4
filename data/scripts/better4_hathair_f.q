better4_skater_f_hat_hair_categories = [
  better4_skater_f_hat_hair_thps4
  better4_skater_f_hat_hair_thug
  better4_skater_f_hat_hair_thug2
]

better4_skater_f_hat_hair_thps4 = {
  label = "THPS4"
  items = [
    {
      desc_id = None
      frontend_desc = 'None'
    }
    {
      desc_id = #"Very Short Light HAT"
      frontend_desc = 'Very Short Light'
    }
    {
      desc_id = #"Very Short Dark HAT"
      frontend_desc = 'Very Short Light'
    }
  ]
}

better4_skater_f_hat_hair_thug = {
  label = "THUG"
  items = [
    {
      desc_id = None
      frontend_desc = 'None'
    }
    {
      desc_id = #"Medium THUG1 F"
      frontend_desc = 'Medium'
    }
    {
      desc_id = #"Long THUG1 F"
      frontend_desc = 'Long'
    }
  ]
}

better4_skater_f_hat_hair_thug2 = {
  label = "THUG2"
  items = [
    {
      desc_id = None
      frontend_desc = 'None'
    }
    {
      desc_id = #"Medium 2 THUG2 F"
      frontend_desc = 'Medium 2'
    }
  ]
}

skater_f_hat_hair = [ 
  { 
	desc_id = None 
	frontend_desc = "None" 
  }
  {
    desc_id = #"Medium THUG1 F"
    frontend_desc = 'Medium'
    mesh = "models/better4/hairs/hair_mediumthugHAT.skin"
  }  
  {
    desc_id = #"Long THUG1 F"
    frontend_desc = 'Long'
    mesh = "models/better4/hairs/hair_longthugHAT.skin"
  }  
  {
    desc_id = #"Very Short Dark HAT"
    frontend_desc = 'Very Short Dark'
    mesh = "models/skater_f/hair_veryshort.skin"
    is_short_hair
  }
  {
    desc_id = #"Very Short Light HAT"
    frontend_desc = 'Very Short Light'
    mesh = "models/skater_f/hair_veryshort.skin"
    replace = "CS_JB_Hair_F_Buzz1_D1.png"
    with = "textures/skater_m/CS_JB_Hair_F_Buzz1_L1"
    replace1 = "CS_JB_Hair_F_Buzz1_D2.png"
    with1 = "textures/skater_m/CS_JB_Hair_F_Buzz1_L2"
    is_short_hair
  }
  {
    desc_id = #"Medium 2 THUG2 F"
    frontend_desc = 'Medium 2 (THUG2)'
    mesh = "models/better4/hairs/hair_ug2mediumHAT2.skin"
  } 
]