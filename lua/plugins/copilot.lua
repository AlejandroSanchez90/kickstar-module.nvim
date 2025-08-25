-- Neovim plugin configuration for codecompanion.nvim
return {
  {
    'github/copilot.vim',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',

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

      keymap.set({ 'n', 'v' }, '<leader>ac', chat.toggle, { desc = 'copilot chat' })
      keymap.set({ 'n', 'v' }, '<leader>af', '<cmd>CopilotChatFix<cr>', { desc = 'copilot fix' })
      keymap.set('n', '<leader>am', '<cmd>CopilotChatCommit<cr>', { desc = 'Copilot commit message' })
      keymap.set({ 'n', 'v' }, '<leader>ap', '<cmd>CopilotChatPrompts<cr>', { desc = 'Copilot Prompts' })
    end,
  },
}
