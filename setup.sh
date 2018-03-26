#!/bin/bash

# set some environment variables
BASHRC_URL=https://gist.githubusercontent.com/matheusramos/e927c886944db08d90fe/raw/2a46e0105ab22f56965f5623e3bba0726a2e6931/.bashrc
TMUX_CONFIG_URL=https://gist.githubusercontent.com/automagically/57a4322dac1300a76dcf18d05d21d683/raw/5fdc252bfaa9c9781736ed4dfae6d782a91787e6/.tmux.conf

GIT_CONFIG_URL=https://gist.githubusercontent.com/matheusramos/6ee98c1c7a54c05e5245b7121e4ca154/raw/c52f0d82735bc9078f40bc21d8de6dbc0e2d74fc/.gitconfig
GIT_BASH_CONFIG_URL=https://gist.githubusercontent.com/automagically/1298a845759432bf84a8718993bdfb59/raw/af4747e0407a03cf95779fc4e02a8d81021a0652/.sh

VIMRC_URL=https://gist.githubusercontent.com/matheusramos/06ff732d6d92093ec74a7b0f40c661e5/raw/3583d430bb1f2b856b3181535c9015652a96a2cd/.vimrc
GVIMRC_URL=https://gist.githubusercontent.com/matheusramos/2c63561e08b473e3cc145cfbc1482b92/raw/89931842ff6976a515c6addf11db36d535397657/.gvimrc

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
sudo apt install -y build-essential git subversion
sudo apt install -y exuberant-ctags dh-make debhelper fakeroot dkms module-assistant patch

# extracting tools
sudo apt install -y rar unrar zip unzip p7zip-full p7zip-rar arj zoo cabextract uudeview mpack unace sharutils

# java
sudo apt install -y openjdk-8-jdk default-jdk default-jdk-headless

# dev
sudo apt install -y maven
sudo apt install -y zeal #offline documentations

# fonts
sudo apt install -y fonts-inconsolata ttf-anonymous-pro fonts-firacode

# System tools
sudo apt install -y curl
sudo apt install -y openconnect # for vpn
sudo apt install -y gparted synaptic
sudo apt install -y xdotool # to set the default workspace
sudo apt install -y tmux
sudo apt install -y gnome-tweak-tool

# Other apps
sudo apt install -y guake
sudo apt install -y vim-gtk vim-syntax-gtk vim-addon-manager vim-common
sudo apt install -y nautilus-dropbox
sudo apt install -y gimp
sudo apt install -y inkscape
sudo apt install -y audacity
sudo apt install -y vlc
sudo apt install -y keepassx #password manager
sudo apt install -y qbittorrent
sudo apt install -y wireshark #TODO: asks for manual configuration
sudo apt install -y chromium-browser
sudo apt install -y skype #TODO won't work
sudo apt install -y virtualbox virtualbox-guest-additions-iso
sudo apt install -y putty
sudo apt install -y htop # a beautiful top
sudo apt install -y fortunes cowsay figlet lolcat fortunes-off # to play in the command line

# theming
sudo apt install -y arc-theme

# uninstall
sudo apt purge -y transmission-* # default torrent client
sudo apt -y autoremove

# add external repos

# ppa
sudo apt-add-repository -y ppa:webupd8team/atom # Atom
sudo apt-add-repository -y ppa:numix/ppa # Numix icons

# visual code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# nvm / install node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
nvm install --lts

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# TODO ...

sudo apt update

# install packages from external repos
sudo apt install -y atom
sudo apt install -y code
sudo apt install -y numix-icon-theme numix-icon-theme-circle
sudo apt install -y yarn

# install atom packages
apm install atom-beautify
apm install color-picker
apm install emmet
apm install file-icons
apm install language-r
apm install language-scala
apm install minimap
apm install pigments

# snaps
# sudo snap install telegram-sergiusens #buggy
sudo snap install spotify
sudo snap install slack --classic

# Updating IDS Hardware List - helps to recognize unknown devices
sudo update-pciids && update-usbids

# Configure bash
echo "Configuring bash..."
wget $BASHRC_URL -O bashrc_temp
echo "" >> .bashrc # adds a line break at eof
cat bashrc_temp >> $HOME/.bashrc # append customizations to bashrc
rm bashrc_temp

echo "Configuring tmux..."
wget $TMUX_CONFIG_URL -O .tmux.conf

echo "Configuring git..."
wget $GIT_CONFIG_URL -O .gitconfig
# show git branch in terminal
wget $GIT_BASH_CONFIG_URL -O gitbranchbash_temp
echo "" >> .bashrc # adds a line break at eof
cat gitbranchbash_temp >> $HOME/.bashrc
rm gitbranchbash_temp

echo "Configuring vim..."
wget $VIMRC_URL -O .vimrc
wget $GVIMRC_URL -O .gvimrc

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
