-- The default binding for this one (and `gD` too btw)
-- is bullshit. They must've changed alongside adding new
-- default bindings in v0.11.
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

vim.keymap.set('n', '-', '<CMD>Oil<CR>')

vim.keymap.set('n', 'gp', '<CMD>bprev<CR>')
vim.keymap.set('n', 'gn', '<CMD>bnext<CR>')
vim.keymap.set('n', 'gw', '<CMD>bdelete<CR>')
