return {
  plugins = {
    'https://github.com/EdenEast/nightfox.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
  },
  config = function()
    vim.cmd.colorscheme('carbonfox')

    require('lualine').setup({
      options = { globalstatus = true },
      sections = {
        lualine_c = {
          { 'filename', path = 1 },
        },
      },
    })
  end,
}
