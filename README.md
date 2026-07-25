# Better4

Better4 is a modpack which includes modern gameplay and QOL features while maintaining the spirit of 4.

# Building

## vcpkg / SDL2

[vcpkg](https://vcpkg.io/en/) is a C/C++ package manager used to provide the SDL2 dependency for PARTYMOD.

```
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
.\bootstrap-vcpkg.bat
.\vcpkg.exe install sdl2
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
git clone --recurse-submodules git@github.com:better-4/Better4.git
# or https://github.com/better-4/Better4.git
```
