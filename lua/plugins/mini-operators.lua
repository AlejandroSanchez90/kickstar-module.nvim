return {
  'echasnovski/mini.operators',
  version = '*',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local miniOperators = require 'mini.operators'

    miniOperators.setup {
      evaluate = {
        prefix = '<leader>o=',
        func = nil,
      },
      exchange = {
        prefix = '<leader>ox',
        reindent_linewise = true,
      },
      multiply = {
        prefix = '<leader>om',
        func = nil,
      },
      replace = {
        prefix = '<leader>or',
        reindent_linewise = true,
      },
      sort = {
        prefix = '<leader>os',
        func = nil,
      },
    }

    vim.keymap.set('x', 'm', function()
      miniOperators.multiply 'visual'
    end, { desc = 'MiniOperators: multiply (visual)', noremap = true, silent = true })
  end,
}
