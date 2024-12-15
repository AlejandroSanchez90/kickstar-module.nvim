return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'MeanderingProgrammer/render-markdown.nvim',
      'nvim-tree/nvim-web-devicons',
      'norcalli/nvim-colorizer.lua',
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
      require('render-markdown').setup {}
      treesitter.setup { -- enable syntax highlighting
        ignore_install = {},
        sync_install = false,
        auto_install = false,
        modules = {},
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        -- ensure these language parsers are installed
        ensure_installed = {
          'json',
          'javascript',
          'typescript',
          'tsx',
          'yaml',
          'html',
          'css',
          'prisma',
          'markdown',
          'markdown_inline',
          -- "svelte",
          -- "graphql",
          'bash',
          'lua',
          'vim',
          'dockerfile',
          'gitignore',
          'query',
          'vimdoc',
          'c',
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
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
-- vim: ts=2 sts=2 sw=2 et
