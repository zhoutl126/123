@echo off
chcp 65001 >nul
echo.
echo ========================================
echo           完整缓存清理工具
echo ========================================
echo.
echo 🧹 正在清理所有缓存文件...
echo.

echo 📁 清理微信开发者工具缓存...
if exist "%APPDATA%\微信开发者工具" (
    echo 找到微信开发者工具缓存目录
    rmdir /s /q "%APPDATA%\微信开发者工具\Default\Cache" 2>nul
    rmdir /s /q "%APPDATA%\微信开发者工具\Default\Code Cache" 2>nul
    rmdir /s /q "%APPDATA%\微信开发者工具\Default\GPUCache" 2>nul
    echo ✓ 微信开发者工具缓存已清理
) else (
    echo ⚠️  未找到微信开发者工具缓存目录
)

echo.
echo 📁 清理项目临时文件...
if exist "node_modules" (
    echo 删除 node_modules...
    rmdir /s /q "node_modules" 2>nul
)

if exist ".next" (
    echo 删除 .next 缓存...
    rmdir /s /q ".next" 2>nul
)

if exist "dist" (
    echo 删除 dist 目录...
    rmdir /s /q "dist" 2>nul
)

echo.
echo 📁 清理微信小程序编译缓存...
if exist "miniprogram_npm" (
    echo 删除 miniprogram_npm...
    rmdir /s /q "miniprogram_npm" 2>nul
)

if exist ".wxss" (
    echo 删除 .wxss 临时文件...
    del /q "*.wxss" 2>nul
)

echo.
echo 🔍 检查关键文件是否存在...
echo.

if exist "app.json" (
    echo ✓ app.json 存在
) else (
    echo ✗ app.json 缺失！
)

if exist "pages\index\index.js" (
    echo ✓ 首页JS文件存在
) else (
    echo ✗ 首页JS文件缺失！
)

if exist "pages\test-page\test-page.js" (
    echo ✓ 聊天页面JS文件存在
) else (
    echo ✗ 聊天页面JS文件缺失！
)

if exist "pages\test-page\test-page.wxml" (
    echo ✓ 聊天页面WXML文件存在
) else (
    echo ✗ 聊天页面WXML文件缺失！
)

if exist "pages\test-page\test-page.wxss" (
    echo ✓ 聊天页面WXSS文件存在
) else (
    echo ✗ 聊天页面WXSS文件缺失！
)

echo.
echo 📋 重新创建必要的配置文件...
echo.

echo 检查 app.json 配置...
findstr /c:"test-page" app.json >nul
if errorlevel 1 (
    echo ⚠️  app.json 中缺少 test-page 页面配置
    echo 正在修复...
    echo {
    echo   "pages": [
    echo     "pages/index/index",
    echo     "pages/test-page/test-page",
    echo     "pages/simple-test/simple-test"
    echo   ],
    echo   "window": {
    echo     "backgroundTextStyle": "light",
    echo     "navigationBarBackgroundColor": "#fff",
    echo     "navigationBarTitleText": "比格美食",
    echo     "navigationBarTextStyle": "black"
    echo   },
    echo   "style": "v2",
    echo   "sitemapLocation": "sitemap.json"
    echo } > app.json
    echo ✓ app.json 已重新创建
) else (
    echo ✓ app.json 配置正确
)

echo.
echo 🚀 缓存清理完成！
echo.
echo 📋 接下来的步骤：
echo.
echo 1️⃣ 关闭微信开发者工具
echo 2️⃣ 重新打开微信开发者工具
echo 3️⃣ 重新导入项目：C:\Users\ASUS\WeChatProjects\miniprogram-2
echo 4️⃣ 点击"编译"按钮
echo 5️⃣ 等待编译完成
echo 6️⃣ 测试页面功能
echo.
echo ⚠️  如果仍然有问题：
echo    - 检查控制台错误信息
echo    - 确认项目路径正确
echo    - 尝试重启电脑
echo.
echo ========================================
pause 