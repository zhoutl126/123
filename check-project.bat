@echo off
echo ========================================
echo 微信小程序项目状态检查
echo ========================================
echo.

echo 检查Node.js版本...
node --version
if errorlevel 1 (
    echo ❌ Node.js未安装
) else (
    echo ✅ Node.js已安装
)

echo.
echo 检查pnpm版本...
pnpm --version >nul 2>&1
if errorlevel 1 (
    echo ❌ pnpm未安装
) else (
    echo ✅ pnpm已安装
)

echo.
echo 检查项目文件...
if exist wechat-miniprogram\package.json (
    echo ✅ Next.js项目配置存在
) else (
    echo ❌ Next.js项目配置缺失
)

if exist wechat-miniprogram\public\images\beagle-dog.png (
    echo ✅ 图片资源存在
) else (
    echo ❌ 图片资源缺失
)

if exist app.json (
    echo ✅ 微信小程序配置存在
) else (
    echo ❌ 微信小程序配置缺失
)

echo.
echo 检查依赖安装状态...
cd wechat-miniprogram
if exist node_modules (
    echo ✅ 依赖已安装
) else (
    echo ❌ 依赖未安装，请运行: pnpm install
)

echo.
echo ========================================
echo 检查完成！
echo ========================================
echo.

pause 