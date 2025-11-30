return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    {
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
  },
  config = function()
    -- local capabilities = require('blink.cmp').get_lsp_capabilities()
    -- vim.lsp.config('*', { capabilities = capabilities })
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>d', vim.diagnostic.open_float, 'Show Line Diagnostic')
        map('[d', function()
          vim.diagnostic.jump { count = -1, float = true }
        end, 'Previous Diagnostic')
        map(']d', function()
          vim.diagnostic.jump { count = 1, float = true }
        end, 'Next Diagnostic')
        map('K', vim.lsp.buf.hover, 'Show hover')
        map('<leader>rs', ':LspRestart<CR>', 'Restart LSP')

        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = false,
      -- virtual_text = {
      --
      --   source = 'if_many',
      --   spacing = 2,
      --   format = function(diagnostic)
      --     local diagnostic_message = {
      --       [vim.diagnostic.severity.ERROR] = diagnostic.message,
      --       [vim.diagnostic.severity.WARN] = diagnostic.message,
      --       [vim.diagnostic.severity.INFO] = diagnostic.message,
      --       [vim.diagnostic.severity.HINT] = diagnostic.message,
      --     }
      --     return diagnostic_message[diagnostic.severity]
      --   end,
      -- },
    }
  end,
}
