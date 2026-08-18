#!/usr/bin/env bash
set -euo pipefail

SRC="${SRC:-/src}"
BUILD_ROOT="${BUILD_ROOT:-/build}"
OUT="${OUT:-/out}"
QSCRIPTED="${QSCRIPTED:-/opt/qscripted}"
: "${SDL2_DIR:?SDL2_DIR must be set}"

export PATH="/opt/msvc/bin/x86:${PATH}"
export CC=cl
export CXX=cl

PM="${SRC}/vendor/partymod-thps4"

common_flags=(
  -G Ninja
  -DCMAKE_SYSTEM_NAME=Windows
  -DCMAKE_BUILD_TYPE=Release
  -DSDL2_DIR="${SDL2_DIR}/cmake"
)

mkdir "${OUT}"

echo "==> Building better4config.exe"
cmake "${common_flags[@]}" -S "${PM}" -B "${BUILD_ROOT}/config"
cmake --build "${BUILD_ROOT}/config" --target partyconfig
cp "${BUILD_ROOT}/config/partyconfig.exe" "${OUT}/better4config.exe"

echo "==> Building better4patcher.exe"
cmake "${common_flags[@]}" -S "${PM}" -B "${BUILD_ROOT}/patcher"
cmake --build "${BUILD_ROOT}/patcher" --target partypatcher
cp "${BUILD_ROOT}/patcher/partypatcher.exe" "${OUT}/better4patcher.exe"

echo "==> Building better4.dll"
cmake "${common_flags[@]}" \
  -DCMAKE_C_FLAGS_RELEASE="/MD /Od /Ob0 /DNDEBUG" \
  -B "${BUILD_ROOT}/better4"
cmake --build "${BUILD_ROOT}/better4" --target better4
cp "${BUILD_ROOT}/better4/better4.dll" "${OUT}/"

# cmake "${common_flags[@]}" -S "${PM}" -B "${BUILD_ROOT}/incbin"
# cmake --build "${BUILD_ROOT}/incbin" --target incbin
# cp "${BUILD_ROOT}/incbin/incbin.exe" "${OUT}/"

echo "==> Copying other artifacts"
cp "${PM}/partymod.ini" "${OUT}/better4.ini" 2>/dev/null || true
cp "${PM}/gamecontrollerdb.txt" "${OUT}/" 2>/dev/null || true
cp "${SDL2_DIR}/lib/x86/SDL2.dll" "${OUT}/"
cp "${SDL2_DIR}/README.txt" "${OUT}/README-SDL.txt"
cp "${PM}/readme-partymod.txt" "${OUT}"
cp "${SRC}/README.md" "${OUT}/readme-better4.txt"

echo "==> Compiling Q scripts"
mkdir -p "${OUT}/data/scripts/better4"
dotnet "${QSCRIPTED}/ThpsQScriptEd.dll" "${SRC}/data/scripts" "${OUT}/data/scripts/better4"

echo "==> Copying qdir.txt"
cp "${SRC}/data/scripts/qdir.txt" "${OUT}/data/scripts/better4/qdir.txt"

echo "==> Copying models"
mkdir -p "${OUT}/data/models"
cp -r "${SRC}/data/models" "${OUT}/data/models/better4"

echo "==> Copying fonts"
mkdir -p "${OUT}/data/fonts"
cp -r "${SRC}/data/fonts" "${OUT}/data/fonts/better4"

echo "==> Copying images"
mkdir -p "${OUT}/data/images"
cp -r "${SRC}/data/images" "${OUT}/data/images/better4"

echo "==> Copying installer"
cp "${SRC}/installer/install.bat" "${OUT}/"

echo "==> Done"
ls -R "${OUT}"
