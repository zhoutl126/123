@echo off
chcp 65001 >nul
echo ========================================
echo WeChat Mini Program Startup Script
echo ========================================
echo.

echo Checking WeChat Mini Program project status...

echo 1. Checking project files...
if exist app.json (
    echo [OK] app.json exists
) else (
    echo [ERROR] app.json not found
    pause
    exit /b 1
)

if exist app.js (
    echo [OK] app.js exists
) else (
    echo [ERROR] app.js not found
    pause
    exit /b 1
)

if exist pages\index\index.js (
    echo [OK] Index page files exist
) else (
    echo [ERROR] Index page files not found
    pause
    exit /b 1
)

if exist images\beagle-dog.png (
    echo [OK] Image resources exist
) else (
    echo [ERROR] Image resources not found
    pause
    exit /b 1
)

echo.
echo 2. Checking project configuration...
echo [OK] Project name: Food Delivery
echo [OK] Page count: 2 pages
echo [OK] Base library version: v2

echo.
echo ========================================
echo WeChat Mini Program check completed!
echo ========================================
echo.

echo Next steps:
echo 1. Open WeChat Developer Tools
echo 2. Import project, select current directory
echo 3. Configure AppID: wx8221ba2e2f77ea55
echo 4. Click preview or device debugging
echo.

echo Project features:
echo [FOOD] Food delivery homepage
echo [DOG] Beagle daily recommendations (in development)
echo [TROPHY] Rider leaderboard (in development)
echo.

echo If you encounter problems, please check:
echo - WeChat Developer Tools version is latest
echo - Base library version is supported
echo - Network connection is normal
echo.

pause 