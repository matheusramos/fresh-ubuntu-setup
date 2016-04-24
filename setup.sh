#!/bin/bash

HOME_DIR=/home/matheus
FILES_ROOT_DIR=/mnt/files

rmdir $HOME_DIR/Documents
rmdir $HOME_DIR/Pictures
rmdir $HOME_DIR/Downloads
rmdir $HOME_DIR/Videos
rmdir $HOME_DIR/Music

ln -s $FILES_ROOT_DIR/Documents $HOME_DIR
ln -s $FILES_ROOT_DIR/Downloads $HOME_DIR
ln -s $FILES_ROOT_DIR/Music $HOME_DIR
ln -s $FILES_ROOT_DIR/Pictures $HOME_DIR
ln -s $FILES_ROOT_DIR/Videos $HOME_DIR
ln -s $FILES_ROOT_DIR/Dropbox $HOME_DIR
ln -s $FILES_ROOT_DIR/dev $HOME_DIR

#Install packages
sudo apt-get update

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
sudo apt-get install -y openjdk-9-jdk openjdk-9-jre openjdk-9-jre-headless icedtea-plugin libreoffice-java-common 

#Codecs
sudo apt-get -y install ubuntu-restricted-extras #TODO: asks for manual configuration
sudo apt-get -y install id3tool lame libjpeg-progs  flac faac faad sox  ffmpeg2theora libmpeg3-1  mpegdemux x264

#fonts
sudo apt-get -y install fonts-roboto
sudo apt-get -y install fonts-noto
sudo apt-get -y install ttf-anonymous-pro

#Ubuntu
sudo apt-get -y install gparted synaptic
sudo apt-get -y install unity-tweak-tool

#OTHERS
sudo apt-get -y install guake 
sudo apt-get -y install vim-gtk vim-syntax-gtk vim-addon-manager vim-common
sudo apt-get -y install nautilus-dropbox
sudo apt-get -y install gimp
sudo apt-get -y install inkscape
sudo apt-get -y install audacity
sudo apt-get -y install vlc
sudo apt-get -y install keepassx
sudo apt-get -y install qbittorrent
sudo apt-get -y install wireshark #TODO: asks for manual configuration
sudo apt-get -y install chromium-browser
sudo apt-get -y install skype #TODO won't work
sudo apt-get -y install virtualbox virtualbox-guest-additions-iso 

#uninstall
sudo apt-get -y purge transmission-* #Default torrent client
sudo apt-get autoremove

#Add external repos TODO: it asks to press enter do add the repository

#spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo add-apt-repository ppa:webupd8team/atom
#TODO ...

sudo apt-get update

#install packages from external repos
sudo apt-get install -y spotify-client
sudo apt-get install -y atom

#Updating IDS Hardware List - helps to recognize unknown devices
sudo update-pciids && update-usbids

#Making VLC the default video player #TODO: don't work
sudo sed -i 's/totem/vlc/g' /usr/share/applications/defaults.list

#Startup applications
#error 
#sed -i 's/Autostart-enabled=false/Autostart-enabled=true/g' $HOME_DIR/.config/autostart/guake.desktop #guake

#Restore VIM backup
VIM_DIR=$HOME_DIR/.vim
VIM_COLOR_DIR=$VIM_DIR/colors
VIM_COLOR_TAR_URL=https://github.com/AlessandroYorba/Sierra/archive/v2.2.2.tar.gz
VIM_COLOR_PATH=Sierra-2.2.2/colors/sierra.vim
VIM_COLOR_NAME=sierra

mkdir -p $VIM_COLOR_DIR

#set colorscheme
mkdir $HOME_DIR/temp_color_vim_dir
wget -O $HOME_DIR/temp_color_vim_dir/color-vim.tar.gz $VIM_COLOR_TAR_URL #download file
tar -xzf $HOME_DIR/temp_color_vim_dir/color-vim.tar.gz -C $HOME_DIR/temp_color_vim_dir #uncompress
cp $HOME_DIR/temp_color_vim_dir/$VIM_COLOR_PATH $VIM_COLOR_DIR #copy colorscheme file
rm -rf $HOME_DIR/temp_color_vim_dir #remove files

cp vimrc $HOME_DIR/.vimrc
cp gvimrc $HOME_DIR/.gvimrc

echo "colorscheme $VIM_COLOR_NAME" >> $HOME_DIR/.vimrc

#Unset 
unset VIM_COLOR_NAME
unset VIM_DIR
unset VIM_COLOR_DIR
unset VIM_COLOR_TAR_URL
unset VIM_COLOR_PATH
unset FILES_ROOT_DIR
unset HOME_DIR
