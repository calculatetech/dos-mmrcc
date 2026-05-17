@ECHO OFF
SET DIRCMD=/O/P/4
C:\DOS\DOSIDLE.EXE -cpu
if errorlevel 1 pause
C:\DOS\HXRT\HDPMI32.EXE -r -i
if errorlevel 1 pause
REM Secret Sauce for PPRO and newer (vga disabled for Doom)
REM C:\DOS\MTRRLFBE\mtrrlfbe vga wc
C:\DOS\MTRRLFBE\mtrrlfbe lfb wc
if errorlevel 1 pause
CLS
