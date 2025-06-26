@echo off
echo ========================================
echo 错误诊断脚本
echo ========================================
echo.

echo 1. 检查Node.js版本...
node --version
if errorlevel 1 (
    echo ❌ Node.js未安装或版本过低
    echo 请安装Node.js 18或更高版本
    pause
    exit /b 1
) else (
    echo ✅ Node.js版本正常
)

echo.
echo 2. 检查pnpm版本...
pnpm --version
if errorlevel 1 (
    echo ❌ pnpm未安装
    echo 正在安装pnpm...
    npm install -g pnpm
) else (
    echo ✅ pnpm已安装
)

echo.
echo 3. 检查项目结构...
if exist wechat-miniprogram (
    echo ✅ wechat-miniprogram目录存在
) else (
    echo ❌ wechat-miniprogram目录不存在
    pause
    exit /b 1
)

if exist wechat-miniprogram\package.json (
    echo ✅ package.json存在
) else (
    echo ❌ package.json不存在
    pause
    exit /b 1
)

echo.
echo 4. 检查依赖安装状态...
cd wechat-miniprogram
if exist node_modules (
    echo ✅ node_modules存在
) else (
    echo ❌ node_modules不存在，正在安装...
    pnpm install
)

echo.
echo 5. 检查TypeScript配置...
if exist tsconfig.json (
    echo ✅ tsconfig.json存在
) else (
    echo ❌ tsconfig.json不存在
)

echo.
echo 6. 检查Next.js配置...
if exist next.config.mjs (
    echo ✅ next.config.mjs存在
) else (
    echo ❌ next.config.mjs不存在
)

echo.
echo 7. 检查Tailwind配置...
if exist tailwind.config.ts (
    echo ✅ tailwind.config.ts存在
) else (
    echo ❌ tailwind.config.ts不存在
)

echo.
echo 8. 运行TypeScript类型检查...
pnpm type-check
if errorlevel 1 (
    echo ❌ TypeScript类型检查失败
    echo 请查看上面的错误信息
) else (
    echo ✅ TypeScript类型检查通过
)

echo.
echo 9. 检查端口占用...
netstat -ano | findstr :3000
if errorlevel 1 (
    echo ✅ 端口3000未被占用
) else (
    echo ⚠️ 端口3000被占用，可能需要终止其他进程
)

echo.
echo ========================================
echo 诊断完成！
echo ========================================
echo.

echo 如果所有检查都通过，请运行 start-correctly.bat 启动项目
echo 如果有错误，请根据上面的提示进行修复

pause 