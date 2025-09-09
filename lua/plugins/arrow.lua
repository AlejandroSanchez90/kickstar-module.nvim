return {
  'otavioschwanck/arrow.nvim',
  jhdependencies = {
    { 'nvim-tree/nvim-web-devicons' },
  },

  config = function()
    local arrow = require 'arrow'
    arrow.setup {
      show_icons = true,
      leader_key = "'",
      buffer_leader_key = 'm',
      separate_by_branch = true,
      per_buffer_config = {
        lines = 1, -- Number of lines showed on preview.
      },
    }
    vim.keymap.set('n', 'H', require('arrow.persist').previous)
    vim.keymap.set('n', 'L', require('arrow.persist').next)
    vim.keymap.set('n', 'M', require('arrow.persist').toggle)
  end,
}
