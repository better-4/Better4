# Better4

Better4 is a modpack that includes modern gameplay and QOL features while maintaining the spirit of THPS4.

> [!WARNING]
> Better4 is actively in development, and as such may be buggy. See [Known Issues](#known-issues).

## Features

### Gameplay

All new gameplay features are togglable unless otherwise specified.

* Left-side dropdown (not toggleable yet)
* Restored unused animations (beni flip, nollie 360 flip, kickflip to indy, kickflip to crail)
* Modern manuals (left and right spin)
* PS2-exclusive manual tech (MFG, MQT, MSC, MBP)
* Disable lip tricks
* Single-tap wallieplants

### Online

* Added external server browser
* Added "exit observe" and "sit out" observe options

### CAS

* Added board scales
* Added X + Y + Z + XYZ sliders for all scales
* Widened min/max scales (0-200)
* Unlocked full RGB range
* Restored CAS item selections for pros, secret skaters, and neversoft devs

## Installation

Download the latest GitHub release and drag your `Skate4.exe` onto `install.bat`. If your THPS4 install directory is not writable (e.g. program files), you will be prompted to re-run as admin (always check source code!).

## Known Issues

* Online lobbies must be joined using the provided `thps4-server-browser.exe`, which launches `THPS4.exe` with a command-line argument for the server IP.
* Quitting observe mode is sometimes buggy
* KOTH crashes :(

## Credits

A special thank you to the following people, without whom this project would not exist:

* [@zedthps](https://github.com/zedthps), [@voss10](https://github.com/voss10), and [@1borgy](https://github.com/1borgy) for their contributions
* [@PARTYMANX](https://github.com/PARTYMANX) for their work on [partymod-thps4](https://github.com/PARTYMANX/partymod-thps4)
* [@DCxDemo](https://github.com/DCxDemo) for their work on [THPSQScriptEd](https://github.com/DCxDemo/LegacyTHPS/)

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
docker build -f docker/Dockerfile --target export -o build/out .
```

Build artifacts will be exported to the `build/out` directory.

### Building natively

If you prefer to build natively on Windows, you'll need to install quite a few dependencies.

#### Install VS Build Tools and .NET SDK

VS Build Tools are required to build PARTYMOD, whereas the .NET SDK is required to build the QB script (de)compiler.

```powershell
winget install -e --id Microsoft.VisualStudio.2022.BuildTools
winget install -e --id Microsoft.DotNet.SDK.10
```

#### Install vcpkg / sdl2:x86-windows

```powershell
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat
.\vcpkg.exe install sdl2:x86-windows
```

#### Build QScriptEd CLI

```
cd vendor/LegacyTHPS/editors/ThpsQScriptEd
dotnet build -p:configuration=release
```

#### Build PARTYMOD

```
cd vendor/partymod-thps4
mkdir build
cd build
cmake .. -A win32 -DCMAKE_TOOLCHAIN_FILE=C:/[vcpkg directory]/scripts/buildsystems/vcpkg.cmake
msbuild .\partypatcher.vcxproj /p:configuration=release
msbuild .\partyconfig.vcxproj /p:configuration=release
msbuild .\partymod.vcxproj /p:configuration=release /p:optimize=false
```
