return {
  'esmuellert/codediff.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  cmd = 'CodeDiff',

  keys = {
    { '<leader>gf', '<cmd>CodeDiff history %<cr>', desc = 'File History' },
    { '<leader>gd', '<cmd>CodeDiff<cr>', desc = 'File History' },
    { '<leader>go', '<cmd>lua Snacks.lazygit()<cr>', desc = 'File History' },
  },
  -- config = function()
  --   -- vim.keymap.set('v', '<leader>gl', "<cmd>'<,'>DiffviewFileHistory<cr>", { desc = 'Line History' })
  --   -- vim.keymap.set('n', '<leader>gz', '<cmd>Neogit<cr>', { desc = 'Open NeoGit' })
  --   -- -- vim.keymap.set('n', '<leader>gdl', '<cmd>DiffviewFileHistory % --base=LOCAL<cr>', { desc = 'Document Local Diff' })
  --   -- vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory<cr>', { desc = 'Branch History' })
  --   -- vim.keymap.set('n', '<leader>gs', '<cmd>DiffviewOpen<cr>', { desc = 'Current status' })
  --   require('codediff').setup {
  --     -- Optional: Configure the appearance and behavior of the diff window
  --   }
  --
  --   vim.keymap.set('n', '<leader>gd', '<cmd>CodeDiff history % <cr>', { desc = 'File History' })
  --   -- vim.keymap.set('n', '<leader>gd', '<cmd>CodeDiff<cr>', { desc = 'Git Diff' })
  -- end,
}
