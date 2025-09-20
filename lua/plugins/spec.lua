-- 这里可以添加你自己的插件或覆盖 LazyVim 的插件配置

return {
  -- 颜色主题 - 使用 Tokyo Night
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm", -- 可选: storm, moon, night, day
    },
  },

  -- Neo-tree 文件管理器配置
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  -- lualine 状态栏配置
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
      },
    },
  },

  -- which-key 快捷键提示配置
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        breadcrumb = "│",
        separator = "→",
        group = "+",
      },
    },
  },

  -- 禁用一些你可能不需要的默认插件
  -- { "folke/flash.nvim", enabled = false },
  -- { "echasnovski/mini.pairs", enabled = false },
}