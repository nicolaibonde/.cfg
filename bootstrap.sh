#!/bin/bash

sudo apt-add-repository -y ppa:fish-shell/release-3

sudo apt update

sudo apt install -y fish kitty

sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

sudo chsh -s /usr/bin/fish

