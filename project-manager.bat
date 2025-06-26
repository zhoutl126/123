@echo off
chcp 65001 >nul
echo ========================================
echo Project Manager - 项目管理器
echo ========================================
echo.

:menu
echo 请选择要操作的项目:
echo.
echo [1] 微信小程序项目 (根目录)
echo [2] Next.js项目 (wechat-miniprogram目录)
echo [3] 检查项目状态
echo [4] 修复常见问题
echo [5] 查看项目说明
echo [0] 退出
echo.
set /p choice=请输入选项 (0-5): 

if "%choice%"=="1" goto miniprogram
if "%choice%"=="2" goto nextjs
if "%choice%"=="3" goto check
if "%choice%"=="4" goto fix
if "%choice%"=="5" goto help
if "%choice%"=="0" goto exit
goto menu

:miniprogram
echo.
echo ========================================
echo 微信小程序项目
echo ========================================
echo.
echo 项目位置: 根目录
echo 项目类型: 原生微信小程序
echo 启动方式: 微信开发者工具
echo.
echo 操作步骤:
echo 1. 打开微信开发者工具
echo 2. 点击"导入项目"
echo 3. 选择当前目录: %CD%
echo 4. 输入AppID: wx8221ba2e2f77ea55
echo 5. 点击"导入"
echo 6. 点击"预览"测试
echo.
echo 功能特性:
echo - 美食外卖主页
echo - 比格每日优选 (开发中)
echo - 骑手排行榜 (开发中)
echo.
pause
goto menu

:nextjs
echo.
echo ========================================
echo Next.js项目
echo ========================================
echo.
echo 项目位置: wechat-miniprogram目录
echo 项目类型: React + Next.js
echo 启动方式: pnpm dev
echo.
echo 正在启动Next.js项目...
cd wechat-miniprogram
if exist package.json (
    echo [OK] package.json 存在
    echo 正在安装依赖...
    pnpm install
    echo.
    echo 正在启动开发服务器...
    echo 项目将在 http://localhost:3000 启动
    echo 按 Ctrl+C 停止服务器
    echo.
    pnpm dev
) else (
    echo [ERROR] package.json 不存在
    echo 请检查 wechat-miniprogram 目录
)
cd ..
pause
goto menu

:check
echo.
echo ========================================
echo 项目状态检查
echo ========================================
echo.

echo 检查微信小程序项目:
if exist app.json (
    echo [OK] app.json
) else (
    echo [ERROR] app.json 缺失
)

if exist app.js (
    echo [OK] app.js
) else (
    echo [ERROR] app.js 缺失
)

if exist pages\index\index.js (
    echo [OK] 首页文件
) else (
    echo [ERROR] 首页文件缺失
)

if exist images\beagle-dog.png (
    echo [OK] 图片资源
) else (
    echo [ERROR] 图片资源缺失
)

echo.
echo 检查Next.js项目:
if exist wechat-miniprogram\package.json (
    echo [OK] package.json
) else (
    echo [ERROR] package.json 缺失
)

if exist wechat-miniprogram\node_modules (
    echo [OK] 依赖已安装
) else (
    echo [WARNING] 依赖未安装
)

echo.
echo 检查完成！
pause
goto menu

:fix
echo.
echo ========================================
echo 修复常见问题
echo ========================================
echo.

echo 正在修复微信小程序问题...
call fix-miniprogram.bat

echo.
echo 正在修复Next.js项目问题...
cd wechat-miniprogram
if exist package.json (
    echo 清理缓存...
    if exist .next rmdir /s /q .next
    if exist node_modules rmdir /s /q node_modules
    echo 重新安装依赖...
    pnpm install
    echo [OK] Next.js项目修复完成
) else (
    echo [ERROR] Next.js项目配置缺失
)
cd ..

echo.
echo 修复完成！
pause
goto menu

:help
echo.
echo ========================================
echo 项目说明
echo ========================================
echo.
echo 这是一个包含两个项目的混合项目:
echo.
echo 1. 微信小程序项目 (根目录)
echo    - 原生微信小程序
echo    - 使用微信开发者工具
echo    - 实际部署项目
echo.
echo 2. Next.js项目 (wechat-miniprogram目录)
echo    - React + Next.js + TypeScript
echo    - 使用 pnpm dev 启动
echo    - 界面设计和原型开发
echo.
echo 重要提醒:
echo - 不要混淆两个项目
echo - 微信小程序使用微信开发者工具
echo - Next.js项目使用 pnpm dev
echo.
echo 详细说明请查看: 项目结构说明.md
echo.
pause
goto menu

:exit
echo.
echo 感谢使用项目管理器！
echo.
exit 