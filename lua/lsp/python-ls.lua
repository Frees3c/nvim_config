-- npm i -g pyright
require'lspconfig'.pyright.setup {
    cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    on_attach = require'lsp'.on_attach,
	filetypes = {"python"},
    -- handlers = {
    --     ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    --         virtual_text = true,
    --         signs = true,
    --         underline = true,
    --         update_in_insert = true
    --     })
    -- },
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

