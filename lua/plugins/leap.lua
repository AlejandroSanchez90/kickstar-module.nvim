return {
  url = 'https://codeberg.org/andyg/leap.nvim',
  config = function()
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
    vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
    vim.keymap.set({ 'n', 'o' }, 'g/', function()
      require('leap.remote').action { jumper = '/' }
    end)
    vim.keymap.set({ 'n', 'o' }, 'g?', function()
      require('leap.remote').action { jumper = '?' }
    end)
    require('leap').opts.preview = function(ch0, ch1, ch2)
      return not (ch1:match '%s' or (ch0:match '%a' and ch1:match '%a' and ch2:match '%a'))
    end
    require('leap.user').set_repeat_keys('<enter>', '<backspace>')
  end,
  lazy = false,
}
