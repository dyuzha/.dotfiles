#!/bin/bash

# Clone repo
git clone --filter=blob:none --no-checkout https://github.com/dyuzha/.dotfiles

cd ~/.dotfiles
git sparse-checkout init --cone
git sparse-checkout set nvim
git checkout main

# Build symlink
ln -s ~/.dotfiles/nvim ~/.config

# Install soft
brew install \
    git \
    nvim \
    ranger\
    wget \
    pyvim \
    poetry \
    gh \
    ghostty



npm install -g neovim


# Install fonts
brew install --cask font-jetbrains-mono-nerd-font
