@echo off
echo ===== Running .jar in Background =====
start /B java -jar ..\dist\CalculatorApp.jar > ..\logs\app.log 2>&1
echo App running. Logs stored in logs\app.log
