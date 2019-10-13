set version=4.0
set VipVersion=1.0
cd Downloads/XDevFolder
::call CipUpdater.bat
set RedAndGreen=00
set Blue=10
set DarkGreen=20
set LightBlue=30
set Red=40
set Purple=50
set Yellow=60
set White=70
set DarkGrey=80
set SolidBlue=90
set BlackAndBlue=01
set BlackAndGreen=02

@echo off
cls
cd Downloads/XDevFolder
if exist data.dll (
set "isVip=yes"
cd ..
cd ..
goto VipMenu
) else (
set "isVip=no"
cd ..
cd ..
goto main
)

:VipMenu
cls
echo Hello %USERNAME%, welcome back to Premium CipSploit V%VipVersion%!
echo.
echo.
echo Run code on CipSploit:
set /p "run=> "
echo VIP Member: %isVip%
echo.
echo.
echo.
echo.
echo Please Choose an option:
%run%
menu f8%BlackAndBlue% "Premium Features" "Application/Program" "Game" "Browser Games" "Exit"
if %ERRORLEVEL% == 1 goto PremiumFeatures
if %ERRORLEVEL% == 2 goto VIPChooseApp
if %ERRORLEVEL% == 3 goto VIPChooseGame
if %ERRORLEVEL% == 4 goto VIPChooseBG
if %ERRORLEVEL% == 5 exit
goto VipMenu

pause >nul
goto VipMenu

:PremiumFeatures
cls
echo 1) its kewl
pause >nul
goto VipMenu

:main
color 0a
cls
echo Hello %USERNAME%, welcome back to CipSploit V%version%!
echo VIP Member: %isVip%
echo.
echo.
echo.
echo.
echo Please Choose an option:
menu f8%BlackAndBlue% "Activate CipSploit Premium" "Application/Program" "Game" "Browser Games" "Exit"
if %ERRORLEVEL% == 1 goto ActivateCS
if %ERRORLEVEL% == 2 goto ChooseApp
if %ERRORLEVEL% == 3 goto ChooseGame
if %ERRORLEVEL% == 4 goto ChooseBG
if %ERRORLEVEL% == 5 exit
goto main

:ActivateCS
echo.
echo.
echo Please enter the activation code:
set /p "actvcode=> "
if NOT %actvcode%==H9UBUN73MCL (
echo Invalid Code!
ping localhost -n 3 >nul
goto main
) else (
echo Code Valid!
cd Downloads/XDevfolder/
echo "H9UBUN73MCL" >> data.dll
echo Activated Premium!
ping localhost -n 5 >nul
goto main
)


:ChooseBG
cls
echo Please choose an app:
echo.
echo.
menu f870 "CoolMath Games" "Unassigned" "Back"
if %ERRORLEVEL% == 1 goto CMGHack
if %ERRORLEVEL% == 2 goto ChooseBG
if %ERRORLEVEL% == 3 goto main

:CMGHack
cls
echo Oppening browser...
start http://www.hackedonlinegames.com/games/browse/cool-math
echo Done!
ping localhost -n 3 >nul
goto main

:ChooseApp
cls
echo Please choose an app:
echo.
echo.
menu f870 "Archerio (Android)" "Unassigned" "Back"
if %ERRORLEVEL% == 1 goto Archerio
if %ERRORLEVEL% == 2 goto ChooseApp
if %ERRORLEVEL% == 3 goto main

:Archerio
cls
echo Oppening browser...
start https://gofile.io/?c=slT6Yn
echo Done!
ping localhost -n 3 >nul
goto main


:ChooseGame
cls
echo Please choose a game:
echo.
echo.
menu f870 "Roblox" "Minecraft" "Back"
echo A
if %ERRORLEVEL% == 1 goto Roblox
if %ERRORLEVEL% == 2 goto Minecraft
if %ERRORLEVEL% == 3 goto main

:Roblox
cls
menu f870 "Topkek Script" "Trigon Executor" "XPloit Executor made by Cip 2.0" "Page 2"
if %ERRORLEVEL% == 1 goto Topkek
if %ERRORLEVEL% == 2 goto TrigonExec
if %ERRORLEVEL% == 3 goto RBXPloit
if %ERRORLEVEL% == 4 goto RBPage2

:Topkek
cls
echo Downloading topkek...
download https://pastebin.com/3r8sNvt3 Topkek.lua
move /Y "Topkek.lua" "Downloads/Games/Roblox"
echo.
echo.
echo.
echo Press enter to continue
pause >nul
goto main

:Trigon
cls
echo Oppening browser...
start https://mega.nz/#F!o1lB3DaB!9zoxRYNYqOYVQghjn8b9nw
echo Done!
ping localhost -n 3 >nul
goto main

:RBXPloit
cls
if %isVip%==yes (
echo Oppening browser...
start https://mega.nz/#F!26wQBYJK!Xl22h1lDiTPJSjoc7w_ZQw
echo Done!
ping localhost -n 3 >nul
goto main
) else (
echo This is a premium only feature! 
ping localhost -n 3 >nul
goto main
)

:RBPage2
cls
echo Work in progress, please update in 5 minutes...
pause >nul
goto main

:Minecraft
cls
echo Work in progress, please update in 5 minutes...
pause >nul
goto main
