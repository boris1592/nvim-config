vim.pack.add({ 'https://github.com/Saghen/blink.cmp' }, { confirm = false })

require('blink.cmp').setup({
  fuzzy = { implementation = 'lua' },
  completion = {
    documentation = { auto_show = true },
  },
})
