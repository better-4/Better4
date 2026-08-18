@setlocal enableextensions enabledelayedexpansion
@echo off
setlocal

rem Better4 installer.
rem
rem Usage: drag your Skate4.exe onto this script (or run it with the exe's
rem path as the first argument). It copies every Better4 release file that
rem sits alongside this script into the game's install directory, then runs
rem better4patcher.exe there to produce Better4.exe.

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

if not "%~2"=="ELEVATED" (
    (echo test>"%TARGET_DIR%write_test.tmp") 2>nul
    if exist "%TARGET_DIR%write_test.tmp" (
        del "%TARGET_DIR%write_test.tmp"
    ) else (
        echo "%TARGET_DIR%" is not writable, requesting administrator privileges...
        powershell -Command "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c \"\"%~f0\" \"%~1\" ELEVATED\"' -Verb RunAs"
        exit /b 0
    )
)

echo Installing Better4 to "%TARGET_DIR%"...

for %%F in ("%SCRIPT_DIR%*") do (
    if /I not "%%~fF"=="%~f0" (
        if /I "%%~nxF"=="better4.ini" (
            if exist "%TARGET_DIR%better4.ini" (
                echo   %%~nxF ^(already exists, skipping^)
            ) else (
                echo   %%~nxF
                copy /Y "%%~fF" "%TARGET_DIR%" >nul
            )
        ) else (
            echo   %%~nxF
            copy /Y "%%~fF" "%TARGET_DIR%" >nul
        )
    )
)

for /D %%D in ("%SCRIPT_DIR%*") do (
    echo   %%~nxD\*
    robocopy "%%~fD" "%TARGET_DIR%%%~nxD" /E >nul
)

echo.
echo Running better4patcher...

pushd "%TARGET_DIR%"
move "Better4.exe" "Better4.exe.bak" 2>&1 >nul

.\better4patcher.exe

if exist "Better4.exe" (
    del "Better4.exe.bak" 2>&1 >nul
) else (
    move "Better4.exe" "Better4.exe.bak" 2>&1 >nul
)

popd

endlocal
