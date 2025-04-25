@echo off
echo ===== Cleaning up old build zips =====

set "ARCHIVE_DIR=%~dp0..\archive"
pushd %ARCHIVE_DIR%

:: Get the most recent zip file
for /f "delims=" %%A in ('dir /b /a:-d /o:-d *.zip') do (
    set "latest=%%A"
    goto :found
)

:found
echo Keeping latest build zip: %latest%

:: Delete all others
for %%F in (*.zip) do (
    if /I not "%%F"=="%latest%" (
        echo Deleting: %%F
        del "%%F"
    )
)

popd
