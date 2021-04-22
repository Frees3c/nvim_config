O = {

    auto_complete = true,
    python = {
        linter = 'autopep8',
        formatter = 'flake8',
        autoformat = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    javascript = {linter = '', formatter = '', autoformat = false, virtual_text = true},
    javascriptreact = {linter = '', formatter = '', autoformat = false, virtual_text = true},
    lua = {formatter = '', autoformat = false, virtual_text = true},
    bash = {linter = '', formatter = '', autoformat = false, virtual_text = true},
    css = {formatter = '', autoformat = false, virtual_text = true},
    json = {formatter = '', autoformat = false, virtual_text = true}

}

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
