vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' }, { confirm = false })

local parsers = {
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
}

require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  pattern = parsers,
  callback = function() vim.treesitter.start() end,
})
