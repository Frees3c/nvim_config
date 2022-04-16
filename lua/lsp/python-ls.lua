-- npm i -g pyright
require "lspconfig".pyright.setup {
    capabilities = capabilities,
    cmd = {DATA_PATH .. "/lsp_servers/python/node_modules/.bin/pyright-langserver", "--stdio"},
    root_dir = function()
        return vim.loop.cwd()
    end,
    on_attach = require "lsp".on_attach,
    filetypes = {"python"},
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            {
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false
            }
        )
    },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = true,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true
            }
        }
    }
}
