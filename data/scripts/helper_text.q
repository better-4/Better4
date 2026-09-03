
script create_helper_text { anchor_id = helper_text_anchor
    parent = current_menu_anchor
    helper_text_anchor = <helper_text_anchor>
    helper_pos = (320, 437)
    bg_rgba = [ 0 0 0 60 ]
  }
  if ObjectExists id = <anchor_id>
    DestroyScreenElement id = <anchor_id>
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = <anchor_id>
    pos = (320, 229)
    dims = (640, 480)
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = highlight_bar
    pos = <helper_pos>
    just = [ center bottom ]
    rgba = <bg_rgba>
    scale = (5.5, 1.75)
  }
  CreateScreenElement {
    type = HMenu
    parent = <anchor_id>
    pos = ( <helper_pos> - (0, 3) )
    just = [ center bottom ]
    internal_just = [ center center ]
    padding_scale = 0.9
    spacing_between = 3
  }
   <menu_id> = <id>
  if GotParam helper_text_elements
    ForEachIn <helper_text_elements> do = helper_text_update_element params = { menu_id = <menu_id> }
  endif
endscript
script helper_text_update_element
  if GotParam id
    if ObjectExists <id>
      SetScreenElementProps {
        id = <id>
        text = <text>
      }
      return
    endif
  endif
  CreateScreenElement {
    type = TextElement
    parent = <menu_id>
    id = <id>
    font = dialog
    text = <text>
    rgba = [ 70 70 70 108 ]
    scale = 0.79
    not_focusable
  }
endscript
script create_helper_text_observe { anchor_id = helper_text_anchor
    parent = current_menu_anchor
    helper_text_anchor = <helper_text_anchor>
    helper_pos = (320, 437)
    bg_rgba = [ 0 0 0 60 ]
  }
  if ObjectExists id = <anchor_id>
    DestroyScreenElement id = <anchor_id>
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = <anchor_id>
    pos = (320, 229)
    dims = (640, 480)
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = highlight_bar
    pos = <helper_pos>
    just = [ center bottom ]
    rgba = <bg_rgba>
    scale = (5.5, 1.75)
  }
  CreateScreenElement {
    type = HMenu
    parent = <anchor_id>
    pos = ( <helper_pos> - (0, 3) )
    just = [ center bottom ]
    internal_just = [ center center ]
    padding_scale = 0.9
    spacing_between = 3
  }
   <menu_id> = <id>
  if GotParam helper_text_elements
    ForEachIn <helper_text_elements> do = helper_text_update_element_observe params = { menu_id = <menu_id> }
  endif
endscript
script helper_text_update_element_observe
  if GotParam id
    if ObjectExists <id>
      SetScreenElementProps {
        id = <id>
        text = <text>
      }
      return
    endif
  endif
  CreateScreenElement {
    type = TextElement
    parent = <menu_id>
    id = <id>
    font = dialog
    text = <text>
    rgba = [ 70 70 70 108 ]
    scale = 0.70
    not_focusable
  }
endscript
script create_helper_text_no_bg { anchor_id = helper_text_anchor
    parent = current_menu_anchor
    helper_text_anchor = <helper_text_anchor>
    helper_pos = (320, 437)
    bg_rgba = [ 0 0 0 0 ]
  }
  if ObjectExists id = <anchor_id>
    DestroyScreenElement id = <anchor_id>
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = <anchor_id>
    pos = (320, 229)
    dims = (640, 480)
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = highlight_bar
    pos = <helper_pos>
    just = [ center bottom ]
    rgba = <bg_rgba>
    scale = (5.5, 1.75)
  }
  CreateScreenElement {
    type = HMenu
    parent = <anchor_id>
    pos = ( <helper_pos> - (0, 3) )
    just = [ center bottom ]
    internal_just = [ center center ]
    padding_scale = 0.9
    spacing_between = 3
  }
   <menu_id> = <id>
  if GotParam helper_text_elements
    ForEachIn <helper_text_elements> do = helper_text_update_element_observe params = { menu_id = <menu_id> }
  endif
endscript
generic_helper_text = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
    { text = "\m1 = Back" }
    { text = "\m0 = Accept" }
  ]
}
generic_helper_text_unassign = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
    { text = "\m1 = Back" }
    { text = "\m0 = Accept" }
    { text = "\b0 = Unassign Trick" }
  ]
}
generic_helper_text_better4 = { helper_text_elements = [ { text = "\b7/\b4=Select" }
    { text = "\b6/\b5=Adjust" }
    { text = "\m1=Back" }
    { text = "\m0=Accept" }
  ]
}
generic_helper_text_no_back = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
    { text = "\m0 = Accept" }
  ]
}
generic_helper_text_cas = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
    { text = "\m1 = Back" }
    { text = "\m0 = Accept" }
    { text = "\be/\bf = Rotate" }
  ]
}
generic_helper_text_left_right = { helper_text_elements = [ { text = "\b6/\b5 = Select" }
    { text = "\m1 = Back" }
    { text = "\m0 = Accept" }
  ]
}
generic_helper_text_up_down_left_right = { helper_text_elements = [ { text = "\b7/\b4/\b6/\b5 = Select" }
    { text = "\m1 = Back" }
    { text = "\m0 = Accept" }
  ]
}
generic_helper_text_left_right_l_r = { helper_text_elements = [ { text = "\b6/\b5 = Select" }
    { text = "\m1 = Back" }
    { text = "\m0 = Accept" }
    { text = "\be/\bf = Rotate" }
  ]
}
generic_helper_text_color_menu = { helper_text_elements = [ { text = "\b7/\b4=Select" }
    { text = "\b6/\b5=Adjust" }
    { text = "\m1=Back" }
    { text = "\m0=Accept" }
    { text = "\be/\bf=Rotate" }
  ]
}
park_editor_helper_text = { helper_text_elements = [ { text = "\m1 = Delete" }
    { text = "\m0 = Accept" }
    { text = "\b1/\b2 = Rotate" }
    { text = "\be/\bg = Raise/Lower" }
  ]
}
park_editor_helper_text_xbox = { helper_text_elements = [ { text = "\b0 = Delete" }
    { text = "\m0 = Accept" }
    { text = "\b1/\b2 = Rotate" }
    { text = "\be/\bf = Lower/Raise" }
  ]
}
park_editor_helper_text_ngc = { helper_text_elements = [ { text = "\b1 = Delete" }
    { text = "\m0 = Accept" }
    { text = "\b0/\b2 = Rotate" }
    { text = "\be/\bf = Raise/Lower" }
  ]
}
gap_regular_helper_text = { helper_text_elements = [ { text = "\m1 = Delete" }
    { text = "\m0 = Accept" }
  ]
}
gap_regular_helper_text_xbox = { helper_text_elements = [ { text = "\b0 = Delete" }
    { text = "\m0 = Accept" }
  ]
}
gap_regular_helper_text_ngc = { helper_text_elements = [ { text = "\b1 = Delete" }
    { text = "\m0 = Accept" }
  ]
}
gap_adjust_helper_text = { helper_text_elements = [ { text = "\m1=Delete \b1/\b2=Rotate \be/\bg=Adjust Left \bf/\bh=Adjust Right" }
  ]
}
gap_adjust_helper_text_xbox = { helper_text_elements = [ { text = "\b0 = Delete" }
    { text = "\b1/\b2 = Rotate" }
    { text = "\be/\bf/\bg/\bh = Adjust" }
  ]
}
gap_adjust_helper_text_ngc = { helper_text_elements = [ { text = "\b1 = Delete" }
    { text = "\b0/\b2 = Rotate" }
    { text = "\be/\bf + \b7/\b4  = Adjust" }
  ]
}
generic_dialog_helper_text = { helper_text_elements = [ { text = "\m0 = Accept" } ] }
generic_dialog_helper_text2 = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
    { text = "\m0 = Accept" }
  ]
}
generic_dialog_helper_text3 = { helper_text_elements = [ { text = "\m1 = Back" }
    { text = "\m0 = Accept" }
  ]
}
generic_helper_text_toggle = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
    { text = "\m1 = Back" }
    { text = "\m0 = Toggle" }
  ]
}
rank_screen_helper_text = { helper_text_elements = [ 
  { text = "\b3 = Accept" } 
  { text = "\b1 = Restart Game" } 
  ] 
}
