return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      icons = {

        mappings = vim.g.have_nerd_font,

        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      spec = {
        { '<leader>c', group = 'Code', mode = { 'n', 'x' } },
        { '<leader>f', group = 'Find', mode = { 'n', 'x' } },
        { '<leader>o', group = 'Operators' },
        { '<leader>b', group = 'Buffers' },
        { '<leader>n', group = 'Misc' },
        { '<leader>w', group = 'Windows' },
        { '<leader>r', group = 'LSP' },
        { '<leader>w', group = 'Windows' },
        { '<leader>x', group = 'Trouble' },
        { '<leader>t', group = 'Tabs' },
        { '<leader>h', group = 'Hunk', mode = { 'n', 'v' } },
        { '<leader>g', group = 'Git' },
        { '<leader>gc', group = 'Copilot Actions' },
      },
    },
  },
}
