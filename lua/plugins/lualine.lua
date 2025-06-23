return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                globalstatus = true,
            },
            sections = {
                lualine_c = { 'buffers' },
            },
        })
    end,
}
