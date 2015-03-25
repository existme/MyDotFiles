#!/bin/zsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/dsa_id"
export HISTCONTROL=erasedups

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

source $ZSH/oh-my-zsh.sh

# Load bundles
source $SCRIPTPATH/zsh/bundle/k/k.sh
source $SCRIPTPATH/zsh/bundle/lesaint-mvn/lesaint-mvn.plugin.zsh

#export x=`which mvn`
alias k="k -h"

