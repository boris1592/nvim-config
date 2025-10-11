vim.pack.add({ 'https://github.com/nvim-mini/mini.files' }, { confirm = false })

require('mini.files').setup()

vim.keymap.set('n', '-', function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end)
