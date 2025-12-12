-- Last Modified: 2023-09-02

require('lspconfig').rust_analyzer.setup({
    settings = {
        ['rust-analyzer'] = {
            procMacro = {
                enable = true
            },
            checkOnSave = {
                command = 'clippy'
            },
            cargo = {
                features = 'all'
            },
            diagnostics = {
                enable = true,
                enableExperimental = true
            },
            capabilities = capabilities,
        }
    }
})
