return {
  plugins = { 'https://github.com/nvim-treesitter/nvim-treesitter' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'gdscript',
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
  end,
}
