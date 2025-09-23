return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {
    settings = {
      -- Performance optimizations for large projects
      tsserver_max_memory = 8192,
      tsserver_plugins = {},
      -- Exclude node_modules and other heavy directories
      tsserver_file_preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportStatements = true,
        includeInlayParameterNameHints = 'literals',
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayFunctionLikeReturnTypeHints = false,
        includeInlayEnumMemberValueHints = false,
      },
      -- Exclude patterns for file watching
      watchOptions = {
        excludeDirectories = {
          '**/node_modules',
          '**/.git',
          '**/dist',
          '**/build',
          '**/.next',
          '**/coverage',
          '**/.nyc_output',
        },
      },
      -- TypeScript server options
      typescript = {
        preferences = {
          includePackageJsonAutoImports = 'off',
        },
      },
    },
  },
}