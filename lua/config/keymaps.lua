vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', telescope.find_files)
vim.keymap.set('n', '<leader>/', telescope.live_grep)
vim.keymap.set('n', '<leader>b', telescope.buffers)
vim.keymap.set('n', 'gd', telescope.lsp_definitions)
vim.keymap.set('n', 'gr', telescope.lsp_references)
vim.keymap.set('n', 'gi', telescope.lsp_implementations)
