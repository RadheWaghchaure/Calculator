@echo off
echo ===== Packaging .jar =====
mkdir ..\dist
jar cfe ..\dist\CalculatorApp.jar Calculator -C ..\build .
echo .jar created.
