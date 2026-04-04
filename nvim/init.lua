-- Last Modified: 2023-09-02

-- Init
local g = vim.g       -- Global variables

-- Set leader
g.mapleader = ' '

-- Require stuff
require('core/lazy')
require('plugins/telescope')
require('plugins/mason')
require('plugins/mason-lspconfig')
require('plugins/bufferline')
require('plugins/lspkind')
require('plugins/molten')
-- require('plugins/fidget')
require('plugins/copilot')
require('plugins/nvim-cmp')
require('plugins/treesitter')
require('lsp/rust-analyzer')
require('lsp/python')
require('lsp/marksman')
require('lsp/gopls')
require('lsp/clang')
require('lsp/terraform-ls')
require('lsp/typescript-ls')
require('lsp/nix')
require('lsp/jsonlsp')
require('core/options')
require('core/keymaps')

-- Define autocommands
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Remove trailing whitespace on save
autocmd('BufWritePre', {
    pattern = '*',
    command = ':%s/\\s\\+$//e'
})

-- Don't auto-comment on newline
autocmd('BufEnter', {
    pattern = '*',
    command = 'set fo-=c fo-=r fo-=o'
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript', 'yaml', 'lua'},
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Colorscheme
require('onedark').setup {
    style = 'darker',
    term_colors = false,
}
require('onedark').load()
