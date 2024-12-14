return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed.
    -- 'nvim-telescope/telescope.nvim', -- optional
    'ibhagwan/fzf-lua', -- optional
    -- 'echasnovski/mini.pick', -- optional
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}

    vim.keymap.set('n', '<leader>go', '<cmd>Neogit<cr>', { desc = 'Open NeoGit' })
    vim.keymap.set('n', '<leader>gdl', '<cmd>DiffviewFileHistory % --base=LOCAL<cr>', { desc = 'Document Local Diff' })
    vim.keymap.set('n', '<leader>gdh', '<cmd>DiffviewFileHistory % <cr>', { desc = 'Document History Last Commit' })
  end,
}
