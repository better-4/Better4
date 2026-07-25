# Better4

Better4 is a modpack which includes modern gameplay and QOL features while maintaining the spirit of 4.

## Features

* Two-side dropdown
* Modern manual extensions (left and right pivot)
* Unused animations restored (nollie 360 flip, kickflip to indy, etc.)
* PS2-exclusive manual tech (MFG, MQT, etc.)
* Online multiplayer (*WIP*)
* Better observe mode (*WIP*)

# Building

## Install VS Build Tools and .NET SDK

```powershell
winget install -e --id Microsoft.DotNet.SDK.10
winget install -e --id Microsoft.VisualStudio.2022.BuildTools
```

## Install vcpkg / SDL2

[vcpkg](https://vcpkg.io/en/) is a C/C++ package manager used to provide the SDL2 dependency for PARTYMOD.

```
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat
.\vcpkg.exe install sdl2:x86-windows
```

Set `$VCPKG_ROOT` to `$PWD`:

<details>
<summary>Powershell</summary>

### Shell-local (disappears on shell restart)

```ps
$env:VCPKG_ROOT = $PWD.Path
```

### Persistent (requires running as administrator)

```ps
[Environment]::SetEnvironmentVariable("VCPKG_ROOT", $PWD.Path, "User")
```
</details>

## Clone Better4

```
git clone --recurse-submodules git@github.com:better-4/Better4.git  # or https://github.com/better-4/Better4.git
cd Better4
```

## Build PARTYMOD

```
cd vendor/partymod-thps4
mkdir build
cd build
cmake .. -A win32 -DCMAKE_TOOLCHAIN_FILE="$env:VCPKG_ROOT\scripts\buildsystems\vcpkg.cmake"
msbuild .\partypatcher.vcxproj /p:configuration=release
msbuild .\partyconfig.vcxproj /p:configuration=release
msbuild .\partymod.vcxproj /p:configuration=release /p:optimize=false
```

## Build QScriptEd CLI

```
cd vendor/LegacyTHPS/editors/ThpsQScriptEd
msbuild .\ThpsQScriptEd.csproj /p:configuration=release
```
