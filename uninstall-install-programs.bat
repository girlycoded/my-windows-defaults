@echo off
title Setup
echo [Setup] Starting...
echo Will attempt to:
echo   UNINSTALL:
echo     - OneDrive
echo   INSTALL:
echo     - Git
echo     - Firefox
echo     - Google Drive
echo.
$ProgressPreference = 'SilentlyContinue'
:: UNINSTALL ONEDRIVE
echo [OneDrive] Uninstalling...
taskkill /F /IM OneDrive.exe 2>nul
if exist "%SystemRoot%\System32\OneDriveSetup.exe" (
    "%SystemRoot%\System32\OneDriveSetup.exe" /uninstall
)
if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" (
    "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall
)
rd /s /q "%UserProfile%\OneDrive"            2>nul
rd /s /q "%LocalAppData%\Microsoft\OneDrive" 2>nul
rd /s /q "%ProgramData%\Microsoft OneDrive"  2>nul
echo [OneDrive] Uninstalled and cleaned up.
:: INSTALL GIT
if exist "%TEMP%\git-installer.exe" (
    echo [Git] Installer already exists, launching...
) else (
    echo [Git] Downloading...
    powershell -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; $url = (Invoke-RestMethod 'https://api.github.com/repos/git-for-windows/git/releases/latest').assets | Where-Object { $_.name -like '*64-bit.exe' } | Select-Object -ExpandProperty browser_download_url; Invoke-WebRequest $url -OutFile \"$env:TEMP\git-installer.exe\"; Write-Host '[Git] Done.'")
start "" "%TEMP%\git-installer.exe"
:: INSTALL FIREFOX
if exist "%TEMP%\firefox-installer.exe" (
    echo [Firefox] Installer already exists, launching...
) else (
    echo [Firefox] Downloading...
    powershell -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest 'https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US' -OutFile \"$env:TEMP\firefox-installer.exe\"; Write-Host '[Firefox] Done.'")
start "" "%TEMP%\firefox-installer.exe"
:: INSTALL GOOGLE DRIVE
if exist "%TEMP%\googledrive-installer.exe" (
    echo [Google Drive] Installer already exists, launching...
) else (
    echo [Google Drive] Downloading...
    powershell -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest 'https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe' -OutFile \"$env:TEMP\googledrive-installer.exe\"; Write-Host '[Google Drive] Done.'")
start "" "%TEMP%\googledrive-installer.exe"
echo [Installers] Launched.
pause