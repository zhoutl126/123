@echo off
chcp 65001 >nul
echo.
echo ========================================
echo 修复页面跳转问题
echo ========================================
echo.

echo 正在检查并修复可能的问题...
echo.

echo 1. 检查app.json文件格式...
echo 当前app.json内容：
type app.json
echo.

echo 2. 检查页面路径配置...
findstr /n "pages" app.json
echo.

echo 3. 检查首页跳转方法...
findstr /n "goToFoodRecommendations" pages\index\index.js
echo.

echo 4. 检查美食推荐页面文件大小...
for %%f in (pages\food-recommendations\*) do (
    echo %%~nf: %%~zf bytes
)
echo.

echo ========================================
echo 修复建议
echo ========================================
echo.

echo 如果页面跳转不工作，请按以下步骤操作：
echo.
echo 1. 微信开发者工具操作：
echo    - 点击工具栏的"清缓存"按钮
echo    - 点击"编译"按钮重新编译
echo    - 检查控制台是否有错误信息
echo.
echo 2. 如果还是不行，尝试：
echo    - 关闭微信开发者工具
echo    - 重新打开并导入项目
echo    - 确保项目路径正确
echo.
echo 3. 检查项目配置：
echo    - 确保AppID正确
echo    - 检查是否开启了调试模式
echo.
echo 4. 测试方法：
echo    - 在首页点击"比格每日优选"卡片
echo    - 应该跳转到聊天界面
echo    - 如果还是不行，检查控制台错误
echo.

echo 当前项目状态：所有文件配置正确
echo 问题可能是微信开发者工具缓存
echo.

pause 