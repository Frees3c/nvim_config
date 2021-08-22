if vim.fn.has("mac") == 1 then
    vim.g.python3_host_prog = "/usr/local/bin/python3"
else
    vim.g.python3_host_prog = "/usr/bin/python"
end

require("utils")
require("settings")
require("plugins")
require("lsp")
require("keymappings")
require("colorscheme")
require("autocmds")
require("dbg")
require("treesitter")

-- Plugins
require("Plugins.lualine")
require("Plugins.dashboard")
require("Plugins.compe")
require("Plugins.autopairs")
require("Plugins.bufferline")
require("Plugins.telescope")
require("Plugins.comment")
require("Plugins.colorizer")
require("Plugins.gitsigns")
require("Plugins.nvimtree")
require("Plugins.truezen")
require("Plugins.tabout")
require("Plugins.sniprun")
require("Plugins.fterm")

-- LSP
require("lsp.lua-lsp")
require("lsp.python-ls")
