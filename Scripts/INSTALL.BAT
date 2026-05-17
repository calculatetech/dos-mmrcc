if not exist X:\1001.ver goto discone
cls
echo Any existing games will not be reinstalled. Delete the game directory and re-run this install to repair.
echo.
pause
if not exist C:\BIGRED\RACING.EXE pkunzip -d -e -o X:\GAMES\BIGRED.ZIP C:\
if not exist C:\CARSPLAT\CARMA.EXE pkunzip -d -e -o X:\GAMES\CAR*.ZIP C:\
if not exist C:\DESCENT\DESCENTR.EXE pkunzip -d -e -o X:\GAMES\DESCENT.ZIP C:\
if not exist C:\DESCENT2\DESCENT2.EXE pkunzip -d -e -o X:\GAMES\DESCENT2.ZIP C:\
if not exist C:\DOOM2\DOOM2.EXE pkunzip -d -e -o X:\GAMES\DOOM2.ZIP C:\
if not exist C:\DOOM_SE\DOOM.EXE pkunzip -d -e -o X:\GAMES\DOOM_SE.ZIP C:\
if not exist C:\DUKE3D\DUKE3D.EXE pkunzip -d -e -o X:\GAMES\DUKE3D.ZIP C:\
if not exist C:\HERETIC\HERETIC.EXE pkunzip -d -e -o X:\GAMES\HERETIC.ZIP C:\
if not exist C:\HEXEN\HEXEN.EXE pkunzip -d -e -o X:\GAMES\HEXEN.ZIP C:\
if not exist C:\HEXENDK\HEXENDK.EXE pkunzip -d -e -o X:\GAMES\HEXENDK.ZIP C:\
if not exist C:\PLUTONIA\DOOM2.EXE pkunzip -d -e -o X:\GAMES\PLUTONIA.ZIP C:\
if not exist C:\QUAKE\QUAKE.EXE pkunzip -d -e -o X:\GAMES\QUAKE.ZIP C:\
if not exist C:\RALLY\RALLY.EXE pkunzip -d -e -o X:\GAMES\RALLY.ZIP C:\
if not exist C:\REDNECK\RR.EXE pkunzip -d -e -o X:\GAMES\REDNECK.ZIP C:\
if not exist C:\TNT\DOOM2.EXE pkunzip -d -e -o X:\GAMES\TNT.ZIP C:\
if not exist C:\TV\TV.EXE pkunzip -d -e -o X:\GAMES\TV.ZIP C:\
goto disctwo

:discone
cls
echo Please insert Disc 1
pause
if not exist X:\1001.ver goto discone
goto games

:disctwo
cls
echo Please insert Disc 2
pause
if not exist X:\1002.ver goto disctwo
if not exist C:\RIDES\RA.EXE pkunzip -d -e -o X:\GAMES\RIDES.ZIP C:\
if not exist C:\S2\STARTL.EXE pkunzip -d -e -o X:\GAMES\S2.ZIP C:\
if not exist C:\SR\STARTL.EXE pkunzip -d -e -o X:\GAMES\SR.ZIP C:\
cls
echo Install complete! Remove the CD and reboot.
goto exit

:exit