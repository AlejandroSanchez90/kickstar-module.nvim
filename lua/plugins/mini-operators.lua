return {
  'echasnovski/mini.operators',
  version = '*',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('mini.operators').setup {
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
  end,
}
