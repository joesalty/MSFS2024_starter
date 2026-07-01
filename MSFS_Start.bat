@echo off
title MSFS 2024 Startup Manager
color 0A

echo ================================================
echo        MSFS 2024 STARTUP SELECTION MENU
echo ================================================
echo.
echo   1) Start MSFS with **VATSIM** (vPilot)
echo   2) Start MSFS with **BeyondATC**
echo   3) Start MSFS with **Both VATSIM + BeyondATC**
echo   4) Start MSFS **Offline** (no ATC clients)
echo.
set /p choice="Select an option (1-4): "

echo.
echo ==== Startup sequence initiated at %date% %time% ====
echo.

REM ============================================================
REM 1) MSFS Game Launch (Microsoft Store URI)
REM ============================================================
echo [%time%] Checking MSFS2024... 
tasklist /FI "IMAGENAME eq FlightSimulator2024.exe" | find /I "FlightSimulator2024.exe" >nul
if %errorlevel%==0 (
    echo [%time%] FlightSimulator2024.exe already running, skipping...
) else (
    echo [%time%] Launching MSFS...
    start "" "msgamelaunch://shortcutLaunch/?ProductId=9P38D19T7LRV&Exe=App"
    timeout /t 180 /nobreak >nul
)

REM ============================================================
REM 2) MobiFlight Connector
REM ============================================================
echo [%time%] Checking MFConnector.exe...
tasklist /FI "IMAGENAME eq MFConnector.exe" | find /I "MFConnector.exe" >nul
if %errorlevel%==0 (
    echo [%time%] MFConnector.exe already running, skipping...
) else (
    echo [%time%] Starting MobiFlight Connector...
    start "" "C:\Users\joesa\AppData\Local\MobiFlight\MobiFlight Connector\MFConnector.exe"
    timeout /t 10 /nobreak >nul
)

REM ============================================================
REM 3) MSFS AutoFPS
REM ============================================================
echo [%time%] Checking MSFS_AutoFPS.exe...
tasklist /FI "IMAGENAME eq MSFS_AutoFPS.exe" | find /I "MSFS_AutoFPS.exe" >nul
if %errorlevel%==0 (
    echo [%time%] MSFS_AutoFPS.exe already running, skipping...
) else (
    echo [%time%] Starting MSFS AutoFPS...
    start "" "C:\Users\joesa\AppData\Roaming\MSFS_AutoFPS\bin\MSFS_AutoFPS.exe"
    timeout /t 10 /nobreak >nul
)

REM ============================================================
REM 4) ACARS
REM ============================================================
echo [%time%] Checking acars.exe...
tasklist /FI "IMAGENAME eq acars.exe" | find /I "acars.exe" >nul
if %errorlevel%==0 (
    echo [%time%] acars.exe already running, skipping...
) else (
    echo [%time%] Starting ACARS...
    start "" "G:\Acars_2024\acars.exe"
    timeout /t 10 /nobreak >nul
)

REM ============================================================
REM 5) TouchdownFX
REM ============================================================
echo [%time%] Checking TouchdownFX.exe...
tasklist /FI "IMAGENAME eq TouchdownFX.exe" | find /I "TouchdownFX" >nul
if %errorlevel%==0 (
    echo [%time%] TouchdownFX already running, skipping...
) else (
    echo [%time%] Starting TouchdownFX...
    start "" "G:\TouchdownFX\TouchdownFX.exe"
    timeout /t 10 /nobreak >nul
)

REM ============================================================
REM 6) CONDITIONAL: vPilot
REM ============================================================
if "%choice%"=="1" goto start_vpilot
if "%choice%"=="3" goto start_vpilot
goto skip_vpilot

:start_vpilot
echo [%time%] Checking vPilot.exe...
tasklist /FI "IMAGENAME eq vPilot.exe" | find /I "vPilot.exe" >nul
if %errorlevel%==0 (
    echo [%time%] Vpilot already running, skipping...
) else (
    echo [%time%] Starting vPilot...
    start "" "C:\Users\joesa\AppData\Local\vPilot\vPilot.exe"
    timeout /t 10 /nobreak >nul
	)
:skip_vpilot

REM ============================================================
REM 7) CONDITIONAL: BeyondATC
REM ============================================================
if "%choice%"=="2" goto start_batc
if "%choice%"=="3" goto start_batc
goto skip_batc

:start_batc
echo [%time%] Checking BeyondATC.exe...
tasklist /FI "IMAGENAME eq BeyondATC.exe" | find /I "BeyondATC.exe" >nul
if %errorlevel%==0 (
    echo [%time%] BeyondATC already running, skipping...
) else (
    echo [%time%] Starting BeyondATC...
    start "" "D:\BeyondATC\BeyondATC.exe"
    timeout /t 10 /nobreak >nul
	)
:skip_batc

echo [%time%] All programs processed.
timeout /t 10 /nobreak >nul
exit
