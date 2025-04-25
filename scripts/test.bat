@echo off
echo ===== Running JUnit Tests =====

set LIB=lib
set CLASSPATH=.;%LIB%/junit-4.13.2.jar;%LIB%/hamcrest-core-1.3.jar

if not exist test-classes mkdir test-classes

javac -cp %CLASSPATH% -d test-classes Calculator.java CalculatorTest.java

if %errorlevel% neq 0 (
    echo Compilation failed.
    exit /b %errorlevel%
)

java -cp %CLASSPATH%;test-classes org.junit.runner.JUnitCore CalculatorTest

echo Test execution complete.

