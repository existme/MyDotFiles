#!/bin/zsh
echoP(){
    let counter++;
    export counter
    printf "   ${bW}%02d ${bR}- ${bY}%s ${bC}${cZ}" $counter $1
    tput hpa $(((counter%3)*35))
    [[ $((counter%3)) -eq 0 ]] && tput tbc && echo
}
echoMe() {
  # local me=`realpath --relative-to=$SCRIPTPATH $1`
  local relRepo=${SCRIPTPATH//$HOME\//}/
  local me=${1//$HOME\//'~/'}
  me=${me//'~\/'$relRepo/  }
  echoP $me
}
echoMe $0
local plugin="${bY}  ${bB}${bY} "

# **********************************************************************
# ********** Specific aliases that might be used in functions **********
# **********************************************************************
alias -g G="| grep"
alias -g H="| head"
alias -g T="| tail"
alias -g X="| xargs -I{}"
# Strip ansi codes from stream and feed it in for XS
alias -g XS="| perl -pe 's/\e\[?.*?[\@-~]//g' | xargs -I{} "
alias -g L='|& less -MNr'
alias -g LL='|& lnav'
# Pipe to vim in readonly mode and let fast exiting by pressing `q`
alias -g V="|& vim +'nnoremap q :q!<enter>' +'set tm=0' +'setf sh' -R -"
# Pipe to vim but make it ansi enabled good for colored output
alias -g VA="|& vim +'nnoremap q :q!<enter>' +'set tm=0' +'setf dts' +'AnsiEsc' -R -"
alias -g N="\"\$(\\/bin\/ls -tp | grep -v '\/$' | head -1)\""
alias -g C="|& xclip"
alias -g nul=">/dev/null 2>&1"
alias -g nerr="2> /dev/null"
# **********************************************************************

source $SCRIPTPATH/zsh/functions.sh
isSSH && stackMsg "${bG}Remote connection through ssh${cZ}"||
         stackMsg "${bW}Local connection${cZ}"
# Load OS spesific envoronments
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   export platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   export platform='mac'
fi

if [[ -f "$HOME/zshrc.local.sh" ]]; then
  OUTPUT_FILE=$(mktemp)
	source "$HOME/zshrc.local.sh" > $OUTPUT_FILE 2>&1
	echoP "${plugin}~/zshrc.local.sh${cZ}"
  OUTPUT="$(< "$OUTPUT_FILE")"
fi

# Add completion path before oh-my-zsh starts compinit
fpath=($SCRIPTPATH/zsh/completion $SCRIPTPATH/zsh/bundle/zsh-completions/src $SCRIPTPATH/zsh/functions $fpath)

export F_PATH=$SCRIPTPATH/zsh/functions         # This variable is exported to be used inside other scripts ex: ,tilix
                                                # inside script use: source ~/bin/,autoload

autoload -Uz okPrompt


if [[ $platform == 'linux' ]]; then
	source $SCRIPTPATH/zsh/linux.sh
elif [[ $platform == 'mac' ]]; then
	source $SCRIPTPATH/zsh/mac.sh
else
	source $SCRIPTPATH/zsh/win.sh
fi

[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP   # Use colors for less, man, etc.

source $SCRIPTPATH/zsh/LESS_TERMCAP             #
eval $( dircolors -b ~/.dircolors)

source $SCRIPTPATH/zsh/keyinfo.sh               # Load keyboard shortcuts

[[ -f $HOME/zshrc.local.post ]] && source $HOME/zshrc.local.post && echoP "${bB}~/zshrc.local.post${cZ}"

source $SCRIPTPATH/zsh/allpath.sh
#source $SCRIPTPATH/zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

echoP "${plugin}zsh-autosuggestions.zsh"
source $SCRIPTPATH/zsh/completion/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

echoP "${plugin}zsh-256color.plugin.zsh"
source $SCRIPTPATH/bundle/zsh-256color/zsh-256color.plugin.zsh

source $SCRIPTPATH/zsh/zaliases

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history-substring-search debian last-working-dir ubuntu colored-man-pages common-aliases fancy-ctrl-z fasd)

source $SCRIPTPATH/zsh/messages.sh

if [[ -f "$HOME/zshrc.local.sh" ]]; then
  echo
  echo "╔══════════════════════════════ ${bG}~/zshrc.local.sh${cZ} ════════════════════════════════╗"
  echo $OUTPUT | prepend "║ "
  echo "╚════════════════════════════════════════════════════════════════════════════════╝"
  rm -f "$OUTPUT_FILE"

fi