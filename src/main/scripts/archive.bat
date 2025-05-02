@echo off
setlocal

set BUILD_DIR=..\..\build
set LOG_DIR=..\..\logs
set ZIP_DIR=..\..\deliverables
set TIMESTAMP=%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set ZIP_NAME=CalculatorApp_%TIMESTAMP%.zip

if not exist %ZIP_DIR% mkdir %ZIP_DIR%

powershell Compress-Archive -Path "%BUILD_DIR%\*","%LOG_DIR%\*" -DestinationPath "%ZIP_DIR%\%ZIP_NAME%"

echo [INFO] Archived build to %ZIP_DIR%\%ZIP_NAME%
endlocal



