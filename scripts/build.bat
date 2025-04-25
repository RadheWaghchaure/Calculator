@echo off
echo ===== Compiling Java Source =====
mkdir ..\build
javac -d ..\build ..\Calculator.java
echo Compilation completed.
