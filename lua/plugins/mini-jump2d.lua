return {
  -- I believe leap.nvim is the GOAT in most cases but for me it causes
  -- insane amounts of pain. Since it generates labels based on the
  -- actual text in the buffer you are forced to switch your keyboard
  -- layout each time if that text isn't english.
  plugins = { 'https://github.com/nvim-mini/mini.jump2d' },
  config = function()
    require('mini.jump2d').setup({
      view = {
        n_steps_ahead = 1,
        dim = true,
      },
      mappings = { start_jumping = '' },
    })

    vim.keymap.set('n', 'gw', function()
      MiniJump2d.start({
        spotter = MiniJump2d.gen_spotter.pattern('[^%s%p]+', 'start'),
      })
    end)
  end,
}
