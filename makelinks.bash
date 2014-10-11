#!/bin/sh
rm ~/.vimrc
rm -r ~/.vim
rm ~/.gvimrc
ln -s ~/git/MyVimConfig/vimrc ~/.vimrc
ln -s ~/git/MyVimConfig/vim ~/.vim
ln -s ~/git/MyVimConfig/gvimrc ~/.gvimrc
