@echo off
chcp 65001 >nul
echo.
echo ========================================
echo           聊天页面测试指南
echo ========================================
echo.
echo 🎯 测试目标：验证聊天功能是否正常
echo.
echo 📋 测试步骤：
echo.
echo 1️⃣ 启动微信开发者工具
echo    - 打开微信开发者工具
echo    - 导入项目：C:\Users\ASUS\WeChatProjects\miniprogram-2
echo    - 确保选择"微信小程序"项目类型
echo.
echo 2️⃣ 清除缓存并重新编译
echo    - 点击工具栏的"清缓存"按钮
echo    - 点击"编译"按钮重新编译项目
echo    - 等待编译完成
echo.
echo 3️⃣ 测试首页跳转
echo    - 在模拟器中点击"比格每日优选"按钮
echo    - 确认能正常跳转到聊天页面
echo    - 检查页面是否显示完整
echo.
echo 4️⃣ 测试聊天功能
echo    - 检查是否显示欢迎消息
echo    - 在输入框输入"你好"
echo    - 点击发送按钮
echo    - 检查是否收到机器人回复
echo.
echo 5️⃣ 测试关键词回复
echo    - 输入"推荐" - 应该显示美食推荐
echo    - 输入"披萨" - 应该显示披萨信息
echo    - 输入"价格" - 应该显示价格信息
echo    - 输入"地址" - 应该显示地址信息
echo.
echo 6️⃣ 测试界面功能
echo    - 点击左上角返回按钮
echo    - 确认能正常返回首页
echo    - 检查输入框占位符显示
echo    - 检查发送按钮状态变化
echo.
echo ⚠️  如果遇到问题：
echo.
echo 🔧 问题1：页面空白
echo    解决：清除缓存，重新编译
echo.
echo 🔧 问题2：无法跳转
echo    解决：检查app.json中的页面配置
echo.
echo 🔧 问题3：样式异常
echo    解决：检查wxss文件语法
echo.
echo 🔧 问题4：功能不响应
echo    解决：检查控制台错误信息
echo.
echo 📊 预期结果：
echo    ✅ 页面正常显示
echo    ✅ 跳转功能正常
echo    ✅ 聊天功能正常
echo    ✅ 关键词回复正常
echo    ✅ 界面交互正常
echo.
echo 🎉 如果所有测试通过，聊天功能已恢复！
echo.
echo ========================================
pause 