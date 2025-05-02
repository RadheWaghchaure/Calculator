@echo off
setlocal
cd ..\..\

echo [INFO] Pushing archive to GitHub...
git add .
git commit -m "Automated commit with new build"
git push origin main

echo [INFO] Push to GitHub completed.
endlocal
