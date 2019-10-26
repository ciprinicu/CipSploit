@echo off
find /i "gw" filename.txt
if %errorlevel% EQU 0 (echo found && pause > nul) else (echo not found && pause > nul)
