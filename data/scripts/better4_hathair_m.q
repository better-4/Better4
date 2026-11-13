better4_skater_m_hat_hair_categories = [
  better4_skater_m_hat_hair_thps4
  better4_skater_m_hat_hair_thug
  better4_skater_m_hat_hair_thug2
]

better4_skater_m_hat_hair_thps4 = {
  label = "THPS4"
  items = [
    {
      desc_id = None
      frontend_desc = 'None'
    }
    {
      desc_id = #"Buzzed Light HAT"
      frontend_desc = 'Buzzed Light'
    }
    {
      desc_id = #"Buzzed Dark HAT"
      frontend_desc = 'Buzzed Dark'
    }
  ]
}

better4_skater_m_hat_hair_thug = {
  label = "THUG"
  items = [
    {
      desc_id = None
      frontend_desc = 'None'
    }
    {
      desc_id = #"Medium THUG1"
      frontend_desc = 'Medium'
    }
    {
      desc_id = #"Long THUG1"
      frontend_desc = 'Long'
    }
  ]
}

better4_skater_m_hat_hair_thug2 = {
  label = "THUG2"
  items = [
    {
      desc_id = None
      frontend_desc = 'None'
    }
    {
      desc_id = #"Medium 2 THUG2"
      frontend_desc = 'Medium 2'
    }
  ]
}

skater_m_hat_hair = [ 
  { 
	desc_id = None 
	frontend_desc = "None" 
  } 
  {
    desc_id = #"Medium THUG1"
    frontend_desc = 'Medium'
    mesh = "models/better4/hairs/hair_mediumthugHAT.skin"
  }
  {
    desc_id = #"Long THUG1"
    frontend_desc = 'Long'
    mesh = "models/better4/hairs/hair_longthugHAT.skin"
  }  
  {
    desc_id = #"Buzzed Light HAT"
    frontend_desc = 'Buzzed Light'
    mesh = "models/skater_m/Hair_M_W_Buzz.skin"
    is_short_hair
  }
  {
    desc_id = #"Buzzed Dark HAT"
    frontend_desc = 'Buzzed Dark'
    mesh = "models/skater_m/Hair_M_W_Buzz.skin"
    replace = "CS_JB_Hair_BuzzL1.png"
    with = "textures/skater_m/CS_JB_Hair_BuzzD1"
    replace1 = "CS_JB_Hair_BuzzL2.png"
    with1 = "textures/skater_m/CS_JB_Hair_BuzzD2"
    is_short_hair
  }
  {
    desc_id = #"Medium 2 THUG2"
    frontend_desc = 'Medium 2 (THUG2)'
    mesh = "models/better4/hairs/hair_ug2mediumHAT2.skin"
  } 
]