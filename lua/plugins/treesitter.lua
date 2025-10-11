vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' }, { confirm = false })

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'gdscript',
    'gleam',
    'go',
    'javascript',
    'lua',
    'nix',
    'rust',
    'sql',
    'typescript',
    'typst',
    'vim',
    'vimdoc',
  },
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
