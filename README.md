<div align="center">
  <h1>✨ Protagonistss Neovim Config ✨</h1>
  <p>
    基于 <a href="https://github.com/LazyVim/LazyVim">LazyVim</a> 打造的现代化、开箱即用的模块化 Neovim 配置。
  </p>
  <p>
    <a href="https://github.com/neovim/neovim/releases/latest"><img alt="Neovim" src="https://img.shields.io/badge/Neovim-v0.11.2+-blue.svg?logo=neovim&logoColor=white"></a>
    <a href="https://github.com/LazyVim/LazyVim"><img alt="LazyVim" src="https://img.shields.io/badge/LazyVim-Powered-blueviolet.svg?logo=neovim"></a>
    <a href="https://github.com/Protagonistss/nvim-config/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/badge/License-MIT-green.svg"></a>
  </p>
</div>

---

## 🌟 核心特性 (Features)

- ⚡️ **开箱即用**：基于强大的 LazyVim，提供合理的默认设置。
- 🧩 **模块化设计**：核心配置与插件分离，易于扩展和维护。
- 🎨 **极佳视觉体验**：搭配 Tokyonight 主题和 Lualine，支持透明与真色彩。
- 🖥 **Neovide 支持**：内置对 Neovide GUI 的专属优化（平滑滚动、光标动画、字体缩放）。
- 🛠 **LSP & 格式化**：通过 Mason 轻松管理语言服务，快速开启对各类语言的支持。

## 📦 前置依赖 (Prerequisites)

| 依赖软件 | 版本要求 | 说明 |
| :--- | :--- | :--- |
| **[Neovim](https://neovim.io/)** | `>= 0.11.2` | 核心依赖（必须包含 LuaJIT） |
| **[Git](https://git-scm.com/)** | `>= 2.19.0` | `lazy.nvim` 插件克隆所需 |
| **[Nerd Font](https://www.nerdfonts.com/)** | 推荐 `JetBrainsMono` | 终端图标及 which-key、状态栏依赖 |
| **编译工具链** | `gcc` / `clang` | Treesitter 解析器编译所需 |
| **[ripgrep](https://github.com/BurntSushi/ripgrep)** | 任意 | Telescope 全局搜索及模糊查找 |
| **[Node.js](https://nodejs.org/)** | `>= 18` | 许多 LSP 和格式化工具（如 Pyright）依赖 |

<details>
<summary><b>可选依赖扩展 (按需安装)</b></summary>

- **[Neovide](https://neovide.dev/)**：Rust 编写的高性能 Neovim 客户端，附带炫酷光标特效。
- **[lazygit](https://github.com/jesseduffield/lazygit)**：终端 Git UI，LazyVim 默认通过 `<leader>gg` 集成。
- **Python 工具链**：用于 Python 扩展（建议安装 `python3-venv` 和 `python3-pip`）。
</details>

## 🚀 快速开始 (Quick Start)

### 1. 准备环境 (以 Ubuntu/Debian 为例)

```bash
# 安装基础依赖
sudo apt update && sudo apt install git build-essential ripgrep fd-find nodejs npm

# 安装最新版 Neovim (使用 AppImage)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage && sudo mv nvim.appimage /usr/local/bin/nvim
```

### 2. 克隆配置

> [!WARNING]
> 如果您之前已有 Neovim 配置，请先备份 `~/.config/nvim`, `~/.local/share/nvim`, `~/.local/state/nvim` 和 `~/.cache/nvim`。

```bash
git clone https://github.com/Protagonistss/nvim-config.git ~/.config/nvim
```

### 3. 启动体验

```bash
nvim
```
> 首次启动时，Neovim 将自动下载 `lazy.nvim` 插件管理器并拉取所有配置的插件，请耐心等待安装完成即可。

## 📁 目录结构 (Structure)

```text
~/.config/nvim/
├── init.lua                 # 🚀 入口文件，加载各个模块
├── lazy-lock.json           # 🔒 插件版本锁
├── lazyvim.json             # 🛠️ LazyVim 语言包及配置记录
└── lua/
    ├── config/
    │   └── lazy.lua         # 💤 lazy.nvim 引导及 LazyVim 注册
    ├── core/
    │   ├── options.lua      # ⚙️ 基础选项 (行号、缩进、剪贴板、Neovide 专属配置等)
    │   ├── keymaps.lua      # ⌨️ 全局自定义快捷键
    │   └── autocmds.lua     # 🔄 自动命令
    └── plugins/
        └── spec.lua         # 🔌 自定义插件配置 (主题、状态栏等)
```

## ⌨️ 常用键位 (Keybindings)

> **Leader 键设定为 `<Space>` (空格)**

| 模式 | 键位 | 功能描述 |
| :---: | :--- | :--- |
| **Insert** | `jk` | 快速退回 Normal 模式 |
| **Visual** | `J` / `K` | 上下移动当前选中的行块 |
| **Normal** | `<leader>sv` | 垂直分屏 (Vertical Split) |
| **Normal** | `<leader>sh` | 水平分屏 (Horizontal Split) |
| **Normal** | `<leader>nh` | 清除搜索高亮 (No Highlight) |

*💡 提示：更多 LazyVim 默认键位，请在 Normal 模式下直接按下 `<Space>` 唤出 `which-key` 菜单进行查看。*

## 🎨 个性化定制 (Customization)

- **字体配置**：终端请自行设置 Nerd Font，若使用 Neovide，会自动读取 `options.lua` 中的 `JetBrainsMono Nerd Font Mono:h18` 设定。
- **添加新插件**：在 `lua/plugins/` 目录下新建文件（如 `lua/plugins/my_plugin.lua`），它会被自动加载。
- **启用语言扩展 (Extras)**：在 Neovim 中运行 `:LazyExtras` 命令，或直接编辑根目录下的 `lazyvim.json` 启用所需语言（如 Python、TypeScript 等）。

## 📚 学习与参考 (References)

- [LazyVim 官方文档](https://lazyvim.org/)
- [lazy.nvim 插件管理器](https://github.com/folke/lazy.nvim)
- [Neovim Lua 配置指南](https://neovim.io/doc/user/lua-guide.html)

## 📄 许可证 (License)

[MIT License](./LICENSE)
