# syntax=docker/dockerfile:1.7
#
# Better4 image: Ubuntu base + msvc-wine.
#
# Usage:
#   DOCKER_BUILDKIT=1 docker build -f docker/Dockerfile --target export -o build/out .

########################################
# Stage: base — OS + build dependencies
########################################
ARG BASE_IMAGE=ubuntu:24.04
FROM ${BASE_IMAGE} AS base

ENV DEBIAN_FRONTEND=noninteractive \
    WINEPREFIX=/opt/wineprefix \
    WINEDEBUG=-all \
    WINEDLLOVERRIDES="mscoree=d;mshtml=d"

# wine + wine64   - wine64 has the 64-bit Wine binaries; the `wine` package
#                   provides the /usr/bin/{wine,wine64,wineboot,wineserver}
#                   launchers the compiler wrappers call. (wine's
#                   `wine64 | wine32` dep is satisfied by wine64 -> no i386.)
# winbind         - named-pipe support MSVC needs (see msvc-wine README)
# python3/msitools- required by msvc-wine's vsdownload.py to unpack MS packages
# cmake/ninja     - the generator we use instead of the Windows-only VS generator
# procps          - pgrep, used to wait for wineserver during prefix init
# libicu74        - .NET runtime dependency (ICU 74 on Ubuntu 24.04)
RUN apt-get update && apt-get install -y --no-install-recommends \
        wine wine64 winbind \
        python3 msitools \
        cmake ninja-build \
        git curl unzip xz-utils ca-certificates procps \
        libicu74 \
    && rm -rf /var/lib/apt/lists/*

RUN $(command -v wine64 || command -v wine) wineboot --init \
    && while pgrep wineserver >/dev/null; do sleep 1; done

########################################
# Stage: msvc — download + install MSVC & Windows SDK (large, rarely changes)
########################################
FROM base AS msvc

# Pin these for reproducible images. Empty version => msvc-wine's default (latest).
ARG MSVC_WINE_REF=514f8ea34842cd6d831804d0e9658d3a32870ae1
ARG MSVC_VERSION=17.14
ARG SDK_VERSION=10.0.22621
ARG MSVC_ARCHS="host x86"

RUN git clone https://github.com/mstorsjo/msvc-wine.git /opt/msvc-wine \
    && git -C /opt/msvc-wine checkout "${MSVC_WINE_REF}"

# The downloaded MS packages are cached so re-runs (e.g. base image changes)
# reuse them instead of re-fetching ~1 GB from Microsoft.
RUN --mount=type=cache,target=/opt/msvc-cache \
    cd /opt/msvc-wine \
    && ./vsdownload.py --accept-license --dest /opt/msvc --cache /opt/msvc-cache \
        --architecture ${MSVC_ARCHS} \
        ${MSVC_VERSION:+--msvc-version ${MSVC_VERSION}} \
        ${SDK_VERSION:+--sdk-version ${SDK_VERSION}} \
    && ./install.sh /opt/msvc \
    && rm -rf /opt/msvc-wine

########################################
# Stage: sdl2 — prebuilt SDL2 VC dev package (replaces vcpkg; small, pinned)
########################################
FROM base AS sdl2
ARG SDL2_VERSION=2.30.9
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
# Stage: dotnet — .NET SDK (for QScriptEd)
########################################
FROM base AS dotnet
ARG DOTNET_CHANNEL=8.0
RUN curl -fsSL https://dot.net/v1/dotnet-install.sh -o /tmp/dotnet-install.sh \
    && bash /tmp/dotnet-install.sh --channel "${DOTNET_CHANNEL}" --install-dir /opt/dotnet \
    && rm /tmp/dotnet-install.sh

########################################
# Stage: toolchain — assemble the reusable build environment
########################################
FROM base AS toolchain
ARG SDL2_VERSION=2.30.9

COPY --from=msvc   /opt/msvc   /opt/msvc
COPY --from=sdl2   /opt/sdl2   /opt/sdl2
COPY --from=dotnet /opt/dotnet /opt/dotnet

ENV DOTNET_ROOT=/opt/dotnet \
    PATH=/opt/msvc/bin/x86:/opt/dotnet:${PATH} \
    SDL2_DIR=/opt/sdl2/SDL2-${SDL2_VERSION}/cmake \
    DOTNET_CLI_TELEMETRY_OPTOUT=1 \
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1 \
    DOTNET_NOLOGO=1

########################################
# Stage: qscripted — build the QScriptEd .NET CLI
########################################
FROM toolchain AS qscripted
WORKDIR /src
COPY vendor/LegacyTHPS/editors/ThpsQScriptEd vendor/LegacyTHPS/editors/ThpsQScriptEd
RUN --mount=type=cache,target=/root/.nuget/packages \
    dotnet build vendor/LegacyTHPS/editors/ThpsQScriptEd/ThpsQScriptEd.csproj \
        -c Release -o /opt/qscripted

########################################
# Stage: build — compile the project (invalidated by source changes only)
########################################
FROM toolchain AS build
WORKDIR /src

COPY docker/build.sh /usr/local/bin/build.sh
RUN chmod +x /usr/local/bin/build.sh

COPY --from=qscripted /opt/qscripted /opt/qscripted
COPY . /src

# /build (CMake/Ninja object files) and the NuGet cache persist across builds via
# BuildKit cache mounts; final artifacts are written to /out (a real image dir).
RUN --mount=type=cache,target=/build \
    --mount=type=cache,target=/root/.nuget/packages \
    OUT=/out BUILD_ROOT=/build QSCRIPTED=/opt/qscripted /usr/local/bin/build.sh

########################################
# Stage: export — artifacts only (docker build --target export -o <dir>)
########################################
FROM scratch AS export
COPY --from=build /out /
