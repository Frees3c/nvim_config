require("telescope").load_extension("refactoring")
require("refactoring").setup({})

vim.api.nvim_set_keymap(
    "v",
    "<Leader>re",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    {noremap = true, silent = true, expr = false}
)

vim.api.nvim_set_keymap(
    "v",
    "<Leader>rf",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    {noremap = true, silent = true, expr = false}
)

vim.api.nvim_set_keymap(
    "v",
    "<Leader>rv",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    {noremap = true, silent = true, expr = false}
)

vim.api.nvim_set_keymap(
    "v",
    "<Leader>ri",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    {noremap = true, silent = true, expr = false}
)
