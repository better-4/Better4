
colormenu_bar_scale = (4.4, 2)
colormenu_bar_focus_rgba = [ 128 128 128 118 ]
colormenu_bar_unfocus_rgba = [ 40 40 40 118 ]
colormenu_bar_pos = (12, 0)
colormenu_text_pos = (-102, 0)
colormenu_spacing_between = 25
colormenu_arrow_pos_up = (0, 7)
colormenu_arrow_pos_down = (0, -7)
colormenu_arrow_rgba = [ 128 128 128 128 ]
colormenu_arrow_scale = 0.7
colormenu_wrap_arrow_left = -53.0
colormenu_wrap_arrow_right = 80.0
colormenu_nowrap_arrow_left = -53.0
colormenu_nowrap_arrow_right = 80.0
colormenu_hue_increment = 5
colormenu_saturation_increment = 3
colormenu_value_increment = 2
colormenu_min_saturation = 0.0
colormenu_max_saturation = 128.0
colormenu_min_value = 0.0
colormenu_max_value = 128.0
script colormenu_focus rgba = [ 128 128 128 50 ]
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
    id = <color_bar_id>
    rgba = colormenu_bar_focus_rgba
  }
  DoScreenElementMorph {
    id = <down_arrow_id>
    scale = colormenu_arrow_scale
  }
  DoScreenElementMorph {
    id = <up_arrow_id>
    scale = colormenu_arrow_scale
  }
  colormenu_refresh_arrows part = <part>
  generic_menu_update_arrows {
    up_arrow_id = edit_skater_menu_up_arrow
    down_arrow_id = edit_skater_menu_down_arrow
  }
endscript
script colormenu_unfocus rgba = [ 128 128 128 0 ]
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down
  SetScreenElementProps {
    id = <color_bar_id>
    rgba = colormenu_bar_unfocus_rgba
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
script colormenu_get_hsv
  GetCurrentSkaterProfileIndex
  GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part>
  if not GotParam use_default_hsv
     <use_default_hsv> = 1
  endif
  if not GotParam h
     <h> = 0
  endif
  if not GotParam s
     <s> = 0
  endif
  if not GotParam v
     <v> = 0
  endif
  if ( <use_default_hsv> = 1 )
     <h> = 0
     <s> = 50
     <v> = 50
  endif
  return h = <h> s = <s> v = <v> use_default_hsv = <use_default_hsv>
endscript
script colormenu_set_hsv
  GetCurrentSkaterProfileIndex
  SetPlayerAppearanceColor player = <currentSkaterProfileIndex> part = <part> h = <h> s = <s> v = <v> use_default_hsv = 0
endscript
script colormenu_refresh_arrows
  colormenu_get_hsv part = <part>
  sliderbar_rescale_to_bar min = 0.0 max = 360.0 value = <h> left = colormenu_wrap_arrow_left right = colormenu_wrap_arrow_right
  SetScreenElementProps {
    id = hue_up_arrow
    pos = ( (1, 0) * <x_val> )
  }
  SetScreenElementProps {
    id = hue_down_arrow
    pos = ( (1, 0) * <x_val> )
  }
  sliderbar_rescale_to_bar min = colormenu_min_saturation max = colormenu_max_saturation value = <s> left = colormenu_nowrap_arrow_left right = colormenu_nowrap_arrow_right
  SetScreenElementProps {
    id = saturation_up_arrow
    pos = ( (1, 0) * <x_val> )
  }
  SetScreenElementProps {
    id = saturation_down_arrow
    pos = ( (1, 0) * <x_val> )
  }
  sliderbar_rescale_to_bar min = colormenu_min_value max = colormenu_max_value value = <v> left = colormenu_nowrap_arrow_left right = colormenu_nowrap_arrow_right
  SetScreenElementProps {
    id = value_up_arrow
    pos = ( (1, 0) * <x_val> )
  }
  SetScreenElementProps {
    id = value_down_arrow
    pos = ( (1, 0) * <x_val> )
  }
endscript
script colormenu_refresh_skaters
  GetCurrentSkaterProfileIndex
  RefreshSkaterColors skater = 0 profile = <currentSkaterProfileIndex>
  if IsAlive name = TRG_Deck_Main
    colormenu_get_hsv part = board
    if ( <use_default_hsv> = 1 )
      Printf "clear color"
      PrintStruct <...>
      trg_deck_maintrucks:Obj_ClearColor
      trg_deck_mainjets:Obj_ClearColor
    else
      Printf "set color"
      trg_deck_maintrucks:Obj_SetColor h = <h> s = <s> v = <v>
      trg_deck_mainjets:Obj_SetColor h = <h> s = <s> v = <v>
    endif
  endif
endscript
script colormenu_increment_hue
  Printf "incrementing hue"
  colormenu_get_hsv part = <part>
   <h> = ( <h> + colormenu_hue_increment )
  if ( <h> > 359 )
     <h> = ( <h> - 360 )
  endif
  colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
  colormenu_refresh_arrows part = <part>
  colormenu_refresh_skaters
endscript
script colormenu_decrement_hue
  Printf "decrementing hue"
  colormenu_get_hsv part = <part>
   <h> = ( <h> - colormenu_hue_increment )
  if ( <h> < 0 )
     <h> = ( <h> + 360 )
  endif
  colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
  colormenu_refresh_arrows part = <part>
  colormenu_refresh_skaters
endscript
script colormenu_increment_saturation
  Printf "incrementing saturation"
  colormenu_get_hsv part = <part>
   <s> = ( <s> + colormenu_saturation_increment )
  if ( <s> > colormenu_max_saturation )
     <s> = colormenu_max_saturation
  endif
  colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
  colormenu_refresh_arrows part = <part>
  colormenu_refresh_skaters
endscript
script colormenu_decrement_saturation
  Printf "decrementing saturation"
  colormenu_get_hsv part = <part>
   <s> = ( <s> - colormenu_saturation_increment )
  if ( <s> < colormenu_min_saturation )
     <s> = colormenu_min_saturation
  endif
  colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
  colormenu_refresh_arrows part = <part>
  colormenu_refresh_skaters
endscript
script colormenu_increment_value
  Printf "incrementing value"
  colormenu_get_hsv part = <part>
   <v> = ( <v> + colormenu_value_increment )
  if ( <v> > colormenu_max_value )
     <v> = colormenu_max_value
  endif
  colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
  colormenu_refresh_arrows part = <part>
  colormenu_refresh_skaters
endscript
script colormenu_decrement_value
  Printf "decrementing value"
  colormenu_get_hsv part = <part>
   <v> = ( <v> - colormenu_value_increment )
  if ( <v> < colormenu_min_value )
     <v> = colormenu_min_value
  endif
  colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
  colormenu_refresh_arrows part = <part>
  colormenu_refresh_skaters
endscript
script colormenu_reset_to_default
   <h> = 0
   <s> = 50
   <v> = 50
  GetCurrentSkaterProfileIndex
  SetPlayerAppearanceColor player = <currentSkaterProfileIndex> part = <part> h = <h> s = <s> v = <v> use_default_hsv = 1
  colormenu_refresh_arrows part = <part>
  colormenu_refresh_skaters
endscript
script colormenu_add_options_to_menu
  SetScreenElementProps {
    id = current_menu
    spacing_between = colormenu_spacing_between
  }
  if GotParam from_cas
    create_helper_text generic_helper_text_color_menu
  endif
  sliderbar_add_item {
    text = 'Hue'
    focus_script = colormenu_focus
    focus_params = {
      pad_left_handler = colormenu_decrement_hue
      pad_right_handler = colormenu_increment_hue
      handler_params = { part = <part> }
      up_arrow_id = hue_up_arrow
      down_arrow_id = hue_down_arrow
      part = <part>
      color_bar_id = hue_slider_bar
    }
    unfocus_script = colormenu_unfocus
    unfocus_params = {
      up_arrow_id = hue_up_arrow
      down_arrow_id = hue_down_arrow
      color_bar_id = hue_slider_bar
    }
    pad_choose_script = nullscript
    child_texture = colorbar
    icon_id = hue_slider_bar
    icon_scale = colormenu_bar_scale
    icon_rgba = colormenu_bar_unfocus_rgba
    icon_pos = colormenu_bar_pos
    text_pos = colormenu_text_pos
    text_just = [ left center ]
    tab = tab3
    anchor_id = hue_anchor
    up_arrow_id = hue_up_arrow
    down_arrow_id = hue_down_arrow
    arrow_pos_up = colormenu_arrow_pos_up
    arrow_pos_down = colormenu_arrow_pos_down
    arrow_rgba = colormenu_arrow_rgba
    dims = <dims>
  }
  sliderbar_add_item {
    text = 'Sat.'
    focus_script = colormenu_focus
    focus_params = {
      pad_left_handler = colormenu_decrement_saturation
      pad_right_handler = colormenu_increment_saturation
      handler_params = { part = <part> }
      up_arrow_id = saturation_up_arrow
      down_arrow_id = saturation_down_arrow
      part = <part>
      color_bar_id = saturation_slider_bar
    }
    unfocus_script = colormenu_unfocus
    unfocus_params = {
      up_arrow_id = saturation_up_arrow
      down_arrow_id = saturation_down_arrow
      color_bar_id = saturation_slider_bar
    }
    pad_choose_script = nullscript
    child_texture = bw_slider
    icon_id = saturation_slider_bar
    icon_scale = colormenu_bar_scale
    icon_rgba = colormenu_bar_unfocus_rgba
    icon_pos = colormenu_bar_pos
    text_pos = colormenu_text_pos
    text_just = [ left center ]
    tab = tab3
    anchor_id = saturation_anchor
    up_arrow_id = saturation_up_arrow
    down_arrow_id = saturation_down_arrow
    arrow_pos_up = colormenu_arrow_pos_up
    arrow_pos_down = colormenu_arrow_pos_down
    arrow_rgba = colormenu_arrow_rgba
    dims = <dims>
  }
  sliderbar_add_item {
    text = 'Val.'
    focus_script = colormenu_focus
    focus_params = {
      pad_left_handler = colormenu_decrement_value
      pad_right_handler = colormenu_increment_value
      handler_params = { part = <part> }
      up_arrow_id = value_up_arrow
      down_arrow_id = value_down_arrow
      part = <part>
      color_bar_id = value_slider_bar
    }
    unfocus_script = colormenu_unfocus
    unfocus_params = {
      up_arrow_id = value_up_arrow
      down_arrow_id = value_down_arrow
      color_bar_id = value_slider_bar
    }
    pad_choose_script = nullscript
    child_texture = bw_slider
    icon_id = value_slider_bar
    icon_scale = colormenu_bar_scale
    icon_rgba = colormenu_bar_unfocus_rgba
    icon_pos = colormenu_bar_pos
    text_pos = colormenu_text_pos
    text_just = [ left center ]
    tab = tab3
    anchor_id = value_anchor
    up_arrow_id = value_up_arrow
    down_arrow_id = value_down_arrow
    arrow_pos_up = colormenu_arrow_pos_up
    arrow_pos_down = colormenu_arrow_pos_down
    arrow_rgba = colormenu_arrow_rgba
    dims = <dims>
  }
  if not ChecksumEquals a = <part> b = board
    edit_skater_menu_add_item {
      text = 'Reset to default'
      pad_choose_script = colormenu_reset_to_default
      pad_choose_params = { part = <part> }
      tab = tab3
    }
  else
    SetScreenElementLock id = boardshop_griptape_menu off
    edit_tricks_menu_add_item {
      text = 'Reset to default'
      text_pos = (-35, 0)
      dims = (40, 24)
      bg_scale = (60, 6)
      bg_pos = (-160, 0)
      text_scale = 0.7
      pad_choose_script = colormenu_reset_to_default
      pad_choose_params = { part = <part> }
      focus_params = { highlight_bar_scale = 0 }
      last_item
    }
  endif
endscript
