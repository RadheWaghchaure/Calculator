@echo off
echo ===== Archiving Build =====

REM Fix time format for single-digit hours
set HH=%TIME:~0,2%
if "%HH:~0,1%"==" " set HH=0%HH:~1,1%
set MN=%TIME:~3,2%

REM Format timestamp
set TIMESTAMP=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%_%HH%%MN%
set ARCHIVE_NAME=build_%TIMESTAMP%.zip

REM Ensure archive directory exists
if not exist "..\archive" mkdir "..\archive"

REM Archive the folders
powershell Compress-Archive -Path ..\build,..\dist,..\logs -DestinationPath ..\archive\%ARCHIVE_NAME%

echo Archive created: %ARCHIVE_NAME%


