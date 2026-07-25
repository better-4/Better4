
SpecialTricks =
[
  { Trigger = { TripleInOrder Up right Square 400 } TrickSlot = SpAir_U_R_Square }
  { Trigger = { TripleInOrder Up Down Square 400 } TrickSlot = SpAir_U_D_Square }
  { Trigger = { TripleInOrder Up left Square 400 } TrickSlot = SpAir_U_L_Square }
  { Trigger = { TripleInOrder right Up Square 400 } TrickSlot = SpAir_R_U_Square }
  { Trigger = { TripleInOrder right Down Square 400 } TrickSlot = SpAir_R_D_Square }
  { Trigger = { TripleInOrder right left Square 400 } TrickSlot = SpAir_R_L_Square }
  { Trigger = { TripleInOrder Down Up Square 400 } TrickSlot = SpAir_D_U_Square }
  { Trigger = { TripleInOrder Down right Square 400 } TrickSlot = SpAir_D_R_Square }
  { Trigger = { TripleInOrder Down left Square 400 } TrickSlot = SpAir_D_L_Square }
  { Trigger = { TripleInOrder left Up Square 400 } TrickSlot = SpAir_L_U_Square }
  { Trigger = { TripleInOrder left right Square 400 } TrickSlot = SpAir_L_R_Square }
  { Trigger = { TripleInOrder left Down Square 400 } TrickSlot = SpAir_L_D_Square }
  { Trigger = { TripleInOrder Up right Circle 400 } TrickSlot = SpAir_U_R_Circle }
  { Trigger = { TripleInOrder Up Down Circle 400 } TrickSlot = SpAir_U_D_Circle }
  { Trigger = { TripleInOrder Up left Circle 400 } TrickSlot = SpAir_U_L_Circle }
  { Trigger = { TripleInOrder right Up Circle 400 } TrickSlot = SpAir_R_U_Circle }
  { Trigger = { TripleInOrder right Down Circle 400 } TrickSlot = SpAir_R_D_Circle }
  { Trigger = { TripleInOrder right left Circle 400 } TrickSlot = SpAir_R_L_Circle }
  { Trigger = { TripleInOrder Down Up Circle 400 } TrickSlot = SpAir_D_U_Circle }
  { Trigger = { TripleInOrder Down right Circle 400 } TrickSlot = SpAir_D_R_Circle }
  { Trigger = { TripleInOrder Down left Circle 400 } TrickSlot = SpAir_D_L_Circle }
  { Trigger = { TripleInOrder left Up Circle 400 } TrickSlot = SpAir_L_U_Circle }
  { Trigger = { TripleInOrder left right Circle 400 } TrickSlot = SpAir_L_R_Circle }
  { Trigger = { TripleInOrder left Down Circle 400 } TrickSlot = SpAir_L_D_Circle }
]
GRABTWEAK_SMALL = 15
GRABTWEAK_MEDIUM = 20
GRABTWEAK_LARGE = 25
GRABTWEAK_EXTRALARGE = 40
GRABTWEAK_SPECIAL = 30
Trick_BloodyEddie = { Scr = GrabTrick params = { name = 'Bloody Eddie' Score = 1300 Anim = BloodyEddie_Init skater = eddie Idle = BloodyEddie_Idle OutAnim = BloodyEddie_Out speed = 1.2 Bloodframe = 45 SpecialItem_details = bloodyguts_details GutsSound IsSpecial } }
Trick_Sunbathin = { Scr = GrabTrick params = { name = 'Sunbathing' Score = 1000 skater = JENNA Anim = Sunbathin_Init Idle = Sunbathin_Idle BackwardsAnim = Sunbathin_Init speed = 1.0 IsSpecial } }
Trick_Flamingo = { Scr = GrabTrick params = { name = 'Flamingo' Score = 1000 skater = Vallely Anim = Flamingo_Init Idle = Flamingo_Idle OutAnim = Flamingo_Out speed = 1.2 IsSpecial } }
Trick_StageDive = { Scr = GrabTrick params = { name = 'Stage Dive!' Score = 1000 skater = eddie Anim = StageDive_Init Idle = StageDive_Idle OutAnim = StageDive_Out Stream = StageDive speed = 1.0 IsSpecial } }
Trick_JumpJets = { Scr = GrabTrick params = { name = 'Jango Jump Jet' Score = 500 OnlyWith skater = JANGO Anim = JangoJumpJet_init Idle = JangoJumpJet_idle BackwardsAnim = JangoJumpJet_init ForceInit JumpJets Stream = JangoJetpack Emitscript = Jango_Jumpjet_emit IsSpecial speed = 1.0 } }
Trick_GrappleGrab = { Scr = GrabTrick params = { name = 'Grapple Grab' Score = 1200 skater = JANGO Anim = GrappleGrab_init Idle = GrappleGrab_idle OutAnim = GrappleGrab_Out ForceInit IsSpecial speed = 1.5 Stream = GrappleGrab SpecialItem_details = GrappleHook_details } }
Trick_SambaFlip = { Scr = GrabTrick params = { name = 'Samba Flip' Score = 1400 Anim = SambaFlip Idle = Indy_Idle BackwardsAnim = Indy ForceInit IsSpecial speed = 1.2 } }
Trick_360VarialMcTwist = { Scr = FlipTrick params = { name = '360 Varial McTwist' Score = 5000 Anim = _360VarialMcTwist BoardRotate IsSpecial RevertBS NoSpin trickslack = 10 RotateAfter speed = 1.0 MaxSpeed = 1.1 Spinslack = 20 } }
Trick_BarrelRoll = { Scr = FlipTrick params = { name = 'Barrel Roll' Score = 5000 Anim = BarrelRoll IsSpecial NoSpin trickslack = 10 BoardRotate speed = 1.0 MaxSpeed = 1.1 Spinslack = 10 } }
Trick_Bodywrap540 = { Scr = FlipTrick params = { name = 'Bodywrap 540' Score = 4500 Anim = Bodywrap540 BoardRotate IsSpecial trickslack = 10 RevertBS RotateAfter NoSpin speed = 1.0 MaxSpeed = 1.1 Spinslack = 20 } }
Trick_Indy900 = { Scr = FlipTrick params = { name = 'Indy 900' Score = 11000 Anim = Indy900 IsSpecial BoardRotate trickslack = 20 RotateAfter NoSpin speed = 1.2 MaxSpeed = 1.3 } }
Trick_SitDownAir = { Scr = GrabTrick params = { name = 'Sit Down Air' Score = 1200 Anim = SitDownAir_Init Idle = SitDownAir_Idle IsSpecial WaitPercent = 80 } }
Trick_ChompOnThis = { Scr = GrabTrick params = { name = 'Chomp On This' Score = 1000 Anim = ChompOnThis_Init Idle = ChompOnThis_Idle OutAnim = ChompOnThis_Out IsSpecial MaxSpeed = 0.9 ForceInit Stream = ChompOnThis SpecialItem_details = PizzaBox_details speed = 0.9 } }
Trick_GhettoBird = { Scr = FlipTrick params = { name = '360 Ghetto Bird' Score = 3500 Anim = GhettoBird2 IsSpecial BoardRotate trickslack = 20 NoSpin speed = 1.0 } }
Trick_BackFootNosegrab = { Scr = GrabTrick params = { name = 'Backfoot Flip Nosegrab' Score = 1200 Anim = BackFootNosegrab_init Idle = BackFootNosegrab_idle OutAnim = BackFootNosegrab_Out ForceInit IsSpecial speed = 1.0 } }
Trick_MightAsWellJump = { Scr = GrabTrick params = { name = 'Might As Well Jump' speed = 1.75 Score = 1750 Anim = MightAsWellJump_Init Idle = MightAsWellJump_Idle OutAnim = MightAsWellJump_Out IsSpecial ForceInit SpecialSounds = Jamie_JumpSounds SpecialItem_details = bustedboard_jump_details trickslack = 20 } }
Trick_BigSpinShifty = { Scr = GrabTrick params = { name = 'BigSpin Shifty' Score = 1500 speed = 1.2 Anim = FSBigSpinShifty_Init Idle = FSBigSpinShifty_Idle OutAnim = FSBigSpinShifty_Out IsSpecial ForceInit FlipAfter } }
Trick_The900 = { Scr = FlipTrick params = { name = 'The 900' Score = 9000 Anim = The900 IsSpecial BoardRotate trickslack = 20 RotateAfter NoSpin speed = 1.3 MaxSpeed = 1.4 } }
Trick_KFBackflip = { Scr = FlipTrick params = { name = 'Kickflip Backflip' Score = 3000 Anim = KickFlipBodyBackFlip IsSpecial speed = 1.0 NoSpin trickslack = 15 Spinslack = 25 } }
Trick_StaleFrontFlip = { Scr = FlipTrick params = { name = 'Stalefish FrontFlip' Score = 4500 Anim = StalefishFrontFlip IsSpecial speed = 1.1 NoSpin trickslack = 15 Spinslack = 30 } }
Trick_StaleBackFlip = { Scr = FlipTrick params = { name = 'Stalefish BackFlip' Score = 4500 Anim = StalefishBackFlip IsSpecial speed = 1.1 NoSpin trickslack = 15 Spinslack = 30 } }
Trick_MistyFlip = { Scr = FlipTrick params = { name = 'Misty Flip' Score = 5000 Anim = MistyFlip IsSpecial speed = 1.2 NoSpin trickslack = 15 Spinslack = 30 } }
Trick_FS540HeelFlip = { Scr = FlipTrick params = { name = 'FS 540 HeelFlip' Score = 4500 Anim = FS540HeelFlip BoardRotate IsSpecial speed = 1.2 RevertBS RotateAfter NoSpin trickslack = 15 Spinslack = 20 } }
Trick_FS540 = { Scr = FlipTrick params = { name = 'FS 540' Score = 4500 Anim = FS540 BoardRotate IsSpecial trickslack = 10 RevertBS RotateAfter NoSpin speed = 1.0 Spinslack = 40 } }
Trick_McTwist = { Scr = FlipTrick params = { name = 'McTwist' Score = 5000 Anim = McTwist BoardRotate IsSpecial RevertBS NoSpin trickslack = 10 RotateAfter speed = 1.0 MaxSpeed = 1.1 Spinslack = 20 } }
Trick_JudoMadonna = { Scr = GrabTrick params = { name = 'Judo Madonna' Score = 1600 Anim = JudoMadonna_Init Idle = Madonna_Idle BackwardsAnim = Madonna IsSpecial ForceInit trickslack = 10 } }
Trick_KFSuperman = { Scr = GrabTrick params = { name = 'Kickflip Superman' Score = 1500 Anim = KFSupermanGrab_Init Idle = KFSupermanGrab_Range OutAnim = KFSupermanGrab_Out IsSpecial ForceInit } }
Trick_2KickMadonnaFlip = { Scr = GrabTrick params = { name = 'Double Kickflip Madonna' Score = 1750 Anim = _2KickMadonnaFlip_Init Idle = Madonna_Idle OutAnim = _2KickMadonnaFlip_Out IsSpecial ForceInit trickslack = 15 speed = 1.15 } }
Trick_AssumePosition = { Scr = GrabTrick params = { name = 'Assume The Position II' Score = 1000 Anim = AssumePosition_Init Idle = AssumePosition_Idle IsSpecial speed = 0.8 ForceInit trickslack = 10 } }
Trick_AirCasperFlip = { Scr = GrabTrick params = { name = 'Casper Flip 360 Flip' Score = 2500 Anim = AirCasperFlip_Init Idle = AirCasperFlip_Idle OutAnim = AirCasperFlip_Out IsSpecial speed = 1.1 ForceInit trickslack = 20 } }
Trick_KickFlipOneFootTail = { Scr = GrabTrick params = { name = 'Kickflip One Foot Tail' Score = 1100 Anim = KickFlipOneFootTail_Init Idle = KickFlipOneFootTail_Range OutAnim = KickFlipOneFootTail_Out IsSpecial ForceInit trickslack = 15 } }
Trick_HeelFlipHandflip = { Scr = FlipTrick params = { name = 'Heelflip Handflip' speed = 0.9 Score = 1200 Anim = HeelflipHandflip MaxSpeed = 1.1 IsSpecial trickslack = 20 } }
Trick_540TailWhip = { Scr = FlipTrick params = { name = '540 TailWhip' Score = 2000 Anim = _540TailWhip IsSpecial BoardRotate speed = 1.1 MaxSpeed = 1.2 trickslack = 15 } }
Trick_Gazelle = { Scr = FlipTrick params = { name = 'Gazelle Underflip' Score = 3500 Anim = GazelleUnderflip IsSpecial BoardRotate trickslack = 20 NoSpin } }
HIGHSPEED = 1.0
Trick_SemiFlip = { Scr = FlipTrick params = { name = 'Semi Flip' Score = 1450 Anim = SemiFlip BoardRotate IsSpecial speed = 1.1 trickslack = 20 } }
Trick_FingerFlipAirWalk = { Scr = FlipTrick params = { name = 'Fingerflip Airwalk' Score = 1500 Anim = FingerFlipAirWalk IsSpecial BoardRotate speed = 1.15 trickslack = 30 } }
Trick_Jackass = { Scr = FlipTrick params = { name = 'The Jackass' Score = 1500 Anim = Jackass IsSpecial speed = 1 MaxSpeed = 1.2 trickslack = 20 Bloodframe = 1 } }
Trick_1234 = { Scr = FlipTrick params = { name = '1-2-3-4' Score = 1400 Anim = _1234 IsSpecial speed = 0.8 trickslack = 20 } }
Trick_DoubleKFindy = { Scr = FlipTrick params = { name = 'Double Kickflip Varial Indy' Score = 1100 Anim = DoubleKFVarialIndy MaxSpeed = 1.2 trickslack = 20 IsSpecial BoardRotate } }
Trick_540Flip = { Scr = FlipTrick params = { name = '540 Flip' Score = 1450 Anim = _540flip BoardRotate IsSpecial speed = 1.1 MaxSpeed = 1.2 trickslack = 20 } }
Trick_BetweenLegsSlam = { Scr = FlipTrick params = { name = 'Slamma Jamma' Score = 1750 Anim = BetweenLegsSlam IsSpecial trickslack = 20 speed = 1.0 } }
Trick_NollieFlipUnderflip = { Scr = FlipTrick params = { name = 'Nollie Flip Underflip' Score = 1050 Anim = NollieFlipUnderFlip IsSpecial trickslack = 10 speed = 1.0 MaxSpeed = 1.3 } }
Trick_HardFlipBackFootFlip = { Scr = FlipTrick params = { name = 'Hardflip Late Flip' Score = 1500 Anim = HardFlipBackFootFlip IsSpecial trickslack = 15 speed = 1.0 BoardRotate } }
Trick_KickFlipUnderFlip = { Scr = FlipTrick params = { name = 'Kickflip Underflip' Score = 1000 Anim = KickFlipUnderFlip IsSpecial trickslack = 10 MaxSpeed = 1.3 speed = 1.0 } }
Trick_QuadrupleHeelFlip = { Scr = FlipTrick params = { name = 'Quad Heelflip' Score = 1200 Anim = QuadrupleHeelFlip IsSpecial speed = 1.0 } }
Trick_VarialKickflip = { Scr = FlipTrick params = { name = 'Varial Kickflip' Score = 300 Anim = VarialKickflip BoardRotate Nollie = NollieVarialKickflip ExtraTricks = Extra_VarialKickflip } }
Extra_VarialKickflip = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = '360 Flip' Score = 500 Anim = _360Flip Nollie = Nollie360Flip IsExtra UseCurrent } } ]
Trick_VarialHeelflip = { Scr = FlipTrick params = { name = 'Varial Heelflip' Score = 300 Anim = VarialHeelflip BoardRotate Nollie = NollieVarialHeelflip ExtraTricks = Extra_VarialHeelflip } }
Extra_VarialHeelflip = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = '360 Heelflip' Score = 500 Anim = laserflip speed = 1.3 trickslack = 20 IsExtra UseCurrent } } ]
Trick_Hardflip = { Scr = FlipTrick params = { name = 'Hardflip' Score = 300 Anim = Hardflip BoardRotate Nollie = NollieHardflip ExtraTricks = Extra_360Hardflip } }
Extra_360Hardflip = [ { Trigger_Extra_Flip params = { name = '360 Hardflip' Score = 500 Anim = _360Hardflip IsExtra trickslack = 20 speed = 1.1 UseCurrent } } ]
Trick_InwardHeelflip = { Scr = FlipTrick params = { name = 'Inward Heelflip' Score = 350 Anim = InwardHeelflip BoardRotate Nollie = NollieInwardFlip trickslack = 15 ExtraTricks = Extra_360InwardHeelflip } }
Extra_360InwardHeelflip = [ { Trigger_Extra_Flip params = { name = '360 Inward Heelflip' Score = 500 Anim = _360InwardHeelFlip IsExtra trickslack = 15 speed = 1.0 UseCurrent } } ]
Trick_Impossible = { Scr = FlipTrick params = { name = 'Impossible' Score = 100 Anim = Impossible Nollie = NollieImpossible ExtraTricks = DoubleImpossible } }
DoubleImpossible = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = 'Double Impossible' Score = 500 Anim = DoubleImpossible ExtraTricks = TripleImpossible trickslack = 15 speed = 1.2 IsExtra UseCurrent } } ]
TripleImpossible = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = 'Triple Impossible' Score = 1000 Anim = TripleImpossible IsExtra UseCurrent speed = 1.2 trickslack = 15 } } ]
Trick_PopShoveIt = { Scr = FlipTrick params = { name = 'Pop Shove-It' Score = 100 Anim = PopShoveIt BoardRotate Nollie = NollieBSShoveIt ExtraTricks = Extra360ShoveIt SnapFix } }
Extra360ShoveIt = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = '360 Shove-It' Score = 500 Anim = _360ShoveIt Nollie = Nollie360ShoveIt ExtraTricks = Extra540ShoveIt IsExtra UseCurrent SnapFix } } ]
Extra540ShoveIt = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = '540 Shove-It' Score = 1000 Anim = _540ShoveIt Nollie = Nollie360ShoveIt IsExtra BoardRotate UseCurrent SnapFix } } ]
Trick_FSShoveIt = { Scr = FlipTrick params = { name = 'FS Shove-It' Score = 100 Anim = PopShoveItBS Nollie = NollieFSShoveIt BoardRotate ExtraTricks = ExtraFS360ShoveIt SnapFix } }
ExtraFS360ShoveIt = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = '360 FS Shove-It' Score = 500 Anim = FS360ShoveIt ExtraTricks = ExtraFS540ShoveIt IsExtra UseCurrent SnapFix } } ]
ExtraFS540ShoveIt = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = '540 FS Shove-It' Score = 1000 Anim = FS540ShoveIt IsExtra BoardRotate UseCurrent SnapFix } } ]
Trick_BackfootKickflip = { Scr = FlipTrick params = { name = 'Back Foot Kickflip' Score = 150 Anim = NollieKickflip Nollie = Kickflip ExtraTricks = Extra_DBackfootKickflip } }
Extra_DBackfootKickflip = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = 'Double Back Foot Flip' Score = 500 Anim = DoubleNollieKickflip IsExtra UseCurrent } } ]
Trick_BackfootHeelflip = { Scr = FlipTrick params = { name = 'Back Foot Heelflip' Score = 150 Anim = NollieHeelflip Nollie = Heelflip ExtraTricks = Extra_DBackfootHeelflip } }
Extra_DBackfootHeelflip = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = 'Double Back Foot Flip' Score = 500 Anim = DoubleNollieHeelflip IsExtra UseCurrent } } ]
Trick_Kickflip = { Scr = FlipTrick params = { name = 'Kickflip' Score = 100 Anim = Kickflip Nollie = NollieKickflip ExtraTricks = KickflipExtras } }
DoubleKickflip = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = 'Double Kickflip' Score = 500 Anim = DoubleKickflip ExtraTricks = TripleKickflip IsExtra trickslack = 15 UseCurrent } } ]
TripleKickflip = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = 'Triple Kickflip' Score = 1000 Anim = TripleKickflip IsExtra speed = 1 UseCurrent } } ]
Trick_Heelflip = { Scr = FlipTrick params = { name = 'Heelflip' Score = 100 Anim = Heelflip Nollie = NollieHeelflip ExtraTricks = DoubleHeelflip } }
DoubleHeelflip = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = 'Double Heelflip' Score = 500 Anim = DoubleHeelflip ExtraTricks = TripleHeelflip trickslack = 15 IsExtra UseCurrent } } ]
TripleHeelflip = [ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = 'Triple Heelflip' Score = 1000 Anim = TripleHeelflip IsExtra UseCurrent } } ]
Trick_KFIndy = { Scr = FlipGrabBlendFS params = { name = 'Kickflip to Indy' Score = 750 Anim = Kickflip IsExtra } }
Trick_KFMelon = { Scr = FlipGrabBlendBS params = { name = 'Kickflip to Melon' Score = 750 Anim = Heelflip IsExtra } }
Trick_OllieAirwalk = { Scr = FlipTrick params = { name = 'Ollie Airwalk' Score = 500 speed = 1.0 Anim = OllieAirwalk ExtraTricks = Extra_OllieAirwalk } }
Extra_OllieAirwalk = [ { Trigger_Extra_Flip params = { name = 'Ollie Airwalk Late Shove-it' Score = 1000 Anim = OllieAirWalkShoveIt BoardRotate speed = 1.0 IsExtra UseCurrent } } ]
Trick_OllieNorth = { Scr = FlipTrick params = { name = 'Ollie North' Score = 500 Anim = OllieNorth speed = 1.0 trickslack = 15 ExtraTricks = Extra_OllieNorth } }
Extra_OllieNorth = [ { Trigger_Extra_Flip params = { name = 'Ollie North Back Foot Flip' Score = 1000 Anim = OllieNorthBackFootFlip speed = 1.0 IsExtra UseCurrent } } ]
Trick_FFImpossible = { Scr = FlipTrick params = { name = 'Front Foot Impossible' Score = 400 Anim = FrontFootImposs trickslack = 25 speed = 1.2 ExtraTricks = Extra_FFImpossible } }
Extra_FFImpossible = [ { Trigger_Extra_Flip params = { name = 'Dbl. FF Impossible' Score = 800 Anim = doublefrontfootimposs UseCurrent speed = 1.2 trickslack = 25 IsExtra } } ]
Trick_HFVarialLien = { Scr = FlipTrick params = { name = 'Heelflip Varial Lien' Score = 800 Anim = HeelflipVarialLien BoardRotate trickslack = 15 } }
Trick_Fingerflip = { Scr = FlipTrick params = { name = 'Fingerflip' Score = 700 Anim = FingerFlipVert trickslack = 25 speed = 1.1 ExtraTricks = Extra_DoubleFingerflip } }
Extra_DoubleFingerflip = [ { Trigger_Extra_Flip params = { name = 'Double Fingerflip' Score = 1000 Anim = DoubleFingerFlipVert speed = 1.0 trickslack = 15 IsExtra UseCurrent } } ]
Trick_SalFlip = { Scr = FlipTrick params = { name = 'Sal Flip' Score = 900 Anim = SalFlip trickslack = 25 ExtraTricks = Extra_DoubleSalFlip speed = 1.25 } }
Extra_DoubleSalFlip = [ { Trigger_Extra_Flip params = { name = '360 Sal Flip' Score = 1000 Anim = DoubleSalFlip trickslack = 25 speed = 1.25 } } ]
Trick_180Varial = { Scr = FlipTrick params = { name = '180 Varial' Score = 700 Anim = _180Varial BoardRotate speed = 1.15 trickslack = 25 ExtraTricks = Trick_360Varial } }
Trick_360Varial = [ { Trigger_Extra_Flip params = { name = '360 Varial' Score = 900 Anim = _360Varial speed = 0.9 trickslack = 25 BoardRotate IsExtra UseCurrent } } ]
Trick_Japan = { Scr = GrabTrick params = { name = 'Japan' Score = 350 Anim = JapanAir Idle = JapanAir_Idle ExtraTricks = Trick_OneFootJapan } }
Trick_OneFootJapan = [ { Trigger_Extra_Grab params = { name = 'One Foot Japan' Score = 800 TweakTrick = GRABTWEAK_LARGE Anim = OneFootJapan speed = 1.3 Idle = OneFootJapan_Idle WaitPercent = 70 IsExtra } } ]
Trick_Crail = { Scr = GrabTrick params = { name = 'Crail Grab' Score = 350 Anim = Crail Idle = Crail_Idle ExtraTricks = Extra_TuckKnee } }
Extra_TuckKnee = [ { Trigger_Extra_Grab params = { name = 'TuckKnee' Score = 400 Anim = TuckKnee IsExtra Idle = TuckKnee_Idle } } ]
Trick_SaranWrap = { Scr = GrabTrick params = { name = 'Wrap Around' Score = 450 TweakTrick = GRABTWEAK_LARGE Anim = SaranWrap Idle = SaranWrap_Idle OutAnim = AirIdle ExtraTricks = Trick_BetweenTheLegs } }
Trick_BetweenTheLegs = [ { Trigger_Extra_Grab params = { name = 'Body Wrap' Score = 600 TweakTrick = GRABTWEAK_LARGE Anim = BetweenTheLegs_In Idle = BetweenTheLegs_Idle OutAnim = BetweenTheLegs_Out speed = 1.2 IsExtra } } ]
Trick_Cannonball = { Scr = GrabTrick params = { name = 'Cannonball' Score = 250 TweakTrick = GRABTWEAK_SMALL Anim = Cannonball Idle = Cannonball_Idle speed = 0.75 ExtraTricks = Extra_CannonballFingerflip } }
Extra_CannonballFingerflip = [ { Trigger_Extra_Grab params = { name = 'Fingerflip Cannonball' Score = 500 TweakTrick = GRABTWEAK_SMALL Anim = Cannonballfingerflip BackwardsAnim = Cannonball Idle = Cannonball_Idle speed = 1.4 IsExtra } } ]
Trick_Stalefish = { Scr = GrabTrick params = { name = 'Stalefish' Score = 350 Anim = Stalefish Idle = Stalefish_Idle ExtraTricks = Trick_Stalefish_Layback } }
Trick_Stalefish_Layback = [ { Trigger_Extra_Grab params = { name = 'Stalefish Tweak' Score = 400 Anim = Stalefish_Layback Idle = Stalefish_Layback_Idle IsExtra } } ]
Trick_Benihana = { Scr = GrabTrick params = { name = 'Benihana' Score = 300 Anim = Benihana Idle = Benihana_Idle OutAnim = Benihana_Out ExtraTricks = Sacktap ForceInit ExtraTricks = BenihanaFingerflip } }
Trick_Sacktap = [ { Trigger_Extra_Grab params = { name = 'Sacktap' Score = 1500 Anim = Sacktap_Init Idle = Sacktap_Range OutAnim = Sacktap_out speed = 1.5 ForceInit trickslack = 20 IsExtra } } ]
Trick_Crossbone = { Scr = GrabTrick params = { name = 'Crossbone' Score = 350 Anim = Crossbone Idle = Crossbone_Idle ExtraTricks = Trick_CrookedCop } }
Trick_CrookedCop = [ { Trigger_Extra_Grab params = { name = 'CrookedCop' Score = 400 Anim = CrookedCop Idle = CrookedCop_Idle IsExtra } } ]
Trick_Airwalk = { Scr = GrabTrick params = { name = 'Airwalk' Score = 400 Anim = Airwalk Idle = Airwalk_Idle2 ExtraTricks = Trick_ChristAir } }
Trick_ChristAir = [ { Trigger_Extra_Grab params = { name = 'Christ Air' Score = 500 Anim = ChristAir_Init Idle = ChristAir_Idle OutAnim = ChristAir_Out ForceInit IsExtra } } ]
Trick_IndyNosebone = { Scr = GrabTrick params = { name = 'Indy Nosebone' Score = 350 Anim = Nosebone Idle = Nosebone_Idle ExtraTricks = Trick_DelMarIndy } }
Trick_DelMarIndy = [ { Trigger_Extra_Grab params = { name = 'Del Mar Indy' Score = 400 Anim = IndyDelMar Idle = IndyDelMar_Idle IsExtra } } ]
Trick_NosebonePoker = [ { Trigger_Extra_Grab params = { name = 'Nosebone Poker' Score = 450 Anim = IndyNBPoker_Init Idle = IndyNBPoker_Idle speed = 1.2 IsExtra } } ]
Trick_Tailgrab = { Scr = GrabTrick params = { name = 'Tailgrab' Score = 300 Anim = Tailgrab Idle = Tailgrab_Idle ExtraTricks = Trick_OneFootTailgrab } }
Trick_OneFootTailgrab = [ { Trigger_Extra_Grab params = { name = 'One Foot Tailgrab' Score = 500 Anim = OneFootTailgrab Idle = OneFootTailgrab_Idle IsExtra } } ]
Trick_Madonna = { Scr = GrabTrick params = { name = 'Madonna' Score = 600 TweakTrick = GRABTWEAK_EXTRALARGE Anim = Madonna Idle = Madonna_Idle WaitPercent = 70 ExtraTricks = Trick_Judo } }
Trick_Judo = [ { Trigger_Extra_Grab params = { name = 'Judo' Score = 800 TweakTrick = 50 Anim = JudoGrab Idle = JudoGrab_Idle speed = 1.3 IsExtra } } ]
Trick_FSShifty = { Scr = GrabTrick params = { name = 'FS Shifty' Score = 500 Anim = Shifty Idle = Shifty_Idle ExtraTricks = Extra_BSShifty } }
Extra_BSShifty = [ { Trigger_Extra_Grab params = { name = 'BS Shifty' Score = 500 Anim = BSShifty Idle = BSShifty_Idle IsExtra } } ]
Trick_Melon = { Scr = GrabTrick params = { name = 'Melon' Score = 300 Anim = MelonGrab Idle = MelonGrab_Idle ExtraTricks = Trick_Method } }
Trick_Method = [ { Trigger_Extra_Grab params = { name = 'Method' Score = 400 Anim = Method Idle = Method_Idle speed = 1.2 IsExtra } } ]
Trick_Nosegrab = { Scr = GrabTrick params = { name = 'Nosegrab' Score = 300 Anim = Nosegrab Idle = Nosegrab_Idle ExtraTricks = Trick_Rocket } }
Trick_Rocket = [ { Trigger_Extra_Grab params = { name = 'Rocket Air' Score = 400 Anim = RocketAir Idle = RocketAir_Idle IsExtra } } ]
Trick_Mute = { Scr = GrabTrick params = { name = 'Mute' Score = 350 Anim = MuteGrab Idle = MuteGrab_Idle ExtraTricks = Trick_Seatbelt } }
Trick_Seatbelt = [ { Trigger_Extra_Grab params = { name = 'Seatbelt Air' Score = 500 Anim = Seatbelt Idle = SeatBelt_Idle speed = 0.6 IsExtra } } ]
Trick_Indy = { Scr = GrabTrick params = { name = 'Indy' Score = 300 Anim = Indy Idle = Indy_Idle ExtraTricks = Trick_Stiffy } }
Trick_Stiffy = [ { Trigger_Extra_Grab params = { name = 'Stiffy' Score = 500 Anim = Stiffy Idle = Stiffy_Idle speed = 1.25 ForceInit IsExtra } } ]
Trick_Revert = { Scr = Revert }
AirTricks =
[
  { Trigger = { TripleInOrder left left Square 300 } TrickSlot = Air_L_L_Square }
  { Trigger = { TripleInOrder right right Square 300 } TrickSlot = Air_R_R_Square }
  { Trigger = { TripleInOrder Up Up Square 300 } TrickSlot = Air_U_U_Square }
  { Trigger = { TripleInOrder Down Down Square 300 } TrickSlot = Air_D_D_Square }
  { Trigger = { AirTrickLogic Square UpLeft 500 } TrickSlot = Air_SquareUL }
  { Trigger = { AirTrickLogic Square UpRight 500 } TrickSlot = Air_SquareUR }
  { Trigger = { AirTrickLogic Square DownLeft 500 } TrickSlot = Air_SquareDL }
  { Trigger = { AirTrickLogic Square DownRight 500 } TrickSlot = Air_SquareDR }
  { Trigger = { AirTrickLogic Square Up 500 } TrickSlot = Air_SquareU }
  { Trigger = { AirTrickLogic Square Down 500 } TrickSlot = Air_SquareD }
  { Trigger = { AirTrickLogic Square left 500 } TrickSlot = Air_SquareL }
  { Trigger = { AirTrickLogic Square right 500 } TrickSlot = Air_SquareR }
  { Trigger = { TripleInOrder left left Circle 300 } TrickSlot = Air_L_L_Circle }
  { Trigger = { TripleInOrder right right Circle 300 } TrickSlot = Air_R_R_Circle }
  { Trigger = { TripleInOrder Up Up Circle 300 } TrickSlot = Air_U_U_Circle }
  { Trigger = { TripleInOrder Down Down Circle 300 } TrickSlot = Air_D_D_Circle }
  { Trigger = { AirTrickLogic Circle UpLeft 500 } TrickSlot = Air_CircleUL }
  { Trigger = { AirTrickLogic Circle UpRight 500 } TrickSlot = Air_CircleUR }
  { Trigger = { AirTrickLogic Circle DownLeft 500 } TrickSlot = Air_CircleDL }
  { Trigger = { AirTrickLogic Circle DownRight 500 } TrickSlot = Air_CircleDR }
  { Trigger = { AirTrickLogic Circle Up 500 } TrickSlot = Air_CircleU }
  { Trigger = { AirTrickLogic Circle Down 500 } TrickSlot = Air_CircleD }
  { Trigger = { AirTrickLogic Circle right 500 } TrickSlot = Air_CircleR }
  { Trigger = { AirTrickLogic Circle left 500 } TrickSlot = Air_CircleL }
]
Trigger_Extra_Grab_Tweak = { Trigger = { ExtraGrabTrickLogic Circle 300 } Scr = GrabTrick }
Trigger_Extra_Grab = { Trigger = { Press Circle 300 } Scr = GrabTrick }
Trigger_Extra_Flip = { Trigger = { Press Square 300 } Scr = FlipTrick }
KickflipExtras =
[ { Trigger = { Press Square 300 } Scr = FlipTrick params = { name = 'Double Kickflip' Score = 500 Anim = DoubleKickflip ExtraTricks = TripleKickflip speed = 1 IsExtra UseCurrent } }
  { Trigger = { AirTrickLogic Circle Down 300 } Scr = FlipGrabBlend params = { name = 'Kickflip to Indy' Score = 400 Anim1 = KickFlipBlendFS Anim2 = Indy IsExtra } }
  { Trigger = { AirTrickLogic Circle Up 300 } Scr = FlipGrabBlend params = { name = 'Kickflip to Crail' Score = 400 Anim1 = KickFlipBlendFS Anim2 = Crail IsExtra GrabStart = 5 speed = 1 } }
]
BenihanaFingerflip =
[
  { Trigger = { Press Square 500 } Scr = FlipTrick params = { name = 'Beni Fingerflip' Score = 1000 Anim = BenihanaFingerflip IsExtra } }
  { Trigger = { Press Circle 300 } Scr = GrabTrick params params = { name = 'Sacktap' Score = 1500 Anim = Sacktap_Init Idle = Sacktap_Range OutAnim = Sacktap_out speed = 1.5 ForceInit trickslack = 20 IsExtra } }
]
COOL_SPECIAL_TRICKS = 0
script FlipTrick speed = 1.0 trickslack = 10 grindslack = 25 flip_stat_mod = 1.0
  SetTags state = skater_inflip
  GetScriptedStat Skater_Flip_Speed_Stat
  speed = ( <speed> * <stat_value> )
  if GotParam MaxSpeed
    if ( <speed> > <MaxSpeed> )
       <speed> = <MaxSpeed>
    endif
  else
    if ( <speed> > 1.3 )
      speed = 1.3
    endif
  endif
  ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
  CheckForOllie
  KillExtraTricks
  BailOn
  if GotParam NoSpin
    NoSpin
  endif
  if GotParam RevertFS
    Obj_SetFlag FLAG_SKATER_REVERTFS
  endif
  if GotParam RevertBS
    Obj_SetFlag FLAG_SKATER_REVERTBS
  endif
  if InNollie
    if GotParam Nollie
      if not GetGlobalFlag flag = NOLLIE_360_FLAG
        NollieOff
      endif
      if InNollie
        if GotParam Nollie
          if GotParam SnapFix
            NollieOff
          endif
        endif
      endif
      PlayAnim Anim = <Nollie> BlendPeriod = 0.3 speed = <speed>
    else
      PlayAnim Anim = <Anim> BlendPeriod = 0.3 speed = <speed>
    endif
  else
    if GotParam UseCurrent
      printf "USING THE CURRENT FRAME"
      PlayAnim Anim = <Anim> From = Current BlendPeriod = 0.3 speed = <speed>
    else
      PlayAnim Anim = <Anim> BlendPeriod = 0.3 speed = <speed>
    endif
  endif
  if GotParam BoardRotate
    BlendperiodOut 0
    BoardRotateAfter
  endif
  if GotParam RotateAfter
    BlendperiodOut 0
    RotateAfter
  endif
  if GotParam FlipAfter
    BlendperiodOut 0
    FlipAfter
  endif
  if GotParam ExtraTricks
    SetExtraTricks tricks = <ExtraTricks> duration = 15
  endif
  wait 15 frames
  SetTrickName <name>
  SetTrickScore <Score>
  Display
  if GotParam IsExtra
    LaunchExtraMessage
  endif
  if GotParam IsSpecial
    LaunchSpecialMessage Cool
  endif
  if GotParam Bloodframe
    wait <Bloodframe> frames
    if GotParam GutsSound
      PlaySound hitblood04 vol = 200
    else
      PlaySound bitchslap2 pitch = 90
    endif
    Bloodsplat
    Obj_SpawnScript BloodJackAss
    wait 1 frame
    PlaySound headsmackB
  endif
  if GotParam Spinslack
    WaitAnim <Spinslack> frames fromend
    Canspin
  endif
  if GotParam grindslack
    WaitAnim <grindslack> frames fromend
  endif
  Bailoff
  WaitAnim <trickslack> frames fromend
  if GotParam IsSpecial
    EndSpecial
  endif
  DoNextTrick
  Canspin
  WaitAnimFinished
  goto Airborne
endscript
script CheckForOllie
  if GotException Ollied
    SetException Ex = Ollied Scr = CalledOllie CallInsteadOfGoto
  endif
endscript
script CalledOllie
  if AirTimeGreaterThan Skater_Late_Jump_Slop
    ClearException Ollied
  else
    #"Jump"
    ClearException Ollied
  endif
endscript
script GrabTrick speed = 1.0 X = -180 duration = 1.0 GrabTweak = GRABTWEAK_MEDIUM WaitPercent = 60
  ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
  CheckForOllie
  KillExtraTricks
  ClearExtraGrindTrick
  BailOn
  SetTags state = skater_ingrab
  if GotParam SpecialSounds
    Obj_SpawnScript <SpecialSounds>
  endif
  if GotParam ExtraTricks
    SetExtraTricks tricks = <ExtraTricks> duration = 15
  endif
  if GotParam SpecialItem_details
    TurnOnSpecialItem SpecialItem_details = <SpecialItem_details>
  endif
  if GotParam IsExtra
    PlayAnim Anim = <Anim> BlendPeriod = 0.3 From = Current to = end speed = <speed>
  else
    PlayAnim Anim = <Anim> BlendPeriod = 0.3 speed = <speed>
  endif
  if GotParam JumpJets
    Obj_KillSpawnedScript name = JumpJets
    Obj_SpawnScript JumpJets
  endif
  if GotParam Stream
    Obj_PlayStream <Stream>
  endif
  if GotParam Bloodframe
    wait <Bloodframe> frames
    if GotParam GutsSound
      PlaySound hitblood04 vol = 200
    else
      PlaySound bitchslap2 pitch = 90
    endif
    Bloodsplat
    Obj_SpawnScript BloodJackAss
    wait 1 frame
    PlaySound headsmackB
  endif
  WaitAnim 50 percent
  SetTrickName <name>
  SetTrickScore <Score>
  Display
  if GotParam IsSpecial
    LaunchSpecialMessage Cool
  endif
  if GotParam IsExtra
    LaunchExtraMessage
  endif
  if GotParam ForceInit
    WaitAnimFinished
  else
    WaitAnim <WaitPercent> percent
  endif
  begin
    if Released Circle
      break
    endif
    if AnimFinished
      PlayAnim Anim = <Idle> cycle speed = <speed>
      break
    endif
    WaitOneGameFrame
  repeat
  begin
    if Released Circle
      IfReleased_SquareOrCircle <...>
      break
    endif
    WaitOneGameFrame
    if GotParam IsSpecial
      TweakTrick GRABTWEAK_SPECIAL
    else
      TweakTrick <GrabTweak>
    endif
  repeat
  if GotParam BoardRotate
    BlendperiodOut 0
    BoardRotateAfter
  endif
  if GotParam trickslack
    WaitAnim <trickslack> frames fromend
  endif
  Bailoff
  if GotParam IsSpecial
    EndSpecial
  endif
  if GotParam FlipAfter
    FlipAfter
    BlendperiodOut 0
  endif
  if GotParam RotateAfter
    BlendperiodOut 0
    RotateAfter
  endif
  WaitAnimWhilstChecking
  goto Airborne
endscript
script IfReleased_SquareOrCircle
  if GotParam OutAnim
    PlayAnim Anim = <OutAnim> BlendPeriod = 0.2 speed = <speed>
  else
    if GotParam BackwardsAnim
      PlayAnim Anim = <BackwardsAnim> Backwards BlendPeriod = 0.2 speed = <speed>
    else
      if AnimEquals Airwalk
        PlayAnim Anim = <Anim> From = Current to = 0 BlendPeriod = 0.2 speed = <speed>
      else
        PlayAnim Anim = <Anim> Backwards BlendPeriod = 0.2 speed = <speed>
      endif
    endif
  endif
endscript
script JumpJets
  ReplayRecordSimpleScriptCall scriptname = _ReplayJumpJets skaterscript
  Obj_GetID
  MangleChecksums a = skatersplash b = <objId>
  if not Obj_FlagSet FLAG_SKATER_JUMPJETSON
    if not InNetGame
      if not GameModeEquals Is_SingleSession
        begin
          #"Jump"
          wait 1 game frame
        repeat 2
        Obj_SpawnScript JumpJetTracker params = { <...> }
      endif
    endif
  endif
  EmptyParticleSystem name = <mangled_id>
  SetScript name = <mangled_id> Emitscript = emit_jumpjets
  ParticlesOn name = <mangled_id>
  wait 0.5 second
  ParticlesOff name = <mangled_id>
  wait 0.5 seconds
  SetScript name = <mangled_id> Emitscript = emit_skatersplash
endscript
script JumpJetTracker
  Obj_SetFlag FLAG_SKATER_JUMPJETSON
  wait 2 seconds
  Obj_ClearFlag FLAG_SKATER_JUMPJETSON
endscript
script _ReplayJumpJets
  SpawnSkaterScript ReplayJumpJets
endscript
script ReplayJumpJets
  Obj_GetID
  MangleChecksums a = skatersplash b = <objId>
  EmptyParticleSystem name = <mangled_id>
  SetScript name = <mangled_id> Emitscript = emit_jumpjets
  ParticlesOn name = <mangled_id>
  wait 0.5 second
  ParticlesOff name = <mangled_id>
  wait 0.5 seconds
  SetScript name = <mangled_id> Emitscript = emit_skatersplash
endscript
script FlipGrabBlendFS name = 'Kickflip to Indy'
  CheckForOllie
  ClearExtraGrindTrick
  KillExtraTricks
  if GotParam IsExtra
    LaunchExtraMessage
  endif
  PlayAnim Anim = KickFlipBlendFS BlendPeriod = 0.3 From = Current
  SetTrickName <name>
  wait 15 frames
  Display
  wait 5 frames
  PlayAnim Anim = Indy From = 10 to = end BlendPeriod = 0.3 speed = 1.5
  WaitAnim 10 frames fromend
  DoNextTrick
  WaitAnimFinished
  Reverse
  WaitAnimWhilstChecking
endscript
script FlipGrabBlendBS name = 'Kickflip to Melon'
  CheckForOllie
  ClearExtraGrindTrick
  KillExtraTricks
  if GotParam IsExtra
    LaunchExtraMessage
  endif
  PlayAnim Anim = KickFlipBlendBS BlendPeriod = 0.3
  SetTrickName <name>
  WaitAnim 15 frames
  Display
  wait 10 frames
  PlayAnim Anim = MelonGrab From = 20 to = end BlendPeriod = 0.3 speed = 1.4
  WaitAnimFinished
  Reverse
  DoNextTrick
  WaitAnimWhilstChecking
endscript
script FlipGrabBlend GrabStart = 10 GrabSpeed = 1.5
  CheckForOllie
  ClearManualTrick
  ClearExtraGrindTrick
  KillExtraTricks
  if GotParam IsExtra
    LaunchExtraMessage
  endif
  PlayAnim Anim = <Anim1> BlendPeriod = 0.3 From = Current
  SetTrickName <name>
  SetTrickScore <Score>
  Display
  wait 15 frames
  PlayAnim Anim = <Anim2> From = <GrabStart> to = end BlendPeriod = 0.3 speed = <GrabSpeed>
  DoNextTrick
  WaitAnimFinished
  Reverse
  WaitAnimWhilstChecking
endscript
