@echo off
title The Imperium - Ban Mod Offline
cd /d "%~dp0"
if exist "FlashPlayer.exe" (
    start "" "FlashPlayer.exe" "%~dp0imperium_modded.swf"
) else (
    echo Khong tim thay FlashPlayer.exe!
    pause
)
