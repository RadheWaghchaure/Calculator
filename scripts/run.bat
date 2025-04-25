@echo off
echo ===== Running .jar in Background =====

REM Ensure the logs folder exists
if not exist "..\logs" mkdir "..\logs"

REM Run the application in background and redirect output to log file
start /B java -jar ..\dist\CalculatorApp.jar > ..\logs\app.log 2>&1

echo App running. Logs stored in ..\logs\app.log
