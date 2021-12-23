local sumneko_root_path = DATA_PATH .. "/lsp_servers/sumneko_lua"
local sumneko_binary = sumneko_root_path .. "/extension/server/bin/lua-language-server"

require "lspconfig".sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/extension/server/main.lua"},
    on_attach = require "lsp".common_on_attach,
    settings = {
        Lua = {
            runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
            completion = {keywordSnippet = "Disable"},
            diagnostics = {
                enable = true,
                globals = {
                    "vim",
                    "describe",
                    "it",
                    "before_each",
                    "after_each"
                }
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            }
        }
    }
}
