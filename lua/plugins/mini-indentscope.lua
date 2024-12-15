return {
  'echasnovski/mini.indentscope',
  event = { 'BufReadPre', 'BufNewFile' },
  version = '*',
  config = function()
    local mini = require 'mini.indentscope'
    mini.setup {
      draw = {
        animation = mini.gen_animation.none(),
      },
      symbol = '│',
    }
  end,
}
