#!/bin/bash

# Install firefox & 1Password
## Remove snap firefox - it doesn't work with 1Password
sudo snap remove firefox --purge
sudo install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla
sudo apt update && sudo apt install firefox

## Install 1Password
wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb
sudo apt install ./1password-latest.deb -y
rm 1password-latest.deb

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

# Install developer tools
## c/c++ compilers
sudo apt install -y build-essentials

## LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit
rm lazygit.tar.gz

## Installing neovim
sudo wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O /usr/local/bin/nvim
sudo chmod +x /usr/local/bin/nvim

# Installing modern replacements for GNU coreutils
## Installing bat modern replacement for cat
sudo apt install -y bat
batcat cache --build # Might need to call again if theme is not loaded

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
