return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'saghen/blink.cmp',
        'lukas-reineke/lsp-format.nvim',
    },
    config = function()
        local lspconfig = require('lspconfig')
        local lspformat = require('lsp-format')
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        lspformat.setup({})

        for _, name in ipairs({
            'lua_ls',
            'rust_analyzer',
            'tinymist',
            'biome',
            'pyright',
            'svelte',
        }) do
            lspconfig[name].setup({
                on_attach = lspformat.on_attach,
                capabilities = capabilities,
            })
        end

        for _, name in ipairs({
            'ts_ls',
        }) do
            lspconfig[name].setup({})
        end

        lspconfig.nil_ls.setup({
            on_attach = lspformat.on_attach,
            capabilities = capabilities,
            settings = {
                ['nil'] = { formatting = { command = { 'alejandra', '--' } } },
            },
        })

        lspconfig.gopls.setup({
            on_attach = lspformat.on_attach,
            capabilities = capabilities,
            settings = {
                gopls = { buildFlags = { '-tags=integration' } },
            },
        })
    end,
}
