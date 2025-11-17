-- 如果使用 telescope.nvim
require('telescope').setup{
    defaults = {
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
      },
    },
    pickers = {
      find_files = {
        find_command = {'fd', '--type', 'f', '--strip-cwd-prefix'}
      }
    }
  }