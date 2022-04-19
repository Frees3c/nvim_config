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
require("Plugins")
require("lsp")
require("keymappings")
require("colorscheme")
require("autocmds")
require("dbg")
require("treesitter")

-- Plugins
require("Plugins.telescope")
require("Plugins.nvimtree")
require("Plugins.lualine")
require("Plugins.bufferline")
require("Plugins.comment")
require("Plugins.colorizer")
require("Plugins.gitsigns")
require("Plugins.truezen")
require("Plugins.renamer")
require("Plugins.autosession")

-- LSP
require("lsp.lua-lsp")
