return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'catppuccin'

    -- Line number colors (set after colorscheme)
    function LineNumberColors()
      -- Line number colors
      vim.api.nvim_set_hl(0, 'LineNr', { fg = '#585b70', bold = false })
      -- Current cursor number
      vim.api.nvim_set_hl(0, 'CursorLineNr', { bold = true })
      -- Cursor backgroun line color
      vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#11111b', bold = false })
    end
    LineNumberColors()
  end,
  opts = {
    flavour = 'mocha',
    transparent_background = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = '',
      },
    },
  },
}
