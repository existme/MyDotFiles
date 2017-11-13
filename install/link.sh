#!/bin/sh
DOTPATH=~/git/MyDotFiles

# Create local zhrc config
touch ~/zshrc.local.sh

rm ~/.zshrc
ln -s $DOTPATH/zshrc ~/.zshrc

rm ~/.vimrc
ln -s $DOTPATH/vimrc ~/.vimrc

rm -r ~/.vim
ln -s $DOTPATH/vim ~/.vim

rm ~/.gvimrc
ln -s $DOTPATH/gvimrc ~/.gvimrc

rm ~/.dircolors
ln -s $DOTPATH/extras/dircolors ~/.dircolors

rm ~/.gitconfig
ln -s $DOTPATH/gitconfig ~/.gitconfig

rm ~/.lessfilter
ln -s $DOTPATH/zsh/lessfilter ~/.lessfilter

rm ~/.vifm
ln -s $DOTPATH/.vifm ~/.vifm

rm ~/LESS_TERMCAP
ln -s $DOTPATH/zsh/LESS_TERMCAP ~/

rm -rf ~/bin
ln -s $DOTPATH/extras/bin ~/

rm -rf ~/.fzf.zsh
ln -s $DOTPATH/fzf.zsh ~/.fzf.zsh

touch ~/.stCommitMsg
cp $DOTPATH/gitconfig.user ~/.gitconfig.user

touch ~/zshrc.local.sh


