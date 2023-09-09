#!/bin/sh

set -xe

cd $HOME/git
rm -rf neovim
git clone https://github.com/neovim/neovim -b release-0.9 --depth 1
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
