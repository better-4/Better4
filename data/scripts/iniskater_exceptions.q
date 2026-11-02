script cas_handle_disqualifications
  cas_disq_remove_logo <...>
  cas_disq_remove_hat <...>
  cas_disq_remove_helmet <...>
  cas_disq_remove_long_sleeve <...>
  cas_disq_remove_elbowpads <...>
  cas_disq_remove_bulky_shirt <...>
  cas_disq_remove_backpack <...>
  cas_disq_remove_pants <...>
  cas_disq_remove_kneepads <...>
  cas_disq_remove_footwear <...>
  cas_disq_handle_weird_items <...>
  cas_disq_add_sleeves <...>
  cas_disq_add_shoelaces <...>
endscript
script cas_disq_handle_weird_items
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  if GotParam is_weird_head
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_m_torso
      GetActualCASOptionStruct part = skater_m_torso desc_id = <desc_id>
      if GotParam not_with_weird_head
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = SetPart
          targetParams = { part = skater_m_torso desc_id = #"T-shirt" }
        }
      endif
    endif
    EditPlayerAppearance {
      player = 0
      profile = <currentSkaterProfileIndex>
      target = ClearPart
      targetParams = { part = hat }
    }
    EditPlayerAppearance {
      player = 0
      profile = <currentSkaterProfileIndex>
      target = ClearPart
      targetParams = { part = helmet }
    }
  endif
  if GotParam is_weird_hat
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_m_torso
      GetActualCASOptionStruct part = skater_m_torso desc_id = <desc_id>
      if GotParam not_with_weird_hat
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = SetPart
          targetParams = { part = skater_m_torso desc_id = #"T-shirt" }
        }
      endif
    endif
    EditPlayerAppearance {
      player = 0
      profile = <currentSkaterProfileIndex>
      target = ClearPart
      targetParams = { part = helmet }
    }
  endif
endscript
script cas_disq_remove_elbowpads
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  GetCurrentSkaterProfileIndex
  if GotParam is_long_sleeve
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_m_elbowpads
      GetActualCASOptionStruct part = skater_m_elbowpads desc_id = <desc_id>
      if GotParam force_short_sleeve
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = ClearPart
          targetParams = { part = skater_m_elbowpads }
        }
      endif
    endif
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_f_elbowpads
      GetActualCASOptionStruct part = skater_f_elbowpads desc_id = <desc_id>
      if GotParam force_short_sleeve
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = ClearPart
          targetParams = { part = skater_f_elbowpads }
        }
      endif
    endif
  endif
endscript
script cas_disq_remove_long_sleeve
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  GetCurrentSkaterProfileIndex
  if GotParam force_short_sleeve
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_m_torso
      GetActualCASOptionStruct part = skater_m_torso desc_id = <desc_id>
      if GotParam is_long_sleeve
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = SetPart
          targetParams = { part = skater_m_torso desc_id = #"T-shirt" }
        }
      endif
    endif
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_f_torso
      GetActualCASOptionStruct part = skater_f_torso desc_id = <desc_id>
      if GotParam is_long_sleeve
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = SetPart
          targetParams = { part = skater_f_torso desc_id = #"T-shirt" }
        }
      endif
    endif
  endif
endscript
script cas_disq_remove_footwear
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  GetCurrentSkaterProfileIndex
  if GotParam bare_feet
    EditPlayerAppearance {
      player = 0
      profile = <currentSkaterProfileIndex>
      target = ClearPart
      targetParams = { part = skater_m_socks }
    }
    EditPlayerAppearance {
      player = 0
      profile = <currentSkaterProfileIndex>
      target = ClearPart
      targetParams = { part = skater_f_socks }
    }
    EditPlayerAppearance {
      player = 0
      profile = <currentSkaterProfileIndex>
      target = ClearPart
      targetParams = { part = shoes }
    }
  endif
endscript
script cas_disq_remove_backpack
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  GetCurrentSkaterProfileIndex
  if GotParam not_with_backpack
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_m_backpack
      GetActualCASOptionStruct part = skater_m_backpack desc_id = <desc_id>
      if GotParam is_backpack
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = ClearPart
          targetParams = { part = skater_m_backpack }
        }
      endif
    endif
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_f_backpack
      GetActualCASOptionStruct part = skater_f_backpack desc_id = <desc_id>
      if GotParam is_backpack
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = ClearPart
          targetParams = { part = skater_f_backpack }
        }
      endif
    endif
  endif
endscript
script cas_disq_remove_bulky_shirt
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  GetCurrentSkaterProfileIndex
  if GotParam is_backpack
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_m_torso
      GetActualCASOptionStruct part = skater_m_torso desc_id = <desc_id>
      if GotParam not_with_backpack
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = SetPart
          targetParams = { part = skater_m_torso desc_id = #"T-shirt" }
        }
      endif
    endif
    if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_f_torso
      GetActualCASOptionStruct part = skater_f_torso desc_id = <desc_id>
      if GotParam not_with_backpack
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = SetPart
          targetParams = { part = skater_f_torso desc_id = #"T-shirt" }
        }
      endif
    endif
  endif
endscript
script cas_disq_remove_hat
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  GetCurrentSkaterProfileIndex
  if ( ChecksumEquals a = <part> b = helmet )
    if not GotParam null_item
      GetCurrentSkaterProfileIndex
      EditPlayerAppearance {
        player = 0
        profile = <currentSkaterProfileIndex>
        target = ClearPart
        targetParams = { part = hat }
      }
      EditPlayerAppearance {
        player = 0
        profile = <currentSkaterProfileIndex>
        target = ClearPart
        targetParams = { part = hat_logo }
      }
    endif
  endif
endscript
script cas_disq_remove_helmet
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  GetCurrentSkaterProfileIndex
  if ( ChecksumEquals a = <part> b = hat )
    if not GotParam null_item
      GetCurrentSkaterProfileIndex
      EditPlayerAppearance {
        player = 0
        profile = <currentSkaterProfileIndex>
        target = ClearPart
        targetParams = { part = helmet }
      }
      EditPlayerAppearance {
        player = 0
        profile = <currentSkaterProfileIndex>
        target = ClearPart
        targetParams = { part = helmet_logo }
      }
    endif
  endif
endscript
script cas_disq_remove_logo
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  GetCurrentSkaterProfileIndex
  if ( ( ChecksumEquals a = <part> b = skater_m_torso ) or ( ChecksumEquals a = <part> b = skater_f_torso ) )
    if not GotParam supports_logo
      GetCurrentSkaterProfileIndex
      EditPlayerAppearance {
        player = 0
        profile = <currentSkaterProfileIndex>
        target = ClearPart
        targetParams = { part = front_logo }
      }
      EditPlayerAppearance {
        player = 0
        profile = <currentSkaterProfileIndex>
        target = ClearPart
        targetParams = { part = back_logo }
      }
    else
      if GotParam no_back_logo
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = ClearPart
          targetParams = { part = back_logo }
        }
      endif
    endif
  endif
  if ( ChecksumEquals a = <part> b = hat )
    if not GotParam supports_logo
      EditPlayerAppearance {
        player = 0
        profile = <currentSkaterProfileIndex>
        target = ClearPart
        targetParams = { part = hat_logo }
      }
    endif
  endif
  if ( ChecksumEquals a = <part> b = helmet )
    if not GotParam supports_logo
      EditPlayerAppearance {
        player = 0
        profile = <currentSkaterProfileIndex>
        target = ClearPart
        targetParams = { part = helmet_logo }
      }
    endif
  endif
endscript
script get_current_pants_supports_kneepads
   <retVal> = 0
  GetCurrentSkaterProfileIndex
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_f_legs
    GetActualCASOptionStruct part = skater_f_legs desc_id = <desc_id>
    if GotParam supports_kneepads
       <retVal> = 1
    endif
  endif
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_m_legs
    GetActualCASOptionStruct part = skater_m_legs desc_id = <desc_id>
    if GotParam supports_kneepads
       <retVal> = 1
    endif
  endif
  PrintStruct <...>
  return supports_kneepads = <retVal>
endscript
script get_current_pants_vert_shorts
   <retVal> = 0
  GetCurrentSkaterProfileIndex
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_m_legs
    if ChecksumEquals a = <desc_id> b = #"Vert Shorts"
       <retVal> = 1
    endif
  endif
  return vert_shorts = <retVal>
endscript
script cas_disq_remove_pants
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  GetCurrentSkaterProfileIndex
  if GotParam force_vert_shorts
    if ( ChecksumEquals a = <part> b = skater_m_kneepads )
      get_current_pants_supports_kneepads
      if ( <supports_kneepads> = 0 )
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = SetPart
          targetParams = { part = skater_m_legs desc_id = #"Vert Shorts" }
        }
      endif
    endif
    if ( ChecksumEquals a = <part> b = skater_f_kneepads )
      get_current_pants_supports_kneepads
      if ( <supports_kneepads> = 0 )
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = SetPart
          targetParams = { part = skater_f_legs desc_id = #"Short Shorts" }
        }
      endif
    endif
  endif
  if GotParam no_vert_shorts
    if ( ChecksumEquals a = <part> b = skater_m_kneepads )
      get_current_pants_vert_shorts
      if ( <vert_shorts> = 1 )
        EditPlayerAppearance {
          player = 0
          profile = <currentSkaterProfileIndex>
          target = SetPart
          targetParams = { part = skater_m_legs desc_id = #"Cargo Shorts" }
        }
      endif
    endif
  endif
endscript
script cas_disq_remove_kneepads
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  GetCurrentSkaterProfileIndex
  if not GotParam supports_kneepads
    if ( ChecksumEquals a = <part> b = skater_m_legs )
      EditPlayerAppearance {
        player = 0
        profile = <currentSkaterProfileIndex>
        target = ClearPart
        targetParams = { part = skater_m_kneepads }
      }
    endif
  endif
endscript
script cas_temp_disq_remove_head
  ClearPart part = skater_m_head
  ClearPart part = skater_f_head
endscript
script cas_temp_disq_remove_socks
  ClearPart part = skater_m_socks
  ClearPart part = skater_f_socks
endscript
script cas_temp_disq_remove_accessories
  ClearPart part = accessories
endscript
script cas_temp_disq_remove_kneepads
  ClearPart part = skater_m_kneepads
  ClearPart part = skater_f_kneepads
endscript
script cas_temp_disq_remove_long_hair
  if GotPart part = skater_m_hair
    if not PartGotFlag part = skater_m_hair flag = is_short_hair
      if PartGotFlag part = skater_m_hair flag = is_eddie_hair
        SetPart part = skater_m_hair desc_id = Bald
      else
        if PartGotFlag part = skater_m_hair flag = light_hair
          SetPart part = skater_m_hair desc_id = #"Buzzed Light"
        else
          SetPart part = skater_m_hair desc_id = #"Buzzed Dark"
        endif
      endif
    endif
  endif
  if GotPart part = skater_f_hair
    if not PartGotFlag part = skater_f_hair flag = is_short_hair
      if PartGotFlag part = skater_f_hair flag = light_hair
        SetPart part = skater_f_hair desc_id = #"Very Short Light"
      else
        SetPart part = skater_f_hair desc_id = #"Very Short Dark"
      endif
    endif
  endif
endscript
script cas_disq_add_sleeves
  <just_changed_torso> = 0

  if ( ChecksumEquals a = <part> b = skater_m_torso )
    <just_changed_torso> = 1
  endif

  if ( ChecksumEquals a = <part> b = skater_f_torso )
    <just_changed_torso> = 1
  endif

  if ( <just_changed_torso> = 1 )
    GetActualCASOptionStruct part = <part> desc_id = <desc_id>
    EditPlayerAppearance {
        profile = <currentSkaterProfileIndex>
        target = SetPart
        targetParams = { part = sleeves desc_id = #"None" }
    }
  endif
endscript
script cas_disq_add_shoelaces
  <just_changed_shoes> = 0

  if ( ChecksumEquals a = <part> b = shoes )
    <just_changed_shoes> = 1
  endif

  if ( <just_changed_shoes> = 1 )
    GetActualCASOptionStruct part = <part> desc_id = <desc_id>
    EditPlayerAppearance {
        profile = <currentSkaterProfileIndex>
        target = SetPart
        targetParams = { part = shoelaces desc_id = #"None" }
    }
  endif
endscript
cas_general_exceptions = [
  {
    condition = { flag = no_headgear }
    disqualify = [
      { hat }
      { helmet }
    ]
  }
  {
    condition = { flag = no_hair }
    disqualify = [
      { skater_m_hair }
      { skater_f_hair }
    ]
  }
  {
    condition = { flag = is_elissa_head }
    disqualify = [
      { flag = shows_panties }
      { torso , desc_id = #"Snow Jacket 2" }
      { torso , desc_id = #"Snow Jacket 1" }
      { torso , desc_id = #"Padded Jacket" }
      { torso , desc_id = Vest }
      { torso , desc_id = #"Vest - Camo" }
      { torso , desc_id = #"Vest - Padded" }
      { torso , desc_id = #"Vest - Two-Tone" }
      { torso , desc_id = #"Denim Jacket" }
    ]
  }
  {
    condition = { flag = is_caballero_head }
    disqualify = [
      { skater_m_hair }
      { skater_f_hair }
      { glasses }
      { hat }
    ]
  }
  {
    condition = { flag = covers_elbows }
    disqualify = [
      { skater_m_elbowpads }
      { skater_f_elbowpads }
    ]
  }
  {
    condition = { flag = covers_arms }
    disqualify = [
      { accessories }
    ]
  }
  {
    condition = { flag = no_glasses }
    disqualify = [
      { glasses }
    ]
  }
  {
    condition = { flag = no_socks }
    disqualify = [
      { skater_m_socks }
      { skater_f_socks }
    ]
  }
  {
    condition = { flag = is_helmet }
    disqualify = [
      { hat }
      { hat_logo }
    ]
  }
  {
    condition = { flag = no_bam_hat_support }
    disqualify = [
      { hat , desc_id = AdVisor }
      { hat , desc_id = #"Retro Banned" }
    ]
  }
]
