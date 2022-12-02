vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- LSP
  -- cmp plugins
  -- UI
  -- colorschemes
  use 'navarasu/onedark.nvim'
  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  --file explore
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
     'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
end)



