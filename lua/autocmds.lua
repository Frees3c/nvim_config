vim.cmd [[augroup Autogroup]]

vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank ]]

vim.cmd [[ autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |   exe "normal! g`\"" | endif ]]

vim.cmd [[augroup END]]
