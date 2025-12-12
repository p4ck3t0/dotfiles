-- Last Modified: 2023-10-03

-- local ruff_on_attach = function(client, bufnr)
--   if client.name == 'ruff' then
--     -- Disable hover in favor of Pyright
--     client.server_capabilities.hoverProvider = false
--   end
-- end

-- require('lspconfig').ruff.setup({
--     capabilities = capabilities,
--     on_attach = ruff_on_attach
-- })

require('lspconfig').pyright.setup({
    settings = {
      pyright = {
        autoImportCompletions = true,
      }

    },
    capabilities = capabilities,
    on_attach = on_attach
})
