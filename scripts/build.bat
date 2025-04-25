@echo off
echo ===== Compiling Java Source =====

:: Set working directory to repo root, one level above the scripts folder
cd /d %~dp0..

:: Define paths
set "SRC=CalculatorApp\Calculator.java"
set "OUT=build"

:: Create build folder if it doesn't exist
if not exist %OUT% (
    mkdir %OUT%
)

:: Compile
javac -d %OUT% %SRC%

:: Check result
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Compilation failed.
    exit /b %ERRORLEVEL%
) else (
    echo ✅ Compilation successful.
)
