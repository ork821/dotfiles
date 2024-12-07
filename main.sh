#!/bin/bash

if [ $(id -u) -ne 0 ]
  then echo Please run this script as root or using sudo!
  exit
fi

echo "--START--"

echo "Start coping existing files";
# copy configs for utilities
cp -r ./config $HOME/.config

#copy useful scripts
cp -r ./bin $HOME/bin

#copy wallpapers
cp -r ./Images $HOME/Images

# copy for xorg
cp ./xinitrc $HOME/.xinitrc
cp ./Xresources $HOME/.Xresources


echo "Installing main packages..."
PACMAN_PACKAGES=(base-devel curl wget git vim neovim zsh openssl openssh kitty xorg xorg-server xorg-xinit bspwm sxhkd feh picom polybar rofi bat fzf lsd ripgrep zoxide ranger flameshot arandr neofetch unzip redshift);

sudo pacman -Sy "${PACMAN_PACKAGES[*]}" --needed

echo "Installing yay"
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay


echo "Do you want to install custom fonts?";
select yn in "Yes" "No"; do
  case $yn in
    Yes )
      sh "./install_fonts.sh"
      ;;
    *)
      exit
      ;;
  esac
done

# installing oh my zsh and stuff
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc


# install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash


echo "--DONE--"
