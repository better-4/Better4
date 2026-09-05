script better4_load_anims
  LoadAnim name = "anims\better4\SpacewalkFromManual.ska" descChecksum = SpacewalkFromManual
  LoadAnim name = "anims\better4\Spacewalk.ska" descChecksum = Spacewalk
  LoadAnim name = "anims\better4\SpacewalkToManual.ska" descChecksum = SpacewalkToManual

  LoadAnim name = "anims\better4\Wallpush_Crouched.ska" descChecksum = Wallpush_Crouched
  LoadAnim name = "anims\better4\Wallpush_Manual.ska" descChecksum = Wallpush_Manual
  LoadAnim name = "anims\better4\Wallpush_NoseManual.ska" descChecksum = Wallpush_NoseManual
  LoadAnim name = "anims\better4\Wallpush_Standing.ska" descChecksum = Wallpush_Standing
endscript

script better4_anim_debug
    MakeSkaterGoto better4_anim_trigger params = <...>
endscript

script better4_anim_trigger
    printf "Animation Started"
    SetRollingFriction 100
    switch <index> 
    case 0
        PlayAnim Anim = Wallpush_Crouched cycle
    case 1
        PlayAnim Anim = Wallpush_Manual cycle
    case 2
        PlayAnim Anim = Wallpush_NoseManual cycle
    case 3
        PlayAnim Anim = Wallpush_Standing cycle
    endswitch
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
