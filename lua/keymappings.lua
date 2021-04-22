local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

-- Map leader to space
vim.g.mapleader = ' '

-- TrueZen
key_mapper("n", '<F12>', ':TZAtaraxis<CR>')
-- Telescope
key_mapper('n', '<leader>f', ':Telescope find_files<CR>')
key_mapper('n', '<leader>fl', ':Telescope live_grep<CR>')
key_mapper('n', '<leader>fb', ':Telescope buffers<CR>')
key_mapper('n', '<leader>fh', ':Telescope help_tags<CR>')
key_mapper('n', '<leader>fg', ':Telescope git_files<CR>')

-- Clear highlights
key_mapper('n', '<leader>h', ':noh<CR>')

-- jk to escape
key_mapper('i', 'jk', '<Esc>')

-- Nvim Tree Toggle
key_mapper('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Better indentaion (tabbing)
key_mapper('v', '>', '>gv')
key_mapper('v', '<', '<gv')

-- jk as Escape key
key_mapper('i', 'kj', '<Esc>')
key_mapper('i', 'jk', '<Esc>')

-- insert new line above without enerting insert mode.
key_mapper('n', '<leader>o', 'moO<ESC> ')

-- Tab to switch buffer
key_mapper('n', '<TAB>', ':bnext<CR>')
key_mapper('n', '<S-TAB>', ':bprevious<CR>')

-- Move line up or down
key_mapper('n', '<C-k>', ':m-2<cr>')
key_mapper('n', '<C-j>', ':m+<cr>')

-- Tab Completion
--key_mapper('i', '<expr><TAB>', 'pumvisible() ? \"\\<TAB>\"')

key_mapper("n", 'gh', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
-- Copy to Clipboard
key_mapper('n', '<leader>y',  '\"+y')
key_mapper('n', '<leader>Y',  '\"+yg_')

-- Move selected line / block of text in visual mode
key_mapper('x', 'K', ':move \'<-2<CR>gv-gv')
key_mapper('x', 'J', ':move \'>+1<CR>gv-gv')

-- Better nav for omnicomplete
-- vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

vim.cmd([[
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
    ]])

-- disabled in visual mode
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
