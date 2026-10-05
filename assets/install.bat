@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "UPDATER=%SCRIPT_DIR%better4updater.ps1"

if /I "%~2"=="SILENT" (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%UPDATER%" -Install -Skate4Exe "%~1" -Silent
) else (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%UPDATER%" -Install -Skate4Exe "%~1"
)

endlocal
exit /b %ERRORLEVEL%
