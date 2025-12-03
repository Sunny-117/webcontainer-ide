# 部署到 Vercel

## 方法 1：通过 Vercel Dashboard（推荐，最简单）

1. **访问 Vercel**
   - 打开 https://vercel.com/
   - 使用 GitHub 账号登录

2. **导入项目**
   - 点击 "Add New..." → "Project"
   - 选择你的 GitHub 仓库
   - 点击 "Import"

3. **配置项目**（通常自动检测，无需修改）
   - Framework Preset: `Vite`
   - Build Command: `pnpm build`
   - Output Directory: `dist`
   - Install Command: `pnpm install`

4. **部署**
   - 点击 "Deploy"
   - 等待 2-3 分钟
   - 完成！

5. **访问**
   - Vercel 会给你一个 URL，如：`https://your-project.vercel.app`
   - 每次 push 到 GitHub 都会自动重新部署

---

## 方法 2：通过 Vercel CLI

### 安装 Vercel CLI

```bash
npm i -g vercel
```

### 登录

```bash
vercel login
```

### 部署

```bash
# 首次部署
vercel

# 生产环境部署
vercel --prod
```

按照提示操作即可。

---

## 方法 3：一键部署按钮

点击下面的按钮一键部署：

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/yourusername/webcontainer-ide)

---

## 验证部署

部署成功后，访问你的 URL，打开浏览器开发者工具：

1. **检查 HTTP 头**
   - Network 标签 → 选择 HTML 文档
   - Response Headers 应该包含：
     ```
     Cross-Origin-Embedder-Policy: require-corp
     Cross-Origin-Opener-Policy: same-origin
     ```

2. **检查 Cross-Origin Isolation**
   - Console 中运行：
     ```javascript
     console.log(crossOriginIsolated)
     ```
   - 应该返回 `true`

3. **测试 WebContainer**
   - 终端应该正常显示
   - 可以执行命令
   - 可以安装依赖

---

## 常见问题

### Q: 部署后终端报错 "SharedArrayBuffer transfer requires self.crossOriginIsolated"

**A:** HTTP 头没有正确设置。检查：
- `vercel.json` 文件是否在项目根目录
- 重新部署：`vercel --prod --force`

### Q: 构建失败 "pnpm: command not found"

**A:** Vercel 默认使用 npm。解决方法：
1. 在 Vercel Dashboard → Project Settings → General
2. 找到 "Build & Development Settings"
3. Install Command 改为：`npm install -g pnpm && pnpm install`

或者在项目根目录创建 `.npmrc`：
```
enable-pre-post-scripts=true
```

### Q: 如何自定义域名？

**A:** 
1. Vercel Dashboard → 你的项目 → Settings → Domains
2. 添加你的域名
3. 按照提示配置 DNS

---

## 环境变量（如果需要）

如果项目需要环境变量：

1. Vercel Dashboard → 你的项目 → Settings → Environment Variables
2. 添加变量，例如：
   - `VITE_API_URL`
   - `VITE_APP_NAME`

---

## 自动部署

Vercel 会自动监听 GitHub 仓库：

- **Push to main** → 自动部署到生产环境
- **Pull Request** → 自动创建预览环境
- **每个 commit** → 独立的预览 URL

---

## 性能优化建议

部署后可以进一步优化：

1. **启用 Edge Network**（默认已启用）
2. **配置缓存**（Vercel 自动处理）
3. **启用 Analytics**（可选）
   - Vercel Dashboard → Analytics → Enable

---

## 回滚部署

如果新版本有问题：

1. Vercel Dashboard → Deployments
2. 找到之前的成功部署
3. 点击 "..." → "Promote to Production"

---

## 监控和日志

- **实时日志**: Vercel Dashboard → 你的项目 → Deployments → 点击部署 → Logs
- **Analytics**: Dashboard → Analytics
- **错误追踪**: 集成 Sentry（可选）

---

需要帮助？查看 [Vercel 文档](https://vercel.com/docs)
