#!/bin/sh

set -xe

sudo apt update && sudo apt upgrade -y
sudo apt install tmux build-essential cmake ninja-build zsh python3-pip -y

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

mkdir -p $HOME/devel/git/work
mkdir -p $HOME/bin

cp $HOME/git/dotfiles/update-nvim.sh $HOME/bin/update-nvim

# Setup dev tools

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Bazelisk
wget https://github.com/bazelbuild/bazelisk/releases/download/v1.16.0/bazelisk-linux-amd64
sudo mv bazelisk-linux-amd64 /usr/local/bin/bazelisk
sudo chmod +x /usr/local/bin/bazelisk
sudo ln -s /usr/local/bin/bazelisk /usr/local/bin/bazel

# Node
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# protobuf
sudo apt-get install protobuf-compiler

# Language Servers

# Emmet
sudo npm install -g emmet-ls
# Docker
sudo npm install -g dockerfile-language-server-nodejs
# Tailwind
sudo npm install -g @tailwindcss/language-server
# Typescript
sudo npm install -g typescript typescript-language-server
# CSS and JSON
sudo npm install -g vscode-langservers-extracted
# C/C++
sudo apt install clangd -y
# CMAKE
pip install cmake-language-server
# Python
pip install pyright
# Lua
mkdir -p $HOME/bin/lua-language-server-data
cd $HOME/bin/lua-language-server-data
wget https://github.com/LuaLS/lua-language-server/releases/download/3.6.17/lua-language-server-3.6.17-linux-x64.tar.gz -O - | tar -xz
cd $HOME/bin
touch lua-language-server
echo "#!/bin/bash" > lua-language-server
echo "exec \"$HOME/bin/lua-language-server-data/bin/lua-language-server\" \"$@\"" >> lua-language-server
chmod +x lua-language-server
# Rust
mkdir -p ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer


# Formatters

# Prettier

sudo npm install -g prettier
