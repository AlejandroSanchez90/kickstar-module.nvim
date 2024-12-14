-- lazy.nvim
return {
  'folke/noice.nvim',
  event = 'VeryLazy',

  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('notify').setup {
      timeout = 2000,
      background_colour = '#000000',
      max_width = 50,
      top_down = false,
    }

    require('noice').setup {
      lsp = {
        progress = {
          enabled = true,
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            throttle = 2000,
            trigger = true,
          },
        },
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    }
  end,
}
