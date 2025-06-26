# 微信小程序项目

这是一个包含两个部分的微信小程序项目：

## 项目结构

### 1. 传统微信小程序（根目录）
- 使用原生微信小程序开发
- 包含基本的用户信息获取功能
- 文件结构：
  - `app.js` - 小程序入口文件
  - `app.json` - 小程序配置文件
  - `app.wxss` - 全局样式文件
  - `pages/` - 页面文件夹
    - `index/` - 首页
    - `logs/` - 日志页面

### 2. Next.js 界面设计项目（wechat-miniprogram 目录）
- 使用 React + Next.js + TypeScript 开发
- 包含现代化的UI组件库（shadcn/ui）
- 实现了美食推荐和骑手排行榜功能
- 文件结构：
  - `app/` - Next.js App Router
  - `components/` - UI组件
  - `public/images/` - 静态资源
  - `styles/` - 样式文件

## 功能特性

### 美食外卖小程序
- 🍽️ **比格每日优选** - 精选美食推荐
- 🏆 **骑手排行榜** - 优秀骑手展示
- 🎨 **现代化UI设计** - 使用Tailwind CSS
- 📱 **响应式设计** - 适配移动端

## 开发环境要求

- Node.js 18+
- pnpm (推荐) 或 npm
- 微信开发者工具

## 安装和运行

### 1. 安装依赖
```bash
cd wechat-miniprogram
pnpm install
```

### 2. 运行Next.js开发服务器
```bash
pnpm dev
```

### 3. 运行微信小程序
- 使用微信开发者工具打开根目录
- 配置AppID: `wx8221ba2e2f77ea55`

## 技术栈

### Next.js 项目
- **框架**: Next.js 15.2.4
- **语言**: TypeScript
- **样式**: Tailwind CSS
- **UI组件**: shadcn/ui
- **图标**: Lucide React
- **状态管理**: React Hooks

### 微信小程序
- **框架**: 原生微信小程序
- **语言**: JavaScript
- **样式**: WXSS

## 项目特点

1. **双项目结构**: 既包含传统小程序，也包含现代化的Next.js项目
2. **组件化开发**: 使用shadcn/ui组件库，提高开发效率
3. **类型安全**: 使用TypeScript确保代码质量
4. **现代化设计**: 采用渐变色彩和卡片式布局
5. **响应式**: 适配不同屏幕尺寸

## 注意事项

1. 确保图片资源路径正确
2. 微信小程序的AppID需要根据实际情况配置
3. Next.js项目主要用于界面设计和原型展示
4. 两个项目可以独立开发和部署

## 开发建议

1. 优先在Next.js项目中开发和测试UI
2. 确认设计后，将样式和逻辑迁移到微信小程序
3. 保持两个项目的功能同步
4. 定期更新依赖包版本 