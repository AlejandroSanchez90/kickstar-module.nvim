return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'
    local lazy_status = require 'lazy.status'
    local function isRecording()
      local reg = vim.fn.reg_recording()
      if reg == '' then
        return ''
      end -- not recording
      return 'Macro: ' .. reg
    end

    local function isRecordingActive()
      return vim.fn.reg_recording() ~= ''
    end

    lualine.setup {
      options = {
        theme = 'catppuccin',
      },
      sections = {
        lualine_x = {
          {
            isRecording,
            cond = isRecordingActive,
            color = { fg = '#ff6666' },
          },
          {

            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#ff9e64' },
          },
        },
        lualine_c = { { 'filename', path = 1, file_status = true } },
      },
      inactive_sections = {
        lualine_c = { { 'filename', path = 1, file_status = true } },
      },
    }
  end,
}
