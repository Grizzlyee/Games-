@echo off
rem Summarize the latest SMAPI log (run the game once through SMAPI first).
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1" -CheckLog
echo.
pause
