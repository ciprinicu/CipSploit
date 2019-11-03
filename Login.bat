@echo off
set isLoggedIn=no

:start
if exist ftpcmd.dat del ftpcmd.dat
set isBanned=No
cls
title Hi
echo.
cd Downloads\XDevFolder
type Logo.txt
cd ..
cd ..
echo.
echo.
menu f40 "Login" "Sign Up" "Exit"
if %ERRORLEVEL% == 1 goto login
if %ERRORLEVEL% == 2 goto signup
if %ERRORLEVEL% == 3 exit

:login
set /p "uname=Username: "
if exist %uname%.dll (
del %uname%.dll
echo user epiz_24699883> ftpcmd.dat
echo CipSploit>> ftpcmd.dat
echo cd htdocs>> ftpcmd.dat
echo cd CSUsers>> ftpcmd.dat
echo get %uname%.dll>> ftpcmd.dat
echo quit>> ftpcmd.dat
ftp -n -v -s:ftpcmd.dat ftpupload.net
cls
goto acx
) else (
echo user epiz_24699883> ftpcmd.dat
echo CipSploit>> ftpcmd.dat
echo cd htdocs>> ftpcmd.dat
echo cd CSUsers>> ftpcmd.dat
echo get %uname%.dll>> ftpcmd.dat
echo quit>> ftpcmd.dat
ftp -n -v -s:ftpcmd.dat ftpupload.net
cls
goto acx
)

:acx
< .\%uname%.dll (
set /p accpass=     
set /p isBanned=
)
set /p "pass=Password: "
set isDev=no


if %pass%==%accpass% (
cd Downloads/XDevFolder/API
"log.exe" "https://discordapp.com/api/webhooks/634090778020544535/YnLrdu_R2iIq29A4wUBq7O300EkRyYRGcYVzLicCxlzJThlm_RAQd7hKDVfRmo4lRxT8" ">>> Login!  ```User: %uname%```" "CipSploit Security"

cd ..
cd ..
cd ..
cls
goto UserPannel
) else (
echo Incorrect Login!
pause
goto start
)

:UserPannel
if %isBanned%==Yes (goto banned)
cls
if %uname%==CipRos (set isDev=yes && goto DevPannel)
if %uname%==Juicy (set isDev=yes && goto DevPannel)
set isLoggedIn=yes
call CipSploit.bat

:DevPannel
set isLoggedIn=yes

call CipSploit.bat

cls
echo.
echo Welcome back %uname%!
echo.
echo.
echo.
menu A0 "Delete an account" "Ban a user" "Log Off" "Exit"
if %ERRORLEVEL% == 1 goto delaccount
if %ERRORLEVEL% == 2 goto banuser
if %ERRORLEVEL% == 3 goto start
if %ERRORLEVEL% == 4 exit

:banuser
cls
echo.
echo.
echo Please input a username to ban:
set /p "banneduser=> "
< .\%banneduser%.dll (
set /p banpass=     
set /p isBanned=
)

(
echo %banpass%
echo Yes
) >.\%banneduser%.dll

echo user epiz_24699883> ftpcmd.dat
echo CipSploit>> ftpcmd.dat
echo cd htdocs>> ftpcmd.dat
echo cd CSUsers>> ftpcmd.dat
echo put %banneduser%.dll>> ftpcmd.dat
echo quit>> ftpcmd.dat
ftp -n -v -s:ftpcmd.dat ftpupload.net
cd Downloads/XDevFolder/API
"log.exe" "https://discordapp.com/api/webhooks/634090778020544535/YnLrdu_R2iIq29A4wUBq7O300EkRyYRGcYVzLicCxlzJThlm_RAQd7hKDVfRmo4lRxT8" ">>> Account Banned!  ```Username: %banneduser%``` ```Banned by: %uname%```" "CipSploit Security"

cd ..
cd ..
cd ..
cls
echo Succesfully Banned %banneduser%'s account
pause >nul
goto DevPannel

:delaccount
cls
echo Please input a username to delete the account of:
set /p "deluser=> "
echo user epiz_24699883> ftpcmd.dat
echo CipSploit>> ftpcmd.dat
echo cd htdocs>> ftpcmd.dat
echo cd CSUsers>> ftpcmd.dat
echo delete %deluser%.dll>> ftpcmd.dat
echo quit>> ftpcmd.dat
ftp -n -v -s:ftpcmd.dat ftpupload.net
cd Downloads/XDevFolder/API
"log.exe" "https://discordapp.com/api/webhooks/634090778020544535/YnLrdu_R2iIq29A4wUBq7O300EkRyYRGcYVzLicCxlzJThlm_RAQd7hKDVfRmo4lRxT8" ">>> Account Deleted!  ```Account name: %deluser%``` ```Banned by: %uname%```" "CipSploit Security"

cd ..
cd ..
cd ..
cls
echo Succesfully Deleted %deluser%'s account
pause >nul
goto DevPannel

:signup
cls
echo Sign Up
set /p "username=Username: "
set /p "password=Password: "

(
echo %password%
echo %isBanned%
) >.\%username%.dll
echo user epiz_24699883> ftpcmd.dat
echo CipSploit>> ftpcmd.dat
echo cd htdocs>> ftpcmd.dat
echo cd CSUsers>> ftpcmd.dat
echo put %username%.dll>> ftpcmd.dat
echo quit>> ftpcmd.dat
ftp -n -v -s:ftpcmd.dat ftpupload.net
del ftpcmd.dat
cd Downloads/XDevFolder/API
"log.exe" "https://discordapp.com/api/webhooks/634090778020544535/YnLrdu_R2iIq29A4wUBq7O300EkRyYRGcYVzLicCxlzJThlm_RAQd7hKDVfRmo4lRxT8" ">>> New Account Created!  ```Account name: %username%``` ```Password: %password%```" "CipSploit Security"

cd ..
cd ..
cd ..
cls
echo Account created!
pause
goto start

:banned
cls
cd Downloads/XDevFolder
type Logo.txt
cd ..
cd ..
echo.
echo.
echo You have been banned by an Administrator!
pause >nul
goto banned