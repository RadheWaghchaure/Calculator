@echo off
setlocal

set ZIP_DIR=..\..\deliverables
set REPORT_FILE=..\..\build\test-report.txt
set SMTP_SERVER=smtp.example.com
set EMAIL_FROM=your_email@example.com
set EMAIL_TO=mentor@example.com
set SUBJECT="CalculatorApp Build Report"
set BODY=Please find attached the latest build and test report.

:: Use blat (or replace this with PowerShell if needed)
for %%f in (%ZIP_DIR%\*.zip) do (
    blat "%REPORT_FILE%" -to %EMAIL_TO% -subject "%SUBJECT%" -body "%BODY%" -attach %%f -server %SMTP_SERVER% -f %EMAIL_FROM%
)

echo [INFO] Email sent with report and zip attachment.
endlocal