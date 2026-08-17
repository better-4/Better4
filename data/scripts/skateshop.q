
script SkateshopAI stopskateshopstreams = 1
  SkaterInit NoEndRun ReturnControl NoAnims
  stream_repetition = 4
  TurnOffSpecialItem
  SwitchOnBoard
  ClearExceptions
  SetQueueTricks NoTricks
  DisablePlayerInput
  SetRollingFriction 10000
  KillSpawnedScript name = BlinkEyes
  SpawnSkaterScript BlinkEyes
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if ( <name> = JENNA )
    Printf "switching on shoes..................."
    SwitchOnAtomic shoes
  endif
  switch <name>
  case Caballero
    if not SpecialItemExists
      TurnOnSSGuitar
    endif
  default
    TurnOffSpecialItem
  endswitch
  if GotParam BlendOK
    WaitAnimFinished
  else
    BlendPeriodOut 0
  endif
  if GotParam CAS_Screen
    if ( <is_male> = 1 )
       <name> = editskater_male
      TurnOffSpecialItem
    else
      switch <name>
      case Steamer
        Printf "THIS IS ELISSA"
         <name> = editskater_male
      case JENNA
         <name> = JENNA
      default
         <name> = editskater_female
        Printf "THIS IS A CHICK"
      endswitch
    endif
  else
  endif
  if GotParam Credits
     <name> = neversoft
  endif
  if ( <name> = custom )
    if ( <is_male> = 0 )
       <name> = editskater_female
    endif
  endif
  Printf "------------- THIS SKATER IS: %n" n = <name>
  stream_freq = 0
  stream_freq = randomrange(0, 7)
  begin
    if not ( <stream_repetition> > 3 )
       <stream_repetition> = ( <stream_repetition> + 1 )
    endif
    switch <name>
    case editskater_male
      random( @PlayAnim Anim = StandIdleA
      @PlayAnim Anim = StandIdleB
      @PlayAnim Anim = StandIdleC
     ) case editskater_female
      random( @PlayAnim Anim = Idle_Jenna1
      WaitAnimFinished
      PlayAnim Anim = Idle_Jenna1
      @PlayAnim Anim = Idle_Jenna1
      WaitAnimFinished
      PlayAnim Anim = Idle_Jenna1ToJenna3
      WaitAnimFinished
      PlayAnim Anim = Idle_Jenna3
      WaitAnimFinished
      PlayAnim Anim = Idle_Jenna3
      WaitAnimFinished
      PlayAnim Anim = Idle_Jenna3
      WaitAnimFinished
      PlayAnim Anim = Idle_Jenna3
      WaitAnimFinished
      PlayAnim Anim = Idle_Jenna3
      WaitAnimFinished
      PlayAnim Anim = Idle_Jenna1ToJenna3 backwards
      WaitAnimFinished
      PlayAnim Anim = Idle_Jenna1
     ) case Hawk
      random( @PlayAnim Anim = Idle_HawkDropBoard
      WaitAnimFinished
      PlayAnim Anim = Idle_HawkGetBoard
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      @PlayAnim Anim = Idle_HawkToStandIdle
      WaitAnimFinished
      PlayAnim Anim = StandIdleA
      WaitAnimFinished
      PlayAnim Anim = StandIdleB
      WaitAnimFinished
      PlayAnim Anim = Idle_HawkFromStandIdle
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      @PlayAnim Anim = Idle_HawkToStandIdle
      WaitAnimFinished
      PlayAnim Anim = StandIdleB
      WaitAnimFinished
      PlayAnim Anim = StandIdleC
      WaitAnimFinished
      PlayAnim Anim = Idle_HawkFromStandIdle
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      @PlayAnim Anim = Idle_Hawk
      WaitAnimFinished
      @PlayAnim Anim = Idle_Hawk
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      @PlayAnim Anim = Idle_Hawk
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
       ) stream_freq = randomrange(0, 5)
    case Burnquist
      PlayAnim Anim = Idle_Hawk
      stream_freq = randomrange(0, 20)
    case Caballero
      PlayAnim randompermute( @Anim = Idle_Caballero1
      @Anim = Idle_Caballero1
      @Anim = Idle_Caballero1
      @Anim = Idle_Caballero2
       ) stream_freq = randomrange(0, 20)
    case Campbell
      random( @PlayAnim Anim = StandIdleA
      @PlayAnim Anim = StandIdleB
      @PlayAnim Anim = StandIdleC
      @PlayAnim Anim = Idle_Campbell
      @PlayAnim Anim = Idle_Campbell
      @PlayAnim Anim = Idle_Campbell
      @PlayAnim Anim = Idle_CampbellTossBoard
      @PlayAnim Anim = Idle_CampbellTossBoard
      @PlayAnim Anim = Idle_HawkFromStandIdle
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      WaitAnimFinished
      PlayAnim Anim = Idle_HawkDropBoard
      WaitAnimFinished
      PlayAnim Anim = Idle_HawkGetBoard
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      WaitAnimFinished
      PlayAnim Anim = Idle_HawkToStandIdle
      WaitAnimFinished
      PlayAnim Anim = StandIdleA
       ) stream_freq = randomrange(0, 10)
    case Glifberg
      random( @PlayAnim Anim = StandIdleA
      @PlayAnim Anim = StandIdleB
      @PlayAnim Anim = StandIdleC
      @PlayAnim Anim = Idle_Glifberg
      @PlayAnim Anim = Idle_Glifberg
      @PlayAnim Anim = Idle_Glifberg
      @Play_HawkIdleSet
       ) stream_freq = randomrange(0, 10)
    case Koston
      random( @PlayAnim Anim = StandIdleA
      @PlayAnim Anim = StandIdleB
      @PlayAnim Anim = StandIdleC
      @PlayAnim Anim = Idle_KostenSpin
       ) stream_freq = randomrange(0, 10)
    case Lasek
      random( @PlayAnim Anim = StandIdleA
      @PlayAnim Anim = StandIdleB
      @PlayAnim Anim = StandIdleC
      @PlayAnim Anim = Idle_Campbell
       ) stream_freq = randomrange(0, 2)
    case Margera
      random( @PlayAnim Anim = Idle_Bam
      @PlayAnim Anim = Idle_Bam
      @PlayAnim Anim = Idle_Bam
      @PlayAnim Anim = Idle_Bam
      @PlayAnim Anim = Idle_Bam
      @PlayAnim Anim = Idle_Bam
      @PlayAnim Anim = Idle_Bam
      @PlayAnim Anim = Idle_Bam
      @PlayAnim Anim = Idle_Bam
      @PlayAnim Anim = Idle_BamHit BlendPeriod = 0
      if not GotParam NoSFX
        Wait 1.02 seconds
        Obj_PlaySound bitchslap2 vol = 150 pitch = 97
      endif
       ) stream_freq = randomrange(0, 10)
    case Mullen
      // random( @ ) 
      // PlayAnim Anim = Idle_MullenCasper
      // stream_freq = randomrange(0, 10)
		PlayAnim Anim = Idle_MullenCasper
		WaitAnimFinished
		PlayAnim Anim = Idle_MullenCasperToHandStand
		WaitAnimFinished
		PlayAnim Anim = Idle_MullenHandStand
		WaitAnimFinished
		PlayAnim Anim = Idle_MullenHandStandToCasper
    case Muska
      random( @ ) 
      PlayAnim Anim = Idle_MuskaJive
      stream_freq = randomrange(0, 2)
    case Reynolds
      random( @PlayAnim Anim = Idle_ReynoldsTrucks
      @PlayAnim Anim = Idle_Reynolds1
      @PlayAnim Anim = Idle_Reynolds1
      @PlayAnim Anim = Idle_Reynolds2
      @PlayAnim Anim = Idle_Reynolds2
       ) stream_freq = randomrange(0, 4)
    case Thomas
      random( @PlayAnim Anim = Idle_ThomasSpin
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_ThomasSpin
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_ThomasSwitch
      BlendPeriodOut 0
      WaitAnimFinished
      Flip
      PlayAnim Anim = Idle_ThomasSpin
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_ThomasSpin
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_ThomasSwitch
      BlendPeriodOut 0
      WaitAnimFinished
      Flip
      @PlayAnim Anim = Idle_ThomasSpin
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_Thomas
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_Thomas
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_ThomasSwitch
      BlendPeriodOut 0
      WaitAnimFinished
      Flip
      PlayAnim Anim = Idle_ThomasSpin
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_ThomasSpin
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_Thomas
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_Thomas
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_Thomas
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_Thomas
      BlendPeriodOut 0
      WaitAnimFinished
      PlayAnim Anim = Idle_ThomasSwitch
      BlendPeriodOut 0
      WaitAnimFinished
      Flip
      @PlayAnim Anim = Idle_Thomas
      @PlayAnim Anim = Idle_Thomas
      @PlayAnim Anim = Idle_Thomas
      @PlayAnim Anim = Idle_ThomasSpin
      @PlayAnim Anim = Idle_ThomasSpin
      @PlayAnim Anim = Idle_ThomasSpin
      @PlayAnim Anim = Idle_Thomas
      BlendPeriodOut 0
      WaitAnimFinished
      Flip
      PlayAnim Anim = Idle_ThomasToStandIdle
      WaitAnimFinished
      PlayAnim Anim = StandIdleB
      WaitAnimFinished
      PlayAnim Anim = StandIdleA
      WaitAnimFinished
      PlayAnim Anim = StandIdleC
      WaitAnimFinished
      PlayAnim Anim = Idle_ThomasFromStandIdle
      BlendPeriodOut 0
      WaitAnimFinished
      Flip
       ) stream_freq = randomrange(0, 4)
    case eddie
      PlayAnim randompermute( @Anim = Idle_Eddie
      @Anim = Idle_Eddie
       ) stream_freq = randomrange(0, 20)
    case Vallely
      PlayAnim randompermute( @Anim = Idle_Vallely
      WaitAnimFinished
      PlayAnim Anim = Idle_Vallely
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyThrow speed = 1.5
      PlayThrowBoardSound <...>
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyCatch speed = 1.3
      Wait 50 frames
      Obj_ReplaceTexture src = "cs_nh_eyelid_open.png" dest = "textures/scuffs/cs_nh_eyelid_wht"
      Wait 10 frames
      Obj_ReplaceTexture src = "cs_nh_eyelid_open.png" dest = "textures/scuffs/cs_nh_eyelid_open"
      @Anim = Idle_Vallely
      WaitAnimFinished
      PlayAnim Anim = Idle_Vallely
      WaitAnimFinished
      PlayAnim Anim = Idle_Vallely
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyThrow speed = 1.5
      PlayThrowBoardSound <...>
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyCatch speed = 1.3
      Wait 50 frames
      Obj_ReplaceTexture src = "cs_nh_eyelid_open.png" dest = "textures/scuffs/cs_nh_eyelid_wht"
      Wait 10 frames
      Obj_ReplaceTexture src = "cs_nh_eyelid_open.png" dest = "textures/scuffs/cs_nh_eyelid_open"
      @Anim = Idle_Vallely
      WaitAnimFinished
      PlayAnim Anim = Idle_Vallely
      WaitAnimFinished
      PlayAnim Anim = Idle_Vallely
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyThrow speed = 1.5
      PlayThrowBoardSound <...>
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyCatch speed = 1.3
      Wait 50 frames
      Obj_ReplaceTexture src = "cs_nh_eyelid_open.png" dest = "textures/scuffs/cs_nh_eyelid_wht"
      Wait 10 frames
      Obj_ReplaceTexture src = "cs_nh_eyelid_open.png" dest = "textures/scuffs/cs_nh_eyelid_open"
      @Anim = Idle_Vallely
      @Anim = Idle_Vallely
      @Anim = Idle_Vallely
      @Anim = Idle_Vallely
      @Anim = Idle_Vallely
      @Anim = Idle_Vallely
      @Anim = Idle_Vallely
      @Anim = Idle_Vallely
       ) stream_freq = randomrange(0, 20)
    case JANGO
      random( @PlayAnim Anim = Idle_JangoSEC1
      @PlayAnim Anim = Idle_JangoSEC1
      @PlayAnim Anim = Idle_JangoSEC1
      @PlayAnim Anim = Idle_JangoSEC2
      @PlayAnim Anim = Idle_Jango
      Wait 0.5 seconds
      Obj_GetId
      MangleChecksums a = skatersplash b = <objId>
      SetScript name = <mangled_id> Emitscript = emit_jumpjets
      EmptyParticleSystem name = <mangled_id>
      ParticlesOn name = <mangled_id>
      Wait 2 second
      ParticlesOff name = <mangled_id>
       ) stream_freq = randomrange(0, 10)
    case JENNA
      random( @PlayAnim Anim = Idle_JennaPose1
      WaitAnimFinished
      PlayAnim Anim = Idle_JennaPoseToBend
      WaitAnimFinished
      PlayAnim Anim = Idle_JennaBend
      WaitAnimFinished
      PlayAnim Anim = Idle_JennaBend
      WaitAnimFinished
      PlayAnim Anim = Idle_JennaBendToPose
      @PlayAnim Anim = Idle_JennaPoseToBend
      WaitAnimFinished
      PlayAnim Anim = Idle_JennaBend
      WaitAnimFinished
      PlayAnim Anim = Idle_JennaBendToPose
      @PlayAnim Anim = Idle_JennaPose2
      WaitAnimFinished
      PlayAnim Anim = Idle_JennaPoseToBend
      WaitAnimFinished
      PlayAnim Anim = Idle_JennaBend
      WaitAnimFinished
      PlayAnim Anim = Idle_JennaBend
      WaitAnimFinished
      PlayAnim Anim = Idle_JennaBendToPose
      @PlayAnim Anim = Idle_JennaPose1
      @PlayAnim Anim = Idle_JennaPose2
       ) stream_freq = randomrange(0, 2)
    case neversoft
      random( @PlayAnim Anim = Idle_BamHit BlendPeriod = 0
      if not GotParam NoSFX
        Wait 1.02 seconds
        Obj_PlaySound bitchslap2 vol = 150 pitch = 97
        Wait 1.02 seconds
        BlendPeriodOut 0
        FireEvent type = finished_credit_anim
      endif
      @PlayAnim Anim = Idle_VallelyThrow speed = 1.5
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyWait
      WaitAnimFinished
      PlayAnim Anim = Idle_VallelyCatch speed = 1.3
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = Ped_M_ShakeFist
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = ElbowSmash_Idle
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = Idle_MullenCasper
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = Idle_Eddie
      WaitAnimFinished
      PlayAnim Anim = Idle_Eddie
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = HalfCabImpossible
      WaitAnimFinished
      PlayAnim Anim = HalfCabImpossible
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = _360FlipNosemanual
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = Idle_MuskaJive
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = Truckstand_Init
      WaitAnimFinished
      PlayAnim Anim = Truckstand_Flip
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = Pogo_Bounce
      WaitAnimFinished
      PlayAnim Anim = Pogo_StandOnBoard
      WaitAnimFinished
      PlayAnim Anim = Pogo_Bounce
      WaitAnimFinished
      PlayAnim Anim = Pogo_Bounce
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = HulaHoopGrind_Idle
      WaitAnimFinished
      PlayAnim Anim = HulaHoopGrind_Idle
      WaitAnimFinished
      PlayAnim Anim = HulaHoopGrind_Idle
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = Pogo_Bounce
      WaitAnimFinished
      PlayAnim Anim = Pogo_Bounce
      WaitAnimFinished
      PlayAnim Anim = Pogo_Bounce
      WaitAnimFinished
      PlayAnim Anim = Pogo_Kickfoot
      WaitAnimFinished
      PlayAnim Anim = Pogo_Out
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
      @PlayAnim Anim = DanceParty_Idle
      WaitAnimFinished
      PlayAnim Anim = DanceParty_Idle
      WaitAnimFinished
      BlendPeriodOut 0
      FireEvent type = finished_credit_anim
     ) default
      random( @PlayAnim Anim = StandIdleA
      @PlayAnim Anim = StandIdleB
      @PlayAnim Anim = StandIdleC
      @PlayAnim Anim = Idle_CampbellTossBoard
      @PlayAnim Anim = Idle_KostenSpin
      @PlayAnim Anim = Idle_HawkFromStandIdle
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      WaitAnimFinished
      PlayAnim Anim = Idle_HawkDropBoard
      WaitAnimFinished
      PlayAnim Anim = Idle_HawkGetBoard
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      WaitAnimFinished
      PlayAnim Anim = Idle_HawkToStandIdle
      WaitAnimFinished
      PlayAnim Anim = StandIdleA
      @PlayAnim Anim = Idle_HawkFromStandIdle
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      WaitAnimFinished
      PlayAnim Anim = Idle_Hawk
      WaitAnimFinished
      PlayAnim Anim = Idle_HawkToStandIdle
      WaitAnimFinished
      PlayAnim Anim = StandIdleC
       ) stream_freq = randomrange(0, 10)
    endswitch
    GetTags
    if ( <stopskateshopstreams> = 0 )
      if ( <stream_freq> = 1 )
        if ( <stream_repetition> > 2 )
          StopStream
          PlaySkaterStream type = "SSIntro"
          stream_repetition = 0
        endif
      endif
    else
    endif
    WaitAnimFinished
  repeat
endscript
script PlayThrowBoardSound
  if not GotParam NoSFX
    Wait 1.22 second
    PlaySound BoardThrowDown vol = 300
  endif
endscript
script TurnOnSSGuitar
  DestroyAllSpecialItems
  TurnOnSpecialItem SpecialItem_details = guitar_skateshop_details
endscript
script Play_HawkIdleSet
  PlayAnim Anim = Idle_HawkFromStandIdle
  WaitAnimFinished
  PlayAnim Anim = Idle_Hawk
  WaitAnimFinished
  PlayAnim Anim = Idle_HawkDropBoard
  WaitAnimFinished
  PlayAnim Anim = Idle_HawkGetBoard
  WaitAnimFinished
  PlayAnim Anim = Idle_Hawk
  WaitAnimFinished
  PlayAnim Anim = Idle_Hawk
  WaitAnimFinished
  PlayAnim Anim = Idle_HawkToStandIdle
  WaitAnimFinished
  PlayAnim Anim = StandIdleA
endscript
script BlinkEyes
  begin
    Wait randomrange(3, 7) seconds
    Obj_ReplaceTexture src = "cs_nh_eyelid_open.png" dest = "textures/scuffs/cs_nh_eyelid_wht"
    Wait 3 frames
    Obj_ReplaceTexture src = "cs_nh_eyelid_open.png" dest = "textures/scuffs/cs_nh_eyelid_open"
  repeat
endscript
script skateshop_rotate_skater_left
  if InSplitScreenGame
    GetCurrentSkaterProfileIndex
     <skater> = <currentSkaterProfileIndex>
  else
     <skater> = 0
  endif
  KillSpawnedScript name = skateshop_rotate_skater
  SpawnScript skateshop_rotate_skater params = { angle = -3 button = L1 }
endscript
script skateshop_rotate_skater_right
  if InSplitScreenGame
    GetCurrentSkaterProfileIndex
     <skater> = <currentSkaterProfileIndex>
  else
     <skater> = 0
  endif
  KillSpawnedScript name = skateshop_rotate_skater
  SpawnScript skateshop_rotate_skater params = { angle = 3 button = R1 }
endscript
script skateshop_rotate_skater
  begin
    if ControllerPressed <button>
      skater:Rotate Y = <angle>
    else
      break
    endif
    Wait 1 frame
  repeat
endscript
script skateshop_not_yet
  launch_main_menu
endscript
script make_new_skateshop_menu
  SetScreenElementProps { id = root_window
    replace_handlers
    event_handlers = [
      { pad_start main_menu_start_pressed }
    ]
  }
  make_new_menu <...>
endscript
script main_menu_start_pressed
endscript
script skateshop_transition menu_anim = animate_out
  RunScriptOnScreenElement id = current_menu_anchor <menu_anim> callback = skateshop_transition2 callback_params = <...>
endscript
script skateshop_transition2
  if GotParam cam_anim
    Printf "got a cam_anim"
    PlaySkaterCamAnim skater = 0 name = <cam_anim>
  endif
  if GotParam came_from_main_menu
     <new_menu_script> came_from_main_menu <new_menu_params>
  else
     <new_menu_script> <new_menu_params>
  endif
endscript
script launch_main_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_ss_menu_textures_from_vram
  remove_pause_menu_textures_from_vram
  create_main_menu
endscript
script start_internet_game
  memcard_menus_cleanup
  add_main_menu_textures_to_vram
  InitPrefsBeenox
  SetNetworkMode INTERNET_MODE
  KillSkaterCamAnim all
  PlaySkaterCamAnim name = SS_MenuCam play_hold
  MakeSkaterGoto SkateshopAI params = { NoSFX }
  SetMemThreadSafe off
  KillSpawnedScript name = Skateshop_Slideshow
  SpawnScript attract_mode_timer
  SpawnSecondControllerCheck
  Wait 5 gameframe
  kill_start_key_binding
  select_xbox_multiplayer { change_gamemode = change_gamemode_net }
endscript
script create_main_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  add_main_menu_textures_to_vram
  KillSkaterCamAnim all
  PlaySkaterCamAnim name = SS_MenuCam play_hold
  MakeSkaterGoto SkateshopAI params = { NoSFX }
  SetMemThreadSafe off
  SetMenuPadMappings [ active
    use_as_first
  ]
  make_new_skateshop_menu {
    pos = (215, 89)
    internal_just = [ center center ]
    menu_id = main_menu
    vmenu_id = main_vmenu
    menu_title = ""
    helper_text = { helper_text_elements = [ { text = "\b7/\b4 = Select" }
        { text = "\m0 = Accept" }
      ]
    }
  }
  // Tiny yellow bar at top
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = title_logo_bar
    texture = stats_notch
    pos = (317, 103)
    rgba = [ 117 112 9 32 ]
    scale = (14, 0.35)
    just = [ center top ]
  }
  // Logo
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = THPS4
    pos = (325, 88)
    scale = (1.4, 1)
    rgba = [ 128 128 128 108 ]
    z_priority = 2
  }
  // Options header
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = options_bg
    draw_behind_parent
    pos = (330, 85)
    scale = (1.17, 1.1)
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 0
  }
  // Tiny blue bar at bottom
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_blue_bar
    texture = stats_notch
    pos = (324, 370)
    rgba = [ 42 48 77 50 ]
    scale = (14, 0.2)
    just = [ center top ]
  }
  // Top of overlay
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_box_top
    texture = level_top_piece
    pos = (326, 115)
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
  }
  // Low-opacity overlay rows
  begin
    GetStackedScreenElementPos Y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
    }
  repeat 14
  GetStackedScreenElementPos Y id = <id>
  // Bottom of overlay
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (0.96, 1)
    just = [ left top ]
  }
  GetStackedScreenElementPos X id = main_menu_box_top offset = (-20, 0)
  // Right of overlay
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    scale = (0.8, 1.06)
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
  }
  create_icon texture = PA_model pos = (178, 85)
  // Idk?
  CreateScreenElement {
    type = TextElement
    parent = current_menu
    font = small
    text = ""
    not_focusable
  }
  main_menu_add_item { text = 'Career Mode'
    pad_choose_script = main_menu_exit
    pad_choose_params = { new_menu_script = create_career_options_menu
      change_gamemode = change_gamemode_career
    }
    focus_params = { attract_timer }
    mark_first_input
  }
  if IsTrue Demo_Build
    main_menu_add_item { text = 'Single Session'
      pad_choose_script = main_menu_exit
      pad_choose_params = { new_menu_script = launch_select_skater_menu
        change_gamemode = change_gamemode_singlesession
      }
      not_focusable = not_focusable
      mark_first_input
    }
    main_menu_add_item { text = 'Free Skate'
      pad_choose_script = main_menu_exit
      pad_choose_params = { new_menu_script = launch_select_skater_menu
        change_gamemode = change_gamemode_freeskate
      }
      not_focusable = not_focusable
      mark_first_input
    }
  else
    main_menu_add_item { text = 'Single Session'
      pad_choose_script = main_menu_exit
      pad_choose_params = { new_menu_script = launch_select_skater_menu
        change_gamemode = change_gamemode_singlesession
      }
      focus_params = { attract_timer }
      mark_first_input
    }
    main_menu_add_item { text = 'Free Skate'
      pad_choose_script = main_menu_exit
      pad_choose_params = { new_menu_script = launch_select_skater_menu
        change_gamemode = change_gamemode_freeskate
      }
      focus_params = { attract_timer }
      mark_first_input
    }
  endif
  main_menu_add_item { text = '2 Player'
    id = main_menu_2_player_option
    pad_choose_script = main_menu_exit
    pad_choose_params = { new_menu_script = launch_select_skater_menu
      change_gamemode = change_gamemode_freeskate_2p
    }
    mark_first_input
    focus_params = { attract_timer }
  }
  if OnXbox
    if IsTrue Demo_Build
      main_menu_add_item { text = 'System Link Play'
        not_focusable = not_focusable
        id = mm_multi_play
        pad_choose_script = main_menu_exit
        pad_choose_params = { new_menu_script = select_xbox_multiplayer }
        mark_first_input
      }
    else
      if IsDemo
        main_menu_add_item { text = 'Network Play'
          not_focusable = not_focusable
          id = mm_multi_play
          pad_choose_script = main_menu_exit
          pad_choose_params = { new_menu_script = select_xbox_multiplayer
            change_gamemode = change_gamemode_net
          }
          mark_first_input
          focus_params = { attract_timer }
        }
      else
        main_menu_add_item { text = 'Network Play'
          id = mm_multi_play
          pad_choose_script = main_menu_exit
          pad_choose_params = { new_menu_script = start_internet_game }
          mark_first_input
          focus_params = { attract_timer }
        }
      endif
    endif
  else
    if IsPS2
      main_menu_add_item { text = 'Network Play'
        pad_choose_script = main_menu_exit
        pad_choose_params = { new_menu_script = network_selected
          change_gamemode = change_gamemode_net
        }
        mark_first_input
        focus_params = { attract_timer }
      }
    endif
  endif
  if IsDemo
    main_menu_add_item { text = 'Create-A-Skater'
      not_focusable = not_focusable
      pad_choose_script = main_menu_exit
      pad_choose_params = { new_menu_script = create_pre_cas_menu }
      mark_first_input
      focus_params = { attract_timer }
    }
  else
    main_menu_add_item { text = 'Create-A-Skater'
      pad_choose_script = main_menu_exit
      pad_choose_params = { new_menu_script = create_pre_cas_menu }
      mark_first_input
      focus_params = { attract_timer }
    }
  endif
  if IsTrue Demo_Build
    main_menu_add_item { text = 'Build Park'
      pad_choose_script = launch_park_editor
      not_focusable = not_focusable
      mark_first_input
    }
  else
    if IsDemo
      main_menu_add_item { text = 'Build Park'
        not_focusable = not_focusable
        pad_choose_script = launch_park_editor
        mark_first_input
        focus_params = { attract_timer }
      }
    else
      main_menu_add_item { text = 'Build Park'
        pad_choose_script = launch_park_editor
        mark_first_input
        focus_params = { attract_timer }
      }
    endif
  endif
  main_menu_add_item { text = 'Options'
    pad_choose_script = main_menu_exit
    pad_choose_params = { new_menu_script = create_setup_options_menu }
    mark_first_input
    focus_params = { attract_timer }
  }
  main_menu_add_item { text = better4_options_text
    pad_choose_script = better4_options_menu
    pad_choose_params = { close_script = create_main_menu }
  }
  main_menu_add_item { text = 'Quit'
    id = mm_quit
    pad_choose_script = main_menu_quit
    mark_first_input
    focus_params = { attract_timer }
  }
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu_anchor
    id = attract_container
    event_handlers = [ { pad_back reset_attract_mode_timer }
      { pad_left reset_attract_mode_timer }
      { pad_right reset_attract_mode_timer }
    ]
  }
  better4_main_menu_watermark
  RunScriptOnScreenElement id = main_menu menu_onscreen
  FireEvent type = focus target = attract_container
  KillSpawnedScript name = Skateshop_Slideshow
  SpawnScript Skateshop_Slideshow
  SpawnScript attract_mode_timer
  SpawnSecondControllerCheck
  Wait 5 gameframe
  kill_start_key_binding
endscript
script main_menu_add_item { parent = current_menu
    font = small
    highlight_bar_scale = (0.92, 1.3)
    highlight_bar_pos = (97, -7)
    text_just = [ center center ]
    focus_script = main_menu_focus
    unfocus_script = main_menu_unfocus
    text_pos = (95, -5)
    dims = (200, 20)
    pad_choose_script = nullscript
  }
  if GotParam not_focusable
    CreateScreenElement {
      type = ContainerElement
      parent = <parent>
      id = <id>
      dims = <dims>
      event_handlers = [ { focus <focus_script> params = <focus_params> }
        { unfocus <unfocus_script> params = <unfocus_params> }
        { pad_choose <pad_choose_script> params = <pad_choose_params> }
        { pad_start <pad_choose_script> params = <pad_choose_params> }
      ]
      replace_handlers
      not_focusable
    }
  else
    CreateScreenElement {
      type = ContainerElement
      parent = <parent>
      id = <id>
      dims = <dims>
      event_handlers = [ { focus <focus_script> params = <focus_params> }
        { unfocus <unfocus_script> params = <unfocus_params> }
      ]
      replace_handlers
    }
  endif
   <anchor_id> = <id>
  if not GotParam no_sound
    SetScreenElementProps id = <anchor_id> event_handlers = [ { pad_choose generic_menu_pad_choose_sound }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_start generic_menu_pad_choose_sound }
      { pad_start <pad_choose_script> params = <pad_choose_params> }
    ]
  else
    SetScreenElementProps id = <anchor_id> event_handlers = [ { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_start <pad_choose_script> params = <pad_choose_params> }
    ]
  endif
  if GotParam mark_first_input
    SetScreenElementProps {
      id = <anchor_id>
      event_handlers = [ { pad_choose mark_first_input_received }
        { pad_choose generic_menu_pad_choose_sound }
        { pad_choose <pad_choose_script> params = <pad_choose_params> }
        { pad_start mark_first_input_received }
        { pad_start generic_menu_pad_choose_sound }
        { pad_start <pad_choose_script> params = <pad_choose_params> }
      ]
      replace_handlers
    }
  endif
  if GotParam not_focusable
    <text_rgba> = [ 60 60 60 75 ]
    CreateScreenElement {
      type = TextElement
      parent = <anchor_id>
      font = <font>
      text = <text>
      scale = <scale>
      pos = <text_pos>
      just = <text_just>
      rgba = <text_rgba>
      not_focusable
    }
  else
    <text_rgba> = [ 88 105 112 128 ]
    CreateScreenElement {
      type = TextElement
      parent = <anchor_id>
      id = <text_id>
      font = <font>
      text = <text>
      scale = <scale>
      pos = <text_pos>
      just = <text_just>
      rgba = <text_rgba>
    }
  endif
  if GotParam max_width
    truncate_string id = <id> max_width = <max_width>
  endif
  CreateScreenElement {
    type = SpriteElement
    parent = <anchor_id>
    texture = highlight_bar
    pos = <highlight_bar_pos>
    scale = <highlight_bar_scale>
    just = [ center center ]
    rgba = [ 128 128 128 0 ]
    z_priority = 3
  }
endscript
script main_menu_focus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
  if ObjectExists id = park_menu_up_arrow
    generic_menu_update_arrows {
      up_arrow_id = park_menu_up_arrow
      down_arrow_id = park_menu_down_arrow
    }
  endif
  if GotParam attract_timer
    reset_attract_mode_timer
  endif
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = [ 128 128 128 50 ]
  }
endscript
script main_menu_unfocus
  GetTags
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = [ 128 128 128 0 ]
  }
endscript
script main_menu_exit
  KillSpawnedScript name = Skateshop_Slideshow
  KillSpawnedScript name = attract_mode_timer
  StopSecondControllerCheck
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  remove_main_menu_textures_from_vram
   <new_menu_script> <...>
endscript
script main_menu_quit
  menu_confirm_quit { yes_script = ExitGameScript
    title = "Quit Game?"
    back_script = NoExitGameScript
    no_script = NoExitGameScript
  }
endscript
script ExitGameScript
  if IsDemo
    DisplayEndScreen "DemoScreen1"
  endif
  QuitGame
endscript
script NoExitGameScript
  dialog_box_exit
  create_main_menu
endscript
script add_main_menu_textures_to_vram
  AddTextureToVram "level_top_piece"
  AddTextureToVram "level_repeat_mid"
  AddTextureToVram "level_bottom_piece"
  AddTextureToVram "goal_right"
  AddTextureToVram "PA_Model"
  AddTextureToVram "stats_notch"
  AddTextureToVram "THPS4"
endscript
script remove_main_menu_textures_from_vram
  RemoveTextureFromVram "level_top_piece"
  RemoveTextureFromVram "level_repeat_mid"
  RemoveTextureFromVram "level_bottom_piece"
  RemoveTextureFromVram "goal_right"
  RemoveTextureFromVram "PA_Model"
  RemoveTextureFromVram "stats_notch"
  RemoveTextureFromVram "THPS4"
endscript
current_attract_movie = 0
script attract_mode_timer
  max_time = 100
  begin
    Wait <max_time> seconds
    movie_file = ( attract_mode_movies [ current_attract_movie ] )
    if not IsNGC
      GetArraySize attract_mode_movies
      if not ( <array_size> > ( current_attract_movie + 1 ) )
        Change current_attract_movie = 0
      else
        Change current_attract_movie = ( current_attract_movie + 1 )
      endif
    endif
    if CD
      UnloadPreFile "skaterparts.pre"
      MemPushContext 0
      PlayMovie <movie_file>
      MemPopContext
      DumpHeaps
      LoadPreFile "skaterparts.pre"
    endif
  repeat
endscript
script reset_attract_mode_timer
  Printf "reset_attract_mode_timer"
  KillSpawnedScript name = attract_mode_timer
  SpawnScript attract_mode_timer
endscript
script Skateshop_Slideshow
  begin
    Wait 10 seconds
    KillSkaterCamAnim all
    PlaySkaterCamAnim randomnorepeat( @name = SS_MenuCam01 @name = SS_MenuCam02 @name = SS_MenuCam03 @name = SS_MenuCam04 @name = SS_MenuCam05 @name = SS_MenuCam  ) play_hold
  repeat
endscript
script launch_setup_options_menu
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_setup_options_menu
endscript
script create_setup_options_menu
  dialog_box_exit
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  pulse_blur
  make_new_skateshop_menu {
    menu_id = ss_setup_options_menu
    vmenu_id = ss_setup_options_vmenu
    menu_title = ''
    helper_text = generic_helper_text
    pos = (232, 20)
  }
  delta_pos = (100, -60)
  scale = (1.1, 1)
  if IsPS2
    middle_repeat = 18
    box_right_scale = (0.8, 1.31)
  else
    if IsXBOX
      middle_repeat = 15
      box_right_scale = (0.8, 1.12)
    else
      middle_repeat = 14
      box_right_scale = (0.8, 1.06)
    endif
  endif
  set_sub_bg pos = (184, 31) scale = (1.27, 1.1) just = [ left top ]
  create_icon id = setup_options_icon texture = PA_options pos = (171, 31)
  GetStackedScreenElementPos X id = setup_options_icon offset = (0, 4)
  CreateScreenElement {
    type = TextElement
    parent = current_menu_anchor
    font = testtitle
    text = 'OPTIONS'
    pos = <pos>
    scale = 1.4
    just = [ left top ]
    rgba = [ 128 128 128 98 ]
  }
  GetStackedScreenElementPos X id = current_menu_anchor
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_box_top
    texture = level_top_piece
    pos = ( (230, 100) + <delta_pos> )
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
    z_priority = 0
  }
  begin
    GetStackedScreenElementPos Y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
      z_priority = 0
    }
  repeat <middle_repeat>
  GetStackedScreenElementPos Y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (1.06, 1)
    just = [ left top ]
    z_priority = 0
  }
  GetStackedScreenElementPos X id = main_menu_box_top offset = (-20, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    scale = <box_right_scale>
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 0
  }
  kill_start_key_binding
  SetScreenElementProps { id = ss_setup_options_vmenu event_handlers = [
      { pad_back skateshop_transition params = { new_menu_script = launch_main_menu } }
    ]
  }
  main_menu_add_item { text = ""
    pad_choose_script = nullscript
    not_focusable = not_focusable
  }
  main_menu_add_item { text = 'Save Game'
    id = options_save
    pad_choose_script = options_menu_exit
    pad_choose_params = { new_menu_script = launch_options_menu_save_game_sequence }
    highlight_bar_scale = (1.015, 1.3)
  }
  main_menu_add_item { text = 'Load Game'
    id = options_load
    pad_choose_script = options_menu_exit
    pad_choose_params = { new_menu_script = launch_options_menu_load_game_sequence }
    highlight_bar_scale = (1.015, 1.3)
  }
  main_menu_add_item { text = 'Control Setup'
    id = options_controller
    pad_choose_script = options_menu_exit
    pad_choose_params = { new_menu_script = create_controller_config_menu }
    highlight_bar_scale = (1.015, 1.3)
  }
  if IsPS2
    main_menu_add_item { text = 'Network Options'
      id = options_network
      pad_choose_script = skateshop_transition
      pad_choose_params = { new_menu_script = create_network_options_menu }
      highlight_bar_scale = (1.015, 1.3)
    }
  endif
  main_menu_add_item { text = 'Sound Options'
    pad_choose_script = skateshop_transition
    pad_choose_params = { new_menu_script = create_sound_options_menu }
    highlight_bar_scale = (1.015, 1.3)
  }
  if not IsDemo
    main_menu_add_item { text = 'Taunt Options'
      pad_choose_script = skateshop_transition
      pad_choose_params = { new_menu_script = create_taunt_options_menu }
      highlight_bar_scale = (1.015, 1.3)
    }
  endif
  if GetGlobalFlag flag = BLOOD_OFF
    blood_text = "Blood: Off"
  else
    blood_text = "Blood: On"
  endif
  main_menu_add_item { text = <blood_text>
    pad_choose_script = change_blood_value
    text_id = blood_text
    highlight_bar_scale = (1.015, 1.3)
  }
  if not IsTrue Demo_Build
    main_menu_add_item { text = 'High Scores'
      id = options_records
      pad_choose_script = options_menu_exit
      pad_choose_params = { new_menu_script = high_scores_menu_create from_options level = 1 level_name = "College" }
      highlight_bar_scale = (1.015, 1.3)
    }
    if IsDemo
      main_menu_add_item { text = 'Cheat Codes'
        id = options_cheats
        not_focusable = not_focusable
        highlight_bar_scale = (1.015, 1.3)
        pad_choose_script = options_menu_exit
        pad_choose_params = { new_menu_script = create_onscreen_keyboard
          text = ""
          keyboard_title = "ENTER CHEAT"
          min_length = 1
          max_length = 15
          keyboard_done_script = check_cheat_from_keyboard
          keyboard_cancel_script = check_cheat_from_keyboard
          keyboard_cancel_params = { cancel }
          allow_cancel }
      }
    else
      main_menu_add_item { text = 'Cheat Codes'
        id = options_cheats
        highlight_bar_scale = (1.015, 1.3)
        pad_choose_script = options_menu_exit
        pad_choose_params = { new_menu_script = create_onscreen_keyboard
          text = ""
          keyboard_title = "ENTER CHEAT"
          min_length = 1
          max_length = 15
          keyboard_done_script = check_cheat_from_keyboard
          keyboard_cancel_script = check_cheat_from_keyboard
          keyboard_cancel_params = { cancel }
          allow_cancel }
      }
    endif
    main_menu_add_item { text = 'Movies'
      id = options_movies
      pad_choose_script = options_menu_exit
      pad_choose_params = { new_menu_script = create_movies_menu }
      highlight_bar_scale = (1.015, 1.3)
    }
    if IsPS2
      main_menu_add_item { text = 'Shaun Murray Demo'
        id = options_demo
        pad_choose_script = confirm_demo
        pad_choose_params = { new_menu_script = nullscript }
        highlight_bar_scale = (1.015, 1.3)
      }
    endif
    main_menu_add_item { text = 'Credits'
      id = options_credits
      pad_choose_script = options_menu_exit
      pad_choose_params = { new_menu_script = create_credits }
      highlight_bar_scale = (1.015, 1.3)
    }
    main_menu_add_item { text = 'Done'
      id = options_done
      pad_choose_script = skateshop_transition
      pad_choose_params = { new_menu_script = launch_main_menu }
      highlight_bar_scale = (1.015, 1.3)
    }
  endif
  KillSkaterCamAnim all
  PlaySkaterCamAnim name = SS_menucam_options play_hold
  RunScriptOnScreenElement id = ss_setup_options_menu animate_in
endscript
script change_blood_value
  if GetGlobalFlag flag = BLOOD_OFF
    SetScreenElementProps id = blood_text text = "Blood: On"
    UnSetGlobalFlag flag = BLOOD_OFF
  else
    SetScreenElementProps id = blood_text text = "Blood: Off"
    SetGlobalFlag flag = BLOOD_OFF
  endif
endscript
script confirm_demo
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  create_dialog_box { title = "Warning!"
    text = "If you play the demo now your unsaved progress will be lost. Exit to demo?"
    pos = (320, 185)
    just = [ center center ]
    text_rgba = [ 88 105 112 128 ]
    text_scale = 1
    pad_back_script = create_setup_options_menu
    buttons = [ { font = small text = "Yes" pad_choose_script = wakeboard_demo }
      { font = small text = "No" pad_choose_script = create_setup_options_menu }
    ]
  }
endscript
script start_motox_demo
  level_select_change_level level = load_motox
endscript
script options_menu_exit
  dialog_box_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  remove_ss_menu_textures_from_vram
   <new_menu_script> <...>
endscript
script check_cheat_from_keyboard
  GetTextElementString id = keyboard_current_string
  if not GotParam cancel
    TryCheatString string = <string>
  endif
  destroy_onscreen_keyboard
  add_pause_menu_textures_to_vram
  create_setup_options_menu
endscript
script launch_career_options_menu
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_career_options_menu
endscript
script create_career_options_menu
  dialog_box_exit
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  if GotParam change_gamemode
     <change_gamemode>
  endif
  make_new_skateshop_menu {
    menu_id = ss_career_options_menu
    vmenu_id = ss_career_options_vmenu
    menu_title = 'CAREER OPTIONS'
    helper_text = generic_helper_text
    pos = (223, 109)
  }
  kill_start_key_binding
  set_sub_bg
  create_icon texture = PA_model
  SetScreenElementProps { id = ss_career_options_vmenu event_handlers = [
      { pad_back skateshop_transition params = { new_menu_script = launch_main_menu } }
    ]
  }
  main_menu_add_item text = "" not_focusable = not_focusable
  if GetGlobalFlag flag = CAREER_STARTED
    main_menu_add_item { text = 'Continue Career'
      pad_choose_script = career_options_menu_exit
      pad_choose_params = { new_menu_script = launch_select_skater_menu }
    }
    main_menu_add_item { text = 'New Career'
      pad_choose_script = career_options_menu_exit
      pad_choose_params = { new_menu_script = career_overwrite_warning title = 'Create New' }
    }
  else
    main_menu_add_item { text = 'Continue Career'
      pad_choose_script = career_options_menu_exit
      pad_choose_params = { new_menu_script = launch_select_skater_menu }
      rgba = [ 60 60 60 75 ]
      not_focusable = not_focusable
    }
    main_menu_add_item { text = 'New Career'
      pad_choose_script = career_options_menu_exit
      pad_choose_params = { new_menu_script = new_career_launch_select_skater_menu }
    }
  endif
  main_menu_add_item { text = 'Load Career'
    pad_choose_script = career_options_menu_exit
    pad_choose_params = { new_menu_script = launch_options_menu_load_game_sequence from_career }
  }
  draw_menu_box delta_pos = (92, 30) middle_repeat = 4 box_right_scale = (0.8, 0.43)
  KillSkaterCamAnim all
  KillSpawnedScript name = Skateshop_Slideshow
  PlaySkaterCamAnim name = SS_MenuCam play_hold
  SpawnScript Skateshop_Slideshow
  RunScriptOnScreenElement id = ss_career_options_menu animate_in
endscript
script career_options_menu_exit
  KillSpawnedScript name = Skateshop_Slideshow
  dialog_box_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  remove_ss_menu_textures_from_vram
   <new_menu_script> <...>
endscript
script new_career_launch_select_skater_menu
  GoalManager_ResetCareer
  cash_icons_reset
  launch_select_skater_menu
endscript
script career_overwrite_warning title = 'Overwrite'
  create_snazzy_dialog_box {
    title = <title>
    text = 'Warning !\nAny unsaved changes to your current career will be lost.\nContinue ?'
    text_dims = (400, 0)
    pad_back_script = create_career_options_menu
    buttons = [ { font = small text = 'No' pad_choose_script = create_career_options_menu }
      { font = small text = 'Yes'
        pad_choose_script = pre_cas_menu_exit
        pad_choose_params =
        {
          new_menu_script = reset_career
        }
      }
    ]
  }
endscript
script reset_career
  CareerReset
  GoalManager_ResetCareer
  cash_icons_reset
  index = 0
  begin
    UnSetGlobalFlag flag = <index>
     <index> = ( <index> + 1 )
  repeat 512
   <level_flag> = 128
  begin
     <level> = 1
    begin
      UnSetFlag flag = <level_flag> level = <level>
       <level> = ( <level> + 1 )
    repeat 9
     <level_flag> = ( <level_flag> + 1 )
  repeat 8
  SetGlobalFlag flag = LEVEL_UNLOCKED_SCH
  if not IsDemo
    SetGlobalFlag flag = LEVEL_UNLOCKED_CPK
  endif
  reset_secret_skaters
  unlock_initial_boards
  ResetAllToDefaultProfile
  launch_select_skater_menu
endscript
script reset_secret_skaters
  SetSkaterProfileInfoByName name = eddie params = { is_hidden = 1 }
  SetSkaterProfileInfoByName name = JANGO params = { is_hidden = 1 }
  SetSkaterProfileInfoByName name = Vallely params = { is_hidden = 1 }
  SetSkaterProfileInfoByName name = JENNA params = { is_hidden = 1 }
endscript
script launch_pre_cas_menu
  RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_setup_options_menu
endscript
script pre_cas_menu_exit
  KillSpawnedScript name = Skateshop_Slideshow
  dialog_box_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  remove_ss_menu_textures_from_vram
   <new_menu_script> <...>
endscript
script create_pre_cas_menu
  dialog_box_exit
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  make_new_skateshop_menu menu_id = ss_pre_cas_menu vmenu_id = ss_pre_cas_vmenu menu_title = 'CREATE OPTIONS' helper_text = generic_helper_text
  set_sub_bg pos = (332, 115)
  create_icon texture = PA_create pos = (180, 115)
  kill_start_key_binding
  SetScreenElementProps { id = ss_pre_cas_vmenu event_handlers = [
      { pad_back skateshop_transition params = { new_menu_script = launch_main_menu } }
    ]
  }
  main_menu_add_item text = "" not_focusable = not_focusable
  main_menu_add_item { text = 'Create New'
    pad_choose_script = pre_cas_menu_exit
    pad_choose_params = { new_menu_script = cas_overwrite_warning title = 'Create New' }
  }
  main_menu_add_item { text = 'Edit Current'
    pad_choose_script = pre_cas_menu_exit
    pad_choose_params = { new_menu_script = skateshop_create_cas_menu came_from_main_menu }
  }
  main_menu_add_item { text = 'Load Skater'
    pad_choose_script = pre_cas_menu_exit
    pad_choose_params = { new_menu_script = launch_load_cas_sequence }
  }
  main_menu_add_item { text = 'Save Skater'
    pad_choose_script = pre_cas_menu_exit
    pad_choose_params = { new_menu_script = launch_save_cas_sequence }
  }
  draw_menu_box
  KillSkaterCamAnim all
  PlaySkaterCamAnim name = SS_MenuCam play_hold
  SpawnScript Skateshop_Slideshow
  RunScriptOnScreenElement id = ss_pre_cas_menu animate_in
endscript
script cas_overwrite_warning title = 'Overwrite'
  create_snazzy_dialog_box {
    title = <title>
    text = 'Warning !\nAny unsaved changes to your current create-a-skater will be lost.\nContinue ?'
    text_dims = (400, 0)
    pad_back_script = create_pre_cas_menu
    buttons = [
      { font = small text = 'No' pad_choose_script = create_pre_cas_menu }
      {
        font = small text = 'Yes'
        pad_choose_script = pre_cas_menu_exit
        pad_choose_params =
        {
          new_menu_script = cas_reset_skater_and_goto_menu
        }
      }
    ]
  }
endscript
script cas_reset_skater_and_goto_menu
  ResetToDefaultProfile name = custom
  RememberTemporaryAppearance appearance_structure = appearance_custom_skater_male name = old_male_profile
  RememberTemporaryAppearance appearance_structure = appearance_custom_skater_female name = old_female_profile
  if not IsDemo
    load_pro_skater name = custom
  endif
  cas_catchup_to_pro_stats
  cas_catchup_trickslots
  skateshop_create_cas_menu came_from_main_menu
endscript
script career_post_load
  GetCurrentSkaterProfileIndex
  if not ( <currentSkaterProfileIndex> = 0 )
    script_assert "career_post_load only works on first skater"
  endif
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if ( <is_pro> = 1 )
     <pro_name> = <name>
    if IsDemo
      SelectCurrentSkater name = Hawk
    else
      SelectCurrentSkater name = custom
    endif
  endif
  cas_catchup_to_pro_stats_after_load
  cas_catchup_trickslots
  if ( <is_pro> = 1 )
    SelectCurrentSkater name = <pro_name>
  endif
  if not IsXBOX
    if GetGlobalFlag flag = SCREEN_MODE_STANDARD
      screen_setup_standard
    else
      if GetGlobalFlag flag = SCREEN_MODE_WIDE
        screen_setup_widescreen
      endif
    endif
  endif
  initialize_cash_icons
endscript
script cas_post_load
  cas_catchup_to_pro_stats_after_load
  cas_catchup_trickslots
endscript
script jump_to_edit_skater
  dialog_box_exit
  skateshop_create_cas_menu came_from_main_menu
endscript
script cas_catchup_to_pro_stats_after_load
  if not IsDemo
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    if not ( <name> = custom )
      script_assert "This function only works on custom skaters."
    endif
    get_total_stat_points_by_name skater_name = Hawk
     <pro_points> = <total_points>
    get_total_stat_points_for_current_profile
     <custom_points> = <total_points>
    if ( <custom_points> > <pro_points> )
      if ( <total_points> > <max_points> )
         <points_available> = ( <points_available> - ( <total_points> - <max_points> ) )
        SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { points_available = <points_available> }
      endif
      Printf "case 1"
    else
      get_total_stat_points_for_current_profile ignore_points_available
       <custom_points> = <total_points>
       <difference> = ( <pro_points> - <custom_points> )
      if ( <difference> < 0 )
         <difference> = 0
      endif
      SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { points_available = <difference> }
      Printf "case 2 %d %e" d = <pro_points> e = <custom_points>
    endif
  endif
endscript
script cas_catchup_trickslots
  if not IsDemo
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    if not ( <name> = custom )
      script_assert "This function only works on custom skaters."
    endif
    GetSkaterProfileInfoByName name = Hawk
     <total_num_specials> = <max_specials>
    GetSkaterProfileInfoByName name = custom
     <cas_current_num_specials> = <max_specials>
    GetArraySize master_skater_list
     <index> = 0
     <found_cas> = 0
     <found_hawk> = 0
    begin
      if ( ( ( master_skater_list [ <index> ] ).name ) = Hawk )
         <found_hawk> = 1
         <starting_num_specials> = ( ( master_skater_list [ <index> ] ).max_specials )
      else
        if ( ( ( master_skater_list [ <index> ] ).name ) = custom )
           <found_cas> = 1
           <cas_starting_num_specials> = ( ( master_skater_list [ <index> ] ).max_specials )
        endif
      endif
      if ( <found_hawk> = 1 )
        if ( <found_cas> = 1 )
          break
        endif
      endif
       <index> = ( <index> + 1 )
    repeat <array_size>
     <num_specials_awarded> = ( <total_num_specials> - <starting_num_specials> )
     <cas_desired_total> = <cas_starting_num_specials>
    if ( <num_specials_awarded> > 0 )
       <cas_desired_total> = ( <cas_desired_total> + <num_specials_awarded> )
    endif
    if ( <cas_desired_total> > 11 )
       <cas_desired_total> = 11
    endif
    if ( <cas_desired_total> < <cas_current_num_specials> )
       <index> = <cas_desired_total>
       <num_to_remove> = ( <cas_current_num_specials> - <cas_desired_total> )
      begin
        SetSpecialTrickInfo slot = <index> trick_name = unassigned key_combo = unassigned
         <index> = ( <index> + 1 )
      repeat <num_to_remove>
    endif
    SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { max_specials = <cas_desired_total> }
  endif
endscript
script cas_catchup_to_pro_stats
  GetCurrentSkaterProfileIndex
  if not ( <currentSkaterProfileIndex> = 0 )
    script_assert "This function only works on skater profile 0."
  endif
  get_total_stat_points_by_name skater_name = Hawk
   <pro_points> = <total_points>
  get_total_stat_points_by_name skater_name = custom ignore_points_available
   <custom_points> = <total_points>
   <difference> = ( <pro_points> - <custom_points> )
  if ( <difference> < 0 )
     <difference> = 0
  endif
  SetSkaterProfileInfoByName name = custom params = { points_available = <difference> }
endscript
script get_total_stat_points_by_name skater_name = Hawk
  GetArraySize stat_names
   <index> = 0
   <total_points> = 0
   <max_points> = 0
  begin
     <stat_field> = ( ( stat_names [ <index> ] ).name )
    GetStatValue skater = <skater_name> <stat_field>
     <total_points> = ( <total_points> + <stat_value> )
     <max_points> = ( <max_points> + 10 )
     <index> = ( <index> + 1 )
  repeat <array_size>
  GetSkaterProfileInfoByName name = <skater_name>
  if not GotParam ignore_points_available
     <total_points> = ( <total_points> + <points_available> )
    if ( <total_points> > <max_points> )
       <total_points> = <max_points>
    endif
  endif
  return total_points = <total_points> max_points = <max_points> points_available = <points_available>
endscript
script get_total_stat_points_for_current_profile
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if not ( <name> = custom )
    script_assert "This function only works on custom skaters."
  endif
  GetArraySize stat_names
   <index> = 0
   <total_points> = 0
   <max_points> = 0
  begin
     <stat_field> = ( ( stat_names [ <index> ] ).name )
    GetStatValue <stat_field>
     <total_points> = ( <total_points> + <stat_value> )
     <max_points> = ( <max_points> + 10 )
     <index> = ( <index> + 1 )
  repeat <array_size>
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if not GotParam ignore_points_available
     <total_points> = ( <total_points> + <points_available> )
    if ( <total_points> > <max_points> )
       <total_points> = <max_points>
    endif
  endif
  return total_points = <total_points> max_points = <max_points> points_available = <points_available>
endscript
script launch_ss_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
    Wait 1 frame
  endif
  remove_pause_menu_textures_from_vram
  add_ss_menu_textures_to_vram
  create_ss_menu <...>
endscript
script create_ss_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  KillSkaterCamAnim all
  PlaySkaterCamAnim name = SS_SkaterChoosing play_hold
  skater:BlendPeriodOut 0.0
  skater:Obj_MoveToNode name = TRG_SS_SkaterChoosing orient
  Kill name = SSO_Fence05
  Create name = SSO_Fence02
  if GotParam change_gamemode
     <change_gamemode>
  endif
  GetCurrentSkaterProfileIndex
  GetGameMode
  switch <GameMode>
  case career
     <menu_title> = 'CAREER'
  case freeskate
    if InSplitScreenGame
      MakeSkaterGoto SkateshopAI params = { BlendOK }
      if ( <currentSkaterProfileIndex> = 1 )
         <menu_title> = 'PLAYER TWO'
      else
         <menu_title> = 'PLAYER ONE'
      endif
    else
       <menu_title> = 'FREE SKATE'
    endif
  case net
     <menu_title> = 'NETWORK PLAY'
  case singlesession
     <menu_title> = 'SINGLE SESSION'
  default
     <menu_title> = 'SKATESHOP'
  endswitch
  if GameModeEquals is_net
    if IsXBOX
       <menu_title> = 'NETWORK PLAY'
    else
       <menu_title> = 'NETWORK PLAY'
    endif
  endif
  make_new_skateshop_menu {
    pos = (130, 79)
    internal_just = [ left center ]
    menu_id = ss_menu
    vmenu_id = ss_vmenu
    menu_title = <menu_title>
    helper_text = generic_helper_text
  }
  kill_start_key_binding
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = options_bg
    draw_behind_parent
    pos = (230, 85)
    scale = (1.17, 1.1)
    just = [ center top ]
    rgba = [ 128 128 128 128 ]
    z_priority = 0
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_blue_bar
    texture = stats_notch
    pos = (228, 289)
    rgba = [ 42 48 77 50 ]
    scale = (14, 0.2)
    just = [ center top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    id = main_menu_box_top
    texture = level_top_piece
    pos = (230, 115)
    rgba = [ 128 128 128 80 ]
    scale = (1, 1)
    just = [ center top ]
  }
  begin
    GetStackedScreenElementPos Y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = level_repeat_mid
      pos = <pos>
      scale = (1, 1)
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
    }
  repeat 9
  GetStackedScreenElementPos Y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = (0.96, 1)
    just = [ left top ]
  }
  GetStackedScreenElementPos X id = main_menu_box_top offset = (-20, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = current_menu_anchor
    texture = goal_right
    scale = (0.9, 0.75)
    rgba = [ 128 128 128 80 ]
    pos = (330, 115)
    just = [ left top ]
  }
  create_icon texture = PA_model pos = (80, 85)
  CreateScreenElement {
    type = TextElement
    parent = current_menu
    font = small
    text = ""
    not_focusable
  }
  SetScreenElementProps {
    id = ss_vmenu
    event_handlers = [ { pad_back ss_menu_exit params = { new_menu_script = launch_select_skater_menu } } ]
    replace_handlers
  }
  GetCurrentSkaterProfileIndex
  if InSplitScreenGame
    if ( <currentSkaterProfileIndex> = 1 )
      main_menu_add_item { text = 'Ready'
        id = ss_play_level
        pad_choose_script = ss_menu_exit
        pad_choose_params = { new_menu_script = launch_level_select_menu player_two }
      }
    else
      main_menu_add_item { text = 'Ready'
        id = ss_play_level
        pad_choose_script = ss_menu_exit
        pad_choose_params = { new_menu_script = player_1_ready }
      }
    endif
  else
    if GameModeEquals is_net
      main_menu_add_item { text = 'Ready'
        id = ss_play_level
        pad_choose_script = ss_menu_exit
        pad_choose_params = { new_menu_script = create_network_select_menu }
      }
    else
      main_menu_add_item { text = 'Play Level'
        id = ss_play_level
        pad_choose_script = ss_menu_exit
        pad_choose_params = { new_menu_script = launch_level_select_menu <...> }
      }
    endif
  endif
  if not IsTrue Demo_Build
    if not GameModeEquals is_net
      main_menu_add_item { text = 'Game Progress'
        id = ss_game_progress
        pad_choose_script = ss_menu_exit
        pad_choose_params = { new_menu_script = game_progress_menu_create }
      }
    endif
  endif
  if IsDemo
    main_menu_add_item { text = 'Clothes and Gear'
      id = ss_edit_skater
      not_focusable = not_focusable
      pad_choose_script = ss_menu_exit
      pad_choose_params = { new_menu_script = skateshop_create_cas_menu }
    }
  else
    main_menu_add_item { text = 'Clothes and Gear'
      id = ss_edit_skater
      pad_choose_script = ss_menu_exit
      pad_choose_params = { new_menu_script = skateshop_create_cas_menu }
    }
  endif
  if not GameModeEquals is_net
    main_menu_add_item { text = 'Edit Stats'
      pad_choose_script = ss_menu_exit
      pad_choose_params = { new_menu_script = create_stats_menu }
    }
  endif
  main_menu_add_item { text = 'Edit Tricks'
    pad_choose_script = ss_menu_exit
    pad_choose_params = { new_menu_script = create_edit_tricks_menu from_ss_menu }
  }
  if not IsTrue Demo_Build
    if not GameModeEquals is_net
      if IsDemo
        main_menu_add_item { text = 'Spend Cash'
          id = ss_buy_secrets
          not_focusable = not_focusable
          pad_choose_script = ss_menu_exit
          pad_choose_params = { new_menu_script = create_secrets_menu }
        }
      else
        main_menu_add_item { text = 'Spend Cash'
          id = ss_buy_secrets
          pad_choose_script = ss_menu_exit
          pad_choose_params = { new_menu_script = create_secrets_menu }
        }
      endif
    endif
  endif
  if not InSplitScreenGame
    if not GameModeEquals is_net
      main_menu_add_item { text = 'Practice'
        id = ss_main_menu
        pad_choose_script = ss_menu_exit
        pad_choose_params = { new_menu_script = start_practice_run }
      }
    endif
  endif
  if GameModeEquals is_net
    GetPreferenceString pref_type = network network_id
    main_menu_add_item { text = 'Player Name'
      id = ss_main_menu
      pad_choose_script = ss_menu_exit
      pad_choose_params = { new_menu_script = launch_onscreen_keyboard_from_ss_menu
        field = "network_id"
        text = <ui_string>
        title = "PLAYER NAME"
        min_length = 1
        max_length = 15
        highlight_bar_scale = (1.4, 1.3)
      }
    }
    main_menu_add_item text = <ui_string> font = dialog max_width = 235 id = network_option_player_name_string rgba = [ 80 80 80 128 ] scale = 1 not_focusable = not_focusable z_priority = 5
    CreateScreenElement {
      type = SpriteElement
      parent = current_menu_anchor
      texture = black
      rgba = [ 0 0 0 50 ]
      scale = (59, 5)
      pos = (110, 220)
      just = [ left top ]
      z_priority = 4
    }
  endif
  RunScriptOnScreenElement id = ss_menu animate_in
endscript
script player_1_ready
  load_second_skater_profile
  MakeSkaterGoto SkateshopAI params = { }
  launch_select_skater_menu
endscript
script ss_menu_exit
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  Wait 1 frame
  remove_ss_menu_textures_from_vram
  if GotParam new_menu_script
    add_pause_menu_textures_to_vram
     <new_menu_script> <...>
  endif
endscript
script add_ss_menu_textures_to_vram
  AddTextureToVram "level_top_piece"
  AddTextureToVram "level_repeat_mid"
  AddTextureToVram "level_bottom_piece"
  AddTextureToVram "goal_right"
  AddTextureToVram "PA_Model"
  AddTextureToVram "PA_sound"
  AddTextureToVram "PA_controls"
  AddTextureToVram "PA_movie"
  AddTextureToVram "PA_options"
  AddTextureToVram "PA_taunt"
  AddTextureToVram "PA_create"
  AddTextureToVram "PA_hardware"
  AddTextureToVram "PA_connection"
  AddTextureToVram "stats_notch"
  AddTextureToVram "left_arrow"
  AddTextureToVram "right_arrow"
  AddTextureToVram "up_arrow"
  AddTextureToVram "down_arrow"
endscript
script remove_ss_menu_textures_from_vram
  RemoveTextureFromVram "level_top_piece"
  RemoveTextureFromVram "level_repeat_mid"
  RemoveTextureFromVram "level_bottom_piece"
  RemoveTextureFromVram "goal_right"
  RemoveTextureFromVram "PA_Model"
  RemoveTextureFromVram "PA_sound"
  RemoveTextureFromVram "PA_controls"
  RemoveTextureFromVram "PA_movie"
  RemoveTextureFromVram "PA_options"
  RemoveTextureFromVram "PA_taunt"
  RemoveTextureFromVram "PA_create"
  RemoveTextureFromVram "PA_hardware"
  RemoveTextureFromVram "PA_connection"
  RemoveTextureFromVram "stats_notch"
  RemoveTextureFromVram "left_arrow"
  RemoveTextureFromVram "right_arrow"
  RemoveTextureFromVram "up_arrow"
  RemoveTextureFromVram "down_arrow"
endscript
script start_practice_run
  SetPractice 1
  SetScoreDegradation 0
  SetUpSkateshopSkaters
  SpawnSkaterScript start_practice_run_skater
  SetGlobalFlag flag = CAREER_STARTED
  SetScreenElementProps {
    id = root_window
    tags = { menu_state = off }
    event_handlers = [ { pad_start skateshop_practice_start_pressed } ]
    replace_handlers
  }
endscript
script SetUpSkateshopSkaters
  Kill prefix = "TRG_SS_PedPro"
  Create prefix = "TRG_SS_PedPro"
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  switch <name>
  case Hawk
    Printf "got Hawk"
    Kill name = TRG_SS_PedProTony
  case Burnquist
    Printf "got Burnquist"
    Kill name = TRG_SS_PedProBob
  case Caballero
    Printf "got Caballero"
    Kill name = TRG_SS_PedProSteve
  case Campbell
    Printf "got Campbell"
    Kill name = TRG_SS_PedProKareem
  case Glifberg
    Printf "got Glifberg"
    Kill name = TRG_SS_PedProRune
  case Koston
    Printf "got Koston"
    Kill name = TRG_SS_PedProEric
  case Lasek
    Printf "got Lasek"
    Kill name = TRG_SS_PedProBucky
  case Margera
    Printf "got Margera"
    Kill name = TRG_SS_PedProBam
  case Mullen
    Printf "got Mullen"
    Kill name = TRG_SS_PedProRodney
  case Muska
    Printf "got Muska"
  case Reynolds
    Printf "got Reynolds"
    Kill name = TRG_SS_PedProAndrew
  case Rowley
    Printf "got Rowley"
    Kill name = TRG_SS_PedProGeoff
  case Steamer
    Printf "got Steamer"
    Kill name = TRG_SS_PedProElissa
  case Thomas
    Printf "got Thomas"
    Kill name = TRG_SS_PedProJamie
  endswitch
endscript
script start_practice_run_skater
  Create name = SSO_Fence05
  Kill name = SSO_Fence02
  GoalManager_ShowPoints
  GoalManager_ShowGoalPoints
  KillSkaterCamAnim all
  MakeSkaterGoto SkaterInit
  ResetSkaters node_name = TRG_SS_SkaterDropIn
  MakeSkaterGoto DropIn
endscript
script skateshop_practice_pause_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  make_new_menu menu_title = 'PAUSED' menu_id = skateshop_pause_menu vmenu_id = skateshop_vmenu helper_text = generic_helper_text
  kill_start_key_binding
  set_sub_bg
  create_icon texture = PA_pause
  SetScreenElementProps {
    id = current_menu
    event_handlers = [ { pad_back generic_menu_pad_back_sound }
      { pad_back exit_pause_menu }
    ]
    replace_handlers
  }
  make_text_sub_menu_item text = 'Continue' pad_choose_script = exit_pause_menu
  if not CD
    make_text_sub_menu_item text = 'View Models' id = menu_view_models pad_choose_script = launch_view_models_menu
    make_text_sub_menu_item text = "Options" id = menu_practice_options pad_choose_script = create_options_menu
  endif
  make_text_sub_menu_item text = 'Quit Practice' pad_choose_script = skateshop_practice_quit
  RunScriptOnScreenElement id = current_menu_anchor animate_in
endscript
script skateshop_practice_start_pressed
  unhide_root_window
  GetTags
  if ChecksumEquals a = <menu_state> b = on
    PauseMusicAndStreams 0
    UnPauseGame
    exit_pause_menu
  endif
  if ChecksumEquals a = <menu_state> b = off
    Printf "-------------------- PAUSING GAME ----------------------"
    PauseMusicAndStreams 1
    PauseGame
    pause_trick_text
    pause_balance_meter
    add_pause_menu_textures_to_vram
    skateshop_practice_pause_menu
  endif
endscript
script skateshop_practice_quit
  SetPractice 0
  SetScreenElementProps {
    id = root_window
    event_handlers = [ { pad_start main_menu_start_pressed } ]
    replace_handlers
  }
  SetScreenElementProps id = root_window tags = { menu_state = off }
  UnPauseMusicAndStreams
  UnPauseGame
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  skater:BlendPeriodOut 0.0
  skater:Obj_MoveToNode name = TRG_SS_SkaterChoosing orient
  MakeSkaterGoto SkateshopAI params = { }
  launch_ss_menu
endscript
came_to_cas_menu_from_main_menu = 0
script skateshop_create_cas_menu
  if GotParam came_from_main_menu
    Change came_to_cas_menu_from_main_menu = 1
    if not IsDemo
      load_pro_skater name = custom
    endif
  else
    Change came_to_cas_menu_from_main_menu = 0
  endif
  launch_edit_skater_menu <...>
  skater:Obj_MoveToNode name = TRG_SS_Appearance orient
endscript
script launch_select_skater_menu
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  remove_pause_menu_textures_from_vram
  if LevelIs load_skateshop
    if ( goto_secret_shop = 2 )
      Wait 1 gameframe
      Change goto_secret_shop = 0
    endif
    KillSkaterCamAnim all
    PlaySkaterCamAnim name = SS_SkaterChoosing play_hold
    skater:Obj_MoveToNode name = TRG_SS_SkaterChoosing orient
    if not GotParam From2p
    else
      Printf "GOTPARAM FROM 2p"
    endif
  endif
  GetCurrentSkaterProfileIndex
  if ( <currentSkaterProfileIndex> = 1 )
    SetMenuPadMappings [ active
      use_as_first
    ]
  else
    Printf "Resetting skater profile number"
    SetCurrentSkaterProfile 0
    RefreshSkaterModel profile = 0 skater = 0
    if LevelIs load_skateshop
    endif
    SetMenuPadMappings [ active
      use_as_first
    ]
  endif
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  create_select_skater_menu <...>
endscript
script create_select_skater_menu
  add_select_skater_textures_to_vram
  ResetComboRecords
  if GotParam change_gamemode
     <change_gamemode>
  endif
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = select_skater_anchor
    pos = (320, 240)
    dims = (640, 480)
  }
  AssignAlias id = select_skater_anchor alias = current_menu_anchor
  create_helper_text { helper_text_elements = [ { text = "\b6/\b5=Select" }
      { text = "\m0=Accept" }
      { text = "\m1=Back" }
      { text = "\me=Load Skater" }
      { text = "\be/\bf=Rotate" }
    ]
  }
   <root_pos> = (22, 27)
   <pos> = <root_pos>
  select_skater_create_top_bar root_pos = <root_pos> create_dots <...>
  kill_start_key_binding
  GetStackedScreenElementPos Y id = select_skater_mainbar offset = (367, 80)
  CreateScreenElement {
    type = SpriteElement
    parent = select_skater_top_anchor
    id = select_skater_left_arrow
    texture = left_arrow
    pos = <pos>
    just = [ left top ]
  }
  GetStackedScreenElementPos X id = <id> offset = (160, 0)
  CreateScreenElement {
    type = SpriteElement
    parent = select_skater_top_anchor
    id = select_skater_right_arrow
    texture = right_arrow
    pos = <pos>
    just = [ left top ]
  }
  GetStackedScreenElementPos Y id = select_skater_mainbar pos = <root_pos> offset = (0, 20)
   <stats_block_pos> = ( <pos> + (27, 0) )
  stats_menu_create_stats_block parent = select_skater_anchor not_focusable scale = 0.9 pos = <stats_block_pos>
  AssignAlias id = select_skater_hmenu alias = current_menu
  CreateScreenElement {
    type = ContainerElement
    parent = select_skater_anchor
    id = select_skater_bottom_anchor
    pos = (320, 225)
    dims = (640, 480)
  }
  if not GameModeEquals is_net
    if GameModeEquals is_career
      GetStackedScreenElementPos Y id = select_skater_mainbar offset = (3, 253)
      CreateScreenElement {
        type = SpriteElement
        parent = select_skater_bottom_anchor
        id = select_skater_bottom_left
        texture = bottom_l_cap
        rgba = [ 128 128 128 95 ]
        pos = <pos>
        just = [ left top ]
      }
      GetStackedScreenElementPos X id = <id>
       <bottom_middle_pos> = <pos>
      CreateScreenElement {
        type = SpriteElement
        parent = select_skater_bottom_anchor
        texture = bottom_mid
        pos = <pos>
        rgba = [ 128 128 128 95 ]
        scale = (19, 1)
        just = [ left top ]
      }
      GetStackedScreenElementPos X id = <id>
      CreateScreenElement {
        type = SpriteElement
        parent = select_skater_bottom_anchor
        texture = bottom_r_cap
        rgba = [ 128 128 128 95 ]
        pos = (339, 326)
        just = [ left top ]
        z_priority = -10
      }
      CreateScreenElement {
        type = SpriteElement
        parent = select_skater_bottom_anchor
        texture = black
        rgba = [ 127 102 0 35 ]
        pos = (90, 374)
        scale = (63.2, 3.2)
        just = [ left top ]
        z_priority = 4
      }
      CreateScreenElement {
        type = SpriteElement
        parent = select_skater_bottom_anchor
        texture = black
        rgba = [ 127 102 0 10 ]
        pos = (30, 374)
        scale = (15, 3.2)
        just = [ left top ]
        z_priority = 10
      }
      CreateScreenElement {
        type = SpriteElement
        parent = select_skater_bottom_anchor
        texture = black
        rgba = [ 25 45 63 40 ]
        pos = (30, 357)
        scale = (15.2, 3.4)
        just = [ left top ]
        z_priority = 4
      }
      GoalManager_GetNumberOfGoalPoints total
      FormatText TextName = goals_completed_text "Pro Points: %i of 190" i = <goal_points>
      GetStackedScreenElementPos Y id = select_skater_mainbar offset = (128, -57)
      CreateScreenElement {
        type = TextElement
        parent = select_skater_bottom_left
        id = select_skater_goals_complete_text
        font = small
        text = <goals_completed_text>
        scale = 0.9
        pos = <pos>
        rgba = [ 127 102 0 100 ]
        just = [ center center ]
      }
      show_level_select_pro_challenge
    endif
  endif
  RunScriptOnScreenElement id = select_skater_top_anchor select_skater_menu_animate_top
  RunScriptOnScreenElement id = stats_block_anchor select_skater_menu_animate_stats
  RunScriptOnScreenElement id = select_skater_bottom_anchor select_skater_menu_animate_bottom
  select_skater_get_current_skater_name
  AssignAlias id = select_skater_hmenu alias = current_menu
  FireEvent type = focus target = select_skater_hmenu data = { child_id = <current_skater> }
  skater:SetTags stopskateshopstreams = 0
endscript
script show_level_select_pro_challenge
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  GoalManager_GetNumberOfGoalPoints total
  if GotParam is_secret
     <name> = custom
  endif
  if GoalManager_SkaterHasBeatenProSpecificChallenge skater = <name>
    challenge_rgba = [ 25 83 67 128 ]
    challenge_offset = (130, 12)
  else
    challenge_rgba = [ 88 105 112 98 ]
    challenge_offset = (130, 12)
  endif
  GetStackedScreenElementPos Y id = select_skater_goals_complete_text offset = <challenge_offset>
  CreateScreenElement {
    type = TextElement
    parent = select_skater_bottom_left
    id = pro_challenge_text
    font = dialog
    text = 'Pro Challenge:'
    pos = <pos>
    scale = 0.9
    rgba = <challenge_rgba>
    just = [ center center ]
  }
  if GoalManager_SkaterHasBeatenProSpecificChallenge skater = <name>
    CreateScreenElement {
      type = SpriteElement
      parent = pro_challenge_text
      texture = stats_notch
      rgba = [ 18 87 18 128 ]
      pos = (-10, 11)
      scale = (10.5, 0.2)
      just = [ left top ]
    }
    CreateScreenElement {
      type = SpriteElement
      parent = pro_challenge_text
      texture = GO_done
      rgba = [ 127 102 0 128 ]
      pos = (-51, 4)
      scale = 0.6
      just = [ left top ]
      z_priority = 30
    }
  else
    CreateScreenElement {
      type = SpriteElement
      parent = pro_challenge_text
      texture = GO_fail
      rgba = [ 90 20 20 128 ]
      pos = (-51, 4)
      scale = 0.6
      just = [ left top ]
      z_priority = 30
    }
    if GoalManager_ProSpecificChallengesUnlocked
      FormatText TextName = challenge_level '%p' p = ( ( level_select_pro_challenge_info.<name> ).text )
      GetStackedScreenElementPos Y id = select_skater_goals_complete_text offset = (-40, 4)
      CreateScreenElement {
        type = TextElement
        parent = pro_challenge_text
        id = challenge_level_text
        font = dialog
        text = <challenge_level>
        pos = <pos>
        scale = 0.8
        rgba = <challenge_rgba>
        just = [ left center ]
      }
    else
      points_left = ( 90 - <goal_points> )
      if ( <points_left> = 1 )
        FormatText TextName = need_points_text 'Need %p more pro point' p = <points_left>
      else
        FormatText TextName = need_points_text 'Need %p more pro points' p = <points_left>
      endif
      GetStackedScreenElementPos Y id = select_skater_goals_complete_text offset = (-40, 4)
      CreateScreenElement {
        type = TextElement
        parent = pro_challenge_text
        font = dialog
        text = <need_points_text>
        pos = <pos>
        scale = 0.8
        rgba = <challenge_rgba>
        just = [ left center ]
      }
    endif
  endif
endscript
script select_skater_menu_fire_focus
  Printf "select_skater_menu_fire_focus"
  Wait 1 frame
  select_skater_get_current_skater_name
  FireEvent type = focus target = select_skater_hmenu data = { child_id = <current_skater> }
  Printf "select_skater_menu_fire_focus done"
endscript
script select_skater_create_top_bar scale = (1.14, 1) text = "" parent = select_skater_anchor
   <pos> = <root_pos>
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = select_skater_top_anchor
    pos = (320, 240)
    dims = (640, 480)
  }
  CreateScreenElement {
    type = TextElement
    parent = select_skater_top_anchor
    id = select_skater_name
    text = <text>
    font = testtitle
    pos = ( <pos> + (8, 32) )
    scale = 1.3
    just = [ left center ]
    rgba = [ 88 105 112 118 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = select_skater_top_anchor
    id = select_skater_mainbar
    texture = mainbar
    pos = <pos>
    scale = <scale>
    just = [ left top ]
  }
  GetStackedScreenElementPos X id = select_skater_mainbar
  CreateScreenElement {
    type = SpriteElement
    parent = select_skater_top_anchor
    texture = mainbar_join
    pos = <pos>
    just = [ left top ]
  }
  if GotParam create_dots
    GetStackedScreenElementPos X id = <id>
    CreateScreenElement {
      type = HMenu
      parent = select_skater_top_anchor
      id = select_skater_hmenu
      pos = ( (-70, 3) + <pos> )
      just = [ left top ]
      internal_just = [ center center ]
    }
    AssignAlias id = select_skater_hmenu alias = current_menu
    ForEachSkaterProfileHackDemo do = select_skater_menu_add_hmenu_items params = { root_pos = <root_pos> <...> }
    GetCurrentSkaterProfileIndex
    if LevelIs load_skateshop
      if ( <currentSkaterProfileIndex> = 1 )
        SetScreenElementProps {
          id = select_skater_hmenu
          event_handlers = [ { pad_back select_skater_menu_back params = { callback = back_from_player_two_select } }
            { pad_l1 skateshop_rotate_skater_left }
            { pad_r1 skateshop_rotate_skater_right }
            { pad_option pre_cas_menu_exit params = { new_menu_script = launch_load_cas_from_select_sequence } }
          ]
          replace_handlers
        }
      else
        SetScreenElementProps {
          id = select_skater_hmenu
          event_handlers = [ { pad_back generic_menu_pad_back_sound }
            { pad_back select_skater_menu_back params = { callback = launch_main_menu } }
            { pad_l1 skateshop_rotate_skater_left }
            { pad_r1 skateshop_rotate_skater_right }
            { pad_option pre_cas_menu_exit params = { new_menu_script = launch_load_cas_from_select_sequence } }
          ]
          replace_handlers
        }
        if GameModeEquals is_career
          if not GameModeEquals is_net
            SetScreenElementProps {
              id = select_skater_hmenu
              event_handlers = [ { pad_back generic_menu_pad_back_sound }
                { pad_back select_skater_menu_back params = { callback = create_career_options_menu } }
                { pad_l1 skateshop_rotate_skater_left }
                { pad_r1 skateshop_rotate_skater_right }
                { pad_option pre_cas_menu_exit params = { new_menu_script = launch_load_cas_from_select_sequence } }
              ]
              replace_handlers
            }
          endif
        endif
        SetScreenElementProps {
          id = select_skater_hmenu
          event_handlers = [ { pad_left generic_menu_scroll_sideways_sound }
            { pad_right generic_menu_scroll_sideways_sound }
            { pad_left menu_horiz_blink_arrow params = { arrow_id = select_skater_left_arrow } }
            { pad_right menu_horiz_blink_arrow params = { arrow_id = select_skater_right_arrow } }
          ]
        }
      endif
    else
      SetScreenElementProps {
        id = select_skater_hmenu
        event_handlers = [ { pad_back select_skater_menu_back params = { callback = create_options_menu } } ]
        replace_handlers
      }
    endif
  endif
  CreateScreenElement {
    type = SpriteElement
    parent = select_skater_top_anchor
    texture = longbar
    pos = <pos>
    scale = (16, 1)
    just = [ left top ]
  }
  GetStackedScreenElementPos X id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = select_skater_top_anchor
    texture = longbar_cap
    pos = <pos>
    just = [ left top ]
  }
endscript
script menu_horiz_blink_arrow
  TerminateObjectsScripts id = <arrow_id>
  RunScriptOnScreenElement id = <arrow_id> menu_blink_arrow
endscript
script back_from_player_two_select
  SetCurrentSkaterProfile 0
  RefreshSkaterModel profile = 0 skater = 0
  launch_select_skater_menu From2p
endscript
script select_skater_menu_add_hmenu_items
  if GotParam is_hidden
    if ( <is_hidden> = 1 )
      CreateScreenElement {
        type = SpriteElement
        parent = select_skater_hmenu
        id = <name>
        texture = lock_skater
        not_focusable
      }
    else
      CreateScreenElement {
        type = SpriteElement
        parent = select_skater_hmenu
        id = <name>
        texture = off_skater
        SetProps rgba = [ 70 76 108 128 ]
        event_handlers = [ { focus select_skater_hmenu_focus params = <...> }
          { unfocus select_skater_hmenu_unfocus }
          { pad_choose select_skater_hmenu_choose params = <...> }
          { pad_start select_skater_hmenu_choose params = <...> }
        ]
      }
    endif
  else
    CreateScreenElement {
      type = SpriteElement
      parent = select_skater_hmenu
      id = <name>
      texture = off_skater
      SetProps rgba = [ 70 76 108 128 ]
      event_handlers = [ { focus select_skater_hmenu_focus params = <...> }
        { unfocus select_skater_hmenu_unfocus }
        { pad_choose select_skater_hmenu_choose params = <...> }
        { pad_start select_skater_hmenu_choose params = <...> }
      ]
    }
  endif
endscript
script get_current_skater_display_name
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  return display_name = <display_name>
endscript
script select_skater_hmenu_focus
  if LevelIs load_skateshop
    select_skater_get_current_skater_name
    load_pro_skater { profile = <currentSkaterProfileIndex> skater = 0 <...> }
    get_current_skater_display_name
    GetUpperCaseString <display_name>
    SetScreenElementProps {
      id = select_skater_name
      text = <UpperCaseString>
    }
    StopStream
    MakeSkaterGoto SkateshopAI params = { }
  endif
  SetScreenElementLock id = select_skater_anchor off
  SetProps rgba = [ 100 24 20 128 ]
  if ObjectExists id = stats_block_anchor
    DestroyScreenElement id = stats_block_anchor
  endif
  GetStackedScreenElementPos Y id = select_skater_mainbar pos = <root_pos> offset = (0, 20)
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  stats_menu_create_stats_block {
    parent = select_skater_anchor
    not_focusable
    scale = 0.9
    pos = ( <pos> + (27, 0) )
  }
  AssignAlias id = select_skater_hmenu alias = current_menu
  if ObjectExists id = pro_challenge_text
    DestroyScreenElement id = pro_challenge_text
    show_level_select_pro_challenge
  endif
  if ObjectExists id = challenge_level_text
    SetScreenElementProps id = challenge_level_text text = ( ( level_select_pro_challenge_info.<name> ).text )
  endif
  if ObjectExists id = select_skater_bottom_anchor
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    if GotParam is_secret
      DoScreenElementMorph id = select_skater_bottom_anchor time = 0 scale = 0
    else
      DoScreenElementMorph id = select_skater_bottom_anchor time = 0 scale = 1
    endif
  endif
  RunScriptOnScreenElement id = stats_block_anchor select_skater_menu_animate_stats
  if IsXBOX
    SpawnScript select_skater_temporarily_disable_menu_input params = { time = 100 }
  endif
endscript
script select_skater_temporarily_disable_menu_input
  SetButtonEventMappings block_menu_input
  Wait <time>
  SetButtonEventMappings unblock_menu_input
endscript
script select_skater_get_current_skater_name
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  return current_skater = <name>
endscript
script select_skater_hmenu_unfocus
  generic_menu_pad_up_down_sound
  SetProps rgba = [ 70 76 108 128 ]
  DoMorph scale = 1
endscript
script select_skater_hmenu_choose
  GetCurrentSkaterProfileIndex
  if ControllerBoundToDifferentSkater controller = <device_num> skater = <currentSkaterProfileIndex>
    return
  endif
  if ObjectExists id = select_skater_anchor
    DestroyScreenElement id = select_skater_anchor
    remove_select_skater_textures_from_vram
    restore_start_key_binding
  endif
  if LevelIs load_skateshop
    GetSkaterID
    if GotParam device_num
       <controller_index> = <device_num>
    else
       <controller_index> = <controller>
    endif
    BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <controller_index>
    BindFrontEndToController front_end_pad = <currentSkaterProfileIndex> controller = <controller_index>
    StopStream
    GetCurrentSkaterProfileIndex
    skater:Obj_SpawnScript SkateshopGO
    add_pause_menu_textures_to_vram
    if InSplitScreenGame
      launch_ss_menu <...>
    else
      launch_ss_menu
    endif
  else
    if not GoalManager_HasActiveGoals
      GoalManager_ShowGoalPoints
    endif
    select_skater_get_current_skater_name
    if not ( <current_skater> = <name> )
      GetCurrentSkaterProfileIndex
      load_pro_skater { profile = <currentSkaterProfileIndex> skater = 0 <...> }
    endif
    GoalManager_ShowPoints
    GoalManager_ReplaceTrickText all
    exit_pause_menu
  endif
  skater:SetTags stopskateshopstreams = 1
endscript
script SkateshopGO
  Wait 0.18 seconds
  skater:PlaySkaterStream type = "SSGo"
endscript
script load_second_skater_profile
  Printf "REFRESHING SKATER MODEL"
  SetCurrentSkaterProfile 1
  RefreshSkaterModel profile = 1 skater = 0
  SyncPlayer2Profile
endscript
script select_skater_menu_back
  if ObjectExists id = select_skater_anchor
    DestroyScreenElement id = select_skater_anchor
    remove_select_skater_textures_from_vram
    restore_start_key_binding
    KillSkaterCamAnim all
  endif
  if not LevelIs load_skateshop
    GoalManager_ShowPoints
    if not GoalManager_HasActiveGoals
      GoalManager_ShowGoalPoints
    endif
  else
  endif
  skater:SetTags stopskateshopstreams = 1
  add_pause_menu_textures_to_vram
   <callback>
endscript
script select_skater_menu_animate_top
  PlaySound LevelAnimateTop
  DoMorph pos = { (0, -120) relative } alpha = 0
  DoMorph time = 0.2 pos = { (0, 120) relative } alpha = 1
endscript
script select_skater_menu_animate_stats
  DoMorph pos = { (-400, 0) relative } alpha = 0
  DoMorph time = 0.3
  PlaySound LevelAnimateLeft
  DoMorph time = 0.2 pos = { (402, 0) relative } alpha = 1
  DoMorph time = 0.1 pos = { (-2, 0) relative }
  DoMorph time = 0.1 pos = { (1, 0) relative }
  FireEvent type = select_skater_menu_animate_stats_done
endscript
script select_skater_menu_animate_bottom
  DoMorph pos = { (0, 140) relative } alpha = 0
  DoMorph time = 0.4
  DoMorph time = 0.2 pos = { (0, -138) relative } alpha = 1
endscript
script add_select_skater_textures_to_vram
  AddTextureToVram "bottom_l_cap"
  AddTextureToVram "bottom_mid"
  AddTextureToVram "bottom_r_cap"
  AddTextureToVram "highlight_skater"
  AddTextureToVram "left_arrow"
  AddTextureToVram "lock_skater"
  AddTextureToVram "longbar"
  AddTextureToVram "longbar_cap"
  AddTextureToVram "mainbar"
  AddTextureToVram "mainbar_join"
  AddTextureToVram "off_skater"
  AddTextureToVram "right_arrow"
  AddTextureToVram "stats_bg"
  AddTextureToVram "stats_notch"
  AddTextureToVram "tab"
  AddTextureToVram "pip_on"
  AddTextureToVram "goal_right"
endscript
script remove_select_skater_textures_from_vram
  RemoveTextureFromVram "bottom_l_cap"
  RemoveTextureFromVram "bottom_mid"
  RemoveTextureFromVram "bottom_r_cap"
  RemoveTextureFromVram "highlight_skater"
  RemoveTextureFromVram "left_arrow"
  RemoveTextureFromVram "lock_skater"
  RemoveTextureFromVram "longbar"
  RemoveTextureFromVram "longbar_cap"
  RemoveTextureFromVram "mainbar"
  RemoveTextureFromVram "mainbar_join"
  RemoveTextureFromVram "off_skater"
  RemoveTextureFromVram "right_arrow"
  RemoveTextureFromVram "stats_bg"
  RemoveTextureFromVram "stats_notch"
  RemoveTextureFromVram "tab"
  RemoveTextureFromVram "pip_on"
  RemoveTextureFromVram "goal_right"
endscript
script menu_blink_arrow
  DoMorph alpha = 0
  Wait 100
  DoMorph time = 0.3 alpha = 1
endscript
edit_skater_menu_level_1_index = 0
edit_skater_menu_level_2_index = 0
script launch_edit_skater_menu
  remove_pause_menu_textures_from_vram
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  GoalManager_HidePoints
  GoalManager_HideGoalPoints
  MakeSkaterGoto SkateshopAI params = { NoSFX CAS_Screen }
  create_edit_skater_menu <...> animate
endscript
script create_edit_skater_menu
  pulse_blur
  add_edit_skater_textures_to_vram
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  SetScreenElementLock id = root_window off
  CreateScreenElement {
    type = ContainerElement
    parent = root_window
    id = edit_skater_anchor
    pos = (315, 230)
    dims = (640, 480)
  }
  AssignAlias id = edit_skater_anchor alias = current_menu_anchor
  kill_start_key_binding
   <root_pos> = (50, 50)
   <pos> = <root_pos>
  CreateScreenElement {
    type = ContainerElement
    parent = edit_skater_anchor
    id = edit_skater_anchor_top
    pos = (320, 240)
    dims = (640, 480)
  }
  edit_skater_create_top_bar scale = (1, 1) parent = edit_skater_anchor_top root_pos = <root_pos> text = 'EDIT SKATER'
  edit_skater_create_main_menu <...>
  if GotParam animate
    RunScriptOnScreenElement id = edit_skater_anchor_top select_skater_menu_animate_top
    RunScriptOnScreenElement id = edit_skater_anchor_middle select_skater_menu_animate_stats
  endif
endscript
script edit_skater_create_top_bar scale = (1.14, 1) text = "" parent = select_skater_anchor
   <pos> = <root_pos>
  CreateScreenElement {
    type = ContainerElement
    parent = <parent>
    id = select_skater_top_anchor
    pos = (320, 240)
    dims = (640, 480)
  }
  CreateScreenElement {
    type = TextElement
    parent = select_skater_top_anchor
    id = select_skater_name
    text = <text>
    font = testtitle
    pos = ( <pos> + (18, 20) )
    scale = 1.3
    just = [ left center ]
    rgba = [ 88 105 112 118 ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = select_skater_top_anchor
    id = select_skater_mainbar
    texture = mainbar
    pos = <pos>
    scale = <scale>
    just = [ left top ]
  }
  GetStackedScreenElementPos X id = select_skater_mainbar
  CreateScreenElement {
    type = SpriteElement
    parent = select_skater_top_anchor
    texture = mainbar_join
    pos = <pos>
    just = [ left top ]
  }
  CreateScreenElement {
    type = SpriteElement
    parent = select_skater_top_anchor
    texture = longbar_edgy
    pos = <pos>
    scale = (2.5, 1)
    just = [ left top ]
  }
endscript
script edit_skater_create_main_menu
  if LevelIs load_skateshop
    KillSkaterCamAnim all
    PlaySkaterCamAnim name = SS_Appearance play_hold
  endif
  create_helper_text generic_helper_text_cas
  edit_skater_create_menu_block
  GetStackedScreenElementPos Y id = edit_skater_menu_tab offset = (130, 15)
  CreateScreenElement {
    type = VMenu
    parent = edit_skater_anchor_middle
    id = edit_skater_vmenu
    pos = <pos>
    just = [ center top ]
  }
  SetScreenElementProps {
    id = edit_skater_vmenu
    event_handlers = [ { pad_back generic_menu_pad_back_sound }
      { pad_back edit_skater_menu_exit params = <...> }
      { pad_up generic_menu_up_or_down_sound params = { Up } }
      { pad_down generic_menu_up_or_down_sound params = { Down } }
    ]
    replace_handlers
  }
  if LevelIs load_skateshop
    SetScreenElementProps {
      id = edit_skater_vmenu
      event_handlers = [ { pad_l1 skateshop_rotate_skater_left }
        { pad_r1 skateshop_rotate_skater_right }
      ]
      replace_handlers
    }
  endif
  AssignAlias id = edit_skater_vmenu alias = current_menu
  edit_skater_menu_add_item {
    text = 'Information'
    pad_choose_script = edit_skater_info_menu
    focus_script = edit_skater_menu_focus_with_icon
    unfocus_script = edit_skater_menu_unfocus_with_icon
    child_texture = ED_info
    index = 0
  }
  edit_skater_menu_add_item {
    text = 'Head Options'
    pad_choose_script = edit_skater_create_options_menu
    pad_choose_params = { options_array = edit_skater_head_options cam_anim = SS_Appearance_Face from_level_1 }
    focus_script = edit_skater_menu_focus_with_icon
    unfocus_script = edit_skater_menu_unfocus_with_icon
    child_texture = ED_head
    is_enabled_script = check_if_group_editable
    is_enabled_params = { group = head_options }
    index = 2
  }
  edit_skater_menu_add_item {
    text = 'Torso Options'
    pad_choose_script = edit_skater_create_options_menu
    pad_choose_params = { options_array = edit_skater_torso_options cam_anim = SS_Appearance_Torso from_level_1 }
    focus_script = edit_skater_menu_focus_with_icon
    unfocus_script = edit_skater_menu_unfocus_with_icon
    child_texture = ED_torso
    is_enabled_script = check_if_group_editable
    is_enabled_params = { group = torso_options }
    index = 3
  }
  edit_skater_menu_add_item {
    text = 'Leg Options'
    pad_choose_script = edit_skater_create_options_menu
    pad_choose_params = { options_array = edit_skater_leg_options cam_anim = SS_Appearance_Legs from_level_1 }
    focus_script = edit_skater_menu_focus_with_icon
    unfocus_script = edit_skater_menu_unfocus_with_icon
    child_texture = ED_legs
    is_enabled_script = check_if_group_editable
    is_enabled_params = { group = leg_options }
    index = 4
  }
  edit_skater_menu_add_item {
    text = 'Tattoo Options'
    pad_choose_script = edit_skater_create_options_menu
    pad_choose_params = { options_array = edit_skater_tattoo_options cam_anim = SS_Appearance from_level_1 should_add_reset_tattoos = 1 }
    focus_script = edit_skater_menu_focus_with_icon
    unfocus_script = edit_skater_menu_unfocus_with_icon
    child_texture = ED_tat
    is_enabled_script = check_if_group_editable
    is_enabled_params = { group = tattoo_options }
    index = 5
    is_visible_script = currently_editing_custom
  }
  edit_skater_menu_add_item {
    text = 'Scale Options'
    pad_choose_script = edit_skater_create_options_menu
    pad_choose_params = { options_array = edit_skater_scaling_options cam_anim = SS_Appearance from_level_1 should_add_reset_scaling = 1 }
    focus_script = edit_skater_menu_focus_with_icon
    unfocus_script = edit_skater_menu_unfocus_with_icon
    child_texture = ED_resize
    is_enabled_script = check_if_group_editable
    is_enabled_params = { group = scaling_options not_with_scaling_cheats }
    index = 6
    is_visible_script = currently_editing_custom
  }
  edit_skater_menu_add_item {
    text = 'Pad Options'
    pad_choose_script = edit_skater_create_options_menu
    pad_choose_params = { options_array = edit_skater_pad_options cam_anim = SS_Appearance from_level_1 }
    focus_script = edit_skater_menu_focus_with_icon
    unfocus_script = edit_skater_menu_unfocus_with_icon
    child_texture = ED_pads
    is_enabled_script = check_if_group_editable
    is_enabled_params = { group = pad_options }
    index = 7
  }
  edit_skater_menu_add_item {
    text = 'Board Options'
    pad_choose_script = launch_boardshop_menu
    pad_choose_params = { previous_menu = edit_skater edit_skater_menu_params = <...> }
    focus_script = edit_skater_menu_focus_with_icon
    unfocus_script = edit_skater_menu_unfocus_with_icon
    child_texture = ED_board
    is_enabled_script = check_if_board_options_enabled
    is_enabled_params = { group = board_options }
    index = 8
  }
  edit_skater_menu_add_item {
    text = 'Secret Gear'
    pad_choose_script = edit_skater_create_secret_gear_menu
    pad_choose_params = { options_array = edit_skater_secret_gear from_level_1 }
    focus_script = edit_skater_menu_focus_with_icon
    unfocus_script = edit_skater_menu_unfocus_with_icon
    child_texture = ED_secret
    is_enabled_script = check_if_board_options_enabled
    is_enabled_params = { group = secret_options }
    index = 9
  }
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if ( <is_pro> = 0 )
    spacer_dims = (200, 30)
  else
    spacer_dims = (200, 77)
  endif
  SetScreenElementLock id = current_menu off
  main_menu_add_item { text = ' ' dims = <spacer_dims> pad_choose_script = nullscript not_focusable = not_focusable }
  main_menu_add_item {
    text = 'Done'
    scale = 0.85
    id = cas_menu_done
    pad_choose_script = edit_skater_menu_exit
    highlight_bar_scale = (0, 0)
  }
  SetScreenElementLock id = current_menu on
  GetStackedScreenElementPos X id = edit_skater_anchor_middle offset = (-585, -6)
  CreateScreenElement {
    type = SpriteElement
    parent = cas_menu_done
    id = done_bg_box
    texture = black
    z_priority = 0
    scale = (20, 5)
    pos = <pos>
    just = [ left top ]
    rgba = [ 0 0 0 110 ]
    not_focusable
  }
  GetStackedScreenElementPos X id = edit_skater_anchor_middle offset = (-581, -4)
  CreateScreenElement {
    type = SpriteElement
    parent = cas_menu_done
    texture = black
    z_priority = 1
    scale = (18, 4)
    pos = <pos>
    just = [ left top ]
    rgba = [ 128 128 128 13 ]
    not_focusable
  }
  FireEvent type = focus target = current_menu data = { grid_index = edit_skater_menu_level_1_index }
endscript
script check_if_group_editable_and_head_is_unlocked
  check_if_group_editable
  if ( <is_enabled> = 0 )
    return is_enabled = 0
  endif
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if ( <is_head_locked> = 1 )
    return is_enabled = 0
  endif
  return is_enabled = 1
endscript
script check_if_board_options_enabled
   <retVal> = 1
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if GotParam group
    if GotParam no_edit_groups
      GetArraySize <no_edit_groups>
       <index> = 0
      begin
        if ( <no_edit_groups> [ <index> ] = <group> )
           <retVal> = 0
          break
        endif
         <index> = ( <index> + 1 )
      repeat <array_size>
    endif
  endif
  return is_enabled = <retVal>
endscript
script check_if_group_editable
   <retVal> = 1
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if GotParam no_edit
     <retVal> = 0
  endif
  if GotParam group
    if GotParam no_edit_groups
      GetArraySize <no_edit_groups>
       <index> = 0
      begin
        if ( <no_edit_groups> [ <index> ] = <group> )
           <retVal> = 0
          break
        endif
         <index> = ( <index> + 1 )
      repeat <array_size>
    endif
  endif
  if GotParam not_with_scaling_cheats
    if GetGlobalFlag flag = CHEAT_GORILLA
       <retVal> = 0
    endif
    if GetGlobalFlag flag = CHEAT_KID
       <retVal> = 0
    endif
    if GetGlobalFlag flag = CHEAT_BIGHEAD
       <retVal> = 0
    endif
  endif
  return is_enabled = <retVal>
endscript
script check_if_part_logoable
   <retVal> = 0
  if GotParam parts
    GetArraySize <parts>
     <index> = 0
    begin
      GetCurrentSkaterProfileIndex
      if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = ( <parts> [ <index> ] )
        GetActualCASOptionStruct part = ( <parts> [ <index> ] ) desc_id = <desc_id>
        if GotParam supports_logo
           <retVal> = 1
          break
        else
           <retVal> = 0
          break
        endif
      endif
       <index> = ( <index> + 1 )
    repeat <array_size>
  endif
  return is_enabled = <retVal>
endscript
script check_if_part_back_logoable
  check_if_part_logoable <...>
  if ( <is_enabled> = 1 )
    if GotParam parts
      GetArraySize <parts>
       <index> = 0
      begin
        GetCurrentSkaterProfileIndex
        if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = ( <parts> [ <index> ] )
          GetActualCASOptionStruct part = ( <parts> [ <index> ] ) desc_id = <desc_id>
          if GotParam no_back_logo
            return is_enabled = 0
          endif
        endif
         <index> = ( <index> + 1 )
      repeat <array_size>
    endif
  endif
  return is_enabled = <is_enabled>
endscript
script check_if_item_accessible
   <retVal> = 1
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  if GotParam lockout_flags
    GetArraySize <lockout_flags>
     <index> = 0
    begin
      if GotParam ( <lockout_flags> [ <index> ] )
         <retVal> = 0
        break
      endif
       <index> = ( <index> + 1 )
    repeat <array_size>
  endif
  return is_enabled = <retVal>
endscript
script check_if_part_colorable
   <retVal> = 0
  if GotParam parts
    GetArraySize <parts>
     <index> = 0
    begin
      GetCurrentSkaterProfileIndex
      if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = ( <parts> [ <index> ] )
        GetActualCASOptionStruct part = ( <parts> [ <index> ] ) desc_id = <desc_id>
        if GotParam no_color
           <retVal> = 0
          break
        else
           <retVal> = 1
          break
        endif
      endif
       <index> = ( <index> + 1 )
    repeat <array_size>
  endif
  return is_enabled = <retVal>
endscript
script check_option_is_enabled
   <ret_val> = 1
  if GotParam is_enabled_script
     <is_enabled_script> <is_enabled_params>
    if ( <is_enabled> = 0 )
       <ret_val> = 0
    endif
  endif
  if IsTrue worst_case_cas_debug
    return is_enabled = 1
  endif
  return is_enabled = <ret_val>
endscript
script check_option_is_visible
   <ret_val> = 1
  if GotParam is_visible_script
     <is_visible_script> <is_visible_params>
    if ( <is_enabled> = 0 )
       <ret_val> = 0
    endif
  endif
  if GotParam is_visible_script2
     <is_visible_script2> <is_visible_params2>
    if ( <is_enabled> = 0 )
       <ret_val> = 0
    endif
  endif
  if IsTrue worst_case_cas_debug
    return is_visible = 1
  endif
  return is_visible = <ret_val>
endscript
script edit_skater_create_options_menu
  edit_skater_create_menu_block {
    tab_texture = tab2
    middle_texture = repeat_piece2
    bottom_texture = menu_bottom
  }
  create_helper_text generic_helper_text_cas
  if GotParam parent_index
    Change edit_skater_menu_level_1_index = <parent_index>
  endif
  edit_skater_create_scrolling_menu {
    tab = tab2
    pad_back_script = edit_skater_create_main_menu
    pad_back_params = <pad_back_params>
  }
  if GotParam options_array
    GetArraySize <options_array>
     <index> = 0
    begin
      RemoveParameter not_focusable
      RemoveParameter is_enabled_script
      RemoveParameter is_visible_script
      check_option_is_enabled ( <options_array> [ <index> ] )
      if ( <is_enabled> = 0 )
        AddParams not_focusable = not_focusable
      endif
      check_option_is_visible ( <options_array> [ <index> ] )
      if not ( <is_visible> = 0 )
        edit_skater_menu_add_item {
          ( <options_array> [ <index> ] )
          tab = tab2
          index = <index>
          options_array = <options_array>
          not_focusable = <not_focusable>
          cam_anim = <cam_anim>
          should_add_reset_tattoos = <should_add_reset_tattoos>
          should_add_reset_scaling = <should_add_reset_scaling>
        }
      endif
       <index> = ( <index> + 1 )
    repeat <array_size>
  endif
  if GotParam should_add_reset_tattoos
    edit_skater_menu_add_item {
      text = 'Clear all tattoos'
      pad_choose_script = cas_reset_all_tattoos
      tab = tab2
    }
  endif
  if GotParam should_add_reset_scaling
    edit_skater_menu_add_item {
      text = 'Reset all'
      pad_choose_script = cas_reset_all_scaling
      tab = tab2
    }
  endif
  edit_skater_menu_add_item {
    text = 'Done'
    pad_choose_script = edit_skater_create_main_menu
    tab = tab2
  }
  if GotParam cam_anim
    KillSkaterCamAnim all
    PlaySkaterCamAnim name = <cam_anim> play_hold
  endif
  if not GotParam from_level_1
    FireEvent type = focus target = current_menu data = { grid_index = edit_skater_menu_level_2_index }
  else
    FireEvent type = focus target = current_menu
  endif
endscript
script edit_skater_info_menu id = edit_skater_anchor_middle
  dialog_box_exit
  if not ObjectExists id = edit_skater_anchor
    create_edit_skater_menu
  endif
  edit_skater_create_menu_block {
    tab_texture = tab2
    middle_texture = repeat_piece2
    bottom_texture = menu_bottom
  }
  if GotParam parent_index
    Change edit_skater_menu_level_1_index = <parent_index>
  endif
  create_helper_text { helper_text_elements = [ { text = "\b7/\b4=Select" }
      { text = "\b6/\b5=Adjust" }
      { text = "\m1=Back" }
      { text = "\m0=Accept" }
    ]
  }
  GetStackedScreenElementPos X id = <id>
  CreateScreenElement {
    type = VMenu
    parent = <id>
    id = edit_skater_info_vmenu
    pos = (133, 154)
    just = [ left top ]
    event_handlers = [
      { pad_back generic_menu_pad_back_sound }
      { pad_back edit_skater_create_main_menu }
      { pad_up generic_menu_up_or_down_sound params = { Up } }
      { pad_down generic_menu_up_or_down_sound params = { Down } }
    ]
  }
  AssignAlias id = edit_skater_info_vmenu alias = current_menu
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  info_name = <display_name>
  info_town = <hometown>
  if ( <age> = -1 )
     <info_age> = "Unknown"
  else
    FormatText TextName = info_age "%a" a = <age>
  endif
  switch <is_male>
  case 1
    info_sex = "Male"
  case 0
    info_sex = "Female"
  endswitch
  switch <stance>
  case regular
    info_stance = "Regular"
  case goofy
    info_stance = "Goofy"
  endswitch
  switch <pushstyle>
  case never_mongo
    info_push = "Never Mongo"
  case mongo_when_switch
    info_push = "Mongo Switch"
  case always_mongo
    info_push = "Always Mongo"
  endswitch
  switch <trickstyle>
  case vert
    info_style = "Vert"
  case street
    info_style = "Street"
  endswitch
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if ( <is_pro> = 1 )
    if ( <is_locked> = 1 )
       <not_focusable> = not_focusable
    endif
  endif
  edit_skater_info_add_item {
    text = 'NAME:'
    pad_choose_script = launch_onscreen_keyboard_from_edit_skater
    pad_choose_params = { field = "" text = <display_name> title = 'NAME' min_length = 1 max_length = 15 text_to_change = name }
    focus_params = { top_row }
    unfocus_params = { top_row }
    tab = tab2
    top_row
    item_value_text = <info_name>
    not_focusable = <not_focusable>
  }
  if ( <is_locked> = 1 )
    if not GotParam no_bg
       <not_focusable> = not_focusable
    endif
  endif
  edit_skater_info_add_item {
    text = 'HOMETOWN:'
    pad_choose_script = launch_onscreen_keyboard_from_edit_skater
    pad_choose_params = { field = "" text = <hometown> title = 'HOMETOWN' min_length = 1 max_length = 15 text_to_change = town }
    focus_params = { top_row }
    unfocus_params = { top_row }
    tab = tab2
    top_row
    item_value_text = <info_town>
    not_focusable = <not_focusable>
  }
  edit_skater_info_add_item {
    text = 'AGE:'
    pad_choose_script = nullscript
    pad_right_script = edit_skater_info_change
    pad_left_script = edit_skater_info_change
    pad_right_params = { change_age }
    pad_left_params = { change_age left }
    tab = tab2
    item_value_text = <info_age>
    not_focusable = <not_focusable>
  }
  edit_skater_info_add_item {
    text = 'SEX:'
    item_id = skater_sex_value
    pad_choose_script = nullscript
    pad_right_script = edit_skater_info_change
    pad_left_script = edit_skater_info_change
    pad_right_params = { change_is_male }
    pad_left_params = { change_is_male }
    tab = tab2
    item_value_text = <info_sex>
    not_focusable = <not_focusable>
  }
  edit_skater_info_add_item {
    text = 'STANCE:'
    pad_choose_script = nullscript
    pad_right_script = edit_skater_info_change
    pad_left_script = edit_skater_info_change
    pad_right_params = { change_stance }
    pad_left_params = { change_stance }
    tab = tab2
    item_value_text = <info_stance>
    not_focusable = <not_focusable>
  }
  edit_skater_info_add_item {
    text = 'PUSH:'
    pad_choose_script = nullscript
    pad_right_script = edit_skater_info_change
    pad_left_script = edit_skater_info_change
    pad_right_params = { change_push }
    pad_left_params = { change_push left }
    tab = tab2
    item_value_text = <info_push>
    wide_arrows
    not_focusable = <not_focusable>
  }
  edit_skater_info_add_item {
    text = 'TRICKS:'
    pad_choose_script = nullscript
    pad_right_script = edit_skater_info_change
    pad_left_script = edit_skater_info_change
    pad_right_params = { change_trickstyle }
    pad_left_params = { change_trickstyle }
    tab = tab2
    item_value_text = <info_style>
    narrow_arrows
    not_focusable = <not_focusable>
  }
  edit_skater_info_add_item {
    text = 'DONE'
    pad_choose_script = edit_skater_create_main_menu
    focus_params = { no_bg }
    unfocus_params = { no_bg }
    tab = tab2
    no_bg
  }
  if GotParam cam_anim
    KillSkaterCamAnim all
    PlaySkaterCamAnim name = <cam_anim> play_hold
  endif
  if not GotParam from_level_1
    FireEvent type = focus target = current_menu data = { grid_index = edit_skater_menu_level_2_index }
  else
    FireEvent type = focus target = current_menu
  endif
endscript
script launch_onscreen_keyboard_from_edit_skater
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if ( <is_pro> = 1 )
    if ( <is_locked> = 1 )
      return
    endif
  endif
  DestroyScreenElement id = current_menu_anchor
  Wait 1 frame
  remove_edit_skater_textures_from_vram
  create_onscreen_keyboard {
    pos = (220, 240)
    helper_pos = (420, 440)
    text = <text>
    keyboard_title = <title>
    min_length = <min_length>
    max_length = <max_length>
    text_to_change = <text_to_change>
    keyboard_done_script = exit_onscreen_keyboard_from_edit_skater
    keyboard_cancel_script = exit_onscreen_keyboard_from_edit_skater
    allow_cancel
  }
endscript
script exit_onscreen_keyboard_from_edit_skater
  GetTextElementString id = keyboard_current_string
  GetCurrentSkaterProfileIndex
  switch <text_to_change>
  case name
    SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { display_name = <string> }
    check_for_neversoft_skaters name = <string>
  case town
    SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { hometown = <string> }
  endswitch
  destroy_onscreen_keyboard
  add_edit_skater_textures_to_vram
  create_edit_skater_menu
  edit_skater_info_menu
endscript
script edit_skater_info_change
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  GetTags
  if ( <is_locked> = 1 )
    return
  endif
  if GotParam change_age
    if GotParam left
      if not ( <age> > 1 )
        return
      endif
      age = ( <age> - 1 )
    else
      if not ( 99 > <age> )
        return
      endif
      age = ( <age> + 1 )
    endif
    FormatText TextName = info_age "%a" a = <age>
    SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { age = <age> }
    SetScreenElementProps { id = { <id> child = 2 } text = <info_age> }
  endif
  if GotParam change_is_male
    confirm_skater_sexchange is_male = <is_male>
  endif
  if GotParam change_stance
    switch <stance>
    case regular
      SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { stance = goofy }
      RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
      SetScreenElementProps { id = { <id> child = 2 } text = "Goofy" }
    case goofy
      SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { stance = regular }
      RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
      SetScreenElementProps { id = { <id> child = 2 } text = "Regular" }
    endswitch
  endif
  if GotParam change_trickstyle
    switch <trickstyle>
    case street
      SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { trickstyle = vert }
      SetScreenElementProps { id = { <id> child = 2 } text = "Vert" }
    case vert
      SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { trickstyle = street }
      SetScreenElementProps { id = { <id> child = 2 } text = "Street" }
    endswitch
  endif
  if GotParam change_push
    if GotParam left
      switch <pushstyle>
      case mongo_when_switch
        SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { pushstyle = never_mongo }
        SetScreenElementProps { id = { <id> child = 2 } text = "Never Mongo" }
      case never_mongo
        SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { pushstyle = always_mongo }
        SetScreenElementProps { id = { <id> child = 2 } text = "Always Mongo" }
      case always_mongo
        SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { pushstyle = mongo_when_switch }
        SetScreenElementProps { id = { <id> child = 2 } text = "Mongo Switch" }
      endswitch
    else
      switch <pushstyle>
      case mongo_when_switch
        SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { pushstyle = always_mongo }
        SetScreenElementProps { id = { <id> child = 2 } text = "Always Mongo" }
      case never_mongo
        SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { pushstyle = mongo_when_switch }
        SetScreenElementProps { id = { <id> child = 2 } text = "Mongo Switch" }
      case always_mongo
        SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = { pushstyle = never_mongo }
        SetScreenElementProps { id = { <id> child = 2 } text = "Never Mongo" }
      endswitch
    endif
    RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
  endif
  generic_menu_scroll_sideways_sound
endscript
script confirm_skater_sexchange
  if ObjectExists id = current_menu_anchor
    DestroyScreenElement id = current_menu_anchor
  endif
  perform_skater_sexchange
endscript
script cancel_skater_sexchange
  edit_skater_info_menu
  FireEvent type = unfocus target = edit_skater_info_vmenu
  FireEvent type = focus target = edit_skater_info_vmenu data = { child_id = skater_sex_value }
endscript
script perform_skater_sexchange
  edit_skater_info_menu
  FireEvent type = unfocus target = edit_skater_info_vmenu
  FireEvent type = focus target = edit_skater_info_vmenu data = { child_id = skater_sex_value }
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  switch <is_male>
  case 0
    cas_apply_sex apply_male = 1
    SetScreenElementProps { id = { skater_sex_value child = 2 } text = "Male" }
  case 1
    cas_apply_sex apply_male = 0
    SetScreenElementProps { id = { skater_sex_value child = 2 } text = "Female" }
  endswitch
  if LevelIs load_skateshop
    MakeSkaterGoto SkateshopAI params = { NoSFX CAS_Screen }
  endif
endscript
script edit_skater_create_cas_menu
  edit_skater_create_menu_block tab_texture = tab3 middle_texture = repeat_piece3 bottom_texture = menu_bottom
   <pad_back_params> = { options_array = <options_array> cam_anim = <cam_anim> should_add_reset_tattoos = <should_add_reset_tattoos> should_add_reset_scaling = <should_add_reset_scaling> }
  if GotParam cam_anim_sub
    KillSkaterCamAnim all
    PlaySkaterCamAnim name = <cam_anim_sub> play_hold
  endif
  if GotParam parent_index
    Change edit_skater_menu_level_2_index = <parent_index>
  endif
  edit_skater_create_scrolling_menu tab = tab3 pad_back_script = edit_skater_create_options_menu pad_back_params = <pad_back_params>
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  GetArraySize master_editable_list
   <master_size> = <array_size>
   <index> = 0
   <current_submenu> = <submenu>
  begin
    RemoveParameter flags
    RemoveParameter preview_menu
    RemoveParameter colormenu
    RemoveParameter submenu
    AddParams ( master_editable_list [ <index> ] )
     <shouldDisplayList> = 0
    if ( <is_male> = 1 )
      if GotParam male
         <shouldDisplayList> = ( <male> = 1 )
      endif
    else
      if GotParam female
         <shouldDisplayList> = ( <female> = 1 )
      endif
    endif
    if GotParam submenu
      if ( <submenu> = <current_submenu> )
        if not ( <shouldDisplayList> = 0 )
          GetArraySize <part>
           <part_index> = 0
          begin
            edit_skater_possibly_add_cas_item {
              ( <part> [ <part_index> ] )
              part = <part>
              desc_id = <desc_id>
              flags = <flags>
              index = <index>
            }
             <part_index> = ( <part_index> + 1 )
          repeat <array_size>
        endif
      endif
    endif
    if GotParam colormenu
      if ( <colormenu> = <current_submenu> )
        if not ( <shouldDisplayList> = 0 )
          if ScreenElementExists id = edit_skater_menu_up_arrow
            DoScreenElementMorph {
              id = edit_skater_menu_up_arrow
              scale = 0
              relative_scale
            }
          endif
          if ScreenElementExists id = edit_skater_menu_down_arrow
            DoScreenElementMorph {
              id = edit_skater_menu_down_arrow
              scale = 0
              relative_scale
            }
          endif
          colormenu_add_options_to_menu part = <part> from_cas
        endif
      endif
    endif
     <index> = ( <index> + 1 )
  repeat <master_size>
  if GotParam should_add_scaling_options
    scalingmenu_add_options_to_menu part = <bone_group> <scaling_params>
  endif
  edit_skater_menu_add_item {
    text = 'Done'
    tab = tab3
    pad_choose_script = edit_skater_create_options_menu
    pad_choose_params = {
      options_array = <options_array>
      cam_anim = <cam_anim>
      should_add_reset_tattoos = <should_add_reset_tattoos>
      should_add_reset_scaling = <should_add_reset_scaling>
    }
  }
  FireEvent type = focus target = current_menu
endscript
script edit_skater_create_secret_gear_menu
  edit_skater_create_menu_block tab_texture = tab2 middle_texture = repeat_piece2 bottom_texture = menu_bottom
  if ( in_secrets_menu = 1 )
    pad_back_script = edit_skater_menu_exit
    pad_back_params = { to_secrets }
  else
    pad_back_script = edit_skater_create_main_menu
  endif
  if GotParam parent_index
    Change edit_skater_menu_level_1_index = <parent_index>
  endif
  edit_skater_create_scrolling_menu {
    tab = tab2
    pad_back_script = <pad_back_script>
    pad_back_params = <pad_back_params>
  }
  GetArraySize edit_skater_secret_gear
   <part_index> = 0
  begin
    price = ( ( edit_skater_secret_gear [ <part_index> ] ).price )
    desc_id = ( ( edit_skater_secret_gear [ <part_index> ] ).desc_id )
    part = ( ( edit_skater_secret_gear [ <part_index> ] ).part )
    flag = ( ( edit_skater_secret_gear [ <part_index> ] ).flag )
    text = ( ( edit_skater_secret_gear [ <part_index> ] ).text )
    if StructureContains structure = ( edit_skater_secret_gear [ <part_index> ] ) male_ok
      male_ok = 1
    endif
    if StructureContains structure = ( edit_skater_secret_gear [ <part_index> ] ) female_ok
      female_ok = 1
    endif
    edit_skater_menu_add_secret_item {
      text = <text>
      part = <part>
      desc_id = <desc_id>
      flag = <flag>
      price = <price>
      male_ok = <male_ok>
      female_ok = <female_ok>
    }
     <part_index> = ( <part_index> + 1 )
    RemoveParameter male_ok
    RemoveParameter female_ok
  repeat <array_size>
  edit_skater_menu_add_item {
    text = 'Done'
    pad_choose_script = <pad_back_script>
    pad_choose_params = <pad_back_params>
    tab = tab2
  }
  GoalManager_GetCash
  FormatText TextName = cash_text "Cash: $%i" i = <cash>
  GetStackedScreenElementPos X id = edit_skater_anchor_middle offset = (-565, 395)
  CreateScreenElement {
    type = SpriteElement
    parent = edit_skater_anchor_middle
    id = done_bg_box
    texture = black
    z_priority = 0
    scale = (50, 5)
    pos = <pos>
    just = [ left top ]
    rgba = [ 0 0 0 110 ]
    not_focusable
  }
  GetStackedScreenElementPos X id = done_bg_box offset = (-195, 2)
  CreateScreenElement {
    type = SpriteElement
    parent = edit_skater_anchor_middle
    texture = black
    z_priority = 1
    scale = (48, 4)
    pos = <pos>
    just = [ left top ]
    rgba = [ 128 128 128 13 ]
    not_focusable
  }
  GetStackedScreenElementPos X id = done_bg_box offset = (-100, 2)
  CreateScreenElement {
    type = TextElement
    parent = edit_skater_anchor_middle
    text = <cash_text>
    scale = 0.8
    z_priority = 2
    font = small
    pos = <pos>
    just = [ center top ]
    rgba = [ 127 102 0 128 ]
    not_focusable
  }
  FireEvent type = focus target = current_menu
endscript
script edit_skater_create_scrolling_menu
  switch <tab>
  case tab2
     <menu_offset> = (134, 25)
     <up_arrow_offset> = (119, -5)
     <down_arrow_offset> = (119, -15)
  case tab3
     <menu_offset> = (143, 25)
     <up_arrow_offset> = (127, -5)
     <down_arrow_offset> = (127, -15)
  default
     <menu_offset> = (135, 25)
     <up_arrow_offset> = (120, -5)
     <down_arrow_offset> = (120, -15)
  endswitch
  GetStackedScreenElementPos Y id = edit_skater_menu_tab offset = <up_arrow_offset>
  CreateScreenElement {
    type = SpriteElement
    parent = edit_skater_anchor_middle
    id = edit_skater_menu_up_arrow
    texture = up_arrow
    pos = <pos>
    just = [ left top ]
    z_priority = 5
  }
  GetStackedScreenElementPos Y id = edit_skater_menu_block_bottom offset = <down_arrow_offset>
  CreateScreenElement {
    type = SpriteElement
    parent = edit_skater_anchor_middle
    id = edit_skater_menu_down_arrow
    texture = down_arrow
    pos = <pos>
    just = [ left bottom ]
    z_priority = 5
  }
  GetStackedScreenElementPos Y id = edit_skater_menu_tab offset = <menu_offset>
  CreateScreenElement {
    type = VScrollingMenu
    parent = edit_skater_anchor_middle
    id = edit_skater_scrollingmenu
    dims = (256, 184)
    pos = <pos>
    just = [ left top ]
  }
  CreateScreenElement {
    type = VMenu
    parent = edit_skater_scrollingmenu
    id = edit_skater_vmenu
    just = [ left top ]
    padding_scale = <padding_scale>
    spacing_between = <spacing_between>
    event_handlers = [ { pad_up set_which_arrow params = { arrow = edit_skater_menu_up_arrow } }
      { pad_down set_which_arrow params = { arrow = edit_skater_menu_down_arrow } }
      { pad_up generic_menu_up_or_down_sound params = { Up } }
      { pad_down generic_menu_up_or_down_sound params = { Down } }
      { pad_back generic_menu_pad_back_sound }
      { pad_back <pad_back_script> params = <pad_back_params> }
    ]
  }
  if LevelIs load_skateshop
    SetScreenElementProps {
      id = edit_skater_vmenu
      event_handlers = [ { pad_l1 skateshop_rotate_skater_left }
        { pad_r1 skateshop_rotate_skater_right }
      ]
      replace_handlers
    }
  endif
  AssignAlias id = edit_skater_vmenu alias = current_menu
endscript
script get_current_skater_wheel_color_menu_name
   <wheel_color_menu_name> = 'Wheel Color'
  GetCurrentSkaterProfileIndex
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = board
    GetActualCASOptionStruct part = board desc_id = <desc_id>
    if GotParam wheel_color_string
      wheel_color_menu_name = <wheel_color_string>
    endif
  endif
  return wheel_color_menu_name = <wheel_color_menu_name>
endscript
script get_current_skater_griptape_menu_enabled
   <retVal> = 1
  GetCurrentSkaterProfileIndex
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = board
    GetActualCASOptionStruct part = board desc_id = <desc_id>
    if GotParam no_griptape
       <retVal> = 0
    endif
  endif
  return griptape_menu_enabled = <retVal>
endscript


script get_current_skater_wheel_menu_enabled
   <retVal> = 1
  GetCurrentSkaterProfileIndex
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = board
    GetActualCASOptionStruct part = board desc_id = <desc_id>
    if GotParam no_wheels
       <retVal> = 0
    endif
  endif
  return wheels_menu_enabled = <retVal>
endscript

script get_current_skater_deck_menu_enabled
   <retVal> = 1
  GetCurrentSkaterProfileIndex
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = board
    GetActualCASOptionStruct part = board desc_id = <desc_id>
    if GotParam no_deck
       <retVal> = 0
    endif
  endif
  return decks_menu_enabled = <retVal>
endscript


script get_current_skater_use_jets
   <retVal> = 0
  GetCurrentSkaterProfileIndex
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = board
    GetActualCASOptionStruct part = board desc_id = <desc_id>
    if GotParam use_jets
       <retVal> = 1
    endif
  endif
  return use_jets = <retVal>
endscript
script get_current_skater_name
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  return name = <name>
endscript
script get_current_skater_sponsors
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  return sponsors = <sponsors>
endscript
script get_skater_unlocked
  GetSkaterProfileInfoByName name = <name>
  if ( <is_hidden> = 0 )
    return is_unlocked = 1
  else
    return is_unlocked = 0
  endif
endscript
script get_is_neversoft_skater
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if ( <is_pro> = 1 )
    return is_neversoft_skater = 0
  else
    return is_neversoft_skater = <is_head_locked>
  endif
endscript
script get_has_weird_hat
   <retVal> = 0
  GetCurrentSkaterProfileIndex
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = hat
    GetActualCASOptionStruct part = hat desc_id = <desc_id>
    if GotParam is_weird_hat
       <retVal> = 1
    endif
  endif
  return has_weird_hat = <retVal>
endscript
script get_has_weird_head
   <retVal> = 0
  GetCurrentSkaterProfileIndex
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_m_head
    GetActualCASOptionStruct part = skater_m_head desc_id = <desc_id>
    if GotParam is_weird_head
       <retVal> = 1
    endif
  endif
  return has_weird_head = <retVal>
endscript
script cas_item_is_visible
   <is_visible> = 1
  if GotParam hidden
     <is_visible> = 0
  endif
  if GotParam only_with
    get_current_skater_name
    GetArraySize <only_with>
     <index> = 0
     <is_visible> = 0
    begin
      if ChecksumEquals a = <name> b = ( <only_with> [ <index> ] )
         <is_visible> = 1
      endif
       <index> = ( <index> + 1 )
    repeat <array_size>
  endif
  if GotParam unlock_flag
     <is_visible> = 0
    if GetGlobalFlag flag = <unlock_flag>
       <is_visible> = 1
       <secret_color> = secret_color
    endif
  endif
  if GotParam sponsor
    get_current_skater_sponsors
    if GotParam sponsors
      GetArraySize <sponsors>
      if ( <array_size> = 0 )
      else
         <is_visible> = 0
         <index> = 0
        begin
          if ChecksumEquals a = <sponsor> b = ( <sponsors> [ <index> ] )
             <is_visible> = 1
          endif
           <index> = ( <index> + 1 )
        repeat <array_size>
      endif
    endif
  endif
  if GotParam only_if_unlocked
     <is_visible> = 0
    get_skater_unlocked name = <only_if_unlocked>
    if ( <is_unlocked> = 1 )
       <is_visible> = 1
    endif
  endif
  if GotParam only_with_neversoft_skater
     <is_visible> = 0
    get_is_neversoft_skater
    if ( <is_neversoft_skater> = 1 )
       <is_visible> = 1
    endif
  endif
  if GotParam not_with_weird_head
    get_has_weird_head
    if ( <has_weird_head> = 1 )
       <is_visible> = 0
    endif
  endif
  if GotParam not_with_weird_hat
    get_has_weird_hat
    if ( <has_weird_hat> = 1 )
       <is_visible> = 0
    endif
  endif
  if IsTrue worst_case_cas_debug
     <is_visible> = 1
  endif
  return is_visible = <is_visible> secret_color = <secret_color>
endscript
script edit_skater_possibly_add_cas_item
  cas_item_is_visible <...>
  if GotParam secret_color
     <rgba> = [ 32 32 255 128 ]
    focus_params = { rgba = [ 32 32 255 255 ] }
    unfocus_params = { rgba = [ 32 32 255 128 ] }
  endif
  if ( <is_visible> = 1 )
    if not GotParam frontend_desc
       <frontend_desc> = 'Unknown'
    endif
    edit_skater_menu_add_item {
      text = <frontend_desc>
      tab = tab3
      pad_choose_script = cas_add_item
      pad_choose_params = { part = <part> desc_id = <desc_id> }
      focus_script = <focus_script>
      focus_params = <focus_params>
      unfocus_script = <unfocus_script>
      unfocus_params = <unfocus_params>
      index = <index>
      is_visible_script = check_if_item_accessible
      is_visible_params = { part = <part> desc_id = <desc_id> }
      rgba = <rgba>
    }
    return cas_item_was_added = 1
  endif
endscript
script edit_skater_menu_add_item { pad_choose_script = edit_skater_create_cas_menu
    focus_script = edit_skater_menu_focus
    unfocus_script = edit_skater_menu_unfocus
    tab = tab1
    font = small
    icon_rgba = [ 127 102 0 128 ]
    icon_scale = 0
    icon_pos = (22, 9)
    text_just = [ center center ]
    text_pos = (0, 0)
    rgba = [ 88 105 112 128 ]
  }
  if GotParam is_visible_script
     <is_visible_script> <is_visible_params>
    if ( <is_enabled> = 0 )
      return
    endif
  endif
  if GotParam is_enabled_script
     <is_enabled_script> <is_enabled_params>
    if ( <is_enabled> = 0 )
      AddParams not_focusable = not_focusable
    endif
  endif
  switch <tab>
  case tab1
     <bar_scale> = (0.92, 1.2)
  case tab2
     <bar_scale> = (0.85, 1.2)
  case tab3
     <bar_scale> = (0.78, 1.2)
     <font> = dialog
  endswitch
  SetScreenElementLock id = current_menu off
  if not GotParam pad_choose_params
     <pad_choose_params> = <...>
  endif
  if GotParam index
    if GotParam pad_choose_params
       <pad_choose_params> = ( <pad_choose_params> + { parent_index = <index> cam_anim = <cam_anim> } )
    else
       <pad_choose_params> = { parent_index = <index> cam_anim = <cam_anim> }
    endif
  endif
  CreateScreenElement {
    type = TextElement
    parent = current_menu
    font = small
    text = " "
    event_handlers = [ { focus <focus_script> params = <focus_params> }
      { unfocus <unfocus_script> params = <unfocus_params> }
      { pad_choose generic_menu_pad_choose_sound }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_start <pad_choose_script> params = <pad_choose_params> }
    ]
     <not_focusable>
  }
   <parent_id> = <id>
  if GotParam index
    SetScreenElementProps {
      id = <parent_id>
      tags = { tag_grid_x = <index> }
    }
  endif
  if GotParam not_focusable
     <rgba> = [ 60 60 60 85 ]
  else
  endif
  CreateScreenElement {
    type = TextElement
    parent = <parent_id>
    font = <font>
    text = <text>
    scale = 0.9
    rgba = <rgba>
    just = <text_just>
    pos = <text_pos>
    replace_handlers
     <not_focusable>
  }
  CreateScreenElement {
    type = SpriteElement
    parent = <parent_id>
    pos = (-4, 0)
    scale = <bar_scale>
    texture = highlight_bar
    rgba = [ 128 128 128 0 ]
  }
  if GotParam child_texture
    CreateScreenElement {
      type = SpriteElement
      parent = <id>
      texture = <child_texture>
      pos = <icon_pos>
      rgba = <icon_rgba>
      scale = <icon_scale>
      id = <icon_id>
    }
  endif
  SetScreenElementLock id = current_menu on
endscript
script edit_skater_menu_add_secret_item { pad_choose_script = buy_secret_cas_item
    focus_script = secret_gear_focus
    unfocus_script = secret_gear_unfocus
    tab = tab2
    font = small
    icon_rgba = [ 127 102 0 128 ]
    icon_scale = 0
    icon_pos = (22, 9)
    text_just = [ center center ]
    text_pos = (-100, 0)
    rgba = [ 88 105 112 128 ]
  }
  if GotParam is_enabled_script
     <is_enabled_script> <is_enabled_params>
    if ( <is_enabled> = 0 )
      AddParams not_focusable = not_focusable
    endif
  endif
  switch <tab>
  case tab1
     <bar_scale> = (0.92, 1.2)
  case tab2
     <bar_scale> = (0.85, 1.2)
  case tab3
     <bar_scale> = (0.78, 1.2)
     <font> = dialog
  endswitch
  SetScreenElementLock id = current_menu off
   <pad_choose_params> = <...>
  if ( GetGlobalFlag flag = <flag> )
     <rgba> = [ 26 85 37 128 ]
    focus_params = { bought }
    unfocus_params = { bought }
  else
     <rgba> = [ 88 105 112 128 ]
  endif
  CreateScreenElement {
    type = TextElement
    parent = current_menu
    font = small
    text = " "
    event_handlers = [ { focus <focus_script> params = <focus_params> }
      { unfocus <unfocus_script> params = <unfocus_params> }
      { pad_choose generic_menu_pad_choose_sound }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_start <pad_choose_script> params = <pad_choose_params> }
    ]
     <not_focusable>
  }
   <parent_id> = <id>
  CreateScreenElement {
    type = TextElement
    parent = <parent_id>
    font = <font>
    text = <text>
    scale = 0.9
    rgba = <rgba>
    just = [ left center ]
    pos = <text_pos>
    replace_handlers
     <not_focusable>
  }
  FormatText TextName = price_string "$%p" p = <price>
  CreateScreenElement {
    type = TextElement
    parent = <parent_id>
    font = <font>
    text = <price_string>
    scale = 0.9
    rgba = <rgba>
    just = [ right center ]
    pos = ( <text_pos> + (200, 0) )
    replace_handlers
     <not_focusable>
  }
  if ( GetGlobalFlag flag = <flag> )
    CreateScreenElement {
      type = SpriteElement
      parent = <parent_id>
      texture = goal_line
      pos = (-105, -2)
      just = [ left center ]
      rgba = <rgba>
      scale = (6.5, 0.4)
      z_priority = 10
    }
  endif
  SetScreenElementLock id = current_menu on
endscript
script buy_secret_cas_item
  pad_choose_script = launch_secret_gear
  if not ( GetGlobalFlag flag = <flag> )
    secret_can_buy_item { <...> secret_gear }
  else
    Printf "you already bought that!"
  endif
endscript
script add_secret_item_to_cas
  GetActualCASOptionStruct part = <part> desc_id = <desc_id>
  cas_item_is_visible <...>
  Printf "trying to add_secret_item_to_cas"
  PrintStruct <...>
  if ( <is_visible> = 1 )
    Printf "cas_add_item on %d" d = <desc_id>
    cas_add_item <...>
  else
    Printf "item %d is disqualified" d = <desc_id>
  endif
endscript
script secret_gear_focus highlight_bar_scale = (0.85, 1.1) highlight_bar_pos = (-112, -10) text_rgba = [ 128 118 0 128 ]
  GetTags
  SetScreenElementLock id = <id> off
  if ( GotParam bought )
     <text_rgba> = [ 26 85 37 128 ]
  endif
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = <text_rgba> }
  RunScriptOnScreenElement id = { <id> child = 1 } do_scale_up params = { rgba = <text_rgba> }
  if ObjectExists id = edit_tricks_menu_highlight_bar
    DestroyScreenElement id = edit_tricks_menu_highlight_bar
  endif
  CreateScreenElement {
    type = SpriteElement
    parent = <id>
    id = edit_tricks_menu_highlight_bar
    texture = highlight_bar
    rgba = [ 128 128 128 50 ]
    pos = <highlight_bar_pos>
    just = [ left top ]
    scale = <highlight_bar_scale>
    z_priority = 4
  }
  generic_menu_update_arrows {
    up_arrow_id = edit_skater_menu_up_arrow
    down_arrow_id = edit_skater_menu_down_arrow
  }
  edit_skater_vmenu:GetTags
  if GotParam arrow_id
    menu_vert_blink_arrow { id = <arrow_id> }
  endif
endscript
script secret_gear_unfocus text_rgba = [ 88 105 112 128 ]
  GetTags
  generic_menu_pad_up_down_sound
  KillSpawnedScript name = do_random_effect
  if ( GotParam bought )
     <text_rgba> = [ 26 85 37 128 ]
  endif
  if ObjectExists id = edit_tricks_menu_highlight_bar
    DestroyScreenElement id = edit_tricks_menu_highlight_bar
  endif
  SetScreenElementProps id = { <id> child = 0 } rgba = <text_rgba>
  SetScreenElementProps id = { <id> child = 1 } rgba = <text_rgba>
endscript
script edit_skater_info_add_item { pad_choose_script = nullscript
    pad_right_script = nullscript
    pad_left_script = nullscript
    focus_script = edit_skater_info_focus
    unfocus_script = edit_skater_info_unfocus
    tab = tab2
    font = small
    text_just = [ left center ]
    text_pos = (5, 7)
  }
   <bar_scale> = (1.71, 1.15)
  SetScreenElementLock id = current_menu off
  CreateScreenElement {
    type = ContainerElement
    parent = current_menu
    id = <item_id>
    event_handlers = [ { focus <focus_script> params = <focus_params> }
      { unfocus <unfocus_script> params = <unfocus_params> }
      { pad_choose <pad_choose_script> params = <pad_choose_params> }
      { pad_start <pad_choose_script> params = <pad_choose_params> }
      { pad_right <pad_right_script> params = <pad_right_params> }
      { pad_left <pad_left_script> params = <pad_left_params> }
    ]
    dims = (300, 30)
     <not_focusable>
  }
   <parent_id> = <id>
  if GotParam index
    SetScreenElementProps {
      id = <parent_id>
      tags = { tag_grid_x = <index> }
    }
  endif
   <rgba> = [ 88 105 112 128 ]
  if GotParam top_row
    text_pos = ( <text_pos> + (0, -12) )
    SetScreenElementProps { id = <parent_id>
      event_handlers = [ { pad_choose generic_menu_pad_choose_sound }
        { pad_choose <pad_choose_script> params = <pad_choose_params> } ]
    } replace_handlers
  endif
  if GotParam no_bg
    text_pos = ( <text_pos> + (0, -9) )
    SetScreenElementProps { id = <parent_id>
      event_handlers = [ { pad_choose generic_menu_pad_choose_sound }
        { pad_choose <pad_choose_script> params = <pad_choose_params> } ]
    } replace_handlers
  endif
  CreateScreenElement {
    type = TextElement
    parent = <parent_id>
    font = <font>
    text = <text>
    scale = 0.75
    rgba = <rgba>
    just = <text_just>
    pos = ( <text_pos> + (-55, 0) )
    replace_handlers
     <not_focusable>
  }
  if not GotParam no_bg
    CreateScreenElement {
      type = SpriteElement
      parent = <parent_id>
      pos = (47, 0)
      scale = <bar_scale>
      texture = edit_bar
      rgba = [ 128 128 128 20 ]
      z_priority = 4
    }
    if GotParam top_row
      CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        font = dialog
        text = <item_value_text>
        scale = 0.8
        rgba = <rgba>
        just = [ center center ]
        pos = ( <text_pos> + (40, 13) )
        not_focusable = not_focusable
      }
      truncate_string id = <id> max_width = 200
    else
      CreateScreenElement {
        type = TextElement
        parent = <parent_id>
        font = dialog
        text = <item_value_text>
        scale = 0.8
        rgba = <rgba>
        just = [ center center ]
        pos = ( <text_pos> + (76, 0) )
        not_focusable = not_focusable
      }
      left_arrow_pos = (40, 6)
      right_arrow_pos = (124, 6)
      if GotParam wide_arrows
         <left_arrow_pos> = ( <left_arrow_pos> - (29, 0) )
         <right_arrow_pos> = ( <right_arrow_pos> + (25, 0) )
      endif
      if GotParam narrow_arrows
         <left_arrow_pos> = ( <left_arrow_pos> + (0, 0) )
         <right_arrow_pos> = ( <right_arrow_pos> - (0, 0) )
      endif
      CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        pos = <left_arrow_pos>
        scale = (0.6, 0.6)
        texture = left_arrow
        rgba = [ 128 128 128 0 ]
      }
      CreateScreenElement {
        type = SpriteElement
        parent = <parent_id>
        pos = <right_arrow_pos>
        scale = (0.6, 0.6)
        texture = right_arrow
        rgba = [ 128 128 128 0 ]
      }
    endif
  endif
endscript
script edit_skater_create_menu_block tab_texture = tab1 middle_texture = repeat_piece bottom_texture = menu_bottom
  if ObjectExists id = edit_skater_anchor_middle
    DestroyScreenElement id = edit_skater_anchor_middle
  endif
  CreateScreenElement {
    type = ContainerElement
    parent = edit_skater_anchor
    id = edit_skater_anchor_middle
    pos = (320, 230)
    dims = (640, 480)
  }
  edit_skater_menu_create_tab texture = <tab_texture>
   <id> = edit_skater_menu_tab
  begin
    GetStackedScreenElementPos Y id = <id>
    CreateScreenElement {
      parent = edit_skater_anchor_middle
      type = SpriteElement
      texture = <middle_texture>
      rgba = [ 128 128 128 100 ]
      scale = (0.95, 1)
      pos = <pos>
      just = [ left top ]
    }
  repeat 7
  GetStackedScreenElementPos Y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = edit_skater_anchor_middle
    id = edit_skater_menu_block_bottom
    texture = <bottom_texture>
    scale = (0.95, 1)
    rgba = [ 128 128 128 100 ]
    pos = <pos>
    just = [ left top ]
  }
endscript
script edit_skater_menu_create_tab
  GetStackedScreenElementPos Y id = select_skater_mainbar offset = (0, 20)
  CreateScreenElement {
    parent = edit_skater_anchor_middle
    type = SpriteElement
    id = edit_skater_menu_tab
    texture = <texture>
    scale = (0.95, 1)
    rgba = [ 128 128 128 100 ]
    pos = <pos>
    just = [ left top ]
  }
endscript
script edit_skater_menu_exit
  Change edit_skater_menu_level_1_index = 0
  Change edit_skater_menu_level_2_index = 0
  if ObjectExists id = edit_skater_anchor
    DestroyScreenElement id = edit_skater_anchor
    Wait 1 frame
  endif
  remove_edit_skater_textures_from_vram
  add_pause_menu_textures_to_vram
  MakeSkaterGoto SkateshopAI params = { }
  if GotParam to_secrets
    create_secrets_menu
  else
    if LevelIs load_skateshop
      if IsTrue came_to_cas_menu_from_main_menu
        create_pre_cas_menu
      else
        skater:Obj_MoveToNode name = TRG_SS_SkaterChoosing orient
        launch_ss_menu
      endif
    else
      GoalManager_ShowPoints
      if not GoalManager_HasActiveGoals
        GoalManager_ShowGoalPoints
      endif
      create_options_menu
    endif
  endif
endscript
script edit_skater_menu_focus_with_icon rgba = [ 128 128 128 50 ]
  GetTags
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = <rgba>
  }
  RunScriptOnScreenElement id = { <id> child = { 1 child = 0 } } edit_skater_show_icon
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = [ 128 118 0 128 ] }
endscript
script edit_skater_menu_unfocus_with_icon rgba = [ 128 128 128 0 ]
  GetTags
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = <rgba>
  }
  RunScriptOnScreenElement id = { <id> child = { 1 child = 0 } } edit_skater_hide_icon
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down
endscript
script edit_skater_show_icon
  DoMorph scale = (1.3, 1) time = 0.1
endscript
script edit_skater_hide_icon
  DoMorph scale = 0
endscript
script edit_skater_menu_focus rgba = [ 128 118 0 128 ]
  GetTags
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = [ 128 128 128 50 ]
  }
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_up params = { rgba = <rgba> }
  generic_menu_update_arrows {
    up_arrow_id = edit_skater_menu_up_arrow
    down_arrow_id = edit_skater_menu_down_arrow
  }
  edit_skater_vmenu:GetTags
  if GotParam arrow_id
    menu_vert_blink_arrow { id = <arrow_id> }
  endif
endscript
script edit_skater_menu_unfocus
  GetTags
  SetScreenElementProps {
    id = { <id> child = 1 }
    rgba = [ 128 128 128 0 ]
  }
  RunScriptOnScreenElement id = { <id> child = 0 } do_scale_down params = { rgba = <rgba> }
endscript
script edit_skater_info_focus rgba = [ 128 98 0 50 ]
  GetTags
  if not GotParam no_bg
    SetScreenElementProps { id = { <id> child = 1 } rgba = <rgba> }
    SetScreenElementProps { id = { <id> child = 2 } rgba = [ 125 123 7 128 ] }
    SetScreenElementProps { id = { <id> child = 0 } rgba = [ 128 98 0 128 ] }
    if not GotParam top_row
      SetScreenElementProps { id = { <id> child = 3 } rgba = [ 128 118 0 128 ] }
      SetScreenElementProps { id = { <id> child = 4 } rgba = [ 128 118 0 128 ] }
    endif
  else
    SetScreenElementProps { id = { <id> child = 0 } rgba = [ 128 118 0 128 ] }
  endif
endscript
script edit_skater_info_unfocus rgba = [ 128 128 128 20 ]
  GetTags
  if not GotParam no_bg
    SetScreenElementProps { id = { <id> child = 1 } rgba = <rgba> }
    SetScreenElementProps { id = { <id> child = 2 } rgba = [ 88 105 112 128 ] }
    if not GotParam top_row
      SetScreenElementProps { id = { <id> child = 3 } rgba = [ 128 118 0 0 ] }
      SetScreenElementProps { id = { <id> child = 4 } rgba = [ 128 118 0 0 ] }
    endif
  endif
  SetScreenElementProps { id = { <id> child = 0 } rgba = [ 88 105 112 128 ] }
endscript
script set_which_arrow
  SetTags arrow_id = <arrow>
endscript
script menu_vert_blink_arrow menu_id = current_menu
  if not ObjectExists id = <id>
    Printf "bad arrow id"
    return
  endif
  TerminateObjectsScripts id = <id>
  DoScreenElementMorph {
    id = <id>
    alpha = 1
  }
  Wait 1 gameframe
  if not ( ( MenuSelectedIndexIs id = <menu_id> first ) or ( MenuSelectedIndexIs id = <menu_id> last ) )
    SetScreenElementProps { id = <id> rgba = [ 128 128 128 128 ] }
    RunScriptOnScreenElement id = <id> menu_blink_arrow
  endif
endscript
script draw_menu_box {
  delta_pos = (100, 30)
  middle_repeat = 7
  scale = (1, 1)
  box_right_scale = (0.8, 0.625)
  box_bottom_scale = (0.96, 1)
  box_right_offset = (-20, 0)
  current_menu_anchor = current_menu_anchor
}
  GetStackedScreenElementPos X id = <current_menu_anchor>
  CreateScreenElement {
    type = SpriteElement
    parent = <current_menu_anchor>
    id = menu_box_top
    texture = level_top_piece
    pos = ( (230, 100) + <delta_pos> )
    rgba = [ 128 128 128 80 ]
    scale = <scale>
    just = [ center top ]
    z_priority = 0
  }
  begin
    GetStackedScreenElementPos Y id = <id>
    CreateScreenElement {
      type = SpriteElement
      parent = <current_menu_anchor>
      texture = level_repeat_mid
      pos = <pos>
      scale = <scale>
      rgba = [ 128 128 128 80 ]
      just = [ left top ]
      z_priority = 0
    }
  repeat <middle_repeat>
  GetStackedScreenElementPos Y id = <id>
  CreateScreenElement {
    type = SpriteElement
    parent = <current_menu_anchor>
    texture = level_bottom_piece
    pos = <pos>
    rgba = [ 128 128 128 80 ]
    scale = <box_bottom_scale>
    just = [ left top ]
    z_priority = 0
  }
  GetStackedScreenElementPos X id = menu_box_top offset = <box_right_offset>
  CreateScreenElement {
    type = SpriteElement
    parent = <current_menu_anchor>
    texture = goal_right
    scale = <box_right_scale>
    rgba = [ 128 128 128 80 ]
    pos = <pos>
    just = [ left top ]
    z_priority = 0
  }
endscript
script add_edit_skater_textures_to_vram
  AddTextureToVram "longbar"
  AddTextureToVram "longbar_edgy"
  AddTextureToVram "longbar_cap"
  AddTextureToVram "mainbar"
  AddTextureToVram "mainbar_join"
  AddTextureToVram "up_arrow"
  AddTextureToVram "tab1"
  AddTextureToVram "tab2"
  AddTextureToVram "tab3"
  AddTextureToVram "repeat_piece"
  AddTextureToVram "repeat_piece2"
  AddTextureToVram "repeat_piece3"
  AddTextureToVram "menu_bottom"
  AddTextureToVram "down_arrow"
  AddTextureToVram "colorbar"
  AddTextureToVram "bw_slider"
  AddTextureToVram "scalebar"
  AddTextureToVram "scale_down"
  AddTextureToVram "scale_up"
  AddTextureToVram "edit_bar"
  AddTextureToVram "left_arrow"
  AddTextureToVram "right_arrow"
  AddTextureToVram "goal_line"
  AddTextureToVram "ED_board"
  AddTextureToVram "ED_head"
  AddTextureToVram "ED_info"
  AddTextureToVram "ED_legs"
  AddTextureToVram "ED_pads"
  AddTextureToVram "ED_resize"
  AddTextureToVram "ED_secret"
  AddTextureToVram "ED_scale"
  AddTextureToVram "ED_tat"
  AddTextureToVram "ED_torso"
endscript
script remove_edit_skater_textures_from_vram
  RemoveTextureFromVram "longbar"
  RemoveTextureFromVram "longbar_edgy"
  RemoveTextureFromVram "longbar_cap"
  RemoveTextureFromVram "mainbar"
  RemoveTextureFromVram "mainbar_join"
  RemoveTextureFromVram "up_arrow"
  RemoveTextureFromVram "tab1"
  RemoveTextureFromVram "tab2"
  RemoveTextureFromVram "tab3"
  RemoveTextureFromVram "repeat_piece"
  RemoveTextureFromVram "repeat_piece2"
  RemoveTextureFromVram "repeat_piece3"
  RemoveTextureFromVram "menu_bottom"
  RemoveTextureFromVram "down_arrow"
  RemoveTextureFromVram "colorbar"
  RemoveTextureFromVram "bw_slider"
  RemoveTextureFromVram "scale_down"
  RemoveTextureFromVram "scale_up"
  RemoveTextureFromVram "edit_bar"
  RemoveTextureFromVram "left_arrow"
  RemoveTextureFromVram "right_arrow"
  RemoveTextureFromVram "goal_line"
  RemoveTextureFromVram "scalebar"
  RemoveTextureFromVram "ED_board"
  RemoveTextureFromVram "ED_head"
  RemoveTextureFromVram "ED_info"
  RemoveTextureFromVram "ED_legs"
  RemoveTextureFromVram "ED_pads"
  RemoveTextureFromVram "ED_resize"
  RemoveTextureFromVram "ED_secret"
  RemoveTextureFromVram "ED_scale"
  RemoveTextureFromVram "ED_tat"
  RemoveTextureFromVram "ED_torso"
endscript
script currently_editing_pro
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if GotParam is_pro
    return is_enabled = ( <is_pro> = 1 )
  else
    return is_enabled = 0
  endif
endscript
script currently_editing_custom_or_eddie
   <retVal> = 0
  currently_editing_custom
  if ( <is_enabled> = 1 )
     <retVal> = 1
  else
    GetCurrentSkaterProfileIndex
    GetSkaterProfileInfo player = <currentSkaterProfileIndex>
    if ( <name> = eddie )
       <retVal> = 1
    endif
  endif
  return is_enabled = <retVal>
endscript
script currently_editing_custom
  currently_editing_pro
  if ( <is_enabled> = 0 )
    return is_enabled = 1
  else
    return is_enabled = 0
  endif
endscript
script currently_editing_female
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if GotParam is_male
    return is_enabled = ( <is_male> = 0 )
  else
    return is_enabled = 0
  endif
endscript
script currently_editing_male
  currently_editing_female
  if ( <is_enabled> = 0 )
    return is_enabled = 1
  else
    return is_enabled = 0
  endif
endscript
script currently_editing_custom_male
  currently_editing_female
  if ( <is_enabled> = 1 )
    return is_enabled = 0
  else
    currently_editing_pro
    if ( <is_enabled> = 1 )
      return is_enabled = 0
    else
      return is_enabled = 1
    endif
  endif
endscript
script get_current_skater_get_lockout_parts
  GetCurrentSkaterProfileIndex
  GetSkaterProfileInfo player = <currentSkaterProfileIndex>
  if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part>
    GetActualCASOptionStruct part = <part> desc_id = <desc_id>
    if GotParam lockout_parts
      return lockout_parts = <lockout_parts>
    endif
  endif
endscript
script check_for_shoe_flags
  if GotParam group
    get_current_skater_get_lockout_parts part = shoes
    PrintStruct <...>
    if GotParam lockout_parts
      GetArraySize <lockout_parts>
       <index> = 0
      begin
        Printf "testing %s %t" s = <group> t = ( <lockout_parts> [ <index> ] )
        if ( <group> = ( <lockout_parts> [ <index> ] ) )
          Printf "unenabled item %s" s = <group>
          return is_enabled = 0
        endif
         <index> = ( <index> + 1 )
      repeat <array_size>
    endif
  endif
  Printf "enabled item %s" s = <group>
  return is_enabled = 1
endscript
script check_for_head_flags
  if GotParam group
    get_current_skater_get_lockout_parts part = skater_m_head
    if GotParam lockout_parts
      GetArraySize <lockout_parts>
       <index> = 0
      begin
        if ( <group> = ( <lockout_parts> [ <index> ] ) )
          Printf "unenabled item %s" s = <group>
          return is_enabled = 0
        endif
         <index> = ( <index> + 1 )
      repeat <array_size>
    endif
  endif
  Printf "enabled item %s" s = <group>
  return is_enabled = 1
endscript
edit_skater_head_options = [
  {
    text = 'Face'
    submenu = face_menu
    is_visible_script = currently_editing_custom
    is_enabled_script = check_if_group_editable_and_head_is_unlocked
    is_enabled_params = { group = head_items }
  }
  {
    text = 'Hair'
    submenu = hair_menu
    is_visible_script = currently_editing_custom_or_eddie
    is_visible_script2 = check_for_head_flags
    is_visible_params2 = { group = hair_items }
    is_enabled_script = check_if_group_editable
    is_enabled_params = { group = hair_items }
  }
  {
    text = 'Hair Color'
    submenu = hair_color_menu
    is_visible_script = currently_editing_custom_or_eddie
    is_visible_params = { group = hair_items }
    is_visible_script2 = check_for_head_flags
    is_visible_params2 = { group = hair_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ skater_m_hair skater_f_hair ] }
  }
  {
    text = 'Facial Hair'
    submenu = jaw_menu
    is_visible_script = currently_editing_custom_male
    is_visible_params = { group = facial_hair_items }
    is_visible_script2 = check_for_head_flags
    is_visible_params2 = { group = facial_hair_items }
  }
  {
    text = 'Facial Hair Color'
    submenu = facial_hair_color_menu
    is_visible_script = currently_editing_custom_male
    is_visible_params = { group = facial_hair_items }
    is_visible_script2 = check_for_head_flags
    is_visible_params2 = { group = facial_hair_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ skater_m_jaw ] }
  }
  {
    text = 'Hats'
    submenu = hats_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = hat_items }
    is_visible_script2 = check_for_head_flags
    is_visible_params2 = { group = hat_items }
  }
  {
    text = 'Hat Color'
    submenu = hat_color_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = hat_items }
    is_visible_script2 = check_for_head_flags
    is_visible_params2 = { group = hat_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ hat ] }
  }
  {
    text = 'Hat Logo'
    submenu = hat_logo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = hat_items }
    is_visible_script2 = check_for_head_flags
    is_visible_params2 = { group = hat_items }
    is_enabled_script = check_if_part_logoable
    is_enabled_params = { parts = [ hat ] }
  }
  {
    text = 'Glasses'
    submenu = glasses_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = glasses_items }
    is_visible_script2 = check_for_head_flags
    is_visible_params2 = { group = glasses_items }
    is_enabled_script = check_if_group_editable
    is_enabled_params = { parts = [ Glasses ] }
  }
  {
    text = 'Glasses Color'
    submenu = glasses_color_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = glasses_items }
    is_visible_script2 = check_for_head_flags
    is_visible_params2 = { group = glasses_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ Glasses ] }
  }
]
edit_skater_torso_options = [
  {
    text = 'Shirt Style'
    submenu = shirt_style_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = torso_items }
  }
  {
    text = 'Shirt Color'
    submenu = shirt_color_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = torso_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] }
  }
  {
    text = 'Front Logo'
    submenu = front_logo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = torso_items }
    is_enabled_script = check_if_part_logoable
    is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] }
  }
  {
    text = 'Back Logo'
    submenu = back_logo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = torso_items }
    is_enabled_script = check_if_part_back_logoable
    is_enabled_params = { parts = [ skater_m_torso skater_f_torso ] }
  }
  {
    text = 'Backpack'
    submenu = backpack_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = backpack_items }
  }
  {
    text = 'Pack Color'
    submenu = pack_color_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = backpack_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ skater_m_backpack skater_f_backpack ] }
  }
  {
    text = 'Accessories'
    submenu = accessories_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = accessories_items }
  }
  {
    text = 'Accessories Color'
    submenu = accessories_color_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = accessories_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ accessories ] }
  }
]
edit_skater_leg_options = [
  {
    text = 'Pants'
    submenu = pants_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = legs_items }
  }
  {
    text = 'Pants Color'
    submenu = pants_color_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = legs_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ skater_m_legs skater_f_legs ] }
    group = legs_items
  }
  {
    text = 'Socks'
    submenu = socks_menu
    cam_anim_sub = SS_Appearance_Feet
    is_visible_script = check_if_group_editable
    is_visible_params = { group = socks_items }
    is_visible_script2 = check_for_shoe_flags
    is_visible_params2 = { group = socks_items }
  }
  {
    text = 'Socks Color'
    submenu = socks_color_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = socks_items }
    is_visible_script2 = check_for_shoe_flags
    is_visible_params2 = { group = socks_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ skater_m_socks skater_f_socks ] }
    cam_anim_sub = SS_Appearance_Feet
  }
  {
    text = 'Shoes'
    submenu = shoes_menu
    cam_anim_sub = SS_Appearance_Feet
    is_visible_script = check_if_group_editable
    is_visible_params = { group = shoes_items }
  }
  {
    text = 'Shoe Color'
    submenu = shoe_color_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = shoes_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ shoes ] }
    cam_anim_sub = SS_Appearance_Feet
  }
]
edit_skater_tattoo_options = [
  {
    text = 'Head Tattoo'
    submenu = head_tattoo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = tattoo_items }
    cam_anim_sub = SS_Appearance_Face
  }
  {
    text = 'Chest Tattoo'
    submenu = chest_tattoo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = tattoo_items }
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'Back Tattoo'
    submenu = back_tattoo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = tattoo_items }
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'L Bicep Tattoo'
    submenu = left_bicep_tattoo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = tattoo_items }
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'L Forearm Tattoo'
    submenu = left_forearm_tattoo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = tattoo_items }
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'R Bicep Tattoo'
    submenu = right_bicep_tattoo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = tattoo_items }
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'R Forearm Tattoo'
    submenu = right_forearm_tattoo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = tattoo_items }
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'L Leg Tattoo'
    submenu = left_leg_tattoo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = tattoo_items }
    cam_anim_sub = SS_Appearance_Feet
  }
  {
    text = 'R Leg Tattoo'
    submenu = right_leg_tattoo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = tattoo_items }
    cam_anim_sub = SS_Appearance_Feet
  }
]
edit_skater_scaling_options = skateshop_scaling_options
edit_skater_pad_options = [
  {
    text = 'Helmet'
    submenu = helmet_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = helmet_items }
    cam_anim_sub = SS_Appearance_Face
  }
  {
    text = 'Helmet Color'
    submenu = helmet_color_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = helmet_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ helmet ] }
    cam_anim_sub = SS_Appearance_Face
  }
  {
    text = 'Helmet Logo'
    submenu = helmet_logo_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = helmet_items }
    is_enabled_script = check_if_part_logoable
    is_enabled_params = { parts = [ helmet ] }
    cam_anim_sub = SS_Appearance_Face
  }
  {
    text = 'Elbowpads'
    submenu = elbowpads_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = elbowpads_items }
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'Elbowpads Color'
    submenu = elbowpads_color_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = elbowpads_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ skater_m_elbowpads skater_f_elbowpads ] }
    cam_anim_sub = SS_Appearance_Torso
  }
  {
    text = 'Kneepads'
    submenu = kneepads_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = kneepads_items }
    cam_anim_sub = SS_Appearance_Legs
  }
  {
    text = 'Kneepads Color'
    submenu = kneepads_color_menu
    is_visible_script = check_if_group_editable
    is_visible_params = { group = kneepads_items }
    is_enabled_script = check_if_part_colorable
    is_enabled_params = { parts = [ skater_m_kneepads skater_f_kneepads ] }
    cam_anim_sub = SS_Appearance_Legs
  }
]
edit_skater_secret_gear = [
  { text = 'O.D. Head' price = 400 flag = CAS_UNLOCK_02 desc_id = #"Officer Dick" part = skater_m_head male_ok = 1 }
  { text = 'Ollie Head' price = 400 flag = CAS_UNLOCK_03 desc_id = Ollie part = skater_m_head male_ok = 1 }
  { text = 'Kenny Head' price = 400 flag = CAS_UNLOCK_04 desc_id = Kenny part = skater_m_head male_ok = 1 }
  { text = 'Metal Head' price = 300 flag = CAS_UNLOCK_05 desc_id = #"Metal Head" part = skater_m_head male_ok = 1 }
  { text = 'Clown Head' price = 300 flag = CAS_UNLOCK_06 desc_id = Clown part = skater_m_head male_ok = 1 }
  { text = 'Eraser Hair' price = 250 flag = CAS_UNLOCK_07 desc_id = #"Eraser Head" part = skater_m_hair male_ok = 1 }
  { text = 'Clown Hair' price = 250 flag = CAS_UNLOCK_08 desc_id = #"Clown Hair" part = skater_m_hair male_ok = 1 }
  { text = 'Paper Bag' price = 300 flag = CAS_UNLOCK_09 desc_id = #"Paper Bag" part = hat male_ok = 1 female_ok = 1 }
  { text = 'King Glasses' price = 100 flag = CAS_UNLOCK_10 desc_id = #"King Glasses" part = Glasses male_ok = 1 female_ok = 1 }
  { text = 'O.D. Shirt' price = 250 flag = CAS_UNLOCK_11 desc_id = #"Officer Dick Shirt" part = skater_m_torso male_ok = 1 }
  { text = 'Ollie Coat' price = 250 flag = CAS_UNLOCK_12 desc_id = #"Ollie Coat" part = skater_m_torso male_ok = 1 }
  { text = 'Kilt' price = 250 flag = CAS_UNLOCK_13 desc_id = Kilt part = skater_m_legs male_ok = 1 }
  { text = 'Smile Boxers' price = 150 flag = CAS_UNLOCK_14 desc_id = #"Boxer Shorts" part = skater_m_legs male_ok = 1 }
  { text = 'Heart Boxers' price = 150 flag = CAS_UNLOCK_15 desc_id = #"Heart Boxers" part = skater_m_legs male_ok = 1 }
  { text = 'Ollie Pants' price = 250 flag = CAS_UNLOCK_16 desc_id = #"Ollie Pants" part = skater_m_legs male_ok = 1 }
  { text = 'Clown Pants' price = 250 flag = CAS_UNLOCK_17 desc_id = #"Clown Pants" part = skater_m_legs male_ok = 1 }
  { text = 'Clown Boots' price = 150 flag = CAS_UNLOCK_18 desc_id = #"Clown Boots" part = shoes male_ok = 1 female_ok = 1 }
]
script launch_park_editor
  SetGameType freeskate
  SetCurrentGameType
  SetParkName ""
  BindParkEditorToController <device_num>
  GetCurrentSkaterProfileIndex
  BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <device_num>
  BindFrontEndToController front_end_pad = <currentSkaterProfileIndex> controller = <device_num>
  main_menu_play_level level = load_Sk4Ed
endscript
script main_menu_play_level
  main_menu_exit new_menu_script = main_menu_play_level2 <...>
endscript
script main_menu_play_level2
  restore_start_key_binding
  change_level level = <level>
endscript
script leave_front_end
  remove_pause_menu_textures_from_vram
endscript
script spawn_two_player
  Cleanup preserve_skaters
  LeaveServer
  InitSkaterHeaps
  SetServerMode
  StartServer
  SetJoinMode JOIN_MODE_PLAY
  JoinServer
  Printf "------------------------- 1"
  begin
    if JoinServerComplete
      Printf "------------------------- 2"
      break
    else
      Printf "------------------------- 3"
      Wait 1
    endif
  repeat
  Printf "------------------------- 4"
  ScreenElementSystemCleanup
endscript
script launch_two_player
  SetCurrentSkaterProfile 0
  RefreshSkaterModel profile = 0 skater = 0
  SetMenuPadMappings [ active
    use_as_first
  ]
  SpawnScript spawn_two_player NotSessionSpecific = 1
endscript
script enable_two_player_option
  if ObjectExists id = main_menu_2_player_option
    main_menu_2_player_option:GetTags
    if GotParam tag_not_focusable
      main_vmenu:GetTags
      if GotParam tag_selected_id
        if ( <tag_selected_id> = main_menu_2_player_option )
          SetScreenElementProps {
            id = { main_menu_2_player_option child = 0 }
            rgba = [ 127 123 0 100 ]
            z_priority = 4
            focusable
          }
        else
          SetScreenElementProps {
            id = { main_menu_2_player_option child = 0 }
            rgba = [ 88 105 112 128 ]
            focusable
          }
        endif
        SetScreenElementProps {
          id = main_menu_2_player_option
          focusable
        }
      endif
    endif
  endif
endscript
script disable_two_player_option
  if ObjectExists id = main_menu_2_player_option
    main_menu_2_player_option:GetTags
    if not GotParam tag_not_focusable
      main_vmenu:GetTags
      if GotParam tag_selected_id
        if ( <tag_selected_id> = main_menu_2_player_option )
          FireEvent type = pad_up target = current_menu
        endif
      endif
      SetScreenElementProps {
        id = { main_menu_2_player_option child = 0 }
        rgba = [ 60 60 60 75 ]
        not_focusable
      }
      SetScreenElementProps {
        id = main_menu_2_player_option
        not_focusable
      }
    endif
  endif
endscript
script enable_system_link_option
  if ObjectExists id = mm_multi_play
    mm_multi_play:GetTags
    if GotParam tag_not_focusable
      main_vmenu:GetTags
      if GotParam tag_selected_id
        if ( <tag_selected_id> = mm_multi_play )
          SetScreenElementProps {
            id = { mm_multi_play child = 0 }
            rgba = [ 127 123 0 100 ]
            z_priority = 4
            focusable
          }
        else
          SetScreenElementProps {
            id = { mm_multi_play child = 0 }
            rgba = [ 88 105 112 128 ]
            focusable
          }
        endif
        SetScreenElementProps {
          id = mm_multi_play
          focusable
        }
      endif
    endif
  endif
endscript
script disable_system_link_option
  if ObjectExists id = mm_multi_play
    mm_multi_play:GetTags
    if not GotParam tag_not_focusable
      main_vmenu:GetTags
      if GotParam tag_selected_id
        if ( <tag_selected_id> = mm_multi_play )
          FireEvent type = pad_up target = current_menu
        endif
      endif
      SetScreenElementProps {
        id = { mm_multi_play child = 0 }
        rgba = [ 60 60 60 75 ]
        not_focusable
      }
      SetScreenElementProps {
        id = mm_multi_play
        not_focusable
      }
    endif
  endif
endscript
attract_mode_movies = [
  "movies\demo_1"
  "movies\demo_2"
  "movies\demo_3"
]
