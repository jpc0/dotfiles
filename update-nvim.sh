#!/bin/sh

set -xe

mkdir -p $HOME/git
cd $HOME/git
rm -rf neovim
git clone https://github.com/neovim/neovim -b nightly --depth 1
cd neovim && make CMAKE_BUILD_TYPE=Release
sudo make install
