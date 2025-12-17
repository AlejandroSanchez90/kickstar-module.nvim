return {
  'NeogitOrg/neogit',
  dependencies = {
    {
      'sindrets/diffview.nvim',
      config = function()
        require('diffview').setup {
          keymaps = {
            view = {
              ['q'] = '<Cmd>DiffviewClose<CR>',
            },
            file_panel = {
              ['q'] = '<Cmd>DiffviewClose<CR>',
            },
            file_history_panel = {
              ['q'] = '<Cmd>DiffviewClose<CR>',
            },
            option_panel = {
              ['q'] = '<Cmd>DiffviewClose<CR>',
            },
          },
          view = {
            merge_tool = {
              layout = 'diff4_mixed', -- 2 horizontal, main vertical
            },
          },
        }
      end,
    },
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {
      git_services = {
        ['git.eogresources.com'] = {
          pull_request = 'https://git.eogresources.com/${owner}/${repository}/compare/${branch_name}?expand=1',
          commit = 'https://git.eogresources.com/${owner}/${repository}/commit/${oid}',
          tree = 'https://git.eogresources.com/${owner}/${repository}/tree/${branch_name}',
        },
      },
    }

    vim.keymap.set('v', '<leader>gl', "<cmd>'<,'>DiffviewFileHistory<cr>", { desc = 'Line History' })
    vim.keymap.set('n', '<leader>gz', '<cmd>Neogit<cr>', { desc = 'Open NeoGit' })
    -- vim.keymap.set('n', '<leader>gdl', '<cmd>DiffviewFileHistory % --base=LOCAL<cr>', { desc = 'Document Local Diff' })
    vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewFileHistory % <cr>', { desc = 'Document History' })
    vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory<cr>', { desc = 'Branch History' })
    vim.keymap.set('n', '<leader>gs', '<cmd>DiffviewOpen<cr>', { desc = 'Current status' })
    vim.keymap.set('n', '<leader>go', '<cmd>lua Snacks.lazygit()<cr>', { desc = 'Current status' })
  end,
}
