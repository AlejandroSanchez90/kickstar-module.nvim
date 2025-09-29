return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
      formatters_by_ft = {
        css = { 'prettier' },
        html = { 'prettier' },
        lua = { 'stylua' },
        json = { 'prettier' },
        javascript = { 'prettier', stop_after_first = true },
        typescript = { 'prettier', stop_after_first = true },
        javascriptreact = { 'prettier', stop_after_first = true },
        typescriptreact = { 'prettier', stop_after_first = true },
        python = { 'ruff_format', 'ruff_organize_imports' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
