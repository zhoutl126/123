@echo off
echo ========================================
echo 微信小程序项目问题修复脚本
echo ========================================
echo.

echo 正在修复常见问题...

echo 1. 清理缓存...
cd wechat-miniprogram
if exist .next rmdir /s /q .next
if exist node_modules\.cache rmdir /s /q node_modules\.cache

echo 2. 重新安装依赖...
pnpm install --force

echo 3. 检查TypeScript配置...
if not exist tsconfig.json (
    echo 创建tsconfig.json...
    copy ..\wechat-miniprogram\tsconfig.json tsconfig.json
)

echo 4. 检查Next.js配置...
if not exist next.config.mjs (
    echo 创建next.config.mjs...
    copy ..\wechat-miniprogram\next.config.mjs next.config.mjs
)

echo 5. 检查Tailwind配置...
if not exist tailwind.config.ts (
    echo 创建tailwind.config.ts...
    copy ..\wechat-miniprogram\tailwind.config.ts tailwind.config.ts
)

echo 6. 检查PostCSS配置...
if not exist postcss.config.mjs (
    echo 创建postcss.config.mjs...
    copy ..\wechat-miniprogram\postcss.config.mjs postcss.config.mjs
)

echo.
echo 修复完成！
echo 现在可以尝试运行项目了
echo.

pause 