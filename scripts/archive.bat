@echo off
echo ===== Archiving Build =====

REM Generate timestamp
set TIMESTAMP=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%
set ARCHIVE_NAME=build_%TIMESTAMP%.zip

REM Ensure archive directory exists
if not exist "..\archive" mkdir "..\archive"

REM Archive folders (PowerShell handles the zip)
powershell Compress-Archive -Path ..\build,..\dist,..\logs -DestinationPath ..\archive\%ARCHIVE_NAME%

echo Archive created: %ARCHIVE_NAME%

