@echo off
echo ========================================
echo Quick Start - WeChat Mini Program
echo ========================================
echo.

echo Project Status Check:
echo.

if exist app.json (
    echo [OK] app.json
) else (
    echo [ERROR] app.json missing
)

if exist app.js (
    echo [OK] app.js
) else (
    echo [ERROR] app.js missing
)

if exist pages\index\index.js (
    echo [OK] index.js
) else (
    echo [ERROR] index.js missing
)

if exist pages\index\index.wxml (
    echo [OK] index.wxml
) else (
    echo [ERROR] index.wxml missing
)

if exist pages\index\index.wxss (
    echo [OK] index.wxss
) else (
    echo [ERROR] index.wxss missing
)

if exist images\beagle-dog.png (
    echo [OK] beagle-dog.png
) else (
    echo [ERROR] beagle-dog.png missing
)

echo.
echo ========================================
echo Instructions:
echo ========================================
echo 1. Open WeChat Developer Tools
echo 2. Click "Import Project"
echo 3. Select this folder: %CD%
echo 4. Enter AppID: wx8221ba2e2f77ea55
echo 5. Click "Import"
echo 6. Click "Preview" to test
echo.

echo Features:
echo - Food delivery homepage
echo - Beagle recommendations (coming soon)
echo - Rider leaderboard (coming soon)
echo.

pause 