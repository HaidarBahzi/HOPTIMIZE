@echo off
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
title H
color 0a

:start
cls
echo.
echo.
echo        ==============================================================================================
echo         II      II   IIIIIIII   IIIIIIIIII  IIIIIIIIII  II  IIIIIIIIIIII  II  IIIIIIIIII  IIIIIIIIII
echo         II      II  II      II  II      II      II      II  II   II   II  II        II    II
echo         II      II  II      II  II      II      II      II  II   II   II  II       II     II
echo         IIIIIIIIII  II      II  IIIIIIIIII      II      II  II   II   II  II      II      IIIIIIIIII
echo         II      II  II      II  II              II      II  II   II   II  II     II       II
echo         II      II  II      II  II              II      II  II   II   II  II    II        II
echo         II      II   IIIIIIII   II              II      II  II   II   II  II  IIIIIIIIII  IIIIIIIIII
echo        ===============================================================================================
echo.
echo.
echo.
echo                                          Menu :
echo        ===========================================================================
echo            Windows Optimizer:          I   Windows Repair:     I   Activate Windows:
echo        1) Delete Temp Files            I 7) DISM CheckHealth   I a) Windows 10 Home            
echo        2) Disable Windows Defender     I 8) DISM ScanHealth    I b) Windows 10 Pro    
echo        3) Optimize registry            I 9) DISM RestoreHealth I c) Windows 10 Enterprise
echo        4) Enable Ultimate Performance  I #) SFC Snannow        I d) Windows 10 Home Single Language
echo        5) Enable Godmode               I                       I e) Windows 10 Education
echo        6) Delete Bloatware             I 0) Exit               I
echo.
echo.
set choice=
set /p choice=  "Execute Option: "
if '%choice%'=='1' goto delete
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='2' goto WinDefend
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='3' goto Search
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='4' goto Power
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='5' goto Godmode
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='6' goto Bloatware
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='7' goto CheckHealth
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='8' goto ScanHealth
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='9' goto RestoreHealth
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='#' goto SFC#
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='a' goto Home
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='b' goto Pro
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='c' goto Enterprise
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='d' goto HomeSingle
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='e' goto Education
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='0' goto Exit
if not '%choice%'=='' set choice=%choice:~0,1%

:delete
cls
echo Deleting Temp Files...
del /f /s /q %TEMP%\*
del /f /s /q C:\$Recycle.Bin
del /f /s /q "%userprofile%\Local Settings\Temp\*.*1
goto start
pause

:Godmode
cls
echo Enabling God Mode...
mkdir "$DesktopPath\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
echo God Mode Enabled.
goto start
pause

:WinDefend
cls
echo Disabling Windows Defender...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableIOAVProtection /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableOnAccessProtection /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRealtimeMonitoring /t REG_DWORD /d 1
goto start
pause

:Search

echo Optimizing registry
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d "ffffffff" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v GPU Priority /t REG_DWORD /d "8" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d "6" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Scheduling Category /t REG_DWORD /d "High" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v SFIO Priority /t REG_DWORD /d "High" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v Value /t REG_DWORD /d "0" /f
goto start
pause

:Power
cls
echo enabling Ultimate Performance power plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
goto start
pause

:Bloatware
cls
echo Enabling Windows Power Shell...
reg add "HKEY_CLASSES_ROOT\Microsoft.PowerShellScript.1\Shell\Open\Command" /v "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" "%1" /t REG_SZ /f
goto start
pause

:CheckHealth 
cls
DISM /Online /Cleanup-Image /CheckHealth
goto start
pause

:ScanHealth
cls
DISM /Online /Cleanup-Image /ScanHealth
goto start
pause

:RestoreHealth
cls
DISM /Online /Cleanup-Image /RestoreHealth
goto start
pause

:SFC#
cls
sfc /scannow
goto start
pause

:HomeSingle
cls
slmgr /ipk  7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
slmgr /skms kms8.msguides.com
slmgr /ato
goto start
pause

:Pro
cls
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms8.msguides.com
slmgr /ato
goto start
pause

:Enterprise
cls
slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
slmgr /skms kms8.msguides.com
slmgr /ato
goto start
pause

:Home
cls
slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
slmgr /skms kms8.msguides.com
slmgr /ato
goto start
pause

:Education
cls
slmgr /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
slmgr /skms kms8.msguides.com
slmgr /ato
goto start
pause

:Exit
exit