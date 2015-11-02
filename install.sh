#!/bin/sh
rm ~/.vimrc
rm -r ~/.vim
rm ~/.gvimrc
ln -s ~/git/MyVimConfig/vimrc ~/.vimrc
ln -s ~/git/MyVimConfig/vim ~/.vim
ln -s ~/git/MyVimConfig/gvimrc ~/.gvimrc
ln -s ~/git/MyVimConfig/extras/dircolors ~/.dircolors


#---------------
# linux specific
#---------------

# install vim stuff
sudo apt-get install ctags

#install other stuff
sudo apt-get install fortune
sudo apt-get install grc
sudo apt-get install pal

#install cowsay
wget http://ftp.acc.umu.se/mirror/cdimage/snapshot/Debian/pool/main/c/cowsay/cowsay_3.03.orig.tar.gz
tar xf cowsay_3.03.orig.tar.gz
cd cowsay-3.03
./install.sh

