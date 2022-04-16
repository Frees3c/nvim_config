require("indent_blankline").setup {
    filetype_exclude = {
        "vimwiki",
        "man",
        "gitmessengerpopup",
        "diagnosticpopup",
        "lspinfo",
        "packer",
        "checkhealth",
        "TelescopePrompt",
        "TelescopeResults",
        ""
    },
    buftype_exclude = {"terminal"},
    space_char_blankline = " ",
    show_foldtext = false,
    strict_tabs = true,
    debug = true,
    disable_with_nolist = true,
    max_indent_increase = 1,
    show_current_context = true,
    show_current_context_start = true
}

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
