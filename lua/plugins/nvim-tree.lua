return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'antosha417/nvim-lsp-file-operations', 'nvim-lua/plenary.nvim' },
  keys = {
    -- { '<leader>e' },
  },
  config = function()
    require('lsp-file-operations').setup()
    local nvimtree = require 'nvim-tree'
    local api = require 'nvim-tree.api'

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local function my_on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', 'l', '<cmd>NvimTreeResize +10<CR>', opts 'Resize +')
      vim.keymap.set('n', 'h', '<cmd>NvimTreeResize -10<CR>', opts 'Resize -')
    end

    nvimtree.setup {
      on_attach = my_on_attach,

      view = {
        width = 35,
        relativenumber = true,
      },

      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {},
          },
        },
      },

      actions = {
        change_dir = {
          enable = false,
          global = false,
          restrict_above_cwd = true,
        },
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },

      tab = { sync = { open = true, close = true, ignore = {} } },
      filters = {
        custom = { '.DS_Store' },
      },
      filesystem_watchers = {
        ignore_dirs = {
          'node_modules',
        },
      },
      git = {
        ignore = false,
      },
    }

    local keymap = vim.keymap

    -- keymap.set('n', '<leader>e', '<cmd>NvimTreeFindFile<CR>', { desc = 'Toggle file explorer' }) -- toggle file explorer
    -- keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    -- keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    -- keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
    -- keymap.set("n", "<leader>el", "<cmd>NvimTreeResize +20<CR>", { desc = "Increase size" })
    -- keymap.set("n", "<leader>eh", "<cmd>NvimTreeResize -20<CR>", { desc = "Decrease size" })
    -- keymap.set("n", "<leader>eE", "<cmd>NvimTreeFocus<CR>", { desc = "Focus tree" })
  end,
}
