vim.g.mapleader = ' '
local keymap = vim.keymap

keymap.set({ 'n', 'i' }, '<c-s>', function()
  vim.cmd 'wa'
  vim.notify('Files Saved', vim.log.levels.INFO)
end, { desc = 'Save all' })

keymap.set('i', 'kj', '<ESC>', { desc = 'Exit insert/visual mode with kj' })
keymap.set('n', 'J', 'mzJ`z')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')
keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })
-- keymap.set('n', '<C-o>', '<C-o>zz', { noremap = true })
-- keymap.set('n', '<C-i>', '<C-i>zz', { noremap = true })

-- Save cursor position to go back to it with c-o c-i
keymap.set('n', 'k', function()
  return vim.v.count > 0 and "m'" .. vim.v.count .. 'kzz' or "m'gk" or "m'<C-d>"
end, { expr = true })
keymap.set('n', 'j', function()
  return vim.v.count > 0 and "m'" .. vim.v.count .. 'jzz' or "m'gj"
end, { expr = true })
keymap.set('n', '<C-d>', "m'<C-d>zz", { noremap = true, expr = false })
keymap.set('n', '<C-u>', "m'<C-u>zz", { noremap = true, expr = false })
-- end

-- increment/decrement numbers
keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' }) -- increment
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' }) -- decrement

-- window management
keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>wx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

keymap.set('n', '<leader>tt', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab
keymap.set('n', '<leader>to', '<cmd>tabo<CR>', { desc = 'Close other tabs' }) -- close current split window
keymap.set('n', '<leader>th', '<cmd>-tabmove<CR>', { desc = 'Move tab to the right' }) -- close current split window
keymap.set('n', '<leader>tl', '<cmd>+tabmove<CR>', { desc = 'Move tab to the left' }) -- close current split window

-- Accidental macro mode trigger handler
vim.keymap.set('n', 'q', '<nop>', { noremap = true })
vim.keymap.set('n', 'Q', 'q', { noremap = true, desc = 'Record macro' })
vim.keymap.set('n', '<c-q>', 'Q', { noremap = true, desc = 'Replay last register' })

-- Command to close all buffer except for current
vim.api.nvim_create_user_command('BufOnly', function()
  vim.cmd 'silent! execute "%bd|e#|bd#"'
end, {})
-- Buffers
keymap.set('n', '<leader>be', "<cmd>bufdo if empty(bufname('%'))|bw|endif<CR>", { desc = 'Close all empty buffers' }) -- close current split window
-- keymap.set('n', '<leader>bo', '<cmd>BufOnly<CR>', { desc = 'Close other buffers' }) -- close current split window

-- Go to end or start of line ignoring empty spaces and new line
keymap.set('n', '0', '_', { desc = 'Go to end of line' })
keymap.set('n', '$', 'g_', { desc = 'Go to end of line' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
-- Yank into system clipboard
-- vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y') -- yank motion
-- vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y') -- yank line

-- Delete into system clipboard
-- vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d') -- delete motion
-- vim.keymap.set({ 'n', 'v' }, '<leader>D', '"+D') -- delete line

-- Paste from system clipboard
-- vim.keymap.set('n', '<leader>p', '"+p') -- paste after cursor
-- vim.keymap.set('n', '<leader>P', '"+P') -- paste before cursor
