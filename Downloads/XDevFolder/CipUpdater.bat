@echo off

:UpdateChecker
cls
echo Checking for updates...
ping localhost -n 5 >nul

cd ..
cd ..
download https://raw.githubusercontent.com/CipRos/CipSploit/master/CipSploit.bat "NewCipsploit.bat"
cd Downloads/XDevFolder



IF EXIST "version.txt" (

del version.txt
download https://pastebin.com/raw/f0rFGadA "version.txt"
set /p version=<version.txt
cd ..
cd ..
) else (

download https://pastebin.com/raw/f0rFGadA "version.txt"
set /p version=<version.txt
cd ..
cd ..
)



IF EXIST "CipSploit.bat" (

del "CipSploit.bat"
rename "NewCipsploit.bat" "CipSploit.bat"
goto StartCS
) else (

echo CipSploit.bat Not found! Please reinstall the app!
pause >nul
exit

)

:StartCS
ping localhost -n 3 >nul
cls
IF EXIST "CipSploit.bat" call "CipSploit.bat"