@echo off
echo ===== Compiling Java Source =====

rem Create the build directory if it doesn't exist
if not exist ..\build (
    mkdir ..\build
)

rem Compile Calculator.java and output .class to build folder
javac -d ..\build ..\Calculator.java

echo ✅ Compilation completed.

