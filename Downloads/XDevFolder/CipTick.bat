@ECHO OFF
title CipTicker
mode con:cols=26 lines=2
::start HelpDll.bat
:B
SET MyProcess=menu.exe
TASKLIST | FINDSTR /I "%MyProcess%" >nul


IF ERRORLEVEL 1 (
echo CipSploit is not running
) ELSE (
echo CipSploit is running

)


ping localhost -n 5 >nul
cls
GOTO :B 
