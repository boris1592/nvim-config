vim.pack.add({ 'https://github.com/chomosuke/typst-preview.nvim' }, { confirm = false })

require('typst-preview').setup({
  dependencies_bin = {
    tinymist = 'tinymist',
    websocat = 'websocat',
  },
})
