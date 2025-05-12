@echo off
setlocal

set BIN_DIR=..\..\build
set TEST_DIR=..\..\test
set LIB_DIR=..\..

echo [INFO] Running JUnit tests...
javac -cp "%LIB_DIR%\junit-4.13.2.jar;%LIB_DIR%\hamcrest-core-1.3.jar;%BIN_DIR%" -d %BIN_DIR% %TEST_DIR%\CalculatorTest.java

java -cp "%BIN_DIR%;%LIB_DIR%\junit-4.13.2.jar;%LIB_DIR%\hamcrest-core-1.3.jar" org.junit.runner.JUnitCore CalculatorTest > %BIN_DIR%\test-report.txt

echo [INFO] Test completed. Report generated at %BIN_DIR%\test-report.txt
endlocal

