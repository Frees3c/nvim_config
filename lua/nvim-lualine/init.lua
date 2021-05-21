require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nightbuddy',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {
            {"diagnostics", sources = {"nvim_lsp"}},
            'filetype',
            'encoding'
    },
    lualine_z = {'location'},
    lualine_y = {'progress'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree', 'quickfix'}
}
