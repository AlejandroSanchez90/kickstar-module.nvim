return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        -- python = { 'ruff' }, -- Disabled to avoid duplicate errors with Pyright LSP
        -- javascript = { 'eslint' },
        -- typescript = { 'eslint' },
        -- javascriptreact = { 'eslint' },
        -- typescriptreact = { 'eslint' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.opt_local.modifiable:get() then
            -- lint.try_lint()
            pcall(lint.try_lint)
          end
        end,
      })
    end,
  },
}
