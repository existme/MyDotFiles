#!/bin/zsh
# Path to your oh-my-zsh installation.
export CDPATH=$HOME
export ZSH=$HOME/.oh-my-zsh
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export KEYTIMEOUT=1
# Uncomment the following line to enable vi mode
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/dsa_id"
export HISTCONTROL=ignoreboth:erasedups
export XDG_RUNTIME_DIR=/run/user/0
export STOW_DIR="/home/existme/local/stow"
export MANPATH=/usr/share/man
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
# autoload zkbd
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
export GREP_OPTIONS="--color=always"
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
DISABLE_UNTRACKED_FILES_DIRTY="true"
DEFAULT_USER=`whoami`
user=`whoami`
# HOST="local"
use_color=true
HIST_STAMPS="yyyy-mm-dd" # also: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

# General Paths
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/Dropbox/Docs/todo.txt-cli:$PATH
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTFILE=~/.history

function rgrep(){ grep --color=always -R -i "$1" * | less;}
function rfind(){ 
   if [[ $1 == "--help" || $# -eq 0 ]]; then
      echo "Usage: rfind readme ~/git/MyDotFiles"
      return
   fi
   find $2 -iname "*$1*"|grep -i "$1" --color=always
} 
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias zshlocal="vim ~/zshrc.local.sh"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ls="ls -GF --color"
alias zdoc="xdg-open /usr/share/doc/zsh/doc/zsh.pdf >> /dev/null 2>&1 &"
#alias cat="grc cat"
alias ds="du -hd 1| sort -h"
alias k="k -h"
alias hd="head -n 40 "
alias t='$HOME/Dropbox/Apps/todotxttdi/todo.sh -d $HOME/Dropbox/Apps/todotxttdi/todo.cfg'
alias todo="vim ~/Dropbox/Apps/todotxttdi/todo.txt"
alias jq="jq '.' "
alias ex="chmod u+x "
alias idea='. $SCRIPTPATH/extras/scripts/idea'
alias ll="ls -lSahr"
alias v="vim"
alias s="sudo"
alias dq="sudo dpkg-query --listfiles"
alias iconf="code ~config/i3/config"
# mh is a shortcut for showing help.md in this repo
# every 34 line the text should break with --- inorder to 
# be represented as a slide
alias mh="sed '0~34 s/$/\n\n---\n\n/g' $SCRIPTPATH/help.md | mdp"

# these are mappings for frequently used folder, type for example:
hash -d memo=~/Dropbox/Memo
hash -d mydotfiles=$SCRIPTPATH
hash -d vim=$SCRIPTPATH
hash -d download=~/Downloads
hash -d desktop=~/Desktop
hash -d git=~/git
hash -d bin=~/bin
hash -d sample=~/bin/sample
hash -d wiki=~/wiki
hash -d pictures=~/pictures
hash -d local=~/zshrc.local.sh

# automatically cd to directory when using ~
setopt auto_cd

# help is used for getting man page for built-in commands: 
# usage: help read
alias help=run-help

# Load OS spesific envoronments

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


plugins=(git history-substring-search debian last-working-dir ubuntu colored-man-pages common-aliases)
source $ZSH/oh-my-zsh.sh
source $SCRIPTPATH/zsh/LESS_TERMCAP
eval $( dircolors -b ~/.dircolors)
# Load bundles
source $SCRIPTPATH/zsh/bundle/k/k.sh
#source $SCRIPTPATH/zsh/bundle/lesaint-mvn/lesaint-mvn.plugin.zsh

# Load keyboard shortcuts
source $SCRIPTPATH/zsh/keyinfo.sh

# Load z
. $SCRIPTPATH/bundle/z/z.sh

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# Cosmetics
# if [ -f /usr/share/cowsay/cows/ ]; then 
# 	fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)
# elif [ -f /usr/local/share/cows/ ]; then 
# 	fortune | cowsay -f $(ls /usr/local/share/cows/ | shuf -n1)
# else
# 	fortune | cowsay -f $(ls /usr/share/cowsay/cows | shuf -n1)
# fi
#echo "$(date '+%D %T' | toilet -f term -F border --gay)";
echo "$(date '+%D %T')";
#pal

# autoload predict-on
# predict-on
CASE_SENSITIVE="false"
zstyle ':completion:*' completer _complete
bindkey '\t' expand-or-complete
compinit
cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey

# Bind Escape to vi-cmd-mode
bindkey "\e" vi-cmd-mode

export PATH="$PATH:$HOME/local/stow" # Add RVM to PATH for scripting
#Return “yes” if the repository is on an “nfs” mount
function __is_slow_storage() {
   export STAT_OPT='-L --file-system --format="%T"'
   if [ $OSTYPE == "Darwin" ]; then
      STAT_OPT='-L -f "%HT"'
   fi
   RES=$(stat `echo $STAT_OPT` `echo $1`)

   if [[ $RES == "nfs" || $RES == "cifs" ]]; then
      echo "yes"
   else
      echo "no"
   fi
}
# Fix  oh-myzsh git prompt slowness issue for some repos
function git_prompt_info() {
  local ref
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

# remove ag alias because of conflict with silver searcher
# .oh-my-zsh/plugins/ubuntu/ubuntu.plugin.zsh
unalias ag
alias ap="sudo apt-get"

# Allow zsh to expand star
unsetopt no_match
# Allow caseincensitive globing
setopt nocaseglob


alias h="history|grep"
# function hh(){
#    # var=("${(f@)$(cat)}")
#    # echo Searching history for \"$var\"
#    #history | grep  | less
#    echo !!
# }
alias -g grep='grep  --color=always --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

function y(){

   if [[ $1 == "--help" || $# -eq 0 ]]; then
      echo "Usage: y i3"
      return
   fi
   yelp man:$1 &
}
# The TOOLBOX variable should be set in zshrc.local.sh to something like this: 
# TOOLBOX=/Users/(uid)/Library/Application Support/JetBrains/Toolbox/apps/IDEA-U/ch-0
# or in Linux:
# TOOLBOX=opt/JetBrains/Toolbox/apps/IDEA-U/ch-0
export IDEA_VERSION=$(ls -ltx $TOOLBOX|awk '{print $NF}')
# IDEA_POSTIFIX should also be set in zshrc.local.sh ex:
# IDEA_POSTIFIX=IntelliJ\ IDEA.app/Contents/MacOS/idea
export IDEA_PATH=$TOOLBOX/$IDEA_VERSION/$IDEA_POSTIFIX
# additional
# alias ll=exa -la --color=always
# alias ls=exa --color=always

alias lt="ls -larh -t modified"

if [ -f $HOME/zshrc.local.post ]; then
	source $HOME/zshrc.local.post
fi

autoload -Uz promptinit
promptinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Fix default zstyle for tab completion
zstyle ':completion:*' format ''
zstyle ':completion:*' menu select auto

source $SCRIPTPATH/bundle/zsh-autosuggestion/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240,bold"

