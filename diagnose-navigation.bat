@echo off
chcp 65001 >nul
echo.
echo ========================================
echo 诊断页面跳转问题
echo ========================================
echo.

echo 1. 检查app.json配置...
findstr "food-recommendations" app.json >nul
if %errorlevel% equ 0 (
    echo ✓ app.json 中已正确配置页面路径
) else (
    echo ✗ app.json 中未找到页面路径
)

echo.
echo 2. 检查首页JavaScript文件...
findstr "goToFoodRecommendations" pages\index\index.js >nul
if %errorlevel% equ 0 (
    echo ✓ 首页已定义跳转方法
) else (
    echo ✗ 首页未定义跳转方法
)

echo.
echo 3. 检查首页WXML文件...
findstr "goToFoodRecommendations" pages\index\index.wxml >nul
if %errorlevel% equ 0 (
    echo ✓ 首页已绑定点击事件
) else (
    echo ✗ 首页未绑定点击事件
)

echo.
echo 4. 检查美食推荐页面文件...
if exist "pages\food-recommendations\food-recommendations.js" (
    echo ✓ food-recommendations.js 存在
) else (
    echo ✗ food-recommendations.js 不存在
)

if exist "pages\food-recommendations\food-recommendations.wxml" (
    echo ✓ food-recommendations.wxml 存在
) else (
    echo ✗ food-recommendations.wxml 不存在
)

if exist "pages\food-recommendations\food-recommendations.wxss" (
    echo ✓ food-recommendations.wxss 存在
) else (
    echo ✗ food-recommendations.wxss 不存在
)

if exist "pages\food-recommendations\food-recommendations.json" (
    echo ✓ food-recommendations.json 存在
) else (
    echo ✗ food-recommendations.json 不存在
)

echo.
echo 5. 检查图片文件...
if exist "images\beagle-dog.png" (
    echo ✓ beagle-dog.png 存在
) else (
    echo ✗ beagle-dog.png 不存在
)

echo.
echo ========================================
echo 可能的问题和解决方案
echo ========================================
echo.

echo 如果所有检查都通过，可能的问题：
echo 1. 微信开发者工具缓存问题
echo   解决方案：清除缓存并重新编译
echo.
echo 2. 页面路径大小写问题
echo   解决方案：确保路径完全匹配
echo.
echo 3. 文件编码问题
echo   解决方案：检查文件是否为UTF-8编码
echo.
echo 4. 微信开发者工具版本问题
echo   解决方案：更新到最新版本
echo.

echo 建议的解决步骤：
echo 1. 在微信开发者工具中点击"清缓存"
echo 2. 重新编译项目
echo 3. 检查控制台是否有错误信息
echo 4. 尝试重新导入项目
echo.

pause 