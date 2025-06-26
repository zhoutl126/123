@echo off
echo ========================================
echo 微信小程序项目清理脚本
echo ========================================
echo.

echo 正在清理Next.js项目...
cd wechat-miniprogram

echo 删除node_modules...
if exist node_modules rmdir /s /q node_modules

echo 删除.next目录...
if exist .next rmdir /s /q .next

echo 删除pnpm-lock.yaml...
if exist pnpm-lock.yaml del pnpm-lock.yaml

echo 重新安装依赖...
pnpm install

echo.
echo 清理完成！
echo 现在可以运行 start-project.bat 启动项目
echo.

pause 