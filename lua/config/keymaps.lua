local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', telescope.find_files)
vim.keymap.set('n', '<leader>/', telescope.live_grep)
vim.keymap.set('n', '<leader>b', telescope.buffers)

-- The default binding for this one (and `gD` too btw)
-- is bullshit. They must've changed alongside adding new
-- default bindings in v0.11.
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

vim.keymap.set('n', '-', "<CMD>Oil<CR>")
