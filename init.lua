-- ##########################################################################
--[[
              _         _  _       _
             (_) _ __  (_)| |_    | | _   _   __ _
             | || '_ \ | || __|   | || | | | / _` |
             | || | | || || |_  _ | || |_| || (_| |
             |_||_| |_||_| \__|(_)|_| \__,_| \__,_|

--]]
-- #########################################################################

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
require("Plugins.cmp")
require("Plugins.telescope")
require("Plugins.nvimtree")
require("Plugins.lualine")
-- require("Plugins.lspsaga")
-- require("Plugins.dashboard")
require("Plugins.autopairs")
require("Plugins.bufferline")
require("Plugins.comment")
require("Plugins.colorizer")
require("Plugins.gitsigns")
require("Plugins.truezen")
require("Plugins.sessions")
require("Plugins.renamer")

-- LSP
require("lsp.lua-lsp")
require("lsp.python-ls")
