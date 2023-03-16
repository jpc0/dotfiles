#!/bin/sh

set -xe

sudo apt update && sudo apt upgrade -y
sudo apt install tmux build-essential cmake ninja-build zsh -y


# Setup shell

curl -sS https://starship.rs/install.sh | sh
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p $HOME/Downloads
cd $HOME/Downloads

# Setup Neovim
sudo apt-get install ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl -y
cd $HOME/git
git clone https://github.com/neovim/neovim -b release-0.8
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# Setup Config
ln -s $HOME/git/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/git/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/git/dotfiles/.vimrc $HOME/.vimrc
rm $HOME/.zshrc
ln -s $HOME/git/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/git/dotfiles/.zshrc-e $HOME/.zshrc-e
mkdir -p $HOME/.config
ln -s $HOME/git/dotfiles/.config/nvim $HOME/.config/nvim

# Setup dev tools
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

curl --proto '=https' -sS https://github.com/bazelbuild/bazelisk/releases/download/v1.16.0/bazelisk-linux-amd64 > bazelisk
sudo mv bazelisk /usr/local/bin/bazelisk
