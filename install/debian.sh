$dotpath=~/git/MyDotFiles
#!/bin/sh
# Creating symbolic links
rm ~/.zshrc
ln -s $dotpath/zshrc ~/.zshrc

rm ~/.vimrc
ln -s $dotpath/vimrc ~/.vimrc

rm -r ~/.vim
ln -s $dotpath/vim ~/.vim

rm ~/.gvimrc
ln -s $dotpath/gvimrc ~/.gvimrc

rm ~/.dircolors
ln -s $dotpath/extras/dircolors ~/.dircolors

rm ~/.gitconfig
ln -s $dotpath/gitconfig ~/.gitconfig

rm ~/.lessfilter
ln -s $dotpath/zsh/lessfilter ~/.lessfilter

rm ~/.vifm
ln -s $dotpath/.vifm ~/.vifm

rm ~/LESS_TERMCAP
ln -s $dotpath/zsh/LESS_TERMCAP ~/

git submodule update --init recursive
git submodule foreach git pull origin master

ln -s $dotpath/tmux.conf ~/.tmux.con
ln -s $dotpath/tmux ~/.tmux
#---------------
# linux specific
#---------------
