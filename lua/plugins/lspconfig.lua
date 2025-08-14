return {
    'neovim/nvim-lspconfig',
    config = function()
        local fmt_group = vim.api.nvim_create_augroup('LspFormatting', {})

        local function on_attach_fmt(_, buf)
            vim.api.nvim_clear_autocmds({ group = fmt_group, buffer = buf })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = fmt_group,
                buffer = buf,
                callback = function() vim.lsp.buf.format() end,
            })
        end

        -- Just so that the names aren't repeated twice for some LSPs
        local function setup_lsp(name, cfg)
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
            setup_lsp(name, { on_attach = on_attach_fmt, })
        end

        for _, name in ipairs({
            'pyright',
            'ts_ls',
        }) do
            setup_lsp(name, {})
        end

        setup_lsp('nil_ls', {
            on_attach = on_attach_fmt,
            settings = {
                ['nil'] = { formatting = { command = { 'alejandra', '--' } } },
            },
        })

        setup_lsp('gopls', {
            on_attach = on_attach_fmt,
            settings = {
                gopls = { buildFlags = { '-tags=integration' } },
            },
        })

        setup_lsp('gdscript', {
            on_attach = function(_, buf)
                vim.api.nvim_clear_autocmds({ group = fmt_group, buffer = buf })
                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = fmt_group,
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
