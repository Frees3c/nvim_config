require "lsp.handlers"
-- require "lsp.formatting"
local lspconfig = require "lspconfig"
local utils = require "utils"
local M = {}

vim.lsp.protocol.CompletionItemKind = {
    " [text]",
    " [method]",
    " [function]",
    " [constructor]",
    "ﰠ [field]",
    " [variable]",
    " [class]",
    " [interface]",
    " [module]",
    " [property]",
    " [unit]",
    " [value]",
    " [enum]",
    " [key]",
    " [snippet]",
    " [color]",
    " [file]",
    " [reference]",
    " [folder]",
    " [enum member]",
    " [constant]",
    " [struct]",
    "⌘ [event]",
    " [operator]",
    "♛ [type]"
}

M.symbol_kind_icons = {
    Function = "",
    Method = "",
    Variable = "",
    Constant = "",
    Interface = "",
    Field = "ﰠ",
    Property = "",
    Struct = "",
    Enum = "",
    Class = "",
    Snippet = " "
}

M.symbol_kind_colors = {
    Function = "green",
    Method = "green",
    Variable = "blue",
    Constant = "red",
    Interface = "cyan",
    Field = "blue",
    Property = "blue",
    Struct = "cyan",
    Enum = "yellow",
    Class = "red",
    Snippet = "green"
}

vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '', texthl = 'LspDiagnosticsDefaultError' }
)
vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = '', texthl = 'LspDiagnosticsDefaultWarning' }
)
vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = '', texthl = 'LspDiagnosticsDefaultInformation' }
)
vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '', texthl = 'LspDiagnosticsDefaultHint' }
)

local on_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[augroup Format]]
    vim.cmd [[autocmd! * <buffer>]]
    -- vim.cmd [[autocmd BufWritePost <buffer> lua require'lsp.formatting'.format()]]
    vim.cmd [[autocmd bufwritepre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.cmd [[augroup END]]
  end
    if client.resolved_capabilities.goto_definition then
        utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {buffer = true})
    end
    if client.resolved_capabilities.hover then
        utils.map("n", "<CR>", "<cmd>lua vim.lsp.buf.hover()<CR>", {buffer = true})
    end
    if client.resolved_capabilities.find_references then
        utils.map(
            "n",
            "<Space>*",
            ":lua require('lists').change_active('Quickfix')<CR>:lua vim.lsp.buf.references()<CR>",
            {buffer = true}
        )
    end
    if client.resolved_capabilities.rename then
        utils.map("n", "<C-a>", "<cmd>lua require'lsp.rename'.rename()<CR>", {silent = true, buffer = true})
    end

    utils.map("n", "<Leader><CR>", "<cmd>lua require'lsp.diagnostics'.line_diagnostics()<CR>", {buffer = true})
end

function _G.antiveLSP()
    local servers = {}
    for _, lsp in pairs(vim.lsp.get_active_clients()) do
        table.insert(servers, {name = lsp.name, id = lsp.id})
    end
    _G.P(servers)
end
function _G.bufferActiveLSP()
    local servers = {}
    for _, lsp in pairs(vim.lsp.buf_get_clients()) do
        table.insert(servers, {name = lsp.name, id = lsp.id})
    end
    _G.P(servers)
end

lspconfig.clangd.setup {
    cmd = {DATA_PATH .. "/lsp_servers/clangd/clangd"},
    on_attach = on_attach,
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
    }
}

-- https://github.com/golang/tools/tree/master/gopls
lspconfig.gopls.setup {
    cmd = {DATA_PATH .. "/lsp_servers/go/gopls"},
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

-- lspconfig.pyright.setup {on_attach = on_attach}

-- https://github.com/theia-ide/typescript-language-server
lspconfig.tsserver.setup {
    filetypes = {"javascript", "typescript", "typescriptreact"},
    -- Start tsserver on any JS/TS file, regardless of directory eg. package.json, .git
    root_dir = function()
        return vim.loop.cwd()
    end,
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        require "nvim-lsp-ts-utils".setup {}
        on_attach(client)
    end
}

-- https://github.com/iamcco/vim-language-server
lspconfig.vimls.setup {
  on_attach = on_attach,
  cmd = {DATA_PATH .. "/lsp_servers/vim/node_modules/vim-language-server/bin/build-docs.js"},
}

-- https://github.com/vscode-langservers/vscode-json-languageserver
lspconfig.jsonls.setup {
    cmd = {DATA_PATH .. "/lsp_servers/jsonls/node_modules/vscode-langservers-extracted/bin/vscode-json-language-server"},
    on_attach = on_attach,
    -- cmd = {
    --     DATA_PATH .. "/lsp_servers/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
    --     "--stdio"
    -- }
    -- cmd = {"vscode-json-languageserver", "--stdio"}
}

-- https://github.com/redhat-developer/yaml-language-server
lspconfig.yamlls.setup {
  cmd = {DATA_PATH .. "/lsp_servers/yaml/node_modules/yaml-language-server/bin/yaml-language-server"},
  on_attach = on_attach
}

-- https://github.com/joe-re/sql-language-server
lspconfig.sqlls.setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-css-languageserver-bin
lspconfig.cssls.setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-html-languageserver-bin
lspconfig.html.setup {
  cmd = {DATA_PATH .. "/lsp_servers/html/node_modules/vscode-langservers-extracted/bin/vscode-html-language-server"},
  on_attach = on_attach
}

-- https://github.com/bash-lsp/bash-language-server
lspconfig.bashls.setup {
  on_attach = on_attach,
 }

-- https://github.com/rcjsuen/dockerfile-language-server-nodejs
lspconfig.dockerls.setup {
  on_attach = on_attach,
  cmd = {DATA_PATH .. "/lsp_servers/dockerfile/node_modules/dockerfile-language-server-nodejs/bin/docker-langserver"},
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  root_dir= function()
        return vim.loop.cwd()
    end,
  cmd = {DATA_PATH .. "/lsp_servers/rust/rust-analyzer"},
  settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          enable = true,
          allFeatures = true,
          }
        }
      }
    }

-- npm install -g intelephense
lspconfig.intelephense.setup {on_attach = on_attach}

-- https://solargraph.org/
lspconfig.solargraph.setup {
    root_dir = function()
        return vim.loop.cwd()
    end,
    on_attach = on_attach
}

-- https://github.com/hashicorp/terraform-ls
lspconfig.terraformls.setup {
    on_attach = on_attach,
    cmd = {"terraform-ls", "serve"},
    filetypes = {"tf"}
}

--
-- Texlab not attaching to buffer...... why?!
--
lspconfig.texlab.setup {
    cmd = {DATA_PATH .. "/lsp_servers/latex/texlab"},
    on_attach = on_attach,
    filetypes = {"tex", "bib"}
}

local vint = require "efm/vint"
local luafmt = require "efm/luafmt"
local golint = require "efm/golint"
local goimports = require "efm/goimports"
local black = require "efm/black"
local isort = require "efm/isort"
local flake8 = require "efm/flake8"
local mypy = require "efm/mypy"
local prettier = require "efm/prettier"
local eslint = require "efm/eslint"
local shellcheck = require "efm/shellcheck"
local terraform = require "efm/terraform"
local misspell = require "efm/misspell"
local pandoc = require "efm/pandoc"
local markdownlint = require "efm/markdownlint"
-- local rustfm = require "efm/rustfm"

-- https://github.com/mattn/efm-langserver
lspconfig.efm.setup {
    cmd = {DATA_PATH .. "/lsp_servers/efm/efm-langserver"},
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    filetypes = {
        -- "lua",
        -- "tex",
        "python",
        "javascriptreact",
        "javascript",
        "sh",
        "html",
        "css",
        "json",
        "yaml",
        "markdown",
        "rust"
    },
    settings = {
        -- rootMarkers = {".git/"},
        languages = {
            ["="] = {misspell},
            vim = {vint},
            lua = {luafmt},
            go = {golint, goimports},
            python = {black},
            -- python = {flake8},
            typescript = {prettier, eslint},
            javascript = {prettier, eslint},
            typescriptreact = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            yaml = {prettier},
            json = {prettier},
            html = {prettier},
            scss = {prettier},
            css = {prettier},
            markdown = {pandoc, markdownlint},
            -- rust = {rustfm},
            sh = {shellcheck},
            tf = {terraform}
        }
    }
}

return M
