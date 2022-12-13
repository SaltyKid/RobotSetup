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
        -- snippet 引擎
        use "hrsh7th/vim-vsnip"
        --  snippets
        use "rafamadriz/friendly-snippets"
        -- cmp plugins
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-buffer" -- buffer completions
        use "hrsh7th/cmp-path" -- path completions
        use "hrsh7th/cmp-cmdline" -- cmdline completions
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-nvim-lua"
        use "ethanholz/nvim-lastplace"
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
        use 'nvim-tree/nvim-tree.lua'
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



