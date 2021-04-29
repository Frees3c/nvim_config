vim.cmd [[augroup Autogroup]]


vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank {higroup="HighlightedyankRegion", timeout=150}]]


vim.cmd [[augroup END]]
