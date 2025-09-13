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
  'https://github.com/EdenEast/nightfox.nvim',
  'https://github.com/echasnovski/mini.comment',
  'https://github.com/echasnovski/mini.completion',
  'https://github.com/echasnovski/mini.files',
  'https://github.com/echasnovski/mini.icons',
  'https://github.com/echasnovski/mini.pick',
  'https://github.com/echasnovski/mini.statusline',
  'https://github.com/ggandor/leap.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/tpope/vim-sleuth',
})

vim.cmd.colorscheme('carbonfox')

require('mini.comment').setup()
require('mini.completion').setup()
require('mini.files').setup()
require('mini.icons').setup()
require('mini.pick').setup()
require('mini.statusline').setup()
require('leap').set_default_mappings()

require('gitsigns').setup({
  current_line_blame = true,
})

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'vim',
    'vimdoc',
    'lua',
    'rust',
    'go',
    'nix',
    'typst',
    'javascript',
    'typescript',
    'gdscript',
    'sql',
  },
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

-- LSPs
vim.lsp.enable({
  'lua_ls',
  'rust_analyzer',
  'gopls',
  'nil_ls',
  'tinymist',
  'gdscript',
  'biome',
  'ts_ls',
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
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')

vim.keymap.set('n', '-', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end)
vim.keymap.set('n', '<leader>f', '<CMD>Pick files<CR>')
vim.keymap.set('n', '<leader>b', '<CMD>Pick buffers<CR>')
vim.keymap.set('n', '<leader>/', '<CMD>Pick grep_live<CR>')
