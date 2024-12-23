return {
  'ojroques/nvim-bufdel',
  config = function()
    local keymap = vim.keymap
    keymap.set('n', '<leader>bo', '<cmd>:BufDelOthers<cr>', { desc = 'Close other buffers' }) -- close current split window
    keymap.set('n', '<leader>ba', '<cmd>:BufDelAll<cr>', { desc = 'Close other buffers' }) -- close current split window
  end,
}
