#!/bin/zsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/dsa_id"
export HISTCONTROL=erasedups

# only change term config if it is xterm
autoload zkbd
[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE

export OTERM=$TERM
if [[ $TERM == 'linux' ]]; then
	export TERM=xterm-256color
elif [[ $TERM == 'xterm' ]]; then
	export TERM=xterm-256color
fi
export TERMCAP=$(echo $TERMCAP | sed -e 's/Co#8/Co#256/g')
export CLICOLOR=true
export GREP_OPTIONS='--color=always'
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export PYG_STYLE=terminal				# or you can set to terminal256 if it works
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

ENABLE_CORRECTION="false"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# User configuration
COMPLETION_WAITING_DOTS="true"
DEFAULT_USER=`whoami`
user=`whoami`
HOST="local"
use_color=true
HIST_STAMPS="yyyy-mm-dd" # also: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

# General Paths
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE=~/.history

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ls="ls -GF --color"
alias	memo="cd ~/Dropbox/Memo"
alias zdoc="xdg-open /usr/share/doc/zsh/zsh.pdf >> /dev/null 2>&1"
alias cat="grc cat"
alias ds="du -hd 1"
#Find the path to this git repo
SCRIPT=$(readlink ~/.zshrc -f)
SCRIPTPATH=$(dirname "$SCRIPT")

if [[ $platform == 'linux' ]]; then
	source $SCRIPTPATH/zsh/linux.sh
elif [[ $platform == 'mac' ]]; then
	source $SCRIPTPATH/zsh/mac.sh
else
	source $SCRIPTPATH/zsh/win.sh
fi

if [ -f $HOME/zshrc.local.sh ]; then
	source $HOME/zshrc.local.sh
fi

plugins=(git history-substring-search)
source $ZSH/oh-my-zsh.sh

eval $( dircolors -b ~/.dircolors)
# Load bundles
source $SCRIPTPATH/zsh/bundle/k/k.sh
source $SCRIPTPATH/zsh/bundle/lesaint-mvn/lesaint-mvn.plugin.zsh

alias k="k -h"
# Enable vi-mode 
source $SCRIPTPATH/extras/vi-mode.sh

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" history-beginning-search-backward
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" history-beginning-search-forward
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# Fixing history search
# bindkey '\eOA' history-beginning-search-backward
# bindkey '\e[A' history-beginning-search-backward
# bindkey '\eOB' history-beginning-search-forward
# bindkey '\e[B' history-beginning-search-forward

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
