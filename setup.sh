#!/bin/bash

# TODO
# make VLC the default video player
# replace to snaps when necessary

sudo apt update
sudo apt upgrade # up to date

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
sudo apt install -y fonts-inconsolata ttf-anonymous-pro
# amazing fira mono (https://github.com/stevebscott/steves-bash-utils/blob/master/install-fira.sh)
wget https://github.com/carrois/Fira/archive/master.zip $HOME -O $HOME/master.zip
unzip $HOME/master.zip -d $HOME
sudo mkdir -p /usr/share/fonts/opentype/fira_code
sudo mkdir -p /usr/share/fonts/opentype/fira_mono
sudo mkdir -p /usr/share/fonts/opentype/fira_sans
sudo cp $HOME/Fira-master/Fira_Code_3_2/Fonts/FiraCode_OTF_32/* /usr/share/fonts/opentype/fira_code
sudo cp $HOME/Fira-master/Fira_Mono_3_2/Fonts/FiraMono_OTF_32/* /usr/share/fonts/opentype/fira_mono
sudo cp $HOME/Fira-master/Fira_Sans_4_2/Fonts/FiraSans_OTF_4203/Normal/Roman/* /usr/share/fonts/opentype/fira_sans
sudo cp $HOME/Fira-master/Fira_Sans_4_2/Fonts/FiraSans_OTF_4203/Normal/Italic/* /usr/share/fonts/opentype/fira_sans
rm -rf $HOME/master.zip $HOME/Fira-master

# System tools
sudo apt install -y gparted synaptic
sudo apt install -y xdotool # set the default workspace
sudo apt install -y tmux

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

# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# TODO ...

sudo apt update

# install packages from external repos
sudo apt install -y spotify-client
sudo apt install -y atom
sudo apt install -y code
sudo apt install -y numix-icon-theme numix-icon-theme-circle
sudo apt install -y nodejs

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

# Updating IDS Hardware List - helps to recognize unknown devices
sudo update-pciids && update-usbids

# insert customizations to bashrc
cat bashrc >> $HOME/.bashrc

######################
# Restore VIM backup #
######################
VIM_DIR=$HOME/.vim
VIM_COLOR_DIR=$VIM_DIR/colors
VIM_COLOR_TAR_URL=https://github.com/AlessandroYorba/Sierra/archive/v5.0.0.tar.gz
VIM_COLOR_PATH=Sierra-4.0.0/colors/sierra.vim
VIM_COLOR_NAME=sierra

mkdir -p $VIM_COLOR_DIR

#set colorscheme
mkdir $HOME/temp_color_vim_dir
wget -O $HOME/temp_color_vim_dir/color-vim.tar.gz $VIM_COLOR_TAR_URL #download file
tar -xzf $HOME/temp_color_vim_dir/color-vim.tar.gz -C $HOME/temp_color_vim_dir #uncompress
cp $HOME/temp_color_vim_dir/$VIM_COLOR_PATH $VIM_COLOR_DIR #copy colorscheme file
rm -rf $HOME/temp_color_vim_dir #remove files

cp vimrc $HOME/.vimrc
cp gvimrc $HOME/.gvimrc

echo "colorscheme $VIM_COLOR_NAME" >> $HOME/.vimrc

#Unset
unset VIM_COLOR_NAME
unset VIM_DIR
unset VIM_COLOR_DIR
unset VIM_COLOR_TAR_URL
unset VIM_COLOR_PATH
