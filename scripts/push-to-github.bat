@echo off
echo ==== Pushing Build Zip to GitHub ====

REM Go to the dist folder where zip is created
cd ..
cd dist

REM Show current directory and files for debugging
echo Current directory:
cd
echo Listing contents:
dir

REM Ensure the zip file exists
if not exist build_*.zip (
    echo ❌ ERROR: No build zip found!
    exit /b 1
)

REM Initialize git repo if not already
if not exist .git (
    "C:\Program Files\Git\cmd\git.exe" init
    "C:\Program Files\Git\cmd\git.exe" remote add origin https://%GIT_USER%:%GIT_PASS%@github.com/RadheWaghchaure/Calculator.git
)

REM Configure git user
"C:\Program Files\Git\cmd\git.exe" config user.email "jenkins@example.com"
"C:\Program Files\Git\cmd\git.exe" config user.name "Jenkins CI"

REM Add, commit, and push
"C:\Program Files\Git\cmd\git.exe" add build_*.zip
"C:\Program Files\Git\cmd\git.exe" commit -m "Add zipped build"
"C:\Program Files\Git\cmd\git.exe" push
