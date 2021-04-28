O = {
    auto_complete = true,
    hidden_files = true,
    shell = 'bash',

    database = {save_location = '~/.config/nvim_db', auto_execute = 1},
    python = {
        linter = 'autopep8',
        formatter = 'yapf',
        autoformat = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    javascript = {linter = '', formatter = 'prettier', autoformat = false, virtual_text = true},
    javascriptreact = {linter = '', formatter = 'prettier', autoformat = false, virtual_text = true},
    lua = {formatter = '', autoformat = false, virtual_text = true},
    bash = {linter = '', formatter = '', autoformat = false, virtual_text = true},
    css = {formatter = '', autoformat = false, virtual_text = true},
	ruby = {
		diagnostics = {virtualtext = true, signs = true, underline = true},
		filetypes = {'rb', 'erb', 'rakefile'}
	},
    json = {formatter = 'prettier', autoformat = false, virtual_text = true},
	sh = {linter = 'shellcheck', formatter = 'shfmt', autoformat = false, diagnostics = {virtual_text = true, signs = true, underline = true}
    },

	tsserver = {
        linter = 'eslint',
        formatter = 'prettier',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
}

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
