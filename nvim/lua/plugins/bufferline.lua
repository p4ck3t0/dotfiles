-- Last Modified: 2023-09-02

require('bufferline').setup{
  options = {
    mode = 'buffers',
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
      return s
    end,
    close_command = "bdelete! %d",
    color_icons = true,
    show_buffer_close_icon = false,
    show_close_icon = false,
    close_icon = '',
    buffer_close_icon = '',
    indicator = {
      style = 'underline',
    },
    modified_icon = '',
  }
}
