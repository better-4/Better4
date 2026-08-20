script better4_anim_debug
    MakeSkaterGoto better4_anim_trigger
endscript

script better4_anim_trigger
    printf "Animation Started"
    SetRollingFriction 100
    PlayAnim Anim = Boneless cycle
    create_panel_message {
        text = "Animation Test"
        id = animtest
        rgba = [ 127 127 127 128 ]
        pos = ((340.00000000000, 340.00000000000) - <widescreen_offset>)
        style = perfect_style
    }
    UnpauseGame
    exit_pause_menu
endscript
