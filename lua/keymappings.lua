--###################################################################################
--       __  __
--      /  |/  /____ _ ____   ____   (_)____   ____ _ _____
--     / /|_/ // __ `// __ \ / __ \ / // __ \ / __ `// ___/
--    / /  / // /_/ // /_/ // /_/ // // / / // /_/ /(__  )
--   /_/  /_/ \__,_// .___// .___//_//_/ /_/ \__, //____/
--                 /_/    /_/               /____/
--
-- ###################################################################################


local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

--************************************************************************************
--
-- Vim Key Bindings
--
-- ***********************************************************************************

-- Map leader to space
vim.g.mapleader = ' '

-- Window Navigation
key_mapper('n', '<C-h>',      '<C-w>h')
key_mapper('n', '<C-l>',      '<C-w>l')

-- Tab to switch buffer
key_mapper('n', '<TAB>',      ':bnext<CR>')
key_mapper('n', '<S-TAB>',    ':bprevious<CR>')

-- Kill buffer with leader bf
key_mapper('n', '<leader>bf', ':bdelete<CR>')

-- init.lua
key_mapper('n', '<leader>ev', ':e ~/.config/nvim/init.lua')
key_mapper('n', '<leader>sv', ':luafile ~/.config/nvim/init.lua')

-- Move line up or down
key_mapper('n', '<C-k>',      ':m-2<cr>')
key_mapper('n', '<C-j>',      ':m+<cr>')

-- Clear highlights
key_mapper('n', '<leader>h',  ':noh<CR>')

-- insert new line above without enerting insert mode.
key_mapper('n', '<leader>o',   'moO<ESC> ')

-- Better indentaion (tabbing)
key_mapper('v', '>',           '>gv')
key_mapper('v', '<',           '<gv')

-- Copy to Clipboard
key_mapper('n', '<leader>y',   '\"+y')
key_mapper('n', '<leader>Y',   '\"+yg_')

-- Move selected line / block of text in visual mode
key_mapper('x', 'K',           ':move \'<-2<CR>gv-gv')
key_mapper('x', 'J',           ':move \'>+1<CR>gv-gv')

-- jk as Escape key
key_mapper('i', 'kj',          '<Esc>')
key_mapper('i', 'jk',          '<Esc>')

-- reload luafile
key_mapper('n', '<leader>lf',  ':luafile %<CR>')

--*************************************************************************************
--
--Plugin Bindings
--
--*************************************************************************************

-- LazyGit
key_mapper('n', '<leader>lg',  ':LazyGit<CR>')

-- Nvim Tree Toggle
key_mapper('n', '<leader>e',   ':NvimTreeToggle<CR>')

-- Toggle Ranger
key_mapper('n', '<leader>-',    ':RnvimrToggle<CR>')

-- Telescope
key_mapper('n', '<leader>f',   ':Telescope find_files<CR>')
key_mapper('n', '<leader>fl',  ':Telescope live_grep<CR>')
key_mapper('n', '<leader>fb',  ':Telescope buffers<CR>')
key_mapper('n', '<leader>fh',  ':Telescope help_tags<CR>')
key_mapper('n', '<leader>fg',  ':Telescope git_files<CR>')
key_mapper('n', '<leader>fc',  ':Telescope colorscheme<cr>')

-- lspsaga
key_mapper("n", 'gh',           ':lua require(\'lspsaga.hover\').render_hover_doc()<CR>')
key_mapper('n', 'ca',           ':Lspsaga code_action<CR>')
key_mapper('n', 'K',            ':Lspsaga hover_doc<CR>')
-- key_mapper('n', <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
key_mapper('n',  '<C-p>',      ':Lspsaga diagnostic_jump_prev<CR>')
key_mapper('n',  '<C-n>',      ':Lspsaga diagnostic_jump_next<CR>')
-- scroll down hover doc or scroll in definition preview
key_mapper('n',  '<C-f>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>')
-- scroll up hover doc
key_mapper('n',  '<C-b>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>')
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

-- Toggle Markdown Preview
key_mapper('n', '<leader>md',   ':MarkdownPreviewToggle')

vim.cmd([[
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
    ]])

