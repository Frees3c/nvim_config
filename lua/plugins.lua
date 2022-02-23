--###################################################################################
--		   ____   __               _
--		  / __ \ / /__  __ ____ _ (_)____   _____
--		 / /_/ // // / / // __ `// // __ \ / ___/
--		/ ____// // /_/ // /_/ // // / / /(__  )
--   /_/    /_/ \__,_/ \__, //_//_/ /_//____/
--    			        	/____/
--
-- ###################################################################################

local fn = vim.fn

-- Install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP =
        fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end
    }
}
return packer.startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- Quality of life improvements
        use "neovim/nvim-lspconfig"
        use "williamboman/nvim-lsp-installer"
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        -- use "glepnir/lspsaga.nvim"
        use "terrortylor/nvim-comment"
        use "jose-elias-alvarez/nvim-lsp-ts-utils"
        use "Shatur/neovim-session-manager"
        use "lukas-reineke/indent-blankline.nvim"
        use "windwp/nvim-autopairs"
        use "kevinhwang91/nvim-bqf"

        -- Plugin dev
        use "folke/lua-dev.nvim"

        -- cmp plugins(autocompltetion)
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-emoji"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/cmp-latex-symbols"
        use "hrsh7th/cmp-nvim-lua"

        -- Snippets
        use "hrsh7th/vim-vsnip"
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
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
        use "nvim-telescope/telescope-packer.nvim"

        -- Coloring
        use {
            "catppuccin/nvim",
            as = "catppuccin"
        }
        use "norcalli/nvim-colorizer.lua"
        use "navarasu/onedark.nvim"
        -- use "rebelot/kanagawa.nvim"
        -- use "tjdevries/colorbuddy.nvim"
        -- use "glepnir/zephyr-nvim"
        -- use "tiagovla/tokyodark.nvim"
        -- use "DilanGMB/nebulous.nvim"

        -- Git
        use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

        -- Ranger
        use "kevinhwang91/rnvimr"

        -- Bufferline
        use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"} -- maybe replace with barbar

        -- Lualine
        use {
            "hoob3rt/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        }
        use "arkav/lualine-lsp-progress"

        -- Remame like vscode
        use {
            "filipdutescu/renamer.nvim",
            branch = "master",
            requires = {{"nvim-lua/plenary.nvim"}}
        }
        -- general
        use "ThePrimeagen/refactoring.nvim"
        use "tversteeg/registers.nvim"
        use "numToStr/FTerm.nvim"
        use "kdav5758/TrueZen.nvim"
        use "folke/which-key.nvim"
        use {"iamcco/markdown-preview.nvim", run = "cd app && npm install"}
        if PACKER_BOOTSTRAP then
            require("packer").sync()
        end
    end
)
