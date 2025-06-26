@echo off
echo ========================================
echo 正确启动微信小程序项目
echo ========================================
echo.

echo 检查当前目录...
if not exist wechat-miniprogram (
    echo 错误: 找不到wechat-miniprogram目录
    echo 请确保在项目根目录运行此脚本
    pause
    exit /b 1
)

echo 进入Next.js项目目录...
cd wechat-miniprogram

echo 检查package.json...
if not exist package.json (
    echo 错误: 找不到package.json文件
    echo 请确保项目依赖已正确安装
    pause
    exit /b 1
)

echo 检查node_modules...
if not exist node_modules (
    echo 正在安装依赖...
    pnpm install
)

echo.
echo 启动开发服务器...
echo 项目将在 http://localhost:3000 启动
echo 按 Ctrl+C 停止服务器
echo.

pnpm dev

pause 