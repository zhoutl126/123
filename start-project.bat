@echo off
echo ========================================
echo 微信小程序项目启动脚本
echo ========================================
echo.

echo 正在检查Node.js环境...
node --version >nul 2>&1
if errorlevel 1 (
    echo 错误: 未找到Node.js，请先安装Node.js
    pause
    exit /b 1
)

echo 正在检查pnpm...
pnpm --version >nul 2>&1
if errorlevel 1 (
    echo 正在安装pnpm...
    npm install -g pnpm
)

echo.
echo 正在进入Next.js项目目录...
cd wechat-miniprogram

echo 正在安装依赖...
pnpm install

echo.
echo 正在启动开发服务器...
echo 项目将在 http://localhost:3000 启动
echo.
echo 按 Ctrl+C 停止服务器
echo.

pnpm dev

pause 