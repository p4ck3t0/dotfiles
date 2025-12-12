-- Last Modified: 2023-09-01

-- Lazy Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Start setup
lazy.setup({
  spec = {

		-- Colorscheme
    {
      "navarasu/onedark.nvim",
    },
    -- Copilot
    {
      "github/copilot.vim",
    },
    -- Quick  Comment
    {
      "tpope/vim-commentary",
    },
    -- Telescope Filebrowser
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons"
      }
    },
    -- Treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      build = ':TSUpdate'
    },
    -- Mason
    {
      "williamboman/mason.nvim"
    },
    -- LSP
    {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "onsails/lspkind.nvim",
    },
    {
      "j-hui/fidget.nvim",
    },
    {
      'echasnovski/mini.nvim',
      version = '*'
    },
    -- Fzf
    {
      "vijaymarupudi/nvim-fzf",
    },
    -- Bufferline
    {
      "akinsho/bufferline.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
    },
    -- Compleation
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-emoji",
      }
    },
    -- Molten
    {
      "benlubas/molten-nvim",
      "3rd/image.nvim",
      "GCBallesteros/jupytext.nvim"
    },
    {
      "willothy/wezterm.nvim",
       config = true
    },
    {
      "quarto-dev/quarto-nvim",
      ft = { "quarto", "markdown" },
      dependencies = {
        "jmbuhr/otter.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
    },
  }
})

require('mini.notify').setup()
