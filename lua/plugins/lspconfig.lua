return {
    'neovim/nvim-lspconfig',
    dependencies = { 'lukas-reineke/lsp-format.nvim' },
    config = function()
        local lspconfig = require('lspconfig')

        require('lsp-format').setup({})

        for _, name in ipairs({
            'lua_ls',
            'gopls',
            'rust_analyzer',
            'tinymist',
            'biome',
            'pyright',
            'svelte',
        }) do
            lspconfig[name].setup({
                on_attach = require('lsp-format').on_attach,
            })
        end

        for _, name in ipairs({
            'ts_ls',
            'eslint',
        }) do
            lspconfig[name].setup({})
        end

        lspconfig.nil_ls.setup({
            on_attach = require('lsp-format').on_attach,
            settings = {
                ['nil'] = { formatting = { command = { 'alejandra', '--' } } },
            },
        })
    end,
}
