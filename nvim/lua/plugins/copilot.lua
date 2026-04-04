-- Last Modified: 2024-01-07

vim.g.copilot_filetypes = {
  yaml = 'v:true',
  rust = 'v:true'
}
vim.keymap.set("n", "<localleader>xx", ":Copilot disable<CR>", { desc = "disable Copilot", silent = true })
