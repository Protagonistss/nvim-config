# Neovim 配置

基于 [LazyVim](https://github.com/LazyVim/LazyVim) 的 Neovim 配置，采用模块化设计，开箱即用，易于维护和扩展。

## 📦 前置依赖

本配置以 LazyVim 为基础，需要以下环境：

| 依赖 | 要求 | 说明 |
|------|------|------|
| **Neovim** | ≥ 0.11.2（需 LuaJIT） | LazyVim v15 起的硬性要求 |
| **Git** | ≥ 2.19.0 | lazy.nvim 的 partial clone 需要 |
| **Nerd Font** | 推荐 JetBrainsMono Nerd Font | which-key、图标、状态栏均依赖 |
| **C 编译器** | gcc / clang | treesitter 编译 parser 需要 |
| **ripgrep (rg)** | 任意版本 | Telescope `live-grep` 等搜索依赖 |
| **fd** | 任意版本 | Telescope 文件查找（若安装则自动启用） |
| **Node.js + npm** | Node ≥ 18 | pyright 等多个 LSP 经 Mason 安装需要 |

可选（按需安装）：

- **[neovide](https://github.com/neovide/neovide)**：本配置专门为它设置了字体与光标特效（见 `lua/core/options.lua` 中的 `neovide` 分支）
- **[lazygit](https://github.com/jesseduffield/lazygit)**：LazyVim 默认通过 `<leader>gg` 集成
- **Python 工具链**：`pyright` / `ruff`（可由 Mason 自动安装）

## 📁 目录结构

```
nvim/
├── init.lua                 # 入口：加载 lazy 与 core 各模块
├── lazy-lock.json           # 插件版本锁定
├── lazyvim.json             # LazyVim extras 与版本记录
└── lua/
    ├── config/
    │   └── lazy.lua         # lazy.nvim 引导与 LazyVim 注册
    ├── core/
    │   ├── options.lua      # 基础选项 + neovide 配置
    │   ├── keymaps.lua      # 自定义键位
    │   └── autocmds.lua     # 自定义自动命令
    └── plugins/
        └── spec.lua         # 插件配置（主题、状态栏、which-key 等）
```

## 🚀 快速开始

1. **安装前置依赖**

   以 Ubuntu/Debian 为例：

   ```bash
   # 必装
   sudo apt install git build-essential ripgrep fd-find nodejs npm

   # Neovim（系统源通常过旧，建议用 AppImage 或官方 PPA）
   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
   chmod u+x nvim.appimage && sudo mv nvim.appimage /usr/local/bin/nvim
   ```

   字体安装见下文 [🎨 字体](#-字体)。

2. **克隆仓库**

   ```bash
   git clone https://github.com/Protagonistss/nvim-config.git ~/.config/nvim
   ```

3. **启动 Neovim**

   ```bash
   nvim
   ```

   首次启动会自动引导安装 `lazy.nvim` 并拉取所有插件。等待安装完成后重启即可。

## ⚙️ 配置说明

### `lua/core/options.lua`

基础编辑选项，覆盖 LazyVim 默认值。主要内容：

| 配置项 | 说明 |
|--------|------|
| `relativenumber` / `number` | 相对行号 + 绝对行号 |
| `tabstop` / `shiftwidth` / `expandtab` | 2 空格缩进，Tab 转空格 |
| `wrap` | 禁用自动换行 |
| `cursorline` | 高亮当前行 |
| `clipboard` | 与系统剪贴板集成 |
| `splitright` / `splitbelow` | 新窗口默认开在右、下 |
| `ignorecase` / `smartcase` | 智能大小写搜索 |
| `termguicolors` | 真彩色支持 |
| `root_spec` | 根目录检测策略（当前仅 `cwd`） |

其中 `neovide` 分支为 neovide GUI 单独配置字体、光标特效与缩放。

### `lua/core/keymaps.lua`

自定义键位，leader 键为 `空格`：

| 键位 | 模式 | 说明 |
|------|------|------|
| `jk` | 插入 | 退回正常模式 |
| `J` / `K` | 可视 | 上下移动选中行 |
| `<leader>sv` | 正常 | 垂直分屏 |
| `<leader>sh` | 正常 | 水平分屏 |
| `<leader>nh` | 正常 | 清除搜索高亮 |

其余快捷键继承 LazyVim 默认（可用 `空格` 唤出 which-key 查看全部）。

### `lua/plugins/spec.lua`

自定义插件配置（在 LazyVim 之上）：

- **tokyonight.nvim** — 主题，使用 `storm` 风格
- **lualine.nvim** — 状态栏
- **which-key.nvim** — 快捷键提示

## 🎨 字体

需要安装 [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)：

- 官方下载：<https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip>

安装后将终端字体设为 `JetBrainsMono Nerd Font Mono`。neovide 会自动读取 `options.lua` 中配置的 `JetBrainsMono Nerd Font Mono:h18`。

## 🔧 扩展配置

- **加新插件 / 覆盖 LazyVim 配置**：在 `lua/plugins/` 下新增文件（如 `lua/plugins/my.lua`），通过 `{ import = "plugins" }` 自动加载。
- **启用语言扩展（extras）**：运行 `:LazyExtras` 或编辑 `lazyvim.json` 的 `extras` 数组来启用所需语言。例如 `lazyvim.plugins.extras.lang.python` 提供 pyright 类型检查 + ruff lint/format。⚠️ 注意：启用该 extra 时 Mason 会自动装 ruff，需要系统已安装 `python3-venv` 与 `python3-pip`（Ubuntu/Debian 默认不带），否则安装会以 `spawn: python3 failed` 失败。
- **加自定义选项 / 键位**：编辑 `lua/core/options.lua` 与 `lua/core/keymaps.lua`。

## 📚 学习资源

- [LazyVim 文档](https://lazyvim.org/)
- [lazy.nvim 文档](https://lazyvim.org/installation)
- [Neovim 官方文档](https://neovim.io/doc/)
- [Lua 配置指南](https://neovim.io/doc/user/lua-guide.html)

## 📄 许可证

MIT License
