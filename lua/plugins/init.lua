-- All of this just so that vim.pack prompt shows all plugins at
-- once and doesn't ask you 20 times.

local plugins = {}
local configs = {}

for _, module in ipairs({
  'blink-cmp',
  'eye-candy',
  'gitsigns',
  'leap',
  'lspconfig',
  'mini-files',
  'mini-pick',
  'sleuth',
  'treesitter',
  'typst-preview',
}) do
  local plugin = require('plugins.' .. module)

  for _, name in ipairs(plugin.plugins) do
    table.insert(plugins, name)
  end

  if plugin.config ~= nil then
    table.insert(configs, plugin.config)
  end
end

vim.pack.add(plugins)

for _, config in ipairs(configs) do
  config()
end
