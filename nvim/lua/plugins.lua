vim.cmd [[packadd packer.nvim]]

require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'
        -- telescope 
        use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
        -- LSP
        use 'neovim/nvim-lspconfig'
        use "williamboman/nvim-lsp-installer"
        use "ray-x/lsp_signature.nvim"
        -- cmp plugins
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-buffer" -- buffer completions
        use "hrsh7th/cmp-path" -- path completions
        use "hrsh7th/cmp-cmdline" -- cmdline completions
        use "hrsh7th/cmp-nvim-lsp"
        --use "hrsh7th/cmp-nvim-lua"
        -- snippet 引擎
        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/vim-vsnip"
        --  snippets
        use "rafamadriz/friendly-snippets"
        -- use "ethanholz/nvim-lastplace"
        -- autopairs
        use "windwp/nvim-autopairs"
        -- treesittetr
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
        }
        -- UI
        use "mtdl9/vim-log-highlighting"
        -- colorschemes
        use 'navarasu/onedark.nvim'
        use 'kyazdani42/nvim-web-devicons'
        -- blankline
        use("lukas-reineke/indent-blankline.nvim")
        -- lualine
        use 'nvim-lualine/lualine.nvim'
        -- file explore
        use {
            "nvim-tree/nvim-tree.lua",
            commit = "ada2c6441d0844cc1995b5def24fd3e90cfa8032",
        }
        -- tab bufferline
        use {
            "akinsho/bufferline.nvim", -- tab
            tag = "v1.2.0",
        }
        -- terminal
        use "akinsho/toggleterm.nvim"
        -- Other
        use "Pocco81/AutoSave.nvim"
        use "voldikss/vim-translator"
    end,
    config = {
        -- 并发限制
        max_jobs = 32,
        -- 显示
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})



