return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'cssls',
        'emmet_language_server',
        'lua_ls',
        'jsonls',
        'vtsls',
        'tailwindcss',
        -- 'html',
        'marksman',
        -- 'emmet_ls',
      },
    },
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = {
          ui = {
            icons = {
              package_installed = '✓',
              package_pending = '➜',
              package_uninstalled = '✗',
            },
          },
        },
      },
      'neovim/nvim-lspconfig',
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'stylua',
        'markdownlint',
      },
    },
    dependencies = {
      'mason-org/mason.nvim',
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
