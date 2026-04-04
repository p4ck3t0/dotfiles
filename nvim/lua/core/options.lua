-- Last Modified: 2023-09-01

local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-- General
opt.clipboard = 'unnamedplus' -- Use system clipboard
opt.swapfile = true           -- In case of crash, save swap file
opt.mouse = nil               -- Disable mouse support
opt.cursorline = true         -- Highlight current line

-- NeoVim UI
opt.number = true       -- Show line numbers
opt.splitright = true   -- Vertical split to the right
opt.splitbelow = true   -- Horizontal split to the bottom
opt.linebreak = true    -- Wrap on word boundary

-- Indentation
opt.expandtab = true    -- Use spaces instead of tabs
opt.tabstop = 4         -- 1 tab == 4 spaces
opt.shiftwidth = 4      -- Indent by 4 spaces when using >>, <<, ==, etc. or tab

-- Memory, CPU
opt.hidden = true       -- Enable background buffers
opt.history = 10000     -- Remember 1000 commands
opt.lazyredraw = true   -- Don't redraw while executing macros
opt.synmaxcol = 3000    -- Don't syntax highlight long lines
opt.updatetime = 100    -- Faster completion

-- Search
opt.incsearch = true    -- Show search matches as you type
opt.hlsearch = true     -- Highlight search matches

-- Completion
opt.completeopt = 'menuone,noselect' -- Completion options
opt.shortmess = opt.shortmess + 'c'  -- Don't show completion messages

-- Disable built-in plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

-- File Settings
opt.swapfile = true                                        -- Enable swap files
opt.undofile = true                                        -- Enable undo files
opt.undolevels = 10000                                     -- Set undo levels
opt.backupdir=os.getenv("HOME").."/.config/nvim/.backup//" -- Set backup directory
opt.directory=os.getenv("HOME").."/.config/nvim/.swap//"   -- Set swap directory
opt.undodir=os.getenv("HOME").."/.config/nvim/.undo//"     -- Set undo directory
opt.viewdir=os.getenv("HOME").."/.config/nvim/.views//"    -- Set view directory

-- Sign Column
opt.signcolumn = 'auto'  -- Always show sign column

-- Disable virtual text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
    }
  )

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' 󰋽',
            [vim.diagnostic.severity.HINT] = ' ',
        },
        texthl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
    }
})

vim.g.python3_host_prog="/Users/p4ck3t0/.local/share/virtualenvs/venv-cjiBozxU/bin/python"
