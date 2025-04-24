return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}

    vim.keymap.set('v', '<leader>gl', "<cmd>'<,'>DiffviewFileHistory<cr>", { desc = 'Line History' })
    vim.keymap.set('n', '<leader>go', '<cmd>Neogit<cr>', { desc = 'Open NeoGit' })
    -- vim.keymap.set('n', '<leader>gdl', '<cmd>DiffviewFileHistory % --base=LOCAL<cr>', { desc = 'Document Local Diff' })
    vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewFileHistory % <cr>', { desc = 'Document History' })
    vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory<cr>', { desc = 'History' })
    vim.keymap.set('n', '<leader>gs', '<cmd>DiffviewOpen<cr>', { desc = 'Current status' })
  end,
}
