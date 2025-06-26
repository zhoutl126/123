@echo off
echo ========================================
echo 全面错误修复脚本
echo ========================================
echo.

echo 正在进入Next.js项目目录...
cd wechat-miniprogram

echo.
echo 1. 清理所有缓存...
if exist .next rmdir /s /q .next
if exist node_modules\.cache rmdir /s /q node_modules\.cache
if exist .pnpm-store rmdir /s /q .pnpm-store

echo.
echo 2. 删除锁文件...
if exist pnpm-lock.yaml del pnpm-lock.yaml
if exist package-lock.json del package-lock.json
if exist yarn.lock del yarn.lock

echo.
echo 3. 清理node_modules...
if exist node_modules rmdir /s /q node_modules

echo.
echo 4. 重新安装依赖...
pnpm install --force

echo.
echo 5. 检查TypeScript配置...
if not exist tsconfig.json (
    echo 创建tsconfig.json...
    echo { > tsconfig.json
    echo   "compilerOptions": { >> tsconfig.json
    echo     "lib": ["dom", "dom.iterable", "es6"], >> tsconfig.json
    echo     "allowJs": true, >> tsconfig.json
    echo     "skipLibCheck": true, >> tsconfig.json
    echo     "strict": true, >> tsconfig.json
    echo     "noEmit": true, >> tsconfig.json
    echo     "esModuleInterop": true, >> tsconfig.json
    echo     "module": "esnext", >> tsconfig.json
    echo     "moduleResolution": "bundler", >> tsconfig.json
    echo     "resolveJsonModule": true, >> tsconfig.json
    echo     "isolatedModules": true, >> tsconfig.json
    echo     "jsx": "preserve", >> tsconfig.json
    echo     "incremental": true, >> tsconfig.json
    echo     "plugins": [ >> tsconfig.json
    echo       { >> tsconfig.json
    echo         "name": "next" >> tsconfig.json
    echo       } >> tsconfig.json
    echo     ], >> tsconfig.json
    echo     "baseUrl": ".", >> tsconfig.json
    echo     "paths": { >> tsconfig.json
    echo       "@/*": ["./*"] >> tsconfig.json
    echo     } >> tsconfig.json
    echo   }, >> tsconfig.json
    echo   "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"], >> tsconfig.json
    echo   "exclude": ["node_modules"] >> tsconfig.json
    echo } >> tsconfig.json
)

echo.
echo 6. 检查Next.js配置...
if not exist next.config.mjs (
    echo 创建next.config.mjs...
    echo /** @type {import('next').NextConfig} */ > next.config.mjs
    echo const nextConfig = { >> next.config.mjs
    echo   experimental: { >> next.config.mjs
    echo     appDir: true, >> next.config.mjs
    echo   }, >> next.config.mjs
    echo   images: { >> next.config.mjs
    echo     domains: ['localhost'], >> next.config.mjs
    echo     unoptimized: true, >> next.config.mjs
    echo   }, >> next.config.mjs
    echo   assetPrefix: process.env.NODE_ENV === 'production' ? '' : '', >> next.config.mjs
    echo } >> next.config.mjs
    echo. >> next.config.mjs
    echo export default nextConfig >> next.config.mjs
)

echo.
echo 7. 检查Tailwind配置...
if not exist tailwind.config.ts (
    echo 创建tailwind.config.ts...
    echo import type { Config } from "tailwindcss" > tailwind.config.ts
    echo. >> tailwind.config.ts
    echo const config = { >> tailwind.config.ts
    echo   darkMode: ["class"], >> tailwind.config.ts
    echo   content: [ >> tailwind.config.ts
    echo     './pages/**/*.{ts,tsx}', >> tailwind.config.ts
    echo     './components/**/*.{ts,tsx}', >> tailwind.config.ts
    echo     './app/**/*.{ts,tsx}', >> tailwind.config.ts
    echo     './src/**/*.{ts,tsx}', >> tailwind.config.ts
    echo     './*.{ts,tsx}', >> tailwind.config.ts
    echo   ], >> tailwind.config.ts
    echo   prefix: "", >> tailwind.config.ts
    echo   theme: { >> tailwind.config.ts
    echo     container: { >> tailwind.config.ts
    echo       center: true, >> tailwind.config.ts
    echo       padding: "2rem", >> tailwind.config.ts
    echo       screens: { >> tailwind.config.ts
    echo         "2xl": "1400px", >> tailwind.config.ts
    echo       }, >> tailwind.config.ts
    echo     }, >> tailwind.config.ts
    echo     extend: { >> tailwind.config.ts
    echo       colors: { >> tailwind.config.ts
    echo         border: "hsl(var(--border))", >> tailwind.config.ts
    echo         input: "hsl(var(--input))", >> tailwind.config.ts
    echo         ring: "hsl(var(--ring))", >> tailwind.config.ts
    echo         background: "hsl(var(--background))", >> tailwind.config.ts
    echo         foreground: "hsl(var(--foreground))", >> tailwind.config.ts
    echo         primary: { >> tailwind.config.ts
    echo           DEFAULT: "hsl(var(--primary))", >> tailwind.config.ts
    echo           foreground: "hsl(var(--primary-foreground))", >> tailwind.config.ts
    echo         }, >> tailwind.config.ts
    echo         secondary: { >> tailwind.config.ts
    echo           DEFAULT: "hsl(var(--secondary))", >> tailwind.config.ts
    echo           foreground: "hsl(var(--secondary-foreground))", >> tailwind.config.ts
    echo         }, >> tailwind.config.ts
    echo         destructive: { >> tailwind.config.ts
    echo           DEFAULT: "hsl(var(--destructive))", >> tailwind.config.ts
    echo           foreground: "hsl(var(--destructive-foreground))", >> tailwind.config.ts
    echo         }, >> tailwind.config.ts
    echo         muted: { >> tailwind.config.ts
    echo           DEFAULT: "hsl(var(--muted))", >> tailwind.config.ts
    echo           foreground: "hsl(var(--muted-foreground))", >> tailwind.config.ts
    echo         }, >> tailwind.config.ts
    echo         accent: { >> tailwind.config.ts
    echo           DEFAULT: "hsl(var(--accent))", >> tailwind.config.ts
    echo           foreground: "hsl(var(--accent-foreground))", >> tailwind.config.ts
    echo         }, >> tailwind.config.ts
    echo         popover: { >> tailwind.config.ts
    echo           DEFAULT: "hsl(var(--popover))", >> tailwind.config.ts
    echo           foreground: "hsl(var(--popover-foreground))", >> tailwind.config.ts
    echo         }, >> tailwind.config.ts
    echo         card: { >> tailwind.config.ts
    echo           DEFAULT: "hsl(var(--card))", >> tailwind.config.ts
    echo           foreground: "hsl(var(--card-foreground))", >> tailwind.config.ts
    echo         }, >> tailwind.config.ts
    echo       }, >> tailwind.config.ts
    echo       borderRadius: { >> tailwind.config.ts
    echo         lg: "var(--radius)", >> tailwind.config.ts
    echo         md: "calc(var(--radius) - 2px)", >> tailwind.config.ts
    echo         sm: "calc(var(--radius) - 4px)", >> tailwind.config.ts
    echo       }, >> tailwind.config.ts
    echo       keyframes: { >> tailwind.config.ts
    echo         "accordion-down": { >> tailwind.config.ts
    echo           from: { height: "0" }, >> tailwind.config.ts
    echo           to: { height: "var(--radix-accordion-content-height)" }, >> tailwind.config.ts
    echo         }, >> tailwind.config.ts
    echo         "accordion-up": { >> tailwind.config.ts
    echo           from: { height: "var(--radix-accordion-content-height)" }, >> tailwind.config.ts
    echo           to: { height: "0" }, >> tailwind.config.ts
    echo         }, >> tailwind.config.ts
    echo       }, >> tailwind.config.ts
    echo       animation: { >> tailwind.config.ts
    echo         "accordion-down": "accordion-down 0.2s ease-out", >> tailwind.config.ts
    echo         "accordion-up": "accordion-up 0.2s ease-out", >> tailwind.config.ts
    echo       }, >> tailwind.config.ts
    echo     }, >> tailwind.config.ts
    echo   }, >> tailwind.config.ts
    echo   plugins: [require("tailwindcss-animate")], >> tailwind.config.ts
    echo } satisfies Config >> tailwind.config.ts
    echo. >> tailwind.config.ts
    echo export default config >> tailwind.config.ts
)

echo.
echo 8. 检查PostCSS配置...
if not exist postcss.config.mjs (
    echo 创建postcss.config.mjs...
    echo export default { > postcss.config.mjs
    echo   plugins: { >> postcss.config.mjs
    echo     tailwindcss: {}, >> postcss.config.mjs
    echo     autoprefixer: {}, >> postcss.config.mjs
    echo   }, >> postcss.config.mjs
    echo } >> postcss.config.mjs
)

echo.
echo 9. 运行TypeScript类型检查...
pnpm type-check

echo.
echo 10. 尝试启动开发服务器...
echo 如果成功，项目将在 http://localhost:3000 启动
echo 按 Ctrl+C 停止服务器
echo.

pnpm dev

pause 