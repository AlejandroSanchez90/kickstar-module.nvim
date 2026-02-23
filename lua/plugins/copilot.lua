-- Neovim plugin configuration for codecompanion.nvim
return {
  {
    'github/copilot.vim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- vim.g.copilot_enterprise_uri = 'https://eog-resources-inc.ghe.com'
      vim.keymap.set('i', '<C-e>', '<Plug>(copilot-dismiss)', { desc = 'Dismiss Copilot suggestion' })
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',

    config = function()
      local chat = require 'CopilotChat'
      chat.setup {
        debug = true,
        provider = 'copilot',
        mappings = {
          complete = {
            insert = '<C-t>',
          },
        },
        auto_follow_cursor = true,
        context = 'buffer',
        prompts = {
          Memo = {
            prompt = 'Add memoize to this code, if its a void use useCallback , if it returns a value useMemo, just reply with the update code nothing else',
            description = 'Add memoization to the code',
            mapping = '<leader>au',
            auto_follow_cursor = true,
          },

          XML = {
            prompt = 'Create an XML for this code, just reply with the XML nothing else',
            description = 'Create an XML schema for the code',
            mapping = '<leader>ax',
          },
        },
      }

      local keymap = vim.keymap

      keymap.set({ 'n', 'v' }, '<leader>ac', chat.toggle, { desc = 'copilot chat' })
      keymap.set({ 'n', 'v' }, '<leader>ar', '<cmd>CopilotChatReset<cr>', { desc = 'copilot reset' })
      keymap.set({ 'n', 'v' }, '<leader>af', '<cmd>CopilotChatFix<cr>', { desc = 'copilot fix' })
      keymap.set('n', '<leader>am', '<cmd>CopilotChatCommit<cr>', { desc = 'Copilot commit message' })
      keymap.set({ 'n', 'v' }, '<leader>ap', '<cmd>CopilotChatPrompts<cr>', { desc = 'Copilot Prompts' })
    end,
  },
}
