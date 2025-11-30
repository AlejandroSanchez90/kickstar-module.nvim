return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'MeanderingProgrammer/render-markdown.nvim',
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
      require('render-markdown').setup {
        code = {
          sign = false,
          width = 'block',
          right_pad = 1,
        },
        heading = {
          sign = false,
          icons = {},
        },
        checkbox = {
          enabled = false,
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
