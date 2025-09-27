return {
  plugins = { 'https://github.com/chomosuke/typst-preview.nvim' },
  config = function()
    require('typst-preview').setup({
      dependencies_bin = {
        tinymist = 'tinymist',
        websocat = 'websocat',
      },
    })
  end,
}
