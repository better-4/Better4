# syntax=docker/dockerfile:1.7
#
# `docker build -f docker/Dockerfile --target export -o build/out .`
########################################
ARG BASE_IMAGE=ubuntu:24.04
FROM ${BASE_IMAGE} AS base

ENV DEBIAN_FRONTEND=noninteractive \
    WINEPREFIX=/opt/wineprefix \
    WINEDEBUG=-all \
    WINEDLLOVERRIDES="mscoree=d;mshtml=d" \
    SDL2_VERSION=2.30.9

# wine + wine64   - wine64 has the 64-bit Wine binaries; the `wine` package
#                   provides the /usr/bin/{wine,wine64,wineboot,wineserver}
#                   launchers the compiler wrappers call. (wine's
#                   `wine64 | wine32` dep is satisfied by wine64 -> no i386.)
# winbind         - named-pipe support MSVC needs (see msvc-wine README)
# python3/msitools- required by msvc-wine's vsdownload.py to unpack MS packages
# cmake/ninja     - the generator we use instead of the Windows-only VS generator
# procps          - pgrep, used to wait for wineserver during prefix init
# libicu74        - .NET runtime dependency (ICU 74 on Ubuntu 24.04)
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt/lists,sharing=locked \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        wine wine64 winbind \
        python3 msitools \
        cmake ninja-build \
        git curl unzip xz-utils ca-certificates procps \
        libicu74 \
    && rm -rf /var/lib/apt/lists/*

RUN $(command -v wine64 || command -v wine) wineboot --init \
    && while pgrep wineserver >/dev/null; do sleep 1; done

########################################
FROM base AS msvc

ARG MSVC_WINE_REF=514f8ea34842cd6d831804d0e9658d3a32870ae1
ARG MSVC_VERSION=17.14
ARG SDK_VERSION=10.0.22621

RUN git clone https://github.com/mstorsjo/msvc-wine.git /opt/msvc-wine \
    && git -C /opt/msvc-wine checkout "${MSVC_WINE_REF}"

RUN --mount=type=cache,target=/opt/msvc-cache \
    cd /opt/msvc-wine \
    && ./vsdownload.py --accept-license --dest /opt/msvc --cache /opt/msvc-cache \
        --architecture host x86 \
        ${MSVC_VERSION:+--msvc-version ${MSVC_VERSION}} \
        ${SDK_VERSION:+--sdk-version ${SDK_VERSION}} \
    && ./install.sh /opt/msvc \
    && rm -rf /opt/msvc-wine

########################################
FROM base AS sdl2

# The VC dev package lays headers flat in include/ (include/SDL.h), but the
# source uses the vcpkg-style #include <SDL2/SDL.h>. A self-referential symlink
# (include/SDL2 -> .) makes SDL2/SDL.h resolve to include/SDL.h.
RUN curl -fsSL -o /tmp/sdl2.zip \
      "https://github.com/libsdl-org/SDL/releases/download/release-${SDL2_VERSION}/SDL2-devel-${SDL2_VERSION}-VC.zip" \
    && mkdir -p /opt/sdl2 \
    && unzip -q /tmp/sdl2.zip -d /opt/sdl2 \
    && ln -s . "/opt/sdl2/SDL2-${SDL2_VERSION}/include/SDL2" \
    && rm /tmp/sdl2.zip

########################################
FROM base AS dotnet
ARG DOTNET_CHANNEL=8.0
RUN curl -fsSL https://dot.net/v1/dotnet-install.sh -o /tmp/dotnet-install.sh \
    && bash /tmp/dotnet-install.sh --channel "${DOTNET_CHANNEL}" --install-dir /opt/dotnet \
    && rm /tmp/dotnet-install.sh

########################################
FROM base AS toolchain
WORKDIR /src
RUN mkdir /out

########################################
FROM toolchain AS toolchain-dotnet

COPY --from=dotnet /opt/dotnet /opt/dotnet

ENV PATH=/opt/dotnet:${PATH} \
    DOTNET_ROOT=/opt/dotnet \
    DOTNET_CLI_TELEMETRY_OPTOUT=1 \
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1 \
    DOTNET_NOLOGO=1

########################################
FROM toolchain AS toolchain-msvc

COPY --from=msvc /opt/msvc /opt/msvc
COPY --from=sdl2 /opt/sdl2 /opt/sdl2

ENV PATH=/opt/msvc/bin/x86:${PATH} \
    SDL2_DIR=/opt/sdl2/SDL2-${SDL2_VERSION}
ENV CC=cl
ENV CXX=cl

########################################
FROM toolchain-dotnet AS build-qscripted
WORKDIR /src

COPY --from=dotnet /opt/dotnet /opt/dotnet

COPY vendor/LegacyTHPS/editors/ThpsQScriptEd vendor/LegacyTHPS/editors/ThpsQScriptEd
RUN --mount=type=cache,target=/root/.nuget/packages \
    dotnet build vendor/LegacyTHPS/editors/ThpsQScriptEd/ThpsQScriptEd.csproj \
        -c Release -o /opt/qscripted

########################################
FROM toolchain-msvc AS build-patcher

COPY vendor/partymod-thps4 vendor/partymod-thps4
RUN --mount=type=cache,target=/build \
    echo "==> Building better4patcher.exe" \
    && cmake -S "vendor/partymod-thps4" -B "/build/better4patcher" -G Ninja \
       -DSDL2_DIR="${SDL2_DIR}/cmake" -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_BUILD_TYPE=Release \
    && cmake --build "/build/better4patcher" --target partypatcher \
    && cp "/build/better4patcher/partypatcher.exe" "/out/better4patcher.exe"

########################################
FROM toolchain-msvc AS build-config

COPY vendor/partymod-thps4 vendor/partymod-thps4
RUN --mount=type=cache,target=/build \
    echo "==> Building better4config.exe" \
    && cmake -S "vendor/partymod-thps4" -B "/build/better4config" -G Ninja \
       -DSDL2_DIR="${SDL2_DIR}/cmake" -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_BUILD_TYPE=Release \
    && cmake --build "/build/better4config" --target partyconfig \
    && cp "/build/better4config/partyconfig.exe" "/out/better4config.exe"

########################################
FROM toolchain-msvc AS build-better4

COPY vendor vendor
COPY src src
COPY CMakeLists.txt .

RUN --mount=type=cache,target=/build \
    echo "==> Building better4.dll" \
    && cmake -B "/build/better4" -G Ninja \
       -DSDL2_DIR="${SDL2_DIR}/cmake" -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_BUILD_TYPE=Release \
       -DCMAKE_C_FLAGS_RELEASE="/MD /Od /Ob0 /DNDEBUG" \
    && cmake --build "/build/better4" --target better4 \
    && cp "/build/better4/better4.dll" "/out/better4.dll"

COPY vendor/partymod-thps4/partymod.ini /out/better4.ini
COPY vendor/partymod-thps4/gamecontrollerdb.txt /out
COPY vendor/partymod-thps4/readme-partymod.txt /out
RUN cp ${SDL2_DIR}/lib/x86/SDL2.dll /out
RUN cp ${SDL2_DIR}/README.txt /out/README-SDL.txt
COPY README.md /out/readme-better4.txt

########################################
FROM toolchain-dotnet AS build-qscripts
COPY --from=build-qscripted   /opt/qscripted   /opt/qscripted

COPY data/scripts data/scripts
RUN mkdir -p "/out/data/scripts/better4" \
    && dotnet "/opt/qscripted/ThpsQScriptEd.dll" "data/scripts" "/out/data/scripts/better4"

########################################
FROM toolchain AS build-artifacts

COPY data/scripts/qdir.txt /out/data/scripts/better4/qdir.txt
COPY data/fonts /out/data/fonts/better4
COPY data/images /out/data/images/better4
COPY data/models /out/data/models/better4
COPY data/sounds /out/data/sounds/Wav/better4

########################################
FROM scratch AS export

COPY --from=build-config /out /
COPY --from=build-patcher /out /
COPY --from=build-better4 /out /
COPY --from=build-qscripts /out /
COPY --from=build-artifacts /out /
