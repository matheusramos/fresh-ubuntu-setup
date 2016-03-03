#!/bin/bash

FILES_ROOT_DIR="/mnt/files"

rmdir ~/Documents
rmdir ~/Pictures
rmdir ~/Downloads
rmdir ~/Videos
rmdir ~/Music

ln -s $FILES_ROOT_DIR/Documents ~/Documents
ln -s $FILES_ROOT_DIR/Downloads ~/Downloads
ln -s $FILES_ROOT_DIR/Music ~/Music
ln -s $FILES_ROOT_DIR/Pictures ~/Pictures
ln -s $FILES_ROOT_DIR/Videos ~/Videos
ln -s $FILES_ROOT_DIR/Dropbox ~/Dropbox
ln -s $FILES_ROOT_DIR/dev ~/dev

#Install basic tools to programming
# build-essentials: gcc, g++, make, libc and dpkg-dev
# ctags: make a index of commands of several programming languages
# dh-make, debhelper: build deb packages
# fakeroot: build packages without root permission
# dkms, module-assistant: build linux/debian kernels
# patch: apply the file generate by the diff command to patch new files (See man patch)
sudo apt-get install -y build-essential exuberant-ctags dh-make debhelper fakeroot \
dkms module-assistant patch git

#Extracting tools
sudo apt-get install -y rar unrar zip unzip p7zip-full p7zip-rar arj zoo cabextract uudeview mpack unace sharutils

#Java and Java plugins
sudo apt-get install -y openjdk-7-jdk openjdk-7-jre openjdk-7-jre-headless openjdk-7-jre-lib icedtea-7-plugin libreoffice-java-common 

#Codecs
sudo apt-get -y install ubuntu-restricted-extras
sudo apt-get -y install id3tool lame libjpeg-progs  flac faac faad sox  ffmpeg2theora libmpeg3-1  mpegdemux x264

#fonts
sudo apt-get -y install fonts-droid ttf-anonymous-pro

#Ubuntu
sudo apt-get -y install gparted synaptic
sudo apt-get -y install unity-tweak-tool

#OTHERS
sudo apt-get -y install guake 
sudo apt-get -y install vim-gtk vim-syntax-gtk vim-addon-manager vim-common
sudo apt-get -y install nautilus-dropbox
sudo apt-get -y install gimp inkscape audacity
sudo apt-get -y install vlc mozilla-plugin-vlc
sudo apt-get -y install keepassx
sudo apt-get -y install qbittorrent
sudo apt-get -y install wireshark
sudo apt-get -y install chromium-browser
sudo apt-get -y install skype

#uninstall
sudo apt-get -y purge transmission #Default torrent client

#Add external repos

#spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update

#install packages from external repos
sudo apt-get install -y spotify-client


#Updating IDS Hardware List - helps to recognize unknown devices
sudo update-pciids && update-usbids

#Making VLC the default video player
sudo sed -i 's/totem/vlc/g' /usr/share/applications/defaults.list

#Startup applications
#error 
#sed -i 's/Autostart-enabled=false/Autostart-enabled=true/g' ~/.config/autostart/guake.desktop #guake

#Restore VIM backup
VIM_DIR="~/.vim"
VIM_COLOR_DIR=$VIM_DIR/colors
VIM_COLOR_TAR_URL=https://github.com/AlessandroYorba/Sierra/archive/v2.2.2.tar.gz
VIM_COLOR_PATH=Sierra-2.2.2/colors/sierra.vim 

mkdir -p $VIM_COLOR_DIR

#set colorscheme
wget -O $VIM_COLOR_DIR/color-vim.tar.gz $VIM_COLOR_TAR_URL #download file
mkdir ~/temp_color_vim_dir
tar -xzf $VIM_COLOR_DIR/color-vim.tar.gz -C ~/temp_color_vim_dir #uncompress
cp ~/temp_color_vim_dir/$VIM_COLOR_PATH $VIM_COLOR_DIR #copy colorscheme file
rm -rf ~/temp_color_vim_dir $VIM_COLOR_DIR/color-vim.tar.gz #remove files

cp .vimrc $HOME_DIR/.vimrc
cp .gvimrc $HOME_DIR/.gvimrc

#Unset 
unset VIM_DIR
unset VIM_COLOR_DIR
unset VIM_COLOR_TAR_URL
unset VIM_COLOR_PATH
unset FILES_ROOT_DIR
