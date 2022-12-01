#!/bin/bash

####   Oh My Zsh   ####
# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# omz themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
# omz plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

plugins=( 
    # other plugins...
    zsh-syntax-highlighting
    zsh-autosuggestions
)

#####################


####   NeoVim   ####
sudo add-apt-repository ppa:neovim-ppa/stable
sudo python3 /usr/bin/apt-add-repository ppa:neovim-ppa/stable

sudo ln /usr/bin/nvim /usr/bin/vim.basic
sudo ln /usr/bin/nvim /usr/bin/vim.tiny

mkdir -p ~/.local/share/nvim/site/pack
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

####################