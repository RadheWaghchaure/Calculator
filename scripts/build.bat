@echo off
echo ===== Compiling Java Source =====

rem Set workspace dir to the directory above the scripts folder
cd /d %~dp0..
set "SRC=CalculatorApp\Calculator.java"
set "OUT=build"

if not exist %OUT% (
    mkdir %OUT%
)

javac -d %OUT% %SRC%

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Compilation failed.
    exit /b %ERRORLEVEL%
) else (
    echo ✅ Compilation successful.
)
