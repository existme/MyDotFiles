$dotpath=~/git/MyDotFiles
#!/bin/sh
# Creating symbolic links
[ -e ~/.zshrc] && rm ~/.zshrc
ln -s $dotpath/zshrc ~/.zshrc

[ -e ~/.vimrc] && rm ~/.vimrc
ln -s $dotpath/vimrc ~/.vimrc

[ -e ~/.vim] && rm -r ~/.vim
ln -s $dotpath/vim ~/.vim

[ -e ~/.gvimrc] && rm ~/.gvimrc
ln -s $dotpath/gvimrc ~/.gvimrc

[ -e ~/.dircolors] && rm ~/.dircolors
ln -s $dotpath/extras/dircolors ~/.dircolors

[ -e ~/.gitconfig] && rm ~/.gitconfig
ln -s $dotpath/gitconfig ~/.gitconfig

[ -e ~/.lessfilter] && rm ~/.lessfilter
ln -s $dotpath/zsh/lessfilter ~/.lessfilter

[ -e ~/.vifm] && rm ~/.vifm
ln -s $dotpath/.vifm ~/.vifm

[ -e ~/LESS_TERMCAP] && rm ~/LESS_TERMCAP
ln -s $dotpath/zsh/LESS_TERMCAP ~/

git submodule update --init recursive
git submodule foreach git pull origin master

ln -s $dotpath/tmux.conf ~/.tmux.con
ln -s $dotpath/tmux ~/.tmux
#---------------
# linux specific
#---------------
