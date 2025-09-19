-- 图标配置文件
-- 如果你的终端不支持 Nerd Font，这个文件提供了 ASCII 替代方案

local M = {}

-- 检查是否支持 Nerd Font
local function has_nerd_font()
	-- 简单检查：如果环境变量设置了或者字体名称包含 Nerd
	local term_program = vim.env.TERM_PROGRAM or ""
	local font_family = vim.env.FONT_FAMILY or ""

	return string.find(font_family:lower(), "nerd") ~= nil
end

-- ASCII 图标集
M.ascii = {
	kind = {
		Text = "T",
		Method = "M",
		Function = "F",
		Constructor = "C",
		Field = "f",
		Variable = "V",
		Class = "C",
		Interface = "I",
		Module = "M",
		Property = "P",
		Unit = "U",
		Value = "v",
		Enum = "E",
		Keyword = "K",
		Snippet = "S",
		Color = "c",
		File = "F",
		Reference = "R",
		Folder = "D",
		EnumMember = "e",
		Constant = "C",
		Struct = "S",
		Event = "E",
		Operator = "O",
		TypeParameter = "T",
	},
	git = {
		added = "A",
		modified = "M",
		deleted = "D",
		renamed = "R",
		untracked = "?",
		ignored = "!",
		unstaged = "U",
		staged = "S",
		conflict = "C",
	},
	ui = {
		folder_closed = "+",
		folder_open = "-",
		folder_empty = "o",
		file = "*",
		separator = "|",
		arrow_right = ">",
		arrow_left = "<",
		check = "✓",
		cross = "✗",
		warning = "!",
		info = "i",
		error = "E",
	},
}

-- Nerd Font 图标集（如果支持的话）
M.nerd = {
	kind = {
		Text = "󰉿",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰜢",
		Variable = "󰀫",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "󰑭",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "󰈇",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "󰙅",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "",
	},
	git = {
		added = "",
		modified = "",
		deleted = "",
		renamed = "➜",
		untracked = "★",
		ignored = "◌",
		unstaged = "✗",
		staged = "✓",
		conflict = "",
	},
	ui = {
		folder_closed = "",
		folder_open = "",
		folder_empty = "",
		file = "",
		separator = "",
		arrow_right = "",
		arrow_left = "",
		check = "",
		cross = "",
		warning = "",
		info = "",
		error = "",
	},
}

-- 根据字体支持情况选择图标集
M.icons = has_nerd_font() and M.nerd or M.ascii

-- 获取当前使用的图标集
function M.get_icons()
	return M.icons
end

-- 检查字体支持状态
function M.check_font_support()
	local supported = has_nerd_font()
	print("Nerd Font 支持状态: " .. (supported and "支持" or "不支持"))
	print("当前使用图标集: " .. (supported and "Nerd Font" or "ASCII"))
	return supported
end

return M
