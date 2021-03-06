require("utils").create_augroups(
    {
        setup = {
            -- Highlight text after yanking
            {"TextYankPost", "*", [[lua require('vim.highlight').on_yank({ higroup = 'Substitute', timeout = 200 })]]},
            -- Hide cursorline in insert mode
            {"InsertLeave,WinEnter", "*", "set cursorline"},
            {"InsertEnter,WinLeave", "*", "set nocursorline"},
            -- Automatically close Vim if the quickfix window is the only one open
            {"WinEnter", "*", [[if winnr('$') == 1 && &buftype == 'quickfix' | q | endif]]},
            -- Restore cursor position when opening file
            {"BufRead", "*", [[call setpos(".", getpos("'\""))]]},
            -- Format Json files using `jq`
            {"BufWritePost", "*.json", ":%!jq ."}
        }
    }
)
