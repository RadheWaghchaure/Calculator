@echo off
setlocal

set BIN_DIR=..\..\build
set LOG_DIR=..\..\logs
if not exist %LOG_DIR% mkdir %LOG_DIR%

set LOG_FILE=%LOG_DIR%\app.log

echo [INFO] Running JAR in background and logging output to %LOG_FILE%
start /b java -jar %BIN_DIR%\CalculatorApp.jar > %LOG_FILE% 2>&1

echo [INFO] Application started.
endlocal