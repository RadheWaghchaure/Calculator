@echo off
echo ===== Compiling Java Source =====
if not exist build (
    mkdir build
)
javac -d build Calculator.java
echo Compilation completed.

