return {
  'ibhagwan/fzf-lua',

  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local fzflua = require 'fzf-lua'
    fzflua.setup {
      oldfiles = {
        include_current_session = true,
      },
      winopts = {
        preview = {
          vertical = 'up:65',
          layout = 'vertical',
        },
      },
      preview = {
        builtin = {
          syntax_limit_b = 1024 * 100,
        },
      },
      grep = {
        -- multiline = 1,
        rg_glob = true,
      },
      keymap = {
        builtin = {
          true,
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up',
        },
        fzf = {
          true,
          ['ctrl-d'] = 'preview-page-down',
          ['ctrl-u'] = 'preview-page-up',
        },
      },
    }

    local keymap = vim.keymap

    function SendBuffersToQuickfix()
      local bufs = vim.api.nvim_list_bufs()
      local qflist = {}

      for _, buf in ipairs(bufs) do
        table.insert(qflist, { bufnr = buf })
      end

      vim.fn.setqflist(qflist, 'r')
      fzflua.grep_quickfix()
    end

    keymap.set('n', '<leader>ft', '<cmd>:lua SendBuffersToQuickfix()<CR>', { desc = 'Grep open buffers' })
    keymap.set('n', '<leader>ff', '<cmd>FzfLua files --keep-right<cr>', { desc = 'Find files in cwd' })
    keymap.set('n', '<leader>fdd', '<cmd>FzfLua diagnostics_document<cr>', { desc = 'Diagnostic Document' })
    keymap.set('n', '<leader>fdw', '<cmd>FzfLua diagnostics_workspace<cr>', { desc = 'Diagnostic Workspace' })
    keymap.set('n', '<leader>fh', '<cmd>FzfLua oldfiles<cr>', { desc = 'Find recent files' })
    keymap.set('n', '<leader>fs', '<cmd>FzfLua live_grep<cr>', { desc = 'Find string in cwd' })
    keymap.set('n', '<leader>fc', '<cmd>FzfLua grep_cword <cr>', { desc = 'Find string under cursor in cwd' })
    keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers sort_lastused=false<cr>', { desc = 'Find buffers' })
    keymap.set('n', '<leader><leader>', '<cmd>FzfLua buffers sort_lastused=true<cr>', { desc = 'Find buffers' })
    keymap.set('n', '<leader>fr', '<cmd>FzfLua resume<cr>', { desc = 'Find resume' })
    keymap.set('n', '<leader>fq', '<cmd>FzfLua quickfix<cr>', { desc = 'Find quickfix' })
    keymap.set('n', '<leader>fg', function()
      require('fzf-lua').grep {
        raw_cmd = [[git diff --name-only | xargs rg --hidden --column --line-number --no-heading --color=always --with-filename -e '']],
      }
    end, { desc = 'Grep changed files' })
  end,
}
