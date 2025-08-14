-- General Options
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

-- Plugins
vim.pack.add({
  'https://github.com/tpope/vim-sleuth',
  'https://github.com/EdenEast/nightfox.nvim',
  'https://github.com/echasnovski/mini.icons',
  'https://github.com/echasnovski/mini.statusline',
  'https://github.com/echasnovski/mini.pick',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/ggandor/leap.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/saghen/blink.cmp',
  'https://github.com/neovim/nvim-lspconfig',
})

vim.cmd.colorscheme('carbonfox')

require('mini.icons').setup()
require('mini.statusline').setup()
require('mini.pick').setup()
require('oil').setup()
require('leap').create_default_mappings()

require('gitsigns').setup({
  current_line_blame = true,
})

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'vim', 'vimdoc', 'lua', 'rust', 'go', 'nix', 'typst', 'gdscript', 'sql', 'javascript', 'typescript',
  },
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

require('blink.cmp').setup({
  keymap = { preset = 'enter' },
  appearance = { nerd_font_variant = 'mono' },
  completion = { documentation = { auto_show = true } },
  signature = { enabled = true },

  -- I'm not against rust or anything but dealing with nightly (especially on nixos)
  -- is a bit too much of a requirement from a neovim plugin.
  fuzzy = { implementation = "lua" },
})

-- LSPs
vim.lsp.enable({
  'lua_ls',
  'rust_analyzer',
  'gopls',
  'nil_ls',
  'tinymist',
  'gdscript',
})

vim.lsp.config('nil_ls', {
  settings = {
    ['nil'] = { formatting = { command = { 'alejandra', '--' } } },
  },
})

vim.lsp.config('gopls', {
  settings = {
    gopls = { buildFlags = { '-tags=integration' } },
  }
})

-- Keymap
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader><leader>', '<C-^>')
vim.keymap.set('n', '<leader>m', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)

vim.keymap.set('n', '-', '<CMD>Oil<CR>')
vim.keymap.set('n', '<leader>f', '<CMD>Pick files<CR>')
vim.keymap.set('n', '<leader>b', '<CMD>Pick buffers<CR>')
vim.keymap.set('n', '<leader>/', '<CMD>Pick grep_live<CR>')
