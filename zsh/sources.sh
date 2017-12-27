echoP(){
    let counter++;
    export counter
    printf "   ${bW}%02d ${bR}- ${bY}%s ${bC}${cZ}" $counter $1
    tput hpa $(((counter%3)*35))
    [[ $((counter%3)) -eq 0 ]] && tput tbc && echo
}
echoMe() {  
  local me=`realpath --relative-to=$SCRIPTPATH $1`
  echoP $me
}
local plugin="${bB}${bY} "
echoMe $0
source $SCRIPTPATH/zsh/functions.sh
# Load OS spesific envoronments
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   export platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   export platform='mac'
fi
if [[ $platform == 'linux' ]]; then
	source $SCRIPTPATH/zsh/linux.sh
elif [[ $platform == 'mac' ]]; then
	source $SCRIPTPATH/zsh/mac.sh
else
	source $SCRIPTPATH/zsh/win.sh
fi


[[ -f $HOME/zshrc.local.sh ]] &&	source $HOME/zshrc.local.sh

# Add completion path before oh-my-zsh starts compinit
fpath=($SCRIPTPATH/zsh/completion $fpath)

echoP "${plugin}oh-my-zsh.sh"
source $ZSH/oh-my-zsh.sh                        #

[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP   # Use colors for less, man, etc.

source $SCRIPTPATH/zsh/LESS_TERMCAP             #
eval $( dircolors -b ~/.dircolors) 

source $SCRIPTPATH/zsh/keyinfo.sh               # Load keyboard shortcuts

echoP "${plugin}z.sh"
. $SCRIPTPATH/bundle/z/z.sh

[[ -f $HOME/zshrc.local.post ]] && source $HOME/zshrc.local.post

source $SCRIPTPATH/zsh/allpath.sh
source $SCRIPTPATH/zsh/compinit.sh
#source $SCRIPTPATH/zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

echoP "${plugin}zsh-autosuggestions.zsh"
source $SCRIPTPATH/zsh/completion/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

echoP "${plugin}zsh-256color.plugin.zsh"
source $SCRIPTPATH/bundle/zsh-256color/zsh-256color.plugin.zsh

echoP "${plugin}zaw.zsh"
source $SCRIPTPATH/bundle/zaw/zaw.zsh

source $SCRIPTPATH/zsh/zaliases

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history-substring-search debian last-working-dir ubuntu colored-man-pages common-aliases fancy-ctrl-z)

source $SCRIPTPATH/zsh/messages.sh
