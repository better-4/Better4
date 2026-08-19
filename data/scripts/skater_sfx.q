
MusicVolume = 60
script LoadPermSounds
  LoadPermSFX
  LoadPermSongs
endscript
script LoadPermSFX
  LoadPreFile "skater_sounds.pre"
  LoadSound "Skater\wheels01" FLAG_PERM vol = 10
  LoadSound "Skater\bail04" FLAG_PERM vol = 50
  LoadSound "Skater\bail05" FLAG_PERM vol = 50
  LoadSound "Skater\bodysmackA" FLAG_PERM vol = 50
  LoadSound "Skater\headsmackB" FLAG_PERM
  LoadSound "Shared\Goals\HUD_jumpgap" FLAG_PERM
  LoadSound "Shared\Goals\HUD_specialtrickAA" FLAG_PERM
  LoadSound "Shared\Hits\HitDumpsterX" FLAG_PERM
  LoadSound "Shared\Hits\HitVehicle3" FLAG_PERM
  LoadSound "Skater\boneless09" FLAG_PERM
  LoadSound "Skater\boardbail01" FLAG_PERM vol = 50
  LoadSound "Skater\boardbail02" FLAG_PERM vol = 50
  LoadSound "Skater\foleymove01" FLAG_PERM vol = 50
  LoadSound "Skater\foleyslide04" FLAG_PERM vol = 50
  LoadSound "Skateshop\Skater_boardup" FLAG_PERM vol = 50
  LoadSound "Skater\hitblood01" FLAG_PERM vol = 50
  LoadSound "Skater\hitblood02" FLAG_PERM vol = 50
  LoadSound "Skater\hitblood04" FLAG_PERM vol = 50
  LoadSound "Skater\hitblood05" FLAG_PERM vol = 50
  LoadSound "Skater\hitbody03" FLAG_PERM vol = 50
  LoadSound "Skater\hitbody04" FLAG_PERM vol = 50
  LoadSound "Skater\hitface01" FLAG_PERM vol = 50
  LoadSound "Skater\hitface02" FLAG_PERM vol = 50
  LoadSound "Skater\bail_knee1" FLAG_PERM
  LoadSound "Skater\bail_backward1" FLAG_PERM
  LoadSound "Skater\Bailrunoutflip" FLAG_PERM
  LoadSound "Skater\Nosemanualbail" FLAG_PERM
  LoadSound "Skater\bitchslap2" FLAG_PERM
  LoadSound "Shared\Goals\HUDtrickslopC" FLAG_PERM
  LoadSound "Shared\Goals\HUDtrickperfect" FLAG_PERM
  LoadSound "Skater\hitbody02" FLAG_PERM
  LoadSound "Skater\OllieMetalFuture" FLAG_PERM
  LoadSound "Shared\Menu\menu05" FLAG_PERM
  LoadSound "Skater\RevertWood" FLAG_PERM
  LoadSound "Skater\extratrick" FLAG_PERM
  LoadSound "Skater\laserfire" FLAG_PERM
  LoadSound "Shared\Menu\menu03" FLAG_PERM
  LoadSound "Shared\Menu\timeoutA" FLAG_PERM vol = 50
  LoadSound "Skater\copinghit3_11" FLAG_PERM vol = 100
  LoadSound "Shared\Goals\PedProps" FLAG_PERM vol = 100
  LoadSound "Shared\Menu\GUI_click06" FLAG_PERM vol = 100
  LoadSound "Shared\Menu\GUI_type02" FLAG_PERM vol = 100
  LoadSound "Shared\Animal\HorseWhinny" FLAG_PERM vol = 100
  LoadSound "Shared\Menu\GUI_buzzer01" FLAG_PERM vol = 100
  LoadSound "Shared\Goals\GapSound" FLAG_PERM vol = 100 dropoff = 0
  LoadSound "Shared\Goals\GoalDone" FLAG_PERM vol = 100 dropoff = 0
  LoadSound "Shared\Menu\LevelAnimateTop" FLAG_PERM
  LoadSound "Shared\Menu\LevelAnimateLeft" FLAG_PERM
  LoadSound "Shared\Menu\AnimateIn" FLAG_PERM
  LoadSound "Shared\Menu\AnimateOut" FLAG_PERM
  LoadSound "Shared\Menu\MenuBack" FLAG_PERM
  LoadSound "Shared\Menu\MenuDown" FLAG_PERM
  LoadSound "Shared\Menu\MenuUp" FLAG_PERM
  LoadSound "Shared\Menu\MenuSelect" FLAG_PERM
  LoadSound "Shared\Menu\GoToLoadLevel" FLAG_PERM
  LoadSound "Shared\Goals\TetrisAway" FLAG_PERM
  LoadSound "Shared\Goals\GoalGood" FLAG_PERM
  LoadSound "Shared\Goals\GoalFail" FLAG_PERM
  LoadSound "Shared\Goals\GoalMidGood" FLAG_PERM
  LoadSound "Shared\Goals\Cash" FLAG_PERM vol = 100 dropoff = 150
  LoadSound "Skater\clap01" FLAG_PERM
  LoadSound "Skater\clap02" FLAG_PERM
  LoadSound "Skater\clap03" FLAG_PERM
  LoadSound "Skater\extratrick_alt" FLAG_PERM
  UnloadPreFile "skater_sounds.pre"
endscript
script LoadPermSongs
  if IsTrue Xbox
  else
    if IsTrue TestMusicFromHost
      LoadMusicHeader "music\music"
      AddMusicTrack "music\acdc" FLAG_PERM TrackTitle = "AC/DC: TNT"
      AddMusicTrack "music\Aesop" FLAG_PERM TrackTitle = "Aesop Rock: Labor"
      AddMusicTrack "music\agent" FLAG_PERM TrackTitle = "Agent Orange: Speed Kills (Darkness Version)"
      AddMusicTrack "music\Avail" FLAG_PERM TrackTitle = "Avail: Simple Song"
      AddMusicTrack "music\Bouncing" FLAG_PERM TrackTitle = "Bouncing Souls: Manthem"
      AddMusicTrack "music\citystars" FLAG_PERM TrackTitle = "City Stars: Bad Dreams"
      AddMusicTrack "music\delasoul" FLAG_PERM TrackTitle = "De La Soul: Oodles of O's"
      AddMusicTrack "music\Delinquenth" FLAG_PERM TrackTitle = "Delinquent Habits: House of the Rising Drum"
      AddMusicTrack "music\Eyedea" FLAG_PERM TrackTitle = "Eyedea & Abilities: Big Shots"
      AddMusicTrack "music\Floggingm" FLAG_PERM TrackTitle = "Flogging Molly: Drunken Lullabies"
      AddMusicTrack "music\gangstarr" FLAG_PERM TrackTitle = "Gang Starr: Mass Appeal"
      AddMusicTrack "music\goldfinger" FLAG_PERM TrackTitle = "Goldfinger: Spokesman"
      AddMusicTrack "music\Haiku" FLAG_PERM TrackTitle = "Haiku De'Etat: Non Compos Mentis"
      AddMusicTrack "music\Hotwater" FLAG_PERM TrackTitle = "Hot Water Music: Freightliner"
      AddMusicTrack "music\IronM" FLAG_PERM TrackTitle = "Iron Maiden: The Number of the Beast"
      AddMusicTrack "music\jfa" FLAG_PERM TrackTitle = "JFA: Beach Blanket Bongload"
      AddMusicTrack "music\lunchbox1" FLAG_PERM TrackTitle = "Lunchbox Avenue: Everything and Anything"
      AddMusicTrack "music\lunchbox2" FLAG_PERM TrackTitle = "Lunchbox Avenue: Standing Still"
      AddMusicTrack "music\lessthanjake" FLAG_PERM TrackTitle = "Less Than Jake: All My Friends Are Metalheads"
      AddMusicTrack "music\lootpack" FLAG_PERM TrackTitle = "Lootpack: Whenimondamic"
      AddMusicTrack "music\bizmarkie" FLAG_PERM TrackTitle = "Muskabeatz-Biz Markie: Body Rock"
      AddMusicTrack "music\jeru" FLAG_PERM TrackTitle = "Muskabeatz-Jeru the Damaja: Verses of Doom"
      AddMusicTrack "music\mellemel" FLAG_PERM TrackTitle = "Muskabeatz-Melle Mel: Im a Star"
      AddMusicTrack "music\Nebula" FLAG_PERM TrackTitle = "Nebula: Giant"
      AddMusicTrack "music\nwa" FLAG_PERM TrackTitle = "NWA: Express Yourself"
      AddMusicTrack "music\pearizona" FLAG_PERM TrackTitle = "Public Enemy: By the Time I Get to Arizona"
      AddMusicTrack "music\Rocket" FLAG_PERM TrackTitle = "Rocket From The Crypt: Savoir Faire"
      AddMusicTrack "music\rundmc" FLAG_PERM TrackTitle = "Run DMC: My Adidas"
      AddMusicTrack "music\System" FLAG_PERM TrackTitle = "System of a Down: Shimmy"
      AddMusicTrack "music\thecult" FLAG_PERM TrackTitle = "The Cult: Bad Fun"
      AddMusicTrack "music\Distillers" FLAG_PERM TrackTitle = "The Distillers: Seneca Falls"
      AddMusicTrack "music\faction" FLAG_PERM TrackTitle = "The Faction: Skate and Destroy"
      AddMusicTrack "music\offspring" FLAG_PERM TrackTitle = "The Offspring: Blackball"
      AddMusicTrack "music\sexpistols" FLAG_PERM TrackTitle = "The Sex Pistols: Anarchy in the UK"
      AddMusicTrack "music\Toydolls" FLAG_PERM TrackTitle = "Toy Dolls: Dig That Groove Baby"
      AddMusicTrack "music\Usbombs" FLAG_PERM TrackTitle = "U.S. Bombs: Yer Country"
      AddMusicTrack "music\Zeke" FLAG_PERM TrackTitle = "Zeke: Death Alley "
    else
      if CD
        LoadMusicHeader "music\music"
        AddMusicTrack "music\acdc" FLAG_PERM TrackTitle = "AC/DC: TNT"
        AddMusicTrack "music\Aesop" FLAG_PERM TrackTitle = "Aesop Rock: Labor"
        AddMusicTrack "music\agent" FLAG_PERM TrackTitle = "Agent Orange: Speed Kills (Darkness Version)"
        AddMusicTrack "music\Avail" FLAG_PERM TrackTitle = "Avail: Simple Song"
        AddMusicTrack "music\Bouncing" FLAG_PERM TrackTitle = "Bouncing Souls: Manthem"
        AddMusicTrack "music\citystars" FLAG_PERM TrackTitle = "City Stars: Bad Dreams"
        AddMusicTrack "music\delasoul" FLAG_PERM TrackTitle = "De La Soul: Oodles of O's"
        AddMusicTrack "music\Delinquenth" FLAG_PERM TrackTitle = "Delinquent Habits: House of the Rising Drum"
        AddMusicTrack "music\Eyedea" FLAG_PERM TrackTitle = "Eyedea & Abilities: Big Shots"
        AddMusicTrack "music\Floggingm" FLAG_PERM TrackTitle = "Flogging Molly: Drunken Lullabies"
        AddMusicTrack "music\gangstarr" FLAG_PERM TrackTitle = "Gang Starr: Mass Appeal"
        AddMusicTrack "music\goldfinger" FLAG_PERM TrackTitle = "Goldfinger: Spokesman"
        AddMusicTrack "music\Haiku" FLAG_PERM TrackTitle = "Haiku De'Etat: Non Compos Mentis"
        AddMusicTrack "music\Hotwater" FLAG_PERM TrackTitle = "Hot Water Music: Freightliner"
        AddMusicTrack "music\IronM" FLAG_PERM TrackTitle = "Iron Maiden: The Number of the Beast"
        AddMusicTrack "music\jfa" FLAG_PERM TrackTitle = "JFA: Beach Blanket Bongload"
        AddMusicTrack "music\lunchbox1" FLAG_PERM TrackTitle = "Lunchbox Avenue: Everything and Anything"
        AddMusicTrack "music\lunchbox2" FLAG_PERM TrackTitle = "Lunchbox Avenue: Standing Still"
        AddMusicTrack "music\lessthanjake" FLAG_PERM TrackTitle = "Less Than Jake: All My Friends Are Metalheads"
        AddMusicTrack "music\lootpack" FLAG_PERM TrackTitle = "Lootpack: Whenimondamic"
        AddMusicTrack "music\bizmarkie" FLAG_PERM TrackTitle = "Muskabeatz-Biz Markie: Body Rock"
        AddMusicTrack "music\jeru" FLAG_PERM TrackTitle = "Muskabeatz-Jeru the Damaja: Verses of Doom"
        AddMusicTrack "music\mellemel" FLAG_PERM TrackTitle = "Muskabeatz-Melle Mel: Im a Star"
        AddMusicTrack "music\Nebula" FLAG_PERM TrackTitle = "Nebula: Giant"
        AddMusicTrack "music\nwa" FLAG_PERM TrackTitle = "NWA: Express Yourself"
        AddMusicTrack "music\pearizona" FLAG_PERM TrackTitle = "Public Enemy: By the Time I Get to Arizona"
        AddMusicTrack "music\Rocket" FLAG_PERM TrackTitle = "Rocket From The Crypt: Savoir Faire"
        AddMusicTrack "music\rundmc" FLAG_PERM TrackTitle = "Run DMC: My Adidas"
        AddMusicTrack "music\System" FLAG_PERM TrackTitle = "System of a Down: Shimmy"
        AddMusicTrack "music\thecult" FLAG_PERM TrackTitle = "The Cult: Bad Fun"
        AddMusicTrack "music\Distillers" FLAG_PERM TrackTitle = "The Distillers: Seneca Falls"
        AddMusicTrack "music\faction" FLAG_PERM TrackTitle = "The Faction: Skate and Destroy"
        AddMusicTrack "music\offspring" FLAG_PERM TrackTitle = "The Offspring: Blackball"
        AddMusicTrack "music\sexpistols" FLAG_PERM TrackTitle = "The Sex Pistols: Anarchy in the UK"
        AddMusicTrack "music\Toydolls" FLAG_PERM TrackTitle = "Toy Dolls: Dig That Groove Baby"
        AddMusicTrack "music\Usbombs" FLAG_PERM TrackTitle = "U.S. Bombs: Yer Country"
        AddMusicTrack "music\Zeke" FLAG_PERM TrackTitle = "Zeke: Death Alley "
      endif
    endif
  endif
endscript
SK3SFX_TABLE_WHEELROLL = 0
SK3SFX_TABLE_GRIND = 1
SK3SFX_TABLE_JUMP = 2
SK3SFX_TABLE_LAND = 3
SK3SFX_TABLE_BONK = 4
SK3SFX_TABLE_GRINDJUMP = 5
SK3SFX_TABLE_GRINDLAND = 6
SK3SFX_TABLE_SLIDE = 7
SK3SFX_TABLE_SLIDEJUMP = 8
SK3SFX_TABLE_SLIDELAND = 9
SK3SFX_TABLE_CESS = 10
playlist_tracks = [
  { track_title = "AC/DC: TNT" }
  { track_title = "Aesop Rock: Labor" }
  { track_title = "Agent Orange: Speed Kills (Darkness Version)" }
  { track_title = "Avail: Simple Song" }
  { track_title = "Bouncing Souls: Manthem" }
  { track_title = "City Stars: Bad Dreams" }
  { track_title = "De La Soul: Oodles of O's" }
  { track_title = "Delinquent Habits: House of the Rising Drum" }
  { track_title = "Eyedea & Abilities: Big Shots" }
  { track_title = "Flogging Molly: Drunken Lullabies" }
  { track_title = "Gang Starr: Mass Appeal" }
  { track_title = "Goldfinger: Spokesman" }
  { track_title = "Haiku De'Etat: Non Compos Mentis" }
  { track_title = "Hot Water Music: Freightliner" }
  { track_title = "Iron Maiden: The Number of the Beast" }
  { track_title = "JFA: Beach Blanket Bongload" }
  { track_title = "Lunchbox Avenue: Everything and Anything" }
  { track_title = "Lunchbox Avenue: Standing Still" }
  { track_title = "Less Than Jake: All My Friends Are Metalheads" }
  { track_title = "Lootpack: Whenimondamic" }
  { track_title = "Muskabeatz feat. Biz Markie: Body Rock" }
  { track_title = "Muskabeatz feat. Jeru: Verses of Doom" }
  { track_title = "Muskabeatz feat. Melle Mel: Im a Star" }
  { track_title = "Nebula: Giant" }
  { track_title = "NWA: Express Yourself" }
  { track_title = "Public Enemy: By the Time I Get to Arizona" }
  { track_title = "Rocket From The Crypt: Savoir Faire" }
  { track_title = "Run DMC: My Adidas" }
  { track_title = "System of a Down: Shimmy" }
  { track_title = "The Cult: Bad Fun" }
  { track_title = "The Distillers: Seneca Falls" }
  { track_title = "The Faction: Skate and Destroy" }
  { track_title = "The Offspring: Blackball" }
  { track_title = "The Sex Pistols: Anarchy in the UK" }
  { track_title = "Toy Dolls: Dig That Groove Baby" }
  { track_title = "U.S. Bombs: Yer Country" }
  { track_title = "Zeke: Death Alley " }
]
script SpecialSounds frames = 10
  Printf "got launched"
  Wait <frames> frames
  if AnimEquals MightAsWellJump_Init
  endif
endscript
script Jamie_JumpSounds
  Wait 10 frames
  if ProfileEquals is_named = thomas
    if AnimEquals MightAsWellJump_Init
      PlayStream random( @jamie_special01 @jamie_special02 @jamie_special03 @jamie_special04  ) vol = 300
    endif
  endif
  Wait 20 frames
  PlaySound bitchslap2 pitch = 70
endscript
script Jamie_HeroSounds
  Printf "got launched"
  Wait 1 frames
  if ProfileEquals is_named = thomas
    PlayStream random( @jamie_special05 @jamie_special06 @nostream @nostream ) 
  endif
endscript
