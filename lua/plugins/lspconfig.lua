return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'saghen/blink.cmp',
      {
        'pmizio/typescript-tools.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
        opts = {},
      },
    },
    config = function()
      require('mason').setup {
        registries = { 'github:crashdummyy/mason-registry', 'github:mason-org/mason-registry' },
      }

      require('mason-tool-installer').setup {
        ensure_installed = {
          'css-lsp',
          'emmet-language-server',
          'eslint_d',
          'graphql-language-service-cli',
          'html-lsp',
          'lua-language-server',
          'markdownlint',
          'marksman',
          'prettier',
          'prisma-language-server',
          'stylua',
          'tailwindcss-language-server',
        },
      }

      require('mason-lspconfig').setup {}

      local map = function(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
      end

      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('<leader>d', vim.diagnostic.open_float, 'Show Line Diagnostic')
      map('[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
      map(']d', vim.diagnostic.goto_next, 'Next Diagnostic')
      map('K', vim.lsp.buf.hover, 'Next Diagnostic')
      map('<leader>rs', ':LspRestart<CR>', 'Restart LSP')
      map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = vim.api.nvim_get_current_buf() })
      vim.diagnostic.config {
        signs = {
          numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
          },
          text = {
            [vim.diagnostic.severity.ERROR] = 'X',
            [vim.diagnostic.severity.HINT] = '?',
            [vim.diagnostic.severity.INFO] = 'I',
            [vim.diagnostic.severity.WARN] = '!',
          },
        },
        update_in_insert = true,
        virtual_text = { current_line = true },
        -- virtual_lines = { current_line = false },
      }
    end,
  },
}
