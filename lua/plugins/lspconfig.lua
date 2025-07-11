return {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp', },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        local fmtGroup = vim.api.nvim_create_augroup('LspFormatting', {})

        local function onAttachFmt(_, buf)
            vim.api.nvim_clear_autocmds({ group = fmtGroup, buffer = buf })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = fmtGroup,
                buffer = buf,
                callback = function() vim.lsp.buf.format() end,
            })
        end

        -- Just so that the names aren't repeated twice for some LSPs
        local function setupLsp(name, cfg)
            vim.lsp.enable(name)
            vim.lsp.config(name, cfg)
        end

        for _, name in ipairs({
            'lua_ls',
            'rust_analyzer',
            'tinymist',
            'biome',
            'svelte',
        }) do
            setupLsp(name, {
                capabilities = capabilities,
                on_attach = onAttachFmt,
            })
        end

        for _, name in ipairs({
            'pyright',
            'ts_ls',
        }) do
            setupLsp(name, { capabilities = capabilities })
        end

        setupLsp('nil_ls', {
            capabilities = capabilities,
            on_attach = onAttachFmt,
            settings = {
                ['nil'] = { formatting = { command = { 'alejandra', '--' } } },
            },
        })

        setupLsp('gopls', {
            capabilities = capabilities,
            on_attach = onAttachFmt,
            settings = {
                gopls = { buildFlags = { '-tags=integration' } },
            },
        })

        setupLsp('gdscript', {
            capabilities = capabilities,
            on_attach = function(_, buf)
                vim.api.nvim_clear_autocmds({ group = fmtGroup, buffer = buf })
                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = fmtGroup,
                    buffer = buf,
                    callback = function()
                        local lines_cnt = vim.api.nvim_buf_line_count(buf)
                        local old = vim.api.nvim_buf_get_lines(buf, 0, lines_cnt, false)

                        local proc = vim.system({ 'gdformat', '-' }, { stdin = true })
                        proc:write(old)
                        proc:write(nil)
                        local out = proc:wait().stdout

                        local lines = vim.split(out, '\n', { trimempty = true })
                        vim.api.nvim_buf_set_lines(buf, 0, lines_cnt, false, lines)
                    end,
                })
            end,
        })
    end,
}
