@echo off
echo ==== Pushing Build Zip to GitHub ====
set GIT="C:\Program Files\Git\cmd\git.exe"
%GIT% add build_*.zip
%GIT% commit -m "Add zip"
%GIT% push origin main
