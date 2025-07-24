return {
  'NeogitOrg/neogit',
  dependencies = {
    {
      'sindrets/diffview.nvim',
      config = function()
        require('diffview').setup {
          view = {
            merge_tool = {
              layout = 'diff3_mixed', -- 2 horizontal, main vertical
            },
          },
        }
      end,
    },
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}

    vim.keymap.set('v', '<leader>gl', "<cmd>'<,'>DiffviewFileHistory<cr>", { desc = 'Line History' })
    vim.keymap.set('n', '<leader>go', '<cmd>Neogit<cr>', { desc = 'Open NeoGit' })
    -- vim.keymap.set('n', '<leader>gdl', '<cmd>DiffviewFileHistory % --base=LOCAL<cr>', { desc = 'Document Local Diff' })
    vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewFileHistory % <cr>', { desc = 'Document History' })
    vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory<cr>', { desc = 'Branch History' })
    vim.keymap.set('n', '<leader>gs', '<cmd>DiffviewOpen<cr>', { desc = 'Current status' })
  end,
}
