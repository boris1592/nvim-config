vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' }, { confirm = false })

local fmt_group = vim.api.nvim_create_augroup('LspFormatting', {})

local function on_attach_fmt(_, buf)
  vim.api.nvim_clear_autocmds({ group = fmt_group, buffer = buf })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = fmt_group,
    buffer = buf,
    callback = function() vim.lsp.buf.format() end,
  })
end

vim.lsp.enable({
  'biome',
  'gdscript',
  'gleam',
  'gopls',
  'lua_ls',
  'nil_ls',
  'rust_analyzer',
  'tinymist',
  'ts_ls',
})

for _, lsp in ipairs({
  'biome',
  'gleam',
  'lua_ls',
  'rust_analyzer',
  'tinymist',
}) do
  vim.lsp.config(lsp, { on_attach = on_attach_fmt })
end

vim.lsp.config('nil_ls', {
  on_attach = on_attach_fmt,
  settings = {
    ['nil'] = { formatting = { command = { 'alejandra', '--' } } },
  },
})

vim.lsp.config('gopls', {
  on_attach = on_attach_fmt,
  settings = {
    gopls = { buildFlags = { '-tags=integration,api_tests' } },
  },
})
