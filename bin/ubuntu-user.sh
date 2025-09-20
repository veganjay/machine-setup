#!/bin/sh

# Install VIM plug
echo Install VIM plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Install UV
curl -LsSf https://astral.sh/uv/install.sh | sh
uv tool install td-watson

# Steps to perform after installing
echo 'Inside VIM, run :PlugInstall'
