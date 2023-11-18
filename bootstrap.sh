#!/bin/bash

sudo apt-add-repository -y ppa:fish-shell/release-3

sudo apt update

sudo apt install -y fish kitty fonts-firacode

sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

sudo chsh -s /usr/bin/fish

mkdir ~/.fonts/

# Install nerd font FiraCode
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip -O temp.zip
unzip -n temp.zip -d ~/.fonts/
rm temp.zip
fc-cache -fv

curl -sS https://starship.rs/install.sh | sh -s -- --yes


