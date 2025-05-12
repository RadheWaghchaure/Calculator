@echo off
setlocal
set ZIP_DIR=..\..\deliverables

forfiles /p %ZIP_DIR% /s /m *.zip /d -3 /c "cmd /c echo Deleting @file & del @file"
echo [INFO] Cleanup complete. Old zip files removed.
endlocal
endlocal
