# my-WINdows-DEFaults
A bat to config a fresh install of windows. Changes defaults and installs a few programs. Not extensive. Does not require administrator privileges.

## Use this command
```batch
cd /d "%USERPROFILE%\Downloads" && mkdir WinDefaults 2>nul & cd WinDefaults && curl -OL https://raw.githubusercontent.com/girlycoded/win-def/main/windows-defaults.bat && curl -OL https://raw.githubusercontent.com/girlycoded/win-def/main/uninstall-install-programs.bat && curl -OL https://raw.githubusercontent.com/girlycoded/win-def/main/wallpaper.jpg && start cmd /k uninstall-install-programs.bat && windows-defaults.bat
```

### OR

```batch
cd /d "%USERPROFILE%\Downloads" & mkdir WinDefaults 2>nul & cd WinDefaults & set u=https://raw.githubusercontent.com/girlycoded/win-def/main & curl -OL %u%/windows-defaults.bat %u%/uninstall-install-programs.bat %u%/wallpaper.jpg & start cmd /k uninstall-install-programs.bat & windows-defaults.bat
```

#TODO:
- Have the installed program ask for each program if you want it or not.
  - Install Node in Documents/Applications and add to path
  - Change profile picture
  - Install VSC
  - Install blender
