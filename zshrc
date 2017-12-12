#!/bin/zsh

# Parts taken from:
#    https://github.com/cornerman/dotfiles/blob/master/zshrc

#export TERM=xterm-256color

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
#export XDG_RUNTIME_DIR=/run/user/0
export STOW_DIR="$HOME/local/stow"
export MANPATH=/usr/share/man
export LSCOLORS=ExFxCxDxBxegedabagacad
export CLICOLOR=true
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
setopt HIST_REDUCE_BLANKS
setopt complete_aliases          # don't expand aliases _before_ completion has finished

# only change term config if it is xterm
# autoload zkbd
# [[ ! -f ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]] && zkbd
# source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}

# todo: use .oh-my-zsh/lib/spectrum.zsh instead
export cZ=$(echo -en '\033[0m')				# RESET
export cR=$(echo -en '\033[00;31m')			# red
export cG=$(echo -en '\033[00;32m')			# green
export cY=$(echo -en '\033[00;33m')			# yellow
export cB=$(echo -en '\033[00;34m')			# blue
export cM=$(echo -en '\033[00;35m')			# magenta (purple)
export cP=$(echo -en '\033[00;35m')			# purple (magenta)
export cC=$(echo -en '\033[00;36m')			# cyan
export cW=$(echo -en '\033[00;37m')			# white
export bR=$(echo -en '\033[01;31m')			# bold red
export bG=$(echo -en '\033[01;32m')			# bold green
export bY=$(echo -en '\033[01;33m')			# bold yellow
export bB=$(echo -en '\033[01;34m')			# bold blue
export bM=$(echo -en '\033[01;35m')			# bold magenta
export bP=$(echo -en '\033[01;35m')			# bold purple
export bC=$(echo -en '\033[01;36m')			# bold cyan
export bW=$(echo -en '\033[01;37m')			# bold white
#  ex: echo "\$cR (${cR}red${cZ}) \$bG (${bG}bold green${cZ})"
msgRGB=${cR}R${cG}G${cY}Y${cB}B${cP}P${cC}C${cW}W${cZ}Z${bR}R${bG}G${bY}Y${bB}B${bP}P${bC}C${bW}W${cZ}
export OTERM=$TERM
# if [[ $TERM == 'linux' ]]; then
# 	export TERM=xterm-256color
# elif [[ $TERM == 'xterm' ]]; then
# 	export TERM=xterm-256color
# elif [[ $TERM == 'rxvt-unicode' ]]; then
# 	export TERM=rxvt-unicode-256color
# fi
# export TERMCAP=$(echo $termcap | sed -e 's/Co#8/Co#256/g')
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

# General Paths
export PATH=$HOME/bin:$HOME/bin/git-scripts:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="$PATH:$HOME/local/stow" # Add RVM to PATH for scripting

# automatically cd to directory when using ~
setopt auto_cd


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

# Add completion path before oh-my-zsh starts compinit
fpath=($SCRIPTPATH/zsh/completion $fpath)

plugins=(git history-substring-search debian last-working-dir ubuntu colored-man-pages common-aliases)
source $ZSH/oh-my-zsh.sh
source $SCRIPTPATH/zsh/LESS_TERMCAP
eval $( dircolors -b ~/.dircolors)
# Load bundles

# Load keyboard shortcuts
source $SCRIPTPATH/zsh/keyinfo.sh

# Load z
. $SCRIPTPATH/bundle/z/z.sh

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# Cosmetics
echo $msgRGB
echo "$(date '+%D %T')";

# The TOOLBOX variable should be set in zshrc.local.sh to something like this: 
# TOOLBOX=/Users/(uid)/Library/Application Support/JetBrains/Toolbox/apps/IDEA-U/ch-0
# or in Linux:
# TOOLBOX=/opt/JetBrains/Toolbox/apps/IDEA-U/ch-0
if [ $TOOLBOX ]; then
   echo "${bY}IDEA$cZ found"
   export IDEA_VERSION=$(ls -ltx $TOOLBOX|awk '{print $NF}')
   # IDEA_POSTIFIX should also be set in zshrc.local.sh ex:
   # IDEA_POSTIFIX=IntelliJ\ IDEA.app/Contents/MacOS/idea
   export IDEA_PATH=$TOOLBOX/$IDEA_VERSION/$IDEA_POSTIFIX
fi


if [ -f $HOME/zshrc.local.post ]; then
	source $HOME/zshrc.local.post
fi

source $SCRIPTPATH/zsh/functions.sh
source $SCRIPTPATH/zsh/compinit.sh

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey
# Bind Escape to vi-cmd-mode
bindkey "\e" vi-cmd-mode

source $SCRIPTPATH/zsh/completion/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#Other colors: man zshall search for fg=colour
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"
#source $SCRIPTPATH/zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $SCRIPTPATH/bundle/zsh-256color/zsh-256color.plugin.zsh
source $SCRIPTPATH/bundle/zaw/zaw.zsh

[[ $(command -v grc) ]] || echo "Package$bR grc$cZ is not installed:$bW sudo apt install grc$cZ"
[[ $(command -v highlight) ]] || echo "Package$bR highlight$cZ is not installed:$bW sudo apt install highlight$cZ"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source $SCRIPTPATH/zsh/zaliases
