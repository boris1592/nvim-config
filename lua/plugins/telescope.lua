return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-symbols.nvim',
    },
    config = function()
        local telescope = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', telescope.find_files)
        vim.keymap.set('n', '<leader>/', telescope.live_grep)
        vim.keymap.set('n', '<leader>b', telescope.buffers)
        vim.keymap.set('n', '<leader>e', telescope.symbols)
    end,
}
