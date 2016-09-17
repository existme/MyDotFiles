#!/bin/sh
DOTPATH=~/git/MyDotFiles

# Creating symbolic links
rm ~/.zshrc > /dev/null
ln -s $DOTPATH/zshrc ~/.zshrc

rm ~/.vimrc > /dev/null
ln -s $DOTPATH/vimrc ~/.vimrc

rm -r ~/.vim > /dev/null
ln -s $DOTPATH/vim ~/.vim

rm ~/.gvimrc > /dev/null
ln -s $DOTPATH/gvimrc ~/.gvimrc

rm ~/.dircolors > /dev/null
ln -s $DOTPATH/extras/dircolors ~/.dircolors

rm ~/.gitconfig > /dev/null
ln -s $DOTPATH/gitconfig ~/.gitconfig

rm ~/.lessfilter > /dev/null
ln -s $DOTPATH/zsh/lessfilter ~/.lessfilter

rm ~/.vifm > /dev/null
ln -s $DOTPATH/.vifm ~/.vifm

rm ~/LESS_TERMCAP > /dev/null
ln -s $DOTPATH/zsh/LESS_TERMCAP ~/

git submodule update --init --recursive
git submodule foreach git pull origin master

ln -s $DOTPATH/tmux.conf ~/.tmux.con
ln -s $DOTPATH/tmux ~/.tmux
#---------------
# linux specific
#---------------
