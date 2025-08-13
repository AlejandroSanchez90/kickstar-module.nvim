-- Neovim plugin configuration for codecompanion.nvim
return {
  'olimorris/codecompanion.nvim', -- Plugin repository
  opts = {}, -- Plugin options (leave empty for defaults)
  dependencies = {
    'nvim-lua/plenary.nvim', -- Common utility functions
    'nvim-treesitter/nvim-treesitter', -- Treesitter dependency
  },
  config = function()
    -- Setup codecompanion with custom strategies
    require('codecompanion').setup {
      strategies = {
        chat = {
          adapter = 'openai', -- Use OpenAI as chat adapter
          model = 'gpt-4o', -- Model for chat (e.g., GPT-4o)
        },
        inline = {
          adapter = 'openai', -- Inline completions powered by OpenAI
        },
      },
    }
  end,
}
