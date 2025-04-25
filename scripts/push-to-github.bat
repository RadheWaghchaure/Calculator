@echo off
echo ==== Pushing Build Zip to GitHub ====
cd dist

REM Configure Git identity
git config user.name "jenkins"
git config user.email "jenkins@example.com"

REM Initialize repo if needed
if not exist .git (
    git init
    git remote add origin https://github.com/YourUsername/Calculator.git
)

git add *.zip
git commit -m "Automated build zip"
git push https://%GIT_USER%:%GIT_PASS%@github.com/YourUsername/Calculator.git main
