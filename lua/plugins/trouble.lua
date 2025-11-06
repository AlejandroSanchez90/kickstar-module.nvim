return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/todo-comments.nvim' },
  cmd = 'Trouble',

  opts = {},
  specs = {
    'folke/snacks.nvim',
    opts = function(_, opts)
      return vim.tbl_deep_extend('force', opts or {}, {
        picker = {
          actions = require('trouble.sources.snacks').actions,
          win = {
            input = {
              keys = {
                ['<c-q>'] = {
                  'trouble_open',
                  mode = { 'n', 'i' },
                },
              },
            },
          },
        },
      })
    end,
  },
  keys = {
    { '<leader>xx', '<cmd>Trouble diagnostics toggle focus=true<cr>', desc = 'Open/close trouble list' },
    {
      '<leader>xd',
      '<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<CR>',
      desc = 'Open trouble document diagnostics',
    },
    { '<leader>xq', '<cmd>Trouble qflist toggle<CR>', desc = 'Open trouble quickfix list' },
    { '<leader>xl', '<cmd>Trouble loclist toggle<CR>', desc = 'Open trouble location list' },
    { '<leader>xs', '<cmd>Trouble symbols toggle focus=false<CR>', desc = 'Open trouble symbols' },
    { '<leader>xt', '<cmd>TodoTrouble focus=true<CR>', desc = 'Open todos in trouble' },
  },
}
