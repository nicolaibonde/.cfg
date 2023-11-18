#!/bin/bash

# Installing Terminal and shell
## Installing fish - shell
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt update
sudo apt install -y fish
sudo chsh -s /usr/bin/fish

## Installing kitty - terminal
sudo apt install -y fish 
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

## Styling packages for terminal and shell
### Install nerd font FiraCode
sudo apt install -y fonts-firacode 
mkdir ~/.fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip -O temp.zip
unzip -n temp.zip -d ~/.fonts/
rm temp.zip
fc-cache -fv

### Installing starship cross shell prompt
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Installing neovim
sudo apt install -y neovim 

# Installing modern replacements for GNU coreutils
## Installing bat modern replacement for cat
sudo apt install -y bat

## Installing eza modern replacement for ls
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

## Installing procs modern replacement for ps
sudo snap install procs

## Installing bottom modern replacement for top
sudo snap install bottom
sudo snap connect bottom:mount-observe
sudo snap connect bottom:hardware-observe
sudo snap connect bottom:system-observe
sudo snap connect bottom:process-control

