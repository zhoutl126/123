@echo off
chcp 65001 >nul
echo.
echo ========================================
echo 测试美食推荐页面功能
echo ========================================
echo.

echo 检查美食推荐页面文件...
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
echo 检查app.json配置...
findstr "food-recommendations" app.json >nul
if %errorlevel% equ 0 (
    echo ✓ app.json 中已添加页面路径
) else (
    echo ✗ app.json 中未添加页面路径
)

echo.
echo 检查首页跳转功能...
findstr "goToFoodRecommendations" pages\index\index.js >nul
if %errorlevel% equ 0 (
    echo ✓ 首页已添加跳转方法
) else (
    echo ✗ 首页未添加跳转方法
)

echo.
echo ========================================
echo 测试完成！
echo ========================================
echo.
echo 使用说明：
echo 1. 打开微信开发者工具
echo 2. 导入项目：%cd%
echo 3. 点击首页的"比格每日优选"按钮
echo 4. 进入美食推荐聊天界面
echo 5. 可以输入消息与比格小助手对话
echo.
echo 支持的关键词：
echo - 麻婆豆腐、红烧肉、鲈鱼
echo - 推荐、下单
echo.
pause 