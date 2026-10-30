better4_hat_categories = [
  better4_hat_thps4
  better4_hat_thug
]

better4_hat_thps4 = {
  label = "THPS4"
  items = [
    {
      desc_id = None
      frontend_desc = 'None'
    }
    {
      desc_id = #"Forwards Cap"
      frontend_desc = 'Forward Cap'
    }
    {
      desc_id = #"Backwards Cap"
      frontend_desc = 'Backward Cap'
    }
    {
      desc_id = #"Trucker Cap"
      frontend_desc = 'Trucker Cap'
    }
    {
      desc_id = Beanie
      frontend_desc = 'Beanie 1'
    }
    {
      desc_id = #"Beanie 2"
      frontend_desc = 'Beanie 2'
    }
    {
      desc_id = Visor
      frontend_desc = 'Visor'
    }
    {
      desc_id = Bandana
      frontend_desc = 'Bandana'
    }
    {
      desc_id = #"Bandana Folded"
      frontend_desc = 'Bandana Folded'
    }
    {
      desc_id = #"Bandana Reversed"
      frontend_desc = 'Bandana Reversed'
    }
    {
      desc_id = #"Dew Rag"
      frontend_desc = 'Dew Rag'
    }
    {
      desc_id = Cowboy
      frontend_desc = 'Cowboy'
    }
    {
      desc_id = #"Safari Hat"
      frontend_desc = 'Safari Hat'
    }
    {
      desc_id = #"Golf Cap"
      frontend_desc = 'Golf Cap'
    }
    {
      desc_id = Avenger
      frontend_desc = 'Avenger'
    }
    {
      desc_id = #"Sun Hat"
      frontend_desc = 'Sun Hat'
    }
    {
      desc_id = Detective
      frontend_desc = 'Detective'
    }
    {
      desc_id = Capone
      frontend_desc = 'Capone'
    }
    {
      desc_id = #"Hell Helmet"
      frontend_desc = 'Hell Helmet'
    }
    {
      desc_id = #"Old Army"
      frontend_desc = 'Old Army'
    }
    {
      desc_id = #"Pirate Hat"
      frontend_desc = 'Pirate Hat'
    }
    {
      desc_id = #"Pith Helmet"
      frontend_desc = 'Pith Helmet'
    }
    {
      desc_id = #"Army Helmet"
      frontend_desc = 'Army Helmet'
    }
    {
      desc_id = Beret
      frontend_desc = 'Beret'
    }
    {
      desc_id = #"Top Hat"
      frontend_desc = 'Top Hat'
    }
    {
      desc_id = #"Viking Helmet"
      frontend_desc = 'Viking Helmet'
    }
    {
      desc_id = #"British Officer"
      frontend_desc = 'British Officer'
    }
    {
      desc_id = #"Police Hat"
      frontend_desc = 'Police Hat'
    }
    {
      desc_id = #"Novelty Hat"
      frontend_desc = 'Novelty Hat'
    }
    {
      desc_id = #"Burnquist Cap"
      frontend_desc = 'Burnquist Cap'
    }
    {
      desc_id = #"Campbell Cap"
      frontend_desc = 'Campbell Cap'
    }
    {
      desc_id = #"Koston Cap"
      frontend_desc = 'Koston Cap'
    }
    {
      desc_id = #"Lasek Cap"
      frontend_desc = 'Lasek Cap'
    }
    {
      desc_id = #"Rowley Cap"
      frontend_desc = 'Rowley Cap'
    }
    {
      desc_id = #"Gliberg Cap"
      frontend_desc = 'Glifberg Cap'
    }
    {
      desc_id = #"Paper Bag"
      frontend_desc = 'Paper Bag'
    }
    {
      desc_id = #"muska hat"
      frontend_desc = 'Muska Hat'
    }
  ]
}

better4_hat_thug = {
  label = "THUG"
  items = [
    {
      desc_id = #"Russian Hat thug"
      frontend_desc = 'Russian'
    }
    {
      desc_id = #"THUG Rasta"
      frontend_desc = 'Rasta'
    }
  ]
}

hat = [
  {
    desc_id = None
    frontend_desc = 'None'
    no_color
    is_lasek
    is_burnquist
    is_glifberg
    script disqualify_script
      ClearPart part = skater_f_hat_hair
	  ClearPart part = skater_m_hat_hair
    endscript
    null_item
  }
  {
    desc_id = #"Forwards Cap"
    frontend_desc = 'Forward Cap'
    mesh = "models/skater_m/hat_capforward.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
    supports_logo
  }
  {
    desc_id = #"Backwards Cap"
    frontend_desc = 'Backward Cap'
    mesh = "models/skater_m/hat_capbackward.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
    supports_logo
  }
  {
    desc_id = #"Trucker Cap"
    frontend_desc = 'Trucker Cap'
    mesh = "models/skater_m/hat_trucker.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = Beanie
    frontend_desc = 'Beanie 1'
    mesh = "models/skater_m/hat_beanie.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Beanie 2"
    frontend_desc = 'Beanie 2'
    mesh = "models/skater_m/hat_beanie2.skin"
    is_lasek
    is_campbell
    script disqualify_script
      cas_temp_disq_remove_long_hair
      ClearPart part = skater_f_hat_hair
	  ClearPart part = skater_m_hat_hair
    endscript
  }
  {
    desc_id = Visor
    frontend_desc = 'Visor'
    mesh = "models/skater_m/hat_visor.skin"
    is_rowley
    is_glifberg
    is_lasek
    is_burnquist
    is_hawk
    script disqualify_script
      cas_temp_disq_remove_long_hair
      ClearPart part = skater_f_hat_hair
	  ClearPart part = skater_m_hat_hair
    endscript
  }
  {
    desc_id = Bandana
    frontend_desc = 'Bandana'
    mesh = "models/skater_m/hat_bandana.skin"
    is_glifberg
    is_lasek
    is_burnquist
    is_rowley
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Bandana Folded"
    frontend_desc = 'Bandana Folded'
    mesh = "models/skater_m/hat_headband.skin"
    is_glifberg
    is_lasek
    is_burnquist
    script disqualify_script
	  cas_temp_disq_remove_long_hair
      ClearPart part = skater_f_hat_hair
	  ClearPart part = skater_m_hat_hair
    endscript
  }
  {
    desc_id = #"Bandana Reversed"
    frontend_desc = 'Bandana Reversed'
    mesh = "models/skater_m/hat_headband_frnt.skin"
    is_glifberg
    is_lasek
    is_burnquist
    script disqualify_script
	  cas_temp_disq_remove_long_hair
      ClearPart part = skater_f_hat_hair
	  ClearPart part = skater_m_hat_hair
    endscript
  }
  {
    desc_id = #"Dew Rag"
    frontend_desc = 'Dew Rag'
    mesh = "models/skater_m/hat_do_rag.skin"
    is_rowley
    is_lasek
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = Cowboy
    frontend_desc = 'Cowboy'
    mesh = "models/skater_m/hat_cowboy.skin"
    is_rowley
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Safari Hat"
    frontend_desc = 'Safari Hat'
    mesh = "models/skater_m/hat_giligan.skin"
    is_rowley
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Golf Cap"
    frontend_desc = 'Golf Cap'
    mesh = "models/skater_m/hat_beret.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = Avenger
    frontend_desc = 'Avenger'
    mesh = "models/skater_m/hat_bowler.skin"
    is_rowley
    is_campbell
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Sun Hat"
    frontend_desc = 'Sun Hat'
    mesh = "models/skater_m/hat_china.skin"
    is_hawk
    is_lasek
    is_burnquist
    is_glifberg
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = Detective
    frontend_desc = 'Detective'
    mesh = "models/skater_m/hat_deerstalker.skin"
    is_rowley
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = Capone
    frontend_desc = 'Capone'
    mesh = "models/skater_m/hat_gangsterhat.skin"
    is_rowley
    is_campbell
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Hell Helmet"
    frontend_desc = 'Hell Helmet'
    mesh = "models/skater_m/hat_spike.skin"
    is_lasek
    is_burnquist
    script disqualify_script
      cas_temp_disq_remove_long_hair
    endscript
  }
  {
    desc_id = #"Old Army"
    frontend_desc = 'Old Army'
    mesh = "models/skater_m/hat_gunner.skin"
    is_rowley
    is_campbell
    script disqualify_script
      cas_temp_disq_remove_long_hair
    endscript
  }
  {
    desc_id = #"Pirate Hat"
    frontend_desc = 'Pirate Hat'
    mesh = "models/skater_m/hat_piratehat.skin"
    is_glifberg
    is_rowley
    is_campbell
    is_hawk
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Pith Helmet"
    frontend_desc = 'Pith Helmet'
    mesh = "models/skater_m/hat_pith.skin"
    is_glifberg
    is_rowley
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Army Helmet"
    frontend_desc = 'Army Helmet'
    mesh = "models/skater_m/hat_soldier.skin"
    script disqualify_script
      cas_temp_disq_remove_long_hair
    endscript
  }
  {
    desc_id = Beret
    frontend_desc = 'Beret'
    mesh = "models/skater_m/hat_greenberet.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Top Hat"
    frontend_desc = 'Top Hat'
    mesh = "models/skater_m/hat_tophat.skin"
    is_rowley
    is_campbell
    is_lasek
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Viking Helmet"
    frontend_desc = 'Viking Helmet'
    mesh = "models/skater_m/hat_viking.skin"
    is_rowley
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"British Officer"
    frontend_desc = 'British Officer'
    mesh = "models/skater_m/hat_constable.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Police Hat"
    frontend_desc = 'Police Hat'
    mesh = "models/skater_m/hat_police.skin"
    is_lasek
    is_burnquist
    is_hawk
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Novelty Hat"
    frontend_desc = 'Novelty Hat'
    mesh = "models/skater_m/hat_beer.skin"
    is_rowley
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Burnquist Cap"
    frontend_desc = 'Burnquist Cap'
    mesh = "models/skater_m/hat_capforward.skin"
    replace = "CS_NH_cap.png"
    with = "textures/skater_m/CS_NN_Burnquist_cap"
    replace1 = "Hat_logo_none.png"
    with1 = "textures/logos/Hat_firm01"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Campbell Cap"
    frontend_desc = 'Campbell Cap'
    mesh = "models/skater_m/hat_campbell.skin"
    replace = "CS_NH_cap.png"
    with = "textures/skater_m/CS_NH_Campbell_cap"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Koston Cap"
    frontend_desc = 'Koston Cap'
    mesh = "models/skater_m/hat_capforward.skin"
    replace = "CS_NH_cap.png"
    with = "textures/skater_m/CS_NH_koston_cap"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Lasek Cap"
    frontend_desc = 'Lasek Cap'
    mesh = "models/skater_m/hat_capforward.skin"
    replace = "CS_NH_cap.png"
    with = "textures/skater_m/CS_JB_Hat_cap_lasek"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Rowley Cap"
    frontend_desc = 'Rowley Cap'
    mesh = "models/skater_m/hat_capforward.skin"
    replace = "CS_NH_cap.png"
    with = "textures/skater_m/CS_NH_rowley_cap2"
    replace1 = "Hat_logo_none.png"
    with1 = "textures/logos/Hat_flip01"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"Gliberg Cap"
    frontend_desc = 'Glifberg Cap'
    only_with = [ glifberg ]
    null_item
  }
  {
    desc_id = #"Paper Bag"
    frontend_desc = 'Paper Bag'
    mesh = "models/skater_m/Hat_PaperBag.skin"
    script disqualify_script
      cas_temp_disq_remove_long_hair
      ClearPart part = Helmet
      ClearPart part = skater_m_hair
      ClearPart part = skater_f_hair
      ClearPart part = skater_m_hat_hair
      ClearPart part = skater_f_hat_hair
      ClearPart part = skater_m_jaw
      // ClearPart part = glasses
      // cas_temp_disq_remove_head
    endscript
    unlock_flag = CAS_UNLOCK_09
    is_weird_hat
  }
  {
    desc_id = #"muska hat"
    frontend_desc = 'Muska Hat'
    mesh = "models/better4/shared/hats/hat_muska.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  // THUG
  {
    desc_id = #"Russian Hat thug"
    frontend_desc = 'Russian'
    mesh = "models/better4/shared/hats/hat_russian_thug1.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
  {
    desc_id = #"THUG Rasta"
    frontend_desc = 'Rasta'
    mesh = "models/better4/shared/hats/hat_thug_rasta.skin"
    script disqualify_script
      ClearPart part = skater_f_hair
	  ClearPart part = skater_m_hair
    endscript
  }
]
