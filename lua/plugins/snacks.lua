return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    git = { enabled = true },
    bigfile = { enabled = true },
    rename = { enabled = true },
    bufdelete = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    zen = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      '<leader><space>',
      function()
        require('snacks').picker.smart {
          sort_lastused = true,
          multi = { 'buffers', 'recent', 'files' },
          format = 'file', -- use `file` format for all sources
          matcher = {
            cwd_bonus = true, -- boost cwd matches
            frecency = true, -- use frecency boosting
            sort_empty = true, -- sort even when the filter is empty
          },
          -- sort = { fields = { 'is_cwd', 'idx', 'score:desc', '#text' } },
          transform = 'unique_file',
        }
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader>fu',
      function()
        Snacks.picker.undo {
          on_show = function()
            vim.cmd.stopinsert()
          end,
        }
      end,
      desc = 'LSP Workspace Symbols',
    },
    {

      '<leader>z',
      function()
        Snacks.zen.zen()
      end,
      desc = 'Toggle Zen mode',
    },
    {
      '<leader>bo',
      function()
        Snacks.bufdelete.other()
      end,
      desc = 'Close other buffers',
    },
    {
      '<leader>fdw',
      function()
        Snacks.picker.diagnostics {
          on_show = function()
            vim.cmd.stopinsert()
          end,
        }
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>fdd',
      function()
        Snacks.picker.diagnostics_buffer {
          on_show = function()
            vim.cmd.stopinsert()
          end,
        }
      end,
      desc = 'Buffer Diagnostics',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      desc = 'Find Files',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume',
    },
    {
      '<leader>fb',
      function()
        require('snacks').picker.buffers {
          sort_lastused = true,
          focus = 'list', -- open in normal mode for immediate j/k navigation
          win = {
            preview = {
              wo = { number = false, relativenumber = false },
            },
          },
        }
      end,
      desc = 'Buffers',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Grep Open Buffers',
    },
    {
      '<leader>fs',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>fc',
      function()
        Snacks.picker.grep_word()
      end,
      desc = 'Visual selection or word',
      mode = { 'n', 'x' },
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references {
          on_show = function()
            vim.cmd.stopinsert()
          end,
        }
      end,
      nowait = true,
      desc = 'References',
    },
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions {
          on_show = function()
            vim.cmd.stopinsert()
          end,
        }
      end,
      desc = 'Goto Definition',
    },
    {
      'gi',
      function()
        Snacks.picker.lsp_implementations {
          on_show = function()
            vim.cmd.stopinsert()
          end,
        }
      end,
      desc = 'Goto Implementation',
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions {
          on_show = function()
            vim.cmd.stopinsert()
          end,
        }
      end,
      desc = 'Goto T[y]pe Definition',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols {
          on_show = function()
            vim.cmd.stopinsert()
          end,
        }
      end,
      desc = 'LSP Symbols',
    },
    {
      '<leader>sS',
      function()
        Snacks.picker.lsp_workspace_symbols {
          on_show = function()
            vim.cmd.stopinsert()
          end,
        }
      end,
      desc = 'LSP Workspace Symbols',
    },
  },
}
