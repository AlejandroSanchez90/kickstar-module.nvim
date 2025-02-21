return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}

    vim.keymap.set('n', '<leader>go', '<cmd>Neogit<cr>', { desc = 'Open NeoGit' })
    vim.keymap.set('n', '<leader>gdl', '<cmd>DiffviewFileHistory % --base=LOCAL<cr>', { desc = 'Document Local Diff' })
    vim.keymap.set('n', '<leader>gdh', '<cmd>DiffviewFileHistory % <cr>', { desc = 'Document History Last Commit' })
    vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewOpen<cr>', { desc = 'Status' })
  end,
}
