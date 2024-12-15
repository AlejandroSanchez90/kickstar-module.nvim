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
          ['cmp.entry.get_documentation'] = true, -
        },
      },
      presets = {
        bottom_search = true, 
        command_palette = true, 
        long_message_to_split = true, 
        inc_rename = false, 
        lsp_doc_border = true, 
      },
    }
  end,
}
