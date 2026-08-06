scalingmenu_bar_scale = (4.4, 2)
scalingmenu_bar_focus_rgba = [ 128 128 128 128 ]
scalingmenu_bar_unfocus_rgba = [ 40 40 40 128 ]
scalingmenu_bar_pos = (12, 0)
scalingmenu_text_pos = (-102, 0)
scalingmenu_spacing_between = 25
scalingmenu_arrow_pos_up = (0, 7)
scalingmenu_arrow_pos_down = (0, -7)
scalingmenu_arrow_rgba = [ 128 128 128 128 ]
scalingmenu_arrow_scale = 1.5
scalingmenu_arrow_left = -49.0
scalingmenu_arrow_right = 76.0
scalingmenu_scale_increment = 1
scalingmenu_min_scale = 0.0
scalingmenu_max_scale = 100.0
scalingmenu_constraints = [
  { part = object_scaling male_min = 0.0 male_max = 200.0 female_min = 0.0 female_max = 200.0 }
  { part = head_bone_group male_min = 0.0 male_max = 200.0 female_min = 0.0 female_max = 200.0 }
  { part = torso_bone_group male_min = 0.0 male_max = 200.0 female_min = 0.0 female_max = 200.0 }
  { part = stomach_bone_group male_min = 0.0 male_max = 200.0 female_min = 0.0 female_max = 200.0 }
  { part = upper_arm_bone_group male_min = 0.0 male_max = 200.0 female_min = 0.0 female_max = 200.0 }
  { part = lower_arm_bone_group male_min = 0.0 male_max = 200.0 female_min = 0.0 female_max = 200.0 }
  { part = hands_bone_group male_min = 0.0 male_max = 200.0 female_min = 0.0 female_max = 200.0 }
  { part = upper_leg_bone_group male_min = 0.0 male_max = 200.0 female_min = 0.0 female_max = 200.0 }
  { part = lower_leg_bone_group male_min = 0.0 male_max = 200.0 female_min = 0.0 female_max = 200.0 }
  { part = feet_bone_group male_min = 0.0 male_max = 200.0 female_min = 0.0 female_max = 200.0 }
]
head_bone_group = [
  head
  jaw
  mullet_cloth_zz
  brain_zz
  neck
]
stomach_bone_group = [
  pelvis
  stomach
]
torso_bone_group = [
  chest
  breast_cloth_zz
  hood_cloth_zz
]
upper_arm_bone_group = [
  left_shoulder
  left_collar
  left_bicep
  left_top_sleeve_cloth_zz
  right_shoulder
  right_collar
  right_bicep
  right_top_sleeve_cloth_zz
]
lower_arm_bone_group = [
  left_forearm
  left_wrist
  left_palm
  left_thumb_base
  left_forefinger_base
  left_forefinger_tip
  left_fingers_tip
  left_low_sleeve_cloth_zz
  right_forearm
  right_wrist
  right_palm
  right_thumb_base
  right_forefinger_base
  right_forefinger_tip
  right_fingers_tip
  right_low_sleeve_cloth_zz
]
hands_bone_group = [
  left_wrist
  left_palm
  right_wrist
  right_palm
  left_thumb_base
  left_forefinger_base
  left_forefinger_tip
  left_fingers_base
  left_fingers_tip
  right_thumb_base
  right_forefinger_base
  right_forefinger_tip
  right_fingers_base
  right_fingers_tip
]
upper_leg_bone_group = [
  right_hip
  right_top_trouser_cloth_zz
  left_hip
  left_top_trouser_cloth_zz
  shirt_tail_cloth_zz
]
lower_leg_bone_group = [
  left_knee
  left_low_trouser_cloth_zz
  right_knee
  right_low_trouser_cloth_zz
]
feet_bone_group = [
  left_ankle
  left_toes
  right_ankle
  right_toes
]
board_bone_group = [
  burnq_board
  burnq_front_wheel
  burnq_back_wheel
]
skateshop_scaling_options = [
  {
    text = 'Body'
    submenu = face_scale_menu
    should_add_scaling_options
    scaling_params = { affectX affectY affectZ affectXYZ }
    bone_group = object_scaling
    is_visible_script = currently_editing_custom
  }
  {
    text = 'Head'
    submenu = face_scale_menu
    should_add_scaling_options
    scaling_params = { affectX affectY affectZ affectXYZ }
    bone_group = head_bone_group
    is_visible_script = currently_editing_custom
    is_enabled_script = check_if_group_editable
    is_enabled_params = { group = head_items }
    cam_anim_sub = SS_Appearance_Face
  }
  {
    text = 'Chest'
    submenu = torso_scale_menu
    scaling_params = { affectX affectY affectZ affectXYZ }
    is_visible_script = currently_editing_custom
    should_add_scaling_options
    bone_group = torso_bone_group
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'Waist'
    submenu = stomach_scale_menu
    scaling_params = { affectX affectY affectZ affectXYZ }
    is_visible_script = currently_editing_custom
    should_add_scaling_options
    bone_group = stomach_bone_group
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'Biceps'
    submenu = upper_arm_scale_menu
    scaling_params = { affectX affectY affectZ affectXYZ }
    is_visible_script = currently_editing_custom
    should_add_scaling_options
    bone_group = upper_arm_bone_group
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'Forearms'
    submenu = lower_arm_scale_menu
    scaling_params = { affectX affectY affectZ affectXYZ }
    is_visible_script = currently_editing_custom
    should_add_scaling_options
    bone_group = lower_arm_bone_group
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'Hands'
    submenu = hands_scale_menu
    scaling_params = { affectX affectY affectZ affectXYZ }
    is_visible_script = currently_editing_custom
    should_add_scaling_options
    bone_group = hands_bone_group
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'Thighs'
    submenu = upper_leg_scale_menu
    scaling_params = { affectX affectY affectZ affectXYZ }
    is_visible_script = currently_editing_custom
    should_add_scaling_options
    bone_group = upper_leg_bone_group
    cam_anim_sub = SS_Appearance_Legs
  }
  {
    text = 'Calves'
    submenu = lower_leg_scale_menu
    scaling_params = { affectX affectY affectZ affectXYZ }
    is_visible_script = currently_editing_custom
    should_add_scaling_options
    bone_group = lower_leg_bone_group
    cam_anim_sub = SS_Appearance_Feet
  }
  {
    text = 'Feet'
    submenu = feet_scale_menu
    scaling_params = { affectX affectY affectZ affectXYZ }
    is_visible_script = currently_editing_custom
    should_add_scaling_options
    bone_group = feet_bone_group
    cam_anim_sub = SS_Appearance_Feet
  }
  {
    text = 'Board'
    submenu = board_scale_menu
    should_add_scaling_options
    scaling_params = { affectX affectY affectZ affectXYZ }
    bone_group = board_bone_group
    is_visible_script = currently_editing_custom
  }
]

script scalingmenu_refresh_skaters
  GetCurrentSkaterProfileIndex
  RefreshSkaterScale skater = 0 profile = <currentSkaterProfileIndex>
endscript

script scalingmenu_increment_uniform
  scalingmenu_increment affectX = 1 affectY = 1 affectZ = 1 <...>
endscript

script scalingmenu_decrement_uniform
  scalingmenu_decrement affectX = 1 affectY = 1 affectZ = 1 <...>
endscript

script scalingmenu_get_limits
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  GetArraySize scalingmenu_constraints
   <index> = 0
  begin
    if ChecksumEquals a = ( ( scalingmenu_constraints [ <index> ] ).part ) b = <part>
      if ( <is_male> = 1 )
         <min> = ( ( scalingmenu_constraints [ <index> ] ).male_min )
         <max> = ( ( scalingmenu_constraints [ <index> ] ).male_max )
      else
         <min> = ( ( scalingmenu_constraints [ <index> ] ).female_min )
         <max> = ( ( scalingmenu_constraints [ <index> ] ).female_max )
      endif
      break
    endif
     <index> = ( <index> + 1 )
  repeat <array_size>
  if not GotParam min
     <min> = 90.0
  endif
  if not GotParam max
     <max> = 150.0
  endif
  return min = <min> max = <max>
endscript

script scalingmenu_increment
  Printf "incrementing scale"
  scalingmenu_get_xyz part = <part>
  scalingmenu_get_limits part = <part> <...>
  if GotParam affectX
    if ( <affectX> = 1 )
       <X> = ( <X> + scalingmenu_scale_increment )
      if ( <X> > <max> )
         <X> = <max>
      endif
    endif
  endif
  if GotParam affectY
    if ( <affectY> = 1 )
       <Y> = ( <Y> + scalingmenu_scale_increment )
      if ( <Y> > <max> )
         <Y> = <max>
      endif
    endif
  endif
  if GotParam affectZ
    if ( <affectZ> = 1 )
       <z> = ( <z> + scalingmenu_scale_increment )
      if ( <z> > <max> )
         <z> = <max>
      endif
    endif
  endif
  scalingmenu_set_xyz part = <part> X = <X> Y = <Y> z = <z>
  scalingmenu_refresh_arrows <...> <handler_params>
  scalingmenu_refresh_skaters
endscript

script scalingmenu_decrement
  Printf "decrementing scale"
  scalingmenu_get_xyz part = <part>
  scalingmenu_get_limits part = <part> <...>
  if GotParam affectX
    if ( <affectX> = 1 )
       <X> = ( <X> - scalingmenu_scale_increment )
      if ( <X> < <min> )
         <X> = <min>
      endif
    endif
  endif
  if GotParam affectY
    if ( <affectY> = 1 )
       <Y> = ( <Y> - scalingmenu_scale_increment )
      if ( <Y> < <min> )
         <Y> = <min>
      endif
    endif
  endif
  if GotParam affectZ
    if ( <affectZ> = 1 )
       <z> = ( <z> - scalingmenu_scale_increment )
      if ( <z> < <min> )
         <z> = <min>
      endif
    endif
  endif
  scalingmenu_set_xyz part = <part> X = <X> Y = <Y> z = <z>
  scalingmenu_refresh_arrows <...> <handler_params>
  scalingmenu_refresh_skaters
endscript

script scalingmenu_reset_to_default
   <X> = 100
   <Y> = 100
   <z> = 100
  GetCurrentSkaterProfileIndex
  SetPlayerAppearanceScale player = <currentSkaterProfileIndex> part = <part> X = <X> Y = <Y> z = <z> use_default_scale = 1
  scalingmenu_refresh_skaters
endscript

script scalingmenu_get_xyz
  GetCurrentSkaterProfileIndex
  GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part>
  if not GotParam use_default_scale
     <use_default_scale> = 1
  endif
  if not GotParam X
     <X> = 100
  endif
  if not GotParam Y
     <Y> = 100
  endif
  if not GotParam z
     <z> = 100
  endif
  if ( <use_default_scale> = 1 )
     <h> = 100
     <s> = 100
     <v> = 100
  endif
  return X = <X> Y = <Y> z = <z>
endscript

script scalingmenu_set_xyz
  GetCurrentSkaterProfileIndex
  SetPlayerAppearanceScale player = <currentSkaterProfileIndex> part = <part> X = <X> Y = <Y> z = <z> use_default_scale = 0
endscript

script scalingmenu_refresh_arrows
  scalingmenu_get_xyz part = <part>
   <v> = 0
  if GotParam affectX
    if ( <affectX> = 1 )
       <v> = <X>
    endif
  endif
  if GotParam affectY
    if ( <affectY> = 1 )
       <v> = <Y>
    endif
  endif
  if GotParam affectZ
    if ( <affectZ> = 1 )
       <v> = <z>
    endif
  endif
  Printf "%x %y %z" X = <X> Y = <Y> z = <z>
  scalingmenu_get_limits part = <part> <...>
  sliderbar_rescale_to_bar min = <min> max = <max> value = <v> left = scalingmenu_arrow_left right = scalingmenu_arrow_right
  Printf <x_val>
  SetScreenElementProps {
    id = <up_arrow_id>
    pos = ( (1, 0) * <x_val> )
  }
  SetScreenElementProps {
    id = <down_arrow_id>
    pos = ( (1, 0) * <x_val> )
  }
endscript

script scalingmenu_focus rgba = [ 128 128 128 50 ]
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  if GotParam pad_left_handler
    SetScreenElementProps {
      id = <id>
      event_handlers = [
        { pad_left <pad_left_handler> params = <handler_params> }
      ]
      replace_handlers
    }
  endif
  if GotParam pad_right_handler
    SetScreenElementProps {
      id = <id>
      event_handlers = [
        { pad_right <pad_right_handler> params = <handler_params> }
      ]
      replace_handlers
    }
  endif
  SetScreenElementProps {
    id = <scaling_bar_id>
    rgba = scalingmenu_bar_focus_rgba
  }
  DoScreenElementMorph {
    id = <down_arrow_id>
    scale = scalingmenu_arrow_scale
  }
  DoScreenElementMorph {
    id = <up_arrow_id>
    scale = scalingmenu_arrow_scale
  }
  scalingmenu_refresh_arrows <...> <handler_params>
  generic_menu_update_arrows {
    up_arrow_id = edit_skater_menu_up_arrow
    down_arrow_id = edit_skater_menu_down_arrow
  }
endscript

script scalingmenu_unfocus rgba = [ 128 128 128 0 ]
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down
  SetScreenElementProps {
    id = <scaling_bar_id>
    rgba = scalingmenu_bar_unfocus_rgba
  }
  DoScreenElementMorph {
    id = <down_arrow_id>
    scale = 0.0
  }
  DoScreenElementMorph {
    id = <up_arrow_id>
    scale = 0.0
  }
endscript

script scalingmenu_addslider text = 'XYZ' affectX = 0 affectY = 0 affectZ = 0 id = default_slider_bar
  MangleChecksums a = <id> b = up_arrow
   <up_arrow_id> = <mangled_id>
  MangleChecksums a = <id> b = down_arrow
   <down_arrow_id> = <mangled_id>
  MangleChecksums a = <id> b = slider_bar
   <slider_bar_id> = <mangled_id>
  MangleChecksums a = <id> b = anchor
   <anchor_id> = <mangled_id>
  sliderbar_add_item {
    text = <text>
    focus_script = scalingmenu_focus
    focus_params = {
      pad_left_handler = scalingmenu_decrement_uniform
      pad_right_handler = scalingmenu_increment_uniform
      handler_params = <...>
      up_arrow_id = <up_arrow_id>
      down_arrow_id = <down_arrow_id>
      part = <part>
      scaling_bar_id = <slider_bar_id>
      affectX = <affectX>
      affectY = <affectY>
      affectZ = <affectZ>
    }
    unfocus_script = scalingmenu_unfocus
    unfocus_params = {
      up_arrow_id = <up_arrow_id>
      down_arrow_id = <down_arrow_id>
      scaling_bar_id = <slider_bar_id>
    }
    pad_choose_script = nullscript
    child_texture = scalebar
    icon_id = <slider_bar_id>
    icon_scale = scalingmenu_bar_scale
    icon_rgba = scalingmenu_bar_unfocus_rgba
    icon_pos = scalingmenu_bar_pos
    text_pos = scalingmenu_text_pos
    text_just = [ left center ]
    tab = tab3
    anchor_id = <anchor_id>
    up_arrow_id = <up_arrow_id>
    down_arrow_id = <down_arrow_id>
    arrow_pos_up = scalingmenu_arrow_pos_up
    arrow_pos_down = scalingmenu_arrow_pos_down
    arrow_rgba = scalingmenu_arrow_rgba
    up_arrow_texture = scale_up
    down_arrow_texture = scale_down
  }
endscript

script scalingmenu_add_options_to_menu
  SetScreenElementProps {
    id = current_menu
    spacing_between = scalingmenu_spacing_between
  }
  if GotParam affectX
    scalingmenu_addslider {
      text = 'X'
      affectX = 1
      id = scalingmenu_x_slider
      part = <part>
      min = <min>
      max = <max>
    }
  endif
  if GotParam affectY
    scalingmenu_addslider {
      text = 'Y'
      affectY = 1
      id = scalingmenu_y_slider
      part = <part>
      min = <min>
      max = <max>
    }
  endif
  if GotParam affectZ
    scalingmenu_addslider {
      text = 'Z'
      affectZ = 1
      id = scalingmenu_z_slider
      part = <part>
      min = <min>
      max = <max>
    }
  endif
  if GotParam affectXY
    scalingmenu_addslider {
      text = 'XY'
      affectX = 1
      affectY = 1
      id = scalingmenu_xyz_slider
      part = <part>
      min = <min>
      max = <max>
    }
  endif
  if GotParam affectXYZ
    scalingmenu_addslider {
      text = 'XYZ'
      affectX = 1
      affectY = 1
      affectZ = 1
      id = scalingmenu_xyz_slider
      part = <part>
      min = <min>
      max = <max>
    }
  endif
  edit_skater_menu_add_item {
    text = 'Reset to default'
    pad_choose_script = scalingmenu_reset_to_default
    pad_choose_params = { part = <part> }
    tab = tab3
  }
  create_helper_text generic_helper_text_color_menu
endscript

script scalingmenu_add_bodyshapes_to_menu
  GetArraySize master_bodyshape_list
   <index> = 0
  begin
    edit_skater_menu_add_item {
      text = ( ( master_bodyshape_list [ <index> ] ).text )
      tab = tab2
      pad_choose_script = cas_apply_bodyshape
      pad_choose_params = { field = body_shape value = ( ( master_bodyshape_list [ <index> ] ).scaling_table ) }
    }
     <index> = ( <index> + 1 )
  repeat <array_size>
endscript
