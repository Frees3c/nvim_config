local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim'}

  -- Quality of life improvements
  use 'norcalli/nvim_utils'
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'glepnir/lspsaga.nvim'
  use 'terrortylor/nvim-comment'

  -- Auto completion
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/nvim-compe'

  -- Debugging
  use "mfussenegger/nvim-dap"
  use 'mfussenegger/nvim-dap-python'
  use 'nvim-telescope/telescope-dap.nvim'

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Telescope
  use 'nvim-lua/telescope.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Coloring
  use 'norcalli/nvim-colorizer.lua'
  use 'tjdevries/colorbuddy.nvim'
  use 'sickill/vim-monokai'
  use 'tomasr/molokai'
  use 'DilanGMB/nightbuddy'

  -- Git
  -- use 'TimUntersberger/neogit'
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Ranger
  use 'kevinhwang91/rnvimr'

  -- Bufferline
  -- use 'romgrk/barbar.nvim'
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'} -- maybe replace with barbar

  -- Snippets
  -- use 'golang/vscode-go'
  -- use 'kitagry/vs-snippets'
  use "rafamadriz/friendly-snippets"


  -- General
  use "windwp/nvim-autopairs"
  use 'glepnir/galaxyline.nvim'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
end)
