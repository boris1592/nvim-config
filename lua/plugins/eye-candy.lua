vim.pack.add({
  'https://github.com/sainnhe/sonokai',
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/nvim-mini/mini.statusline',
}, { confirm = false })

vim.cmd.colorscheme('sonokai')

require('mini.icons').setup()
require('mini.statusline').setup()
