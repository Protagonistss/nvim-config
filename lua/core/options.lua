-- Add neovide if exist
if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font:h18"
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_scale_factor = 0.66
	-- turn off animate because we are using neovide
	vim.g.snacks_animate = false
end

local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

-- 根路径设置
vim.g.root_spec = { "cwd" }
