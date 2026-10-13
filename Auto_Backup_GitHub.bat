@echo off
title Auto Backup to GitHub - Mod DecheGamevui
cd /d "%~dp0"

echo ====================================================
echo   DANG SAO LUU DU AN LEN GITHUB (Mod DecheGamevui)
echo ====================================================

git add .
git commit -m "Auto backup: cap nhat ma nguon mod game The Imperium"
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo [THANH CONG] Da sao luu toan bo du an len GitHub!
) else (
    echo [CHU Y] Neu chua co repo tren GitHub, hay tao repo rong ten 'Mod-DecheGamevui' tren github.com/Dragon9468 roi chay lai.
)

pause
