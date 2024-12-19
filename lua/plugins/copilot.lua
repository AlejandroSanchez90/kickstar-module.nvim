return {
  {
    'github/copilot.vim',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',

    keys = { '<leader>gcc' },
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },

    config = function()
      local chat = require 'CopilotChat'
      chat.setup {
        question_header = ' Message',
        answer_header = ' Copilot',
        error_header = ' Error',
        auto_follow_cursor = true,
        context = 'buffer',
      }

      local keymap = vim.keymap

      keymap.set('n', '<leader>gcc', chat.toggle, { desc = 'Copilot Chat' })
      keymap.set('n', '<leader>gcr', chat.toggle, { desc = 'Copilot Chat' })
      keymap.set('n', '<leader>gcd', '<cmd>CopilotChatFixDiagnostic<CR>', { desc = 'Copilot Diagnostics' })
      keymap.set('n', '<leader>gcf', '<cmd>CopilotChatFix<CR>', { desc = 'Copilot Fix' })
      keymap.set('n', '<leader>gcm', '<cmd>CopilotChatCommit<CR>', { desc = 'Copilot Commit Message' })
      keymap.set('n', '<leader>gch', function()
        chat.ask 'Explain how it works'
      end, { desc = 'Copilot How it works' })
    end,
  },
}
