
@echo off 

set version=1.0
cd Downloads/XDevFolder
type Logo.txt
cd ..
cd ..
echo.
echo.
echo.
echo.
echo.

:firstBoot
menu f870 "Download" "Exit"
if %ERRORLEVEL% == 1 goto forceupdate
if %ERRORLEVEL% == 2 exit

:normalBoot
menu f870 "Update" "Start Without Updating" "Close"
if %ERRORLEVEL% == 1 goto forceupdate
if %ERRORLEVEL% == 2 (
cls
call UpdatedFile.bat 
exit
)
if %ERRORLEVEL% == 3 exit
 
:forceupdate
cls
IF EXIST "CipSploit.bat" del "CipSploit.bat"
echo.
echo.
echo Loadind latest update...
download https://pastebin.com/raw/f0rFGadA "CipSploit.bat"
ping localhost -n 5 >nul
cls
IF EXIST "CipSploit.bat" call "CipSploit.bat"







