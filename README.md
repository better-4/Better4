# Better4

Better4 is a THPS4 modpack that includes modern gameplay and QOL features while maintaining the look and feel of the original game.

> [!WARNING]
> Better4 is beta software and may contain bugs. See [Known Issues](#known-issues).

## Installation

First, verify THPS4 is installed. Download the [latest GitHub release](https://github.com/better-4/Better4/releases/latest), unzip it, and run `install.bat`, selecting your `Skate4.exe` file when prompted. Alternatively, you may drag and drop `Skate4.exe` from your THPS4 game directory onto `install.bat`.

If you have an existing PARTYMOD-THPS4 installation, you may copy `partymod.ini` to `better4.ini` to reuse the same configuration. Alternatively, you may run `better4config.exe` and configure from scratch.

Better4 does not modify any vanilla game files. Any game data created by the installer is contained in `**/better4/**` subdirectories, which are only referenced when `better4.exe` is run.

> [!NOTE]
> If THPS4 is installed to Program Files (or another directory which requires admin access to write files), you may have to run as admin for config changes to save.
> The installer script will prompt to re-run as admin if needed, but `better4.exe` and `better4config.exe` must be manually run as admin.
> This may be set persistently by right-clicking on the exe and going to `Properties > Compatibility > Change settings for all users > Run this program as an administrator`.

## Features

### Gameplay

Better4 ships with THPS4 default controls, but can be configured to your liking. Here is a brief overview of all gameplay features added:

* Added left and right dropdown
* Added left and right manual spin
* Added PS2-exclusive manual float glitches (MFG, MQT, etc.)
* Added spacewalk
* Added wallpush
* Added pressure flips
* Added single-tap WalliePlants
* Added configuration for boneless trick (beanplant, fastplant, MikeV)
* Added toggles for:
  * Double revert after dropdown
  * Lip tricks
  * Rail spin
  * Wall spin
  * Wallride bail (enables THUG1 BP)
  * Stance change
* Restored unused animations:
  * Beni Fingerflip
  * Nollie 360 Flip
  * Kickflip to Indy
  * Kickflip to Crail
  * THPS3 specials (Handspring Layout, etc.)
* Made some tricks holdable:
  * Ollie North
  * Double Kickflip Varial Indy

### Online

* Added NAT negotiation when connecting to servers (no more port forwarding!)
* Added server browser
* Added lobby player list and peerchat
* Added better observe functionality (observe after 0, don't need to leave game)
* Added observe UI
* Added "Restart Game" option to game ranking screen
* Added chat size and duration configuration
* Added chat commands (/obs, /set, /goto)

### Levels

* Added Los Angeles from THPS3
* Improved collision in THPS4 levels
  * Made more surfaces wallridable
  * Removed bottom-plane collisions in a few spots where a wallride makes the skater hit their head on a ledge above (e.g. slam bros warehouse in San Francisco)
* Enabled Zoo teleport in multiplayer games; teleport is now two-way

### CAS

* Added board scales
* Added X + Y + Z + XYZ sliders for all scales
* Widened min/max scales (0-200)
* Unlocked full RGB range
* Restored hidden CAS items for pros, secret skaters, and neversoft devs
* Added custom boards (banana, hoverboard, old school, ollie)
* Added various CAS items from other games (bunched cargos, muska hat, zoom glasses)
* Added option to change CAS during gameplay (local-only)

### Misc

* Added toggle for pause-on-unfocus
* Added toggle for board scuff
* Added button to unassign trick in "Edit Tricks" menu
* Added configuration for buttons font (PS2, Xbox, PC)
* Added FOV configuration
* Added aspect ratio configuration
* Added size customization for panel elements (trick string, score, etc.)
* Added toggle for the main menu demo that plays after a period of inactivity

## Known Issues

* Using updated collision causes trash cans to fall through the map
* LA graffiti trick objects, KOTH crown, CTF flags, gaps, etc. not yet implemented

## Credits

A special thank you to the following people, without whom this project would not exist:

* [@zedthps](https://github.com/zedthps), [@voss10](https://github.com/voss10), [@1borgy](https://github.com/1borgy), and [@clairethps](https://github.com/clairethps) for their contributions
* [@PARTYMANX](https://github.com/PARTYMANX) for their work on [partymod-thps4](https://github.com/PARTYMANX/partymod-thps4)
* [@DCxDemo](https://github.com/DCxDemo) for their work on [THPSQScriptEd](https://github.com/DCxDemo/LegacyTHPS/)
* The folks at [@GameProgressive](https://github.com/GameProgressive) for their work on [UniSpySDK](https://github.com/GameProgressive/UniSpySDK)
* [@denetii](https://github.com/denetii) for their work on [io_thps_scene](https://github.com/denetii/io_thps_scene)
* [Peachboy](https://steamcommunity.com/id/peachnerd) for their work on Los Angeles' loading screen
* [PunishedFiddle](https://www.moddb.com/members/punishedfiddle) for their work on [Tony Hawk's Pro Skater 4 Gamepad Prompts](https://www.moddb.com/games/tony-hawks-pro-skater-4/downloads/tony-hawks-pro-skater-4-gamepad-prompts)
* [@ILC-YTP](https://github.com/ILC-YTP) for their work on [Faster Save/Load](https://github.com/ILC-YTP/THPS4-mods/tree/main/Faster-SaveLoad)

## For Developers

Clone the Better4 repo with the `--recurse-submodules` option:

```
git clone --recurse-submodules git@github.com:better-4/Better4.git --config core.autocrlf=false --config core.eol=lf
cd Better4
```

### Building with Docker

Using Docker is the easiest way to build Better4, as it automates the process of pulling build dependencies and building a release.

Install [Docker Desktop](https://docs.docker.com/desktop/setup/install/windows-install/), then verify the Docker Engine is running and run:

```
docker build -f Dockerfile --target export -o build/out .
```

Build artifacts will be exported to the `build/out` directory.
