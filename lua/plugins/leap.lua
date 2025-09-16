return {
  'ggandor/leap.nvim',
  config = function()
    require('leap').add_default_mappings()
    vim.keymap.set({ 'n', 'o' }, 'g/', function()
      require('leap.remote').action { jumper = '/' }
    end)
    vim.keymap.set({ 'n', 'o' }, 'g?', function()
      require('leap.remote').action { jumper = '?' }
    end)
  end,
  lazy = false,
}
