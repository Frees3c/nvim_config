require('telescope').load_extension('dap')
require('dbg.python')
require('dbg.ruby')

local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

key_mapper('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>')
key_mapper('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>')
key_mapper('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
key_mapper('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>')
key_mapper('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
key_mapper('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
key_mapper('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
key_mapper('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
key_mapper('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')

--telescope-dap
key_mapper('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
key_mapper('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
key_mapper('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
key_mapper('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
key_mapper('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')
