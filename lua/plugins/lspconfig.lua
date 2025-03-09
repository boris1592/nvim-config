return {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require('lspconfig')

        for _, name in ipairs({
            'lua_ls',
            'gopls',
            'tinymist',
            'biome',
        }) do
            lspconfig[name].setup({
                on_attach = require('lsp-format').on_attach,
            })
        end

        for _, name in ipairs({
            'golangci_lint_ls',
            'ts_ls',
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
