#!/bin/sh
# Creating symbolic links
rm ~/.zshrc
ln -s ~/git/MyDotFiles/zshrc ~/.zshrc

rm ~/.vimrc
ln -s ~/git/MyDotFiles/vimrc ~/.vimrc

rm -r ~/.vim
ln -s ~/git/MyDotFiles/vim ~/.vim

rm ~/.gvimrc
ln -s ~/git/MyDotFiles/gvimrc ~/.gvimrc

rm ~/.dircolors
ln -s ~/git/MyDotFiles/extras/dircolors ~/.dircolors

rm ~/.gitconfig
ln -s ~/git/MyDotFiles/gitconfig ~/.gitconfig

rm ~/.lessfilter
ln -s ~/git/MyDotFiles/zsh/lessfilter ~/.lessfilter

rm ~/.vifm
ln -s ~/git/MyDotFiles/.vifm ~/.vifm

rm ~/LESS_TERMCAP
ln -s ~/git/MyDotFiles/zsh/LESS_TERMCAP ~/

# git submodule update --init
# git submodule foreach git pull origin master
# git submodule update

ln -s ~/git/MyDotFiles/tmux.conf ~/.tmux.con
ln -s ~/git/MyDotFiles/tmux ~/.tmux
#---------------
# linux specific
#---------------

# install vim stuff
sudo apt-get install -y ctags fortune grc pal

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

apt-cyg install cowsay
apt-cyg install pal

