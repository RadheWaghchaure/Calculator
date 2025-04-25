@echo off
echo ==== Pushing Build Zip to GitHub ====

cd ..
cd archive

echo Current directory:
cd

echo Listing contents:
dir

for %%f in (*.zip) do (
    set ZIP_FILE=%%f
)

if not defined ZIP_FILE (
    echo ❌ ERROR: No build zip found!
    exit /b 1
)

echo ✅ Found zip: %ZIP_FILE%

git config --global user.name "Jenkins CI"
git config --global user.email "jenkins@example.com"

git pull origin main
copy "%ZIP_FILE%" .
git add "%ZIP_FILE%"
git commit -m "Add build archive %ZIP_FILE%"
git push origin main

echo ✅ Build zip pushed to GitHub.

