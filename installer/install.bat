@echo off
setlocal

rem Better4 installer.
rem
rem Usage: drag your Skate4.exe onto this script (or run it with the exe's
rem path as the first argument). It copies every Better4 release file that
rem sits alongside this script into the game's install directory, then runs
rem partypatcher.exe there to produce THPS4.exe.

if "%~1"=="" (
    echo Drag your Skate4.exe onto this script to install Better4.
    pause
    exit /b 1
)

if /I not "%~nx1"=="Skate4.exe" (
    echo Expected Skate4.exe, but got "%~nx1".
    echo Drag your Skate4.exe onto this script to install Better4.
    pause
    exit /b 1
)

set "TARGET_DIR=%~dp1"
set "SCRIPT_DIR=%~dp0"

if not exist "%TARGET_DIR%Skate4.exe" (
    echo Could not find Skate4.exe in "%TARGET_DIR%".
    pause
    exit /b 1
)

echo Installing Better4 to "%TARGET_DIR%"...

for %%F in ("%SCRIPT_DIR%*") do (
    if /I not "%%~fF"=="%~f0" (
        echo Copying %%~nxF...
        copy /Y "%%~fF" "%TARGET_DIR%" >nul
    )
)

for /D %%D in ("%SCRIPT_DIR%*") do (
    echo Copying %%~nxD\...
    robocopy "%%~fD" "%TARGET_DIR%%%~nxD" /E >nul
)

echo.
echo Patching Skate4.exe (press a key when partypatcher prompts)...
pushd "%TARGET_DIR%"
.\partypatcher.exe
popd

echo.
if exist "%TARGET_DIR%THPS4.exe" (
    echo Better4 installed successfully! Run THPS4.exe to play.
) else (
    echo Something went wrong - THPS4.exe was not created.
)

pause
endlocal
