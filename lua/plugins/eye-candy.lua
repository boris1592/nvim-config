vim.pack.add({
  'https://github.com/EdenEast/nightfox.nvim',
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/nvim-mini/mini.statusline',
}, { confirm = false })

vim.cmd.colorscheme('carbonfox')

require('mini.icons').setup()
require('mini.statusline').setup()
