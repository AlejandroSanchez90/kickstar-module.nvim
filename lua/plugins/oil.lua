return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    prompt_save_on_select_new_entry = false,
    keymaps = {
      ['q'] = { 'actions.close', mode = 'n' },

      ['<C-s>'] = {},
    },
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    { '<leader>e', '<cmd>Oil --float<cr>', mode = { 'n' }, desc = 'File explorer' },
  },
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
