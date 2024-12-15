-- tailwind-tools.lua
return {
  'luckasRanarison/tailwind-tools.nvim',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {
    server = {
      override = true,
      settings = {},
      on_attach = function(client, bufnr) end,
    },
    document_color = {
      enabled = true,
      kind = 'inline',
      inline_symbol = 'C ',
      debounce = 200,
    },
    conceal = {
      enabled = true,
      min_length = nil,
      symbol = '󱏿',
      highlight = {
        fg = '#38BDF8',
      },
    },
  },
}
