@echo off
if %config%==safe goto safe
REM Put the CD-ROM driver here so it only loads once
SHSUCDX /D:SHSU-CD,X /Q
if %config%==normal goto normal

REM Setup RAM drive for temporary files
xmsdsk r: 1440 /y>nul
set temp=r:\
set tmp=r:\
goto %config%

:clean
:safein
cls
echo.
echo SYSTEM REQUIREMENTS
echo.
echo This release has specific requirements to ensure all games are playable.
echo Failure to meet requirements may disqualify you from some games!
echo.
echo  CPU:     Pentium II (and equivalents) or better (700+ MHz recommended)
echo  RAM:     32-64MB (WARNING: More or less than this will crash games!)
echo  Video:   PCI or AGP video card with VESA 3.0 support (ATI Prohibited!)
echo  Sound:   ISA sound card (PCI Prohibited!)
echo  Network: ISA or PCI ethernet card with RJ45
echo.
echo If you computer does not meet these specifications, press CTRL+C to abort.
echo.
pause
cls
echo.
choice "This operation erases all data on your primary hard drive! Continue "
if errorlevel 2 goto exit
REM Check if disk has been formatted
gdisk.exe 1|find.exe " PRI DOS"|find.exe "INSTALL"|find.exe "FAT">nul
if not errorlevel 1 goto install
gdisk.exe 1|find.exe " PRI DOS"|find.exe "MSDOS710"|find.exe "FAT">nul
if not errorlevel 1 goto reinstall

REM Delete all partitions
GDISK 1 /DEL /ALL
REM Create primary partition using maximum size
gdisk.exe 1 /cre /pri /for /q /v:INSTALL
REM Update MBR
gdisk 1 /mbr
echo.
echo Your computer will now reboot to apply changes. Restart the install to continue.
echo.
pause
restart

:reinstall
echo.
if exist c:\command.com choice "MS-DOS 7.10 already installed! Overwrite "
if errorlevel 2 goto exit
format c: /q /autotest
label C:INSTALL
goto install

:install
REM Make disk bootable
sys C:

REM Install DOS
pkunzip -d -e -o X:\DOS.zip C:\
pkunzip -d -e -o X:\ROOT.zip C:\
if %config%==safein goto configsafe
if not exist C:\AUTOEXEC.BAT copy X:\CONFIG\CONFIG.SYS C:\
goto install2
:configsafe
if not exist C:\AUTOEXEC.BAT copy X:\CONFIG\CONFIG.SAF C:\CONFIG.SYS
:install2
if not exist C:\AUTOEXEC.BAT copy X:\CONFIG\AUTOEXEC.BAT C:\
copy X:\CONFIG\TWEAKS.BAT C:\DOS
rem del C:\DOS\VER*.* (reserved for future use)
copy X:\CONFIG\VER1.1 C:\DOS
copy X:\CONFIG\1STBOOT.MSG C:\
label C:MSDOS710
goto games

:update
:games
:safeup
REM Enable CD swap support
cls
echo.
echo Preparing Install...
copy *.* R:\>nul
subst A: R:>nul
:disconecheck
if not exist X:\1101.ver goto discone
if %config%==update goto update2
if %config%==safeup goto update2
goto games2
:update2
if exist C:\DOS\VER1.1 goto games2
cls
echo.
echo This release contains changes to AUTOEXEC.BAT and CONFIG.SYS.  Your originals
echo will be renamed to AUTOEXEC.OLD and CONFIG.OLD. Any modifications will need to
echo be copied to the new file.
echo.
pause
if exist C:\AUTOEXEC.OLD del C:\AUTOEXEC.OLD
ren C:\AUTOEXEC.BAT AUTOEXEC.OLD
if exist C:\CONFIG.OLD del C:\CONFIG.OLD
ren C:\CONFIG.SYS CONFIG.OLD
if %config%==update copy X:\CONFIG\CONFIG.SYS C:\
if %config%==safeup copy X:\CONFIG\CONFIG.SAF C:\CONFIG.SYS
copy X:\CONFIG\AUTOEXEC.BAT C:\
pkunzip -d -e -o X:\UPDATE.zip C:\
if exist C:\DOS\UIDEJR.SYS del C:\DOS\UIDEJR.SYS
if not exist C:\DOS\TWEAKS.BAT copy X:\CONFIG\TWEAKS.BAT C:\DOS
copy /y X:\CONFIG\VER1.1 C:\DOS

:games2
cls
echo.
echo GAME INSTALLATION
echo.
echo This installer checks for and skips any games already installed.
echo Delete a game directory and perform an update to repair it.
echo.
pause
if not exist C:\BIGRED\RACING.EXE pkunzip -d -e -o X:\GAMES\BIGRED.ZIP C:\
REM detect and remove broken Carmageddon install
if exist C:\CARSPLAT\DATA\DEMOFILE.TXT deltree /y C:\CARSPLAT
if not exist C:\CARSPLAT\CARMA.EXE pkunzip -d -e -o X:\GAMES\CARS*.ZIP C:\
if not exist C:\DESCENT\DESCENTR.EXE pkunzip -d -e -o X:\GAMES\DESCENT.ZIP C:\
if not exist C:\DESCENT2\DESCENT2.EXE pkunzip -d -e -o X:\GAMES\DESCENT2.ZIP C:\
if not exist C:\DOOM2\DOOM2.EXE pkunzip -d -e -o X:\GAMES\DOOM2.ZIP C:\
if not exist C:\DOOM_SE\DOOM.EXE pkunzip -d -e -o X:\GAMES\DOOM_SE.ZIP C:\
if not exist C:\HERETIC\HERETIC.EXE pkunzip -d -e -o X:\GAMES\HERETIC.ZIP C:\
if not exist C:\HEXEN\HEXEN.EXE pkunzip -d -e -o X:\GAMES\HEXEN.ZIP C:\
if not exist C:\HEXENDK\HEXENDK.EXE pkunzip -d -e -o X:\GAMES\HEXENDK.ZIP C:\
if not exist C:\PLUTONIA\DOOM2.EXE pkunzip -d -e -o X:\GAMES\PLUTONIA.ZIP C:\
if not exist C:\QUAKE\QUAKE.EXE pkunzip -d -e -o X:\GAMES\QUAKE.ZIP C:\
if not exist C:\RALLY\RALLY.EXE pkunzip -d -e -o X:\GAMES\RALLY.ZIP C:\
if not exist C:\REDNECK\RR.EXE pkunzip -d -e -o X:\GAMES\REDNECK.ZIP C:\
if not exist C:\ROTT\ROTT.EXE pkunzip -d -e -o X:\GAMES\ROTT.ZIP C:\
if not exist C:\TNT\DOOM2.EXE pkunzip -d -e -o X:\GAMES\TNT.ZIP C:\
if not exist C:\TV\TV.EXE pkunzip -d -e -o X:\GAMES\TV.ZIP C:\
goto disctwo

:discone
cls
echo.
echo Please insert Disc 1
echo.
pause
if not exist X:\1101.ver goto discone
goto disconecheck

:disctwo
cls
echo.
echo Please insert Disc 2
echo.
pause
if not exist X:\1102.ver goto disctwo
if not exist C:\CARMA\MAINPROG.EXE pkunzip -d -e -o X:\GAMES\CARM*.ZIP C:\
if not exist C:\DUKE3D\DUKE3D.EXE pkunzip -d -e -o X:\GAMES\DUKE3D.ZIP C:\
if not exist C:\RIDES\RA.EXE pkunzip -d -e -o X:\GAMES\RIDES.ZIP C:\
if not exist C:\S2\STARTL.EXE pkunzip -d -e -o X:\GAMES\S2.ZIP C:\
if not exist C:\SR\STARTL.EXE pkunzip -d -e -o X:\GAMES\SR.ZIP C:\
if not exist C:\WAR2\WAR2.EXE pkunzip -d -e -o X:\GAMES\WAR2.ZIP C:\
cls
echo.
echo Install complete! Remove the CD and reboot.
echo.
goto exit

:normal

:safe

:exit
