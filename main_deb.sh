#!/bin/bash

echo "--START--"

echo "Start coping existing files";
# copy configs for utilities
cp -ra ./config/. $HOME/.config

#copy useful scripts
cp -r ./bin $HOME

#copy wallpapers
cp -r ./Images $HOME

# copy for xorg
cp ./Xresources $HOME/.Xresources
cp ./zshrc $HOME/.zshrc
cp ./p10k.zsh $HOME/.p10k.zsh


echo "Installing main packages..."
PACMAN_PACKAGES=(build-essential curl wget fontconfig git vim zsh openssl kitty alacritty bspwm sxhkd feh picom polybar rofi bat fzf lsd ripgrep zoxide ranger flameshot arandr neofetch unzip redshift);

sudo apt install -y  "${PACMAN_PACKAGES[@]}" &&


# install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash &&

cp -ra ./local/. $HOME/.local

echo "--DONE--"
