@echo off
echo ===== Cleaning up old build zips =====

setlocal enabledelayedexpansion
set "ARCHIVE_DIR=%CD%"
pushd %ARCHIVE_DIR%

:: Get the most recent zip file
set "latest="
for /f "delims=" %%A in ('dir /b /a:-d /o:-d *.zip') do (
    set "latest=%%A"
    goto :found
)

:found
if not defined latest (
    echo No zip files found.
    popd
    exit /b 0
)

echo Keeping latest build zip: !latest!

:: Delete all others
for %%F in (*.zip) do (
    if /I not "%%F"=="!latest!" (
        echo Deleting: %%F
        del "%%F"
    )
)

popd
endlocal
