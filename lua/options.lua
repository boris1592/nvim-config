vim.o.nu = true
vim.o.rnu = true
vim.o.mouse = 'a'
vim.o.hlsearch = false
vim.o.scrolloff = 8

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.g.mapleader = ' '
vim.o.swapfile = false
vim.diagnostic.config({ virtual_text = true })

vim.keymap.set('n', '<leader><leader>', '<C-^>')
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
