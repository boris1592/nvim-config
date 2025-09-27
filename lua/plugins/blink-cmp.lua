return {
  plugins = { 'https://github.com/Saghen/blink.cmp' },
  config = function()
    require('blink.cmp').setup({
      fuzzy = { implementation = 'lua' },
      completion = {
        documentation = { auto_show = true },
      },
    })
  end,
}
