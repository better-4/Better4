# Better4

Better4 is a THPS4 modpack that includes modern gameplay and QOL features while maintaining the spirit of the original game.

> [!WARNING]
> Better4 is beta software and may contain bugs. See [Known Issues](#known-issues).

## Installation

First, verify THPS4 is installed. Download the [latest GitHub release](https://github.com/better-4/Better4/releases/latest) and drag `Skate4.exe` from your THPS4 game directory onto `install.bat`.

If you have an existing PARTYMOD-THPS4 installation, you may copy `partymod.ini` to `better4.ini` to reuse the same configuration. Alternatively, you may run `better4config.exe` and configure from scratch.

Better4 does not modify any vanilla game files. Any game data created by the installer is contained in `**/better4/**` subdirectories, which are only referenced when `better4.exe` is run.

> [!NOTE]
> If THPS4 is installed to Program Files (or another directory which requires admin access to write files), you may have to run as admin.
> The installer script will prompt to re-run as admin if needed, but `better4.exe` and `better4config.exe` must be manually run as admin for config changes to save.
> This may be set persistently by right-clicking on the exe and going to `Properties > Compatibility > Change settings for all users > Run this program as an administrator`.

## Features

### Gameplay

Better4 ships with THPS4 default controls, but can be configured to your liking.

* Left and right dropdown
* Left and right manual spin
* PS2-exclusive manual float glitches (MFG, MQT, etc.)
* Single-tap WalliePlants
* Boneless tricks (beanplant, fastplant, MikeV)
* Configurable:
  * Double revert after dropdown
  * Lip tricks
  * Rail spin
  * Wall spin
  * Wallride bail (enables THUG1 BP)
  * Stance change
* Restored unused animations:
  * Benihana flip
  * Nollie 360 flip
  * Kickflip to indy
  * Kickflip to crail
  * THPS3 specials (handspring layout, etc.)

### Online

* Added in-game server browser
* Added better observe functionality (observe after 0, don't need to leave game)
* Added "exit observe" and "sit out" options

### CAS

* Added board scales
* Added X + Y + Z + XYZ sliders for all scales
* Widened min/max scales (0-200)
* Unlocked full RGB range
* Restored hidden CAS items for pros, secret skaters, and neversoft devs
* Added custom boards (banana, hoverboard, old school, ollie)
* Added bunched cargos
* Unassign trick in "Edit Tricks" menu

### Misc

* Disable pause on unfocus
* Disable board scuff
* Configure buttons font (PS3, Xbox, PC)

## Known Issues

* Can't navigate pause menu in online games with arrow keys

## Credits

A special thank you to the following people, without whom this project would not exist:

* [@zedthps](https://github.com/zedthps), [@voss10](https://github.com/voss10), and [@1borgy](https://github.com/1borgy) for their contributions
* [@PARTYMANX](https://github.com/PARTYMANX) for their work on [partymod-thps4](https://github.com/PARTYMANX/partymod-thps4)
* [@DCxDemo](https://github.com/DCxDemo) for their work on [THPSQScriptEd](https://github.com/DCxDemo/LegacyTHPS/)
* [PunishedFiddle](https://www.moddb.com/members/punishedfiddle) for their work on [Tony Hawk's Pro Skater 4 Gamepad Prompts](https://www.moddb.com/games/tony-hawks-pro-skater-4/downloads/tony-hawks-pro-skater-4-gamepad-prompts)

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
