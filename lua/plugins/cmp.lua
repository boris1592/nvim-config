return {
    'saghen/blink.cmp',
    build = 'cargo build --release',
    opts = {
        keymap = {
            preset = 'enter',

            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
        },

        appearance = { nerd_font_variant = 'mono' },
        completion = { documentation = { auto_show = true } },
        signature = { enabled = true },
    },
}
