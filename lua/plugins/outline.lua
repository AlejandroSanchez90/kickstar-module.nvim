return {
  'hedyhli/outline.nvim',
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set('n', '<leader>fo', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

    require('outline').setup {
      symbol_folding = {
        auto_unfold = {
          only = 1,
        },
      },
      -- Your setup opts here (leave empty to use defaults)
    }
  end,
}
