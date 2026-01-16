return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'nvim-tree/nvim-web-devicons',
      'norcalli/nvim-colorizer.lua',
      -- this is to have the scope context as header
      -- {
      --   'nvim-treesitter/nvim-treesitter-context',
      --   opts = {
      --     enable = true,
      --     multiline_threshold = 1,
      --     max_lines = 3,
      --   },
      -- },
    },
    config = function()
      local treesitter = require 'nvim-treesitter.configs'
      require('colorizer').setup {
        '*',
      }
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      }
      treesitter.setup {
        ignore_install = {},
        sync_install = false,
        auto_install = false,
        modules = {},
        highlight = {
          enable = true,
        },

        indent = { enable = true },

        ensure_installed = {
          'json5',
          'javascript',
          'typescript',
          'tsx',
          'yaml',
          'html',
          'css',
          'diff',
          -- 'prisma',
          'markdown',
          'markdown_inline',
          'bash',
          'lua',
          'vim',
          'dockerfile',
          'gitignore',
          'query',
          'vimdoc',
          -- 'c',
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
      }
    end,
  },
}
