#!/bin/bash

# TODO
# make VLC the default video player
# replace to snaps when necessary

sudo apt update -y
sudo apt upgrade -y # up to date

# Install basic tools to programming
# build-essentials: gcc, g++, make, libc and dpkg-dev
# ctags: make a index of commands of several programming languages
# dh-make, debhelper: build deb packages
# fakeroot: build packages without root permission
# dkms, module-assistant: build linux/debian kernels
# patch: apply the file generate by the diff command to patch new files (See man patch)
sudo apt install -y build-essential git
sudo apt install -y exuberant-ctags dh-make debhelper fakeroot dkms module-assistant patch

# extracting tools
sudo apt install -y rar unrar zip unzip p7zip-full p7zip-rar arj zoo cabextract uudeview mpack unace sharutils

# java
sudo apt install -y openjdk-14-jdk default-jdk default-jdk-headless maven

# dev
sudo apt install -y zeal # offline documentations
sudo apt install -y jq # sed json files

# zsh and 'oh my zsh'
sudo apt install zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# TODO: enable oh my zsh plugins (tmux, npm, etc) -> list them in a variable
# TODO: change oh my zsh theme
# TODO: requires user interaction

# fonts
sudo apt install -y fonts-inconsolata ttf-anonymous-pro fonts-firacode fonts-hack

# System tools
sudo apt install -y curl
sudo apt install -y openconnect # for vpn
sudo apt install -y gparted synaptic
sudo apt install -y tmux
sudo apt install -y gnome-tweak-tool

# Other apps
sudo apt install -y guake
sudo apt install -y vim-gtk vim-syntax-gtk vim-addon-manager vim-common
sudo apt install -y qbittorrent
sudo apt install -y putty
sudo apt install -y htop # a beautiful top
sudo apt install -y fortunes cowsay figlet lolcat fortunes-off # to play in the command line

echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt install -y wireshark

# theming
sudo apt install -y arc-theme
sudo apt install -y numix-icon-theme numix-icon-theme-circle

# uninstall
sudo apt purge -y transmission-* # default torrent client
sudo apt -y autoremove

# add external repos

# ppa

# nvm / install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install --lts

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# TODO ...

sudo apt update

# install packages from external repos
sudo apt install -y yarn

# snaps
sudo snap install chromium
sudo snap install gimp
sudo snap install inkscape
sudo snap install spotify
sudo snap install vlc

sudo snap install slack --classic
sudo snap install skype --classic
sudo snap install telegram-desktop

sudo snap install code --classic
sudo snap install --beta authy
sudo snap install dbeaver-ce
sudo snap install postman

# install vscode plugins
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension dbaeumer.vscode-eslint
code --install-extension dracula-theme.theme-dracula
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.EditorConfig
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension jpoissonnier.vscode-styled-components
code --install-extension kumar-harsh.graphql-for-vscode
code --install-extension mikestead.dotenv
code --install-extension netcorext.uuid-generator
code --install-extension oderwat.indent-rainbow
code --install-extension shinnn.stylelint
code --install-extension wayou.vscode-todo-highlight
code --install-extension wmaurer.change-case
code --install-extension xabikos.JavaScriptSnippets

# TODO: load personal configuration from somewhere

# Updating IDS Hardware List - helps to recognize unknown devices
sudo update-pciids && update-usbids

# Configure bash
echo "Configuring bash..."
echo "\n" >> $HOME/.bashrc # adds a line break at eof
cat bashrc_appends >> $HOME/.bashrc # append customizations to bashrc

# Config watchers to MAX
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

echo "Configuring tmux..."
cp .tmux.conf $HOME/.tmux.conf

echo "Configuring vim..."
cp .vimrc $HOME/.vimrc
cp .gvimrc $HOME/.gvimrc

######################
# Restore VIM backup #
######################
VIM_DIR=$HOME/.vim
VIM_COLOR_DIR=$VIM_DIR/colors
VIM_SIERRA_VERSION=5.0.0
VIM_COLOR_TAR_URL=https://github.com/AlessandroYorba/Sierra/archive/v$VIM_SIERRA_VERSION.tar.gz
VIM_COLOR_PATH=Sierra-$VIM_SIERRA_VERSION/colors/sierra.vim
VIM_COLOR_NAME=sierra

mkdir -p $VIM_COLOR_DIR

#set colorscheme
mkdir $HOME/temp_color_vim_dir
wget -O $HOME/temp_color_vim_dir/color-vim.tar.gz $VIM_COLOR_TAR_URL #download file
tar -xzf $HOME/temp_color_vim_dir/color-vim.tar.gz -C $HOME/temp_color_vim_dir #uncompress
cp $HOME/temp_color_vim_dir/$VIM_COLOR_PATH $VIM_COLOR_DIR #copy colorscheme file
rm -rf $HOME/temp_color_vim_dir #remove files

echo "colorscheme $VIM_COLOR_NAME" >> $HOME/.vimrc

#Unset
unset VIM_COLOR_NAME
unset VIM_DIR
unset VIM_SIERRA_VERSION
unset VIM_COLOR_DIR
unset VIM_COLOR_TAR_URL
unset VIM_COLOR_PATH
