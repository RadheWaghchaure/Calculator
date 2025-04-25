@echo off
echo ==== Pushing Build Zip to GitHub ====
cd ..\dist
git add *.zip
git commit -m "Add build zip"
git push --set-upstream origin main

