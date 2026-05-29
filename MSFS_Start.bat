@echo off
echo ==== Startup sequence initiated at %date% %time% ====

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
REM 5) vPilot
REM ============================================================
echo [%time%] Checking vPilot.exe...
tasklist /FI "IMAGENAME eq vPilot.exe" | find /I "vPilot.exe" >nul
if %errorlevel%==0 (
    echo [%time%] vPilot.exe already running, skipping...
) else (
    echo [%time%] Starting vPilot...
    start "" "C:\Users\joesa\AppData\Local\vPilot\vPilot.exe"
    timeout /t 10 /nobreak >nul
)


REM ============================================================
REM 6) FlyByWire Installer
REM ============================================================
echo [%time%] Checking FlyByWire Installer.exe...
tasklist /FI "IMAGENAME eq FlyByWire Installer.exe" | find /I "FlyByWire Installer.exe" >nul
if %errorlevel%==0 (
    echo [%time%] FlyByWire Installer already running, skipping...
) else (
    echo [%time%] Starting FlyByWire Installer...
    start "" "C:\Users\joesa\AppData\Local\Programs\fbw-installer\FlyByWire Installer.exe"
    timeout /t 10 /nobreak >nul
)


echo [%time%] All programs processed.
timeout /t 10 /nobreak >nul
exit
