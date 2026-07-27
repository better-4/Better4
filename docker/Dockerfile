# syntax=docker/dockerfile:1.7
#
# Better4 cross-build image: Linux base + MSVC-under-Wine (msvc-wine).
#
# Builds the Windows (x86) PARTYMOD artifacts and the .NET QScriptEd CLI
# entirely on Linux. The real MSVC toolchain runs under Wine, so MSVC-only
# constructs (#pragma comment(linker,...), __declspec, comctl32/UxTheme, the
# manifest dependency) work exactly as on Windows.
#
# Stages are ordered least-volatile -> most-volatile so BuildKit reuses the
# expensive MSVC/SDK/.NET download layers across source changes. The three
# heavy downloads (MSVC, SDL2, .NET) each live in their own stage and are
# COPYed into the toolchain stage, so a change to one never invalidates the
# others.
#
# Usage:
#   # extract artifacts to ./build/out
#   DOCKER_BUILDKIT=1 docker build -f docker/Dockerfile --target export -o build/out .
#   # or produce a reusable build image
#   DOCKER_BUILDKIT=1 docker build -f docker/Dockerfile --target build -t better4-build .

########################################
# Stage: base — OS + build dependencies
########################################
# Ubuntu 24.04 is the base msvc-wine itself targets/tests: its `wine64` package
# provides the /usr/bin/wine64 launcher the compiler wrappers call. (Debian's
# wine64 package ships only the libraries, not the launcher, so the wrappers
# fail with an empty command.)
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

# Initialise the Wine prefix once so per-compile invocations skip first-run cost
# (mirrors msvc-wine's own Dockerfile: init, then wait for wineserver to exit).
RUN $(command -v wine64 || command -v wine) wineboot --init \
    && while pgrep wineserver >/dev/null; do sleep 1; done

########################################
# Stage: msvc — download + install MSVC & Windows SDK (large, rarely changes)
########################################
FROM base AS msvc

# Pin these for reproducible images. Empty version => msvc-wine's default (latest).
ARG MSVC_WINE_REF=master
ARG MSVC_VERSION=
ARG SDK_VERSION=
# "host x86" = x64 host tools that cross-compile to 32-bit x86 (no 32-bit Wine needed).
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
# Stage: dotnet — .NET SDK for the QScriptEd CLI (pinned channel)
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
# Stage: build — compile the project (invalidated by source changes only)
########################################
FROM toolchain AS build
WORKDIR /src

# Copy the build driver first so editing sources doesn't re-copy the script layer.
COPY docker/build.sh /usr/local/bin/build.sh
RUN chmod +x /usr/local/bin/build.sh

COPY . /src

# /build (CMake/Ninja object files) and the NuGet cache persist across builds via
# BuildKit cache mounts; final artifacts are written to /out (a real image dir).
RUN --mount=type=cache,target=/build \
    --mount=type=cache,target=/root/.nuget/packages \
    OUT=/out BUILD_ROOT=/build /usr/local/bin/build.sh

########################################
# Stage: export — artifacts only (docker build --target export -o <dir>)
########################################
FROM scratch AS export
COPY --from=build /out /
