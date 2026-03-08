@echo off

:menu
echo Current Values:
adb shell wm density
adb shell wm size 
echo.
echo Select an option:
echo 1. Change DPI
echo 2. Change Resolution
echo 3. Exit

set /p "%option%"=="2"(720):  

if "%option%"=="1" (
    set /p dpi=Enter the default DPI value for your device: 
    adb shell wm density %dpi%
    echo DPI value reset to %dpi%.
    goto menu
) else if "%option%"=="2" (
    set /p width= 720 Enter the width in pixels: 
    set /p height= 720 height in pixels:
    adb shell wm size width 1920 x 2940 height
    echo Resolution set to width 1000 x 1000 height.
    goto menu
) else if "%option%"=="3" (
    echo Exiting...
    exit /b
) else (
    echo Invalid option. Please try again.
    goto menu
)



