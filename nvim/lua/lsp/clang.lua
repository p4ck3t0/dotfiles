-- Last Modified: 2023-10-29

require('lspconfig').clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach
})
