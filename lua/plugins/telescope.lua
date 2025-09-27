return {
  plugins = {
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
  },
  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>f', builtin.find_files)
    vim.keymap.set('n', '<leader>b', builtin.buffers)
    vim.keymap.set('n', '<leader>/', builtin.live_grep)

    vim.keymap.set('n', 'grr', builtin.lsp_references)
    vim.keymap.set('n', 'gri', builtin.lsp_implementations)
    vim.keymap.set('n', 'gd', builtin.lsp_definitions)
  end,
}
