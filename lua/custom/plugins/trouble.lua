return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/todo-comments.nvim' },
  cmd = 'Trouble',
  opts = {},
  keys = {
    { '<leader>xx', '<cmd>Trouble diagnostics toggle focus=true<cr>', desc = 'Open/close trouble list' },
    {
      '<leader>xd',
      '<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<CR>',
      desc = 'Open trouble document diagnostics',
    },
    { '<leader>xq', '<cmd>Trouble quickfix toggle<CR>', desc = 'Open trouble quickfix list' },
    { '<leader>xl', '<cmd>Trouble loclist toggle<CR>', desc = 'Open trouble location list' },
    { '<leader>xs', '<cmd>Trouble symbols toggle focus=false<CR>', desc = 'Open trouble symbols' },
    { '<leader>xt', '<cmd>TodoTrouble focus=true<CR>', desc = 'Open todos in trouble' },
  },
}
