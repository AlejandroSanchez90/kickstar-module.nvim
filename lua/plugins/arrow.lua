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
        lines = 5, -- Number of lines showed on preview.
      },
    }

    local function gotoMap(idx)
      vim.keymap.set('n', '<leader>' .. idx, function()
        require('arrow.persist').go_to(idx)
      end, { desc = 'Go to Arrow file ' .. idx })
    end

    vim.keymap.set('n', 'H', require('arrow.persist').previous)
    vim.keymap.set('n', 'L', require('arrow.persist').next)
    vim.keymap.set('n', 'M', require('arrow.persist').toggle)
    gotoMap(1)
    gotoMap(2)
    gotoMap(3)
    gotoMap(4)
    gotoMap(5)
  end,
}
