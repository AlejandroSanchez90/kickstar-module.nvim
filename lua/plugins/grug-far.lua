return {
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup {}
    local keymap = vim.keymap
    keymap.set(
      'n',
      '<leader>rr',
      '<cmd>:lua require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })<CR>',
      { desc = 'Search Replace Current File' }
    )
    keymap.set('n', '<leader>rR', '<cmd>GrugFar ripgrep<CR>', { desc = 'Search and replace work directory' })
  end,
}
