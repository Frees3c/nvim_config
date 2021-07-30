--###################################################################################
--		   ____   __               _
--		  / __ \ / /__  __ ____ _ (_)____   _____
--		 / /_/ // // / / // __ `// // __ \ / ___/
--		/ ____// // /_/ // /_/ // // / / /(__  )
--     /_/    /_/ \__,_/ \__, //_//_/ /_//____/
--			        	/____/
--
-- ###################################################################################

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use {"wbthomason/packer.nvim"}

        -- Quality of life improvements
        use "norcalli/nvim_utils"
        use "neovim/nvim-lspconfig"
        use "kabouzeid/nvim-lspinstall"
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        use "glepnir/lspsaga.nvim"
        use "terrortylor/nvim-comment"
        use "jose-elias-alvarez/nvim-lsp-ts-utils"

        -- Auto completion
        use "hrsh7th/vim-vsnip"
        use "hrsh7th/nvim-compe"

        -- Snippets
        use "rafamadriz/friendly-snippets"

        -- Debugging
        use "mfussenegger/nvim-dap"
        use "mfussenegger/nvim-dap-python"
        use "nvim-telescope/telescope-dap.nvim"

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use "nvim-treesitter/playground"
        use "p00f/nvim-ts-rainbow"
        use "JoosepAlviste/nvim-ts-context-commentstring"

        -- Telescope
        use "nvim-lua/telescope.nvim"
        use "nvim-lua/popup.nvim"
        use "nvim-lua/plenary.nvim"
        use "nvim-telescope/telescope-media-files.nvim"

        -- Coloring
        use "norcalli/nvim-colorizer.lua"
        use "tjdevries/colorbuddy.nvim"
        use 'shaunsingh/nord.nvim'
        use 'tanvirtin/monokai.nvim'
        use "tomasr/molokai"
		use 'Frees3c/nebulous.nvim'
		-- use 'DilanGMB/nebulous.nvim'
        use "folke/tokyonight.nvim"
        use "Th3Whit3Wolf/space-nvim"

        -- Git
        use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
        use "kdheepak/lazygit.nvim"

        -- Ranger
        use "kevinhwang91/rnvimr"

        -- Bufferline
        -- use 'romgrk/barbar.nvim'
        use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"} -- maybe replace with barbar


        -- General
        -- use "numtostr/FTerm.nvim"
		use "kdav5758/TrueZen.nvim"
        use "folke/which-key.nvim"
        use "glepnir/dashboard-nvim"
        use "windwp/nvim-autopairs"
        use "abecodes/tabout.nvim"
		use {
			'hoob3rt/lualine.nvim',
			requires = {'kyazdani42/nvim-web-devicons', opt = true}
		}
        -- use "glepnir/galaxyline.nvim"
        use {"iamcco/markdown-preview.nvim", run = "cd app && npm install"}
		use { 'michaelb/sniprun', run = 'bash ./install.sh'}
    end
)
