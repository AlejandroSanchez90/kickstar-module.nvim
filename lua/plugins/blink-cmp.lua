return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = {
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('luasnip.loaders.from_vscode').lazy_load {
              paths = { vim.fn.stdpath 'config' .. '/snippets' },
            }
          end,
        },
      },
      opts = {},
    },
    'folke/lazydev.nvim',
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'none',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<C-y>'] = { 'accept', 'fallback' },

      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      -- Navigate to the previous suggestion or cancel completion if currently on the first one.
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      menu = {
        draw = {
          treesitter = { 'lsp' },
          columns = {
            { 'label', gap = 2 },
            { 'kind_icon', gap = 1, 'kind' },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          max_width = math.floor(vim.o.columns * 0.4),
          max_height = math.floor(vim.o.lines * 0.5),
        },
      },
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
    },

    signature = { enabled = true },

    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
      providers = {
        lazydev = {
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}
