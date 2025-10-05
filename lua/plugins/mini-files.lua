return {
  plugins = { 'https://github.com/nvim-mini/mini.files' },
  config = function()
    require('mini.files').setup()

    vim.keymap.set('n', '-', function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end)
  end,
}
