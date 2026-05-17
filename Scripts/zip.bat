@echo off
if %1x==x goto help
pkzip -en -P -r -whs %1.zip %1\*.*
goto exit

:help
echo Usage: zip [folder]

:exit

