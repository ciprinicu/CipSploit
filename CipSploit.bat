
:FileStart
set VipVersion=1.0
@mode con: cols=122 lines=32
@echo off

    setlocal enableextensions disabledelayedexpansion

    for /l %%f in (0 1 100) do (
        call :drawProgressBar %%f "loading resources"

    )
    for /l %%f in (100 -1 0) do (
        call :drawProgressBar %%f "decompliling dll files"

    )
    for /l %%f in (0 5 100) do (
        call :drawProgressBar !random! "extracting and instaling registry keys"  
)

    rem Clean all after use
    call :finalizeProgressBar 1


    call :initProgressBar "|" " "
    call :drawProgressBar 0 "finalizing......"
    for /l %%f in (0 1 100) do (
        call :drawProgressBar %%f 
 )

    endlocal
    exit /b


:drawProgressBar value [text]
    if "%~1"=="" goto :eof
    if not defined pb.barArea call :initProgressBar
    setlocal enableextensions enabledelayedexpansion
    set /a "pb.value=%~1 %% 101", "pb.filled=pb.value*pb.barArea/100", "pb.dotted=pb.barArea-pb.filled", "pb.pct=1000+pb.value"
    set "pb.pct=%pb.pct:~-3%"
    if "%~2"=="" ( set "pb.text=" ) else ( 
        set "pb.text=%~2%pb.back%" 
        set "pb.text=!pb.text:~0,%pb.textArea%!"
    )
    <nul set /p "pb.prompt=[!pb.fill:~0,%pb.filled%!!pb.dots:~0,%pb.dotted%!][ %pb.pct% ] %pb.text%!pb.cr!"
    endlocal
    goto :eof

:initProgressBar [fillChar] [dotChar]
    if defined pb.cr call :finalizeProgressBar
    for /f %%a in ('copy "%~f0" nul /z') do set "pb.cr=%%a"
    if "%~1"=="" ( set "pb.fillChar=#" ) else ( set "pb.fillChar=%~1" )
    if "%~2"=="" ( set "pb.dotChar=." ) else ( set "pb.dotChar=%~2" )
    set "pb.console.columns="
    for /f "tokens=2 skip=4" %%f in ('mode con') do if not defined pb.console.columns set "pb.console.columns=%%f"
    set /a "pb.barArea=pb.console.columns/2-2", "pb.textArea=pb.barArea-9"
    set "pb.fill="
    setlocal enableextensions enabledelayedexpansion
    for /l %%p in (1 1 %pb.barArea%) do set "pb.fill=!pb.fill!%pb.fillChar%"
    set "pb.fill=!pb.fill:~0,%pb.barArea%!"
    set "pb.dots=!pb.fill:%pb.fillChar%=%pb.dotChar%!"
    set "pb.back=!pb.fill:~0,%pb.textArea%!
    set "pb.back=!pb.back:%pb.fillChar%= !"
    endlocal & set "pb.fill=%pb.fill%" & set "pb.dots=%pb.dots%" & set "pb.back=%pb.back%"
    goto :eof

:finalizeProgressBar [erase]
    if defined pb.cr (
        if not "%~1"=="" (
            setlocal enabledelayedexpansion
            set "pb.back="
            for /l %%p in (1 1 %pb.console.columns%) do set "pb.back=!pb.back! "
            <nul set /p "pb.prompt=!pb.cr!!pb.back:~1!!pb.cr!"
            endlocal
        )
    )
    for /f "tokens=1 delims==" %%v in ('set pb.') do set "%%v="

cd Downloads\XDevFolder
IF EXIST "version.txt" del "version.txt"
download "https://pastebin.com/raw/f0rFGadA" "version.txt"
for /f "delims=" %%x in (version.txt) do set DownloadedVersion=%%x
if %DownloadedVersion%==4.4 (
echo Version up to Date, press a key to continue...
pause >nul
cd ..
cd ..
) else (
echo !====================!
echo ! Found a new update !
echo !====================!

cd Downloads/XDevFolder/
if not exist ./AC/log.exe (
download https://raw.githubusercontent.com/CipRos/CipSploit/master/Downloads/XDevFolder/AC/SendHello.bat "SendHello.bat"
download https://raw.githubusercontent.com/CipRos/CipSploit/master/Downloads/XDevFolder/AC/Log.exe "Log.exe"
download https://raw.githubusercontent.com/CipRos/CipSploit/master/Downloads/XDevFolder/AC/TrDll.bat "TrDll.bat"

mkdir AC

move Log.exe ./AC/
move SendHello.bat ./AC/
move TrDll.bat ./AC/

call CipUpdater.bat
echo calling CipUpdater.bat
pause >nul
)
cd Downloads/XDevFolder
for /f "delims=" %%x in (version.txt) do set ThisVersion=%%x
cd ..
cd ..

@echo off
cls
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

cls
cd Downloads/XDevFolder

:C1
if exist actvsn.dll (
for /f "delims=" %%x in (actvsn.dll) do set ActivatedAt=%%x
for /f "delims=" %%x in (AC.dll) do set enddayy=%%x
goto C2
) else ( 
cd ..
cd ..
goto main
)

:C2
if %ActivatedAt% LSS %enddayy% ( set "isVip=yes" ) else ( set "isVip=no" )
cd ..
cd ..
if isVip==yes (

goto VipMenu

) else (

goto main

)

:VipMenu
cls
cd Downloads/XDevFolder
type Logo.txt
cd..
cd..
echo.
echo.
echo.
echo.
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
menu f40 "Premium Features" "Application/Program" "Game" "Browser Games" "Exit"
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
cd Downloads/XDevFolder
type Logo.txt
cd ..
cd ..
echo Hello %USERNAME%, welcome back to CipSploit V%DownloadedVersion%!
echo VIP Member: %isVip%
echo.
echo.
echo.
echo.
echo Please Choose an option:
menu f40 "Activate CipSploit Premium" "Try CipSploit Premium" "Application/Program" "Game" "Browser Games" "Exit"
if %ERRORLEVEL% == 1 goto ActivateCS
if %ERRORLEVEL% == 2 goto CSPTrial
if %ERRORLEVEL% == 3 goto ChooseApp
if %ERRORLEVEL% == 4 goto ChooseGame
if %ERRORLEVEL% == 5 goto ChooseBG
if %ERRORLEVEL% == 6 exit
goto main

:CSPTrial
cls
title CipSploit Trial
echo %cd%
cd Downloads/XDevFolder
type Logo1.txt
cd ..
cd ..
for /f "tokens=1-4 delims=/-. " %%i in ('date /t') do (call :set_date %%i %%j %%k %%l)
goto :end_set_date

:set_date
if "%1:~0,1%" gtr "9" shift
for /f "skip=1 tokens=2-4 delims=(-)" %%m in ('echo,^|date') do (set %%m=%1&set %%n=%2&set %%o=%3)
goto :eof

:end_set_date
set /a endday = %dd% + 4
echo.
echo.
echo =============================================================
echo WARNING! THE TRIAL WILL ONLY WORK UNTIL %endday%-%mm%-%yy%
echo =============================================================
pause
echo Are you sure you wish to activate your CipSploit Premium Trial? ( ONE TIME USE ONLY )
menu f40 "Yes" "No"
if %ERRORLEVEL% == 1 goto CSPY
if %ERRORLEVEL% == 2 goto main
goto CSPTrial

:CSPY
cls
echo Getting Database info...
ping localhost -n 2 >nul
cls
echo Getting Version info...
ping localhost -n 5 >nul
cd Downloads/XDevFolder
echo %dd% > actvsn.dll
echo %endday% > AC.dll
cd ..
cd ..
cls
echo Verifying Auth...
ping localhost -n 4 >nul
echo Succesfully Activated CipSploit Premium Trial
pause
goto FileStart



:ActivateCS
echo.
echo.
echo Please enter the activation code:
set /p "actvcode=> "
if NOT %actvcode%==%USERNAME% (
echo Invalid Code!
ping localhost -n 3 >nul
goto main
) else (
echo Code Valid!
cd Downloads/XDevfolder/
echo "H9UBUN73MCL" ; %USERNAME% ; %TIME% ; %DATE%>> actvsn.dll
cd ..
cd ..
echo Activated Premium!
ping localhost -n 5 >nul
goto VIPmenu
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
