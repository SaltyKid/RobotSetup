vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- LSP
  -- cmp plugins
  -- UI
  -- colorschemes
  use 'navarasu/onedark.nvim'
  use 'kyazdani42/nvim-web-devicons'
  -- lualine
  use 'nvim-lualine/lualine.nvim'
  --file explore
  use 'nvim-tree/nvim-tree.lua'
end)
