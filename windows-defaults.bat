@echo off
title Setup
echo [Setup] Starting...


:: TASKBAR CLEANUP


:: Clear pinned taskbar items
DEL /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /F

:: Align taskbar to the left (0 = left, 1 = center)
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /f

:: Hide search bar (0 = hidden, 1 = icon only, 2 = full bar)
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f

:: Hide Task View button
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f

:: Hide Widgets button
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d 0 /f

:: Hide Copilot button
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 0 /f

:: Hide Chat (Teams) button
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarMn /t REG_DWORD /d 0 /f

echo [Taskbar] Done.



:: EXPLORER SETTINGS


:: Show file extensions
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f

:: Show hidden files
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f

:: Open Explorer to This PC instead of Quick Access
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f

:: Hide desktop icons
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideIcons /t REG_DWORD /d 1 /f

:: Restore classic right-click context menu (Windows 11)
REG ADD "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

echo [Explorer] Done.



:: PRIVACY & TELEMETRY


:: Disable telemetry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

:: Disable activity history
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f

:: Disable Cortana
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f

:: Disable tips and suggestions notifications
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 0 /f

:: Disable suggested apps in Start menu
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f

:: Disable web search in Start Menu
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableWebSearch /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb /t REG_DWORD /d 0 /f

echo [Privacy] Done.



:: ACCESSIBILITY & MISC


:: Disable window animations
REG ADD "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f

:: Disable Sticky Keys shortcut
REG ADD "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f

echo [Misc] Done.



:: WALLPAPER


mkdir "%USERPROFILE%\Pictures\Wallpapers" 2>nul
copy ".\wallpaper.jpg" "%USERPROFILE%\Pictures\Wallpapers\" /Y

set WALLPAPER=%USERPROFILE%\Pictures\Wallpapers\wallpaper.jpg

REG ADD "HKCU\Control Panel\Desktop" /v Wallpaper    /t REG_SZ /d "%WALLPAPER%" /f
REG ADD "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "10" /f
REG ADD "HKCU\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d "0"  /f

RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo [Wallpaper] Set to: %WALLPAPER%

:: RESTART EXPLORER
echo Continue to restart explorer and end program. (Press any key...)
@pause >nul

taskkill /F /IM explorer.exe
start explorer