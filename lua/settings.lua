-- ###################################################################################
--		  _____        __   __   _
--		 / ___/ ___   / /_ / /_ (_)____   ____ _ _____
--		 \__ \ / _ \ / __// __// // __ \ / __ `// ___/
--		___/ //  __// /_ / /_ / // / / // /_/ /(__  )
--	   /____/ \___/ \__/ \__//_//_/ /_/ \__, //____/
--									   /____/
--
-- ###################################################################################

-- vim.cmd("set shortmess+=c") -- Don't pass messages to |ins-completion-menu|.
vim.o.autoindent = true
vim.o.autoread = true
vim.o.autowrite = true
vim.o.background = "dark"
vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 2
vim.wo.cursorline = true
vim.o.diffopt = "vertical"
vim.o.encoding = "utf-8"
vim.bo.expandtab = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.lazyredraw = true
vim.o.mouse = "a"
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.swapfile = false
vim.o.scrolloff = 7
vim.o.shiftwidth = 4
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.sidescroll = 5
vim.wo.signcolumn = "yes:2"
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.spell = true
vim.o.splitright = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.timeoutlen = 500 -- By default timeoutlen is 1000 ms
vim.o.termguicolors = true
vim.o.undodir = vim.fn.expand("~/.config/nvim/backups")
vim.o.undofile = true
vim.o.updatetime = 150
vim.wo.wrap = false
vim.o.writebackup = false

vim.g.markdown_fenced_languages = {
    "vim",
    "python",
    "lua",
    "bash=sh",
    "javascript",
    "typescript",
    "yaml",
    "json",
    "gql=graphql",
    "graphql"
}

