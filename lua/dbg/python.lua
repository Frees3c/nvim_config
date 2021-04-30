if vim.fn.has("mac") == 1 then
	require('dap-python').setup('/usr/local/bin/python3')
else
	require('dap-python').setup('/usr/bin/python3')
end


