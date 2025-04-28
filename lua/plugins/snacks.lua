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
    picker = {
      enabled = true,
      sources = {
        git_grep_hunks = {
          supports_live = false,
          format = function(item, picker)
            local file_format = Snacks.picker.format.file(item, picker)
            vim.api.nvim_set_hl(0, 'SnacksPickerGitGrepLineNew', { link = 'Added' })
            vim.api.nvim_set_hl(0, 'SnacksPickerGitGrepLineOld', { link = 'Removed' })
            if item.sign == '+' then
              file_format[#file_format - 1][2] = 'SnacksPickerGitGrepLineNew'
            else
              file_format[#file_format - 1][2] = 'SnacksPickerGitGrepLineOld'
            end
            return file_format
          end,
          finder = function(f_opts, ctx)
            local hcount = 0
            local header = {
              file = '',
              old = { start = 0, count = 0 },
              new = { start = 0, count = 0 },
            }
            local sign_count = 0
            return require('snacks.picker.source.proc').proc({
              f_opts,
              {
                cmd = 'git',
                args = { 'diff', '--unified=0' },
                transform = function(item) ---@param item snacks.picker.finder.Item
                  local line = item.text
                  -- [[Header]]
                  if line:match '^diff' then
                    hcount = 3
                  elseif hcount > 0 then
                    if hcount == 1 then
                      header.file = line:sub(7)
                    end
                    hcount = hcount - 1
                  elseif line:match '^@@' then
                    local parts = vim.split(line:match '@@ ([^@]+) @@', ' ')
                    local old_start, old_count = parts[1]:match '-(%d+),?(%d*)'
                    local new_start, new_count = parts[2]:match '+(%d+),?(%d*)'
                    header.old.start, header.old.count = tonumber(old_start), tonumber(old_count) or 1
                    header.new.start, header.new.count = tonumber(new_start), tonumber(new_count) or 1
                    sign_count = 0
                    -- [[Body]]
                  elseif not line:match '^[+-]' then
                    sign_count = 0
                  elseif line:match '^[+-]%s*$' then
                    sign_count = sign_count + 1
                  else
                    item.sign = line:sub(1, 1)
                    item.file = header.file
                    item.line = line:sub(2)
                    if item.sign == '+' then
                      item.pos = { header.new.start + sign_count, 0 }
                      sign_count = sign_count + 1
                    else
                      item.pos = { header.new.start, 0 }
                      sign_count = 0
                    end
                    return true
                  end
                  return false
                end,
              },
            }, ctx)
          end,
        },
      },
    },
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
        Snacks.picker.git_grep_hunks()
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
