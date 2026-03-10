@echo off
title Android Display Adjustment Tool (ADB)
color 0b

:menu
cls
echo ===========================================
echo       Android Display Tweaker (ADB)
echo ===========================================
echo Current Status:
echo [Size]    : 
adb shell wm size
echo [Density] : 
adb shell wm density
echo -------------------------------------------
echo 1. ตั้งค่าความละเอียด (Resolution) - เช่น 720x1600
echo 2. ตั้งค่า Custom DPI (ความลื่นไหลสายตา) - เช่น 380
echo 3. รีเซ็ตเป็นค่าเริ่มต้น (Reset All)
echo 4. ออกจากโปรแกรม (Exit)
echo -------------------------------------------
set /p select="เลือกตัวเลือก (1-4): "

if "%select%"=="1" goto change_size
if "%select%"=="2" goto change_dpi
if "%select%"=="3" goto reset_all
if "%select%"=="4" exit
goto menu

:change_size
cls
echo [คำแนะนำ] ใส่ความกว้างxความสูง (เช่น 1080x1920)
set /p w_h="ป้อนค่าความละเอียด: "
adb shell wm size %w_h%
echo [Success] ตั้งค่าเป็น %w_h% เรียบร้อย
pause
goto menu

:change_dpi
cls
echo [Info] DPI น้อยลง = ไอคอนเล็กลง/พื้นที่มากขึ้น (ลื่นตาขึ้น)
set /p dpi_val="ป้อนค่า DPI (แนะนำ 320-480): "
adb shell wm density %dpi_val%
echo [Success] ตั้งค่า DPI เป็น %dpi_val% เรียบร้อย
pause
goto menu

:reset_all
cls
echo กำลังรีเซ็ตการตั้งค่าหน้าจอทั้งหมด...
adb shell wm size reset
adb shell wm density reset
echo [Success] คืนค่าเริ่มต้นเรียบร้อยแล้ว
pause
goto menu

