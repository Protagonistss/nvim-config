# Neovim 配置

这是一个简洁高效的 Neovim 配置文件，采用模块化设计，易于维护和扩展。

## 📁 目录结构

```
nvim/
├── init.lua              # 主配置文件
├── lua/
│   └── core/
│       └── options.lua   # 基础选项配置
└── README.md
```

## ✨ 特性

### 基础配置
- **行号显示**: 相对行号和绝对行号
- **智能缩进**: 2空格缩进，自动缩进
- **文本换行**: 禁用自动换行
- **光标高亮**: 当前行高亮显示
- **鼠标支持**: 全模式鼠标操作

### 编辑体验
- **系统剪贴板**: 与系统剪贴板集成
- **智能搜索**: 忽略大小写，智能匹配
- **窗口分割**: 新窗口默认在右侧和下方打开
- **终端颜色**: 支持真彩色显示

## 🚀 快速开始

### 安装要求
- Neovim 0.8.0 或更高版本
- Lua 5.1 或更高版本

### 安装步骤

1. **克隆仓库**
   ```bash
   git clone https://github.com/Protagonistss/nvim-config.git ~/.config/nvim
   ```

2. **启动 Neovim**
   ```bash
   nvim
   ```

## 📝 配置说明

### 核心选项 (`lua/core/options.lua`)

| 配置项 | 说明 |
|--------|------|
| `relativenumber` | 显示相对行号 |
| `number` | 显示绝对行号 |
| `tabstop` | Tab 宽度为 2 空格 |
| `shiftwidth` | 自动缩进宽度为 2 空格 |
| `expandtab` | 将 Tab 转换为空格 |
| `wrap` | 禁用自动换行 |
| `cursorline` | 高亮当前行 |
| `mouse` | 启用鼠标支持 |
| `clipboard` | 使用系统剪贴板 |
| `splitright` | 垂直分割时在右侧打开 |
| `splitbelow` | 水平分割时在下方打开 |
| `ignorecase` | 搜索时忽略大小写 |
| `smartcase` | 智能大小写匹配 |
| `termguicolors` | 启用真彩色支持 |

## 🔧 自定义配置

### 添加新的配置模块

1. 在 `lua/core/` 目录下创建新的 Lua 文件
2. 在 `init.lua` 中引入新模块：
   ```lua
   require("core.your_module")
   ```

### 示例：添加键位映射

创建 `lua/core/keymaps.lua`：
```lua
local keymap = vim.keymap

-- 设置 leader 键
vim.g.mapleader = " "

-- 保存文件
keymap.set("n", "<leader>w", ":w<CR>", { desc = "保存文件" })

-- 退出
keymap.set("n", "<leader>q", ":q<CR>", { desc = "退出" })
```

然后在 `init.lua` 中添加：
```lua
require("core.keymaps")
```

## 🎨 主题和插件

当前配置为纯 Lua 实现，不依赖任何插件管理器。如需添加主题或插件，建议使用：

- **Lazy.nvim**: 现代插件管理器
- **Packer.nvim**: 传统插件管理器
- **vim-plug**: 轻量级插件管理器

### 1. 下载字体文件
访问以下链接下载 JetBrains Mono Nerd Font：
- **官方下载**: https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
- **备用链接**: https://www.nerdfonts.com/font-downloads

## 📚 学习资源

- [Neovim 官方文档](https://neovim.io/doc/)
- [Lua 配置指南](https://neovim.io/doc/user/lua-guide.html)
- [Vim 用户手册](https://neovim.io/doc/user/usr_toc.html)

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进这个配置！

## 📄 许可证

MIT License

---

**注意**: 这是一个基础配置，适合 Neovim 初学者和喜欢简洁配置的用户。如需更高级的功能，建议参考其他成熟的 Neovim 配置项目。
