return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'catppuccin'
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
