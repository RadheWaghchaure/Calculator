@echo off
echo ===== Running JUnit Tests =====
mkdir ..\test-classes
javac -cp "lib\junit-4.13.2.jar;lib\hamcrest-core-1.3.jar;..\build" -d ..\test-classes ..\CalculatorTest.java
java -cp "lib\junit-4.13.2.jar;lib\hamcrest-core-1.3.jar;..\test-classes;..\build" org.junit.runner.JUnitCore CalculatorTest > ..\logs\test-report.txt
echo Test execution complete.
