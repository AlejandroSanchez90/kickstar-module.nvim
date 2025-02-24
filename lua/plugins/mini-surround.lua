return {
  'echasnovski/mini.surround',
  event = { 'BufReadPre', 'BufNewFile' },
  version = '*',
  config = function()
    require('mini.surround').setup {
      mappings = {
        add = 'ys', -- Add surrounding in Normal and Visual modes
        delete = 'ysd', -- Delete surrounding
        find = 'ysf', -- Find surrounding (to the right)
        find_left = 'ysF', -- Find surrounding (to the left)
        highlight = 'ysh', -- Highlight surrounding
        replace = 'ysc', -- Replace surrounding
        update_n_lines = 'ysn', -- Update `n_lines`
        suffix_last = 'yl', -- Suffix to search with "prev" method
        suffix_next = 'yn', -- Suffix to search with "next" method
      },
    }
  end,
}
