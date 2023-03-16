#!/bin/sh

sudo apt-get install ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl
cd $HOME/git/neovim
git fetch && git pull
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
