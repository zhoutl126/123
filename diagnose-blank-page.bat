@echo off
chcp 65001 >nul
echo.
echo ========================================
echo           页面空白问题诊断
echo ========================================
echo.
echo 🔍 正在诊断页面空白问题...
echo.

echo 📋 检查文件内容...
echo.

echo 检查 app.json 内容：
type app.json
echo.

echo 检查 test-page.js 内容：
type pages\test-page\test-page.js
echo.

echo 检查 test-page.wxml 内容：
type pages\test-page\test-page.wxml
echo.

echo 检查 test-page.wxss 内容：
type pages\test-page\test-page.wxss
echo.

echo.
echo 🛠️  解决方案：
echo.
echo 1️⃣ 确保微信开发者工具已关闭
echo 2️⃣ 删除项目文件夹中的所有临时文件
echo 3️⃣ 重新打开微信开发者工具
echo 4️⃣ 重新导入项目
echo 5️⃣ 清除缓存并编译
echo.
echo 📁 手动清理步骤：
echo.
echo 删除以下文件夹（如果存在）：
echo - node_modules
echo - .next
echo - dist
echo - miniprogram_npm
echo.
echo 删除以下文件（如果存在）：
echo - *.wxss
echo - *.log
echo.
echo 🔧 如果问题持续：
echo.
echo 1. 检查微信开发者工具版本是否最新
echo 2. 尝试重启电脑
echo 3. 检查项目路径是否包含特殊字符
echo 4. 确认微信开发者工具设置正确
echo.
echo ========================================
pause 