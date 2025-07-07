return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim',
  },
  version = '1.*',
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
      -- menu = {
      --   draw = {
      --     components = {
      --       kind_icon = {
      --         text = function(ctx)
      --           local icon = ctx.kind_icon
      --           if vim.tbl_contains({ 'Path' }, ctx.source_name) then
      --             local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
      --             if dev_icon then
      --               icon = dev_icon
      --             end
      --           else
      --             icon = require('lspkind').symbolic(ctx.kind, {
      --               mode = 'symbol',
      --             })
      --           end
      --
      --           return icon .. ctx.icon_gap
      --         end,
      --         highlight = function(ctx)
      --           local hl = ctx.kind_hl
      --           if vim.tbl_contains({ 'Path' }, ctx.source_name) then
      --             local dev_icon, dev_hl = require('nvim-web-devicons').get_icon(ctx.label)
      --             if dev_icon then
      --               hl = dev_hl
      --             end
      --           end
      --           return hl
      --         end,
      --       },
      --     },
      --   },
      --   border = 'single',
      -- },
      -- documentation = { auto_show = true, window = { border = 'single' } },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = 'none',
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

    signature = { enabled = true, window = { border = 'single' } },

    -- snippets = {
    --   expand = function(snippet)
    --     require('mini.snippets').default_insert { body = snippet }
    --   end,
    -- },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}
