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

-- ***********************************************************************************
--
-- Vim Key Bindings
--
-- ***********************************************************************************

-- Map leader to space
vim.g.mapleader = ' '

-- Faster scrolling
key_mapper('n', '<c-e>',       '3<c-e>')
key_mapper('n', '<c-y>',       '3<c-y>')

-- Encase selection in (), [], {}, "", ''
key_mapper('x',  '<Leader>(',  'xi()<Esc>P')
key_mapper('x',  '<Leader>"',  'xi""<Esc>P')
-- key_mapper('x',  '<leader>\'', 'xi\'\'<Esc>P') -- Figure out how to get this working.
key_mapper('x',  '<Leader>[',  'xi[]<Esc>P')
key_mapper('x',  '<Leader>{',  'xi{}<Esc>P')

-- Change word to uppercase(ctrl+u) or lower(space+l)
key_mapper('n', '<leader>l',  'viwgui<ESC>')
key_mapper('n', '<c-u>',      'viwUi<ESC>')

-- Window Navigation
key_mapper('n', '<C-h>',      '<C-w>h')
key_mapper('n', '<C-l>',      '<C-w>l')

-- Tab to switch buffer
-- key_mapper('n', '<TAB>',      ':bnext<CR>')
-- key_mapper('n', '<S-TAB>',    ':bprevious<CR>')

-- Kill buffer with leader bd
key_mapper('n', '<leader>bd', ':bdelete<CR>')

-- init.lua
key_mapper('n', '<leader>ev', ':e ~/.config/nvim/init.lua')

-- reload luafile
key_mapper('n', '<leader>lf',  ':luafile %<CR>')

-- Move line up or down
key_mapper('n', '<C-k>',      ':m-2<cr>')
key_mapper('n', '<C-j>',      ':m+<cr>')

-- Clear highlights
key_mapper('n', '<leader>h',  ':noh<CR>')

-- insert new line above without enerting insert mode.
key_mapper('n', '<leader>o',   'moO<ESC> ')

-- Better indentaion (tab)
key_mapper('v', '>',           '>gv')
key_mapper('v', '<',           '<gv')

-- Copy to Clipboard
key_mapper('n', '<leader>y',   '\"+y')
key_mapper('n', '<leader>Y',   '\"+yg_')

-- Copy to end of line from current position
key_mapper('n', 'Y',            'y$')

-- Move selected line / block of text in visual mode
key_mapper('x', 'K',           ':move \'<-2<CR>gv-gv')
key_mapper('x', 'J',           ':move \'>+1<CR>gv-gv')

-- Undo break points:
key_mapper('i', ',',           ',<c-g>u')
key_mapper('i', '.',           '.<c-g>u')
key_mapper('i', '?',           '?<c-g>u')
key_mapper('i', '!',           '!<c-g>u')
key_mapper('i', '[',           '[<C-g>u')

-- jk as Escape key
key_mapper('i', 'kj',          '<Esc>')
key_mapper('i', 'jk',          '<Esc>')


-- *************************************************************************************
--
-- Plugin Bindings
--
-- *************************************************************************************

-- Packer
key_mapper('n', '<Leader>ps',  ':PackerSync <CR>')
key_mapper('n', '<Leader>pi',  ':PackerInstall <CR>')
key_mapper('n', '<leader>pu',  ':PackerUpdate <CR>')

-- LazyGit
key_mapper('n', '<leader>lg',  ':LazyGit<CR>')

-- Nvim Tree Toggle
key_mapper('n', '<leader>e',   ':NvimTreeToggle<CR>')

-- Toggle Ranger
key_mapper('n', '<leader>-',   ':RnvimrToggle<CR>')

-- Telescope
key_mapper('n', '<leader>f',   ':Telescope find_files<CR>')
key_mapper('n', '<leader>fl',  ':Telescope live_grep<CR>')
key_mapper('n', '<leader>fb',  ':Telescope buffers<CR>')
key_mapper('n', '<leader>fh',  ':Telescope help_tags<CR>')
key_mapper('n', '<leader>fg',  ':Telescope git_files<CR>')
key_mapper('n', '<leader>fq',  ':Telescope quickfix<CR>')
key_mapper('n', '<leader>fx',  ':Telescope git_status<cr>')
key_mapper('n', '<leader>fc',  ':Telescope git_commits<cr>')
key_mapper('n', '<leader>fgw', ':Telescope grep_string<cr>')
--
-- lspsaga
key_mapper("n",  'gh',         ':lua require(\'lspsaga.hover\').render_hover_doc()<CR>')
key_mapper('n',  'ca',         ':Lspsaga code_action<CR>')
key_mapper('n',  'K',          ':Lspsaga hover_doc<CR>')
key_mapper('n',  '<C-p>',      ':Lspsaga diagnostic_jump_prev<CR>')
key_mapper('n',  '<C-n>',      ':Lspsaga diagnostic_jump_next<CR>')
key_mapper('n',  '<C-f>',      '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>')    -- scroll down hover doc
key_mapper('n',  '<C-b>',      '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>')   -- scroll up hover doc
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

-- Toggle Markdown Preview
key_mapper('n', '<leader>md',  ':MarkdownPreviewToggle<CR>')

-- dap, (Debugging)
key_mapper('n', '<leader>dc',   '<cmd>lua require"dap".continue()<CR>')
key_mapper('n', '<leader>dsv',  '<cmd>lua require"dap".step_over()<CR>')
key_mapper('n', '<leader>dsi',  '<cmd>lua require"dap".step_into()<CR>')
key_mapper('n', '<leader>dso',  '<cmd>lua require"dap".step_out()<CR>')
key_mapper('n', '<leader>dtb',  '<cmd>lua require"dap".toggle_breakpoint()<CR>')
key_mapper('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
key_mapper('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
key_mapper('n', '<leader>dro',  '<cmd>lua require"dap".repl.open()<CR>')
key_mapper('n', '<leader>drl',  '<cmd>lua require"dap".repl.run_last()<CR>')

-- Telescope-dap
key_mapper('n', '<leader>dcc',  '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
key_mapper('n', '<leader>dco',  '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
key_mapper('n', '<leader>dlb',  '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
key_mapper('n', '<leader>dv',   '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
key_mapper('n', '<leader>df',   '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

-- TrueZen
key_mapper('n', '<leader>tz',   ':TZAtaraxis <CR>')

-- Compe completion
vim.cmd([[
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
    ]])
