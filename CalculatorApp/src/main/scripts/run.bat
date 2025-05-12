REM @echo off
REM setlocal

REM set BIN_DIR=..\..\build
REM set LOG_DIR=..\..\logs
REM if not exist %LOG_DIR% mkdir %LOG_DIR%

REM set LOG_FILE=%LOG_DIR%\app.log

REM echo [INFO] Running JAR in background and logging output to %LOG_FILE%
REM start /b java -jar %BIN_DIR%\CalculatorApp.jar > %LOG_FILE% 2>&1

REM echo [INFO] Application started.
REM endlocal


@echo off
setlocal

REM Define full paths for Jenkins-safe execution
set BIN_DIR=C:\Users\radheshamw\Desktop\CalculatorApp\build
set LOG_DIR=C:\Users\radheshamw\Desktop\CalculatorApp\logs

if not exist %LOG_DIR% mkdir %LOG_DIR%

set LOG_FILE=%LOG_DIR%\app.log

echo [INFO] Running JAR in background and logging output to %LOG_FILE%
start /b java -jar "%BIN_DIR%\CalculatorApp.jar" > "%LOG_FILE%" 2>&1

echo [INFO] Application started.
endlocal
