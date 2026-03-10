@echo off
title Android Display Adjustment Tool (ADB)
color 0b

:menu
cls
echo ===========================================
echo       Android Display Tweaker (ADB)
echo ===========================================
echo Current Status:
adb shell wm size
adb shell wm density
echo -------------------------------------------
echo 1. Set Resolution (e.g., 720x1600)
echo 2. Set Custom DPI (Density) - e.g., 320
echo 3. Reset to Default (Reset All)
echo 4. Exit
echo -------------------------------------------
set /p select="Select an option (1-4): "

if "%select%"=="1" goto change_size
if "%select%"=="2" goto change_dpi
if "%select%"=="3" goto reset_all
if "%select%"=="4" exit
goto menu

:change_size
cls
echo [Tip] Enter WidthxHeight (e.g., 1080x1920)
set /p w_h="Enter : WidthxHeight (e.g., 720x1600)
adb shell wm size %w_h%
echo [Success] Resolution set to %w_h%
pause
goto menu

:change_dpi
cls
echo [Info] Lower DPI = Smaller icons / More screen space
set /p dpi_val="Enter Lower DPI = Smaller icons / More screen space (e.g., 320): "
adb shell wm density %dpi_val%
echo [Success] DPI set to %dpi_val%
pause
goto menu

:reset_all
cls
echo Resetting all display settings...
adb shell wm size reset
adb shell wm density reset
echo [Success] All settings restored to default.
pause
goto menu
