--###################################################################################
--		   ____   __               _
--		  / __ \ / /__  __ ____ _ (_)____   _____
--		 / /_/ // // / / // __ `// // __ \ / ___/
--		/ ____// // /_/ // /_/ // // / / /(__  )
--   /_/    /_/ \__,_/ \__, //_//_/ /_//____/
--    			        	/____/
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
        use "wbthomason/packer.nvim"

        -- Quality of life improvements
        use "neovim/nvim-lspconfig"
        use "williamboman/nvim-lsp-installer"
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        use "glepnir/lspsaga.nvim"
        use "terrortylor/nvim-comment"
        use "jose-elias-alvarez/nvim-lsp-ts-utils"
        use "Shatur/neovim-session-manager"
        use "lukas-reineke/indent-blankline.nvim"
        use "windwp/nvim-autopairs"

        -- Auto completion
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-emoji"
        use "hrsh7th/cmp-latex-symbols"
        use "hrsh7th/vim-vsnip"
        use "hrsh7th/cmp-nvim-lua"

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
        use "windwp/nvim-ts-autotag"
        use "JoosepAlviste/nvim-ts-context-commentstring"

        -- Telescope
        use "nvim-lua/telescope.nvim"
        use "nvim-lua/popup.nvim"
        use "nvim-lua/plenary.nvim"
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        -- Coloring
        use { "catppuccin/nvim",
        as = "catppuccin"
      }
        use "norcalli/nvim-colorizer.lua"
        use "tjdevries/colorbuddy.nvim"
      	use 'glepnir/zephyr-nvim'
        use 'tiagovla/tokyodark.nvim'
		-- use 'DilanGMB/nebulous.nvim'

        -- Git
        use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

        -- Ranger
        use "kevinhwang91/rnvimr"

        -- Bufferline
        use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"} -- maybe replace with barbar

        -- Lualine
        use {
          'hoob3rt/lualine.nvim',
          requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
        use 'arkav/lualine-lsp-progress'

        -- Remame like vscode
        use {
          'filipdutescu/renamer.nvim',
          branch = 'master',
          requires = { {'nvim-lua/plenary.nvim'} }
        }
        -- general
        use "numtostr/FTerm.nvim"
        use "tversteeg/registers.nvim"
        use "kdav5758/TrueZen.nvim"
        use "folke/which-key.nvim"
        use "ellisonleao/glow.nvim"
        use {"iamcco/markdown-preview.nvim", run = "cd app && npm install"}
    end
)
