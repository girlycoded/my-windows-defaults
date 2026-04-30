# my-windows-defaults
A bat to config a fresh install of windows. Changes defaults and installs a few programs.

## Use this command
cd /d "%USERPROFILE%\Downloads" && mkdir WinDefaults 2>nul & cd WinDefaults && curl -OL https://raw.githubusercontent.com/girlycoded/my-windows-defaults/main/windows-defaults.bat && curl -OL https://raw.githubusercontent.com/girlycoded/my-windows-defaults/main/uninstall-install-programs.bat && curl -OL https://raw.githubusercontent.com/girlycoded/my-windows-defaults/main/wallpaper.jpg && start cmd /k uninstall-install-programs.bat && windows-defaults.bat

### OR

cd /d "%USERPROFILE%\Downloads" & mkdir WinDefaults 2>nul & cd WinDefaults & set u=https://raw.githubusercontent.com/girlycoded/my-windows-defaults/main & curl -OL %u%/windows-defaults.bat %u%/uninstall-install-programs.bat %u%/wallpaper.jpg & start cmd /k uninstall-install-programs.bat & windows-defaults.bat
