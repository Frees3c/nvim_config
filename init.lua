if vim.fn.has("mac") == 1 then
    vim.g.python3_host_prog = "/usr/local/bin/python3"
else
    vim.g.python3_host_prog = "/usr/bin/python"
end

require("utils")
require("settings")
require("plugins")
require("globals")
require("lsp")
require("keymappings")
require("colorscheme")
require("nvim-galaxyline")

-- Plugins
require("nvim-dashboard")
require("autocmds")
require("nvim-compe")
require("autopairs")
require("treesitter")
require("nvim-bufferline")
require("nvim-telescope")
require("nvim-comment")
require("nvim-colorizer")
require("nvim-gitsigns")
require("nvim-nvimtree")

-- LSP
require("lsp.lua-lsp")
