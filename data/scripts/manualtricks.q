MANUAL_DISPLAY_WAIT = 25
ROTATEY_TRIGGER_TIME = 300
TRIGGER_MANUAL_BRANCHFLIP = { inorder Square Square 200 }
off = 0
on = 1
SpecialManualTricks =
[
  { Trigger = { TripleInOrder Up right Triangle 400 } duration = 700 TrickSlot = SpMan_U_R_Triangle }
  { Trigger = { TripleInOrder Up Down Triangle 400 } duration = 700 TrickSlot = SpMan_U_D_Triangle }
  { Trigger = { TripleInOrder Up left Triangle 400 } duration = 700 TrickSlot = SpMan_U_L_Triangle }
  { Trigger = { TripleInOrder right Up Triangle 400 } duration = 700 TrickSlot = SpMan_R_U_Triangle }
  { Trigger = { TripleInOrder right Down Triangle 400 } duration = 700 TrickSlot = SpMan_R_D_Triangle }
  { Trigger = { TripleInOrder right left Triangle 400 } duration = 700 TrickSlot = SpMan_R_L_Triangle }
  { Trigger = { TripleInOrder Down Up Triangle 400 } duration = 700 TrickSlot = SpMan_D_U_Triangle }
  { Trigger = { TripleInOrder Down right Triangle 400 } duration = 700 TrickSlot = SpMan_D_R_Triangle }
  { Trigger = { TripleInOrder Down left Triangle 400 } duration = 700 TrickSlot = SpMan_D_L_Triangle }
  { Trigger = { TripleInOrder left Up Triangle 400 } duration = 700 TrickSlot = SpMan_L_U_Triangle }
  { Trigger = { TripleInOrder left right Triangle 400 } duration = 700 TrickSlot = SpMan_L_R_Triangle }
  { Trigger = { TripleInOrder left Down Triangle 400 } duration = 700 TrickSlot = SpMan_L_D_Triangle }
]
Trick_HoHoStreetPlant = { Scr = Manual params = { name = 'Ho Ho Street Plant' Score = 1500 skater = Vallely InitAnim = HoHoStreetPlant_init FromAirAnim = HoHoStreetPlant_init BalanceIdle = HoHoStreetPlant_idle OutAnim = HoHoStreetPlant_out OutAnimOnOllie OffMeterTop = NoseManualBail OffMeterBottom = NoseManualBail ExtraTricks = FlatLandBranches IsSpecial FlipAfter NoBlend } }
Trick_SplitsManual = { Scr = Manual params = { name = 'Banana Board Splits' Score = 1500 skater = JENNA InitAnim = SplitsManual_init FromAirAnim = SplitsManual_init BalanceIdle = SplitsManual_idle OutAnim = SplitsManual_out OutAnimOnOllie OffMeterTop = NoseManualBail OffMeterBottom = ManualBail ExtraTricks = FlatLandBranches IsSpecial } }
Trick_NoComplyLate360 = { Scr = Manual params = { name = 'No Comply 360 Shove-It' Score = 1500 InitAnim = NoComplyLate360 FromAirAnim = NoComplyLate360 BalanceAnim = Manual_Range OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks = ManualBranches IsSpecial NoBlend ExtraTricks = FlatLandBranches ExtraWaitPercent = 40 } }
Trick_4thofJuly = { Scr = Manual params = { name = 'One Wheel Fireworks Show' Score = 1500 InitAnim = _4thofJuly_init FromAirAnim = _4thofJuly_init BalanceIdle = _4thofJuly_idle OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches IsSpecial CheckCheese SpawnScript = Fireworks } }
Trick_RustySlide = { Scr = Manual params = { name = 'Rusty Slide Manual' Score = 1400 InitAnim = RustySlide_Init FromAirAnim = RustySlide_Init BalanceAnim = Primo_Range OutAnim = RustySlide_out OffMeterTop = NoseManualBail OffMeterBottom = ManualBail Friction = 0.5 IsSpecial BoardRotate ExtraTricks = FlatLandBranches ExtraTricks2 = ToRail_Branches FlipGraphic NoBlend } }
Trick_Sproing = { Scr = Manual params = { name = 'Sproing' Score = 1500 InitAnim = Sproing FromAirAnim = Sproing BalanceAnim = Manual_Range OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches IsSpecial SproingFlip ExtraWaitPercent = 40 } }
Trick_LazyAss = { Scr = Manual params = { name = 'Lazy Ass Manual' Score = 1500 InitAnim = LazyAss_Init FromAirAnim = LazyAss_Init BalanceIdle = LazyAss_Idle OutAnim = LazyAss_Out OffMeterTop = ManualBail OffMeterBottom = NoseManualBail Friction = 0.5 IsSpecial WaitOnOlliePercent = 10 ExtraTricks = FlatLandBranches } }
Trick_HandStand50Flip = { Scr = Manual params = { name = 'HandStand 360 Hand Flip' Score = 1400 InitAnim = HandStand50Flip_Init FromAirAnim = HandStand50Flip_Init BalanceAnim = HandStand50Flip_Range OutAnim = HandStand50Flip_Out OffMeterTop = ManualBail OffMeterBottom = NoseManualBail Friction = 0.5 IsSpecial ExtraTricks = FlatLandBranches } }
Trick_HandstandDoubleFlip = { Scr = Manual params = { name = 'HandStand Double Flip' Score = 1400 InitAnim = HandstandHandFlip_Init FromAirAnim = HandstandHandFlip_Init BalanceAnim = HandstandHandFlip_Range OutAnim = HandStandDoubleFlip OffMeterTop = NoseManualBail OffMeterBottom = ManualBail Friction = 0.5 IsSpecial ExtraTricks = FlatLandBranches ExtraTricks2 = HandstandBranches } }
Trick_ReemoSlide = { Scr = Manual params = { name = 'Reemo Slide' Score = 1300 InitAnim = ReemoSlide_Init FromAirAnim = ReemoSlide_Init BalanceAnim = ReemoSlide_Range OutAnim = ReemoSlide_out OffMeterTop = NoseManualBail OffMeterBottom = ManualBail Friction = 0.5 IsSpecial BoardRotate ExtraTricks = FlatLandBranches } }
Trick_PrimoSlide = { Scr = Manual params = { name = 'Primo' Score = 1200 InitAnim = Primo_Init FromAirAnim = Primo_Init BalanceAnim = Primo_Range OutAnim = Primo_out OffMeterTop = NoseManualBail OffMeterBottom = ManualBail Friction = 0.5 IsSpecial ExtraTricks = FlatLandBranches ExtraTricks2 = ToRail_Branches } }
Trick_OneFootOneWheel = { Scr = Manual params = { name = 'One Wheel Nosemanual' Score = 1400 InitAnim = OneFootOneWheel_Init FromAirAnim = OneFootOneWheel_Init BalanceAnim = OneFootOneWheel_Range OutAnim = OneFootOneWheel_Init OffMeterTop = ManualLand OffMeterBottom = NoseManualBail Friction = 0.5 IsSpecial Nollie ExtraTricks2 = NoseManualBranches ExtraTricks = FlatLandBranches PutDownAnim = PutDownOneWheel } }
Trick_DanceParty = { Scr = Manual params = { name = 'Ahhh yeahhh!' Score = 1400 InitAnim = DanceParty_Init FromAirAnim = DanceParty_Init BalanceIdle = DanceParty_Idle OffMeterTop = ManualBail OffMeterBottom = NoseManualBail Friction = 20 IsSpecial ExtraTricks = FlatLandBranches } }
ManualTricks =
[
  { Trigger = { inorder Up Down 400 } duration = 700 Trick_Manual }
  { Trigger = { inorder Down Up 400 } duration = 700 Trick_NoseManual }
]
GroundManualTricks =
[
  { Trigger = { inorder Up Down 220 } Trick_Manual }
  { Trigger = { inorder Down Up 220 } Trick_NoseManual }
]
Trick_Manual = { Scr = Manual params = { name = 'Manual' Score = 100 InitAnim = Manual FromAirAnim = ManualFromAir BalanceAnim = Manual_Range BalanceAnim2 = Manual_Range2 OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches CheckCheese } }
Trick_NoseManual = { Scr = Manual params = { name = 'Nose Manual' Score = 100 InitAnim = Nosemanual FromAirAnim = NoseManualFromAir BalanceAnim = NoseManual_Range BalanceAnim2 = NoseManual_Range2 Nollie OffMeterTop = ManualLand OffMeterBottom = NoseManualBail ExtraTricks2 = NoseManualBranches ExtraTricks = FlatLandBranches CheckCheese } }
Trick_OneFootNosemanual = { Scr = Manual params = { name = 'One Foot Nose Manual' Score = 200 InitAnim = OneFootNosemanual_Init FromAirAnim = OneFootNosemanual_Init BalanceAnim = OneFootNoseManual_Range Nollie OffMeterTop = ManualLand OffMeterBottom = NoseManualBail IsExtra ExtraTricks = NoseManualBranches ExtraTricks2 = FlatLandBranches } }
Trick_OneFootManual = { Scr = Manual params = { name = 'One Foot Manual' Score = 200 InitAnim = OneFootManual_init FromAirAnim = OneFootManual_init BalanceAnim = OneFootManual_Range OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks = ManualBranches ExtraTricks2 = FlatLandBranches IsExtra } }
Trick_Handstand = { Scr = Manual params = { name = 'HandStand' Score = 250 InitAnim = HandstandHandFlip_Init FromAirAnim = HandstandHandFlip_Init BalanceAnim = HandstandHandFlip_Range OutAnim = HandstandHandFlip_out OffMeterTop = NoseManualBail OffMeterBottom = ManualBail Friction = 0.5 ExtraTricks = FlatLandBranches ExtraTricks2 = HandstandBranches } }
Trick_Casper = { Scr = Manual params = { RotateRightY RotateLeftY name = 'Casper' Score = 350 InitAnim = Casper_Init FromAirAnim = Casper_Init BalanceAnim = Casper_Range OutAnim = Casper_out OffMeterTop = ManualBail OffMeterBottom = NoseManualBail Friction = 0.5 BoardRotate ExtraTricks = FlatLandBranches ExtraTricks2 = CasperBranches } }
Trick_AntiCasper = { Scr = Manual params = { RotateRightY RotateLeftY name = 'Anti Casper' Score = 350 InitAnim = AntiCasper_Init FromAirAnim = AntiCasper_Init BalanceAnim = AntiCasper_Range OutAnim = AntiCasper_out OffMeterTop = ManualBail OffMeterBottom = NoseManualBail Friction = 0.5 BoardRotate Nollie ExtraTricks = FlatLandBranches ExtraTricks2 = AntiCasperBranches } }
Trick_Truckstand = { Scr = Manual params = { RotateRightY RotateLeftY name = 'Truckstand' Score = 250 InitAnim = Truckstand_Init FromAirAnim = Truckstand_Init BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out OffMeterTop = NoseManualBail OffMeterBottom = ManualBail Friction = 2 ExtraTricks = FlatLandBranches ExtraTricks2 = TruckstandBranches } }
Trick_SwitchFootPogo = { Scr = Manual params = { RotateRightY RotateLeftY name = 'Switch Foot Pogo' Score = 300 InitAnim = Truckrun_Init FromAirAnim = Truckrun_Init BalanceIdle = TruckRun OutAnim = Truckrun_Out OffMeterTop = NoseManualBail OffMeterBottom = ManualBail Friction = 1 ExtraTricks = FlatLandBranches ExtraTricks2 = SwitchFootPogo_Branches } }
Trick_Pogo = { Scr = Manual params = { RotateRightY RotateLeftY name = 'Pogo' Score = 250 InitAnim = Pogo_Init FromAirAnim = Pogo_Init BalanceIdle = Pogo_Bounce OutAnim = Pogo_Out OutSpeed = 1.5 OffMeterTop = NoseManualBail OffMeterBottom = ManualBail Friction = 2 ExtraTricks = FlatLandBranches BoardRotate ExtraTricks2 = PogoBranches BounceBoobs } }
Trick_ToRail = { Scr = Manual params = { name = 'To Rail' Score = 500 InitAnim = Primo_Init FromAirAnim = Primo_Init BalanceAnim = Primo_Range OutAnim = Primo_out OffMeterTop = NoseManualBail OffMeterBottom = ManualBail Friction = 1.0 ExtraTricks = FlatLandBranches ExtraTricks2 = ToRail_Branches IsExtra } }
Trick_Gturn = { Scr = ManualLink params = { name = 'Nose Pivot' Score = 250 Anim = GTurn BalanceAnim = Manual FlipAfter BalanceAnim = Manual_Range trickslack = 0 PlayCessSound extrapercent = 100 ExtraTricks = FlatLandBranches ExtraTricks2 = ManualBranches TimeAdd = 2 SpeedMult = 1.2 OffMeterTop = ManualBail OffMeterBottom = ManualLand } }
Trick_Gturn2 = { Scr = ManualLink params = { name = 'Pivot' Score = 250 Anim = GTurn2 BalanceAnim = Manual FlipAfter BalanceAnim = NoseManual_Range trickslack = 0 PlayCessSound extrapercent = 100 ExtraTricks = FlatLandBranches ExtraTricks2 = NoseManualBranches Nollie TimeAdd = 2 SpeedMult = 1.2 OffMeterTop = ManualLand OffMeterBottom = NoseManualBail } }
Trick_HalfCabImpossible = { Scr = ManualLink params = { name = 'Half Cab Impossible' Score = 450 Anim = HalfCabImpossible BalanceAnim = Manual FlipAfter BoardFlipAfter BalanceAnim = Manual_Range trickslack = 0 extrapercent = 100 ExtraTricks = FlatLandBranches ExtraTricks2 = ManualBranches TimeAdd = 0 SpeedMult = 1.0 OffMeterTop = ManualBail IsExtra OffMeterBottom = ManualLand } }
Trick_360FlipNoseManual = { Scr = ManualLink params = { name = '360 Fingerflip' Score = 450 Anim = _360FlipNosemanual BalanceAnim = Nosemanual BalanceAnim = NoseManual_Range trickslack = 0 extrapercent = 100 ExtraTricks = FlatLandBranches ExtraTricks2 = NoseManualBranches TimeAdd = 0 SpeedMult = 1.0 OffMeterTop = ManualLand OffMeterBottom = NoseManualBail } }
Trick_PogoFlip = { Scr = ManualLink params = { name = 'Wrap Around' Score = 500 Anim = Pogo_Kickfoot BalanceIdle = Pogo_Bounce speed = 1.5 OutAnim = Pogo_Out OutSpeed = 1.5 ExtraTricks = FlatLandBranches ExtraTricks2 = PogoBranches parent = 'Pogo' extrapercent = 100 trickslack = 0 IsExtra } }
Trick_Spacewalk = { Scr = Manual Params = { Name = 'Spacewalk' Score = 1200 InitAnim = SpacewalkFromManual FromAirAnim = SpacewalkFromManual balanceIdle = Spacewalk OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks3 = SpacewalkBranch ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches ExtraSpeedBoost = 250 } }
SwitchFootPogo_Branches =
[ { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink params = { name = 'Half Wrap Truck Transfer' Score = 500 Anim = TruckRunFlip BalanceIdle = TruckRun ExtraTricks = FlatLandBranches ExtraTricks2 = SwitchFootPogo_Branches parent = 'Switch Foot Pogo' BoardFlipAfter extrapercent = 100 trickslack = 0 IsExtra } }
  { Trigger = { Press R2 ROTATEY_TRIGGER_TIME } Scr = ManualLink params = { name = 'Switch Foot Pogo Spin' Score = 10 RotateRightY BalanceAnim = TruckRun OutAnim = Truckrun_Out ExtraTricks = FlatLandBranches ExtraTricks2 = SwitchFootPogo_Branches parent = 'Switch Foot Pogo' trickslack = 0 IsExtra } }
  { Trigger = { Press L2 ROTATEY_TRIGGER_TIME } Scr = ManualLink params = { name = 'Switch Foot Pogo Spin' Score = 10 RotateLeftY BalanceAnim = TruckRun OutAnim = Truckrun_Out ExtraTricks = FlatLandBranches ExtraTricks2 = SwitchFootPogo_Branches parent = 'Switch Foot Pogo' trickslack = 0 IsExtra } }
]
ToRail_Branches =
[
  { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink params = { name = 'Rail Flip' Score = 500 Anim = RailFlip BalanceAnim = Primo_Range ExtraTricks = FlatLandBranches ExtraTricks2 = ToRail_Branches parent = 'To Rail' trickslack = 0 extrapercent = 100 IsExtra } }
  { Trigger = { Press R2 ROTATEY_TRIGGER_TIME } Scr = ManualLink params = { name = 'Reemo Spin' Score = 10 Anim = Primo_Turn speed = 0.75 BalanceAnim = Primo_Range OutAnim = Primo_out ExtraTricks = FlatLandBranches ExtraTricks2 = ToRail_Branches parent = 'To Rail' trickslack = 0 IsExtra RotateAfter ReemoSpin } }
]
CasperBranches =
[ { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink params = { name = 'Casper Flip' Score = 500 extrapercent = 100 Anim = CasperFlip speed = 0.7 BalanceAnim = Casper_Range OutAnim = Casper_out ExtraTricks = FlatLandBranches ExtraTricks2 = CasperBranches parent = 'Casper' trickslack = 0 BoardRotate = 1 extrapercent = 100 IsExtra } }
  { Trigger = { Press R2 ROTATEY_TRIGGER_TIME } Scr = ManualLink params = { name = 'Casper Spin' Score = 10 RotateRightY BalanceAnim = Casper_Range OutAnim = Casper_out ExtraTricks = FlatLandBranches ExtraTricks2 = CasperBranches parent = 'Casper' trickslack = 0 BoardRotate = 1 IsExtra } }
  { Trigger = { Press L2 ROTATEY_TRIGGER_TIME } Scr = ManualLink params = { name = 'Casper Spin' Score = 10 RotateLeftY BalanceAnim = Casper_Range OutAnim = Casper_out ExtraTricks = FlatLandBranches ExtraTricks2 = CasperBranches parent = 'Casper' trickslack = 0 BoardRotate = 1 IsExtra } }
]
AntiCasperBranches =
[ { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink params = { name = 'Anti Casper Flip' Score = 500 extrapercent = 100 Anim = AntiCasperFlip speed = 0.7 BalanceAnim = AntiCasper_Range OutAnim = AntiCasper_out ExtraTricks = FlatLandBranches ExtraTricks2 = AntiCasperBranches parent = 'Anti Casper' extrapercent = 100 trickslack = 0 Nollie BoardRotate = 1 IsExtra } }
  { Trigger = { Press R2 ROTATEY_TRIGGER_TIME } Scr = ManualLink params = { name = 'Anti Casper Spin' Score = 10 RotateRightY BalanceAnim = AntiCasper_Range OutAnim = AntiCasper_out ExtraTricks = FlatLandBranches ExtraTricks2 = AntiCasperBranches parent = 'Anti Casper' trickslack = 0 BoardRotate = 1 IsExtra } }
  { Trigger = { Press L2 ROTATEY_TRIGGER_TIME } Scr = ManualLink params = { name = 'Anti Casper Spin' Score = 10 RotateLeftY BalanceAnim = AntiCasper_Range OutAnim = AntiCasper_out ExtraTricks = FlatLandBranches ExtraTricks2 = AntiCasperBranches parent = 'Anti Casper' trickslack = 0 BoardRotate = 1 IsExtra } }
]
TruckstandBranches =
[ { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink params = { name = 'Truckstand Flip' Score = 500 Anim = Truckstand_Flip BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out ExtraTricks = FlatLandBranches ExtraTricks2 = TruckstandBranches parent = 'TruckStand' extrapercent = 100 trickslack = 0 IsExtra } }
  { Trigger = { HoldTwoAndPress R2 L2 Triangle 500 } Scr = ManualLink params = { name = 'Pogo to Hair Flip' RodneyOnly Score = 1500 Anim = Sweet BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out ExtraTricks = FlatLandBranches ExtraTricks2 = TruckstandBranches parent = 'TruckStand' trickslack = 0 IsExtra } }
  { Trigger = { Press R2 ROTATEY_TRIGGER_TIME } Scr = ManualLink params = { name = 'TruckSpin' Score = 10 RotateRightY BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out ExtraTricks = FlatLandBranches ExtraTricks2 = TruckstandBranches parent = 'TruckStand' trickslack = 0 IsExtra } }
  { Trigger = { Press L2 ROTATEY_TRIGGER_TIME } Scr = ManualLink params = { name = 'TruckSpin' Score = 10 RotateLeftY BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out ExtraTricks = FlatLandBranches ExtraTricks2 = TruckstandBranches parent = 'TruckStand' trickslack = 0 IsExtra } }
]
HandstandBranches =
[ { Trigger = TRIGGER_MANUAL_BRANCHFLIP Scr = ManualLink params = { name = 'Handflip' Score = 500 Anim = HStandFliptoHStand BalanceAnim = HandstandHandFlip_Range OutAnim = HandstandHandFlip_out ExtraTricks = FlatLandBranches ExtraTricks2 = HandstandBranches parent = 'HandStand' extrapercent = 100 trickslack = 0 IsExtra } } ]
FlatLandBranches =
[
  { Trigger = { inorder Square Circle 300 } Trick_AntiCasper }
  { Trigger = { inorder Square Triangle 300 } Trick_Casper }
  { Trigger = { inorder Circle Circle 300 } Trick_Handstand }
  { Trigger = { inorder Circle Square 300 } Trick_ToRail }
  { Trigger = { inorder Circle Triangle 300 } Trick_OneFootManual }
  { Trigger = { inorder Circle Triangle 300 } Trick_OneFootNosemanual }
  { Trigger = { TripleInOrder , Left , Right , Square , 500 } Trick_Spacewalk }
  { Trigger = { inorder Triangle Triangle 300 } Trick_Pogo }
  { Trigger = { inorder Triangle Circle 300 } Trick_SwitchFootPogo }
  { Trigger = { inorder Triangle Square 300 } Trick_Truckstand }
]
PogoBranches =
[
  { Trigger = TRIGGER_MANUAL_BRANCHFLIP Trick_PogoFlip }
  { Trigger = { Press R2 ROTATEY_TRIGGER_TIME } Scr = ManualLink params = { name = 'Pogo Spin' Score = 10 RotateRightY BalanceIdle = Pogo_Bounce OutAnim = Pogo_Out ExtraTricks = FlatLandBranches ExtraTricks2 = PogoBranches parent = 'Pogo' trickslack = 0 IsExtra } }
  { Trigger = { Press L2 ROTATEY_TRIGGER_TIME } Scr = ManualLink params = { name = 'Pogo Spin' Score = 10 RotateLeftY BalanceIdle = Pogo_Bounce OutAnim = Pogo_Out ExtraTricks = FlatLandBranches ExtraTricks2 = PogoBranches parent = 'Pogo' trickslack = 0 IsExtra } }
]
NoseManualBranches =
[ { Trigger = { Press R2 200 } Trick_Gturn }
  { Trigger = TRIGGER_MANUAL_BRANCHFLIP Trick_HalfCabImpossible }
  { Trigger = { inorder Circle Triangle 300 } Trick_OneFootNosemanual }
]
ManualBranches =
[ { Trigger = { Press R2 200 } Trick_Gturn2 }
  { Trigger = TRIGGER_MANUAL_BRANCHFLIP Trick_360FlipNoseManual }
  { Trigger = { inorder Circle Triangle 300 } Trick_OneFootManual }
]
SpacewalkBranch =
[ 
  { Trigger = { TripleInOrder , Left , Right , Square , 500 } Scr = Manual params = { name = 'Manual' Score = 100 InitAnim = SpacewalkToManual BalanceAnim = Manual_Range BalanceAnim2 = Manual_Range2 OffMeterTop = ManualBail OffMeterBottom = ManualLand ExtraTricks2 = ManualBranches ExtraTricks = FlatLandBranches CheckCheese } }
]
script Manual BlendPeriod = 0.3
  SetTrickName ""
  SetTrickScore 0
  Display Blockspin
  ClearLipCombos
  ClearExceptions
  ResetLandedFromVert
  KillExtraTricks
  if ( better4_control_manualfloat_value = off )
    ClearTrickQueues
  endif
  SetException Ex = GroundGone Scr = GroundGone params = { NoBoneless }
  SetException Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called CallInsteadOfGoto
  if GotParam Nollie
    SetException Ex = Ollied Scr = NollieNoDisplay params = { <...> }
    NollieOn
  else
    NollieOff
    SetException Ex = Ollied Scr = Ollie params = { <...> }
  endif	 
  SetException Ex = FlailHitWall Scr = FlailHitWall
  SetException Ex = FlailLeft Scr = FlailLeft
  SetException Ex = FlailRight Scr = FlailRight
  SetException Ex = OffMeterTop Scr = <OffMeterTop> params = { <...> }
  SetException Ex = OffMeterBottom Scr = <OffMeterBottom> params = { <...> }
  SetException Ex = Carplant Scr = Carplant
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetException Ex = Skitched Scr = Skitch
  OnExceptionRun CheckForNewTrick_ManualOut
  SetTags state = skater_inmanual
  SetQueueTricks NoTricks
  SpawnClothingLandScriptHalfMax
  if GotParam IsSpecial
    SetManualTricks NoTricks
  else
    if GotParam IsExtra
      SetManualTricks NoTricks
    else
      SetManualTricks NoTricks Special = SpecialManualTricks
    endif
  endif
  StartBalanceTrick
  if not IsNGC
    Vibrate actuator = 1 percent = 25
  endif
  if GotParam Friction
    SetRollingFriction <Friction>
  endif
  if GotParam IsSpecial
    if GotParam Nollie
      DoBalanceTrick ButtonA = Up ButtonB = Down type = Nosemanual Tweak = 5
    else
      DoBalanceTrick ButtonA = Up ButtonB = Down type = Manual Tweak = 5
    endif
  else
    if GotParam Nollie
      DoBalanceTrick ButtonA = Up ButtonB = Down type = Nosemanual Tweak = 1
    else
      DoBalanceTrick ButtonA = Up ButtonB = Down type = Manual Tweak = 1
    endif
  endif
  if GotParam FromAir
    PlayAnim Anim = <FromAirAnim> BlendPeriod = 0.0
  else
    PlayAnim Anim = <InitAnim> BlendPeriod = 0.3
  endif
  if Obj_FlagSet FLAG_SKATER_MANUALCHEESE
    if AirTimeLessThan 1 second
      if GotParam CheckCheese
        GetManualCheese
        ManualCheese = ( <ManualCheese> + 1 )
        SetTags ManualCheese = <ManualCheese>
        Printf "::::::::::::::::::::Cheese= %c" c = <ManualCheese>
        if ( <ManualCheese> > 1 )
          Printf "MESSING WITH BALANCE TO FIGHT CHEESERS"
          AdjustBalance TimeAdd = 2 SpeedMult = 2 LeanMult = 1.2
        endif
      endif
    endif
  else
    Obj_SetFlag FLAG_SKATER_MANUALCHEESE
    SetTags ManualCheese = 0
  endif
  if gotparam ExtraTricks3
       SetExtraTricks <ExtraTricks3> <ExtraTricks2> <ExtraTricks> ignore = <name>
 else
      if GotParam ExtraTricks2
          SetExtraTricks <ExtraTricks2> <ExtraTricks> ignore = <name>
      else
          if GotParam ExtraTricks
              SetExtraTricks <ExtraTricks> ignore = <name>
          endif
	  endif
  endif
  if GotParam CheckCheese
    WaitAnim 13 frames
  else
    WaitAnim MANUAL_DISPLAY_WAIT frames
  endif
  if GotParam ExtraWaitPercent
    WaitAnim <ExtraWaitPercent> percent
  endif
  SetTrickName <name>
  SetTrickScore <Score>
  Display Blockspin
  if GotParam IsSpecial
    LaunchSpecialMessage
  endif
  if GotParam IsExtra
    LaunchExtraMessage
  endif
  if GotParam ExtraSpeedBoost 
	SpacewalkBoost ExtraSpeedBoost = <ExtraSpeedBoost> 
  endif
  WaitAnimFinished
  if GotParam FlipGraphic
    BoardRotate
  endif
  if GotParam IsSpecial
  else
    if GotParam IsExtra
    else
      DoNextManualTrick
    endif
  endif
  if GotParam SproingFlip
    BlendPeriodOut 0
    FlipAfter
  endif
  if GotParam NoBlend
    BlendPeriodOut 0
  endif
  if GotParam BalanceIdle
    PlayAnim Anim = <BalanceIdle> cycle BlendPeriod = <BlendPeriod>
  else
    if GotParam BalanceAnim2
      PlayAnim random( @Anim = <BalanceAnim> @Anim = <BalanceAnim2>  ) wobble wobbleparams = Manual_wobble_params
    else
      PlayAnim Anim = <BalanceAnim> wobble wobbleparams = Manual_wobble_params
    endif
  endif
  if GotParam SpawnScript
    Obj_KillSpawnedScript name = <SpawnScript>
    Obj_SpawnScript <SpawnScript>
  endif
endscript

script SpacewalkBoost ExtraSpeedBoost = 200 
 GetSpeed 
 if ( <Speed> < <ExtraSpeedBoost> ) 
	SetSpeed <ExtraSpeedBoost> 
 endif 
 printf "Speed=%s" s = <Speed> 
endscript

script CheckForNewTrick_ManualOut
  Printf "give the events back!!!!!!!"
  RestoreExtraTrickEvents 100
  ManualOut
endscript
Manual_wobble_params = {
  WobbleAmpA = { (0.05, 0.05) STATS_MANUAL }
  WobbleAmpB = { (0.04, 0.04) STATS_MANUAL }
  WobbleK1 = { (0.0022, 0.0022) STATS_MANUAL }
  WobbleK2 = { (0.0017, 0.0017) STATS_MANUAL }
  SpazFactor = { (1, 1) STATS_MANUAL }
}
script ManualOut
  if GotParam MadeOtherSkaterBail
  else
    KillExtraTricks
  endif
  SetTrickName ''
  SetTrickScore 0
  Display Blockspin
endscript
script ManualLand
  VibrateOff
  SetException Ex = RunHasEnded Scr = EndOfRun
  SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
  ClearPanel_Landed
  ClearManualTrick
  ClearEventBuffer
  ClearTrickQueue
  KillExtraTricks
  if GotParam PutDownAnim
    PlayAnim Anim = <PutDownAnim> BlendPeriod = 0.0
  else
    if GotParam Nollie
      PlayAnim Anim = PutDownNosemanual BlendPeriod = 0.0
    else
      PlayAnim Anim = PutDownManual BlendPeriod = 0.0
    endif
  endif
  WaitAnimWhilstChecking
  Goto OnGroundAi
endscript
script ManualLink grindslack = 25 trickslack = 10 displaypercent = 50 TimeAdd = 0 SpeedMult = 1 speed = 1.0
  SpawnClothingLandScriptHalfMax
  GetManualName
  if ( <ManualName> = <name> )
    Printf "TRYING TO DO THE SAME MANUAL TWICE IN A ROW!!!!"
    AdjustBalance TimeAdd = 2 SpeedMult = 1.25
  endif
  if GotParam RodneyOnly
    if ProfileEquals is_named = Mullen
    else
      Goto ManualLink params = { name = 'Truck Spin' Score = 1000 Anim = Truckstand_Init BalanceAnim = Truckstand_Range OutAnim = Truckstand_Out ExtraTricks = FlatLandBranches ExtraTricks2 = TruckstandBranches trickslack = 0 IsExtra }
    endif
  endif
  if GotParam Nollie
    NollieOn
    SetException Ex = Ollied Scr = NollieNoDisplay
  else
    NollieOff
    SetException Ex = Ollied Scr = Ollie params = { Anim = <Anim> OutAnim = <OutAnim> BoardRotate = <BoardRotate> BoardFlipAfter = <BoardFlipAfter> FlipAfter = <FlipAfter> NoBlend = <NoBlend> }
  endif
  if GotParam OffMeterTop
    SetException Ex = OffMeterTop Scr = <OffMeterTop> params = { <...> }
    SetException Ex = OffMeterBottom Scr = <OffMeterBottom> params = { <...> }
  endif
  KillExtraTricks
  OnExceptionRun ManualOut
  BailOn
  SetTrickName <name>
  SetTrickScore <Score>
  AdjustBalance TimeAdd = <TimeAdd> SpeedMult = <SpeedMult>
  if GotParam Anim
    PlayAnim Anim = <Anim> BlendPeriod = 0.3 speed = <speed>
  endif
  if GotParam RotateLeftY
    if ( better4_control_manualspin_value = on )
      RotateDisplay Y duration = 0.75 seconds StartAngle = 0.0 EndAngle = 360.0 SinePower = 0 RotationOffset = (0, 30, 0)
      SetExtraTricks <ExtraTricks2> <ExtraTricks> ignore = <name>
      Wait 0.7 seconds
      PlayManualBalanceAnim <...>
    endif
  endif
  if GotParam RotateRightY
    if ( better4_control_manualspin_value = on )
      RotateDisplay Y duration = 0.75 seconds StartAngle = 0.0 EndAngle = -360.0 SinePower = 0 RotationOffset = (0, 30, 0)
      SetExtraTricks <ExtraTricks2> <ExtraTricks> ignore = <name>
      Wait 0.7 seconds
      PlayManualBalanceAnim <...>
    else
      if Flipped
        RotateDisplay Y duration = 0.75 seconds StartAngle = 0.0 EndAngle = -360.0 SinePower = 0 RotationOffset = (0, 30, 0)
        SetExtraTricks <ExtraTricks2> <ExtraTricks> ignore = <name>
        Wait 0.7 seconds
        PlayManualBalanceAnim <...>
      else
        RotateDisplay Y duration = 0.75 seconds StartAngle = 0.0 EndAngle = 360.0 SinePower = 0 RotationOffset = (0, 30, 0)
        SetExtraTricks <ExtraTricks2> <ExtraTricks> ignore = <name>
        Wait 0.7 seconds
        PlayManualBalanceAnim <...>
      endif
    endif
  endif
  if GotParam Anim
    Wait 5 frames
  endif
  if GotParam PlayCessSound
    PlaySound foleymove01 pitch = 130 vol = 100
  endif
  if GotParam IsExtra
    if not GotParam RotateRightY
      if not GotParam RotateLeftY
        if not GotParam ReemoSpin
          if not GotParam PlayCessSound
            LaunchExtraMessage
          endif
        endif
      endif
    endif
  endif
  if GotParam IsSpecial
    LaunchSpecialMessage
  endif
  if GotParam RotateRightY
  else
    if GotParam RotateLeftY
    else
      WaitAnim MANUAL_DISPLAY_WAIT frames
    endif
  endif
  if GotParam NoDisplay
  else
    if GotParam RotateLeftY
      if ( <key_value> = on )
        Display AddSpin = 360
      endif
    else
      if GotParam RotateRightY
        Display AddSpin = 360
      else
        Display Blockspin
        SetTags ManualName = <name>
      endif
    endif
  endif
  if GotParam extrapercent
    Printf "waiting an extrapercent"
    WaitAnim <extrapercent> percent
  endif
  Printf "Setting extra tricks active"
  SetManualExtraTricks <...>
  if GotParam FlipAfter
    FlipAfter
    BlendPeriodOut 0
    BoardRotateAfter
  endif
  if GotParam RotateAfter
    BlendPeriodOut 0
    RotateAfter
  endif
  if GotParam BoardFlipAfter
    BlendPeriodOut 0
    BoardRotateAfter
  endif
  if GotParam Anim
    WaitAnim <extrapercent> percent
  endif
  WaitAnim <grindslack> frames fromend
  BailOff
  WaitAnim <trickslack> frames fromend
  WaitAnimFinished
  PlayManualBalanceAnim <...>
endscript
script PlayManualBalanceAnim
  if GotParam BalanceIdle
    PlayAnim Anim = <BalanceIdle> cycle
  else
    PlayAnim Anim = <BalanceAnim> wobble
  endif
  if AnimEquals LazyAss_Idle
    begin
      if FrameIs 20
        PlaySound bitchslap2
      endif
      WaitOneGameFrame
    repeat
  endif
endscript
script SetManualExtraTricks parent = 'none'
  if GotParam ExtraTricks2
    SetExtraTricks <ExtraTricks2> <ExtraTricks> ignore = <parent>
  else
    if GotParam ExtraTricks
      if GotParam NoDisplay
        SetExtraTricks tricks = <ExtraTricks>
      else
        SetExtraTricks tricks = <ExtraTricks>
      endif
    endif
  endif
endscript
script GetManualName ManualName = 'none'
  GetTags
  return ManualName = <ManualName>
endscript
script GetManualCheese
  GetTags
  return ManualCheese = <ManualCheese>
endscript
script Fireworks
  Obj_GetId
  MangleChecksums a = skatersplash b = <objId>
  SetScript name = <mangled_id> Emitscript = emit_fireworks updatescript = fireworks_update
  EmptyParticleSystem name = <mangled_id>
  Obj_PlayStream WheelFireworks
  begin
    if AnimEquals _4thofJuly_idle
      if FrameIs 38
        ParticlesOn name = <mangled_id>
        Wait 0.1 seconds
        ParticlesOff name = <mangled_id>
      endif
      if FrameIs 100
        ParticlesOn name = <mangled_id>
        Wait 0.1 seconds
        ParticlesOff name = <mangled_id>
      endif
    else
      break
    endif
    Wait 1 game frame
  repeat
  Wait 0.25 seconds
  SetScript name = <mangled_id> Emitscript = emit_skatersplash updatescript = skatersplash_update
endscript
script emit_fireworks
  SetLife min = 0.1 max = 0.3
  SetAngleSpread spread = 0.75
  SetSpeedRange min = 0.5 max = 2.5
  SetEmitRange width = 2.0 height = 2.0
  SetForce force = (0, -0.1, 0)
  SetEmitTarget target = (0, 1, 0)
  SetParticleSize sw = 1.0 sh = 1.0 ew = 1 eh = 1.0
  SetColor corner = 0 sr = 255 sg = 255 sb = 255 sa = 255 ma = 255 er = 255 eg = 255 eb = 255 ea = 0
  SetColor corner = 1 sr = 255 sg = 255 sb = 64 sa = 128 ma = 128 er = 255 eg = 64 eb = 64 ea = 0
  SetColor corner = 2 sr = 255 sg = 64 sb = 64 sa = 0 ma = 0 er = 255 eg = 64 eb = 64 ea = 0
  SetCircularEmit circular = 0
  begin
    if ShouldEmitParticles name = <name>
      Emit num = 15
    endif
    Wait 1 game frame
  repeat
endscript
script fireworks_update bone = head
  begin
    GetBonePosition id = <objId> bone = head
    Y = ( <Y> + 10 )
    SetPos X = <X> Y = <Y> z = <z>
    Wait 1 gameframe
  repeat
endscript
