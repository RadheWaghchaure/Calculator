@echo off
setlocal

set BIN_DIR=..\..\build
set JAR_NAME=CalculatorApp.jar

echo [INFO] Creating JAR package...
cd %BIN_DIR%
jar cfe %JAR_NAME% Calculator Calculator.class
cd ..\..

echo [INFO] JAR package created at %BIN_DIR%\%JAR_NAME%
endlocal
