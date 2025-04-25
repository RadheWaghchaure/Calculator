@echo off
echo ===== Compiling Java Source =====

rem Ensure build directory exists
if not exist "..\build" (
    mkdir "..\build"
)

rem Compile the Java source file
javac -d "..\build" "..\CalculatorApp\Calculator.java"

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Compilation failed.
    exit /b %ERRORLEVEL%
) else (
    echo ✅ Compilation completed.
)
