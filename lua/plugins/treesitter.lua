return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'lua', 'vim', 'vimdoc', 'go', 'javascript', 'typescript', 'nix', 'typst' },
            sync_install = false,
            auto_install = false,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
