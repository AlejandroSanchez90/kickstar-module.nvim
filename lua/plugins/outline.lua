return {
  'hedyhli/outline.nvim',
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set('n', 'gs', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

    print 'worked'
    require('outline').setup {

      outline_window = {
        position = 'left',
        width = 20,

        show_numbers = true,
        show_relative_numbers = true,
      },
      symbol_folding = {
        autofold_depth = 1,
        auto_unfold = {
          only = true,
          -- hovered = false,
        },
      },
      -- Your setup opts here (leave empty to use defaults)
    }
  end,
}
