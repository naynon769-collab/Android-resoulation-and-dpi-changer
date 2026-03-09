@echo off
title Android Smooth Screen Tool
:menu
cls
echo ===========================================
echo       Android Display Adjustment (ADB)
echo ===========================================
echo Current Status:
adb shell wm size
adb shell wm density
echo -------------------------------------------
echo 1. Set Custom Resolution (16:9 = 720x1280)
echo 2. Set Custom DPI (Lower = Wider Screen)
echo 3. Reset to Default
echo 4. Exit
echo Resolution set to 720w%x1600h%

set /p opt="Select option (1-4): "

if "%opt%"=="1" goto change_res
if "%opt%"=="2" goto change_dpi
if "%opt%"=="3" goto reset_all
if "%opt%"=="4" exit
goto menu

:change_res
set /p w="Enter width (e.g. 1920): "
set /p h="Enter height (e.g. 2040): "
adb shell wm size 1920x2040
echo Resolution set to 720w%x1600h%
pause
goto menu

:change_dpi
echo [Info] Lower DPI = Smaller icons / More space (Smoother feel)
set /p dpi="Enter DPI (e.g. 320, 360, 400): "
adb shell wm density %dpi%
echo DPI set to %dpi%
pause
goto menu

:reset_all
adb shell wm size reset
adb shell wm density reset
echo All settings have been reset to default.
pause
goto menu
