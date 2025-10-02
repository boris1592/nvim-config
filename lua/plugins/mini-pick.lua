return {
  plugins = {
    'https://github.com/nvim-mini/mini.pick',
    'https://github.com/nvim-mini/mini.extra',
  },
  config = function()
    require('mini.pick').setup()
    require('mini.extra').setup()

    vim.keymap.set('n', '<leader>f', '<CMD>Pick files<CR>')
    vim.keymap.set('n', '<leader>b', '<CMD>Pick buffers<CR>')
    vim.keymap.set('n', '<leader>/', '<CMD>Pick grep_live<CR>')

    vim.keymap.set('n', 'grr', '<CMD>Pick lsp scope=\'references\'<CR>')
    vim.keymap.set('n', 'gri', '<CMD>Pick lsp scope=\'implementation\'<CR>')
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
  end,
}
