#!/bin/bash

sudo apt update

sudo apt install -y \
    bspwm \
    kitty \
    neovim \
    polybar \
    rofi \
    sxhkd \
    flameshot \
    pamixer \
    brightnessctl \
    i3lock-color \
    feh \
    libnotify-bin \
    xclip \
    dmenu \
    betterlockscreen \
    lxappearance \
    lsd \
    batcat

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
sudo unzip $(pwd)/FiraCode.zip -d /usr/share/fonts/FiraCode/ 

sudo cp -rv $(pwd)/Flat-Remix-Red/Flat-Remix-GTK-Red-Darkest /usr/share/themes/ 
sudo cp -rv $(pwd)/Flat-Remix-Red/Flat-Remix-Red-Dark /usr/share/icons/

cp -rv $(pwd)/dotfiles/.* ~ 

echo "Installation completed!"

