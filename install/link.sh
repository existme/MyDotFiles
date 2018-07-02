#!/bin/bash
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

rm -rf ~/.grc
ln -s $DOTPATH/configs/grc ~/.grc

touch ~/.stCommitMsg
cp $DOTPATH/gitconfig.user ~/.gitconfig.user

# Only add NO_ZSH_THEME to zshrc.local.sh if it hasn't been added before
if [ "$(grep "NO_ZSH_THEME" ~/zshrc.local.sh|wc -c)" == "0" ]; then
   echo "${bG}adding${cZ} NO_ZSH_THEME to ~/zshrc.local.sh"
cat >> ~/zshrc.local.sh << EOF
export NO_ZSH_THEME=true
EOF
fi

# Add proxy if proxy env is present
if [ -n $http_proxy ]; then 
   # only add it once
   if [ "$(grep "http_proxy" ~/zshrc.local.sh|wc -c)" == "0" ]; then
      echo "${bG}adding${cZ} http_proxy to ~/zshrc.local.sh"
cat >> ~/zshrc.local.sh << EOF
export http_proxy="$http_proxy"
export https_proxy="$https_proxy"
EOF
   fi 
fi

