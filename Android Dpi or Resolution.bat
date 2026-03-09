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
echo -------------------------------------------

set /p opt="Select option (2-4): "

if "%opt%"=="1" goto change_res
if "%opt%"=="2" goto change_dpi
if "%opt%"=="3" goto reset_all
if "%opt%"=="4" exit
goto menu

:change_res
set /p w="Enter width (e.g. 720): "
set /p h="Enter height (e.g. 1280): "
adb shell wm size %w%x%h%
echo Resolution set to %w%x%h%
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
