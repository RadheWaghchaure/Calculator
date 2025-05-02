
@echo off
setlocal

echo [INFO] Compiling Java files...
set SRC_DIR=..\..\java
set BIN_DIR=..\..\build
if not exist %BIN_DIR% mkdir %BIN_DIR%

javac -d %BIN_DIR% %SRC_DIR%\Calculator.java
if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed.
    exit /b 1
)
echo [INFO] Compilation successful.
endlocal
