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

    local arrow_status = require 'arrow.statusline'
    local function isRecordingActive()
      return vim.fn.reg_recording() ~= ''
    end
    lualine.setup {
      options = {
        theme = 'tokyonight',
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
        lualine_c = {

          -- arrow per file
          {
            function()
              return arrow_status.text_for_statusline_with_icons()
            end,
            cond = function()
              return arrow_status.is_on_arrow_file() ~= nil
            end,
            color = { fg = '#51cf66', gui = 'bold' },
          },
          { 'filename', path = 1, file_status = true, color = { gui = 'bold' } },
        },
      },
      inactive_sections = {
        lualine_c = { { 'filename', path = 0, file_status = true } },
      },
    }
  end,
}
