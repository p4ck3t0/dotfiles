-- Last Modified: 2024-01-26

require('lspconfig').ts_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      completions = {
        completeFunctionCalls = true
    }
  }
})
