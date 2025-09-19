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
    opts = function()
      local icons = require("config.icons")
      return {
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        default_component_configs = {
          icon = {
            folder_closed = icons.get_icon("folder_closed"),
            folder_open = icons.get_icon("folder_open"),
            folder_empty = icons.get_icon("folder_empty"),
            default = icons.get_icon("file"),
          },
          git_status = {
            symbols = {
              added = icons.get_icon("git_add"),
              modified = icons.get_icon("git_mod"),
              deleted = icons.get_icon("git_del"),
              renamed = icons.get_icon("git_rename"),
              untracked = icons.get_icon("git_untracked"),
              ignored = icons.get_icon("git_ignored"),
              unstaged = icons.get_icon("git_unstaged"),
              staged = icons.get_icon("git_staged"),
              conflict = icons.get_icon("git_conflict"),
            },
          },
        },
      }
    end,
  },

  -- lualine 状态栏配置
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local icons = require("config.icons")
      return {
        options = {
          component_separators = { 
            left = icons.get_icon("separator"), 
            right = icons.get_icon("separator") 
          },
          section_separators = { 
            left = icons.get_icon("section_left"), 
            right = icons.get_icon("section_right") 
          },
        },
      }
    end,
  },

  -- which-key 快捷键提示配置
  {
    "folke/which-key.nvim",
    opts = function()
      local icons = require("config.icons")
      return {
        icons = {
          breadcrumb = icons.get_icon("breadcrumb"),
          separator = icons.get_icon("arrow_right"),
          group = icons.get_icon("group"),
        },
      }
    end,
  },

  -- 禁用一些你可能不需要的默认插件
  -- { "folke/flash.nvim", enabled = false },
  -- { "echasnovski/mini.pairs", enabled = false },
}