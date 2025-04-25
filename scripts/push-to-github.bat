@echo off
echo ===== Pushing Build Zip to GitHub =====

REM Navigate to project root (adjust if needed)
cd ..

REM Set full path to Git
set GIT_EXE=C:\Users\radheshamw\AppData\Local\Programs\Git\cmd\git.exe

REM Git config for Jenkins commits
%GIT_EXE% config user.name "jenkins"
%GIT_EXE% config user.email "jenkins@example.com"

REM Add the latest ZIP from the archive folder
%GIT_EXE% add archive\*.zip

REM Commit with a message
%GIT_EXE% commit -m "Automated build zip"

REM Push to GitHub using Jenkins credentials
%GIT_EXE% push https://RadheWaghchaure:%GIT_PASS%@github.com/RadheWaghchaure/Calculator.git
