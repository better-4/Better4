# Better4

Better4 is a modpack which includes modern gameplay and QOL features while maintaining the spirit of 4.

## Features

* Two-side dropdown
* Modern manual extensions (left and right pivot)
* Unused animations restored (nollie 360 flip, kickflip to indy, etc.)
* PS2-exclusive manual tech (MFG, MQT, etc.)
* Online multiplayer (*WIP*)
* Better observe mode (*WIP*)

# Development

Clone the Better4 repo with the `--recurse-submodules` option:

```
git clone --recurse-submodules git@github.com:better-4/Better4.git --config core.autocrlf=false --config core.eol=lf
cd Better4
```

## Building with Docker

Using Docker is the easiest way to build Better4, as it automates the process of pulling build dependencies and building a release.

Install [Docker Desktop](https://docs.docker.com/desktop/setup/install/windows-install/), then verify the Docker Engine is running and run:

```
docker build -f docker/Dockerfile --target export -o build/out .
```

Build artifacts will be exported to the `build/out` directory.

## Building natively

If you prefer to build natively on Windows, you'll need to install quite a few dependencies.

### Install VS Build Tools and .NET SDK

VS Build Tools are required to build PARTYMOD, whereas the .NET SDK is required to build the QB script (de)compiler.

```powershell
winget install -e --id Microsoft.VisualStudio.2022.BuildTools
winget install -e --id Microsoft.DotNet.SDK.10
```

### Install vcpkg / sdl2:x86-windows

```powershell
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat
.\vcpkg.exe install sdl2:x86-windows
```

### Build QScriptEd CLI

```
cd vendor/LegacyTHPS/editors/ThpsQScriptEd
dotnet build -p:configuration=release
```

### Build PARTYMOD

```
cd vendor/partymod-thps4
mkdir build
cd build
cmake .. -A win32 -DCMAKE_TOOLCHAIN_FILE=C:/[vcpkg directory]/scripts/buildsystems/vcpkg.cmake
msbuild .\partypatcher.vcxproj /p:configuration=release
msbuild .\partyconfig.vcxproj /p:configuration=release
msbuild .\partymod.vcxproj /p:configuration=release /p:optimize=false
```
