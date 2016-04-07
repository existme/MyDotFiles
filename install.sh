#!/bin/sh
# Creating symbolic links
rm ~/.vimrc
ln -s ~/git/MyVimConfig/vimrc ~/.vimrc

rm -r ~/.vim
ln -s ~/git/MyVimConfig/vim ~/.vim

rm ~/.gvimrc
ln -s ~/git/MyVimConfig/gvimrc ~/.gvimrc

rm ~/.dircolors
ln -s ~/git/MyVimConfig/extras/dircolors ~/.dircolors

rm ~/.gitconfig
ln -s ~/git/MyVimConfig/gitconfig ~/.gitconfig

rm ~/.lessfilter
ln -s ~/git/MyVimConfig/zsh/lessfilter ~/.lessfilter

git submodule update --init
git submodule foreach git pull origin master

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
rm -rf cowsay-3.03/
rm cowsay_3.03.orig.tar.gz

# MAC specific
# source highliter installation for mac
sudo easy_install Pygments

# Win specific
#
# Install pygmentize package using this link: https://groups.google.com/forum/#!topic/asciidoc/ZWwujiCAcH0
