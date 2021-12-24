local nvimtree = require("nvim-tree")

local view = require("nvim-tree.view")
_G.NvimTreeConfig = {}

vim.g.nvim_tree_hide_dotfiles = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_auto_ignore_ft = {"startify", "dashboard"} --empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    lsp = 1
}
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "●",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    },
    diagnostics = {
        hint = "",
        info = "",
        warning = "",
        error = ""
    }
}

nvimtree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    auto_close = true,
    diagnostics_enable = true,
    -- lsp_diagnostics = true,
    hijack_cursor = true,
    update_focused_file = {
        enable = true,
        update_cwd = false
    },
    view = {
        width = 32,
        side = "left",
        auto_resize = true
    }
}
