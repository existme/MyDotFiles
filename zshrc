#!/bin/zsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/dsa_id"
export HISTCONTROL=ignoreboth:erasedups
export XDG_RUNTIME_DIR=/run/user/0
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
# only change term config if it is xterm
autoload zkbd
# [[ ! -f ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]] && zkbd
# source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}


export OTERM=$TERM
if [[ $TERM == 'linux' ]]; then
	export TERM=xterm-256color
elif [[ $TERM == 'xterm' ]]; then
	export TERM=xterm-256color
elif [[ $TERM == 'rxvt-unicode' ]]; then
	export TERM=rxvt-256color
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
# HOST="local"
use_color=true
HIST_STAMPS="yyyy-mm-dd" # also: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

# General Paths
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/Dropbox/Docs/todo.txt-cli:$PATH
export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE=~/.history
# Setup for google go
export GOROOT=$HOME/go
export GOPATH=$HOME/go/downloads
export GOARCH=amd64
export GOOS=linux
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
#alias cat="grc cat"
alias ds="du -hd 1"
alias k="k -h"
alias hd="head -n 40 "
alias t='$HOME/Dropbox/Apps/todotxttdi/todo.sh -d $HOME/Dropbox/Apps/todotxttdi/todo.cfg'
alias h="history|grep"
alias todo="vim ~/Dropbox/Apps/todotxttdi/todo.txt"
alias jq="jq '.' "
alias myvim="cd ~/git/MyVimConfig"
alias ex="chmod u+x "
alias idea='. $SCRIPTPATH/extras/scripts/idea'
function rgrep(){ grep --color=always -R -i "$1" * | less;} 
function rfind(){ find . -iname "*$1*"|grep -i "$1" --color=always} 
# A macro to see the contents of a jar or war file
function lessj(){ 
	if [[ -z $1 ]]; then
		jar tvf *.jar|pygmentize -f "terminal" -l sv -f terminal256 -s|less
	else
		jar tvf $1|pygmentize -f "terminal" -l sv -f terminal256 -s|less
	fi
}
# easy archive extraction either use extract x.tar or extract x.tar "/your/destination
function extract(){
	if [[ -z ${2+x} ]]; then
		tar xf $1;
	else
		tar xf $1 -C $2;
	fi
} 

# Find the path to this git repo
SCRIPT=$(readlink ~/.zshrc -f)
SCRIPTPATH=$(dirname "$SCRIPT")
# add scripts folder to path variable to use commands like cleanmem
export PATH=$SCRIPTPATH/extras/scripts:$PATH

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

plugins=(git history-substring-search web-search debian)

source $ZSH/oh-my-zsh.sh

eval $( dircolors -b ~/.dircolors)
# Load bundles
source $SCRIPTPATH/zsh/bundle/k/k.sh
#source $SCRIPTPATH/zsh/bundle/lesaint-mvn/lesaint-mvn.plugin.zsh

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

# Cosmetics
if [ -f /usr/share/cowsay/cows/ ]; then 
	fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)
else
	fortune | cowsay -f $(ls /usr/local/share/cows/ | shuf -n1)
fi
echo "$(date '+%D %T' | toilet -f term -F border --gay)";
pal

#autoload predict-on
#predict-on
CASE_SENSITIVE="false"
zstyle ':completion:*' completer _complete
bindkey '\t' expand-or-complete
compinit
