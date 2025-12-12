-- Last Change: 2025-01-19

-- Convert Jupyter to Markdown
require("jupytext").setup({
    style = "markdown",
    output_extension = "md",
    force_ft = "markdown",
})

-- Setup Images
require('wezterm').setup{}

-- require("image").setup({
--   backend = "ueberzug",
--   integrations = {
--     markdown = {
--       enabled = true,
--       clear_in_insert_mode = false,
--       download_remote_images = true,
--       only_render_image_at_cursor = false,
--       filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
--     }
--   },
--   max_width = 100, -- tweak to preference
--   max_height = 12, -- ^
--   max_height_window_percentage = math.huge, -- this is necessary for a good experience
--   max_width_window_percentage = math.huge,
--   window_overlap_clear_enabled = false,
--   window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
-- })

-- vim.g.molten_image_provider = "wezterm"
vim.g.molten_image_provider = "wezterm"
vim.g.molten_auto_open_output = false
vim.g.molten_virt_text_output = false
vim.g.molten_virt_lines_off_by_1 = true
vim.g.molten_split_size	= 28
vim.g.molten_split_direction = "bottom"

vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true })
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true })
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

-- if html outputs:
vim.keymap.set("n", "<localleader>mx", ":MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })

local quarto = require("quarto")
quarto.setup({
    lspFeatures = {
        -- NOTE: put whatever languages you want here:
        languages = { "python" },
        chunks = "all",
        closePreviewOnExit = true,
        diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
        },
        completion = {
            enabled = true,
        },
    },
    keymap = {
        -- NOTE: setup your own keymaps:
        hover = "H",
        definition = "gd",
        rename = "<leader>rn",
        references = "gr",
        format = "<leader>gf",
    },
    codeRunner = {
        enabled = true,
        default_method = "molten",
    },
})

local runner = require("quarto.runner")
vim.keymap.set("n", "<localleader>rc", runner.run_cell,  { desc = "run cell", silent = true })
vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<localleader>rA", runner.run_all,   { desc = "run all cells", silent = true })
vim.keymap.set("n", "<localleader>rl", runner.run_line,  { desc = "run line", silent = true })
vim.keymap.set("v", "<localleader>r",  runner.run_range, { desc = "run visual range", silent = true })
vim.keymap.set("n", "<localleader>RA", function()
  runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })
