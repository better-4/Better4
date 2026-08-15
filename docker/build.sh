#!/usr/bin/env bash
# In-container build driver for Better4.

set -euo pipefail

SRC="${SRC:-/src}"
BUILD_ROOT="${BUILD_ROOT:-/build}"
OUT="${OUT:-/out}"
QSCRIPTED="${QSCRIPTED:-/opt/qscripted}"
: "${SDL2_DIR:?SDL2_DIR must be set (path to the SDL2 cmake config dir)}"

# x86 target toolchain (x64-hosted cross compiler running under Wine).
export PATH="/opt/msvc/bin/x86:${PATH}"
export CC=cl
export CXX=cl

PM="${SRC}/vendor/partymod-thps4"

mkdir -p "${OUT}/data/scripts"

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
cp "${BUILD_ROOT}/patcher/partypatcher.exe" "${OUT}/"
cp "${BUILD_ROOT}/config/partyconfig.exe" "${OUT}/"
cp "${BUILD_ROOT}/mod/partymod.dll" "${OUT}/"
cp "${PM}/partymod.ini" "${OUT}/" 2>/dev/null || true
cp "${PM}/gamecontrollerdb.txt" "${OUT}/" 2>/dev/null || true
find /opt/sdl2 -path '*/lib/x86/SDL2.dll' -exec cp {} "${OUT}/" \;

echo "==> Compiling QScript sources (.q -> .qb)"
dotnet "${QSCRIPTED}/ThpsQScriptEd.dll" "${SRC}/data/scripts" "${OUT}/data/scripts"

echo "==> Copying qdir.txt"
cp "${SRC}/data/scripts/qdir.txt" "${OUT}/data/scripts/qdir.txt"

echo "==> Copying models"
cp -r "${SRC}/data/models" "${OUT}/data/models"

echo "==> Copying fonts"
cp -r "${SRC}/data/fonts" "${OUT}/data/fonts"

echo "==> Copying images"
cp -r "${SRC}/data/images" "${OUT}/data/images"

echo "==> Copying installer"
cp "${SRC}/installer/install.bat" "${OUT}/"

echo "==> Done. Artifacts in ${OUT}"
ls -R "${OUT}"
