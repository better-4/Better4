#!/usr/bin/env bash
#
# In-container build driver for Better4.
#
# Builds the PARTYMOD Windows/x86 artifacts with MSVC-under-Wine and the
# QScriptEd .NET CLI, then collects everything under $OUT.
#
# The three PARTYMOD targets need conflicting per-target flags, so each gets its
# own CMake configure rather than editing the vendored partymod-thps4 CMakeLists:
#   * partypatcher - console subsystem (prints to stdout), default Release
#   * partyconfig  - windowed (/SUBSYSTEM:WINDOWS) but still enters int main
#                    (/ENTRY:mainCRTStartup), Release
#   * partymod     - shared DLL built with optimisation disabled (/Od); upstream
#                    notes MSVC miscompiles some functions with optimisation on
set -euo pipefail

SRC="${SRC:-/src}"
BUILD_ROOT="${BUILD_ROOT:-/build}"
OUT="${OUT:-/out}"
: "${SDL2_DIR:?SDL2_DIR must be set (path to the SDL2 cmake config dir)}"

# x86 target toolchain (x64-hosted cross compiler running under Wine).
export PATH="/opt/msvc/bin/x86:${PATH}"
export CC=cl
export CXX=cl

PM="${SRC}/vendor/partymod-thps4"
QS="${SRC}/vendor/LegacyTHPS/editors/ThpsQScriptEd"

mkdir -p "${OUT}/partymod" "${OUT}/qscripted"

# Flags common to every PARTYMOD configure. CMAKE_SYSTEM_NAME=Windows puts CMake
# into cross mode; Ninja replaces the (Linux-unavailable) Visual Studio generator.
common_flags=(
  -G Ninja
  -DCMAKE_SYSTEM_NAME=Windows
  -DCMAKE_BUILD_TYPE=Release
  -DSDL2_DIR="${SDL2_DIR}"
)

echo "==> Configuring + building partypatcher (console)"
cmake "${common_flags[@]}" -S "${PM}" -B "${BUILD_ROOT}/patcher"
cmake --build "${BUILD_ROOT}/patcher" --target partypatcher

echo "==> Configuring + building partyconfig (windowed, int main entry)"
cmake "${common_flags[@]}" \
  -DCMAKE_EXE_LINKER_FLAGS="/SUBSYSTEM:WINDOWS /ENTRY:mainCRTStartup" \
  -S "${PM}" -B "${BUILD_ROOT}/config"
cmake --build "${BUILD_ROOT}/config" --target partyconfig

echo "==> Configuring + building partymod (DLL, optimisation disabled)"
cmake "${common_flags[@]}" \
  -DCMAKE_C_FLAGS_RELEASE="/MD /Od /Ob0 /DNDEBUG" \
  -S "${PM}" -B "${BUILD_ROOT}/mod"
cmake --build "${BUILD_ROOT}/mod" --target partymod

echo "==> Collecting PARTYMOD artifacts"
cp "${BUILD_ROOT}/patcher/partypatcher.exe" "${OUT}/partymod/"
cp "${BUILD_ROOT}/config/partyconfig.exe"   "${OUT}/partymod/"
cp "${BUILD_ROOT}/mod/partymod.dll"         "${OUT}/partymod/"
# Runtime data files shipped alongside the release.
cp "${PM}/partymod.ini"          "${OUT}/partymod/" 2>/dev/null || true
cp "${PM}/gamecontrollerdb.txt"  "${OUT}/partymod/" 2>/dev/null || true
# SDL2 runtime DLL (x86) that partymod.dll depends on.
find /opt/sdl2 -path '*/lib/x86/SDL2.dll' -exec cp {} "${OUT}/partymod/" \;

echo "==> Building QScriptEd CLI (.NET)"
dotnet build "${QS}/ThpsQScriptEd.csproj" -c Release -o "${OUT}/qscripted"

echo "==> Done. Artifacts in ${OUT}"
ls -R "${OUT}"
